Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4C8BD9AB
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 10:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634072AbfIYISG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 04:18:06 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:50023 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634057AbfIYISF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 04:18:05 -0400
Received: from uno.localdomain (host71-63-dynamic.19-79-r.retail.telecomitalia.it [79.19.63.71])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 3F271100010;
        Wed, 25 Sep 2019 08:18:01 +0000 (UTC)
Date:   Wed, 25 Sep 2019 10:19:36 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v6 1/7] media: v4l2-core: Implement
 v4l2_ctrl_new_std_compound
Message-ID: <20190925081927.55j2rs22ed2evc72@uno.localdomain>
References: <20190920135137.10052-1-ricardo@ribalda.com>
 <20190920135137.10052-2-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="m3t4kcok732jv2yx"
Content-Disposition: inline
In-Reply-To: <20190920135137.10052-2-ricardo@ribalda.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--m3t4kcok732jv2yx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ricardo,

On Fri, Sep 20, 2019 at 03:51:31PM +0200, Ricardo Ribalda Delgado wrote:
> Currently compound controls do not have a simple way of initializing its
> values. This results in ofuscated code with type_ops init.
>
> This patch introduces a new field on the control with the default value
> for the compound control that can be set with the brand new
> v4l2_ctrl_new_std_compound function
>
> Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 50 ++++++++++++++++++++++++----
>  include/media/v4l2-ctrls.h           | 22 +++++++++++-
>  2 files changed, 64 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 1d8f38824631..219d8aeefa20 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -29,6 +29,8 @@
>  #define call_op(master, op) \
>  	(has_op(master, op) ? master->ops->op(master) : 0)
>
> +static const union v4l2_ctrl_ptr ptr_null;
> +
>  /* Internal temporary helper struct, one for each v4l2_ext_control */
>  struct v4l2_ctrl_helper {
>  	/* Pointer to the control reference of the master control */
> @@ -1530,7 +1532,10 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>  	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
>  	void *p = ptr.p + idx * ctrl->elem_size;
>
> -	memset(p, 0, ctrl->elem_size);
> +	if (ctrl->p_def.p)
> +		memcpy(p, ctrl->p_def.p, ctrl->elem_size);
> +	else
> +		memset(p, 0, ctrl->elem_size);
>
>  	/*
>  	 * The cast is needed to get rid of a gcc warning complaining that
> @@ -2354,7 +2359,8 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  			s64 min, s64 max, u64 step, s64 def,
>  			const u32 dims[V4L2_CTRL_MAX_DIMS], u32 elem_size,
>  			u32 flags, const char * const *qmenu,
> -			const s64 *qmenu_int, void *priv)
> +			const s64 *qmenu_int, const union v4l2_ctrl_ptr p_def,
> +			void *priv)
>  {
>  	struct v4l2_ctrl *ctrl;
>  	unsigned sz_extra;
> @@ -2460,6 +2466,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  		 is_array)
>  		sz_extra += 2 * tot_ctrl_size;
>
> +	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p)
> +		sz_extra += elem_size;
> +

I'm not sure I get how sz_extra is used in this function and what's
its purpose, just be aware that the previous if() condition already

        sz_extra += 2 * tot_ctrl_size

for compound controls.

Are you just making space for the new p_def elements ? Should't you
then use tot_cltr_size ? In patch 3 you add support for AREA which has
a single element, but could p_def in future transport multiple values?

>  	ctrl = kvzalloc(sizeof(*ctrl) + sz_extra, GFP_KERNEL);
>  	if (ctrl == NULL) {
>  		handler_set_err(hdl, -ENOMEM);
> @@ -2503,6 +2512,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
>  		ctrl->p_new.p = &ctrl->val;
>  		ctrl->p_cur.p = &ctrl->cur.val;
>  	}
> +
> +	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p) {
> +		ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
> +		memcpy(ctrl->p_def.p, p_def.p, elem_size);
> +	}
> +
>  	for (idx = 0; idx < elems; idx++) {
>  		ctrl->type_ops->init(ctrl, idx, ctrl->p_cur);
>  		ctrl->type_ops->init(ctrl, idx, ctrl->p_new);
> @@ -2554,7 +2569,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
>  			type, min, max,
>  			is_menu ? cfg->menu_skip_mask : step, def,
>  			cfg->dims, cfg->elem_size,
> -			flags, qmenu, qmenu_int, priv);
> +			flags, qmenu, qmenu_int, ptr_null, priv);
>  	if (ctrl)
>  		ctrl->is_private = cfg->is_private;
>  	return ctrl;
> @@ -2579,7 +2594,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
>  	}
>  	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
>  			     min, max, step, def, NULL, 0,
> -			     flags, NULL, NULL, NULL);
> +			     flags, NULL, NULL, ptr_null, NULL);
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_std);
>
> @@ -2612,7 +2627,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
>  	}
>  	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
>  			     0, max, mask, def, NULL, 0,
> -			     flags, qmenu, qmenu_int, NULL);
> +			     flags, qmenu, qmenu_int, ptr_null, NULL);
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
>
> @@ -2644,11 +2659,32 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
>  	}
>  	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
>  			     0, max, mask, def, NULL, 0,
> -			     flags, qmenu, NULL, NULL);
> +			     flags, qmenu, NULL, ptr_null, NULL);
>
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
>
> +/* Helper function for standard compound controls */
> +struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
> +				const struct v4l2_ctrl_ops *ops, u32 id,
> +				const union v4l2_ctrl_ptr p_def)
> +{
> +	const char *name;
> +	enum v4l2_ctrl_type type;
> +	u32 flags;
> +	s64 min, max, step, def;
> +
> +	v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, &flags);
> +	if (type < V4L2_CTRL_COMPOUND_TYPES) {
> +		handler_set_err(hdl, -EINVAL);
> +		return NULL;
> +	}
> +	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
> +			     min, max, step, def, NULL, 0,
> +			     flags, NULL, NULL, p_def, NULL);
> +}
> +EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
> +
>  /* Helper function for standard integer menu controls */
>  struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
>  			const struct v4l2_ctrl_ops *ops,
> @@ -2669,7 +2705,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
>  	}
>  	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
>  			     0, max, 0, def, NULL, 0,
> -			     flags, NULL, qmenu_int, NULL);
> +			     flags, NULL, qmenu_int, ptr_null, NULL);
>  }
>  EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
>
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 570ff4b0205a..4b356df850a1 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -200,6 +200,9 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
>   *		not freed when the control is deleted. Should this be needed
>   *		then a new internal bitfield can be added to tell the framework
>   *		to free this pointer.
> + * @p_def:	The control's default value represented via a union which
> + *		provides a standard way of accessing control types
> + *		through a pointer (for compound controls only).
>   * @p_cur:	The control's current value represented via a union which
>   *		provides a standard way of accessing control types
>   *		through a pointer.
> @@ -254,6 +257,7 @@ struct v4l2_ctrl {
>  		s32 val;
>  	} cur;
>
> +	union v4l2_ctrl_ptr p_def;
>  	union v4l2_ctrl_ptr p_new;
>  	union v4l2_ctrl_ptr p_cur;
>  };
> @@ -618,7 +622,6 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
>  struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
>  					 const struct v4l2_ctrl_ops *ops,
>  					 u32 id, u8 max, u64 mask, u8 def);
> -

This seems unrelated

>  /**
>   * v4l2_ctrl_new_std_menu_items() - Create a new standard V4L2 menu control
>   *	with driver specific menu.
> @@ -646,6 +649,23 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
>  					       u64 mask, u8 def,
>  					       const char * const *qmenu);
>
> +/**
> + * v4l2_ctrl_new_std_compound() - Allocate and initialize a new standard V4L2
> + *      compound control.
> + *
> + * @hdl:       The control handler.
> + * @ops:       The control ops.
> + * @id:                The control ID.
> + * @p_def:     The control's p_def value.

Nit:
s/p_def value/default value/ ?


Thanks
   j

> + *
> + * Sames as v4l2_ctrl_new_std(), but with support to compound controls, thanks
> + * to the @p_def field.
> + *
> + */
> +struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
> +				const struct v4l2_ctrl_ops *ops, u32 id,
> +				const union v4l2_ctrl_ptr p_def);
> +
>  /**
>   * v4l2_ctrl_new_int_menu() - Create a new standard V4L2 integer menu control.
>   *
> --
> 2.23.0
>

--m3t4kcok732jv2yx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2LIxgACgkQcjQGjxah
VjyC3RAAxJ9JX2KvbUds6CRBBt55lWbvERweImPmoZUauY7umBGlAXLEON7k6qkL
CeBDqOGgdadbrtXKpzDIy4JTxoTYiFJDaZ2sXHczpd+7VUOoP/mmTMvWcux36aik
+KLabElepg/uejT48RAyCbq5G4z7FO7+yVlqE+qyaeQlm+sZj51gecgKBX7DT2ZM
Je8yapWFZIv3+Cs8Vgj0CDsmPXPY+Tdh823uB1bXVyeqmaGB9refe8w6IQA5WKhe
nlZ2b3gCOfb5wu9XIuHW1K6y4GTWDmT1UbNAajkOPuYqnWtjoO1BFMZwPorw3xv3
CiAvS2kk3Q4AFqoDHkDGLWctanIB9UL/B1/equD308zHOUcI2VDR8wA9h0wXJ8eH
uB5FcL1TasbEbeoWfZZvi21Xgn0YiA+RGjSA6h0Vd2KALi1SOmw7Q5H+Ljk0YFtP
GepJ9B7RonihdPcdoMvjS7ZH5yNLIA+s9aU6WRT2H8e5NSWZM58R3JEnTtVjjgXm
RDBih2yO5+tMyR+vfDtGAK4hVSHYqWISZtHVQy6UzYSB+Nwn9+s0HxcSnO2My4Cz
LDyLgYBTAGulS2mQhmXncws5vynxNKEyNGjg04BikWrV74i+S5V/ZfPYQSDGuvEg
LxI0sUYr6hrxigUiAFk8hrpRNI51mYACBsvOOB8nnWbNuLNULxU=
=Gsga
-----END PGP SIGNATURE-----

--m3t4kcok732jv2yx--
