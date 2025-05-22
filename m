Return-Path: <linux-media+bounces-33211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6305AC15E7
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 23:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20E821C01FC5
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 21:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8CC255F36;
	Thu, 22 May 2025 21:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qemR8d2H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98296F9DA;
	Thu, 22 May 2025 21:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747949461; cv=none; b=PWITve6AFA9hj+DxdKfa22XS1gAX7keUDHjy1heNPuo0v9Nfe03fkDyL81FpcxWSd00ixpZmTcgCxtvqhDwDaCRtVjMfsnTBGPbIN8TOSHFvWIc784JyzU0zTRSVSIX1oUIiNc6aT/Lq3AcpPawj42mQK85DtbH9a3DrR1FHCao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747949461; c=relaxed/simple;
	bh=KugpDzRoAvY4WZBqml977Rl1f6eI5c0/HaSaeb+pPhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2J+qFp12LIBzHuBhqR2ys5rrlN17uSm1PruyqSjN1zGT6tp+M+gyhuFWg7lIsSiTcXR+GPJy9eKxmcnfVj403vxoHRe3qBm1Fx63r8PQ12ng6fLE8DgGE7++zxrbcAFGiO6YrKp8EJS0vg9Mxl4x4QCuqVfgBSdf74MyJoojgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qemR8d2H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2921D605;
	Thu, 22 May 2025 23:30:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747949435;
	bh=KugpDzRoAvY4WZBqml977Rl1f6eI5c0/HaSaeb+pPhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qemR8d2HFVNFg0Qba7eXJqiQ+T+pbqLk9Gmg9EUEDcX1T6FrOfVxfbN+MGAprvZoQ
	 vVArRQYCbZqLncLYz0v8D/EHM1WfrZi07i2tXoaqmcWe0fVw1ScBAKjH4F7jWxDyHd
	 sTRhAQENv01jr29wreghMWQ0nruTduoB8s1HOXT0=
Date: Thu, 22 May 2025 23:30:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH 2/3] media: rkisp1: Add
 RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control
Message-ID: <20250522213050.GX12514@pendragon.ideasonboard.com>
References: <20250522150944.400046-2-stefan.klug@ideasonboard.com>
 <20250522150944.400046-4-stefan.klug@ideasonboard.com>
 <20250522155641.GU12514@pendragon.ideasonboard.com>
 <174793176608.244022.1396416000017796106@localhost>
 <20250522164147.GV12514@pendragon.ideasonboard.com>
 <174793383823.244022.8319148306028952702@localhost>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174793383823.244022.8319148306028952702@localhost>

On Thu, May 22, 2025 at 07:10:38PM +0200, Stefan Klug wrote:
> Quoting Laurent Pinchart (2025-05-22 18:41:47)
> > On Thu, May 22, 2025 at 06:36:06PM +0200, Stefan Klug wrote:
> > > Hi Laurent,
> > > 
> > > Thank you for the review.
> > > 
> > > Quoting Laurent Pinchart (2025-05-22 17:56:41)
> > > > Hi Stefan,
> > > > 
> > > > Thank you for the patch.
> > > > 
> > > > On Thu, May 22, 2025 at 05:08:39PM +0200, Stefan Klug wrote:
> > > > > Add a RKISP1_CID_SUPPORTED_PARAMS_BLOCKS V4L2 control to be able to
> > > > > query the parameters blocks supported by the current kernel on the
> > > > > current hardware from user space.
> > > > > 
> > > > > Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> > > > > ---
> > > > >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 +
> > > > >  .../platform/rockchip/rkisp1/rkisp1-params.c  | 50 ++++++++++++++++++-
> > > > >  include/uapi/linux/rkisp1-config.h            | 10 ++++
> > > > >  include/uapi/linux/v4l2-controls.h            |  6 +++
> > > > >  4 files changed, 67 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > > > index ca952fd0829b..5f187f9efc7b 100644
> > > > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > > > > @@ -415,6 +415,8 @@ struct rkisp1_params {
> > > > >       spinlock_t config_lock; /* locks the buffers list 'params' */
> > > > >       struct list_head params;
> > > > >  
> > > > > +     struct v4l2_ctrl_handler ctrls;
> > > > > +
> > > > >       const struct v4l2_meta_format *metafmt;
> > > > >  
> > > > >       enum v4l2_quantization quantization;
> > > > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > > > index 918eb06c7465..60c9b3c46593 100644
> > > > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > > > > @@ -2736,6 +2736,45 @@ static int rkisp1_params_init_vb2_queue(struct vb2_queue *q,
> > > > >       return vb2_queue_init(q);
> > > > >  }
> > > > >  
> > > > > +static int rkisp1_ctrl_init(struct rkisp1_params *params)
> > > > > +{
> > > > > +     int ret;
> > > > > +
> > > > > +     v4l2_ctrl_handler_init(&params->ctrls, 1);
> > > > > +
> > > > > +     struct v4l2_ctrl_config ctrl_config = {
> > > > > +             .id = RKISP1_CID_SUPPORTED_PARAMS_BLOCKS,
> > > > > +             .name = "Supported Params Blocks",
> > > > > +             .type = V4L2_CTRL_TYPE_BITMASK,
> > > > > +             .flags = V4L2_CTRL_FLAG_READ_ONLY,
> > > > > +     };
> > > > 
> > > >         struct v4l2_ctrl_config ctrl_config = {
> > > >                 .id = RKISP1_CID_SUPPORTED_PARAMS_BLOCKS,
> > > >                 .name = "Supported Params Blocks",
> > > >                 .type = V4L2_CTRL_TYPE_BITMASK,
> > > >                 .flags = V4L2_CTRL_FLAG_READ_ONLY,
> > > >         };
> > > >         int ret;
> > > > 
> > > >         v4l2_ctrl_handler_init(&params->ctrls, 1);
> > > > 
> > > > Mixing code and variable declarations is still usually frown upon in the
> > > > kernel.
> > > 
> > > I thought frown upon is not a no. And as this structure is not yet
> > > complete and is modified afterwards it feels natural to me to put it
> > > close to that place. But I can move it above the function. You decide.
> > 
> > It obviously take someone to make the first move for things to change
> > :-) I however tend to favour consistency in coding style within a
> > driver.
> 
> Ahh, maybe I misread the comment. You meant to move it above ret. Not
> outside the function. Right? That is easy to do. And I saw that pattern
> in vivid-ctrls.c

Yes, just above the ret.

static int rkisp1_ctrl_init(struct rkisp1_params *params)
{
	struct v4l2_ctrl_config ctrl_config = {
		.id = RKISP1_CID_SUPPORTED_PARAMS_BLOCKS,
		.name = "Supported Params Blocks",
		.type = V4L2_CTRL_TYPE_BITMASK,
		.flags = V4L2_CTRL_FLAG_READ_ONLY,
	};
	int ret;
 
	v4l2_ctrl_handler_init(&params->ctrls, 1);

	...

> > > > > +
> > > > > +     for (unsigned int i = 0; i < ARRAY_SIZE(rkisp1_ext_params_handlers); i++) {
> > > > > +             const struct rkisp1_ext_params_handler *block_handler;
> > > > > +
> > > > > +             block_handler = &rkisp1_ext_params_handlers[i];
> > > > > +             ctrl_config.max |= BIT(i);
> > > > > +
> > > > > +             if ((params->rkisp1->info->features & block_handler->features) !=
> > > > > +                 block_handler->features)
> > > > > +                     continue;
> > > > > +
> > > > > +             ctrl_config.def |= BIT(i);
> > > > > +     }
> > > > > +
> > > > > +     v4l2_ctrl_new_custom(&params->ctrls, &ctrl_config, NULL);
> > > > > +
> > > > > +     params->vnode.vdev.ctrl_handler = &params->ctrls;
> > > > > +
> > > > > +     if (params->ctrls.error) {
> > > > > +             ret = params->ctrls.error;
> > > > > +             v4l2_ctrl_handler_free(&params->ctrls);
> > > > > +             return ret;
> > > > > +     }
> > > > > +
> > > > > +     return 0;
> > > > > +}
> > > > > +
> > > > >  int rkisp1_params_register(struct rkisp1_device *rkisp1)
> > > > >  {
> > > > >       struct rkisp1_params *params = &rkisp1->params;
> > > > > @@ -2776,10 +2815,16 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
> > > > >  
> > > > >       video_set_drvdata(vdev, params);
> > > > >  
> > > > > +     ret = rkisp1_ctrl_init(params);
> > > > > +     if (ret) {
> > > > > +             dev_err(rkisp1->dev, "Control initialization error %d\n", ret);
> > > > > +             goto err_mutex;
> > > > > +     }
> > > > > +
> > > > >       node->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > > >       ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
> > > > >       if (ret)
> > > > > -             goto err_mutex;
> > > > > +             goto err_ctrl;
> > > > >  
> > > > >       ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> > > > >       if (ret) {
> > > > > @@ -2792,6 +2837,8 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
> > > > >  
> > > > >  err_media:
> > > > >       media_entity_cleanup(&vdev->entity);
> > > > > +err_ctrl:
> > > > > +     v4l2_ctrl_handler_free(&params->ctrls);
> > > > >  err_mutex:
> > > > >       mutex_destroy(&node->vlock);
> > > > >       return ret;
> > > > > @@ -2808,5 +2855,6 @@ void rkisp1_params_unregister(struct rkisp1_device *rkisp1)
> > > > >  
> > > > >       vb2_video_unregister_device(vdev);
> > > > >       media_entity_cleanup(&vdev->entity);
> > > > > +     v4l2_ctrl_handler_free(&params->ctrls);
> > > > >       mutex_destroy(&node->vlock);
> > > > >  }
> > > > > diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> > > > > index 2d995f3c1ca3..4fc8f221d0c4 100644
> > > > > --- a/include/uapi/linux/rkisp1-config.h
> > > > > +++ b/include/uapi/linux/rkisp1-config.h
> > > > > @@ -1086,6 +1086,9 @@ enum rkisp1_ext_params_block_type {
> > > > >  #define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE   (1U << 0)
> > > > >  #define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE    (1U << 1)
> > > > >  
> > > > > +/* A bitmask of parameters blocks supported on the current hardware. */
> > > > > +#define RKISP1_CID_SUPPORTED_PARAMS_BLOCKS   (V4L2_CID_USER_RKISP1_BASE + 0x01)
> > > > > +
> > > > >  /**
> > > > >   * struct rkisp1_ext_params_block_header - RkISP1 extensible parameters block
> > > > >   *                                      header
> > > > > @@ -1520,6 +1523,13 @@ enum rksip1_ext_param_buffer_version {
> > > > >   * V4L2 control. If such control is not available, userspace should assume only
> > > > >   * RKISP1_EXT_PARAM_BUFFER_V1 is supported by the driver.
> > > > >   *
> > > > > + * The read-only V4L2 control ``RKISP1_CID_SUPPORTED_PARAMS_BLOCKS`` can be used
> > > > > + * to query the blocks supported by the current hardware. It contains a bitmask
> > > > 
> > > > s/current hardware/device/
> > > > 
> > > > > + * where each bit represents the availability of the corresponding entry
> > > > > + * from the :c:type:`rkisp1_ext_params_block_type` enum. The max value of the
> > > > > + * control represents the blocks supported by the current kernel (independent of
> > > > > + * the current hardware).
> > > > 
> > > >  * from the :c:type:`rkisp1_ext_params_block_type` enum. The current and default
> > > >  * values of the control represents the blocks supported by the device instance,
> > > >  * while the maximum value represents the blocks supported by the kernel driver,
> > > >  * independently of the device instance.
> > > > 
> > > > I was going to say that the control should be documented in
> > > > Documentation/userspace-api/drivers/rkisp1.rst, but rkisp1-config.h is
> > > > pulled in the documentation tree by
> > > > Documentation/userspace-api/media/v4l/metafmt-rkisp1.rst, so I'm OK with
> > > > this. Hans, Mauro, are you fine as well with documenting the control
> > > > here ?
> > > 
> > > Looking at the docs, I realized that most people will read the already
> > > existing docs. So creating a completely new file just for the single
> > > control didn't feel good. As you like.
> > > 
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > 
> > > > > + *
> > > > >   * For each ISP block that userspace wants to configure, a block-specific
> > > > >   * structure is appended to the @data buffer, one after the other without gaps
> > > > >   * in between nor overlaps. Userspace shall populate the @data_size field with
> > > > > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > > > > index 72e32814ea83..f836512e9deb 100644
> > > > > --- a/include/uapi/linux/v4l2-controls.h
> > > > > +++ b/include/uapi/linux/v4l2-controls.h
> > > > > @@ -222,6 +222,12 @@ enum v4l2_colorfx {
> > > > >   */
> > > > >  #define V4L2_CID_USER_UVC_BASE                       (V4L2_CID_USER_BASE + 0x11e0)
> > > > >  
> > > > > +/*
> > > > > + * The base for Rockchip ISP1 driver controls.
> > > > > + * We reserve 16 controls for this driver.
> > > > > + */
> > > > > +#define V4L2_CID_USER_RKISP1_BASE            (V4L2_CID_USER_BASE + 0x1220)
> > > > > +
> > > > >  /* MPEG-class control IDs */
> > > > >  /* The MPEG controls are applicable to all codec controls
> > > > >   * and the 'MPEG' part of the define is historical */

-- 
Regards,

Laurent Pinchart

