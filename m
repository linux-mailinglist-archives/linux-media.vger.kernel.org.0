Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 754C459A732
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 22:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349863AbiHSUng (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Aug 2022 16:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231806AbiHSUnf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Aug 2022 16:43:35 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0BA205E5
        for <linux-media@vger.kernel.org>; Fri, 19 Aug 2022 13:43:28 -0700 (PDT)
Received: from localhost (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C17846601DC5;
        Fri, 19 Aug 2022 21:43:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1660941807;
        bh=DDR72AiAPfQTrCV30W2fP2E7zBcd1QNEZihRYCZ4ErE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U7SGYZXaofOJTr9TYIfKpB/2ZTThrGmL7RbvwJ6z7hfGdJcZ1uiSxBwMdUFYdSdSM
         IxAizVVisW0TtdTBsFQFli3u2cXYPU5nyezlKapHd+pnozxkYKvrMa2+8nRKr9Ce/+
         lyiyHJwWz7HX8fZXgmHhPydDAbNgbC6kcQgtB8bTsg5LRKXL7mpjr9wsposv+3dVxg
         b9Fh9DnIiDKloeq919MA1ewf4C8OyxNlue3eX1eF+DEBVCjhgima/mSXBln1Lwp91M
         SbbsylZu+UxwTVvCFUIf//MKiZ50fFmBuxgm8u8isFM4aX2NOdi9BLFvbWAhSlJBex
         iN4jsqW6+JL9A==
Date:   Fri, 19 Aug 2022 13:43:44 -0700
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     daniel.almeida@collabora.com
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org
Subject: Re: [RFC PATCH v2] media: visl: add virtual stateless driver
Message-ID: <Yv/1PnzxIyHMD+zB@xps>
References: <20210810220552.298140-3-daniel.almeida@collabora.com>
 <20220606212622.495841-1-daniel.almeida@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606212622.495841-1-daniel.almeida@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 06, 2022 at 06:26:22PM -0300, daniel.almeida@collabora.com wrote:
> From: Daniel Almeida <daniel.almeida@collabora.com>
> 
> A virtual stateless device for stateless uAPI development purposes.
> 
> This tool's objective is to help the development and testing of userspace
> applications that use the V4L2 stateless API to decode media.
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

Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>

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
> diff --git a/drivers/media/test-drivers/visl/Makefile b/drivers/media/test-drivers/visl/Makefile
> new file mode 100644
> index 000000000000..fb4d5ae1b17f
> --- /dev/null
> +++ b/drivers/media/test-drivers/visl/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +visl-y := visl-core.o visl-video.o visl-dec.o visl-trace-points.o
> +
> +ifeq ($(CONFIG_VISL_DEBUGFS),y)
> +  visl-y += visl-debugfs.o
> +endif
> +
> +obj-$(CONFIG_VIDEO_VISL) += visl.o
> diff --git a/drivers/media/test-drivers/visl/visl-core.c b/drivers/media/test-drivers/visl/visl-core.c
> new file mode 100644
> index 000000000000..c59f88b72ea4
> --- /dev/null
> +++ b/drivers/media/test-drivers/visl/visl-core.c
> @@ -0,0 +1,532 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * A virtual stateless device for stateless uAPI development purposes.
> + *
> + * This tool's objective is to help the development and testing of userspace
> + * applications that use the V4L2 stateless API to decode media.
> + *
> + * A userspace implementation can use visl to run a decoding loop even when no
> + * hardware is available or when the kernel uAPI for the codec has not been
> + * upstreamed yet. This can reveal bugs at an early stage.
> + *
> + * This driver can also trace the contents of the V4L2 controls submitted to it.
> + * It can also dump the contents of the vb2 buffers through a debugfs
> + * interface. This is in many ways similar to the tracing infrastructure
> + * available for other popular encode/decode APIs out there and can help develop
> + * a userspace application by using another (working) one as a reference.
> + *
> + * Note that no actual decoding of video frames is performed by visl. The V4L2
> + * test pattern generator is used to write various debug information to the
> + * capture buffers instead.
> + *
> + * Copyright (c) Collabora, Ltd.
> + *
> + * Based on the vim2m driver, that is:
> + *
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * Pawel Osciak, <pawel@osciak.com>
> + * Marek Szyprowski, <m.szyprowski@samsung.com>
> + *
> + * Based on the vicodec driver, that is:
> + *
> + * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> + *
> + * Based on the Cedrus VPU driver, that is:
> + *
> + * Copyright (C) 2016 Florent Revest <florent.revest@free-electrons.com>
> + * Copyright (C) 2018 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + * Copyright (C) 2018 Bootlin
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "visl.h"
> +#include "visl-dec.h"
> +#include "visl-debugfs.h"
> +#include "visl-video.h"
> +
> +unsigned int visl_debug;
> +module_param(visl_debug, uint, 0644);
> +MODULE_PARM_DESC(visl_debug, " activates debug info");
> +
> +unsigned int visl_transtime_ms;
> +module_param(visl_transtime_ms, uint, 0644);
> +MODULE_PARM_DESC(visl_transtime_ms, " simulated process time in miliseconds.");
> +
> +/*
> + * dprintk can be slow through serial. This lets one limit the tracing to a
> + * particular number of frames
> + */
> +int visl_dprintk_frame_start = -1;
> +module_param(visl_dprintk_frame_start, int, 0);
> +MODULE_PARM_DESC(visl_dprintk_frame_start, " a frame number to start tracing with dprintk");
> +
> +unsigned int visl_dprintk_nframes;
> +module_param(visl_dprintk_nframes, uint, 0);
> +MODULE_PARM_DESC(visl_dprintk_nframes,
> +		 " the number of frames to trace with dprintk");
> +
> +unsigned int keep_bitstream_buffers;
> +module_param(keep_bitstream_buffers, uint, 0);
> +MODULE_PARM_DESC(keep_bitstream_buffers,
> +		 " keep bitstream buffers in debugfs after streaming is stopped");
> +
> +int bitstream_trace_frame_start = -1;
> +module_param(bitstream_trace_frame_start, int, 0);
> +MODULE_PARM_DESC(bitstream_trace_frame_start,
> +		 " a frame number to start dumping the bitstream through debugfs");
> +
> +unsigned int bitstream_trace_nframes;
> +module_param(bitstream_trace_nframes, uint, 0);
> +MODULE_PARM_DESC(bitstream_trace_nframes,
> +		 " the number of frames to dump the bitstream through debugfs");
> +
> +static const struct visl_ctrl_desc visl_fwht_ctrl_descs[] = {
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_FWHT_PARAMS,
> +	},
> +};
> +
> +const struct visl_ctrls visl_fwht_ctrls = {
> +	.ctrls = visl_fwht_ctrl_descs,
> +	.num_ctrls = ARRAY_SIZE(visl_fwht_ctrl_descs)
> +};
> +
> +static const struct visl_ctrl_desc visl_mpeg2_ctrl_descs[] = {
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_MPEG2_SEQUENCE,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_MPEG2_PICTURE,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_MPEG2_QUANTISATION,
> +	},
> +};
> +
> +const struct visl_ctrls visl_mpeg2_ctrls = {
> +	.ctrls = visl_mpeg2_ctrl_descs,
> +	.num_ctrls = ARRAY_SIZE(visl_mpeg2_ctrl_descs),
> +};
> +
> +static const struct visl_ctrl_desc visl_vp8_ctrl_descs[] = {
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_VP8_FRAME,
> +	},
> +};
> +
> +const struct visl_ctrls visl_vp8_ctrls = {
> +	.ctrls = visl_vp8_ctrl_descs,
> +	.num_ctrls = ARRAY_SIZE(visl_vp8_ctrl_descs),
> +};
> +
> +static const struct visl_ctrl_desc visl_vp9_ctrl_descs[] = {
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_VP9_FRAME,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_VP9_COMPRESSED_HDR,
> +	},
> +};
> +
> +const struct visl_ctrls visl_vp9_ctrls = {
> +	.ctrls = visl_vp9_ctrl_descs,
> +	.num_ctrls = ARRAY_SIZE(visl_vp9_ctrl_descs),
> +};
> +
> +static const struct visl_ctrl_desc visl_h264_ctrl_descs[] = {
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_H264_SPS,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_H264_PPS,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_H264_SCALING_MATRIX,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_H264_DECODE_MODE,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_H264_START_CODE,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_H264_SLICE_PARAMS,
> +	},
> +	{
> +		.cfg.id = V4L2_CID_STATELESS_H264_PRED_WEIGHTS,
> +	},
> +};
> +
> +const struct visl_ctrls visl_h264_ctrls = {
> +	.ctrls = visl_h264_ctrl_descs,
> +	.num_ctrls = ARRAY_SIZE(visl_h264_ctrl_descs),
> +};
> +
> +struct v4l2_ctrl *visl_find_control(struct visl_ctx *ctx, u32 id)
> +{
> +	struct v4l2_ctrl_handler *hdl = &ctx->hdl;
> +
> +	return v4l2_ctrl_find(hdl, id);
> +}
> +
> +void *visl_find_control_data(struct visl_ctx *ctx, u32 id)
> +{
> +	struct v4l2_ctrl *ctrl;
> +
> +	ctrl = visl_find_control(ctx, id);
> +	if (ctrl)
> +		return ctrl->p_cur.p;
> +
> +	return NULL;
> +}
> +
> +u32 visl_control_num_elems(struct visl_ctx *ctx, u32 id)
> +{
> +	struct v4l2_ctrl *ctrl;
> +
> +	ctrl = visl_find_control(ctx, id);
> +	if (ctrl)
> +		return ctrl->elems;
> +
> +	return 0;
> +}
> +
> +static void visl_device_release(struct video_device *vdev)
> +{
> +	struct visl_dev *dev = container_of(vdev, struct visl_dev, vfd);
> +
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +	v4l2_m2m_release(dev->m2m_dev);
> +	media_device_cleanup(&dev->mdev);
> +	visl_debugfs_deinit(dev);
> +	kfree(dev);
> +}
> +
> +static int visl_add_ctrls(struct visl_ctx *ctx, const struct visl_ctrls *ctrls)
> +{
> +	struct visl_dev *dev = ctx->dev;
> +	struct v4l2_ctrl_handler *hdl = &ctx->hdl;
> +	unsigned int i;
> +	struct v4l2_ctrl *ctrl;
> +
> +	for (i = 0; i < ctrls->num_ctrls; i++) {
> +		ctrl = v4l2_ctrl_new_custom(hdl, &ctrls->ctrls[i].cfg, NULL);
> +
> +		if (hdl->error) {
> +			v4l2_err(&dev->v4l2_dev,
> +				 "Failed to create new custom control, errno: %d\n",
> +				 hdl->error);
> +
> +			return hdl->error;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +#define VISL_CONTROLS_COUNT	ARRAY_SIZE(visl_controls)
> +
> +static int visl_init_ctrls(struct visl_ctx *ctx)
> +{
> +	struct visl_dev *dev = ctx->dev;
> +	struct v4l2_ctrl_handler *hdl = &ctx->hdl;
> +	unsigned int ctrl_cnt = 0;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < num_coded_fmts; i++)
> +		ctrl_cnt += visl_coded_fmts[i].ctrls->num_ctrls;
> +
> +	v4l2_ctrl_handler_init(hdl, ctrl_cnt);
> +	if (hdl->error) {
> +		v4l2_err(&dev->v4l2_dev,
> +			 "Failed to initialize control handler\n");
> +		return hdl->error;
> +	}
> +
> +	for (i = 0; i < num_coded_fmts; i++) {
> +		ret = visl_add_ctrls(ctx, visl_coded_fmts[i].ctrls);
> +		if (ret)
> +			goto err_free_handler;
> +	}
> +
> +	ctx->fh.ctrl_handler = hdl;
> +	v4l2_ctrl_handler_setup(hdl);
> +
> +	return 0;
> +
> +err_free_handler:
> +	v4l2_ctrl_handler_free(hdl);
> +	return ret;
> +}
> +
> +static void visl_free_ctrls(struct visl_ctx *ctx)
> +{
> +	v4l2_ctrl_handler_free(&ctx->hdl);
> +}
> +
> +static int visl_open(struct file *file)
> +{
> +	struct visl_dev *dev = video_drvdata(file);
> +	struct visl_ctx *ctx = NULL;
> +	int rc = 0;
> +
> +	if (mutex_lock_interruptible(&dev->dev_mutex))
> +		return -ERESTARTSYS;
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx) {
> +		rc = -ENOMEM;
> +		goto unlock;
> +	}
> +
> +	ctx->tpg_str_buf = kmalloc(TPG_STR_BUF_SZ, GFP_KERNEL);
> +
> +	v4l2_fh_init(&ctx->fh, video_devdata(file));
> +	file->private_data = &ctx->fh;
> +	ctx->dev = dev;
> +
> +	rc = visl_init_ctrls(ctx);
> +	if (rc)
> +		goto free_ctx;
> +
> +	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, ctx, &visl_queue_init);
> +
> +	mutex_init(&ctx->vb_mutex);
> +
> +	if (IS_ERR(ctx->fh.m2m_ctx)) {
> +		rc = PTR_ERR(ctx->fh.m2m_ctx);
> +		goto free_hdl;
> +	}
> +
> +	rc = visl_set_default_format(ctx);
> +	if (rc)
> +		goto free_m2m_ctx;
> +
> +	v4l2_fh_add(&ctx->fh);
> +
> +	dprintk(dev, "Created instance: %p, m2m_ctx: %p\n",
> +		ctx, ctx->fh.m2m_ctx);
> +
> +	mutex_unlock(&dev->dev_mutex);
> +	return rc;
> +
> +free_m2m_ctx:
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +free_hdl:
> +	visl_free_ctrls(ctx);
> +	v4l2_fh_exit(&ctx->fh);
> +free_ctx:
> +	kfree(ctx->tpg_str_buf);
> +	kfree(ctx);
> +unlock:
> +	mutex_unlock(&dev->dev_mutex);
> +	return rc;
> +}
> +
> +static int visl_release(struct file *file)
> +{
> +	struct visl_dev *dev = video_drvdata(file);
> +	struct visl_ctx *ctx = visl_file_to_ctx(file);
> +
> +	dprintk(dev, "Releasing instance %p\n", ctx);
> +
> +	tpg_free(&ctx->tpg);
> +	v4l2_fh_del(&ctx->fh);
> +	v4l2_fh_exit(&ctx->fh);
> +	visl_free_ctrls(ctx);
> +	mutex_lock(&dev->dev_mutex);
> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	mutex_unlock(&dev->dev_mutex);
> +
> +	if (!keep_bitstream_buffers)
> +		visl_debugfs_clear_bitstream(dev, ctx->capture_streamon_jiffies);
> +
> +	kfree(ctx->tpg_str_buf);
> +	kfree(ctx);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_file_operations visl_fops = {
> +	.owner		= THIS_MODULE,
> +	.open		= visl_open,
> +	.release	= visl_release,
> +	.poll		= v4l2_m2m_fop_poll,
> +	.unlocked_ioctl	= video_ioctl2,
> +	.mmap		= v4l2_m2m_fop_mmap,
> +};
> +
> +static const struct video_device visl_videodev = {
> +	.name		= VISL_NAME,
> +	.vfl_dir	= VFL_DIR_M2M,
> +	.fops		= &visl_fops,
> +	.ioctl_ops	= &visl_ioctl_ops,
> +	.minor		= -1,
> +	.release	= visl_device_release,
> +	.device_caps	= V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
> +};
> +
> +static const struct v4l2_m2m_ops visl_m2m_ops = {
> +	.device_run	= visl_device_run,
> +};
> +
> +static const struct media_device_ops visl_m2m_media_ops = {
> +	.req_validate	= visl_request_validate,
> +	.req_queue	= v4l2_m2m_request_queue,
> +};
> +
> +static int visl_probe(struct platform_device *pdev)
> +{
> +	struct visl_dev *dev;
> +	struct video_device *vfd;
> +	int ret;
> +	int rc;
> +
> +	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
> +	if (ret)
> +		goto error_visl_dev;
> +
> +	mutex_init(&dev->dev_mutex);
> +
> +	dev->vfd = visl_videodev;
> +	vfd = &dev->vfd;
> +	vfd->lock = &dev->dev_mutex;
> +	vfd->v4l2_dev = &dev->v4l2_dev;
> +
> +	video_set_drvdata(vfd, dev);
> +	v4l2_info(&dev->v4l2_dev,
> +		  "Device registered as /dev/video%d\n", vfd->num);
> +
> +	platform_set_drvdata(pdev, dev);
> +
> +	dev->m2m_dev = v4l2_m2m_init(&visl_m2m_ops);
> +	if (IS_ERR(dev->m2m_dev)) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem device\n");
> +		ret = PTR_ERR(dev->m2m_dev);
> +		dev->m2m_dev = NULL;
> +		goto error_dev;
> +	}
> +
> +	dev->mdev.dev = &pdev->dev;
> +	strscpy(dev->mdev.model, "visl", sizeof(dev->mdev.model));
> +	strscpy(dev->mdev.bus_info, "platform:visl",
> +		sizeof(dev->mdev.bus_info));
> +	media_device_init(&dev->mdev);
> +	dev->mdev.ops = &visl_m2m_media_ops;
> +	dev->v4l2_dev.mdev = &dev->mdev;
> +
> +	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
> +		goto error_m2m;
> +	}
> +
> +	ret = v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,
> +						 MEDIA_ENT_F_PROC_VIDEO_DECODER);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\n");
> +		goto error_v4l2;
> +	}
> +
> +	ret = media_device_register(&dev->mdev);
> +	if (ret) {
> +		v4l2_err(&dev->v4l2_dev, "Failed to register mem2mem media device\n");
> +		goto error_m2m_mc;
> +	}
> +
> +	rc = visl_debugfs_init(dev);
> +	if (rc)
> +		dprintk(dev, "visl_debugfs_init failed: %d\n"
> +			"Continuing without debugfs support\n", rc);
> +
> +	return 0;
> +
> +error_m2m_mc:
> +	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> +error_v4l2:
> +	video_unregister_device(&dev->vfd);
> +	/* visl_device_release called by video_unregister_device to release various objects */
> +	return ret;
> +error_m2m:
> +	v4l2_m2m_release(dev->m2m_dev);
> +error_dev:
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +error_visl_dev:
> +	kfree(dev);
> +
> +	return ret;
> +}
> +
> +static int visl_remove(struct platform_device *pdev)
> +{
> +	struct visl_dev *dev = platform_get_drvdata(pdev);
> +
> +	v4l2_info(&dev->v4l2_dev, "Removing " VISL_NAME);
> +
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	if (media_devnode_is_registered(dev->mdev.devnode)) {
> +		media_device_unregister(&dev->mdev);
> +		v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> +	}
> +#endif
> +	video_unregister_device(&dev->vfd);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver visl_pdrv = {
> +	.probe		= visl_probe,
> +	.remove		= visl_remove,
> +	.driver		= {
> +		.name	= VISL_NAME,
> +	},
> +};
> +
> +static void visl_dev_release(struct device *dev) {}
> +
> +static struct platform_device visl_pdev = {
> +	.name		= VISL_NAME,
> +	.dev.release	= visl_dev_release,
> +};
> +
> +static void __exit visl_exit(void)
> +{
> +	platform_driver_unregister(&visl_pdrv);
> +	platform_device_unregister(&visl_pdev);
> +}
> +
> +static int __init visl_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_device_register(&visl_pdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = platform_driver_register(&visl_pdrv);
> +	if (ret)
> +		platform_device_unregister(&visl_pdev);
> +
> +	return ret;
> +}
> +
> +MODULE_DESCRIPTION("Virtual stateless device");
> +MODULE_AUTHOR("Daniel Almeida <daniel.almeida@collabora.com>");
> +MODULE_LICENSE("GPL v2");
> +
> +module_init(visl_init);
> +module_exit(visl_exit);
> diff --git a/drivers/media/test-drivers/visl/visl-debugfs.c b/drivers/media/test-drivers/visl/visl-debugfs.c
> new file mode 100644
> index 000000000000..6fbfd55d6c53
> --- /dev/null
> +++ b/drivers/media/test-drivers/visl/visl-debugfs.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * A virtual stateless device for stateless uAPI development purposes.
> + *
> + * This tool's objective is to help the development and testing of userspace
> + * applications that use the V4L2 stateless API to decode media.
> + *
> + * A userspace implementation can use visl to run a decoding loop even when no
> + * hardware is available or when the kernel uAPI for the codec has not been
> + * upstreamed yet. This can reveal bugs at an early stage.
> + *
> + * This driver can also trace the contents of the V4L2 controls submitted to it.
> + * It can also dump the contents of the vb2 buffers through a debugfs
> + * interface. This is in many ways similar to the tracing infrastructure
> + * available for other popular encode/decode APIs out there and can help develop
> + * a userspace application by using another (working) one as a reference.
> + *
> + * Note that no actual decoding of video frames is performed by visl. The V4L2
> + * test pattern generator is used to write various debug information to the
> + * capture buffers instead.
> + *
> + * Copyright (c) Collabora, Ltd.
> + *
> + * Based on the vim2m driver, that is:
> + *
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * Pawel Osciak, <pawel@osciak.com>
> + * Marek Szyprowski, <m.szyprowski@samsung.com>
> + *
> + * Based on the vicodec driver, that is:
> + *
> + * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> + *
> + * Based on the Cedrus VPU driver, that is:
> + *
> + * Copyright (C) 2016 Florent Revest <florent.revest@free-electrons.com>
> + * Copyright (C) 2018 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + * Copyright (C) 2018 Bootlin
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "visl-debugfs.h"
> +
> +int visl_debugfs_init(struct visl_dev *dev)
> +{
> +	dev->debugfs_root = debugfs_create_dir("visl", NULL);
> +	INIT_LIST_HEAD(&dev->bitstream_blobs);
> +	mutex_init(&dev->bitstream_lock);
> +
> +	if (IS_ERR(dev->debugfs_root))
> +		return PTR_ERR(dev->debugfs_root);
> +
> +	return visl_debugfs_bitstream_init(dev);
> +}
> +
> +int visl_debugfs_bitstream_init(struct visl_dev *dev)
> +{
> +	dev->bitstream_debugfs = debugfs_create_dir("bitstream",
> +						    dev->debugfs_root);
> +	if (IS_ERR(dev->bitstream_debugfs))
> +		return PTR_ERR(dev->bitstream_debugfs);
> +
> +	return 0;
> +}
> +
> +void visl_trace_bitstream(struct visl_ctx *ctx, struct visl_run *run)
> +{
> +	u8 *vaddr = vb2_plane_vaddr(&run->src->vb2_buf, 0);
> +	struct visl_blob *blob;
> +	size_t data_sz = vb2_get_plane_payload(&run->dst->vb2_buf, 0);
> +	struct dentry *dentry;
> +	char name[32];
> +
> +	blob  = kzalloc(sizeof(*blob), GFP_KERNEL);
> +	if (!blob)
> +		return;
> +
> +	blob->blob.data = vzalloc(data_sz);
> +	if (!blob->blob.data)
> +		goto err_vmalloc;
> +
> +	blob->blob.size = data_sz;
> +	snprintf(name, 32, "%llu_bitstream%d",
> +		 ctx->capture_streamon_jiffies, run->src->sequence);
> +
> +	memcpy(blob->blob.data, vaddr, data_sz);
> +
> +	dentry = debugfs_create_blob(name, 0444, ctx->dev->bitstream_debugfs,
> +				     &blob->blob);
> +	if (IS_ERR(dentry))
> +		goto err_debugfs;
> +
> +	blob->dentry = dentry;
> +	blob->streamon_jiffies = ctx->capture_streamon_jiffies;
> +
> +	mutex_lock(&ctx->dev->bitstream_lock);
> +	list_add_tail(&blob->list, &ctx->dev->bitstream_blobs);
> +	mutex_unlock(&ctx->dev->bitstream_lock);
> +
> +	return;
> +
> +err_debugfs:
> +	vfree(blob->blob.data);
> +err_vmalloc:
> +	kfree(blob);
> +}
> +
> +void visl_debugfs_clear_bitstream(struct visl_dev *dev, u64 streamon_jiffies)
> +{
> +	struct visl_blob *blob;
> +	struct visl_blob *tmp;
> +
> +	mutex_lock(&dev->bitstream_lock);
> +	if (list_empty(&dev->bitstream_blobs))
> +		goto unlock;
> +
> +	list_for_each_entry_safe(blob, tmp, &dev->bitstream_blobs, list) {
> +		if (streamon_jiffies &&
> +		    streamon_jiffies != blob->streamon_jiffies)
> +			continue;
> +
> +		list_del(&blob->list);
> +		debugfs_remove(blob->dentry);
> +		vfree(blob->blob.data);
> +		kfree(blob);
> +	}
> +
> +unlock:
> +	mutex_unlock(&dev->bitstream_lock);
> +}
> +
> +void visl_debugfs_bitstream_deinit(struct visl_dev *dev)
> +{
> +	visl_debugfs_clear_bitstream(dev, 0);
> +	debugfs_remove_recursive(dev->bitstream_debugfs);
> +	dev->bitstream_debugfs = NULL;
> +}
> +
> +void visl_debugfs_deinit(struct visl_dev *dev)
> +{
> +	visl_debugfs_bitstream_deinit(dev);
> +	debugfs_remove_recursive(dev->debugfs_root);
> +	dev->debugfs_root = NULL;
> +}
> diff --git a/drivers/media/test-drivers/visl/visl-debugfs.h b/drivers/media/test-drivers/visl/visl-debugfs.h
> new file mode 100644
> index 000000000000..e14e7d72b150
> --- /dev/null
> +++ b/drivers/media/test-drivers/visl/visl-debugfs.h
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * A virtual stateless device for stateless uAPI development purposes.
> + *
> + * This tool's objective is to help the development and testing of userspace
> + * applications that use the V4L2 stateless API to decode media.
> + *
> + * A userspace implementation can use visl to run a decoding loop even when no
> + * hardware is available or when the kernel uAPI for the codec has not been
> + * upstreamed yet. This can reveal bugs at an early stage.
> + *
> + * This driver can also trace the contents of the V4L2 controls submitted to it.
> + * It can also dump the contents of the vb2 buffers through a debugfs
> + * interface. This is in many ways similar to the tracing infrastructure
> + * available for other popular encode/decode APIs out there and can help develop
> + * a userspace application by using another (working) one as a reference.
> + *
> + * Note that no actual decoding of video frames is performed by visl. The V4L2
> + * test pattern generator is used to write various debug information to the
> + * capture buffers instead.
> + *
> + * Copyright (c) Collabora, Ltd.
> + *
> + * Based on the vim2m driver, that is:
> + *
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * Pawel Osciak, <pawel@osciak.com>
> + * Marek Szyprowski, <m.szyprowski@samsung.com>
> + *
> + * Based on the vicodec driver, that is:
> + *
> + * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> + *
> + * Based on the Cedrus VPU driver, that is:
> + *
> + * Copyright (C) 2016 Florent Revest <florent.revest@free-electrons.com>
> + * Copyright (C) 2018 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + * Copyright (C) 2018 Bootlin
> + */
> +
> +#include "visl.h"
> +#include "visl-dec.h"
> +
> +#ifdef CONFIG_VISL_DEBUGFS
> +
> +int visl_debugfs_init(struct visl_dev *dev);
> +int visl_debugfs_bitstream_init(struct visl_dev *dev);
> +void visl_trace_bitstream(struct visl_ctx *ctx, struct visl_run *run);
> +void visl_debugfs_clear_bitstream(struct visl_dev *dev, u64 streamon_jiffies);
> +void visl_debugfs_bitstream_deinit(struct visl_dev *dev);
> +void visl_debugfs_deinit(struct visl_dev *dev);
> +
> +#else
> +
> +static inline int visl_debugfs_init(struct visl_dev *dev)
> +{
> +	return 0;
> +}
> +
> +static inline int visl_debugfs_bitstream_init(struct visl_dev *dev)
> +{
> +	return 0;
> +}
> +
> +static inline void visl_trace_bitstream(struct visl_ctx *ctx, struct visl_run *run) {}
> +static inline void
> +visl_debugfs_clear_bitstream(struct visl_dev *dev, u64 streamon_jiffies) {}
> +static inline void visl_debugfs_bitstream_deinit(struct visl_dev *dev) {}
> +static inline void visl_debugfs_deinit(struct visl_dev *dev) {}
> +
> +#endif
> +
> diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/test-drivers/visl/visl-dec.c
> new file mode 100644
> index 000000000000..3c68d97f87d1
> --- /dev/null
> +++ b/drivers/media/test-drivers/visl/visl-dec.c
> @@ -0,0 +1,468 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * A virtual stateless device for stateless uAPI development purposes.
> + *
> + * This tool's objective is to help the development and testing of userspace
> + * applications that use the V4L2 stateless API to decode media.
> + *
> + * A userspace implementation can use visl to run a decoding loop even when no
> + * hardware is available or when the kernel uAPI for the codec has not been
> + * upstreamed yet. This can reveal bugs at an early stage.
> + *
> + * This driver can also trace the contents of the V4L2 controls submitted to it.
> + * It can also dump the contents of the vb2 buffers through a debugfs
> + * interface. This is in many ways similar to the tracing infrastructure
> + * available for other popular encode/decode APIs out there and can help develop
> + * a userspace application by using another (working) one as a reference.
> + *
> + * Note that no actual decoding of video frames is performed by visl. The V4L2
> + * test pattern generator is used to write various debug information to the
> + * capture buffers instead.
> + *
> + * Copyright (c) Collabora, Ltd.
> + *
> + * Based on the vim2m driver, that is:
> + *
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * Pawel Osciak, <pawel@osciak.com>
> + * Marek Szyprowski, <m.szyprowski@samsung.com>
> + *
> + * Based on the vicodec driver, that is:
> + *
> + * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> + *
> + * Based on the Cedrus VPU driver, that is:
> + *
> + * Copyright (C) 2016 Florent Revest <florent.revest@free-electrons.com>
> + * Copyright (C) 2018 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + * Copyright (C) 2018 Bootlin
> + */
> +
> +#include "visl.h"
> +#include "visl-debugfs.h"
> +#include "visl-dec.h"
> +#include "visl-trace-fwht.h"
> +#include "visl-trace-mpeg2.h"
> +#include "visl-trace-vp8.h"
> +#include "visl-trace-vp9.h"
> +#include "visl-trace-h264.h"
> +
> +#include <linux/delay.h>
> +#include <linux/workqueue.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/tpg/v4l2-tpg.h>
> +
> +static void *plane_vaddr(struct tpg_data *tpg, struct vb2_buffer *buf,
> +			 u32 p, u32 bpl[TPG_MAX_PLANES], u32 h)
> +{
> +	u32 i;
> +	void *vbuf;
> +
> +	if (p == 0 || tpg_g_buffers(tpg) > 1)
> +		return vb2_plane_vaddr(buf, p);
> +	vbuf = vb2_plane_vaddr(buf, 0);
> +	for (i = 0; i < p; i++)
> +		vbuf += bpl[i] * h / tpg->vdownsampling[i];
> +	return vbuf;
> +}
> +
> +static void visl_get_ref_frames(struct visl_ctx *ctx, u8 *buf,
> +				__kernel_size_t buflen, struct visl_run *run)
> +{
> +	struct vb2_queue *cap_q = &ctx->fh.m2m_ctx->cap_q_ctx.q;
> +	char header[] = "Reference frames:\n";
> +	u32 i;
> +	u32 len;
> +
> +	len = scnprintf(buf, buflen, header);
> +	buf += len;
> +	buflen -= len;
> +
> +	switch (ctx->current_codec) {
> +	case VISL_CODEC_NONE:
> +		break;
> +
> +	case VISL_CODEC_FWHT: {
> +		scnprintf(buf, buflen, "backwards_ref_ts: %lld, vb2_idx: %d",
> +			  run->fwht.params->backward_ref_ts,
> +			  vb2_find_timestamp(cap_q, run->fwht.params->backward_ref_ts, 0));
> +		break;
> +	}
> +
> +	case VISL_CODEC_MPEG2: {
> +		scnprintf(buf, buflen,
> +			  "backward_ref_ts: %llu, vb2_idx: %d\n"
> +			  "forward_ref_ts: %llu, vb2_idx: %d\n",
> +			  run->mpeg2.pic->backward_ref_ts,
> +			  vb2_find_timestamp(cap_q, run->mpeg2.pic->backward_ref_ts, 0),
> +			  run->mpeg2.pic->forward_ref_ts,
> +			  vb2_find_timestamp(cap_q, run->mpeg2.pic->forward_ref_ts, 0));
> +		break;
> +	}
> +
> +	case VISL_CODEC_VP8: {
> +		scnprintf(buf, buflen,
> +			  "last_ref_ts: %llu, vb2_idx: %d\n"
> +			  "golden_ref_ts: %llu, vb2_idx: %d\n"
> +			  "alt_ref_ts: %llu, vb2_idx: %d\n",
> +			  run->vp8.frame->last_frame_ts,
> +			  vb2_find_timestamp(cap_q, run->vp8.frame->last_frame_ts, 0),
> +			  run->vp8.frame->golden_frame_ts,
> +			  vb2_find_timestamp(cap_q, run->vp8.frame->golden_frame_ts, 0),
> +			  run->vp8.frame->alt_frame_ts,
> +			  vb2_find_timestamp(cap_q, run->vp8.frame->alt_frame_ts, 0));
> +		break;
> +	}
> +
> +	case VISL_CODEC_VP9: {
> +		scnprintf(buf, buflen,
> +			  "last_ref_ts: %llu, vb2_idx: %d\n"
> +			  "golden_ref_ts: %llu, vb2_idx: %d\n"
> +			  "alt_ref_ts: %llu, vb2_idx: %d\n",
> +			  run->vp9.frame->last_frame_ts,
> +			  vb2_find_timestamp(cap_q, run->vp9.frame->last_frame_ts, 0),
> +			  run->vp9.frame->golden_frame_ts,
> +			  vb2_find_timestamp(cap_q, run->vp9.frame->golden_frame_ts, 0),
> +			  run->vp9.frame->alt_frame_ts,
> +			  vb2_find_timestamp(cap_q, run->vp9.frame->alt_frame_ts, 0));
> +		break;
> +	}
> +	case VISL_CODEC_H264: {
> +		char entry[] = "dpb[%d]:%u, vb2_index: %d\n";
> +
> +		for (i = 0; i < ARRAY_SIZE(run->h264.dpram->dpb); i++) {
> +			len = scnprintf(buf, buflen, entry, i,
> +					run->h264.dpram->dpb[i].reference_ts,
> +					vb2_find_timestamp(cap_q,
> +							   run->h264.dpram->dpb[i].reference_ts,
> +							   0));
> +			buf += len;
> +			buflen -= len;
> +		}
> +
> +		break;
> +	}
> +	}
> +}
> +
> +static char *visl_get_vb2_state(enum vb2_buffer_state state)
> +{
> +	switch (state) {
> +	case VB2_BUF_STATE_DEQUEUED:
> +		return "Dequeued";
> +	case VB2_BUF_STATE_IN_REQUEST:
> +		return "In request";
> +	case VB2_BUF_STATE_PREPARING:
> +		return "Preparing";
> +	case VB2_BUF_STATE_QUEUED:
> +		return "Queued";
> +	case VB2_BUF_STATE_ACTIVE:
> +		return "Active";
> +	case VB2_BUF_STATE_DONE:
> +		return "Done";
> +	case VB2_BUF_STATE_ERROR:
> +		return "Error";
> +	default:
> +		return "";
> +	}
> +}
> +
> +static int visl_fill_bytesused(struct vb2_v4l2_buffer *v4l2_vb2_buf, char *buf, size_t bufsz)
> +{
> +	int len = 0;
> +	u32 i;
> +
> +	for (i = 0; i < v4l2_vb2_buf->vb2_buf.num_planes; i++)
> +		len += scnprintf(buf, bufsz,
> +				"bytesused[%u]: %u length[%u]: %u data_offset[%u]: %u",
> +				i, v4l2_vb2_buf->planes[i].bytesused,
> +				i, v4l2_vb2_buf->planes[i].length,
> +				i, v4l2_vb2_buf->planes[i].data_offset);
> +
> +	return len;
> +}
> +
> +static void visl_tpg_fill_sequence(struct visl_ctx *ctx,
> +				   struct visl_run *run, char buf[], size_t bufsz)
> +{
> +	u32 stream_ms;
> +
> +	stream_ms = jiffies_to_msecs(get_jiffies_64() - ctx->capture_streamon_jiffies);
> +
> +	scnprintf(buf, bufsz,
> +		  "stream time: %02d:%02d:%02d:%03d sequence:%u timestamp:%lld field:%s",
> +		  (stream_ms / (60 * 60 * 1000)) % 24,
> +		  (stream_ms / (60 * 1000)) % 60,
> +		  (stream_ms / 1000) % 60,
> +		  stream_ms % 1000,
> +		  run->dst->sequence,
> +		  run->dst->vb2_buf.timestamp,
> +		  (run->dst->field == V4L2_FIELD_ALTERNATE) ?
> +		  (run->dst->field == V4L2_FIELD_TOP ?
> +		  " top" : " bottom") : "none");
> +}
> +
> +static void visl_tpg_fill(struct visl_ctx *ctx, struct visl_run *run)
> +{
> +	u8 *basep[TPG_MAX_PLANES][2];
> +	char *buf = ctx->tpg_str_buf;
> +	char *tmp = buf;
> +	char *line_str;
> +	u32 line = 1;
> +	const u32 line_height = 16;
> +	u32 len;
> +	struct vb2_queue *out_q = &ctx->fh.m2m_ctx->out_q_ctx.q;
> +	struct vb2_queue *cap_q = &ctx->fh.m2m_ctx->cap_q_ctx.q;
> +	struct v4l2_pix_format_mplane *coded_fmt = &ctx->coded_fmt.fmt.pix_mp;
> +	struct v4l2_pix_format_mplane *decoded_fmt = &ctx->decoded_fmt.fmt.pix_mp;
> +	u32 p;
> +	u32 i;
> +
> +	for (p = 0; p < tpg_g_planes(&ctx->tpg); p++) {
> +		void *vbuf = plane_vaddr(&ctx->tpg,
> +					 &run->dst->vb2_buf, p,
> +					 ctx->tpg.bytesperline,
> +					 ctx->tpg.buf_height);
> +
> +		tpg_calc_text_basep(&ctx->tpg, basep, p, vbuf);
> +		tpg_fill_plane_buffer(&ctx->tpg, 0, p, vbuf);
> +	}
> +
> +	visl_tpg_fill_sequence(ctx, run, buf, TPG_STR_BUF_SZ);
> +	tpg_gen_text(&ctx->tpg, basep, line++ * line_height, 16, buf);
> +	frame_dprintk(ctx->dev, run->dst->sequence, "%s\n", buf);
> +	frame_dprintk(ctx->dev, run->dst->sequence, "");
> +	line++;
> +
> +	visl_get_ref_frames(ctx, buf, TPG_STR_BUF_SZ, run);
> +
> +	while ((line_str = strsep(&tmp, "\n")) && strlen(line_str)) {
> +		tpg_gen_text(&ctx->tpg, basep, line++ * line_height, 16, line_str);
> +		frame_dprintk(ctx->dev, run->dst->sequence, "%s\n", line_str);
> +	}
> +
> +	frame_dprintk(ctx->dev, run->dst->sequence, "");
> +	line++;
> +
> +	scnprintf(buf,
> +		  TPG_STR_BUF_SZ,
> +		  "OUTPUT pixelformat: %c%c%c%c, resolution: %dx%d, num_planes: %d",
> +		  coded_fmt->pixelformat,
> +		  (coded_fmt->pixelformat >> 8) & 0xff,
> +		  (coded_fmt->pixelformat >> 16) & 0xff,
> +		  (coded_fmt->pixelformat >> 24) & 0xff,
> +		  coded_fmt->width,
> +		  coded_fmt->height,
> +		  coded_fmt->num_planes);
> +
> +	tpg_gen_text(&ctx->tpg, basep, line++ * line_height, 16, buf);
> +	frame_dprintk(ctx->dev, run->dst->sequence, "%s\n", buf);
> +
> +	for (i = 0; i < coded_fmt->num_planes; i++) {
> +		scnprintf(buf,
> +			  TPG_STR_BUF_SZ,
> +			  "plane[%d]: bytesperline: %d, sizeimage: %d",
> +			  i,
> +			  coded_fmt->plane_fmt[i].bytesperline,
> +			  coded_fmt->plane_fmt[i].sizeimage);
> +
> +		tpg_gen_text(&ctx->tpg, basep, line++ * line_height, 16, buf);
> +		frame_dprintk(ctx->dev, run->dst->sequence, "%s\n", buf);
> +	}
> +
> +	line++;
> +	frame_dprintk(ctx->dev, run->dst->sequence, "");
> +	scnprintf(buf, TPG_STR_BUF_SZ, "Output queue status:");
> +	tpg_gen_text(&ctx->tpg, basep, line++ * line_height, 16, buf);
> +	frame_dprintk(ctx->dev, run->dst->sequence, "%s\n", buf);
> +
> +	len = 0;
> +	for (i = 0; i < out_q->num_buffers; i++) {
> +		char entry[] = "index: %u, state: %s, request_fd: %d, ";
> +		u32 old_len = len;
> +		char *q_status = visl_get_vb2_state(out_q->bufs[i]->state);
> +
> +		len += scnprintf(&buf[len], TPG_STR_BUF_SZ - len,
> +				 entry, i, q_status,
> +				 to_vb2_v4l2_buffer(out_q->bufs[i])->request_fd);
> +
> +		len += visl_fill_bytesused(to_vb2_v4l2_buffer(out_q->bufs[i]),
> +					   &buf[len],
> +					   TPG_STR_BUF_SZ - len);
> +
> +		tpg_gen_text(&ctx->tpg, basep, line++ * line_height, 16, &buf[old_len]);
> +		frame_dprintk(ctx->dev, run->dst->sequence, "%s", &buf[old_len]);
> +	}
> +
> +	line++;
> +	frame_dprintk(ctx->dev, run->dst->sequence, "");
> +
> +	scnprintf(buf,
> +		  TPG_STR_BUF_SZ,
> +		  "CAPTURE pixelformat: %c%c%c%c, resolution: %dx%d, num_planes: %d",
> +		  decoded_fmt->pixelformat,
> +		  (decoded_fmt->pixelformat >> 8) & 0xff,
> +		  (decoded_fmt->pixelformat >> 16) & 0xff,
> +		  (decoded_fmt->pixelformat >> 24) & 0xff,
> +		  decoded_fmt->width,
> +		  decoded_fmt->height,
> +		  decoded_fmt->num_planes);
> +
> +	tpg_gen_text(&ctx->tpg, basep, line++ * line_height, 16, buf);
> +	frame_dprintk(ctx->dev, run->dst->sequence, "%s\n", buf);
> +
> +	for (i = 0; i < decoded_fmt->num_planes; i++) {
> +		scnprintf(buf,
> +			  TPG_STR_BUF_SZ,
> +			  "plane[%d]: bytesperline: %d, sizeimage: %d",
> +			  i,
> +			  decoded_fmt->plane_fmt[i].bytesperline,
> +			  decoded_fmt->plane_fmt[i].sizeimage);
> +
> +		tpg_gen_text(&ctx->tpg, basep, line++ * line_height, 16, buf);
> +		frame_dprintk(ctx->dev, run->dst->sequence, "%s\n", buf);
> +	}
> +
> +	line++;
> +	frame_dprintk(ctx->dev, run->dst->sequence, "");
> +	scnprintf(buf, TPG_STR_BUF_SZ, "Capture queue status:");
> +	tpg_gen_text(&ctx->tpg, basep, line++ * line_height, 16, buf);
> +	frame_dprintk(ctx->dev, run->dst->sequence, "%s\n", buf);
> +
> +	len = 0;
> +	for (i = 0; i < cap_q->num_buffers; i++) {
> +		u32 old_len = len;
> +		char *q_status = visl_get_vb2_state(cap_q->bufs[i]->state);
> +
> +		len += scnprintf(&buf[len], TPG_STR_BUF_SZ - len,
> +				 "index: %u, status: %s, timestamp: %llu, is_held: %d",
> +				 cap_q->bufs[i]->index, q_status,
> +				 cap_q->bufs[i]->timestamp,
> +				 to_vb2_v4l2_buffer(cap_q->bufs[i])->is_held);
> +
> +		tpg_gen_text(&ctx->tpg, basep, line++ * line_height, 16, &buf[old_len]);
> +		frame_dprintk(ctx->dev, run->dst->sequence, "%s", &buf[old_len]);
> +	}
> +}
> +
> +static void visl_trace_ctrls(struct visl_ctx *ctx, struct visl_run *run)
> +{
> +	int i;
> +
> +	switch (ctx->current_codec) {
> +	default:
> +	case VISL_CODEC_NONE:
> +		break;
> +	case VISL_CODEC_FWHT:
> +		trace_v4l2_ctrl_fwht_params(run->fwht.params);
> +		break;
> +	case VISL_CODEC_MPEG2:
> +		trace_v4l2_ctrl_mpeg2_sequence(run->mpeg2.seq);
> +		trace_v4l2_ctrl_mpeg2_picture(run->mpeg2.pic);
> +		trace_v4l2_ctrl_mpeg2_quantisation(run->mpeg2.quant);
> +		break;
> +	case VISL_CODEC_VP8:
> +		trace_v4l2_ctrl_vp8_frame(run->vp8.frame);
> +		trace_v4l2_ctrl_vp8_entropy(run->vp8.frame);
> +		break;
> +	case VISL_CODEC_VP9:
> +		trace_v4l2_ctrl_vp9_frame(run->vp9.frame);
> +		trace_v4l2_ctrl_vp9_compressed_hdr(run->vp9.probs);
> +		trace_v4l2_ctrl_vp9_compressed_coeff(run->vp9.probs);
> +		trace_v4l2_vp9_mv_probs(&run->vp9.probs->mv);
> +		break;
> +	case VISL_CODEC_H264:
> +		trace_v4l2_ctrl_h264_sps(run->h264.sps);
> +		trace_v4l2_ctrl_h264_pps(run->h264.pps);
> +		trace_v4l2_ctrl_h264_scaling_matrix(run->h264.sm);
> +		trace_v4l2_ctrl_h264_slice_params(run->h264.spram);
> +
> +		for (i = 0; i < ARRAY_SIZE(run->h264.spram->ref_pic_list0); i++)
> +			trace_v4l2_h264_ref_pic_list0(&run->h264.spram->ref_pic_list0[i], i);
> +		for (i = 0; i < ARRAY_SIZE(run->h264.spram->ref_pic_list0); i++)
> +			trace_v4l2_h264_ref_pic_list1(&run->h264.spram->ref_pic_list1[i], i);
> +
> +		trace_v4l2_ctrl_h264_decode_params(run->h264.dpram);
> +
> +		for (i = 0; i < ARRAY_SIZE(run->h264.dpram->dpb); i++)
> +			trace_v4l2_h264_dpb_entry(&run->h264.dpram->dpb[i], i);
> +		break;
> +	}
> +}
> +
> +void visl_device_run(void *priv)
> +{
> +	struct visl_ctx *ctx = priv;
> +	struct visl_run run = {};
> +	struct media_request *src_req;
> +
> +	run.src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	run.dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +
> +	/* Apply request(s) controls if needed. */
> +	src_req = run.src->vb2_buf.req_obj.req;
> +
> +	if (src_req)
> +		v4l2_ctrl_request_setup(src_req, &ctx->hdl);
> +
> +	v4l2_m2m_buf_copy_metadata(run.src, run.dst, true);
> +	run.dst->sequence = ctx->q_data[V4L2_M2M_DST].sequence++;
> +	run.src->sequence = ctx->q_data[V4L2_M2M_SRC].sequence++;
> +	run.dst->field = ctx->decoded_fmt.fmt.pix.field;
> +
> +	switch (ctx->current_codec) {
> +	default:
> +	case VISL_CODEC_NONE:
> +		break;
> +	case VISL_CODEC_FWHT:
> +		run.fwht.params = visl_find_control_data(ctx, V4L2_CID_STATELESS_FWHT_PARAMS);
> +		break;
> +	case VISL_CODEC_MPEG2:
> +		run.mpeg2.seq = visl_find_control_data(ctx, V4L2_CID_STATELESS_MPEG2_SEQUENCE);
> +		run.mpeg2.pic = visl_find_control_data(ctx, V4L2_CID_STATELESS_MPEG2_PICTURE);
> +		run.mpeg2.quant = visl_find_control_data(ctx,
> +							 V4L2_CID_STATELESS_MPEG2_QUANTISATION);
> +		break;
> +	case VISL_CODEC_VP8:
> +		run.vp8.frame = visl_find_control_data(ctx, V4L2_CID_STATELESS_VP8_FRAME);
> +		break;
> +	case VISL_CODEC_VP9:
> +		run.vp9.frame = visl_find_control_data(ctx, V4L2_CID_STATELESS_VP9_FRAME);
> +		run.vp9.probs = visl_find_control_data(ctx, V4L2_CID_STATELESS_VP9_COMPRESSED_HDR);
> +		break;
> +	case VISL_CODEC_H264:
> +		run.h264.sps = visl_find_control_data(ctx, V4L2_CID_STATELESS_H264_SPS);
> +		run.h264.pps = visl_find_control_data(ctx, V4L2_CID_STATELESS_H264_PPS);
> +		run.h264.sm = visl_find_control_data(ctx, V4L2_CID_STATELESS_H264_SCALING_MATRIX);
> +		run.h264.spram = visl_find_control_data(ctx, V4L2_CID_STATELESS_H264_SLICE_PARAMS);
> +		run.h264.dpram = visl_find_control_data(ctx, V4L2_CID_STATELESS_H264_DECODE_PARAMS);
> +		run.h264.pwht = visl_find_control_data(ctx, V4L2_CID_STATELESS_H264_PRED_WEIGHTS);
> +		break;
> +	}
> +
> +	frame_dprintk(ctx->dev, run.dst->sequence,
> +		      "Got OUTPUT buffer sequence %d, timestamp %llu\n",
> +		      run.src->sequence, run.src->vb2_buf.timestamp);
> +
> +	frame_dprintk(ctx->dev, run.dst->sequence,
> +		      "Got CAPTURE buffer sequence %d, timestamp %llu\n",
> +		      run.dst->sequence, run.dst->vb2_buf.timestamp);
> +
> +	visl_tpg_fill(ctx, &run);
> +	visl_trace_ctrls(ctx, &run);
> +
> +	if (bitstream_trace_frame_start > -1 &&
> +	    run.dst->sequence >= bitstream_trace_frame_start &&
> +	    run.dst->sequence < bitstream_trace_frame_start + bitstream_trace_nframes)
> +		visl_trace_bitstream(ctx, &run);
> +
> +	/* Complete request(s) controls if needed. */
> +	if (src_req)
> +		v4l2_ctrl_request_complete(src_req, &ctx->hdl);
> +
> +	if (visl_transtime_ms)
> +		usleep_range(visl_transtime_ms * 1000, 2 * visl_transtime_ms * 1000);
> +
> +	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev,
> +					 ctx->fh.m2m_ctx, VB2_BUF_STATE_DONE);
> +}
> diff --git a/drivers/media/test-drivers/visl/visl-dec.h b/drivers/media/test-drivers/visl/visl-dec.h
> new file mode 100644
> index 000000000000..56a550a8f747
> --- /dev/null
> +++ b/drivers/media/test-drivers/visl/visl-dec.h
> @@ -0,0 +1,100 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * A virtual stateless device for stateless uAPI development purposes.
> + *
> + * This tool's objective is to help the development and testing of userspace
> + * applications that use the V4L2 stateless API to decode media.
> + *
> + * A userspace implementation can use visl to run a decoding loop even when no
> + * hardware is available or when the kernel uAPI for the codec has not been
> + * upstreamed yet. This can reveal bugs at an early stage.
> + *
> + * This driver can also trace the contents of the V4L2 controls submitted to it.
> + * It can also dump the contents of the vb2 buffers through a debugfs
> + * interface. This is in many ways similar to the tracing infrastructure
> + * available for other popular encode/decode APIs out there and can help develop
> + * a userspace application by using another (working) one as a reference.
> + *
> + * Note that no actual decoding of video frames is performed by visl. The V4L2
> + * test pattern generator is used to write various debug information to the
> + * capture buffers instead.
> + *
> + * Copyright (c) Collabora, Ltd.
> + *
> + * Based on the vim2m driver, that is:
> + *
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * Pawel Osciak, <pawel@osciak.com>
> + * Marek Szyprowski, <m.szyprowski@samsung.com>
> + *
> + * Based on the vicodec driver, that is:
> + *
> + * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> + *
> + * Based on the Cedrus VPU driver, that is:
> + *
> + * Copyright (C) 2016 Florent Revest <florent.revest@free-electrons.com>
> + * Copyright (C) 2018 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + * Copyright (C) 2018 Bootlin
> + */
> +
> +#ifndef _VISL_DEC_H_
> +#define _VISL_DEC_H_
> +
> +#include "visl.h"
> +
> +struct visl_av1_run {
> +	const struct v4l2_ctrl_av1_sequence *sequence;
> +	const struct v4l2_ctrl_av1_frame_header *frame_header;
> +	const struct v4l2_ctrl_av1_tile_group *tile_group;
> +	const struct v4l2_ctrl_av1_tile_group_entry *tg_entries;
> +	const struct v4l2_ctrl_av1_film_grain *film_grain;
> +};
> +
> +struct visl_fwht_run {
> +	const struct v4l2_ctrl_fwht_params *params;
> +};
> +
> +struct visl_mpeg2_run {
> +	const struct v4l2_ctrl_mpeg2_sequence *seq;
> +	const struct v4l2_ctrl_mpeg2_picture *pic;
> +	const struct v4l2_ctrl_mpeg2_quantisation *quant;
> +};
> +
> +struct visl_vp8_run {
> +	const struct v4l2_ctrl_vp8_frame *frame;
> +};
> +
> +struct visl_vp9_run {
> +	const struct v4l2_ctrl_vp9_frame *frame;
> +	const struct v4l2_ctrl_vp9_compressed_hdr *probs;
> +};
> +
> +struct visl_h264_run {
> +	const struct v4l2_ctrl_h264_sps *sps;
> +	const struct v4l2_ctrl_h264_pps *pps;
> +	const struct v4l2_ctrl_h264_scaling_matrix *sm;
> +	const struct v4l2_ctrl_h264_slice_params *spram;
> +	const struct v4l2_ctrl_h264_decode_params *dpram;
> +	const struct v4l2_ctrl_h264_pred_weights *pwht;
> +};
> +
> +struct visl_run {
> +	struct vb2_v4l2_buffer	*src;
> +	struct vb2_v4l2_buffer	*dst;
> +
> +	union {
> +		struct visl_fwht_run	fwht;
> +		struct visl_mpeg2_run	mpeg2;
> +		struct visl_vp8_run	vp8;
> +		struct visl_vp9_run	vp9;
> +		struct visl_h264_run	h264;
> +	};
> +};
> +
> +int visl_dec_start(struct visl_ctx *ctx);
> +int visl_dec_stop(struct visl_ctx *ctx);
> +int visl_job_ready(void *priv);
> +void visl_device_run(void *priv);
> +
> +#endif /* _VISL_DEC_H_ */
> diff --git a/drivers/media/test-drivers/visl/visl-trace-fwht.h b/drivers/media/test-drivers/visl/visl-trace-fwht.h
> new file mode 100644
> index 000000000000..76034449e5b7
> --- /dev/null
> +++ b/drivers/media/test-drivers/visl/visl-trace-fwht.h
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +#if !defined(_VISL_TRACE_FWHT_H_) || defined(TRACE_HEADER_MULTI_READ)
> +#define _VISL_TRACE_FWHT_H_
> +
> +#include <linux/tracepoint.h>
> +#include "visl.h"
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM visl_fwht_controls
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_fwht_params_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_fwht_params *p),
> +	TP_ARGS(p),
> +	TP_STRUCT__entry(
> +			 __field(u64, backward_ref_ts)
> +			 __field(u32, version)
> +			 __field(u32, width)
> +			 __field(u32, height)
> +			 __field(u32, flags)
> +			 __field(u32, colorspace)
> +			 __field(u32, xfer_func)
> +			 __field(u32, ycbcr_enc)
> +			 __field(u32, quantization)
> +			 ),
> +	TP_fast_assign(
> +		       __entry->backward_ref_ts = p->backward_ref_ts;
> +		       __entry->version = p->version;
> +		       __entry->width = p->width;
> +		       __entry->height = p->height;
> +		       __entry->flags = p->flags;
> +		       __entry->colorspace = p->colorspace;
> +		       __entry->xfer_func = p->xfer_func;
> +		       __entry->ycbcr_enc = p->ycbcr_enc;
> +		       __entry->quantization = p->quantization;
> +		       ),
> +	TP_printk("backward_ref_ts %llu version %u width %u height %u flags %s colorspace %u xfer_func %u ycbcr_enc %u quantization %u",
> +		  __entry->backward_ref_ts, __entry->version, __entry->width, __entry->height,
> +		  __print_flags(__entry->flags, "|",
> +		  {V4L2_FWHT_FL_IS_INTERLACED, "IS_INTERLACED"},
> +		  {V4L2_FWHT_FL_IS_BOTTOM_FIRST, "IS_BOTTOM_FIRST"},
> +		  {V4L2_FWHT_FL_IS_ALTERNATE, "IS_ALTERNATE"},
> +		  {V4L2_FWHT_FL_IS_BOTTOM_FIELD, "IS_BOTTOM_FIELD"},
> +		  {V4L2_FWHT_FL_LUMA_IS_UNCOMPRESSED, "LUMA_IS_UNCOMPRESSED"},
> +		  {V4L2_FWHT_FL_CB_IS_UNCOMPRESSED, "CB_IS_UNCOMPRESSED"},
> +		  {V4L2_FWHT_FL_CR_IS_UNCOMPRESSED, "CR_IS_UNCOMPRESSED"},
> +		  {V4L2_FWHT_FL_ALPHA_IS_UNCOMPRESSED, "ALPHA_IS_UNCOMPRESSED"},
> +		  {V4L2_FWHT_FL_I_FRAME, "I_FRAME"},
> +		  {V4L2_FWHT_FL_PIXENC_HSV, "PIXENC_HSV"},
> +		  {V4L2_FWHT_FL_PIXENC_RGB, "PIXENC_RGB"},
> +		  {V4L2_FWHT_FL_PIXENC_YUV, "PIXENC_YUV"}),
> +		  __entry->colorspace, __entry->xfer_func, __entry->ycbcr_enc,
> +		  __entry->quantization)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_fwht_params_tmpl, v4l2_ctrl_fwht_params,
> +	TP_PROTO(const struct v4l2_ctrl_fwht_params *p),
> +	TP_ARGS(p)
> +);
> +
> +#endif
> +
> +#undef TRACE_INCLUDE_PATH
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_PATH ../../drivers/media/test-drivers/visl
> +#define TRACE_INCLUDE_FILE visl-trace-fwht
> +#include <trace/define_trace.h>
> diff --git a/drivers/media/test-drivers/visl/visl-trace-h264.h b/drivers/media/test-drivers/visl/visl-trace-h264.h
> new file mode 100644
> index 000000000000..0026a0dd5ce9
> --- /dev/null
> +++ b/drivers/media/test-drivers/visl/visl-trace-h264.h
> @@ -0,0 +1,349 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +#if !defined(_VISL_TRACE_H264_H_) || defined(TRACE_HEADER_MULTI_READ)
> +#define _VISL_TRACE_H264_H_
> +
> +#include <linux/tracepoint.h>
> +#include "visl.h"
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM visl_h264_controls
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_h264_sps_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_h264_sps *s),
> +	TP_ARGS(s),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_sps, s)),
> +	TP_fast_assign(__entry->s = *s),
> +	TP_printk("\nprofile_idc %u\n"
> +		  "constraint_set_flags %s\n"
> +		  "level_idc %u\n"
> +		  "seq_parameter_set_id %u\n"
> +		  "chroma_format_idc %u\n"
> +		  "bit_depth_luma_minus8 %u\n"
> +		  "bit_depth_chroma_minus8 %u\n"
> +		  "log2_max_frame_num_minus4 %u\n"
> +		  "pic_order_cnt_type %u\n"
> +		  "log2_max_pic_order_cnt_lsb_minus4 %u\n"
> +		  "max_num_ref_frames %u\n"
> +		  "num_ref_frames_in_pic_order_cnt_cycle %u\n"
> +		  "offset_for_ref_frame %s\n"
> +		  "offset_for_non_ref_pic %d\n"
> +		  "offset_for_top_to_bottom_field %d\n"
> +		  "pic_width_in_mbs_minus1 %u\n"
> +		  "pic_height_in_map_units_minus1 %u\n"
> +		  "flags %s",
> +		  __entry->s.profile_idc,
> +		  __print_flags(__entry->s.constraint_set_flags, "|",
> +		  {V4L2_H264_SPS_CONSTRAINT_SET0_FLAG, "CONSTRAINT_SET0_FLAG"},
> +		  {V4L2_H264_SPS_CONSTRAINT_SET1_FLAG, "CONSTRAINT_SET1_FLAG"},
> +		  {V4L2_H264_SPS_CONSTRAINT_SET2_FLAG, "CONSTRAINT_SET2_FLAG"},
> +		  {V4L2_H264_SPS_CONSTRAINT_SET3_FLAG, "CONSTRAINT_SET3_FLAG"},
> +		  {V4L2_H264_SPS_CONSTRAINT_SET4_FLAG, "CONSTRAINT_SET4_FLAG"},
> +		  {V4L2_H264_SPS_CONSTRAINT_SET5_FLAG, "CONSTRAINT_SET5_FLAG"}),
> +		  __entry->s.level_idc,
> +		  __entry->s.seq_parameter_set_id,
> +		  __entry->s.chroma_format_idc,
> +		  __entry->s.bit_depth_luma_minus8,
> +		  __entry->s.bit_depth_chroma_minus8,
> +		  __entry->s.log2_max_frame_num_minus4,
> +		  __entry->s.pic_order_cnt_type,
> +		  __entry->s.log2_max_pic_order_cnt_lsb_minus4,
> +		  __entry->s.max_num_ref_frames,
> +		  __entry->s.num_ref_frames_in_pic_order_cnt_cycle,
> +		  __print_array(__entry->s.offset_for_ref_frame,
> +		  		ARRAY_SIZE(__entry->s.offset_for_ref_frame),
> +		  		sizeof(__entry->s.offset_for_ref_frame[0])),
> +		  __entry->s.offset_for_non_ref_pic,
> +		  __entry->s.offset_for_top_to_bottom_field,
> +		  __entry->s.pic_width_in_mbs_minus1,
> +		  __entry->s.pic_height_in_map_units_minus1,
> +		  __print_flags(__entry->s.flags, "|",
> +		  {V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE, "SEPARATE_COLOUR_PLANE"},
> +		  {V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS, "QPPRIME_Y_ZERO_TRANSFORM_BYPASS"},
> +		  {V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO, "DELTA_PIC_ORDER_ALWAYS_ZERO"},
> +		  {V4L2_H264_SPS_FLAG_GAPS_IN_FRAME_NUM_VALUE_ALLOWED, "GAPS_IN_FRAME_NUM_VALUE_ALLOWED"},
> +		  {V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY, "FRAME_MBS_ONLY"},
> +		  {V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD, "MB_ADAPTIVE_FRAME_FIELD"},
> +		  {V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE, "DIRECT_8X8_INFERENCE"}
> +		  ))
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pps_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_h264_pps *p),
> +	TP_ARGS(p),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_pps, p)),
> +	TP_fast_assign(__entry->p = *p),
> +	TP_printk("\npic_parameter_set_id %u\n"
> +		  "seq_parameter_set_id %u\n"
> +		  "num_slice_groups_minus1 %u\n"
> +		  "num_ref_idx_l0_default_active_minus1 %u\n"
> +		  "num_ref_idx_l1_default_active_minus1 %u\n"
> +		  "weighted_bipred_idc %u\n"
> +		  "pic_init_qp_minus26 %d\n"
> +		  "pic_init_qs_minus26 %d\n"
> +		  "chroma_qp_index_offset %d\n"
> +		  "second_chroma_qp_index_offset %d\n"
> +		  "flags %s",
> +		  __entry->p.pic_parameter_set_id,
> +		  __entry->p.seq_parameter_set_id,
> +		  __entry->p.num_slice_groups_minus1,
> +		  __entry->p.num_ref_idx_l0_default_active_minus1,
> +		  __entry->p.num_ref_idx_l1_default_active_minus1,
> +		  __entry->p.weighted_bipred_idc,
> +		  __entry->p.pic_init_qp_minus26,
> +		  __entry->p.pic_init_qs_minus26,
> +		  __entry->p.chroma_qp_index_offset,
> +		  __entry->p.second_chroma_qp_index_offset,
> +		  __print_flags(__entry->p.flags, "|",
> +		  {V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE, "ENTROPY_CODING_MODE"},
> +		  {V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT, "BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT"},
> +		  {V4L2_H264_PPS_FLAG_WEIGHTED_PRED, "WEIGHTED_PRED"},
> +		  {V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT, "DEBLOCKING_FILTER_CONTROL_PRESENT"},
> +		  {V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED, "CONSTRAINED_INTRA_PRED"},
> +		  {V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT, "REDUNDANT_PIC_CNT_PRESENT"},
> +		  {V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE, "TRANSFORM_8X8_MODE"},
> +		  {V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT, "SCALING_MATRIX_PRESENT"}
> +		  ))
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_h264_scaling_matrix_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_h264_scaling_matrix *s),
> +	TP_ARGS(s),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_scaling_matrix, s)),
> +	TP_fast_assign(__entry->s = *s),
> +	TP_printk("\nscaling_list_4x4 {%s}\nscaling_list_8x8 {%s}",
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->s.scaling_list_4x4,
> +				   sizeof(__entry->s.scaling_list_4x4),
> +				   false),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->s.scaling_list_8x8,
> +				   sizeof(__entry->s.scaling_list_8x8),
> +				   false)
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_h264_pred_weights_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_h264_pred_weights *p),
> +	TP_ARGS(p),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_pred_weights, p)),
> +	TP_fast_assign(__entry->p = *p),
> +	TP_printk("\nluma_log2_weight_denom %u\n"
> +		  "chroma_log2_weight_denom %u\n"
> +		  "weight_factor[0].luma_weight %s\n"
> +		  "weight_factor[0].luma_offset %s\n"
> +		  "weight_factor[0].chroma_weight {%s}\n"
> +		  "weight_factor[0].chroma_offset {%s}\n"
> +		  "weight_factor[1].luma_weight %s\n"
> +		  "weight_factor[1].luma_offset %s\n"
> +		  "weight_factor[1].chroma_weight {%s}\n"
> +		  "weight_factor[1].chroma_offset {%s}\n",
> +		  __entry->p.luma_log2_weight_denom,
> +		  __entry->p.chroma_log2_weight_denom,
> +		  __print_array(__entry->p.weight_factors[0].luma_weight,
> +		  		ARRAY_SIZE(__entry->p.weight_factors[0].luma_weight),
> +		  		sizeof(__entry->p.weight_factors[0].luma_weight[0])),
> +		  __print_array(__entry->p.weight_factors[0].luma_offset,
> +		  		ARRAY_SIZE(__entry->p.weight_factors[0].luma_offset),
> +		  		sizeof(__entry->p.weight_factors[0].luma_offset[0])),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->p.weight_factors[0].chroma_weight,
> +				   sizeof(__entry->p.weight_factors[0].chroma_weight),
> +				   false),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->p.weight_factors[0].chroma_offset,
> +				   sizeof(__entry->p.weight_factors[0].chroma_offset),
> +				   false),
> +		  __print_array(__entry->p.weight_factors[1].luma_weight,
> +		  		ARRAY_SIZE(__entry->p.weight_factors[1].luma_weight),
> +		  		sizeof(__entry->p.weight_factors[1].luma_weight[0])),
> +		  __print_array(__entry->p.weight_factors[1].luma_offset,
> +		  		ARRAY_SIZE(__entry->p.weight_factors[1].luma_offset),
> +		  		sizeof(__entry->p.weight_factors[1].luma_offset[0])),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->p.weight_factors[1].chroma_weight,
> +				   sizeof(__entry->p.weight_factors[1].chroma_weight),
> +				   false),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->p.weight_factors[1].chroma_offset,
> +				   sizeof(__entry->p.weight_factors[1].chroma_offset),
> +				   false)
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_h264_slice_params_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_h264_slice_params *s),
> +	TP_ARGS(s),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_slice_params, s)),
> +	TP_fast_assign(__entry->s = *s),
> +	TP_printk("\nheader_bit_size %u\n"
> +		  "first_mb_in_slice %u\n"
> +		  "slice_type %s\n"
> +		  "colour_plane_id %u\n"
> +		  "redundant_pic_cnt %u\n"
> +		  "cabac_init_idc %u\n"
> +		  "slice_qp_delta %d\n"
> +		  "slice_qs_delta %d\n"
> +		  "disable_deblocking_filter_idc %u\n"
> +		  "slice_alpha_c0_offset_div2 %u\n"
> +		  "slice_beta_offset_div2 %u\n"
> +		  "num_ref_idx_l0_active_minus1 %u\n"
> +		  "num_ref_idx_l1_active_minus1 %u\n"
> +		  "flags %s",
> +		  __entry->s.header_bit_size,
> +		  __entry->s.first_mb_in_slice,
> +		  __print_symbolic(__entry->s.slice_type,
> +		  {V4L2_H264_SLICE_TYPE_P, "P"},
> +		  {V4L2_H264_SLICE_TYPE_B, "B"},
> +		  {V4L2_H264_SLICE_TYPE_I, "I"},
> +		  {V4L2_H264_SLICE_TYPE_SP, "SP"},
> +		  {V4L2_H264_SLICE_TYPE_SI, "SI"}),
> +		  __entry->s.colour_plane_id,
> +		  __entry->s.redundant_pic_cnt,
> +		  __entry->s.cabac_init_idc,
> +		  __entry->s.slice_qp_delta,
> +		  __entry->s.slice_qs_delta,
> +		  __entry->s.disable_deblocking_filter_idc,
> +		  __entry->s.slice_alpha_c0_offset_div2,
> +		  __entry->s.slice_beta_offset_div2,
> +		  __entry->s.num_ref_idx_l0_active_minus1,
> +		  __entry->s.num_ref_idx_l1_active_minus1,
> +		  __print_flags(__entry->s.flags, "|",
> +		  {V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED, "DIRECT_SPATIAL_MV_PRED"},
> +		  {V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH, "SP_FOR_SWITCH"})
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_h264_reference_tmpl,
> +	TP_PROTO(const struct v4l2_h264_reference *r, int i),
> +	TP_ARGS(r, i),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_h264_reference, r)
> +			 __field(int, i)),
> +	TP_fast_assign(__entry->r = *r; __entry->i = i;),
> +	TP_printk("[%d]: fields %s index %u",
> +		  __entry->i,
> +		  __print_flags(__entry->r.fields, "|",
> +		  {V4L2_H264_TOP_FIELD_REF, "TOP_FIELD_REF"},
> +		  {V4L2_H264_BOTTOM_FIELD_REF, "BOTTOM_FIELD_REF"},
> +		  {V4L2_H264_FRAME_REF, "FRAME_REF"}),
> +		  __entry->r.index
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_h264_decode_params_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_h264_decode_params *d),
> +	TP_ARGS(d),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_h264_decode_params, d)),
> +	TP_fast_assign(__entry->d = *d),
> +	TP_printk("\nnal_ref_idc %u\n"
> +		  "frame_num %u\n"
> +		  "top_field_order_cnt %d\n"
> +		  "bottom_field_order_cnt %d\n"
> +		  "idr_pic_id %u\n"
> +		  "pic_order_cnt_lsb %u\n"
> +		  "delta_pic_order_cnt_bottom %d\n"
> +		  "delta_pic_order_cnt0 %d\n"
> +		  "delta_pic_order_cnt1 %d\n"
> +		  "dec_ref_pic_marking_bit_size %u\n"
> +		  "pic_order_cnt_bit_size %u\n"
> +		  "slice_group_change_cycle %u\n"
> +		  "flags %s\n",
> +		  __entry->d.nal_ref_idc,
> +		  __entry->d.frame_num,
> +		  __entry->d.top_field_order_cnt,
> +		  __entry->d.bottom_field_order_cnt,
> +		  __entry->d.idr_pic_id,
> +		  __entry->d.pic_order_cnt_lsb,
> +		  __entry->d.delta_pic_order_cnt_bottom,
> +		  __entry->d.delta_pic_order_cnt0,
> +		  __entry->d.delta_pic_order_cnt1,
> +		  __entry->d.dec_ref_pic_marking_bit_size,
> +		  __entry->d.pic_order_cnt_bit_size,
> +		  __entry->d.slice_group_change_cycle,
> +		  __print_flags(__entry->d.flags, "|",
> +		  {V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC, "IDR_PIC"},
> +		  {V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC, "FIELD_PIC"},
> +		  {V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD, "BOTTOM_FIELD"},
> +		  {V4L2_H264_DECODE_PARAM_FLAG_PFRAME, "PFRAME"},
> +		  {V4L2_H264_DECODE_PARAM_FLAG_BFRAME, "BFRAME"})
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_h264_dpb_entry_tmpl,
> +	TP_PROTO(const struct v4l2_h264_dpb_entry *e, int i),
> +	TP_ARGS(e, i),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_h264_dpb_entry, e)
> +			 __field(int, i)),
> +	TP_fast_assign(__entry->e = *e; __entry->i = i;),
> +	TP_printk("[%d]: reference_ts %llu, pic_num %u frame_num %u fields %s "
> +		  "top_field_order_cnt %d bottom_field_order_cnt %d flags %s",
> +		  __entry->i,
> +		  __entry->e.reference_ts,
> +		  __entry->e.pic_num,
> +		  __entry->e.frame_num,
> +		  __print_flags(__entry->e.fields, "|",
> +		  {V4L2_H264_TOP_FIELD_REF, "TOP_FIELD_REF"},
> +		  {V4L2_H264_BOTTOM_FIELD_REF, "BOTTOM_FIELD_REF"},
> +		  {V4L2_H264_FRAME_REF, "FRAME_REF"}),
> +		  __entry->e.top_field_order_cnt,
> +		  __entry->e.bottom_field_order_cnt,
> +		  __print_flags(__entry->e.flags, "|",
> +		  {V4L2_H264_DPB_ENTRY_FLAG_VALID, "VALID"},
> +		  {V4L2_H264_DPB_ENTRY_FLAG_ACTIVE, "ACTIVE"},
> +		  {V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM, "LONG_TERM"},
> +		  {V4L2_H264_DPB_ENTRY_FLAG_FIELD, "FIELD"})
> +
> +	)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_h264_sps_tmpl, v4l2_ctrl_h264_sps,
> +	TP_PROTO(const struct v4l2_ctrl_h264_sps *s),
> +	TP_ARGS(s)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_h264_pps_tmpl, v4l2_ctrl_h264_pps,
> +	TP_PROTO(const struct v4l2_ctrl_h264_pps *p),
> +	TP_ARGS(p)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_h264_scaling_matrix_tmpl, v4l2_ctrl_h264_scaling_matrix,
> +	TP_PROTO(const struct v4l2_ctrl_h264_scaling_matrix *s),
> +	TP_ARGS(s)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_h264_pred_weights_tmpl, v4l2_ctrl_h264_pred_weights,
> +	TP_PROTO(const struct v4l2_ctrl_h264_pred_weights *p),
> +	TP_ARGS(p)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_h264_slice_params_tmpl, v4l2_ctrl_h264_slice_params,
> +	TP_PROTO(const struct v4l2_ctrl_h264_slice_params *s),
> +	TP_ARGS(s)
> +);
> +
> +DEFINE_EVENT(v4l2_h264_reference_tmpl, v4l2_h264_ref_pic_list0,
> +	TP_PROTO(const struct v4l2_h264_reference *r, int i),
> +	TP_ARGS(r, i)
> +);
> +
> +DEFINE_EVENT(v4l2_h264_reference_tmpl, v4l2_h264_ref_pic_list1,
> +	TP_PROTO(const struct v4l2_h264_reference *r, int i),
> +	TP_ARGS(r, i)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_h264_decode_params_tmpl, v4l2_ctrl_h264_decode_params,
> +	TP_PROTO(const struct v4l2_ctrl_h264_decode_params *d),
> +	TP_ARGS(d)
> +);
> +
> +DEFINE_EVENT(v4l2_h264_dpb_entry_tmpl, v4l2_h264_dpb_entry,
> +	TP_PROTO(const struct v4l2_h264_dpb_entry *e, int i),
> +	TP_ARGS(e, i)
> +);
> +
> +#endif
> +
> +#undef TRACE_INCLUDE_PATH
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_PATH ../../drivers/media/test-drivers/visl
> +#define TRACE_INCLUDE_FILE visl-trace-h264
> +#include <trace/define_trace.h>
> diff --git a/drivers/media/test-drivers/visl/visl-trace-mpeg2.h b/drivers/media/test-drivers/visl/visl-trace-mpeg2.h
> new file mode 100644
> index 000000000000..889a3ba56502
> --- /dev/null
> +++ b/drivers/media/test-drivers/visl/visl-trace-mpeg2.h
> @@ -0,0 +1,99 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +#if !defined(_VISL_TRACE_MPEG2_H_) || defined(TRACE_HEADER_MULTI_READ)
> +#define _VISL_TRACE_MPEG2_H_
> +
> +#include <linux/tracepoint.h>
> +#include "visl.h"
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM visl_mpeg2_controls
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_seq_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_mpeg2_sequence *s),
> +	TP_ARGS(s),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_sequence, s)),
> +	TP_fast_assign(__entry->s = *s;),
> +	TP_printk("\nhorizontal_size %u \nvertical_size %u\nvbv_buffer_size %u \n"
> +		  "profile_and_level_indication %u \nchroma_format %u\nflags %s\n",
> +		  __entry->s.horizontal_size,
> +		  __entry->s.vertical_size,
> +		  __entry->s.vbv_buffer_size,
> +		  __entry->s.profile_and_level_indication,
> +		  __entry->s.chroma_format,
> +		  __print_flags(__entry->s.flags, "|",
> +		  {V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE, "PROGRESSIVE"})
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_pic_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_mpeg2_picture *p),
> +	TP_ARGS(p),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_picture, p)),
> +	TP_fast_assign(__entry->p = *p;),
> +	TP_printk("\nbackward_ref_ts %llu \nforward_ref_ts %llu \nflags %s \nf_code {%s} \n"
> +		  "picture_coding_type: %u \npicture_structure %u \nintra_dc_precision %u\n",
> +		  __entry->p.backward_ref_ts,
> +		  __entry->p.forward_ref_ts,
> +		  __print_flags(__entry->p.flags, "|",
> +		  {V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST, "TOP_FIELD_FIRST"},
> +		  {V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT, "FRAME_PRED_DCT"},
> +		  {V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV, "CONCEALMENT_MV"},
> +		  {V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE, "Q_SCALE_TYPE"},
> +		  {V4L2_MPEG2_PIC_FLAG_INTRA_VLC, "INTA_VLC"},
> +		  {V4L2_MPEG2_PIC_FLAG_ALT_SCAN, "ALT_SCAN"},
> +		  {V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST, "REPEAT_FIRST"},
> +		  {V4L2_MPEG2_PIC_FLAG_PROGRESSIVE, "PROGRESSIVE"}),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->p.f_code,
> +				   sizeof(__entry->p.f_code),
> +				   false),
> +		  __entry->p.picture_coding_type,
> +		  __entry->p.picture_structure,
> +		  __entry->p.intra_dc_precision
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_mpeg2_quant_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_mpeg2_quantisation *q),
> +	TP_ARGS(q),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_mpeg2_quantisation, q)),
> +	TP_fast_assign(__entry->q = *q;),
> +	TP_printk("\nintra_quantiser_matrix %s \nnon_intra_quantiser_matrix %s\n"
> +		  "chroma_intra_quantiser_matrix %s\nchroma_non_intra_quantiser_matrix %s\n",
> +		  __print_array(__entry->q.intra_quantiser_matrix,
> +				ARRAY_SIZE(__entry->q.intra_quantiser_matrix),
> +				sizeof(__entry->q.intra_quantiser_matrix[0])),
> +		  __print_array(__entry->q.non_intra_quantiser_matrix,
> +				ARRAY_SIZE(__entry->q.non_intra_quantiser_matrix),
> +				sizeof(__entry->q.non_intra_quantiser_matrix[0])),
> +		  __print_array(__entry->q.chroma_intra_quantiser_matrix,
> +				ARRAY_SIZE(__entry->q.chroma_intra_quantiser_matrix),
> +				sizeof(__entry->q.chroma_intra_quantiser_matrix[0])),
> +		  __print_array(__entry->q.chroma_non_intra_quantiser_matrix,
> +				ARRAY_SIZE(__entry->q.chroma_non_intra_quantiser_matrix),
> +				sizeof(__entry->q.chroma_non_intra_quantiser_matrix[0]))
> +		  )
> +)
> +
> +DEFINE_EVENT(v4l2_ctrl_mpeg2_seq_tmpl, v4l2_ctrl_mpeg2_sequence,
> +	TP_PROTO(const struct v4l2_ctrl_mpeg2_sequence *s),
> +	TP_ARGS(s)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_mpeg2_pic_tmpl, v4l2_ctrl_mpeg2_picture,
> +	TP_PROTO(const struct v4l2_ctrl_mpeg2_picture *p),
> +	TP_ARGS(p)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_mpeg2_quant_tmpl, v4l2_ctrl_mpeg2_quantisation,
> +	TP_PROTO(const struct v4l2_ctrl_mpeg2_quantisation *q),
> +	TP_ARGS(q)
> +);
> +
> +#endif
> +
> +#undef TRACE_INCLUDE_PATH
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_PATH ../../drivers/media/test-drivers/visl
> +#define TRACE_INCLUDE_FILE visl-trace-mpeg2
> +#include <trace/define_trace.h>
> diff --git a/drivers/media/test-drivers/visl/visl-trace-points.c b/drivers/media/test-drivers/visl/visl-trace-points.c
> new file mode 100644
> index 000000000000..6aa98f90c20a
> --- /dev/null
> +++ b/drivers/media/test-drivers/visl/visl-trace-points.c
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include "visl.h"
> +
> +#define CREATE_TRACE_POINTS
> +#include "visl-trace-fwht.h"
> +#include "visl-trace-mpeg2.h"
> +#include "visl-trace-vp8.h"
> +#include "visl-trace-vp9.h"
> +#include "visl-trace-h264.h"
> diff --git a/drivers/media/test-drivers/visl/visl-trace-vp8.h b/drivers/media/test-drivers/visl/visl-trace-vp8.h
> new file mode 100644
> index 000000000000..18c610ea18ab
> --- /dev/null
> +++ b/drivers/media/test-drivers/visl/visl-trace-vp8.h
> @@ -0,0 +1,156 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +#if !defined(_VISL_TRACE_VP8_H_) || defined(TRACE_HEADER_MULTI_READ)
> +#define _VISL_TRACE_VP8_H_
> +
> +#include <linux/tracepoint.h>
> +#include "visl.h"
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM visl_vp8_controls
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_entropy_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
> +	TP_ARGS(f),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp8_frame, f)),
> +	TP_fast_assign(__entry->f = *f;),
> +	TP_printk("\nentropy.coeff_probs {%s}\n"
> +		  "entropy.y_mode_probs %s\n"
> +		  "entropy.uv_mode_probs %s\n"
> +		  "entropy.mv_probs {%s}",
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->f.entropy.coeff_probs,
> +				   sizeof(__entry->f.entropy.coeff_probs),
> +				   false),
> +		  __print_array(__entry->f.entropy.y_mode_probs,
> +				ARRAY_SIZE(__entry->f.entropy.y_mode_probs),
> +				sizeof(__entry->f.entropy.y_mode_probs[0])),
> +		  __print_array(__entry->f.entropy.uv_mode_probs,
> +				ARRAY_SIZE(__entry->f.entropy.uv_mode_probs),
> +				sizeof(__entry->f.entropy.uv_mode_probs[0])),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->f.entropy.mv_probs,
> +				   sizeof(__entry->f.entropy.mv_probs),
> +				   false)
> +		  )
> +)
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_vp8_frame_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
> +	TP_ARGS(f),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp8_frame, f)),
> +	TP_fast_assign(__entry->f = *f;),
> +	TP_printk("\nsegment.quant_update %s\n"
> +		  "segment.lf_update %s\n"
> +		  "segment.segment_probs %s\n"
> +		  "segment.flags %s\n"
> +		  "lf.ref_frm_delta %s\n"
> +		  "lf.mb_mode_delta %s\n"
> +		  "lf.sharpness_level %u\n"
> +		  "lf.level %u\n"
> +		  "lf.flags %s\n"
> +		  "quant.y_ac_qi %u\n"
> +		  "quant.y_dc_delta %d\n"
> +		  "quant.y2_dc_delta %d\n"
> +		  "quant.y2_ac_delta %d\n"
> +		  "quant.uv_dc_delta %d\n"
> +		  "quant.uv_ac_delta %d\n"
> +		  "coder_state.range %u\n"
> +		  "coder_state.value %u\n"
> +		  "coder_state.bit_count %u\n"
> +		  "width %u\n"
> +		  "height %u\n"
> +		  "horizontal_scale %u\n"
> +		  "vertical_scale %u\n"
> +		  "version %u\n"
> +		  "prob_skip_false %u\n"
> +		  "prob_intra %u\n"
> +		  "prob_last %u\n"
> +		  "prob_gf %u\n"
> +		  "num_dct_parts %u\n"
> +		  "first_part_size %u\n"
> +		  "first_part_header_bits %u\n"
> +		  "dct_part_sizes %s\n"
> +		  "last_frame_ts %llu\n"
> +		  "golden_frame_ts %llu\n"
> +		  "alt_frame_ts %llu\n"
> +		  "flags %s",
> +		  __print_array(__entry->f.segment.quant_update,
> +				ARRAY_SIZE(__entry->f.segment.quant_update),
> +				sizeof(__entry->f.segment.quant_update[0])),
> +		  __print_array(__entry->f.segment.lf_update,
> +				ARRAY_SIZE(__entry->f.segment.lf_update),
> +				sizeof(__entry->f.segment.lf_update[0])),
> +		  __print_array(__entry->f.segment.segment_probs,
> +				ARRAY_SIZE(__entry->f.segment.segment_probs),
> +				sizeof(__entry->f.segment.segment_probs[0])),
> +		  __print_flags(__entry->f.segment.flags, "|",
> +		  {V4L2_VP8_SEGMENT_FLAG_ENABLED, "SEGMENT_ENABLED"},
> +		  {V4L2_VP8_SEGMENT_FLAG_UPDATE_MAP, "SEGMENT_UPDATE_MAP"},
> +		  {V4L2_VP8_SEGMENT_FLAG_UPDATE_FEATURE_DATA, "SEGMENT_UPDATE_FEATURE_DATA"},
> +		  {V4L2_VP8_SEGMENT_FLAG_DELTA_VALUE_MODE, "SEGMENT_DELTA_VALUE_MODE"}),
> +		  __print_array(__entry->f.lf.ref_frm_delta,
> +				ARRAY_SIZE(__entry->f.lf.ref_frm_delta),
> +				sizeof(__entry->f.lf.ref_frm_delta[0])),
> +		  __print_array(__entry->f.lf.mb_mode_delta,
> +				ARRAY_SIZE(__entry->f.lf.mb_mode_delta),
> +				sizeof(__entry->f.lf.mb_mode_delta[0])),
> +		  __entry->f.lf.sharpness_level,
> +		  __entry->f.lf.level,
> +		  __print_flags(__entry->f.lf.flags, "|",
> +		  {V4L2_VP8_LF_ADJ_ENABLE, "LF_ADJ_ENABLED"},
> +		  {V4L2_VP8_LF_DELTA_UPDATE, "LF_DELTA_UPDATE"},
> +		  {V4L2_VP8_LF_FILTER_TYPE_SIMPLE, "LF_FILTER_TYPE_SIMPLE"}),
> +		  __entry->f.quant.y_ac_qi,
> +		  __entry->f.quant.y_dc_delta,
> +		  __entry->f.quant.y2_dc_delta,
> +		  __entry->f.quant.y2_ac_delta,
> +		  __entry->f.quant.uv_dc_delta,
> +		  __entry->f.quant.uv_ac_delta,
> +		  __entry->f.coder_state.range,
> +		  __entry->f.coder_state.value,
> +		  __entry->f.coder_state.bit_count,
> +		  __entry->f.width,
> +		  __entry->f.height,
> +		  __entry->f.horizontal_scale,
> +		  __entry->f.vertical_scale,
> +		  __entry->f.version,
> +		  __entry->f.prob_skip_false,
> +		  __entry->f.prob_intra,
> +		  __entry->f.prob_last,
> +		  __entry->f.prob_gf,
> +		  __entry->f.num_dct_parts,
> +		  __entry->f.first_part_size,
> +		  __entry->f.first_part_header_bits,
> +		  __print_array(__entry->f.dct_part_sizes,
> +				ARRAY_SIZE(__entry->f.dct_part_sizes),
> +				sizeof(__entry->f.dct_part_sizes[0])),
> +		  __entry->f.last_frame_ts,
> +		  __entry->f.golden_frame_ts,
> +		  __entry->f.alt_frame_ts,
> +		  __print_flags(__entry->f.flags, "|",
> +		  {V4L2_VP8_FRAME_FLAG_KEY_FRAME, "KEY_FRAME"},
> +		  {V4L2_VP8_FRAME_FLAG_EXPERIMENTAL, "EXPERIMENTAL"},
> +		  {V4L2_VP8_FRAME_FLAG_SHOW_FRAME, "SHOW_FRAME"},
> +		  {V4L2_VP8_FRAME_FLAG_MB_NO_SKIP_COEFF, "MB_NO_SKIP_COEFF"},
> +		  {V4L2_VP8_FRAME_FLAG_SIGN_BIAS_GOLDEN, "SIGN_BIAS_GOLDEN"},
> +		  {V4L2_VP8_FRAME_FLAG_SIGN_BIAS_ALT, "SIGN_BIAS_ALT"})
> +		  )
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_vp8_frame_tmpl, v4l2_ctrl_vp8_frame,
> +	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
> +	TP_ARGS(f)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_vp8_entropy_tmpl, v4l2_ctrl_vp8_entropy,
> +	TP_PROTO(const struct v4l2_ctrl_vp8_frame *f),
> +	TP_ARGS(f)
> +);
> +
> +#endif
> +
> +#undef TRACE_INCLUDE_PATH
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_PATH ../../drivers/media/test-drivers/visl
> +#define TRACE_INCLUDE_FILE visl-trace-vp8
> +#include <trace/define_trace.h>
> diff --git a/drivers/media/test-drivers/visl/visl-trace-vp9.h b/drivers/media/test-drivers/visl/visl-trace-vp9.h
> new file mode 100644
> index 000000000000..e0907231eac7
> --- /dev/null
> +++ b/drivers/media/test-drivers/visl/visl-trace-vp9.h
> @@ -0,0 +1,292 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +#if !defined(_VISL_TRACE_VP9_H_) || defined(TRACE_HEADER_MULTI_READ)
> +#define _VISL_TRACE_VP9_H_
> +
> +#include <linux/tracepoint.h>
> +#include "visl.h"
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM visl_vp9_controls
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_frame_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_vp9_frame *f),
> +	TP_ARGS(f),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_frame, f)),
> +	TP_fast_assign(__entry->f = *f;),
> +	TP_printk("\nlf.ref_deltas %s\n"
> +		  "lf.mode_deltas %s\n"
> +		  "lf.level %u\n"
> +		  "lf.sharpness %u\n"
> +		  "lf.flags %s\n"
> +		  "quant.base_q_idx %u\n"
> +		  "quant.delta_q_y_dc %d\n"
> +		  "quant.delta_q_uv_dc %d\n"
> +		  "quant.delta_q_uv_ac %d\n"
> +		  "seg.feature_data {%s}\n"
> +		  "seg.feature_enabled %s\n"
> +		  "seg.tree_probs %s\n"
> +		  "seg.pred_probs %s\n"
> +		  "seg.flags %s\n"
> +		  "flags %s\n"
> +		  "compressed_header_size %u\n"
> +		  "uncompressed_header_size %u\n"
> +		  "frame_width_minus_1 %u\n"
> +		  "frame_height_minus_1 %u\n"
> +		  "render_width_minus_1 %u\n"
> +		  "render_height_minus_1 %u\n"
> +		  "last_frame_ts %llu\n"
> +		  "golden_frame_ts %llu\n"
> +		  "alt_frame_ts %llu\n"
> +		  "ref_frame_sign_bias %s\n"
> +		  "reset_frame_context %s\n"
> +		  "frame_context_idx %u\n"
> +		  "profile %u\n"
> +		  "bit_depth %u\n"
> +		  "interpolation_filter %s\n"
> +		  "tile_cols_log2 %u\n"
> +		  "tile_rows_log_2 %u\n"
> +		  "reference_mode %s\n",
> +		  __print_array(__entry->f.lf.ref_deltas,
> +				ARRAY_SIZE(__entry->f.lf.ref_deltas),
> +				sizeof(__entry->f.lf.ref_deltas[0])),
> +		  __print_array(__entry->f.lf.mode_deltas,
> +				ARRAY_SIZE(__entry->f.lf.mode_deltas),
> +				sizeof(__entry->f.lf.mode_deltas[0])),
> +		  __entry->f.lf.level,
> +		  __entry->f.lf.sharpness,
> +		  __print_flags(__entry->f.lf.flags, "|",
> +		  {V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED, "DELTA_ENABLED"},
> +		  {V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE, "DELTA_UPDATE"}),
> +		  __entry->f.quant.base_q_idx,
> +		  __entry->f.quant.delta_q_y_dc,
> +		  __entry->f.quant.delta_q_uv_dc,
> +		  __entry->f.quant.delta_q_uv_ac,
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->f.seg.feature_data,
> +				   sizeof(__entry->f.seg.feature_data),
> +				   false),
> +		  __print_array(__entry->f.seg.feature_enabled,
> +				ARRAY_SIZE(__entry->f.seg.feature_enabled),
> +				sizeof(__entry->f.seg.feature_enabled[0])),
> +		  __print_array(__entry->f.seg.tree_probs,
> +				ARRAY_SIZE(__entry->f.seg.tree_probs),
> +				sizeof(__entry->f.seg.tree_probs[0])),
> +		  __print_array(__entry->f.seg.pred_probs,
> +				ARRAY_SIZE(__entry->f.seg.pred_probs),
> +				sizeof(__entry->f.seg.pred_probs[0])),
> +		  __print_flags(__entry->f.seg.flags, "|",
> +		  {V4L2_VP9_SEGMENTATION_FLAG_ENABLED, "ENABLED"},
> +		  {V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP, "UPDATE_MAP"},
> +		  {V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE, "TEMPORAL_UPDATE"},
> +		  {V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA, "UPDATE_DATA"},
> +		  {V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE, "ABS_OR_DELTA_UPDATE"}),
> +		  __print_flags(__entry->f.flags, "|",
> +		  {V4L2_VP9_FRAME_FLAG_KEY_FRAME, "KEY_FRAME"},
> +		  {V4L2_VP9_FRAME_FLAG_SHOW_FRAME, "SHOW_FRAME"},
> +		  {V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT, "ERROR_RESILIENT"},
> +		  {V4L2_VP9_FRAME_FLAG_INTRA_ONLY, "INTRA_ONLY"},
> +		  {V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV, "ALLOW_HIGH_PREC_MV"},
> +		  {V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX, "REFRESH_FRAME_CTX"},
> +		  {V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE, "PARALLEL_DEC_MODE"},
> +		  {V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING, "X_SUBSAMPLING"},
> +		  {V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING, "Y_SUBSAMPLING"},
> +		  {V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING, "COLOR_RANGE_FULL_SWING"}),
> +		  __entry->f.compressed_header_size,
> +		  __entry->f.uncompressed_header_size,
> +		  __entry->f.frame_width_minus_1,
> +		  __entry->f.frame_height_minus_1,
> +		  __entry->f.render_width_minus_1,
> +		  __entry->f.render_height_minus_1,
> +		  __entry->f.last_frame_ts,
> +		  __entry->f.golden_frame_ts,
> +		  __entry->f.alt_frame_ts,
> +		  __print_symbolic(__entry->f.ref_frame_sign_bias,
> +		  {V4L2_VP9_SIGN_BIAS_LAST, "SIGN_BIAS_LAST"},
> +		  {V4L2_VP9_SIGN_BIAS_GOLDEN, "SIGN_BIAS_GOLDEN"},
> +		  {V4L2_VP9_SIGN_BIAS_ALT, "SIGN_BIAS_ALT"}),
> +		  __print_symbolic(__entry->f.reset_frame_context,
> +		  {V4L2_VP9_RESET_FRAME_CTX_NONE, "RESET_FRAME_CTX_NONE"},
> +		  {V4L2_VP9_RESET_FRAME_CTX_SPEC, "RESET_FRAME_CTX_SPEC"},
> +		  {V4L2_VP9_RESET_FRAME_CTX_ALL, "RESET_FRAME_CTX_ALL"}),
> +		  __entry->f.frame_context_idx,
> +		  __entry->f.profile,
> +		  __entry->f.bit_depth,
> +		  __print_symbolic(__entry->f.interpolation_filter,
> +		  {V4L2_VP9_INTERP_FILTER_EIGHTTAP, "INTERP_FILTER_EIGHTTAP"},
> +		  {V4L2_VP9_INTERP_FILTER_EIGHTTAP_SMOOTH, "INTERP_FILTER_EIGHTTAP_SMOOTH"},
> +		  {V4L2_VP9_INTERP_FILTER_EIGHTTAP_SHARP, "INTERP_FILTER_EIGHTTAP_SHARP"},
> +		  {V4L2_VP9_INTERP_FILTER_BILINEAR, "INTERP_FILTER_BILINEAR"},
> +		  {V4L2_VP9_INTERP_FILTER_SWITCHABLE, "INTERP_FILTER_SWITCHABLE"}),
> +		  __entry->f.tile_cols_log2,
> +		  __entry->f.tile_rows_log2,
> +		  __print_symbolic(__entry->f.reference_mode,
> +		  {V4L2_VP9_REFERENCE_MODE_SINGLE_REFERENCE, "REFERENCE_MODE_SINGLE_REFERENCE"},
> +		  {V4L2_VP9_REFERENCE_MODE_COMPOUND_REFERENCE, "REFERENCE_MODE_COMPOUND_REFERENCE"},
> +		  {V4L2_VP9_REFERENCE_MODE_SELECT, "REFERENCE_MODE_SELECT"}))
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_hdr_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
> +	TP_ARGS(h),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)),
> +	TP_fast_assign(__entry->h = *h;),
> +	TP_printk("\ntx_mode %s\n"
> +		  "tx8 {%s}\n"
> +		  "tx16 {%s}\n"
> +		  "tx32 {%s}\n"
> +		  "skip %s\n"
> +		  "inter_mode {%s}\n"
> +		  "interp_filter {%s}\n"
> +		  "is_inter %s\n"
> +		  "comp_mode %s\n"
> +		  "single_ref {%s}\n"
> +		  "comp_ref %s\n"
> +		  "y_mode {%s}\n"
> +		  "uv_mode {%s}\n"
> +		  "partition {%s}\n",
> +		  __print_symbolic(__entry->h.tx_mode,
> +		  {V4L2_VP9_TX_MODE_ONLY_4X4, "TX_MODE_ONLY_4X4"},
> +		  {V4L2_VP9_TX_MODE_ALLOW_8X8, "TX_MODE_ALLOW_8X8"},
> +		  {V4L2_VP9_TX_MODE_ALLOW_16X16, "TX_MODE_ALLOW_16X16"},
> +		  {V4L2_VP9_TX_MODE_ALLOW_32X32, "TX_MODE_ALLOW_32X32"},
> +		  {V4L2_VP9_TX_MODE_SELECT, "TX_MODE_SELECT"}),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->h.tx8,
> +				   sizeof(__entry->h.tx8),
> +				   false),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->h.tx16,
> +				   sizeof(__entry->h.tx16),
> +				   false),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->h.tx32,
> +				   sizeof(__entry->h.tx32),
> +				   false),
> +		  __print_array(__entry->h.skip,
> +				ARRAY_SIZE(__entry->h.skip),
> +				sizeof(__entry->h.skip[0])),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->h.inter_mode,
> +				   sizeof(__entry->h.inter_mode),
> +				   false),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->h.interp_filter,
> +				   sizeof(__entry->h.interp_filter),
> +				   false),
> +		  __print_array(__entry->h.is_inter,
> +				ARRAY_SIZE(__entry->h.is_inter),
> +				sizeof(__entry->h.is_inter[0])),
> +		  __print_array(__entry->h.comp_mode,
> +				ARRAY_SIZE(__entry->h.comp_mode),
> +				sizeof(__entry->h.comp_mode[0])),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->h.single_ref,
> +				   sizeof(__entry->h.single_ref),
> +				   false),
> +		  __print_array(__entry->h.comp_ref,
> +				ARRAY_SIZE(__entry->h.comp_ref),
> +				sizeof(__entry->h.comp_ref[0])),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->h.y_mode,
> +				   sizeof(__entry->h.y_mode),
> +				   false),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->h.uv_mode,
> +				   sizeof(__entry->h.uv_mode),
> +				   false),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->h.partition,
> +				   sizeof(__entry->h.partition),
> +				   false)
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_ctrl_vp9_compressed_coef_tmpl,
> +	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
> +	TP_ARGS(h),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_ctrl_vp9_compressed_hdr, h)),
> +	TP_fast_assign(__entry->h = *h;),
> +	TP_printk("\n coef {%s}",
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->h.coef,
> +				   sizeof(__entry->h.coef),
> +				   false)
> +	)
> +);
> +
> +DECLARE_EVENT_CLASS(v4l2_vp9_mv_probs_tmpl,
> +	TP_PROTO(const struct v4l2_vp9_mv_probs *p),
> +	TP_ARGS(p),
> +	TP_STRUCT__entry(__field_struct(struct v4l2_vp9_mv_probs, p)),
> +	TP_fast_assign(__entry->p = *p;),
> +	TP_printk("\n joint %s\n"
> +		  "sign %s\n"
> +		  "classes {%s}\n"
> +		  "class0_bit %s\n"
> +		  "bits {%s}\n"
> +		  "class0_fr {%s}\n"
> +		  "fr {%s}\n"
> +		  "class0_hp %s\n"
> +		  "hp %s\n",
> +		  __print_array(__entry->p.joint,
> +				ARRAY_SIZE(__entry->p.joint),
> +				sizeof(__entry->p.joint[0])),
> +		  __print_array(__entry->p.sign,
> +				ARRAY_SIZE(__entry->p.sign),
> +				sizeof(__entry->p.sign[0])),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->p.classes,
> +				   sizeof(__entry->p.classes),
> +				   false),
> +		  __print_array(__entry->p.class0_bit,
> +				ARRAY_SIZE(__entry->p.class0_bit),
> +				sizeof(__entry->p.class0_bit[0])),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->p.bits,
> +				   sizeof(__entry->p.bits),
> +				   false),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->p.class0_fr,
> +				   sizeof(__entry->p.class0_fr),
> +				   false),
> +		  __print_hex_dump("", DUMP_PREFIX_NONE, 32, 1,
> +		  		   __entry->p.fr,
> +				   sizeof(__entry->p.fr),
> +				   false),
> +		  __print_array(__entry->p.class0_hp,
> +				ARRAY_SIZE(__entry->p.class0_hp),
> +				sizeof(__entry->p.class0_hp[0])),
> +		  __print_array(__entry->p.hp,
> +				ARRAY_SIZE(__entry->p.hp),
> +				sizeof(__entry->p.hp[0]))
> +	)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_vp9_frame_tmpl, v4l2_ctrl_vp9_frame,
> +	TP_PROTO(const struct v4l2_ctrl_vp9_frame *f),
> +	TP_ARGS(f)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_vp9_compressed_hdr_tmpl, v4l2_ctrl_vp9_compressed_hdr,
> +	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
> +	TP_ARGS(h)
> +);
> +
> +DEFINE_EVENT(v4l2_ctrl_vp9_compressed_coef_tmpl, v4l2_ctrl_vp9_compressed_coeff,
> +	TP_PROTO(const struct v4l2_ctrl_vp9_compressed_hdr *h),
> +	TP_ARGS(h)
> +);
> +
> +
> +DEFINE_EVENT(v4l2_vp9_mv_probs_tmpl, v4l2_vp9_mv_probs,
> +	TP_PROTO(const struct v4l2_vp9_mv_probs *p),
> +	TP_ARGS(p)
> +);
> +
> +#endif
> +
> +#undef TRACE_INCLUDE_PATH
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_PATH ../../drivers/media/test-drivers/visl
> +#define TRACE_INCLUDE_FILE visl-trace-vp9
> +#include <trace/define_trace.h>
> diff --git a/drivers/media/test-drivers/visl/visl-video.c b/drivers/media/test-drivers/visl/visl-video.c
> new file mode 100644
> index 000000000000..d1eb7c374e16
> --- /dev/null
> +++ b/drivers/media/test-drivers/visl/visl-video.c
> @@ -0,0 +1,776 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * A virtual stateless device for stateless uAPI development purposes.
> + *
> + * This tool's objective is to help the development and testing of userspace
> + * applications that use the V4L2 stateless API to decode media.
> + *
> + * A userspace implementation can use visl to run a decoding loop even when no
> + * hardware is available or when the kernel uAPI for the codec has not been
> + * upstreamed yet. This can reveal bugs at an early stage.
> + *
> + * This driver can also trace the contents of the V4L2 controls submitted to it.
> + * It can also dump the contents of the vb2 buffers through a debugfs
> + * interface. This is in many ways similar to the tracing infrastructure
> + * available for other popular encode/decode APIs out there and can help develop
> + * a userspace application by using another (working) one as a reference.
> + *
> + * Note that no actual decoding of video frames is performed by visl. The V4L2
> + * test pattern generator is used to write various debug information to the
> + * capture buffers instead.
> + *
> + * Copyright (c) Collabora, Ltd.
> + *
> + * Based on the vim2m driver, that is:
> + *
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * Pawel Osciak, <pawel@osciak.com>
> + * Marek Szyprowski, <m.szyprowski@samsung.com>
> + *
> + * Based on the vicodec driver, that is:
> + *
> + * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> + *
> + * Based on the Cedrus VPU driver, that is:
> + *
> + * Copyright (C) 2016 Florent Revest <florent.revest@free-electrons.com>
> + * Copyright (C) 2018 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + * Copyright (C) 2018 Bootlin
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/font.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-vmalloc.h>
> +
> +#include "visl-video.h"
> +
> +#include "visl.h"
> +#include "visl-debugfs.h"
> +
> +static void visl_set_current_codec(struct visl_ctx *ctx)
> +{
> +	switch (ctx->coded_fmt.fmt.pix_mp.pixelformat) {
> +	case V4L2_PIX_FMT_FWHT_STATELESS:
> +		ctx->current_codec = VISL_CODEC_FWHT;
> +		break;
> +	case V4L2_PIX_FMT_MPEG2_SLICE:
> +		ctx->current_codec = VISL_CODEC_MPEG2;
> +		break;
> +	case V4L2_PIX_FMT_VP8_FRAME:
> +		ctx->current_codec = VISL_CODEC_VP8;
> +		break;
> +	case V4L2_PIX_FMT_VP9_FRAME:
> +		ctx->current_codec = VISL_CODEC_VP9;
> +		break;
> +	case V4L2_PIX_FMT_H264_SLICE:
> +		ctx->current_codec = VISL_CODEC_H264;
> +		break;
> +	default:
> +		ctx->current_codec = VISL_CODEC_NONE;
> +		break;
> +	}
> +}
> +
> +static void visl_print_fmt(struct visl_ctx *ctx, const struct v4l2_format *f)
> +{
> +	const struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +	u32 i;
> +
> +	dprintk(ctx->dev, "width: %d\n", pix_mp->width);
> +	dprintk(ctx->dev, "height: %d\n", pix_mp->height);
> +	dprintk(ctx->dev, "pixelformat: %c%c%c%c\n",
> +		pix_mp->pixelformat,
> +		(pix_mp->pixelformat >> 8) & 0xff,
> +		(pix_mp->pixelformat >> 16) & 0xff,
> +		(pix_mp->pixelformat >> 24) & 0xff);
> +
> +	dprintk(ctx->dev, "field: %d\n", pix_mp->field);
> +	dprintk(ctx->dev, "colorspace: %d\n", pix_mp->colorspace);
> +	dprintk(ctx->dev, "num_planes: %d\n", pix_mp->num_planes);
> +	dprintk(ctx->dev, "flags: %d\n", pix_mp->flags);
> +	dprintk(ctx->dev, "quantization: %d\n", pix_mp->quantization);
> +	dprintk(ctx->dev, "xfer_func: %d\n", pix_mp->xfer_func);
> +
> +	for (i = 0; i < pix_mp->num_planes; i++) {
> +		dprintk(ctx->dev,
> +			"plane[%d]: sizeimage: %d\n", i, pix_mp->plane_fmt[i].sizeimage);
> +		dprintk(ctx->dev,
> +			"plane[%d]: bytesperline: %d\n", i, pix_mp->plane_fmt[i].bytesperline);
> +	}
> +}
> +
> +static int visl_tpg_init(struct visl_ctx *ctx)
> +{
> +	const struct font_desc *font;
> +	const char *font_name = "VGA8x16";
> +	int ret;
> +	u32 width = ctx->decoded_fmt.fmt.pix_mp.width;
> +	u32 height = ctx->decoded_fmt.fmt.pix_mp.height;
> +	struct v4l2_pix_format_mplane *f = &ctx->decoded_fmt.fmt.pix_mp;
> +
> +	tpg_free(&ctx->tpg);
> +
> +	font = find_font(font_name);
> +	if (font) {
> +		tpg_init(&ctx->tpg, width, height);
> +
> +		ret = tpg_alloc(&ctx->tpg, width);
> +		if (ret)
> +			goto err_alloc;
> +
> +		tpg_set_font(font->data);
> +		ret = tpg_s_fourcc(&ctx->tpg,
> +				   f->pixelformat);
> +
> +		if (!ret)
> +			goto err_fourcc;
> +
> +		tpg_reset_source(&ctx->tpg, width, height, f->field);
> +
> +		tpg_s_pattern(&ctx->tpg, TPG_PAT_75_COLORBAR);
> +
> +		tpg_s_field(&ctx->tpg, f->field, false);
> +		tpg_s_colorspace(&ctx->tpg, f->colorspace);
> +		tpg_s_ycbcr_enc(&ctx->tpg, f->ycbcr_enc);
> +		tpg_s_quantization(&ctx->tpg, f->quantization);
> +		tpg_s_xfer_func(&ctx->tpg, f->xfer_func);
> +	} else {
> +		v4l2_err(&ctx->dev->v4l2_dev,
> +			 "Font %s not found\n", font_name);
> +
> +		return -EINVAL;
> +	}
> +
> +	dprintk(ctx->dev, "Initialized the V4L2 test pattern generator, w=%d, h=%d, max_w=%d\n",
> +		width, height, width);
> +
> +	return 0;
> +err_alloc:
> +	return ret;
> +err_fourcc:
> +	tpg_free(&ctx->tpg);
> +	return ret;
> +}
> +
> +static const u32 visl_decoded_fmts[] = {
> +	V4L2_PIX_FMT_NV12,
> +	V4L2_PIX_FMT_YUV420,
> +};
> +
> +const struct visl_coded_format_desc visl_coded_fmts[] = {
> +	{
> +		.pixelformat = V4L2_PIX_FMT_FWHT,
> +		.frmsize = {
> +			.min_width = 640,
> +			.max_width = 4096,
> +			.step_width = 1,
> +			.min_height = 360,
> +			.max_height = 2160,
> +			.step_height = 1,
> +		},
> +		.ctrls = &visl_fwht_ctrls,
> +		.num_decoded_fmts = ARRAY_SIZE(visl_decoded_fmts),
> +		.decoded_fmts = visl_decoded_fmts,
> +	},
> +	{
> +		.pixelformat = V4L2_PIX_FMT_MPEG2_SLICE,
> +		.frmsize = {
> +			.min_width = 16,
> +			.max_width = 1920,
> +			.step_width = 1,
> +			.min_height = 16,
> +			.max_height = 1152,
> +			.step_height = 1,
> +		},
> +		.ctrls = &visl_mpeg2_ctrls,
> +		.num_decoded_fmts = ARRAY_SIZE(visl_decoded_fmts),
> +		.decoded_fmts = visl_decoded_fmts,
> +	},
> +	{
> +		.pixelformat = V4L2_PIX_FMT_VP8_FRAME,
> +		.frmsize = {
> +			.min_width = 64,
> +			.max_width = 16383,
> +			.step_width = 1,
> +			.min_height = 64,
> +			.max_height = 16383,
> +			.step_height = 1,
> +		},
> +		.ctrls = &visl_vp8_ctrls,
> +		.num_decoded_fmts = ARRAY_SIZE(visl_decoded_fmts),
> +		.decoded_fmts = visl_decoded_fmts,
> +	},
> +	{
> +		.pixelformat = V4L2_PIX_FMT_VP9_FRAME,
> +		.frmsize = {
> +			.min_width = 64,
> +			.max_width = 8192,
> +			.step_width = 1,
> +			.min_height = 64,
> +			.max_height = 4352,
> +			.step_height = 1,
> +		},
> +		.ctrls = &visl_vp9_ctrls,
> +		.num_decoded_fmts = ARRAY_SIZE(visl_decoded_fmts),
> +		.decoded_fmts = visl_decoded_fmts,
> +	},
> +	{
> +		.pixelformat = V4L2_PIX_FMT_H264_SLICE,
> +		.frmsize = {
> +			.min_width = 64,
> +			.max_width = 4096,
> +			.step_width = 1,
> +			.min_height = 64,
> +			.max_height = 2304,
> +			.step_height = 1,
> +		},
> +		.ctrls = &visl_h264_ctrls,
> +		.num_decoded_fmts = ARRAY_SIZE(visl_decoded_fmts),
> +		.decoded_fmts = visl_decoded_fmts,
> +	},
> +};
> +
> +const size_t num_coded_fmts = ARRAY_SIZE(visl_coded_fmts);
> +
> +static const struct visl_coded_format_desc*
> +visl_find_coded_fmt_desc(u32 fourcc)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(visl_coded_fmts); i++) {
> +		if (visl_coded_fmts[i].pixelformat == fourcc)
> +			return &visl_coded_fmts[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static void visl_init_fmt(struct v4l2_format *f, u32 fourcc)
> +{	memset(f, 0, sizeof(*f));
> +	f->fmt.pix_mp.pixelformat = fourcc;
> +	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
> +	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
> +	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
> +	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
> +}
> +
> +void visl_reset_coded_fmt(struct visl_ctx *ctx)
> +{
> +	struct v4l2_format *f = &ctx->coded_fmt;
> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +
> +	ctx->coded_format_desc = &visl_coded_fmts[0];
> +	visl_init_fmt(f, ctx->coded_format_desc->pixelformat);
> +
> +	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	f->fmt.pix_mp.width = ctx->coded_format_desc->frmsize.min_width;
> +	f->fmt.pix_mp.height = ctx->coded_format_desc->frmsize.min_height;
> +
> +	pix_mp->num_planes = 1;
> +	pix_mp->plane_fmt[0].sizeimage = pix_mp->width * pix_mp->height * 8;
> +
> +	dprintk(ctx->dev, "OUTPUT format was set to:\n");
> +	visl_print_fmt(ctx, &ctx->coded_fmt);
> +
> +	visl_set_current_codec(ctx);
> +}
> +
> +int visl_reset_decoded_fmt(struct visl_ctx *ctx)
> +{
> +	struct v4l2_format *f = &ctx->decoded_fmt;
> +	u32 decoded_fmt = ctx->coded_format_desc[0].decoded_fmts[0];
> +
> +	visl_init_fmt(f, decoded_fmt);
> +
> +	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +
> +	v4l2_fill_pixfmt_mp(&f->fmt.pix_mp,
> +			    ctx->coded_format_desc->decoded_fmts[0],
> +			    ctx->coded_fmt.fmt.pix_mp.width,
> +			    ctx->coded_fmt.fmt.pix_mp.height);
> +
> +	dprintk(ctx->dev, "CAPTURE format was set to:\n");
> +	visl_print_fmt(ctx, &ctx->decoded_fmt);
> +
> +	return visl_tpg_init(ctx);
> +}
> +
> +int visl_set_default_format(struct visl_ctx *ctx)
> +{
> +	visl_reset_coded_fmt(ctx);
> +	return visl_reset_decoded_fmt(ctx);
> +}
> +
> +static struct visl_q_data *get_q_data(struct visl_ctx *ctx,
> +				      enum v4l2_buf_type type)
> +{
> +	switch (type) {
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +		return &ctx->q_data[V4L2_M2M_SRC];
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		return &ctx->q_data[V4L2_M2M_DST];
> +	default:
> +		break;
> +	}
> +	return NULL;
> +}
> +
> +static int visl_querycap(struct file *file, void *priv,
> +			 struct v4l2_capability *cap)
> +{
> +	strscpy(cap->driver, VISL_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, VISL_NAME, sizeof(cap->card));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info),
> +		 "platform:%s", VISL_NAME);
> +
> +	return 0;
> +}
> +
> +static int visl_enum_fmt_vid_cap(struct file *file, void *priv,
> +				 struct v4l2_fmtdesc *f)
> +{
> +	struct visl_ctx *ctx = visl_file_to_ctx(file);
> +
> +	if (f->index >= ctx->coded_format_desc->num_decoded_fmts)
> +		return -EINVAL;
> +
> +	f->pixelformat = ctx->coded_format_desc->decoded_fmts[f->index];
> +	return 0;
> +}
> +
> +static int visl_enum_fmt_vid_out(struct file *file, void *priv,
> +				 struct v4l2_fmtdesc *f)
> +{
> +	if (f->index >= ARRAY_SIZE(visl_coded_fmts))
> +		return -EINVAL;
> +
> +	f->pixelformat = visl_coded_fmts[f->index].pixelformat;
> +	return 0;
> +}
> +
> +static int visl_g_fmt_vid_cap(struct file *file, void *priv,
> +			      struct v4l2_format *f)
> +{
> +	struct visl_ctx *ctx = visl_file_to_ctx(file);
> +	*f = ctx->decoded_fmt;
> +
> +	return 0;
> +}
> +
> +static int visl_g_fmt_vid_out(struct file *file, void *priv,
> +			      struct v4l2_format *f)
> +{
> +	struct visl_ctx *ctx = visl_file_to_ctx(file);
> +
> +	*f = ctx->coded_fmt;
> +	return 0;
> +}
> +
> +static int visl_try_fmt_vid_cap(struct file *file, void *priv,
> +				struct v4l2_format *f)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +	struct visl_ctx *ctx = visl_file_to_ctx(file);
> +	const struct visl_coded_format_desc *coded_desc;
> +	unsigned int i;
> +
> +	coded_desc = ctx->coded_format_desc;
> +
> +	for (i = 0; i < coded_desc->num_decoded_fmts; i++) {
> +		if (coded_desc->decoded_fmts[i] == pix_mp->pixelformat)
> +			break;
> +	}
> +
> +	if (i == coded_desc->num_decoded_fmts)
> +		pix_mp->pixelformat = coded_desc->decoded_fmts[0];
> +
> +	v4l2_apply_frmsize_constraints(&pix_mp->width,
> +				       &pix_mp->height,
> +				       &coded_desc->frmsize);
> +
> +	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
> +			    pix_mp->width, pix_mp->height);
> +
> +	pix_mp->field = V4L2_FIELD_NONE;
> +
> +	return 0;
> +}
> +
> +static int visl_try_fmt_vid_out(struct file *file, void *priv,
> +				struct v4l2_format *f)
> +{
> +	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> +	const struct visl_coded_format_desc *coded_desc;
> +
> +	coded_desc = visl_find_coded_fmt_desc(pix_mp->pixelformat);
> +	if (!coded_desc) {
> +		pix_mp->pixelformat = visl_coded_fmts[0].pixelformat;
> +		coded_desc = &visl_coded_fmts[0];
> +	}
> +
> +	v4l2_apply_frmsize_constraints(&pix_mp->width,
> +				       &pix_mp->height,
> +				       &coded_desc->frmsize);
> +
> +	pix_mp->field = V4L2_FIELD_NONE;
> +	pix_mp->num_planes = 1;
> +
> +	return 0;
> +}
> +
> +static int visl_s_fmt_vid_out(struct file *file, void *priv,
> +			      struct v4l2_format *f)
> +{
> +	struct visl_ctx *ctx = visl_file_to_ctx(file);
> +	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
> +	const struct visl_coded_format_desc *desc;
> +	struct vb2_queue *peer_vq;
> +	int ret;
> +
> +	peer_vq = v4l2_m2m_get_vq(m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	if (vb2_is_busy(peer_vq))
> +		return -EBUSY;
> +
> +	dprintk(ctx->dev, "Trying to set the OUTPUT format to:\n");
> +	visl_print_fmt(ctx, f);
> +
> +	ret = visl_try_fmt_vid_out(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	desc = visl_find_coded_fmt_desc(f->fmt.pix_mp.pixelformat);
> +	ctx->coded_format_desc = desc;
> +	ctx->coded_fmt = *f;
> +
> +	v4l2_fill_pixfmt_mp(&ctx->coded_fmt.fmt.pix_mp,
> +			    ctx->coded_fmt.fmt.pix_mp.pixelformat,
> +			    ctx->coded_fmt.fmt.pix_mp.width,
> +			    ctx->coded_fmt.fmt.pix_mp.height);

Since v4l2_fill_pixfmt_mp always returns -EINVAL, requesting buffers will
crash if the application does not set sizeimage itself.

> +
> +	ret = visl_reset_decoded_fmt(ctx);
> +	if (ret)
> +		return ret;
> +
> +	ctx->decoded_fmt.fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
> +	ctx->decoded_fmt.fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
> +	ctx->decoded_fmt.fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
> +	ctx->decoded_fmt.fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
> +
> +	dprintk(ctx->dev, "OUTPUT format was set to:\n");
> +	visl_print_fmt(ctx, &ctx->coded_fmt);
> +
> +	visl_set_current_codec(ctx);
> +	return 0;
> +}
> +
> +static int visl_s_fmt_vid_cap(struct file *file, void *priv,
> +			      struct v4l2_format *f)
> +{
> +	struct visl_ctx *ctx = visl_file_to_ctx(file);
> +	int ret;
> +
> +	dprintk(ctx->dev, "Trying to set the CAPTURE format to:\n");
> +	visl_print_fmt(ctx, f);
> +
> +	ret = visl_try_fmt_vid_cap(file, priv, f);
> +	if (ret)
> +		return ret;
> +
> +	ctx->decoded_fmt = *f;
> +
> +	dprintk(ctx->dev, "CAPTURE format was set to:\n");
> +	visl_print_fmt(ctx, &ctx->decoded_fmt);
> +
> +	visl_tpg_init(ctx);
> +	return 0;
> +}
> +
> +static int visl_enum_framesizes(struct file *file, void *priv,
> +				struct v4l2_frmsizeenum *fsize)
> +{
> +	const struct visl_coded_format_desc *fmt;
> +	struct visl_ctx *ctx = visl_file_to_ctx(file);
> +
> +	if (fsize->index != 0)
> +		return -EINVAL;
> +
> +	fmt = visl_find_coded_fmt_desc(fsize->pixel_format);
> +	if (!fmt) {
> +		dprintk(ctx->dev,
> +			"Unsupported format for the OUTPUT queue: %d\n",
> +			fsize->pixel_format);
> +
> +		return -EINVAL;
> +	}
> +
> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> +	fsize->stepwise = fmt->frmsize;
> +	return 0;
> +}
> +
> +const struct v4l2_ioctl_ops visl_ioctl_ops = {
> +	.vidioc_querycap		= visl_querycap,
> +	.vidioc_enum_framesizes		= visl_enum_framesizes,
> +
> +	.vidioc_enum_fmt_vid_cap	= visl_enum_fmt_vid_cap,
> +	.vidioc_g_fmt_vid_cap_mplane	= visl_g_fmt_vid_cap,
> +	.vidioc_try_fmt_vid_cap_mplane	= visl_try_fmt_vid_cap,
> +	.vidioc_s_fmt_vid_cap_mplane	= visl_s_fmt_vid_cap,
> +
> +	.vidioc_enum_fmt_vid_out	= visl_enum_fmt_vid_out,
> +	.vidioc_g_fmt_vid_out_mplane	= visl_g_fmt_vid_out,
> +	.vidioc_try_fmt_vid_out_mplane	= visl_try_fmt_vid_out,
> +	.vidioc_s_fmt_vid_out_mplane	= visl_s_fmt_vid_out,
> +
> +	.vidioc_reqbufs			= v4l2_m2m_ioctl_reqbufs,
> +	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
> +	.vidioc_qbuf			= v4l2_m2m_ioctl_qbuf,
> +	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
> +	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
> +	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
> +	.vidioc_expbuf			= v4l2_m2m_ioctl_expbuf,
> +
> +	.vidioc_streamon		= v4l2_m2m_ioctl_streamon,
> +	.vidioc_streamoff		= v4l2_m2m_ioctl_streamoff,
> +
> +	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
> +	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
> +};
> +
> +static int visl_queue_setup(struct vb2_queue *vq,
> +			    unsigned int *nbuffers,
> +			    unsigned int *num_planes,
> +			    unsigned int sizes[],
> +			    struct device *alloc_devs[])
> +{
> +	struct visl_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct v4l2_format *f;
> +	u32 i;
> +	char *qname;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +		f = &ctx->coded_fmt;
> +		qname = "Output";
> +	} else {
> +		f = &ctx->decoded_fmt;
> +		qname = "Capture";
> +	}
> +
> +	if (*num_planes) {
> +		if (*num_planes != f->fmt.pix_mp.num_planes)
> +			return -EINVAL;
> +
> +		for (i = 0; i < f->fmt.pix_mp.num_planes; i++) {
> +			if (sizes[i] < f->fmt.pix_mp.plane_fmt[i].sizeimage)
> +				return -EINVAL;
> +		}
> +	} else {
> +		*num_planes = f->fmt.pix_mp.num_planes;
> +		for (i = 0; i < f->fmt.pix_mp.num_planes; i++)
> +			sizes[i] = f->fmt.pix_mp.plane_fmt[i].sizeimage;
> +	}
> +
> +	dprintk(ctx->dev, "%s: %d buffer(s) requested, num_planes=%d.\n",
> +		qname, *nbuffers, *num_planes);
> +
> +	for (i = 0; i < f->fmt.pix_mp.num_planes; i++)
> +		dprintk(ctx->dev, "plane[%d].sizeimage=%d\n",
> +			i, f->fmt.pix_mp.plane_fmt[i].sizeimage);
> +
> +	return 0;
> +}
> +
> +static void visl_queue_cleanup(struct vb2_queue *vq, u32 state)
> +{
> +	struct visl_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct vb2_v4l2_buffer *vbuf;
> +
> +	dprintk(ctx->dev, "Cleaning up queues\n");
> +	for (;;) {
> +		if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +			vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +		else
> +			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +
> +		if (!vbuf)
> +			break;
> +
> +		v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req,
> +					   &ctx->hdl);
> +		dprintk(ctx->dev, "Marked request %p as complete\n",
> +			vbuf->vb2_buf.req_obj.req);
> +
> +		v4l2_m2m_buf_done(vbuf, state);
> +		dprintk(ctx->dev,
> +			"Marked buffer %llu as done, state is %d\n",
> +			vbuf->vb2_buf.timestamp,
> +			state);
> +	}
> +}
> +
> +static int visl_buf_out_validate(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +
> +	vbuf->field = V4L2_FIELD_NONE;
> +	return 0;
> +}
> +
> +static int visl_buf_prepare(struct vb2_buffer *vb)
> +{
> +	struct vb2_queue *vq = vb->vb2_queue;
> +	struct visl_ctx *ctx = vb2_get_drv_priv(vq);
> +	u32 plane_sz = vb2_plane_size(vb, 0);
> +	struct v4l2_pix_format *pix_fmt;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +		pix_fmt = &ctx->coded_fmt.fmt.pix;
> +	else
> +		pix_fmt = &ctx->decoded_fmt.fmt.pix;
> +
> +	if (plane_sz < pix_fmt->sizeimage) {
> +		v4l2_err(&ctx->dev->v4l2_dev, "plane[0] size is %d, sizeimage is %d\n",
> +			 plane_sz, pix_fmt->sizeimage);
> +		return -EINVAL;
> +	}
> +
> +	vb2_set_plane_payload(vb, 0, pix_fmt->sizeimage);
> +
> +	return 0;
> +}
> +
> +static int visl_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct visl_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct visl_q_data *q_data = get_q_data(ctx, vq->type);
> +	int rc = 0;
> +
> +	if (!q_data) {
> +		rc = -EINVAL;
> +		goto err;
> +	}
> +
> +	q_data->sequence = 0;
> +
> +	if (V4L2_TYPE_IS_CAPTURE(vq->type)) {
> +		ctx->capture_streamon_jiffies = get_jiffies_64();
> +		return 0;
> +	}
> +
> +	if (WARN_ON(!ctx->coded_format_desc)) {
> +		rc =  -EINVAL;
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	visl_queue_cleanup(vq, VB2_BUF_STATE_QUEUED);
> +	return rc;
> +}
> +
> +static void visl_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct visl_ctx *ctx = vb2_get_drv_priv(vq);
> +
> +	dprintk(ctx->dev, "Stop streaming\n");
> +	visl_queue_cleanup(vq, VB2_BUF_STATE_ERROR);
> +}
> +
> +static void visl_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct visl_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> +}
> +
> +static void visl_buf_request_complete(struct vb2_buffer *vb)
> +{
> +	struct visl_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +
> +	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->hdl);
> +}
> +
> +const struct vb2_ops visl_qops = {
> +	.queue_setup          = visl_queue_setup,
> +	.buf_out_validate     = visl_buf_out_validate,
> +	.buf_prepare          = visl_buf_prepare,
> +	.buf_queue            = visl_buf_queue,
> +	.start_streaming      = visl_start_streaming,
> +	.stop_streaming       = visl_stop_streaming,
> +	.wait_prepare         = vb2_ops_wait_prepare,
> +	.wait_finish          = vb2_ops_wait_finish,
> +	.buf_request_complete = visl_buf_request_complete,
> +};
> +
> +int visl_queue_init(void *priv, struct vb2_queue *src_vq,
> +		    struct vb2_queue *dst_vq)
> +{
> +	struct visl_ctx *ctx = priv;
> +	int ret;
> +
> +	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +	src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +	src_vq->drv_priv = ctx;
> +	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	src_vq->ops = &visl_qops;
> +	src_vq->mem_ops = &vb2_vmalloc_memops;
> +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	src_vq->lock = &ctx->vb_mutex;
> +	src_vq->supports_requests = true;
> +
> +	ret = vb2_queue_init(src_vq);
> +	if (ret)
> +		return ret;
> +
> +	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +	dst_vq->drv_priv = ctx;
> +	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
> +	dst_vq->ops = &visl_qops;
> +	dst_vq->mem_ops = &vb2_vmalloc_memops;
> +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +	dst_vq->lock = &ctx->vb_mutex;
> +
> +	return vb2_queue_init(dst_vq);
> +}
> +
> +int visl_request_validate(struct media_request *req)
> +{
> +	struct media_request_object *obj;
> +	struct visl_ctx *ctx = NULL;
> +	unsigned int count;
> +
> +	list_for_each_entry(obj, &req->objects, list) {
> +		struct vb2_buffer *vb;
> +
> +		if (vb2_request_object_is_buffer(obj)) {
> +			vb = container_of(obj, struct vb2_buffer, req_obj);
> +			ctx = vb2_get_drv_priv(vb->vb2_queue);
> +
> +			break;
> +		}
> +	}
> +
> +	if (!ctx)
> +		return -ENOENT;
> +
> +	count = vb2_request_buffer_cnt(req);
> +	if (!count) {
> +		v4l2_err(&ctx->dev->v4l2_dev,
> +			 "No buffer was provided with the request\n");
> +		return -ENOENT;
> +	} else if (count > 1) {
> +		v4l2_err(&ctx->dev->v4l2_dev,
> +			 "More than one buffer was provided with the request\n");
> +		return -EINVAL;
> +	}
> +
> +	return vb2_request_validate(req);
> +}
> diff --git a/drivers/media/test-drivers/visl/visl-video.h b/drivers/media/test-drivers/visl/visl-video.h
> new file mode 100644
> index 000000000000..dbfc1c6a052d
> --- /dev/null
> +++ b/drivers/media/test-drivers/visl/visl-video.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * A virtual stateless device for stateless uAPI development purposes.
> + *
> + * This tool's objective is to help the development and testing of userspace
> + * applications that use the V4L2 stateless API to decode media.
> + *
> + * A userspace implementation can use visl to run a decoding loop even when no
> + * hardware is available or when the kernel uAPI for the codec has not been
> + * upstreamed yet. This can reveal bugs at an early stage.
> + *
> + * This driver can also trace the contents of the V4L2 controls submitted to it.
> + * It can also dump the contents of the vb2 buffers through a debugfs
> + * interface. This is in many ways similar to the tracing infrastructure
> + * available for other popular encode/decode APIs out there and can help develop
> + * a userspace application by using another (working) one as a reference.
> + *
> + * Note that no actual decoding of video frames is performed by visl. The V4L2
> + * test pattern generator is used to write various debug information to the
> + * capture buffers instead.
> + *
> + * Copyright (c) Collabora, Ltd.
> + *
> + * Based on the vim2m driver, that is:
> + *
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * Pawel Osciak, <pawel@osciak.com>
> + * Marek Szyprowski, <m.szyprowski@samsung.com>
> + *
> + * Based on the vicodec driver, that is:
> + *
> + * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> + *
> + * Based on the Cedrus VPU driver, that is:
> + *
> + * Copyright (C) 2016 Florent Revest <florent.revest@free-electrons.com>
> + * Copyright (C) 2018 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + * Copyright (C) 2018 Bootlin
> + */
> +
> +#ifndef _VISL_VIDEO_H_
> +#define _VISL_VIDEO_H_
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "visl.h"
> +
> +extern const struct v4l2_ioctl_ops visl_ioctl_ops;
> +
> +extern const struct visl_ctrls visl_fwht_ctrls;
> +extern const struct visl_ctrls visl_mpeg2_ctrls;
> +extern const struct visl_ctrls visl_vp8_ctrls;
> +extern const struct visl_ctrls visl_vp9_ctrls;
> +extern const struct visl_ctrls visl_h264_ctrls;
> +
> +int visl_queue_init(void *priv, struct vb2_queue *src_vq,
> +		    struct vb2_queue *dst_vq);
> +
> +int visl_set_default_format(struct visl_ctx *ctx);
> +int visl_request_validate(struct media_request *req);
> +
> +#endif /* _VISL_VIDEO_H_ */
> diff --git a/drivers/media/test-drivers/visl/visl.h b/drivers/media/test-drivers/visl/visl.h
> new file mode 100644
> index 000000000000..a473d154805c
> --- /dev/null
> +++ b/drivers/media/test-drivers/visl/visl.h
> @@ -0,0 +1,178 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * A virtual stateless device for stateless uAPI development purposes.
> + *
> + * This tool's objective is to help the development and testing of userspace
> + * applications that use the V4L2 stateless API to decode media.
> + *
> + * A userspace implementation can use visl to run a decoding loop even when no
> + * hardware is available or when the kernel uAPI for the codec has not been
> + * upstreamed yet. This can reveal bugs at an early stage.
> + *
> + * This driver can also trace the contents of the V4L2 controls submitted to it.
> + * It can also dump the contents of the vb2 buffers through a debugfs
> + * interface. This is in many ways similar to the tracing infrastructure
> + * available for other popular encode/decode APIs out there and can help develop
> + * a userspace application by using another (working) one as a reference.
> + *
> + * Note that no actual decoding of video frames is performed by visl. The V4L2
> + * test pattern generator is used to write various debug information to the
> + * capture buffers instead.
> + *
> + * Copyright (c) Collabora, Ltd.
> + *
> + * Based on the vim2m driver, that is:
> + *
> + * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> + * Pawel Osciak, <pawel@osciak.com>
> + * Marek Szyprowski, <m.szyprowski@samsung.com>
> + *
> + * Based on the vicodec driver, that is:
> + *
> + * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> + *
> + * Based on the Cedrus VPU driver, that is:
> + *
> + * Copyright (C) 2016 Florent Revest <florent.revest@free-electrons.com>
> + * Copyright (C) 2018 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + * Copyright (C) 2018 Bootlin
> + */
> +
> +#ifndef _VISL_H_
> +#define _VISL_H_
> +
> +#include <linux/debugfs.h>
> +#include <linux/list.h>
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/tpg/v4l2-tpg.h>
> +
> +#define VISL_NAME		"visl"
> +#define VISL_M2M_NQUEUES	2
> +
> +#define TPG_STR_BUF_SZ		2048
> +
> +extern unsigned int visl_transtime_ms;
> +
> +struct visl_ctrls {
> +	const struct visl_ctrl_desc *ctrls;
> +	unsigned int num_ctrls;
> +};
> +
> +struct visl_coded_format_desc {
> +	u32 pixelformat;
> +	struct v4l2_frmsize_stepwise frmsize;
> +	const struct visl_ctrls *ctrls;
> +	unsigned int num_decoded_fmts;
> +	const u32 *decoded_fmts;
> +};
> +
> +extern const struct visl_coded_format_desc visl_coded_fmts[];
> +extern const size_t num_coded_fmts;
> +
> +enum {
> +	V4L2_M2M_SRC = 0,
> +	V4L2_M2M_DST = 1,
> +};
> +
> +extern unsigned int visl_debug;
> +#define dprintk(dev, fmt, arg...) \
> +	v4l2_dbg(1, visl_debug, &dev->v4l2_dev, "%s: " fmt, __func__, ## arg)
> +
> +extern int visl_dprintk_frame_start;
> +extern unsigned int visl_dprintk_nframes;
> +extern unsigned int keep_bitstream_buffers;
> +extern int bitstream_trace_frame_start;
> +extern unsigned int bitstream_trace_nframes;
> +
> +#define frame_dprintk(dev, current, fmt, arg...) \
> +	do { \
> +		if (visl_dprintk_frame_start > -1 && \
> +		    current >= visl_dprintk_frame_start && \
> +		    current < visl_dprintk_frame_start + visl_dprintk_nframes) \
> +			dprintk(dev, fmt, ## arg); \
> +	} while (0) \
> +
> +struct visl_q_data {
> +	unsigned int		sequence;
> +};
> +
> +struct visl_dev {
> +	struct v4l2_device	v4l2_dev;
> +	struct video_device	vfd;
> +#ifdef CONFIG_MEDIA_CONTROLLER
> +	struct media_device	mdev;
> +#endif
> +
> +	struct mutex		dev_mutex;
> +
> +	struct v4l2_m2m_dev	*m2m_dev;
> +
> +#ifdef CONFIG_VISL_DEBUGFS
> +	struct dentry		*debugfs_root;
> +	struct dentry		*bitstream_debugfs;
> +	struct list_head	bitstream_blobs;
> +	/*
> +	 * Protects the "blob" list as it can be accessed from "visl_release"
> +	 * if keep_bitstream_buffers = 0 while some other client is tracing
> +	 */
> +	struct mutex		bitstream_lock;
> +#endif
> +};
> +
> +enum visl_codec {
> +	VISL_CODEC_NONE,
> +	VISL_CODEC_FWHT,
> +	VISL_CODEC_MPEG2,
> +	VISL_CODEC_VP8,
> +	VISL_CODEC_VP9,
> +	VISL_CODEC_H264,
> +};
> +
> +struct visl_blob {
> +	struct list_head list;
> +	struct dentry *dentry;
> +	u64 streamon_jiffies;
> +	struct debugfs_blob_wrapper blob;
> +};
> +
> +struct visl_ctx {
> +	struct v4l2_fh		fh;
> +	struct visl_dev	*dev;
> +	struct v4l2_ctrl_handler hdl;
> +
> +	struct mutex		vb_mutex;
> +
> +	struct visl_q_data	q_data[VISL_M2M_NQUEUES];
> +	enum   visl_codec	current_codec;
> +
> +	const struct visl_coded_format_desc *coded_format_desc;
> +
> +	struct v4l2_format	coded_fmt;
> +	struct v4l2_format	decoded_fmt;
> +
> +	struct tpg_data		tpg;
> +	u64			capture_streamon_jiffies;
> +	char			*tpg_str_buf;
> +};
> +
> +struct visl_ctrl_desc {
> +	struct v4l2_ctrl_config cfg;
> +};
> +
> +static inline struct visl_ctx *visl_file_to_ctx(struct file *file)
> +{
> +	return container_of(file->private_data, struct visl_ctx, fh);
> +}
> +
> +static inline struct visl_ctx *visl_v4l2fh_to_ctx(struct v4l2_fh *v4l2_fh)
> +{
> +	return container_of(v4l2_fh, struct visl_ctx, fh);
> +}
> +
> +void *visl_find_control_data(struct visl_ctx *ctx, u32 id);
> +struct v4l2_ctrl *visl_find_control(struct visl_ctx *ctx, u32 id);
> +u32 visl_control_num_elems(struct visl_ctx *ctx, u32 id);
> +
> +#endif /* _VISL_H_ */
> -- 
> 2.36.1
> 
