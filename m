Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71FD43E8DF5
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 12:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236726AbhHKKBN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 06:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236700AbhHKKBA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 06:01:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE71C061765
        for <linux-media@vger.kernel.org>; Wed, 11 Aug 2021 03:00:37 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mDl2H-0002SZ-1U; Wed, 11 Aug 2021 12:00:33 +0200
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mDl2F-00044X-ON; Wed, 11 Aug 2021 12:00:31 +0200
Date:   Wed, 11 Aug 2021 12:00:31 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, kernel@pengutronix.de
Subject: Re: [PATCH v2] media: vivid: drop CONFIG_FB dependency
Message-ID: <20210811100031.GB27204@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Guillaume Tucker <guillaume.tucker@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, kernel@pengutronix.de
References: <8615e9e583173652894889afd492022683389621.1628177586.git.guillaume.tucker@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8615e9e583173652894889afd492022683389621.1628177586.git.guillaume.tucker@collabora.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:49:31 up 174 days, 13:13, 93 users,  load average: 0.01, 0.05,
 0.07
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 05 Aug 2021 16:36:31 +0100, Guillaume Tucker wrote:
> Drop the vivid dependency on CONFIG_FB by compiling out parts of the
> code that make use of the framebuffer API when not enabled.  This is
> particularly useful as CONFIG_FB is not selected any more by
> DRM_FBDEV_EMULATION.

I like this a lot.

> 
> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> ---
> 
> Notes:
>     Changes in v2:
>     * fix Makefile conditional for when CONFIG_FB=m
>     * compile-out bit 16 (framebuffer) when no CONFIG_FB
> 
>  drivers/media/test-drivers/vivid/Kconfig       | 5 +----
>  drivers/media/test-drivers/vivid/Makefile      | 5 ++++-
>  drivers/media/test-drivers/vivid/vivid-core.c  | 9 +++++++++
>  drivers/media/test-drivers/vivid/vivid-ctrls.c | 4 ++++
>  4 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vivid/Kconfig b/drivers/media/test-drivers/vivid/Kconfig
> index c3abde2986b2..06ad350f1903 100644
> --- a/drivers/media/test-drivers/vivid/Kconfig
> +++ b/drivers/media/test-drivers/vivid/Kconfig
> @@ -1,13 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config VIDEO_VIVID
>  	tristate "Virtual Video Test Driver"
> -	depends on VIDEO_DEV && VIDEO_V4L2 && !SPARC32 && !SPARC64 && FB
> +	depends on VIDEO_DEV && VIDEO_V4L2 && !SPARC32 && !SPARC64
>  	depends on HAS_DMA
>  	select FONT_SUPPORT
>  	select FONT_8x16
> -	select FB_CFB_FILLRECT
> -	select FB_CFB_COPYAREA
> -	select FB_CFB_IMAGEBLIT
>  	select VIDEOBUF2_VMALLOC
>  	select VIDEOBUF2_DMA_CONTIG
>  	select VIDEO_V4L2_TPG
> diff --git a/drivers/media/test-drivers/vivid/Makefile b/drivers/media/test-drivers/vivid/Makefile
> index b12ad0152a3e..2ad634da7f88 100644
> --- a/drivers/media/test-drivers/vivid/Makefile
> +++ b/drivers/media/test-drivers/vivid/Makefile
> @@ -3,10 +3,13 @@ vivid-objs := vivid-core.o vivid-ctrls.o vivid-vid-common.o vivid-vbi-gen.o \
>  		vivid-vid-cap.o vivid-vid-out.o vivid-kthread-cap.o vivid-kthread-out.o \
>  		vivid-radio-rx.o vivid-radio-tx.o vivid-radio-common.o \
>  		vivid-rds-gen.o vivid-sdr-cap.o vivid-vbi-cap.o vivid-vbi-out.o \
> -		vivid-osd.o vivid-meta-cap.o vivid-meta-out.o \
> +		vivid-meta-cap.o vivid-meta-out.o \
>  		vivid-kthread-touch.o vivid-touch-cap.o
>  ifeq ($(CONFIG_VIDEO_VIVID_CEC),y)
>    vivid-objs += vivid-cec.o
>  endif
> +ifneq ($(CONFIG_FB),)
> +  vivid-objs += vivid-osd.o

vivid-osd depends on FB_CFB_FILLRECT, FB_CFB_COPYAREA, and FB_CFB_IMAGEBLIT,
which are not selected anymore, and linking fails if CONFIG_FB is enabled, but
the others are disabled.

Michael

> +endif
>  
>  obj-$(CONFIG_VIDEO_VIVID) += vivid.o
> diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
> index d2bd2653cf54..7675962b9e93 100644
> --- a/drivers/media/test-drivers/vivid/vivid-core.c
> +++ b/drivers/media/test-drivers/vivid/vivid-core.c
> @@ -126,7 +126,9 @@ MODULE_PARM_DESC(node_types, " node types, default is 0xe1d3d. Bitmask with the
>  			     "\t\t    bit 8: Video Output node\n"
>  			     "\t\t    bit 10-11: VBI Output node: 0 = none, 1 = raw vbi, 2 = sliced vbi, 3 = both\n"
>  			     "\t\t    bit 12: Radio Transmitter node\n"
> +#if IS_ENABLED(CONFIG_FB)
>  			     "\t\t    bit 16: Framebuffer for testing overlays\n"
> +#endif
>  			     "\t\t    bit 17: Metadata Capture node\n"
>  			     "\t\t    bit 18: Metadata Output node\n"
>  			     "\t\t    bit 19: Touch Capture node\n");
> @@ -1021,9 +1023,11 @@ static int vivid_detect_feature_set(struct vivid_dev *dev, int inst,
>  	/* do we have a modulator? */
>  	*has_modulator = dev->has_radio_tx;
>  
> +#if IS_ENABLED(CONFIG_FB)
>  	if (dev->has_vid_cap)
>  		/* do we have a framebuffer for overlay testing? */
>  		dev->has_fb = node_type & 0x10000;
> +#endif
>  
>  	/* can we do crop/compose/scaling while capturing? */
>  	if (no_error_inj && *ccs_cap == -1)
> @@ -1355,6 +1359,7 @@ static int vivid_create_queues(struct vivid_dev *dev)
>  			return ret;
>  	}
>  
> +#if IS_ENABLED(CONFIG_FB)
>  	if (dev->has_fb) {
>  		/* Create framebuffer for testing capture/output overlay */
>  		ret = vivid_fb_init(dev);
> @@ -1363,6 +1368,8 @@ static int vivid_create_queues(struct vivid_dev *dev)
>  		v4l2_info(&dev->v4l2_dev, "Framebuffer device registered as fb%d\n",
>  			  dev->fb_info.node);
>  	}
> +#endif
> +
>  	return 0;
>  }
>  
> @@ -2069,12 +2076,14 @@ static int vivid_remove(struct platform_device *pdev)
>  				video_device_node_name(&dev->radio_tx_dev));
>  			video_unregister_device(&dev->radio_tx_dev);
>  		}
> +#if IS_ENABLED(CONFIG_FB)
>  		if (dev->has_fb) {
>  			v4l2_info(&dev->v4l2_dev, "unregistering fb%d\n",
>  				dev->fb_info.node);
>  			unregister_framebuffer(&dev->fb_info);
>  			vivid_fb_release_buffers(dev);
>  		}
> +#endif
>  		if (dev->has_meta_cap) {
>  			v4l2_info(&dev->v4l2_dev, "unregistering %s\n",
>  				  video_device_node_name(&dev->meta_cap_dev));
> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> index 8dc50fe22972..081470a1d88a 100644
> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> @@ -305,6 +305,7 @@ static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
>  
>  /* Framebuffer Controls */
>  
> +#if IS_ENABLED(CONFIG_FB)
>  static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct vivid_dev *dev = container_of(ctrl->handler,
> @@ -328,6 +329,7 @@ static const struct v4l2_ctrl_config vivid_ctrl_clear_fb = {
>  	.name = "Clear Framebuffer",
>  	.type = V4L2_CTRL_TYPE_BUTTON,
>  };
> +#endif /* IS_ENABLED(CONFIG_FB) */
>  
>  
>  /* Video User Controls */
> @@ -1761,8 +1763,10 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  	    (dev->has_vbi_cap && dev->has_vbi_out))
>  		v4l2_ctrl_new_custom(hdl_loop_cap, &vivid_ctrl_loop_video, NULL);
>  
> +#if IS_ENABLED(CONFIG_FB)
>  	if (dev->has_fb)
>  		v4l2_ctrl_new_custom(hdl_fb, &vivid_ctrl_clear_fb, NULL);
> +#endif
>  
>  	if (dev->has_radio_rx) {
>  		v4l2_ctrl_new_custom(hdl_radio_rx, &vivid_ctrl_radio_hw_seek_mode, NULL);
> -- 
> 2.20.1
> 
> 
