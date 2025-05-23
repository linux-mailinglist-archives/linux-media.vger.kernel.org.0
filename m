Return-Path: <linux-media+bounces-33223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B2BAC1A00
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 04:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F209B1C04FB5
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 02:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9AC1F2B83;
	Fri, 23 May 2025 02:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IBVokDvD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54742DCC12;
	Fri, 23 May 2025 02:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747966775; cv=none; b=D6+fVhYoDqnNdaimKNZt249jHvK/y3E7nMdZvKJsZpV8cenSBLH7ucKV7m62i42qQYMLWH1Lq34IaeP9NsCO/kxU/G4U5DVgBsGR2ewXvDEmtuW/kEjCd12wyow50Xogc43N+Mo9lolOppk+hyhOiLuNFUzRwB1beucmQJgcRPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747966775; c=relaxed/simple;
	bh=PffKFFTE+nkp6ihzmn+9PvhOFWysDbcyP1NsDbiB/Co=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=fHLZHH1y3cvi7JuVYGhOQ+HZloQTYMx6BRddwvL9pa4EqCLTY9Rgz1Vuh7FADusKCqQldHVtpSM2JzPZ3NmGXjDoZM/u7/gb9bMf29cHRTJudKc/xjYwbMh18d8K/zMoekO+e/WcGwnR8XWuWPv3diQoxfOX2S1d9OYgySvNUXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IBVokDvD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pyrite.rasen.tech (fp76f176b6.tkyc001.ap.nuro.jp [118.241.118.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60AAC6BE;
	Fri, 23 May 2025 04:19:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747966749;
	bh=PffKFFTE+nkp6ihzmn+9PvhOFWysDbcyP1NsDbiB/Co=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IBVokDvDArDrnp6uBppUlHb4X3KQj98US4AlXPaNo5O+Mah2E0cN3KLQICl5klVr0
	 2MepZPghObA0phLARerlDWgTHhI6ZfqjR5YkoIafffhEN2j/S2DlCj2Q6BudR9S5Ei
	 UOAX5LHu5kBRfpD491AhkPeGHjV1TLaB6qjO4Sow=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250522150944.400046-4-stefan.klug@ideasonboard.com>
References: <20250522150944.400046-2-stefan.klug@ideasonboard.com> <20250522150944.400046-4-stefan.klug@ideasonboard.com>
Subject: Re: [PATCH 2/3] media: rkisp1: Add RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Dafna Hirschfeld <dafna@fastmail.com>, Heiko Stuebner <heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Stefan Klug <stefan.klug@ideasonboard.com>, linux-media@vger.kernel.org
Date: Fri, 23 May 2025 04:19:22 +0200
Message-ID: <174796676223.109413.8872494365754700648@pyrite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Stefan Klug (2025-05-22 17:08:39)
> Add a RKISP1_CID_SUPPORTED_PARAMS_BLOCKS V4L2 control to be able to
> query the parameters blocks supported by the current kernel on the
> current hardware from user space.
>=20
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 +
>  .../platform/rockchip/rkisp1/rkisp1-params.c  | 50 ++++++++++++++++++-
>  include/uapi/linux/rkisp1-config.h            | 10 ++++
>  include/uapi/linux/v4l2-controls.h            |  6 +++
>  4 files changed, 67 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index ca952fd0829b..5f187f9efc7b 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -415,6 +415,8 @@ struct rkisp1_params {
>         spinlock_t config_lock; /* locks the buffers list 'params' */
>         struct list_head params;
> =20
> +       struct v4l2_ctrl_handler ctrls;
> +
>         const struct v4l2_meta_format *metafmt;
> =20
>         enum v4l2_quantization quantization;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 918eb06c7465..60c9b3c46593 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -2736,6 +2736,45 @@ static int rkisp1_params_init_vb2_queue(struct vb2=
_queue *q,
>         return vb2_queue_init(q);
>  }
> =20
> +static int rkisp1_ctrl_init(struct rkisp1_params *params)
> +{
> +       int ret;
> +
> +       v4l2_ctrl_handler_init(&params->ctrls, 1);
> +
> +       struct v4l2_ctrl_config ctrl_config =3D {
> +               .id =3D RKISP1_CID_SUPPORTED_PARAMS_BLOCKS,
> +               .name =3D "Supported Params Blocks",
> +               .type =3D V4L2_CTRL_TYPE_BITMASK,
> +               .flags =3D V4L2_CTRL_FLAG_READ_ONLY,
> +       };
> +
> +       for (unsigned int i =3D 0; i < ARRAY_SIZE(rkisp1_ext_params_handl=
ers); i++) {
> +               const struct rkisp1_ext_params_handler *block_handler;
> +
> +               block_handler =3D &rkisp1_ext_params_handlers[i];
> +               ctrl_config.max |=3D BIT(i);
> +
> +               if ((params->rkisp1->info->features & block_handler->feat=
ures) !=3D
> +                   block_handler->features)
> +                       continue;
> +
> +               ctrl_config.def |=3D BIT(i);
> +       }
> +
> +       v4l2_ctrl_new_custom(&params->ctrls, &ctrl_config, NULL);
> +
> +       params->vnode.vdev.ctrl_handler =3D &params->ctrls;
> +
> +       if (params->ctrls.error) {
> +               ret =3D params->ctrls.error;
> +               v4l2_ctrl_handler_free(&params->ctrls);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  {
>         struct rkisp1_params *params =3D &rkisp1->params;
> @@ -2776,10 +2815,16 @@ int rkisp1_params_register(struct rkisp1_device *=
rkisp1)
> =20
>         video_set_drvdata(vdev, params);
> =20
> +       ret =3D rkisp1_ctrl_init(params);
> +       if (ret) {
> +               dev_err(rkisp1->dev, "Control initialization error %d\n",=
 ret);
> +               goto err_mutex;
> +       }
> +
>         node->pad.flags =3D MEDIA_PAD_FL_SOURCE;
>         ret =3D media_entity_pads_init(&vdev->entity, 1, &node->pad);
>         if (ret)
> -               goto err_mutex;
> +               goto err_ctrl;
> =20
>         ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>         if (ret) {
> @@ -2792,6 +2837,8 @@ int rkisp1_params_register(struct rkisp1_device *rk=
isp1)
> =20
>  err_media:
>         media_entity_cleanup(&vdev->entity);
> +err_ctrl:
> +       v4l2_ctrl_handler_free(&params->ctrls);
>  err_mutex:
>         mutex_destroy(&node->vlock);
>         return ret;
> @@ -2808,5 +2855,6 @@ void rkisp1_params_unregister(struct rkisp1_device =
*rkisp1)
> =20
>         vb2_video_unregister_device(vdev);
>         media_entity_cleanup(&vdev->entity);
> +       v4l2_ctrl_handler_free(&params->ctrls);
>         mutex_destroy(&node->vlock);
>  }
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkis=
p1-config.h
> index 2d995f3c1ca3..4fc8f221d0c4 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -1086,6 +1086,9 @@ enum rkisp1_ext_params_block_type {
>  #define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE     (1U << 0)
>  #define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE      (1U << 1)
> =20
> +/* A bitmask of parameters blocks supported on the current hardware. */
> +#define RKISP1_CID_SUPPORTED_PARAMS_BLOCKS     (V4L2_CID_USER_RKISP1_BAS=
E + 0x01)
> +
>  /**
>   * struct rkisp1_ext_params_block_header - RkISP1 extensible parameters =
block
>   *                                        header
> @@ -1520,6 +1523,13 @@ enum rksip1_ext_param_buffer_version {
>   * V4L2 control. If such control is not available, userspace should assu=
me only
>   * RKISP1_EXT_PARAM_BUFFER_V1 is supported by the driver.
>   *
> + * The read-only V4L2 control ``RKISP1_CID_SUPPORTED_PARAMS_BLOCKS`` can=
 be used
> + * to query the blocks supported by the current hardware. It contains a =
bitmask
> + * where each bit represents the availability of the corresponding entry
> + * from the :c:type:`rkisp1_ext_params_block_type` enum. The max value o=
f the
> + * control represents the blocks supported by the current kernel (indepe=
ndent of
> + * the current hardware).
> + *
>   * For each ISP block that userspace wants to configure, a block-specific
>   * structure is appended to the @data buffer, one after the other withou=
t gaps
>   * in between nor overlaps. Userspace shall populate the @data_size fiel=
d with
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index 72e32814ea83..f836512e9deb 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -222,6 +222,12 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_UVC_BASE                 (V4L2_CID_USER_BASE + 0x1=
1e0)
> =20
> +/*
> + * The base for Rockchip ISP1 driver controls.
> + * We reserve 16 controls for this driver.
> + */
> +#define V4L2_CID_USER_RKISP1_BASE              (V4L2_CID_USER_BASE + 0x1=
220)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */
> --=20
> 2.43.0
>=20
>

