Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 300F33FF1A6
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 18:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346423AbhIBQlG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 12:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346395AbhIBQlF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 12:41:05 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84063C061760
        for <linux-media@vger.kernel.org>; Thu,  2 Sep 2021 09:40:06 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id u19so3829051edb.3
        for <linux-media@vger.kernel.org>; Thu, 02 Sep 2021 09:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jLaH+VX8tsM6urEZt3hoVOWQpBTmVkp/IO8G111bwQM=;
        b=aSmRg2bMTqEUNm+WbGglP6MGuiRwc+Wg5m5l2OcB8+YsXLSdmtWYAC6g4pUW+qbLFG
         DIu4SnyuAGL/YlOAONCInLBOG35lwQTP79mPFHS4IM4wOdGpC+uy1deNhAGLZQR33m4P
         s4bRkmqYosL5Nf7Ahcn+58A8xd7MKzXl7pLUTxGNC2thHUuakJq8jdq8d1yEl6giq15e
         Xtc2YZimnogqzCRXLqUQc9PX42Kn2DRvlkfWO/EscAL1DoQXZZFWYypt5JJkNegDyGrJ
         I/3aWbyULahyfq58tsBbQs/HFdoMy9sUsi2O9ZALlIqJvlt8o06jXFS01DyEQlgEkyW/
         YSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jLaH+VX8tsM6urEZt3hoVOWQpBTmVkp/IO8G111bwQM=;
        b=ra/djak1J7tAh62+zKOTt8h6C65Ssa6+9xuDh9KjEC0/0aHp2Jg0TUSzHTx9zyYWeJ
         OgHr1W4Jwc4V5G1TLjevkzJngJH7KeY1ycEOa3hvTeJpkFTyyz6LZCI/MtYVO2+9DYbz
         hgnFQaxjMGu8JzL5S93LDxXZx2KZmsx5eCXv9/30Qti5MkO3zZ4hIB2W9PDivZfG0obj
         dXreBPvfKZeolKQ5B3On/pWrSZsytaeJcPly/rFQOwIu2t71CnIG7O31784GF9CrBoPe
         0g2K8cmfmw7dXGaT6EtTfCZq757EZMArJwfYIER3kULXE35ciMsH0NKI6YbWk64bivJB
         odVA==
X-Gm-Message-State: AOAM533IjFYp7M+KH0XtG1a8996iuxj2es30zMrijJ2wk/8i9Wyap6wK
        MuMvy41gpshVBf7ZpxSnv+CI/OW7jZcm+EiOvLAbhw==
X-Google-Smtp-Source: ABdhPJwo6tLB66xQ7P4AgTXmFbJTraA0umjbAqTTESTLryoPc0hMhPXn6AD6Km9vyRpkDaY7QRkFr3HvGBodCBzYUoA=
X-Received: by 2002:a05:6402:2302:: with SMTP id l2mr4368459eda.13.1630600805014;
 Thu, 02 Sep 2021 09:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1630377507.git.ming.qian@nxp.com>
In-Reply-To: <cover.1630377507.git.ming.qian@nxp.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Thu, 2 Sep 2021 13:39:53 -0300
Message-ID: <CAAEAJfBO7disDg2==AUCiPUL4rAGfSaT4Wc-e8q=Po=t-FkmxQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/14] imx8q video decoder/encoder driver
To:     Ming Qian <ming.qian@nxp.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, aisheng.dong@nxp.com,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ming,

On Tue, 31 Aug 2021 at 00:00, Ming Qian <ming.qian@nxp.com> wrote:
>
> Hi all,
>
> This patch series adds support for
> the imx8q video encoder and decoder
> via the VPU block present in imx8q platforms.
> Currently, support for IMX8QXP and IMX8QM is included.
>

NAK.

Nicolas gave you important feedback on your first version,
and you have ignored that, as far as I can see.

It seems very rude to do that, please avoid ignoring
feedback from reviewers and maintainers.

https://www.spinics.net/lists/linux-media/msg196342.html

Please move the driver to drivers/media/platform/amphion,
rename the driver name, compatible, etc. This is the same
case as CODA driver, Hantro driver, etc.

I sincerely hope you will not ignore this, and then send a v8 version ;-)

Thanks!
Ezequiel

> It features decoding for the following formats:
> - H.264
> - HEVC
> - MPEG4
> - MPEG2
> - VC1
> - VP8
>
> It features encoding for the following formats:
> - H.264
>
> The driver creates a separate device node for the encoder and decoder.
>
> Changelog:
>
> v7
> - fix build warnings with W=1 reported by kernel test robot
>
> v6:
> - rename V4L2_PIX_FMT_NT8 to V4L2_PIX_FMT_NV12_8L128
> - rename V4L2_PIX_FMT_NT10 to V4L2_PIX_FMT_NV12_10BE_8L128
>
> v5:
> - move some definition from imx_vph.h to videodev2.h
> - remove some unnecessary content
> - add some documentation descriptions
> - pass the lateset v4l2-compliance test
>
> v4:
> - redefine the memory-region in devicetree bindings documentation
> - use v4l2's mechanism to implement synchronize queuing ioctl
> - remove the unnecessary mutex ioctl_sync
> - don't notify source change event if the parameters are same as previously established
> - add flag V4L2_FMT_FLAG_DYN_RESOLUTION to decoder's capture format
>
> v3:
> - don't make vpu device node a simple-bus
> - trigger probing vpu core in the driver
> - remove unnecessary vpu core index property
>
> v2:
> - fix dt bindings build error
> - split driver patch into several parts to avoid exceeding bytes limit
>
> Compliance
> ==========
> # v4l2-compliance -d /dev/video0
> v4l2-compliance 1.21.0-4838, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 22466798f9a9 2021-08-25 11:05:21
>
> Compliance test for imx8q-vpu device /dev/video0:
>
> Driver Info:
>         Driver name      : imx8q-vpu
>         Card type        : imx8q vpu decoder
>         Bus info         : platform: imx8q-vpu
>         Driver version   : 5.14.0
>         Capabilities     : 0x84204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>         Detected Stateful Decoder
>
> Required ioctls:
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
>         test Composing: OK
>         test Scaling: OK (Not Supported)
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>
> Total for imx8q-vpu device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0
>
> # v4l2-compliance -d /dev/video1
> v4l2-compliance 1.21.0-4838, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 22466798f9a9 2021-08-25 11:05:21
>
> Compliance test for imx8q-vpu device /dev/video1:
>
> Driver Info:
>         Driver name      : imx8q-vpu
>         Card type        : imx8q vpu encoder
>         Bus info         : platform: imx8q-vpu
>         Driver version   : 5.14.0
>         Capabilities     : 0x84204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>         Detected Stateful Encoder
>
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
>         test invalid ioctls: OK
>
> Allow for multiple opens:
>         test second /dev/video1 open: OK
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
>         Standard Controls: 20 Private Controls: 0
>
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
>
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>
> Total for imx8q-vpu device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0
>
> Ming Qian (14):
>   dt-bindings: media: imx8q: add imx video codec bindings
>   media:Add nt8 and nt10 video format.
>   media:Add v4l2 buf flag codec data.
>   media: imx: imx8q: add imx8q vpu device driver
>   media: imx: imx8q: add vpu core driver
>   media: imx: imx8q: implement vpu core communication based on mailbox
>   media: imx: imx8q: add vpu v4l2 m2m support
>   media: imx: imx8q: add v4l2 m2m vpu encoder stateful driver
>   media: imx: imx8q: add v4l2 m2m vpu decoder stateful driver
>   media: imx: imx8q: implement windsor encoder rpc interface
>   media: imx: imx8q: implement malone decoder rpc interface
>   ARM64: dts: freescale: imx8q: add imx vpu codec entries
>   firmware: imx: scu-pd: imx8q: add vpu mu resources
>   MAINTAINERS: add NXP IMX8Q VPU CODEC V4L2 driver entry
>
>  .../bindings/media/nxp,imx8q-vpu.yaml         |  178 ++
>  .../userspace-api/media/v4l/buffer.rst        |    7 +
>  .../media/v4l/pixfmt-yuv-planar.rst           |   15 +
>  .../media/v4l/vidioc-dqevent.rst              |   12 +
>  MAINTAINERS                                   |   10 +
>  .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   72 +
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   17 +
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   24 +
>  drivers/firmware/imx/scu-pd.c                 |    4 +
>  drivers/media/platform/Kconfig                |    2 +
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/imx/Kconfig            |   19 +
>  drivers/media/platform/imx/Makefile           |    1 +
>  drivers/media/platform/imx/vpu-8q/Makefile    |   23 +
>  drivers/media/platform/imx/vpu-8q/vdec.c      | 1684 +++++++++++++++++
>  drivers/media/platform/imx/vpu-8q/venc.c      | 1383 ++++++++++++++
>  drivers/media/platform/imx/vpu-8q/vpu.h       |  333 ++++
>  drivers/media/platform/imx/vpu-8q/vpu_cmds.c  |  435 +++++
>  drivers/media/platform/imx/vpu-8q/vpu_cmds.h  |   25 +
>  drivers/media/platform/imx/vpu-8q/vpu_codec.h |   68 +
>  drivers/media/platform/imx/vpu-8q/vpu_color.c |  192 ++
>  drivers/media/platform/imx/vpu-8q/vpu_core.c  |  911 +++++++++
>  drivers/media/platform/imx/vpu-8q/vpu_core.h  |   16 +
>  drivers/media/platform/imx/vpu-8q/vpu_dbg.c   |  496 +++++
>  drivers/media/platform/imx/vpu-8q/vpu_defs.h  |  186 ++
>  .../media/platform/imx/vpu-8q/vpu_dev_imx8q.c |   72 +
>  drivers/media/platform/imx/vpu-8q/vpu_drv.c   |  217 +++
>  .../media/platform/imx/vpu-8q/vpu_helpers.c   |  453 +++++
>  .../media/platform/imx/vpu-8q/vpu_helpers.h   |   72 +
>  drivers/media/platform/imx/vpu-8q/vpu_imx8q.c |  218 +++
>  drivers/media/platform/imx/vpu-8q/vpu_imx8q.h |  116 ++
>  drivers/media/platform/imx/vpu-8q/vpu_log.h   |   44 +
>  .../media/platform/imx/vpu-8q/vpu_malone.c    | 1683 ++++++++++++++++
>  .../media/platform/imx/vpu-8q/vpu_malone.h    |   42 +
>  drivers/media/platform/imx/vpu-8q/vpu_mbox.c  |  126 ++
>  drivers/media/platform/imx/vpu-8q/vpu_mbox.h  |   16 +
>  drivers/media/platform/imx/vpu-8q/vpu_msgs.c  |  413 ++++
>  drivers/media/platform/imx/vpu-8q/vpu_msgs.h  |   14 +
>  drivers/media/platform/imx/vpu-8q/vpu_rpc.c   |  257 +++
>  drivers/media/platform/imx/vpu-8q/vpu_rpc.h   |  463 +++++
>  drivers/media/platform/imx/vpu-8q/vpu_v4l2.c  |  654 +++++++
>  drivers/media/platform/imx/vpu-8q/vpu_v4l2.h  |   44 +
>  .../media/platform/imx/vpu-8q/vpu_windsor.c   | 1244 ++++++++++++
>  .../media/platform/imx/vpu-8q/vpu_windsor.h   |   39 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
>  include/linux/imx_vpu.h                       |   11 +
>  include/uapi/linux/imx_vpu.h                  |   18 +
>  include/uapi/linux/videodev2.h                |    5 +
>  48 files changed, 12338 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
>  create mode 100644 drivers/media/platform/imx/Kconfig
>  create mode 100644 drivers/media/platform/imx/Makefile
>  create mode 100644 drivers/media/platform/imx/vpu-8q/Makefile
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vdec.c
>  create mode 100644 drivers/media/platform/imx/vpu-8q/venc.c
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu.h
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_cmds.c
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_cmds.h
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_codec.h
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_color.c
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_core.c
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_core.h
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_dbg.c
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_defs.h
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_dev_imx8q.c
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_drv.c
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_helpers.c
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_helpers.h
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_imx8q.c
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_imx8q.h
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_log.h
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_malone.c
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_malone.h
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_mbox.c
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_mbox.h
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_msgs.c
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_msgs.h
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_rpc.c
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_rpc.h
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_v4l2.c
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_v4l2.h
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_windsor.c
>  create mode 100644 drivers/media/platform/imx/vpu-8q/vpu_windsor.h
>  create mode 100644 include/linux/imx_vpu.h
>  create mode 100644 include/uapi/linux/imx_vpu.h
>
>
> base-commit: 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead
> --
> 2.32.0
>
