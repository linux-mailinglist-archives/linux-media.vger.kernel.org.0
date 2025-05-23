Return-Path: <linux-media+bounces-33250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5625AC2157
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 12:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EF2EA431A2
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 10:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E7D229B15;
	Fri, 23 May 2025 10:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ISij9Uw6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A760189919;
	Fri, 23 May 2025 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997087; cv=none; b=ZgQUJlqWDfPum8NVoYqbNuRO8mgXosDZwVc1kTnUw1q7JOC6K5PH+VJUL0NUytBBQndYjm2Q0RByhLX0chBHFSXOuY1uUrKvdJUZsb/T2BNVPuR4rGq0JfCdIYu70P5Qpt4xDwsT9tac7SAabaCQdVpjpiQ7cKTZqjyLLnfbhJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997087; c=relaxed/simple;
	bh=/eZ3ilnoLPrGEK9DLZJbW8cSvCZAcd9j5LvbllAAhY8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=hK46beg7fY36iBhGwoz08Whi2XF6WceDPdMU76UKYt2rRa+Kbt1HFW4O0kcdgfoPYSrcZvfiO2L2Mu9zPpDC1CUThg1YzAYXBvt+rbRS6OKiRW66Yem0E0H+rKspr3LiVzEcBerGsB3UlIBdYebVWoMmWu5gLVw63NeZiJS0hHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ISij9Uw6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:a882:21a2:2327:ac4f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE214346;
	Fri, 23 May 2025 12:44:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747997060;
	bh=/eZ3ilnoLPrGEK9DLZJbW8cSvCZAcd9j5LvbllAAhY8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ISij9Uw6/cNxDVuSFh0+r8gzTMNWBTFXwV2qQKyoWC7HRzJSkWvXPU9oRu4pIQp6D
	 CzLrCWNt/yG9m4+osFGgeqhd7uz2Ac0gCFEE7ZUqBA8Eu+twKCgKky3jmTJTybUSZd
	 XD03LEDCh8JjllDfd/ZKOFE4ku+vFXTvAXqlVR+U=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250523103346.GC12514@pendragon.ideasonboard.com>
References: <20250523-supported-params-and-wdr-v2-0-5a88dca5f420@ideasonboard.com> <20250523-supported-params-and-wdr-v2-1-5a88dca5f420@ideasonboard.com> <20250523103346.GC12514@pendragon.ideasonboard.com>
Subject: Re: [PATCH v2 1/2] media: rkisp1: Add RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Fri, 23 May 2025 12:44:40 +0200
Message-ID: <174799708047.447283.7488479214082467414@localhost>
User-Agent: alot/0.12.dev16+g501a9541e2e6.d20250519

Hi Laurent,

Thank you for the review.

Quoting Laurent Pinchart (2025-05-23 12:33:46)
> Hi Stefan,
>=20
> Thank you for the patch.
>=20
> On Fri, May 23, 2025 at 12:07:31PM +0200, Stefan Klug wrote:
> > Add a RKISP1_CID_SUPPORTED_PARAMS_BLOCKS V4L2 control to be able to
> > query the parameters blocks supported by the current kernel on the
> > current hardware from user space.
> >=20
> > As a drive-by fix handle an (very unlikely) error in
> > rkisp1_params_init_vb2_queue().
>=20
> "While at it" changes are fine for very minor changes, but this is a fix
> (even if it fixes a minor issue), so it should be a separate patch.

Dang. It was so small that I even considered completely dropping it.
I'll wait a bit for further feedback and then post a v3 with the patch
split out again.

>=20
> > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> >=20
> > ---
> >=20
> > Changes in v2:
> > - Added docs improvements from review
> > - Moved ctrl_config declaration to top
> > - Moved rkisp1_params_init_vb2_queue() return check into this patch as
> >   the previous patch got dropped
> > - Call rkisp1_ctrl_init() after media_entity_pads_init() for easier
> >   error handling
> > ---
> >  .../media/platform/rockchip/rkisp1/rkisp1-common.h |  2 +
> >  .../media/platform/rockchip/rkisp1/rkisp1-params.c | 57 ++++++++++++++=
++++++--
> >  include/uapi/linux/rkisp1-config.h                 |  9 ++++
> >  include/uapi/linux/v4l2-controls.h                 |  6 +++
> >  4 files changed, 70 insertions(+), 4 deletions(-)
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
> > index b28f4140c8a3..b276926beb3c 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -2736,6 +2736,44 @@ static int rkisp1_params_init_vb2_queue(struct v=
b2_queue *q,
> >       return vb2_queue_init(q);
> >  }
> > =20
> > +static int rkisp1_ctrl_init(struct rkisp1_params *params)
>=20
> s/rkisp1_ctrl_init/rkisp1_params_ctrl_init/
>=20
> > +{
> > +     struct v4l2_ctrl_config ctrl_config =3D {
> > +             .id =3D RKISP1_CID_SUPPORTED_PARAMS_BLOCKS,
> > +             .name =3D "Supported Params Blocks",
> > +             .type =3D V4L2_CTRL_TYPE_BITMASK,
> > +             .flags =3D V4L2_CTRL_FLAG_READ_ONLY,
> > +     };
> > +     int ret;
> > +
> > +     v4l2_ctrl_handler_init(&params->ctrls, 1);
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
> > @@ -2763,7 +2801,9 @@ int rkisp1_params_register(struct rkisp1_device *=
rkisp1)
> >       vdev->queue =3D &node->buf_queue;
> >       vdev->device_caps =3D V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
> >       vdev->vfl_dir =3D VFL_DIR_TX;
> > -     rkisp1_params_init_vb2_queue(vdev->queue, params);
> > +     ret =3D rkisp1_params_init_vb2_queue(vdev->queue, params);
> > +     if (ret)
> > +             goto err_media;
> > =20
> >       params->metafmt =3D &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
> > =20
> > @@ -2777,18 +2817,26 @@ int rkisp1_params_register(struct rkisp1_device=
 *rkisp1)
> >       node->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> >       ret =3D media_entity_pads_init(&vdev->entity, 1, &node->pad);
> >       if (ret)
> > -             goto error;
> > +             goto err_media;
> > +
> > +     ret =3D rkisp1_ctrl_init(params);
> > +     if (ret) {
> > +             dev_err(rkisp1->dev, "Control initialization error %d\n",=
 ret);
> > +             goto err_media;
> > +     }
> > =20
> >       ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> >       if (ret) {
> >               dev_err(rkisp1->dev,
> >                       "failed to register %s, ret=3D%d\n", vdev->name, =
ret);
> > -             goto error;
> > +             goto err_ctrl;
> >       }
> > =20
> >       return 0;
> > =20
> > -error:
> > +err_ctrl:
> > +     v4l2_ctrl_handler_free(&params->ctrls);
> > +err_media:
> >       media_entity_cleanup(&vdev->entity);
> >       mutex_destroy(&node->vlock);
> >       return ret;
> > @@ -2804,6 +2852,7 @@ void rkisp1_params_unregister(struct rkisp1_devic=
e *rkisp1)
> >               return;
> > =20
> >       vb2_video_unregister_device(vdev);
> > +     v4l2_ctrl_handler_free(&params->ctrls);
> >       media_entity_cleanup(&vdev->entity);
> >       mutex_destroy(&node->vlock);
> >  }
> > diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rk=
isp1-config.h
> > index 2d995f3c1ca3..85c1b02f3f78 100644
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
> > @@ -1520,6 +1523,12 @@ enum rksip1_ext_param_buffer_version {
> >   * V4L2 control. If such control is not available, userspace should as=
sume only
> >   * RKISP1_EXT_PARAM_BUFFER_V1 is supported by the driver.
> >   *
> > + * The read-only V4L2 control ``RKISP1_CID_SUPPORTED_PARAMS_BLOCKS`` c=
an be used
> > + * to query the blocks supported by the device. It contains a bitmask =
where each
> > + * bit represents the availability of the corresponding entry from the
> > + * :c:type:`rkisp1_ext_params_block_type` enum. The max value of the c=
ontrol
> > + * represents the blocks supported by the kernel (independent of the d=
evice).
>=20
> Have you seen my comment in v1 ?
>=20
>  * from the :c:type:`rkisp1_ext_params_block_type` enum. The current and =
default
>  * values of the control represents the blocks supported by the device in=
stance,
>  * while the maximum value represents the blocks supported by the kernel =
driver,
>  * independently of the device instance.

Oh sorry, I missed those lines. I'll add them in v3.

Best regards,
Stefan

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

