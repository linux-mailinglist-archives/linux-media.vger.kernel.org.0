Return-Path: <linux-media+bounces-33249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF09AC212F
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 12:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 426D7165812
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 10:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4C222839A;
	Fri, 23 May 2025 10:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vpvGSWR9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F4418E02A;
	Fri, 23 May 2025 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747996437; cv=none; b=o5IEpRX679w+QgtSIKasppc9dLo3BUhmtKHh6XtZSvgTft/1SVxODYrOI0roBLYPIp/KaYOlrUrwJSpSouSCod/T6WMRadywwyCITQJOniivABL1hNyvpBi7JUqWhx9lQ9wHVtElOfFUek8h7AcvumD9dSySb/DJES8Ocp+Uk4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747996437; c=relaxed/simple;
	bh=hgvxpzJeY1+k9qwGhiFApj9ia2rzAoA24AxwKTcNOc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcTbfn2ph9+PDP9tKZTZ/+uT6UtUJHl8o7Z0S+IBgEOtUd5ctFkSbmkfpVd6/CvdXVhx2N/7noEphaygGSrxca04fdiPg98JrGf3An3SRpJ1pFgb/yZCDDyFzO2aQsCkTrKaFKUuPAjIaA3s2lRZe1YBFZoQdf5gUZ5xlackqDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vpvGSWR9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2EE0B346;
	Fri, 23 May 2025 12:33:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747996411;
	bh=hgvxpzJeY1+k9qwGhiFApj9ia2rzAoA24AxwKTcNOc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vpvGSWR96VoTl+J5nC+/xVo+gs4LtEpNKcwnT+yJglHm0vrTW2AFge1WHE7GOv/9t
	 do1DhDEO6VrV3aRGc1p5IzO77sHRjBJTCofYXTH7wAClMKVdpn6ej9hpv9AlIifR0I
	 XRjPwbc8CEKlVrOl2uH3SxnVBQOvBsfoVKtiE/zk=
Date: Fri, 23 May 2025 12:33:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v2 1/2] media: rkisp1: Add
 RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control
Message-ID: <20250523103346.GC12514@pendragon.ideasonboard.com>
References: <20250523-supported-params-and-wdr-v2-0-5a88dca5f420@ideasonboard.com>
 <20250523-supported-params-and-wdr-v2-1-5a88dca5f420@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250523-supported-params-and-wdr-v2-1-5a88dca5f420@ideasonboard.com>

Hi Stefan,

Thank you for the patch.

On Fri, May 23, 2025 at 12:07:31PM +0200, Stefan Klug wrote:
> Add a RKISP1_CID_SUPPORTED_PARAMS_BLOCKS V4L2 control to be able to
> query the parameters blocks supported by the current kernel on the
> current hardware from user space.
> 
> As a drive-by fix handle an (very unlikely) error in
> rkisp1_params_init_vb2_queue().

"While at it" changes are fine for very minor changes, but this is a fix
(even if it fixes a minor issue), so it should be a separate patch.

> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> 
> ---
> 
> Changes in v2:
> - Added docs improvements from review
> - Moved ctrl_config declaration to top
> - Moved rkisp1_params_init_vb2_queue() return check into this patch as
>   the previous patch got dropped
> - Call rkisp1_ctrl_init() after media_entity_pads_init() for easier
>   error handling
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-common.h |  2 +
>  .../media/platform/rockchip/rkisp1/rkisp1-params.c | 57 ++++++++++++++++++++--
>  include/uapi/linux/rkisp1-config.h                 |  9 ++++
>  include/uapi/linux/v4l2-controls.h                 |  6 +++
>  4 files changed, 70 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index ca952fd0829b..5f187f9efc7b 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -415,6 +415,8 @@ struct rkisp1_params {
>  	spinlock_t config_lock; /* locks the buffers list 'params' */
>  	struct list_head params;
>  
> +	struct v4l2_ctrl_handler ctrls;
> +
>  	const struct v4l2_meta_format *metafmt;
>  
>  	enum v4l2_quantization quantization;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index b28f4140c8a3..b276926beb3c 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -2736,6 +2736,44 @@ static int rkisp1_params_init_vb2_queue(struct vb2_queue *q,
>  	return vb2_queue_init(q);
>  }
>  
> +static int rkisp1_ctrl_init(struct rkisp1_params *params)

s/rkisp1_ctrl_init/rkisp1_params_ctrl_init/

> +{
> +	struct v4l2_ctrl_config ctrl_config = {
> +		.id = RKISP1_CID_SUPPORTED_PARAMS_BLOCKS,
> +		.name = "Supported Params Blocks",
> +		.type = V4L2_CTRL_TYPE_BITMASK,
> +		.flags = V4L2_CTRL_FLAG_READ_ONLY,
> +	};
> +	int ret;
> +
> +	v4l2_ctrl_handler_init(&params->ctrls, 1);
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(rkisp1_ext_params_handlers); i++) {
> +		const struct rkisp1_ext_params_handler *block_handler;
> +
> +		block_handler = &rkisp1_ext_params_handlers[i];
> +		ctrl_config.max |= BIT(i);
> +
> +		if ((params->rkisp1->info->features & block_handler->features) !=
> +		    block_handler->features)
> +			continue;
> +
> +		ctrl_config.def |= BIT(i);
> +	}
> +
> +	v4l2_ctrl_new_custom(&params->ctrls, &ctrl_config, NULL);
> +
> +	params->vnode.vdev.ctrl_handler = &params->ctrls;
> +
> +	if (params->ctrls.error) {
> +		ret = params->ctrls.error;
> +		v4l2_ctrl_handler_free(&params->ctrls);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  {
>  	struct rkisp1_params *params = &rkisp1->params;
> @@ -2763,7 +2801,9 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  	vdev->queue = &node->buf_queue;
>  	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
>  	vdev->vfl_dir = VFL_DIR_TX;
> -	rkisp1_params_init_vb2_queue(vdev->queue, params);
> +	ret = rkisp1_params_init_vb2_queue(vdev->queue, params);
> +	if (ret)
> +		goto err_media;
>  
>  	params->metafmt = &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
>  
> @@ -2777,18 +2817,26 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  	node->pad.flags = MEDIA_PAD_FL_SOURCE;
>  	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
>  	if (ret)
> -		goto error;
> +		goto err_media;
> +
> +	ret = rkisp1_ctrl_init(params);
> +	if (ret) {
> +		dev_err(rkisp1->dev, "Control initialization error %d\n", ret);
> +		goto err_media;
> +	}
>  
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
>  		dev_err(rkisp1->dev,
>  			"failed to register %s, ret=%d\n", vdev->name, ret);
> -		goto error;
> +		goto err_ctrl;
>  	}
>  
>  	return 0;
>  
> -error:
> +err_ctrl:
> +	v4l2_ctrl_handler_free(&params->ctrls);
> +err_media:
>  	media_entity_cleanup(&vdev->entity);
>  	mutex_destroy(&node->vlock);
>  	return ret;
> @@ -2804,6 +2852,7 @@ void rkisp1_params_unregister(struct rkisp1_device *rkisp1)
>  		return;
>  
>  	vb2_video_unregister_device(vdev);
> +	v4l2_ctrl_handler_free(&params->ctrls);
>  	media_entity_cleanup(&vdev->entity);
>  	mutex_destroy(&node->vlock);
>  }
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 2d995f3c1ca3..85c1b02f3f78 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -1086,6 +1086,9 @@ enum rkisp1_ext_params_block_type {
>  #define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
>  #define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
>  
> +/* A bitmask of parameters blocks supported on the current hardware. */
> +#define RKISP1_CID_SUPPORTED_PARAMS_BLOCKS	(V4L2_CID_USER_RKISP1_BASE + 0x01)
> +
>  /**
>   * struct rkisp1_ext_params_block_header - RkISP1 extensible parameters block
>   *					   header
> @@ -1520,6 +1523,12 @@ enum rksip1_ext_param_buffer_version {
>   * V4L2 control. If such control is not available, userspace should assume only
>   * RKISP1_EXT_PARAM_BUFFER_V1 is supported by the driver.
>   *
> + * The read-only V4L2 control ``RKISP1_CID_SUPPORTED_PARAMS_BLOCKS`` can be used
> + * to query the blocks supported by the device. It contains a bitmask where each
> + * bit represents the availability of the corresponding entry from the
> + * :c:type:`rkisp1_ext_params_block_type` enum. The max value of the control
> + * represents the blocks supported by the kernel (independent of the device).

Have you seen my comment in v1 ?

 * from the :c:type:`rkisp1_ext_params_block_type` enum. The current and default
 * values of the control represents the blocks supported by the device instance,
 * while the maximum value represents the blocks supported by the kernel driver,
 * independently of the device instance.

> + *
>   * For each ISP block that userspace wants to configure, a block-specific
>   * structure is appended to the @data buffer, one after the other without gaps
>   * in between nor overlaps. Userspace shall populate the @data_size field with
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 72e32814ea83..f836512e9deb 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -222,6 +222,12 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_UVC_BASE			(V4L2_CID_USER_BASE + 0x11e0)
>  
> +/*
> + * The base for Rockchip ISP1 driver controls.
> + * We reserve 16 controls for this driver.
> + */
> +#define V4L2_CID_USER_RKISP1_BASE		(V4L2_CID_USER_BASE + 0x1220)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */

-- 
Regards,

Laurent Pinchart

