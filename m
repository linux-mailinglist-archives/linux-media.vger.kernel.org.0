Return-Path: <linux-media+bounces-33176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B8CAC11DF
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 525F817B97E
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F26187858;
	Thu, 22 May 2025 17:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oKuHbQBy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015A01754B;
	Thu, 22 May 2025 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747933844; cv=none; b=Tjq9S3mhoAkpf6Y+EGVaP0aw4vr0zryMoBFp5t0pSE4iTMVSTTXa/YGh7cH9wG0Dxol+98ueyxHm3D7trUojFZgzuAIfveGGdt969iLWEszCXkuC+MB4y8q8AuleNHMEe+e42P45QBvsetYs9q2C4aSIUTXXSnBIvs24JiVDrIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747933844; c=relaxed/simple;
	bh=5I+mCo9Rfn+JANqW/C9UsNHsAbUMsXfkGjWI+jSdAVU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=j43lLX8IW3+Yzawhr8BTGKeXA316rVrsJ9Fbq4oZ6HUJfSyoF1ZG1WB/u3UkMsfcZWijSjL2kRNoouNjm6/1AIihwOG3C+ILVp10ldTNm3hmH29Eeh+uTBwqyOTkt0hrjJKs2w5mQC6LsLEgpf84vvtiJA2vWFFaqiD0ngWrIVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oKuHbQBy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:30c3:8bbb:632f:b0c9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F0B08FA;
	Thu, 22 May 2025 19:10:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747933819;
	bh=5I+mCo9Rfn+JANqW/C9UsNHsAbUMsXfkGjWI+jSdAVU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oKuHbQBydbdOY2dIs6/V78qBYaMl+H4LSjp21lrvutx/2zOxgOaGwr6K418Ok+gsd
	 zCQkikluExWShsOlIsvMKFUWoFz+dXF/IZJ+CvJhLvTE0ctwYKa0T2Lrv3V1H2rWhx
	 DhZF01FID21lU+Z/KC+z1TJuc0N+Koo5642s4+a4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250522164147.GV12514@pendragon.ideasonboard.com>
References: <20250522150944.400046-2-stefan.klug@ideasonboard.com> <20250522150944.400046-4-stefan.klug@ideasonboard.com> <20250522155641.GU12514@pendragon.ideasonboard.com> <174793176608.244022.1396416000017796106@localhost> <20250522164147.GV12514@pendragon.ideasonboard.com>
Subject: Re: [PATCH 2/3] media: rkisp1: Add RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Hans Verkuil <hans@jjverkuil.nl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Thu, 22 May 2025 19:10:38 +0200
Message-ID: <174793383823.244022.8319148306028952702@localhost>
User-Agent: alot/0.12.dev16+g501a9541e2e6.d20250519

Quoting Laurent Pinchart (2025-05-22 18:41:47)
> On Thu, May 22, 2025 at 06:36:06PM +0200, Stefan Klug wrote:
> > Hi Laurent,
> >=20
> > Thank you for the review.
> >=20
> > Quoting Laurent Pinchart (2025-05-22 17:56:41)
> > > Hi Stefan,
> > >=20
> > > Thank you for the patch.
> > >=20
> > > On Thu, May 22, 2025 at 05:08:39PM +0200, Stefan Klug wrote:
> > > > Add a RKISP1_CID_SUPPORTED_PARAMS_BLOCKS V4L2 control to be able to
> > > > query the parameters blocks supported by the current kernel on the
> > > > current hardware from user space.
> > > >=20
> > > > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > > > ---
> > > >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 +
> > > >  .../platform/rockchip/rkisp1/rkisp1-params.c  | 50 +++++++++++++++=
+++-
> > > >  include/uapi/linux/rkisp1-config.h            | 10 ++++
> > > >  include/uapi/linux/v4l2-controls.h            |  6 +++
> > > >  4 files changed, 67 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h=
 b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > > index ca952fd0829b..5f187f9efc7b 100644
> > > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > > @@ -415,6 +415,8 @@ struct rkisp1_params {
> > > >       spinlock_t config_lock; /* locks the buffers list 'params' */
> > > >       struct list_head params;
> > > > =20
> > > > +     struct v4l2_ctrl_handler ctrls;
> > > > +
> > > >       const struct v4l2_meta_format *metafmt;
> > > > =20
> > > >       enum v4l2_quantization quantization;
> > > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c=
 b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > > index 918eb06c7465..60c9b3c46593 100644
> > > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > > @@ -2736,6 +2736,45 @@ static int rkisp1_params_init_vb2_queue(stru=
ct vb2_queue *q,
> > > >       return vb2_queue_init(q);
> > > >  }
> > > > =20
> > > > +static int rkisp1_ctrl_init(struct rkisp1_params *params)
> > > > +{
> > > > +     int ret;
> > > > +
> > > > +     v4l2_ctrl_handler_init(&params->ctrls, 1);
> > > > +
> > > > +     struct v4l2_ctrl_config ctrl_config =3D {
> > > > +             .id =3D RKISP1_CID_SUPPORTED_PARAMS_BLOCKS,
> > > > +             .name =3D "Supported Params Blocks",
> > > > +             .type =3D V4L2_CTRL_TYPE_BITMASK,
> > > > +             .flags =3D V4L2_CTRL_FLAG_READ_ONLY,
> > > > +     };
> > >=20
> > >         struct v4l2_ctrl_config ctrl_config =3D {
> > >                 .id =3D RKISP1_CID_SUPPORTED_PARAMS_BLOCKS,
> > >                 .name =3D "Supported Params Blocks",
> > >                 .type =3D V4L2_CTRL_TYPE_BITMASK,
> > >                 .flags =3D V4L2_CTRL_FLAG_READ_ONLY,
> > >         };
> > >         int ret;
> > >=20
> > >         v4l2_ctrl_handler_init(&params->ctrls, 1);
> > >=20
> > > Mixing code and variable declarations is still usually frown upon in =
the
> > > kernel.
> >=20
> > I thought frown upon is not a no. And as this structure is not yet
> > complete and is modified afterwards it feels natural to me to put it
> > close to that place. But I can move it above the function. You decide.
>=20
> It obviously take someone to make the first move for things to change
> :-) I however tend to favour consistency in coding style within a
> driver.

Ahh, maybe I misread the comment. You meant to move it above ret. Not
outside the function. Right? That is easy to do. And I saw that pattern
in vivid-ctrls.c

Regards,
Stefan

>=20
> > > > +
> > > > +     for (unsigned int i =3D 0; i < ARRAY_SIZE(rkisp1_ext_params_h=
andlers); i++) {
> > > > +             const struct rkisp1_ext_params_handler *block_handler;
> > > > +
> > > > +             block_handler =3D &rkisp1_ext_params_handlers[i];
> > > > +             ctrl_config.max |=3D BIT(i);
> > > > +
> > > > +             if ((params->rkisp1->info->features & block_handler->=
features) !=3D
> > > > +                 block_handler->features)
> > > > +                     continue;
> > > > +
> > > > +             ctrl_config.def |=3D BIT(i);
> > > > +     }
> > > > +
> > > > +     v4l2_ctrl_new_custom(&params->ctrls, &ctrl_config, NULL);
> > > > +
> > > > +     params->vnode.vdev.ctrl_handler =3D &params->ctrls;
> > > > +
> > > > +     if (params->ctrls.error) {
> > > > +             ret =3D params->ctrls.error;
> > > > +             v4l2_ctrl_handler_free(&params->ctrls);
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > >  int rkisp1_params_register(struct rkisp1_device *rkisp1)
> > > >  {
> > > >       struct rkisp1_params *params =3D &rkisp1->params;
> > > > @@ -2776,10 +2815,16 @@ int rkisp1_params_register(struct rkisp1_de=
vice *rkisp1)
> > > > =20
> > > >       video_set_drvdata(vdev, params);
> > > > =20
> > > > +     ret =3D rkisp1_ctrl_init(params);
> > > > +     if (ret) {
> > > > +             dev_err(rkisp1->dev, "Control initialization error %d=
\n", ret);
> > > > +             goto err_mutex;
> > > > +     }
> > > > +
> > > >       node->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > > >       ret =3D media_entity_pads_init(&vdev->entity, 1, &node->pad);
> > > >       if (ret)
> > > > -             goto err_mutex;
> > > > +             goto err_ctrl;
> > > > =20
> > > >       ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> > > >       if (ret) {
> > > > @@ -2792,6 +2837,8 @@ int rkisp1_params_register(struct rkisp1_devi=
ce *rkisp1)
> > > > =20
> > > >  err_media:
> > > >       media_entity_cleanup(&vdev->entity);
> > > > +err_ctrl:
> > > > +     v4l2_ctrl_handler_free(&params->ctrls);
> > > >  err_mutex:
> > > >       mutex_destroy(&node->vlock);
> > > >       return ret;
> > > > @@ -2808,5 +2855,6 @@ void rkisp1_params_unregister(struct rkisp1_d=
evice *rkisp1)
> > > > =20
> > > >       vb2_video_unregister_device(vdev);
> > > >       media_entity_cleanup(&vdev->entity);
> > > > +     v4l2_ctrl_handler_free(&params->ctrls);
> > > >       mutex_destroy(&node->vlock);
> > > >  }
> > > > diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linu=
x/rkisp1-config.h
> > > > index 2d995f3c1ca3..4fc8f221d0c4 100644
> > > > --- a/include/uapi/linux/rkisp1-config.h
> > > > +++ b/include/uapi/linux/rkisp1-config.h
> > > > @@ -1086,6 +1086,9 @@ enum rkisp1_ext_params_block_type {
> > > >  #define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE   (1U << 0)
> > > >  #define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE    (1U << 1)
> > > > =20
> > > > +/* A bitmask of parameters blocks supported on the current hardwar=
e. */
> > > > +#define RKISP1_CID_SUPPORTED_PARAMS_BLOCKS   (V4L2_CID_USER_RKISP1=
_BASE + 0x01)
> > > > +
> > > >  /**
> > > >   * struct rkisp1_ext_params_block_header - RkISP1 extensible param=
eters block
> > > >   *                                      header
> > > > @@ -1520,6 +1523,13 @@ enum rksip1_ext_param_buffer_version {
> > > >   * V4L2 control. If such control is not available, userspace shoul=
d assume only
> > > >   * RKISP1_EXT_PARAM_BUFFER_V1 is supported by the driver.
> > > >   *
> > > > + * The read-only V4L2 control ``RKISP1_CID_SUPPORTED_PARAMS_BLOCKS=
`` can be used
> > > > + * to query the blocks supported by the current hardware. It conta=
ins a bitmask
> > >=20
> > > s/current hardware/device/
> > >=20
> > > > + * where each bit represents the availability of the corresponding=
 entry
> > > > + * from the :c:type:`rkisp1_ext_params_block_type` enum. The max v=
alue of the
> > > > + * control represents the blocks supported by the current kernel (=
independent of
> > > > + * the current hardware).
> > >=20
> > >  * from the :c:type:`rkisp1_ext_params_block_type` enum. The current =
and default
> > >  * values of the control represents the blocks supported by the devic=
e instance,
> > >  * while the maximum value represents the blocks supported by the ker=
nel driver,
> > >  * independently of the device instance.
> > >=20
> > > I was going to say that the control should be documented in
> > > Documentation/userspace-api/drivers/rkisp1.rst, but rkisp1-config.h is
> > > pulled in the documentation tree by
> > > Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst, so I'm OK w=
ith
> > > this. Hans, Mauro, are you fine as well with documenting the control
> > > here ?
> >=20
> > Looking at the docs, I realized that most people will read the already
> > existing docs. So creating a completely new file just for the single
> > control didn't feel good. As you like.
> >=20
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >=20
> > > > + *
> > > >   * For each ISP block that userspace wants to configure, a block-s=
pecific
> > > >   * structure is appended to the @data buffer, one after the other =
without gaps
> > > >   * in between nor overlaps. Userspace shall populate the @data_siz=
e field with
> > > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linu=
x/v4l2-controls.h
> > > > index 72e32814ea83..f836512e9deb 100644
> > > > --- a/include/uapi/linux/v4l2-controls.h
> > > > +++ b/include/uapi/linux/v4l2-controls.h
> > > > @@ -222,6 +222,12 @@ enum v4l2_colorfx {
> > > >   */
> > > >  #define V4L2_CID_USER_UVC_BASE                       (V4L2_CID_USE=
R_BASE + 0x11e0)
> > > > =20
> > > > +/*
> > > > + * The base for Rockchip ISP1 driver controls.
> > > > + * We reserve 16 controls for this driver.
> > > > + */
> > > > +#define V4L2_CID_USER_RKISP1_BASE            (V4L2_CID_USER_BASE +=
 0x1220)
> > > > +
> > > >  /* MPEG-class control IDs */
> > > >  /* The MPEG controls are applicable to all codec controls
> > > >   * and the 'MPEG' part of the define is historical */
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

