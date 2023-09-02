

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';


class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
     FavoriteMealNotifier() : super([]);
     bool toogleMealFavoriteStatus(Meal meal) {
      final mealsIsFavorite = state.contains(meal);
      if(mealsIsFavorite){
        state = state.where((m) => m.id != meal.id).toList();
        return false;
      }else{
        state = [...state,meal];
        return true;
      }

     }
}

final favoriteMealProvider = StateNotifierProvider<FavoriteMealNotifier, List<Meal>>((ref) {
    return FavoriteMealNotifier();
});