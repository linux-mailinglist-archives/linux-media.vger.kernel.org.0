Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE974088DA
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 12:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238961AbhIMKTy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 06:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238366AbhIMKTx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 06:19:53 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D43C061574;
        Mon, 13 Sep 2021 03:18:37 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Pj2mmXzqZpQdWPj2nm2Rwq; Mon, 13 Sep 2021 12:18:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631528314; bh=U9rwsvsk+lp1ng7UE9A2xr54tmhMcS057yaNCbWEa40=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fBhH8XcwzE1a7BcGacoQ5jo9TyL8TLMUbry9hn/tLem44Y3wNi1EUYfjHpeEIRbpn
         LYQqCp0wT/A/ysO6PJUkGuKmuVC/hNanIf0vuEz2MGmn22LvxJL4Q1RL9+Xqhz+yxK
         m0mQpqUg2ChT1pf3WA5rqbxGEBI3poHsWJnMpuuWM2b3Le3Lbx+wNhodqgWyhd6e/1
         hsNwt0ISHDSsKGKDeXn3RJnt8DeVImMpHr4vTJHBYGoQHbae0Tirl1Dgwu7FNG+Qpy
         eyQTSw/+AHPNRaILs/Kz3cMlf6g5EMU36l0kG0gf705/6VSjirZWsI3K7RQg6VlWPq
         CvNXp7DDVIe6Q==
Subject: Re: [PATCH v3] media: vivid: drop FB dependency with new
 VIDEO_VIVID_FB
To:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Michael Tretter <m.tretter@pengutronix.de>
References: <f73a55a64521093e535efb5c0a64348f8c825005.1630682380.git.guillaume.tucker@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <9086d131-06c8-c91c-4658-9e94afeccbc4@xs4all.nl>
Date:   Mon, 13 Sep 2021 12:18:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f73a55a64521093e535efb5c0a64348f8c825005.1630682380.git.guillaume.tucker@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNIp5t7UFrGyoJi5d+FMPSgAkVCO+VNbuI99RSj2LJb4WlgOcZE4Pydr4l4+PVfbhehqJJuOumQNUpsDrF6uKCHsscWKldhhO+fgu9E+BHU8y2LMGoP0
 sgtwP7xsWX17FbYEmReheksihPpFkN+8XoEA5eOB0dIcvH+4kw24zjW+ReXS/a5AZ7BHyvEgwrcfzwehUy7+Wz15PuChPF6WmME89YpWBCsk84uDUsAp3G5P
 F5Ygj6w2cX3kLOENRDY3Tuc46jl/NcSVFCHv3zrk9iVXicGAdxEQE6ATFIwdgsV6AL+hBpWc+QbnrVd+WnPlWksffkyWvGFgpEVO6UFo9l0+Bdwiwsbt33OI
 UNOtn73L/PdqdQixZM165D3aBNgfYBNWfpvcs9Vu9P/LMhSDQT7zGkHZo3nREgbsnmWhKgSCococqkITDoLe5cI7xVWOIOSgGNmM28fsObk+rALE1kyZKgjE
 ZReh7MzSYHABhPRm
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guillaume,

On 03/09/2021 17:24, Guillaume Tucker wrote:
> Drop the vivid dependency on CONFIG_FB by introducing a new
> CONFIG_VIDEO_VIVID_FB option which depends on CONFIG_FB instead and
> selects the generic CFB options when enabled.  Compile out parts of
> the code that make use of the framebuffer API when not enabled.  This
> is particularly useful as CONFIG_FB is not selected by
> CONFIG_DRM_FBDEV_EMULATION any more.

As reported by the kernel test robot, this will fail if CONFIG_FB=m but
CONFIG_VIDEO_VIVID=y.

So this needs a bit more work.

Regards,

	Hans

> 
> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> ---
> 
> Notes:
>     Changes in v3:
>     * use CONFIG_VIDEO_VIVID_FB instead of CONFIG_FB
>     * select CFB options to fix linkage issue
>     
>     Changes in v2:
>     * fix Makefile conditional for when CONFIG_FB=m
>     * compile-out bit 16 (framebuffer) when no CONFIG_FB
> 
>  drivers/media/test-drivers/vivid/Kconfig       | 16 ++++++++++++----
>  drivers/media/test-drivers/vivid/Makefile      |  5 ++++-
>  drivers/media/test-drivers/vivid/vivid-core.c  |  9 +++++++++
>  drivers/media/test-drivers/vivid/vivid-ctrls.c |  4 ++++
>  4 files changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vivid/Kconfig b/drivers/media/test-drivers/vivid/Kconfig
> index c3abde2986b2..7cadaefea010 100644
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
> @@ -41,3 +38,14 @@ config VIDEO_VIVID_MAX_DEVS
>  	help
>  	  This allows you to specify the maximum number of devices supported
>  	  by the vivid driver.
> +
> +config VIDEO_VIVID_FB
> +	bool "Enable framebuffer for testing overlays"
> +	depends on VIDEO_VIVID
> +	depends on FB
> +	select FB_CFB_FILLRECT
> +	select FB_CFB_COPYAREA
> +	select FB_CFB_IMAGEBLIT
> +	default y
> +	help
> +	  Enable vivid framebuffer support for testing overlays.
> diff --git a/drivers/media/test-drivers/vivid/Makefile b/drivers/media/test-drivers/vivid/Makefile
> index b12ad0152a3e..b48bd13239f5 100644
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
> +ifeq ($(CONFIG_VIDEO_VIVID_FB),y)
> +  vivid-objs += vivid-osd.o
> +endif
>  
>  obj-$(CONFIG_VIDEO_VIVID) += vivid.o
> diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
> index 87f27c7524ec..3e785c6ce5dd 100644
> --- a/drivers/media/test-drivers/vivid/vivid-core.c
> +++ b/drivers/media/test-drivers/vivid/vivid-core.c
> @@ -126,7 +126,9 @@ MODULE_PARM_DESC(node_types, " node types, default is 0xe1d3d. Bitmask with the
>  			     "\t\t    bit 8: Video Output node\n"
>  			     "\t\t    bit 10-11: VBI Output node: 0 = none, 1 = raw vbi, 2 = sliced vbi, 3 = both\n"
>  			     "\t\t    bit 12: Radio Transmitter node\n"
> +#if IS_ENABLED(CONFIG_VIDEO_VIVID_FB)
>  			     "\t\t    bit 16: Framebuffer for testing overlays\n"
> +#endif
>  			     "\t\t    bit 17: Metadata Capture node\n"
>  			     "\t\t    bit 18: Metadata Output node\n"
>  			     "\t\t    bit 19: Touch Capture node\n");
> @@ -1031,9 +1033,11 @@ static int vivid_detect_feature_set(struct vivid_dev *dev, int inst,
>  	/* do we have a modulator? */
>  	*has_modulator = dev->has_radio_tx;
>  
> +#if IS_ENABLED(CONFIG_VIDEO_VIVID_FB)
>  	if (dev->has_vid_cap)
>  		/* do we have a framebuffer for overlay testing? */
>  		dev->has_fb = node_type & 0x10000;
> +#endif
>  
>  	/* can we do crop/compose/scaling while capturing? */
>  	if (no_error_inj && *ccs_cap == -1)
> @@ -1365,6 +1369,7 @@ static int vivid_create_queues(struct vivid_dev *dev)
>  			return ret;
>  	}
>  
> +#if IS_ENABLED(CONFIG_VIDEO_VIVID_FB)
>  	if (dev->has_fb) {
>  		/* Create framebuffer for testing capture/output overlay */
>  		ret = vivid_fb_init(dev);
> @@ -1373,6 +1378,8 @@ static int vivid_create_queues(struct vivid_dev *dev)
>  		v4l2_info(&dev->v4l2_dev, "Framebuffer device registered as fb%d\n",
>  			  dev->fb_info.node);
>  	}
> +#endif
> +
>  	return 0;
>  }
>  
> @@ -2079,12 +2086,14 @@ static int vivid_remove(struct platform_device *pdev)
>  				video_device_node_name(&dev->radio_tx_dev));
>  			video_unregister_device(&dev->radio_tx_dev);
>  		}
> +#if IS_ENABLED(CONFIG_VIDEO_VIVID_FB)
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
> index 8dc50fe22972..6cfd4808b38c 100644
> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
> @@ -305,6 +305,7 @@ static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
>  
>  /* Framebuffer Controls */
>  
> +#if IS_ENABLED(CONFIG_VIDEO_VIVID_FB)
>  static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct vivid_dev *dev = container_of(ctrl->handler,
> @@ -328,6 +329,7 @@ static const struct v4l2_ctrl_config vivid_ctrl_clear_fb = {
>  	.name = "Clear Framebuffer",
>  	.type = V4L2_CTRL_TYPE_BUTTON,
>  };
> +#endif /* IS_ENABLED(CONFIG_VIDEO_VIVID_FB) */
>  
>  
>  /* Video User Controls */
> @@ -1761,8 +1763,10 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>  	    (dev->has_vbi_cap && dev->has_vbi_out))
>  		v4l2_ctrl_new_custom(hdl_loop_cap, &vivid_ctrl_loop_video, NULL);
>  
> +#if IS_ENABLED(CONFIG_VIDEO_VIVID_FB)
>  	if (dev->has_fb)
>  		v4l2_ctrl_new_custom(hdl_fb, &vivid_ctrl_clear_fb, NULL);
> +#endif
>  
>  	if (dev->has_radio_rx) {
>  		v4l2_ctrl_new_custom(hdl_radio_rx, &vivid_ctrl_radio_hw_seek_mode, NULL);
> 

