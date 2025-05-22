Return-Path: <linux-media+bounces-33172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3EAAC113D
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 18:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48B1CA41E1D
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC58729B788;
	Thu, 22 May 2025 16:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ABbthzuj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A482512EC;
	Thu, 22 May 2025 16:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747931773; cv=none; b=PV+Q7yNhojbtsPWI9SGkl09X1H5nvHCcxbpnsPoULPE7Lx/ve0VhVSv2twcZqyh6m0T33k6h4xecIlfibAhr8S2YlgwvoEPT10hTaY7T4SP4SSAYU18enwKlldidKdFNK7I0yQZilOzIC0/BOIehIA35yC3eEDvpPkFBcbnkgSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747931773; c=relaxed/simple;
	bh=e/dY7hVvUvxFqhsv+uCthhl5k8jAKZkmyu34xZcskLs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=iiTDc+iRB5VOFmqwpObxeYyIGqpRaEVrFUGets+q6S/kK8RRuChTv9DTlBtBQd2dwFYQ994o07D3yTSLMYnKxD6XsbX33AWeGzK9zke7wnpQgq+xeARXsdEXIWClb48XiIvvA1J83ibFBvPItB/1eyleSgGS+aimLboJVnwQTNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ABbthzuj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:30c3:8bbb:632f:b0c9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AE1A605;
	Thu, 22 May 2025 18:35:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747931747;
	bh=e/dY7hVvUvxFqhsv+uCthhl5k8jAKZkmyu34xZcskLs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ABbthzujCQ5/G+ax17aBOQ0EnO+PmqEDb1RxOt+TtTiu5omi4Qth3Jn0X3ciJw/8L
	 Rd++kJhnJmaMW6pxaWuupbRSgwYA6cAxCOvZm97vHX63jfvwnh/hZhKsF1ln896jVj
	 maK12AOUaRNrJ2d7FG7sGGpTctUyMHkR5mvmqOAM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250522155641.GU12514@pendragon.ideasonboard.com>
References: <20250522150944.400046-2-stefan.klug@ideasonboard.com> <20250522150944.400046-4-stefan.klug@ideasonboard.com> <20250522155641.GU12514@pendragon.ideasonboard.com>
Subject: Re: [PATCH 2/3] media: rkisp1: Add RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Hans Verkuil <hans@jjverkuil.nl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 22 May 2025 18:36:06 +0200
Message-ID: <174793176608.244022.1396416000017796106@localhost>
User-Agent: alot/0.12.dev16+g501a9541e2e6.d20250519

Hi Laurent,

Thank you for the review.

Quoting Laurent Pinchart (2025-05-22 17:56:41)
> Hi Stefan,
>=20
> Thank you for the patch.
>=20
> On Thu, May 22, 2025 at 05:08:39PM +0200, Stefan Klug wrote:
> > Add a RKISP1_CID_SUPPORTED_PARAMS_BLOCKS V4L2 control to be able to
> > query the parameters blocks supported by the current kernel on the
> > current hardware from user space.
> >=20
> > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 +
> >  .../platform/rockchip/rkisp1/rkisp1-params.c  | 50 ++++++++++++++++++-
> >  include/uapi/linux/rkisp1-config.h            | 10 ++++
> >  include/uapi/linux/v4l2-controls.h            |  6 +++
> >  4 files changed, 67 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/d=
rivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index ca952fd0829b..5f187f9efc7b 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -415,6 +415,8 @@ struct rkisp1_params {
> >       spinlock_t config_lock; /* locks the buffers list 'params' */
> >       struct list_head params;
> > =20
> > +     struct v4l2_ctrl_handler ctrls;
> > +
> >       const struct v4l2_meta_format *metafmt;
> > =20
> >       enum v4l2_quantization quantization;
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/d=
rivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index 918eb06c7465..60c9b3c46593 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -2736,6 +2736,45 @@ static int rkisp1_params_init_vb2_queue(struct v=
b2_queue *q,
> >       return vb2_queue_init(q);
> >  }
> > =20
> > +static int rkisp1_ctrl_init(struct rkisp1_params *params)
> > +{
> > +     int ret;
> > +
> > +     v4l2_ctrl_handler_init(&params->ctrls, 1);
> > +
> > +     struct v4l2_ctrl_config ctrl_config =3D {
> > +             .id =3D RKISP1_CID_SUPPORTED_PARAMS_BLOCKS,
> > +             .name =3D "Supported Params Blocks",
> > +             .type =3D V4L2_CTRL_TYPE_BITMASK,
> > +             .flags =3D V4L2_CTRL_FLAG_READ_ONLY,
> > +     };
>=20
>         struct v4l2_ctrl_config ctrl_config =3D {
>                 .id =3D RKISP1_CID_SUPPORTED_PARAMS_BLOCKS,
>                 .name =3D "Supported Params Blocks",
>                 .type =3D V4L2_CTRL_TYPE_BITMASK,
>                 .flags =3D V4L2_CTRL_FLAG_READ_ONLY,
>         };
>         int ret;
>=20
>         v4l2_ctrl_handler_init(&params->ctrls, 1);
>=20
> Mixing code and variable declarations is still usually frown upon in the
> kernel.

I thought frown upon is not a no. And as this structure is not yet
complete and is modified afterwards it feels natural to me to put it
close to that place. But I can move it above the function. You decide.

>=20
> > +
> > +     for (unsigned int i =3D 0; i < ARRAY_SIZE(rkisp1_ext_params_handl=
ers); i++) {
> > +             const struct rkisp1_ext_params_handler *block_handler;
> > +
> > +             block_handler =3D &rkisp1_ext_params_handlers[i];
> > +             ctrl_config.max |=3D BIT(i);
> > +
> > +             if ((params->rkisp1->info->features & block_handler->feat=
ures) !=3D
> > +                 block_handler->features)
> > +                     continue;
> > +
> > +             ctrl_config.def |=3D BIT(i);
> > +     }
> > +
> > +     v4l2_ctrl_new_custom(&params->ctrls, &ctrl_config, NULL);
> > +
> > +     params->vnode.vdev.ctrl_handler =3D &params->ctrls;
> > +
> > +     if (params->ctrls.error) {
> > +             ret =3D params->ctrls.error;
> > +             v4l2_ctrl_handler_free(&params->ctrls);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  int rkisp1_params_register(struct rkisp1_device *rkisp1)
> >  {
> >       struct rkisp1_params *params =3D &rkisp1->params;
> > @@ -2776,10 +2815,16 @@ int rkisp1_params_register(struct rkisp1_device=
 *rkisp1)
> > =20
> >       video_set_drvdata(vdev, params);
> > =20
> > +     ret =3D rkisp1_ctrl_init(params);
> > +     if (ret) {
> > +             dev_err(rkisp1->dev, "Control initialization error %d\n",=
 ret);
> > +             goto err_mutex;
> > +     }
> > +
> >       node->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> >       ret =3D media_entity_pads_init(&vdev->entity, 1, &node->pad);
> >       if (ret)
> > -             goto err_mutex;
> > +             goto err_ctrl;
> > =20
> >       ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> >       if (ret) {
> > @@ -2792,6 +2837,8 @@ int rkisp1_params_register(struct rkisp1_device *=
rkisp1)
> > =20
> >  err_media:
> >       media_entity_cleanup(&vdev->entity);
> > +err_ctrl:
> > +     v4l2_ctrl_handler_free(&params->ctrls);
> >  err_mutex:
> >       mutex_destroy(&node->vlock);
> >       return ret;
> > @@ -2808,5 +2855,6 @@ void rkisp1_params_unregister(struct rkisp1_devic=
e *rkisp1)
> > =20
> >       vb2_video_unregister_device(vdev);
> >       media_entity_cleanup(&vdev->entity);
> > +     v4l2_ctrl_handler_free(&params->ctrls);
> >       mutex_destroy(&node->vlock);
> >  }
> > diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rk=
isp1-config.h
> > index 2d995f3c1ca3..4fc8f221d0c4 100644
> > --- a/include/uapi/linux/rkisp1-config.h
> > +++ b/include/uapi/linux/rkisp1-config.h
> > @@ -1086,6 +1086,9 @@ enum rkisp1_ext_params_block_type {
> >  #define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE   (1U << 0)
> >  #define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE    (1U << 1)
> > =20
> > +/* A bitmask of parameters blocks supported on the current hardware. */
> > +#define RKISP1_CID_SUPPORTED_PARAMS_BLOCKS   (V4L2_CID_USER_RKISP1_BAS=
E + 0x01)
> > +
> >  /**
> >   * struct rkisp1_ext_params_block_header - RkISP1 extensible parameter=
s block
> >   *                                      header
> > @@ -1520,6 +1523,13 @@ enum rksip1_ext_param_buffer_version {
> >   * V4L2 control. If such control is not available, userspace should as=
sume only
> >   * RKISP1_EXT_PARAM_BUFFER_V1 is supported by the driver.
> >   *
> > + * The read-only V4L2 control ``RKISP1_CID_SUPPORTED_PARAMS_BLOCKS`` c=
an be used
> > + * to query the blocks supported by the current hardware. It contains =
a bitmask
>=20
> s/current hardware/device/
>=20
> > + * where each bit represents the availability of the corresponding ent=
ry
> > + * from the :c:type:`rkisp1_ext_params_block_type` enum. The max value=
 of the
> > + * control represents the blocks supported by the current kernel (inde=
pendent of
> > + * the current hardware).
>=20
>  * from the :c:type:`rkisp1_ext_params_block_type` enum. The current and =
default
>  * values of the control represents the blocks supported by the device in=
stance,
>  * while the maximum value represents the blocks supported by the kernel =
driver,
>  * independently of the device instance.
>=20
> I was going to say that the control should be documented in
> Documentation/userspace-api/drivers/rkisp1.rst, but rkisp1-config.h is
> pulled in the documentation tree by
> Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst, so I'm OK with
> this. Hans, Mauro, are you fine as well with documenting the control
> here ?

Looking at the docs, I realized that most people will read the already
existing docs. So creating a completely new file just for the single
control didn't feel good. As you like.

Regards,
Stefan

>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> > + *
> >   * For each ISP block that userspace wants to configure, a block-speci=
fic
> >   * structure is appended to the @data buffer, one after the other with=
out gaps
> >   * in between nor overlaps. Userspace shall populate the @data_size fi=
eld with
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-controls.h
> > index 72e32814ea83..f836512e9deb 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -222,6 +222,12 @@ enum v4l2_colorfx {
> >   */
> >  #define V4L2_CID_USER_UVC_BASE                       (V4L2_CID_USER_BA=
SE + 0x11e0)
> > =20
> > +/*
> > + * The base for Rockchip ISP1 driver controls.
> > + * We reserve 16 controls for this driver.
> > + */
> > +#define V4L2_CID_USER_RKISP1_BASE            (V4L2_CID_USER_BASE + 0x1=
220)
> > +
> >  /* MPEG-class control IDs */
> >  /* The MPEG controls are applicable to all codec controls
> >   * and the 'MPEG' part of the define is historical */
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart
>

