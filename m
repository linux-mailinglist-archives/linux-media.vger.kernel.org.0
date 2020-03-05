Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD81D17A71D
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2020 15:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgCEOF3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Mar 2020 09:05:29 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:52659 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbgCEOF3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Mar 2020 09:05:29 -0500
X-Originating-IP: 90.89.41.158
Received: from aptenodytes (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id BD82260009;
        Thu,  5 Mar 2020 14:05:26 +0000 (UTC)
Date:   Thu, 5 Mar 2020 15:05:26 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: Re: [PATCH 2/2] v4l2-ctrls: add __v4l2_ctrl_s_ctrl_compound()
Message-ID: <20200305140526.GA172958@aptenodytes>
References: <20200303110200.2571176-1-hverkuil-cisco@xs4all.nl>
 <20200303110200.2571176-3-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <20200303110200.2571176-3-hverkuil-cisco@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue 03 Mar 20, 12:02, Hans Verkuil wrote:
> Rather than creating new compound control helpers for each new
> type, create one generic function and just create defines on
> top.

Thanks for the patch, works fine here!

Tested-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 10 +++---
>  include/media/v4l2-ctrls.h           | 49 ++++++++++++++++------------
>  2 files changed, 34 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-co=
re/v4l2-ctrls.c
> index d3bacf6b59d6..68684fcbdc61 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -4248,18 +4248,18 @@ int __v4l2_ctrl_s_ctrl_string(struct v4l2_ctrl *c=
trl, const char *s)
>  }
>  EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_string);
> =20
> -int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
> -			    const struct v4l2_area *area)
> +int __v4l2_ctrl_s_ctrl_compound(struct v4l2_ctrl *ctrl,
> +				enum v4l2_ctrl_type type, const void *p)
>  {
>  	lockdep_assert_held(ctrl->handler->lock);
> =20
>  	/* It's a driver bug if this happens. */
> -	if (WARN_ON(ctrl->type !=3D V4L2_CTRL_TYPE_AREA))
> +	if (WARN_ON(ctrl->type !=3D type))
>  		return -EINVAL;
> -	*ctrl->p_new.p_area =3D *area;
> +	memcpy(ctrl->p_new.p, p, ctrl->elems * ctrl->elem_size);
>  	return set_ctrl(NULL, ctrl, 0);
>  }
> -EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_area);
> +EXPORT_SYMBOL(__v4l2_ctrl_s_ctrl_compound);
> =20
>  void v4l2_ctrl_request_complete(struct media_request *req,
>  				struct v4l2_ctrl_handler *main_hdl)
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 7db9e719a583..75a8daacb4c4 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -1113,45 +1113,54 @@ static inline int v4l2_ctrl_s_ctrl_string(struct =
v4l2_ctrl *ctrl, const char *s)
>  }
> =20
>  /**
> - * __v4l2_ctrl_s_ctrl_area() - Unlocked variant of v4l2_ctrl_s_ctrl_area=
().
> + * __v4l2_ctrl_s_ctrl_compound() - Unlocked variant to set a compound co=
ntrol
>   *
> - * @ctrl:	The control.
> - * @area:	The new area.
> + * @ctrl: The control.
> + * @type: The type of the data.
> + * @p:    The new compound payload.
>   *
> - * This sets the control's new area safely by going through the control
> - * framework. This function assumes the control's handler is already loc=
ked,
> - * allowing it to be used from within the &v4l2_ctrl_ops functions.
> + * This sets the control's new compound payload safely by going through =
the
> + * control framework. This function assumes the control's handler is alr=
eady
> + * locked, allowing it to be used from within the &v4l2_ctrl_ops functio=
ns.
>   *
> - * This function is for area type controls only.
> + * This function is for compound type controls only.
>   */
> -int __v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
> -			    const struct v4l2_area *area);
> +int __v4l2_ctrl_s_ctrl_compound(struct v4l2_ctrl *ctrl,
> +				enum v4l2_ctrl_type type, const void *p);
> =20
>  /**
> - * v4l2_ctrl_s_ctrl_area() - Helper function to set a control's area val=
ue
> - *	 from within a driver.
> + * v4l2_ctrl_s_ctrl_compound() - Helper function to set a compound contr=
ol
> + *	from within a driver.
>   *
> - * @ctrl:	The control.
> - * @area:	The new area.
> + * @ctrl: The control.
> + * @type: The type of the data.
> + * @p:    The new compound payload.
>   *
> - * This sets the control's new area safely by going through the control
> - * framework. This function will lock the control's handler, so it canno=
t be
> - * used from within the &v4l2_ctrl_ops functions.
> + * This sets the control's new compound payload safely by going through =
the
> + * control framework. This function will lock the control's handler, so =
it
> + * cannot be used from within the &v4l2_ctrl_ops functions.
>   *
> - * This function is for area type controls only.
> + * This function is for compound type controls only.
>   */
> -static inline int v4l2_ctrl_s_ctrl_area(struct v4l2_ctrl *ctrl,
> -					const struct v4l2_area *area)
> +static inline int v4l2_ctrl_s_ctrl_compound(struct v4l2_ctrl *ctrl,
> +					    enum v4l2_ctrl_type type,
> +					    const void *p)
>  {
>  	int rval;
> =20
>  	v4l2_ctrl_lock(ctrl);
> -	rval =3D __v4l2_ctrl_s_ctrl_area(ctrl, area);
> +	rval =3D __v4l2_ctrl_s_ctrl_compound(ctrl, type, p);
>  	v4l2_ctrl_unlock(ctrl);
> =20
>  	return rval;
>  }
> =20
> +/* Helper defines for area type controls */
> +#define __v4l2_ctrl_s_ctrl_area(ctrl, area) \
> +	__v4l2_ctrl_s_ctrl_compound((ctrl), V4L2_CTRL_TYPE_AREA, (area))
> +#define v4l2_ctrl_s_ctrl_area(ctrl, area) \
> +	v4l2_ctrl_s_ctrl_compound((ctrl), V4L2_CTRL_TYPE_AREA, (area))
> +
>  /* Internal helper functions that deal with control events. */
>  extern const struct v4l2_subscribed_event_ops v4l2_ctrl_sub_ev_ops;
> =20
> --=20
> 2.25.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl5hByUACgkQ3cLmz3+f
v9GeQwgAntWTuZmGXPr6en3+i16UtrCjvNtideqrAyFDehrAIiXsyhEV/NkqaK7H
2OJl4Jw6c33/XXONXaFuPODEs6xuRZ6uqorNYijgsawHTw3udkaf75rSCjfF94dZ
RpFiK8WQRSD57rvE2kO7+fZjXUeGSWHE3t5YDnVHuAop1KObGzk+/QgV1KEs+Km8
B9WCiJxZCLF7KjBxE3hJN5duKHbAb3S0lJ8su65BdWwDeNd18onIEwh2mHG44kb4
cHnQWn3HrAlBISp2E4KxuPhihBYE6dJODCuP9JlhNGsgyP7o90xUjXGFcyiKV43a
ToVVjs8pH1b43JqletV2RcWOmLdV8w==
=LTc3
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
