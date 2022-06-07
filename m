Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E849B53FE3B
	for <lists+linux-media@lfdr.de>; Tue,  7 Jun 2022 14:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243320AbiFGMCa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jun 2022 08:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243345AbiFGMC2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jun 2022 08:02:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BDF71B792
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 05:02:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6A9F16172E
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 12:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B78C385A5;
        Tue,  7 Jun 2022 12:02:23 +0000 (UTC)
Message-ID: <c10fcafb-58b0-2df4-9d5e-eb09ebdef6f8@xs4all.nl>
Date:   Tue, 7 Jun 2022 14:02:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH v2] media: visl: add virtual stateless driver
Content-Language: en-US
To:     daniel.almeida@collabora.com
Cc:     linux-media@vger.kernel.org
References: <20210810220552.298140-3-daniel.almeida@collabora.com>
 <20220606212622.495841-1-daniel.almeida@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220606212622.495841-1-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/6/22 23:26, daniel.almeida@collabora.com wrote:
> From: Daniel Almeida <daniel.almeida@collabora.com>
> 
> A virtual stateless device for stateless uAPI development purposes.
> 
> This tool's objective is to help the development and testing of userspace
> applications that use the V4L2 stateless API to decode media.

So this is specifically for *decoding*, right? Is it the intention that the
same driver will be able to handle stateless encoding as well in the future?
Or would that be a new driver?

It matters primarily for the naming of the driver. If it is decoding only,
then it should be something like visldec.

> 
> A userspace implementation can use visl to run a decoding loop even when no
> hardware is available or when the kernel uAPI for the codec has not been
> upstreamed yet. This can reveal bugs at an early stage.
> 
> This driver can also trace the contents of the V4L2 controls submitted to it.
> It can also dump the contents of the vb2 buffers through a debugfs
> interface. This is in many ways similar to the tracing infrastructure
> available for other popular encode/decode APIs out there and can help develop
> a userspace application by using another (working) one as a reference.
> 
> Note that no actual decoding of video frames is performed by visl. The V4L2
> test pattern generator is used to write various debug information to the
> capture buffers instead.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> 
> ---
> Was media: vivpu: add virtual VPU driver
> 
> Changes from v1:
> 
> - Addressed review comments from v1
> - Driver was renamed to visl
> - Dropped AV1 support for now (as it's not upstream yet)
> - Added support for FWHT, MPEG2, VP8, VP9, H264
> - Added TPG support
> - Driver can now dump the controls for the codecs above through ftrace
> - Driver can now dump the vb2 bitstream buffer through a debugfs infrastructure
> 
> I ran this on a kernel with KASAN/kmemleak enabled, nothing showed up.
> 
> v4l2-compliance results:
> 
> v4l2-compliance 1.22.1, 64 bits, 64-bit time_t

Based on the output I can tell that this is an old v4l2-compliance utility.

Please compile it straight from the v4l-utils git repo.

Also compare it with the output when used with vicodec: the compliance test
should be able to detect that it is a stateless decoder, but I don't see that
in the output below, either because it is a too old version, or the driver
does something wrong, breaking this detection.

> 
> Compliance test for visl device /dev/video0:
> 
> Driver Info:
>         Driver name      : visl
>         Card type        : visl
>         Bus info         : platform:visl
>         Driver version   : 5.19.0
>         Capabilities     : 0x84204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : visl
>         Model            : visl
>         Serial           : 
>         Bus info         : platform:visl
>         Media version    : 5.19.0
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 5.19.0
> Interface Info:
>         ID               : 0x0300000c
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000001 (1)
>         Name             : visl-source
>         Function         : V4L2 I/O
>         Pad 0x01000002   : 0: Source
>           Link 0x02000008: to remote pad 0x1000004 of entity 'visl-proc' (Video Decoder): Data, Enabled, Immutable
> 
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>         test invalid ioctls: OK
> 
> Allow for multiple opens:
>         test second /dev/video0 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 3 Private Controls: 0
>         Standard Compound Controls: 13 Private Compound Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK
> 
> Test input 0:
> 
> Streaming ioctls:
>         test read/write: OK (Not Supported)
>         test blocking wait: OK
>         Video Capture Multiplanar: Captured 58 buffers    
>         test MMAP (no poll): OK
>         Video Capture Multiplanar: Captured 58 buffers    
>         test MMAP (select): OK
>         Video Capture Multiplanar: Captured 58 buffers    
>         test MMAP (epoll): OK
>         Video Capture Multiplanar: Captured 58 buffers    
>         test USERPTR (no poll): OK
>         Video Capture Multiplanar: Captured 58 buffers    
>         test USERPTR (select): OK
>         test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for visl device /dev/video0: 53, Succeeded: 53, Failed: 0, Warnings: 0
> 
> ---
>  drivers/media/test-drivers/Kconfig            |   1 +
>  drivers/media/test-drivers/Makefile           |   1 +
>  drivers/media/test-drivers/visl/Kconfig       |  31 +
>  drivers/media/test-drivers/visl/Makefile      |   8 +
>  drivers/media/test-drivers/visl/visl-core.c   | 532 ++++++++++++
>  .../media/test-drivers/visl/visl-debugfs.c    | 148 ++++
>  .../media/test-drivers/visl/visl-debugfs.h    |  72 ++
>  drivers/media/test-drivers/visl/visl-dec.c    | 468 +++++++++++
>  drivers/media/test-drivers/visl/visl-dec.h    | 100 +++
>  .../media/test-drivers/visl/visl-trace-fwht.h |  66 ++
>  .../media/test-drivers/visl/visl-trace-h264.h | 349 ++++++++
>  .../test-drivers/visl/visl-trace-mpeg2.h      |  99 +++
>  .../test-drivers/visl/visl-trace-points.c     |   9 +
>  .../media/test-drivers/visl/visl-trace-vp8.h  | 156 ++++
>  .../media/test-drivers/visl/visl-trace-vp9.h  | 292 +++++++
>  drivers/media/test-drivers/visl/visl-video.c  | 776 ++++++++++++++++++
>  drivers/media/test-drivers/visl/visl-video.h  |  61 ++
>  drivers/media/test-drivers/visl/visl.h        | 178 ++++
>  18 files changed, 3347 insertions(+)
>  create mode 100644 drivers/media/test-drivers/visl/Kconfig
>  create mode 100644 drivers/media/test-drivers/visl/Makefile
>  create mode 100644 drivers/media/test-drivers/visl/visl-core.c
>  create mode 100644 drivers/media/test-drivers/visl/visl-debugfs.c
>  create mode 100644 drivers/media/test-drivers/visl/visl-debugfs.h
>  create mode 100644 drivers/media/test-drivers/visl/visl-dec.c
>  create mode 100644 drivers/media/test-drivers/visl/visl-dec.h
>  create mode 100644 drivers/media/test-drivers/visl/visl-trace-fwht.h
>  create mode 100644 drivers/media/test-drivers/visl/visl-trace-h264.h
>  create mode 100644 drivers/media/test-drivers/visl/visl-trace-mpeg2.h
>  create mode 100644 drivers/media/test-drivers/visl/visl-trace-points.c
>  create mode 100644 drivers/media/test-drivers/visl/visl-trace-vp8.h
>  create mode 100644 drivers/media/test-drivers/visl/visl-trace-vp9.h
>  create mode 100644 drivers/media/test-drivers/visl/visl-video.c
>  create mode 100644 drivers/media/test-drivers/visl/visl-video.h
>  create mode 100644 drivers/media/test-drivers/visl/visl.h
> 
> diff --git a/drivers/media/test-drivers/Kconfig b/drivers/media/test-drivers/Kconfig
> index 51cf27834df0..459b433e9fae 100644
> --- a/drivers/media/test-drivers/Kconfig
> +++ b/drivers/media/test-drivers/Kconfig
> @@ -20,6 +20,7 @@ config VIDEO_VIM2M
>  source "drivers/media/test-drivers/vicodec/Kconfig"
>  source "drivers/media/test-drivers/vimc/Kconfig"
>  source "drivers/media/test-drivers/vivid/Kconfig"
> +source "drivers/media/test-drivers/visl/Kconfig"
>  
>  endif #V4L_TEST_DRIVERS
>  
> diff --git a/drivers/media/test-drivers/Makefile b/drivers/media/test-drivers/Makefile
> index ff390b687189..740714a4584d 100644
> --- a/drivers/media/test-drivers/Makefile
> +++ b/drivers/media/test-drivers/Makefile
> @@ -12,3 +12,4 @@ obj-$(CONFIG_VIDEO_VICODEC) += vicodec/
>  obj-$(CONFIG_VIDEO_VIM2M) += vim2m.o
>  obj-$(CONFIG_VIDEO_VIMC) += vimc/
>  obj-$(CONFIG_VIDEO_VIVID) += vivid/
> +obj-$(CONFIG_VIDEO_VISL) += visl/
> diff --git a/drivers/media/test-drivers/visl/Kconfig b/drivers/media/test-drivers/visl/Kconfig
> new file mode 100644
> index 000000000000..976319c3c372
> --- /dev/null
> +++ b/drivers/media/test-drivers/visl/Kconfig
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +config VIDEO_VISL
> +	tristate "Virtual Stateless Driver (visl)"

I think this should be "Virtual Stateless Codec Driver" (or Stateless Decoder Driver if
it will only be for decoding). "Stateless Driver" is too vague.

> +	depends on VIDEO_DEV
> +	select FONT_SUPPORT
> +	select FONT_8x16
> +	select VIDEOBUF2_VMALLOC
> +	select V4L2_MEM2MEM_DEV
> +	select MEDIA_CONTROLLER
> +	select MEDIA_CONTROLLER_REQUEST_API
> +	select VIDEO_V4L2_TPG
> +	help
> +
> +	  A virtual stateless device for uAPI development purposes.
> +
> +	  A userspace implementation can use visl to run a decoding loop even
> +	  when no hardware is available or when the kernel uAPI for the codec
> +	  has not been upstreamed yet. This can reveal bugs at an early stage.
> +
> +

A few too many empty lines here. One is enough.

Regards,

	Hans

> +
> +	  When in doubt, say N.
> +
> +config VISL_DEBUGFS
> +	bool "Enable debugfs for visl"
> +	depends on VIDEO_VISL
> +	depends on DEBUG_FS
> +
> +	help
> +	  Choose Y to dump the bitstream buffers through debugfs.
> +	  When in doubt, say N.
