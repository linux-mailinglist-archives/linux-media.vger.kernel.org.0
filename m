Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7026469A6DC
	for <lists+linux-media@lfdr.de>; Fri, 17 Feb 2023 09:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjBQI0L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Feb 2023 03:26:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjBQI0J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Feb 2023 03:26:09 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0DCA1BACE
        for <linux-media@vger.kernel.org>; Fri, 17 Feb 2023 00:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676622365; x=1708158365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8TR/UtLCbhxT9RUeW4SLuXvCl1KqvsJSmDpL0khQ52g=;
  b=WuWVXkfaFd8ZRt2dIFxxG6slLelyXQoeW399eXUi7rdTqriDuHeQsL68
   DT9iFCeXSC0lA47vgBO7m+w5tSUR/zQN2t+dhXXqswDNZ5NH+OrXf1qod
   s2VUFcSGkEKwQCXnib8vTBKSCXNz29P/gU+MwDuNjbRPO94lvW8Xm/s8S
   UI+t0nyhHKTMdS5HWjheBHTJ3PRqVaSq/eVwtawYvnDvCG3VZ/ghWlJIC
   9vy8Svj9lZwNqIyuoSW+qZdQdAwWjLvt41itJH7sy6eyck20P+aQyj+6j
   v5YmkocjuERDkKKz5Le1DrLX4WW1b5euz4qJr4/B1/ol18cTRpm150ACV
   w==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; 
   d="scan'208";a="29148745"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 17 Feb 2023 09:26:03 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 17 Feb 2023 09:26:03 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 17 Feb 2023 09:26:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676622363; x=1708158363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8TR/UtLCbhxT9RUeW4SLuXvCl1KqvsJSmDpL0khQ52g=;
  b=f9kC1wqHJSsy5knB51LUn3AxvRV7dq6mQY3PG30tSUYe7dLvwrngxvDf
   TWZwA5YgaHk6so/ocEYKh8yQ9TsEGnOr5LLyZbUU3AOVeEqhuom59N/Ei
   EK+qFZ1Pk7SzMhf48qxYJgUd10eqXWpXwA+h1kVP7CAr0In/u7pjTs5MB
   zgZJauiqjPnRsRINrOV0w/JovbKZUgNjnsGhXwNLBPPcXnmOB64n9X55H
   P2F/E86fkj52Wks63GS+7xK7BLEgoWXdEPbt9UOKhDxDXFkSjARFSShIu
   xEVuEWP/AdcqfkyjJxvGOs4G7jnTzAcLqEy9e91XKpoqWY936DLgpyapu
   w==;
X-IronPort-AV: E=Sophos;i="5.97,304,1669071600"; 
   d="scan'208";a="29148744"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Feb 2023 09:26:03 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E7E04280056;
        Fri, 17 Feb 2023 09:26:02 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 10/15] media: i2c: imx290: Convert V4L2_CID_VBLANK to read/write
Date:   Fri, 17 Feb 2023 09:26:00 +0100
Message-ID: <8184512.T7Z3S40VBb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230215223003.30170-11-laurent.pinchart@ideasonboard.com>
References: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com> <20230215223003.30170-11-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

thanks for putting these series together.

Am Mittwoch, 15. Februar 2023, 23:29:58 CET schrieb Laurent Pinchart:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>=20
> The driver exposed V4L2_CID_VBLANK as a read only control to allow
> for exposure calculations and determination of the frame rate.
>=20
> Convert to a read/write control so that the frame rate can be
> controlled.
> V4L2_CID_VBLANK also sets the limits for the exposure control,
> therefore exposure ranges have to be updated when vblank changes
> (either via s_ctrl, or via changing mode).
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 58 +++++++++++++++++++++++++++++++-------
>  1 file changed, 48 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index f82fb05b6695..1ae01cd43efb 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -46,6 +46,7 @@
>  #define IMX290_BLKLEVEL				=09
IMX290_REG_16BIT(0x300a)
>  #define IMX290_GAIN				=09
IMX290_REG_8BIT(0x3014)
>  #define IMX290_VMAX				=09
IMX290_REG_24BIT(0x3018)
> +#define IMX290_VMAX_MAX					0x3ffff
>  #define IMX290_HMAX				=09
IMX290_REG_16BIT(0x301c)
>  #define IMX290_HMAX_MAX					0xffff
>  #define IMX290_SHS1				=09
IMX290_REG_24BIT(0x3020)
> @@ -106,6 +107,9 @@
>  #define IMX290_PGCTRL_THRU				BIT(1)
>  #define IMX290_PGCTRL_MODE(n)				((n) <<=20
4)
>=20
> +/* Number of lines by which exposure must be less than VMAX) */

I guess the ')' is a leftover. Despite that:
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Best regards,
Alexander

> +#define IMX290_EXPOSURE_OFFSET				2
> +
>  #define IMX290_VMAX_DEFAULT				1125
>=20
>  #define IMX290_PIXEL_RATE				148500000
> @@ -222,6 +226,7 @@ struct imx290 {
>  	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *hblank;
>  	struct v4l2_ctrl *vblank;
> +	struct v4l2_ctrl *exposure;
>  };
>=20
>  static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
> @@ -235,7 +240,6 @@ static inline struct imx290 *to_imx290(struct
> v4l2_subdev *_sd)
>=20
>  static const struct imx290_regval imx290_global_init_settings[] =3D {
>  	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
> -	{ IMX290_VMAX, IMX290_VMAX_DEFAULT },
>  	{ IMX290_EXTCK_FREQ, 0x2520 },
>  	{ IMX290_WINWV_OB, 12 },
>  	{ IMX290_WINPH, 0 },
> @@ -659,6 +663,16 @@ static int imx290_setup_format(struct imx290 *imx290,
>  /*
> -------------------------------------------------------------------------=
=2D-
> - * Controls
>   */
> +static void imx290_exposure_update(struct imx290 *imx290,
> +				   const struct imx290_mode *mode)
> +{
> +	unsigned int exposure_max;
> +
> +	exposure_max =3D imx290->vblank->val + mode->height -
> +		       IMX290_EXPOSURE_OFFSET;
> +	__v4l2_ctrl_modify_range(imx290->exposure, 1, exposure_max, 1,
> +				 exposure_max);
> +}
>=20
>  static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
> @@ -666,7 +680,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  					     struct imx290, ctrls);
>  	const struct v4l2_mbus_framefmt *format;
>  	struct v4l2_subdev_state *state;
> -	int ret =3D 0;
> +	int ret =3D 0, vmax;
>=20
>  	/*
>  	 * Return immediately for controls that don't need to be applied to=20
the
> @@ -675,6 +689,11 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  	if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
>  		return 0;
>=20
> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +		/* Changing vblank changes the allowed range for exposure.=20
*/
> +		imx290_exposure_update(imx290, imx290->current_mode);
> +	}
> +
>  	/* V4L2 controls values will be applied only when power is already=20
up */
>  	if (!pm_runtime_get_if_in_use(imx290->dev))
>  		return 0;
> @@ -687,9 +706,23 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  		ret =3D imx290_write(imx290, IMX290_GAIN, ctrl->val, NULL);
>  		break;
>=20
> +	case V4L2_CID_VBLANK:
> +		ret =3D imx290_write(imx290, IMX290_VMAX,
> +				   ctrl->val + imx290->current_mode-
>height,
> +				   NULL);
> +		/*
> +		 * Due to the way that exposure is programmed in this=20
sensor in
> +		 * relation to VMAX, we have to reprogramme it whenever=20
VMAX is
> +		 * changed.
> +		 * Update ctrl so that the V4L2_CID_EXPOSURE case can=20
refer to
> +		 * it.
> +		 */
> +		ctrl =3D imx290->exposure;
> +		fallthrough;
>  	case V4L2_CID_EXPOSURE:
> +		vmax =3D imx290->vblank->val + imx290->current_mode->height;
>  		ret =3D imx290_write(imx290, IMX290_SHS1,
> -				   IMX290_VMAX_DEFAULT - ctrl->val -=20
1, NULL);
> +				   vmax - ctrl->val - 1, NULL);
>  		break;
>=20
>  	case V4L2_CID_TEST_PATTERN:
> @@ -746,13 +779,15 @@ static void imx290_ctrl_update(struct imx290 *imx29=
0,
>  {
>  	unsigned int hblank_min =3D mode->hmax_min - mode->width;
>  	unsigned int hblank_max =3D IMX290_HMAX_MAX - mode->width;
> -	unsigned int vblank =3D IMX290_VMAX_DEFAULT - mode->height;
> +	unsigned int vblank_min =3D IMX290_VMAX_DEFAULT - mode->height;
> +	unsigned int vblank_max =3D IMX290_VMAX_MAX - mode->height;
>=20
>  	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
>=20
>  	__v4l2_ctrl_modify_range(imx290->hblank, hblank_min, hblank_max, 1,
>  				 hblank_min);
> -	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
> +	__v4l2_ctrl_modify_range(imx290->vblank, vblank_min, vblank_max, 1,
> +				 vblank_min);
>  }
>=20
>  static int imx290_ctrl_init(struct imx290 *imx290)
> @@ -782,9 +817,13 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>  			  V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
>=20
> -	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2,=20
1,
> -			  IMX290_VMAX_DEFAULT - 2);
> +	/*
> +	 * Correct range will be determined through imx290_ctrl_update=20
setting
> +	 * V4L2_CID_VBLANK.
> +	 */
> +	imx290->exposure =3D v4l2_ctrl_new_std(&imx290->ctrls,=20
&imx290_ctrl_ops,
> +					     V4L2_CID_EXPOSURE, 1,=20
65535, 1,
> +					     65535);
>=20
>  	/*
>  	 * Set the link frequency, pixel rate, horizontal blanking and=20
vertical
> @@ -816,8 +855,6 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>=20
>  	imx290->vblank =3D v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>  					   V4L2_CID_VBLANK, 1, 1, 1,=20
1);
> -	if (imx290->vblank)
> -		imx290->vblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
>=20
>  	v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
>  					&props);
> @@ -1003,6 +1040,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
>  		imx290->current_mode =3D mode;
>=20
>  		imx290_ctrl_update(imx290, &fmt->format, mode);
> +		imx290_exposure_update(imx290, mode);
>  	}
>=20
>  	*format =3D fmt->format;


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


