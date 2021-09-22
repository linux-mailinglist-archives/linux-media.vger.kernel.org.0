Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2701414B87
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 16:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236140AbhIVOPd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 10:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236114AbhIVOPb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 10:15:31 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3CDEC061756
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 07:14:00 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id z12so2012401qvx.5
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 07:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KqX+VtUoF+9CPexwv22MK/yzAk7W0pREam0Hxx6uxks=;
        b=Fzi/k7Helf00gfbOosFH6EiIk9Www3OVMs47w7UhDmBuzDaBk08YrPotphGkvENyRL
         UCw8RXlGWsMNhdra1XJ6HY+mySkH3HBBY2PeXr0L2C6p3wZZUWkoFbbseHfiD0RFhyDK
         6nx59rBxu93EwMObnGtr9blmM3zWZhlLV0By0fsi1efdMo4a9AM/3yXClCoAhv9LfyTr
         X/EQ8TcbTSTym7YpSbdIK4hLOgJFAFhnx8QPW+Wb5eMpwZE1OEErEt0jjLhE2DnnfF2M
         iSoQC2FhlR6tlNa8ne8JQXXe7X96MRrdMIlpdRHKqargYYM7GFZFAuIC3+6CydwA5zj5
         /jwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KqX+VtUoF+9CPexwv22MK/yzAk7W0pREam0Hxx6uxks=;
        b=nenAnS9PVneRxtx1fg7t32e7Y1YqcbjT5mU8asBH6TVBwcPbYts2e8V5hw0mjJ2FkI
         6JjwTA+FuNFYL/quqUEX1oCqKWWYbmGCchOLziVoNa+UnueqdkVl6879IZg79ga8xJVG
         RDTaFy8OD3aG/biQ2nM49kUBBJ0WFbUWBnuKo90UFkURPk52qxDgMEClHeublf3EJSUb
         2Z1fKlcz4jq1jnQQlJKySSSKVW/1l3E4O/O6Bn+/uD2GyyrbuPmzMMSL4FGh/WjrGNbh
         FCh1fk9q5o+Ta2MoJbKYHhHFlduIQJFvy+5qpEE10+9zkeh5hUtRo/3LEhJa9W6v++OP
         kyzA==
X-Gm-Message-State: AOAM531hNM11GjB8uBecAoED2LdYrbi2Zsa4lSeXcAzhBwuu50mmW9xE
        MIsGFRKIhnc/bhSvuxUsVciirA==
X-Google-Smtp-Source: ABdhPJww6d64A3eJrEJ2j2aDSRRk8jYsUUJlvLtY8UfxXN0pAhor/30wDN7ZhBuJog82EqycwETsCg==
X-Received: by 2002:a05:6214:1233:: with SMTP id p19mr34518895qvv.20.1632320040050;
        Wed, 22 Sep 2021 07:14:00 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id c25sm765836qtm.78.2021.09.22.07.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 07:13:59 -0700 (PDT)
Message-ID: <7591d62b4aedb0ad789f09d90695c700c65df53d.camel@ndufresne.ca>
Subject: Re: [PATCH v9 00/13] amphion video decoder/encoder driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date:   Wed, 22 Sep 2021 10:13:57 -0400
In-Reply-To: <cover.1631521295.git.ming.qian@nxp.com>
References: <cover.1631521295.git.ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ming,

Le lundi 13 septembre 2021 à 17:11 +0800, Ming Qian a écrit :
> Hi all,
> 
> This patch series adds support for
> the amphion video encoder and decoder
> via the VPU block present in imx8q platforms.
> Currently, support for IMX8QXP and IMX8QM is included.

I've been trying to test this driver, based it on mainline 5.15-rc2 in absence
of recommendation here. There seems to be poor mainline support for this board,
notably only 1 CPU come up. Finally, I could not test anything as the driver
failed to boot the decoders and encoder cores:

[   30.766160] [VPU CORE][0] decoder boot
[   31.873175] [VPU CORE][0] decoder boot timeout
[   31.878057] [VPU V4L2]there is no core for decoder
[ 1766.495963] [VPU CORE][1] encoder boot
[ 1767.524957] [VPU CORE][1] encoder boot timeout
[ 1767.529724] [VPU V4L2]there is no core for encoder

Please, let me know how I can get passed these issues. I have used firmwares
referenced in Yocto tree:

  https://www.nxp.com/lgfiles/NMG/MAD/YOCTO/firmware-imx-7.9.bin

Firmware for this driver will also be a subject to tackle. In an ideal world,
the "self extracted" script requirement to accept your EULA would need to be
waved, and distribution of the firmware should go into linux-firmwares. I
believe firmwares are still allowed to have some user agreement, but I suppose
there must be guidelines, best is to ask there directly.

regards,
Nicolas

> 
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
> v9
> - drop V4L2_BUF_FLAG_CODECCONFIG
> - drop V4L2_EVENT_CODEC_ERROR
> - drop V4L2_EVENT_SKIP
> - use the v4l2_buffer.sequence counter
> - fix some build warnings with W=1 reported by kernel test robot
> 
> v8
> - move driver from driver/media/platform/imx/vpu-8q to
>   driver/media/platform/amphion
> - rename driver name to amphion
> - remove imx_vpu.h
> - move the definition of V4L2_EVENT_CODEC_ERROR to videodev2.h
> - move the definition of V4L2_EVENT_SKIP to videodev2.h
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
> Compliance test for amphion-vpu device /dev/video0:
> 
> Driver Info:
> 	Driver name      : amphion-vpu
> 	Card type        : amphion vpu decoder
> 	Bus info         : platform: amphion-vpu
> 	Driver version   : 5.14.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 	Detected Stateful Decoder
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 3 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Total for amphion-vpu device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0
> 
> # v4l2-compliance -d /dev/video1
> v4l2-compliance 1.21.0-4838, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 22466798f9a9 2021-08-25 11:05:21
> 
> Compliance test for amphion-vpu device /dev/video1:
> 
> Driver Info:
> 	Driver name      : amphion-vpu
> 	Card type        : amphion vpu encoder
> 	Bus info         : platform: amphion-vpu
> 	Driver version   : 5.14.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 	Detected Stateful Encoder
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video1 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 20 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Total for amphion-vpu device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0
> 
> Ming Qian (13):
>   dt-bindings: media: amphion: add amphion video codec bindings
>   media:Add nt8 and nt10 video format.
>   media: amphion: add amphion vpu device driver
>   media: amphion: add vpu core driver
>   media: amphion: implement vpu core communication based on mailbox
>   media: amphion: add vpu v4l2 m2m support
>   media: amphion: add v4l2 m2m vpu encoder stateful driver
>   media: amphion: add v4l2 m2m vpu decoder stateful driver
>   media: amphion: implement windsor encoder rpc interface
>   media: amphion: implement malone decoder rpc interface
>   ARM64: dts: freescale: imx8q: add imx vpu codec entries
>   firmware: imx: scu-pd: imx8q: add vpu mu resources
>   MAINTAINERS: add AMPHION VPU CODEC V4L2 driver entry
> 
>  .../bindings/media/amphion,vpu.yaml           |  178 ++
>  .../media/v4l/pixfmt-yuv-planar.rst           |   15 +
>  MAINTAINERS                                   |    9 +
>  .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   72 +
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   17 +
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   24 +
>  drivers/firmware/imx/scu-pd.c                 |    4 +
>  drivers/media/platform/Kconfig                |   19 +
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/amphion/Makefile       |   23 +
>  drivers/media/platform/amphion/vdec.c         | 1652 ++++++++++++++++
>  drivers/media/platform/amphion/venc.c         | 1382 ++++++++++++++
>  drivers/media/platform/amphion/vpu.h          |  333 ++++
>  drivers/media/platform/amphion/vpu_cmds.c     |  435 +++++
>  drivers/media/platform/amphion/vpu_cmds.h     |   25 +
>  drivers/media/platform/amphion/vpu_codec.h    |   68 +
>  drivers/media/platform/amphion/vpu_color.c    |  192 ++
>  drivers/media/platform/amphion/vpu_core.c     |  901 +++++++++
>  drivers/media/platform/amphion/vpu_core.h     |   16 +
>  drivers/media/platform/amphion/vpu_dbg.c      |  496 +++++
>  drivers/media/platform/amphion/vpu_defs.h     |  186 ++
>  .../media/platform/amphion/vpu_dev_imx8q.c    |   72 +
>  drivers/media/platform/amphion/vpu_drv.c      |  215 +++
>  drivers/media/platform/amphion/vpu_helpers.c  |  453 +++++
>  drivers/media/platform/amphion/vpu_helpers.h  |   72 +
>  drivers/media/platform/amphion/vpu_imx8q.c    |  218 +++
>  drivers/media/platform/amphion/vpu_imx8q.h    |  116 ++
>  drivers/media/platform/amphion/vpu_log.h      |   44 +
>  drivers/media/platform/amphion/vpu_malone.c   | 1683 +++++++++++++++++
>  drivers/media/platform/amphion/vpu_malone.h   |   42 +
>  drivers/media/platform/amphion/vpu_mbox.c     |  126 ++
>  drivers/media/platform/amphion/vpu_mbox.h     |   16 +
>  drivers/media/platform/amphion/vpu_msgs.c     |  413 ++++
>  drivers/media/platform/amphion/vpu_msgs.h     |   14 +
>  drivers/media/platform/amphion/vpu_rpc.c      |  263 +++
>  drivers/media/platform/amphion/vpu_rpc.h      |  463 +++++
>  drivers/media/platform/amphion/vpu_v4l2.c     |  625 ++++++
>  drivers/media/platform/amphion/vpu_v4l2.h     |   53 +
>  drivers/media/platform/amphion/vpu_windsor.c  | 1244 ++++++++++++
>  drivers/media/platform/amphion/vpu_windsor.h  |   39 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
>  include/uapi/linux/videodev2.h                |    4 +
>  42 files changed, 12226 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/amphion,vpu.yaml
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
>  create mode 100644 drivers/media/platform/amphion/Makefile
>  create mode 100644 drivers/media/platform/amphion/vdec.c
>  create mode 100644 drivers/media/platform/amphion/venc.c
>  create mode 100644 drivers/media/platform/amphion/vpu.h
>  create mode 100644 drivers/media/platform/amphion/vpu_cmds.c
>  create mode 100644 drivers/media/platform/amphion/vpu_cmds.h
>  create mode 100644 drivers/media/platform/amphion/vpu_codec.h
>  create mode 100644 drivers/media/platform/amphion/vpu_color.c
>  create mode 100644 drivers/media/platform/amphion/vpu_core.c
>  create mode 100644 drivers/media/platform/amphion/vpu_core.h
>  create mode 100644 drivers/media/platform/amphion/vpu_dbg.c
>  create mode 100644 drivers/media/platform/amphion/vpu_defs.h
>  create mode 100644 drivers/media/platform/amphion/vpu_dev_imx8q.c
>  create mode 100644 drivers/media/platform/amphion/vpu_drv.c
>  create mode 100644 drivers/media/platform/amphion/vpu_helpers.c
>  create mode 100644 drivers/media/platform/amphion/vpu_helpers.h
>  create mode 100644 drivers/media/platform/amphion/vpu_imx8q.c
>  create mode 100644 drivers/media/platform/amphion/vpu_imx8q.h
>  create mode 100644 drivers/media/platform/amphion/vpu_log.h
>  create mode 100644 drivers/media/platform/amphion/vpu_malone.c
>  create mode 100644 drivers/media/platform/amphion/vpu_malone.h
>  create mode 100644 drivers/media/platform/amphion/vpu_mbox.c
>  create mode 100644 drivers/media/platform/amphion/vpu_mbox.h
>  create mode 100644 drivers/media/platform/amphion/vpu_msgs.c
>  create mode 100644 drivers/media/platform/amphion/vpu_msgs.h
>  create mode 100644 drivers/media/platform/amphion/vpu_rpc.c
>  create mode 100644 drivers/media/platform/amphion/vpu_rpc.h
>  create mode 100644 drivers/media/platform/amphion/vpu_v4l2.c
>  create mode 100644 drivers/media/platform/amphion/vpu_v4l2.h
>  create mode 100644 drivers/media/platform/amphion/vpu_windsor.c
>  create mode 100644 drivers/media/platform/amphion/vpu_windsor.h
> 
> 
> base-commit: 9c3a0f285248899dfa81585bc5d5bc9ebdb8fead


