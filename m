Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED54400288
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 17:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349692AbhICPsH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 11:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235573AbhICPsH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 11:48:07 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E521FC061575;
        Fri,  3 Sep 2021 08:47:06 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id A4BA01F40896
Subject: Re: [PATCH v2] media: vivid: drop CONFIG_FB dependency
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <8615e9e583173652894889afd492022683389621.1628177586.git.guillaume.tucker@collabora.com>
 <20210811100031.GB27204@pengutronix.de>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, kernel@pengutronix.de,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Message-ID: <f63dc030-72be-dc68-25c6-4a00aea31cdf@collabora.com>
Date:   Fri, 3 Sep 2021 16:47:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811100031.GB27204@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/08/2021 11:00, Michael Tretter wrote:
> On Thu, 05 Aug 2021 16:36:31 +0100, Guillaume Tucker wrote:
>> Drop the vivid dependency on CONFIG_FB by compiling out parts of the
>> code that make use of the framebuffer API when not enabled.  This is
>> particularly useful as CONFIG_FB is not selected any more by
>> DRM_FBDEV_EMULATION.
> 
> I like this a lot.

Thank you for your feedback.

>> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
>> ---
>>
>> Notes:
>>     Changes in v2:
>>     * fix Makefile conditional for when CONFIG_FB=m
>>     * compile-out bit 16 (framebuffer) when no CONFIG_FB
>>
>>  drivers/media/test-drivers/vivid/Kconfig       | 5 +----
>>  drivers/media/test-drivers/vivid/Makefile      | 5 ++++-
>>  drivers/media/test-drivers/vivid/vivid-core.c  | 9 +++++++++
>>  drivers/media/test-drivers/vivid/vivid-ctrls.c | 4 ++++
>>  4 files changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/test-drivers/vivid/Kconfig b/drivers/media/test-drivers/vivid/Kconfig
>> index c3abde2986b2..06ad350f1903 100644
>> --- a/drivers/media/test-drivers/vivid/Kconfig
>> +++ b/drivers/media/test-drivers/vivid/Kconfig
>> @@ -1,13 +1,10 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  config VIDEO_VIVID
>>  	tristate "Virtual Video Test Driver"
>> -	depends on VIDEO_DEV && VIDEO_V4L2 && !SPARC32 && !SPARC64 && FB
>> +	depends on VIDEO_DEV && VIDEO_V4L2 && !SPARC32 && !SPARC64
>>  	depends on HAS_DMA
>>  	select FONT_SUPPORT
>>  	select FONT_8x16
>> -	select FB_CFB_FILLRECT
>> -	select FB_CFB_COPYAREA
>> -	select FB_CFB_IMAGEBLIT
>>  	select VIDEOBUF2_VMALLOC
>>  	select VIDEOBUF2_DMA_CONTIG
>>  	select VIDEO_V4L2_TPG
>> diff --git a/drivers/media/test-drivers/vivid/Makefile b/drivers/media/test-drivers/vivid/Makefile
>> index b12ad0152a3e..2ad634da7f88 100644
>> --- a/drivers/media/test-drivers/vivid/Makefile
>> +++ b/drivers/media/test-drivers/vivid/Makefile
>> @@ -3,10 +3,13 @@ vivid-objs := vivid-core.o vivid-ctrls.o vivid-vid-common.o vivid-vbi-gen.o \
>>  		vivid-vid-cap.o vivid-vid-out.o vivid-kthread-cap.o vivid-kthread-out.o \
>>  		vivid-radio-rx.o vivid-radio-tx.o vivid-radio-common.o \
>>  		vivid-rds-gen.o vivid-sdr-cap.o vivid-vbi-cap.o vivid-vbi-out.o \
>> -		vivid-osd.o vivid-meta-cap.o vivid-meta-out.o \
>> +		vivid-meta-cap.o vivid-meta-out.o \
>>  		vivid-kthread-touch.o vivid-touch-cap.o
>>  ifeq ($(CONFIG_VIDEO_VIVID_CEC),y)
>>    vivid-objs += vivid-cec.o
>>  endif
>> +ifneq ($(CONFIG_FB),)
>> +  vivid-objs += vivid-osd.o
> 
> vivid-osd depends on FB_CFB_FILLRECT, FB_CFB_COPYAREA, and FB_CFB_IMAGEBLIT,
> which are not selected anymore, and linking fails if CONFIG_FB is enabled, but
> the others are disabled.

I just sent a v3 which introduces a separate config to select
those dependencies when enabling framebuffer support in vivid.
In principle this should fix the linkage issue while still
dropping the hard dependency on CONFIG_FB.  I've tried various
combinations of built-in and module options for CONFIG_FB and
CONFIG_VIDEO_VIVID and they all built fine, although that's not
really comprehensive build testing so I'll keep an eye open for
test bot results.

Thanks,
Guillaume

>> +endif
>>  
>>  obj-$(CONFIG_VIDEO_VIVID) += vivid.o
>> diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
>> index d2bd2653cf54..7675962b9e93 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-core.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-core.c
>> @@ -126,7 +126,9 @@ MODULE_PARM_DESC(node_types, " node types, default is 0xe1d3d. Bitmask with the
>>  			     "\t\t    bit 8: Video Output node\n"
>>  			     "\t\t    bit 10-11: VBI Output node: 0 = none, 1 = raw vbi, 2 = sliced vbi, 3 = both\n"
>>  			     "\t\t    bit 12: Radio Transmitter node\n"
>> +#if IS_ENABLED(CONFIG_FB)
>>  			     "\t\t    bit 16: Framebuffer for testing overlays\n"
>> +#endif
>>  			     "\t\t    bit 17: Metadata Capture node\n"
>>  			     "\t\t    bit 18: Metadata Output node\n"
>>  			     "\t\t    bit 19: Touch Capture node\n");
>> @@ -1021,9 +1023,11 @@ static int vivid_detect_feature_set(struct vivid_dev *dev, int inst,
>>  	/* do we have a modulator? */
>>  	*has_modulator = dev->has_radio_tx;
>>  
>> +#if IS_ENABLED(CONFIG_FB)
>>  	if (dev->has_vid_cap)
>>  		/* do we have a framebuffer for overlay testing? */
>>  		dev->has_fb = node_type & 0x10000;
>> +#endif
>>  
>>  	/* can we do crop/compose/scaling while capturing? */
>>  	if (no_error_inj && *ccs_cap == -1)
>> @@ -1355,6 +1359,7 @@ static int vivid_create_queues(struct vivid_dev *dev)
>>  			return ret;
>>  	}
>>  
>> +#if IS_ENABLED(CONFIG_FB)
>>  	if (dev->has_fb) {
>>  		/* Create framebuffer for testing capture/output overlay */
>>  		ret = vivid_fb_init(dev);
>> @@ -1363,6 +1368,8 @@ static int vivid_create_queues(struct vivid_dev *dev)
>>  		v4l2_info(&dev->v4l2_dev, "Framebuffer device registered as fb%d\n",
>>  			  dev->fb_info.node);
>>  	}
>> +#endif
>> +
>>  	return 0;
>>  }
>>  
>> @@ -2069,12 +2076,14 @@ static int vivid_remove(struct platform_device *pdev)
>>  				video_device_node_name(&dev->radio_tx_dev));
>>  			video_unregister_device(&dev->radio_tx_dev);
>>  		}
>> +#if IS_ENABLED(CONFIG_FB)
>>  		if (dev->has_fb) {
>>  			v4l2_info(&dev->v4l2_dev, "unregistering fb%d\n",
>>  				dev->fb_info.node);
>>  			unregister_framebuffer(&dev->fb_info);
>>  			vivid_fb_release_buffers(dev);
>>  		}
>> +#endif
>>  		if (dev->has_meta_cap) {
>>  			v4l2_info(&dev->v4l2_dev, "unregistering %s\n",
>>  				  video_device_node_name(&dev->meta_cap_dev));
>> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
>> index 8dc50fe22972..081470a1d88a 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
>> @@ -305,6 +305,7 @@ static const struct v4l2_ctrl_config vivid_ctrl_ro_int32 = {
>>  
>>  /* Framebuffer Controls */
>>  
>> +#if IS_ENABLED(CONFIG_FB)
>>  static int vivid_fb_s_ctrl(struct v4l2_ctrl *ctrl)
>>  {
>>  	struct vivid_dev *dev = container_of(ctrl->handler,
>> @@ -328,6 +329,7 @@ static const struct v4l2_ctrl_config vivid_ctrl_clear_fb = {
>>  	.name = "Clear Framebuffer",
>>  	.type = V4L2_CTRL_TYPE_BUTTON,
>>  };
>> +#endif /* IS_ENABLED(CONFIG_FB) */
>>  
>>  
>>  /* Video User Controls */
>> @@ -1761,8 +1763,10 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
>>  	    (dev->has_vbi_cap && dev->has_vbi_out))
>>  		v4l2_ctrl_new_custom(hdl_loop_cap, &vivid_ctrl_loop_video, NULL);
>>  
>> +#if IS_ENABLED(CONFIG_FB)
>>  	if (dev->has_fb)
>>  		v4l2_ctrl_new_custom(hdl_fb, &vivid_ctrl_clear_fb, NULL);
>> +#endif
>>  
>>  	if (dev->has_radio_rx) {
>>  		v4l2_ctrl_new_custom(hdl_radio_rx, &vivid_ctrl_radio_hw_seek_mode, NULL);
>> -- 
>> 2.20.1
>>
>>

