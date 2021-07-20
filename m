Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C4A3CFD3D
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 17:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239702AbhGTOeP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jul 2021 10:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238500AbhGTONY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jul 2021 10:13:24 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24642C0613E7
        for <linux-media@vger.kernel.org>; Tue, 20 Jul 2021 07:48:19 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id w26so15474799qto.9
        for <linux-media@vger.kernel.org>; Tue, 20 Jul 2021 07:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=PVa7KxOOPDISu98s6IbsRPYczplGlrPqBRZEFHA/0lI=;
        b=J1jzjIB3a65IKpjCydA4rawfWbUF6EQn1lHzc7HacpUcqCqP4t/Dr3qZKvmR1uAQT/
         jusH6NHunz9Y6h/EMFW9T2sqrYpbs8K1MkfWgbliwqSG80pmzs8Ne797tEGzNKERMUFf
         UO3wK1hjirnf7iNoZdkUtQPa3fny5jhmDDT/oOC1YWk+q5A6wAalR/lU6gtO8WKb3TKS
         eEeLxyonAgHTbXgMogXPyX8ES4jqxiPgfg2KOQFK98+uLJp16MOlIvKWEAXp3+EmjJ2U
         jbdBSPKxf1ui8c1HHGaDMOWwSgRgnfnziPULEVYNdKryZBcPkL57UpfL1ai0dGseBRS0
         I+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PVa7KxOOPDISu98s6IbsRPYczplGlrPqBRZEFHA/0lI=;
        b=QzeYWUu+ECX24ggsq6rjZuznThqTdr8/SNIwZUEXlGWrlcaExcmwWlU9nBCUIbGRrj
         rI9R/MrD4tFsqpyQOkB1MIlunTmgIkgonFr8iWWkUAzIbyr45c5hWG266OCCufDLH6I2
         ARD9lhwyu96ziNt4zadIS5GoffpE2H+PA9Q42+5+47LPiA3BTOv/Q+v0BY0q8i48qEZL
         b9bj2xs6A+Cyylmw4+hIoN3tGASxwdvaGkBbjMz8W4wpYg37UGwISNI0YFqRcoLmpOe3
         GFlBMGkPKt2MhsCMEzZU1UotI8VlIEew86Pg0/UkL5o20PbLhHNo870H64UiF6VxcU0x
         vaoA==
X-Gm-Message-State: AOAM532GI96YzhxfBCn3/qf7Wy8fAiOcv0fI9H5Mo3taOc6hG/Gum5Rb
        z3U6/VmHhJpjx4MGTJusq+bppw==
X-Google-Smtp-Source: ABdhPJwPuMdGfLCs0bdR/gCThis59hiPfhPYPYohTlV7QcMmqEU0NqmAlea4WKTucevHUAvY9EpKWg==
X-Received: by 2002:ac8:6c51:: with SMTP id z17mr26968603qtu.271.1626792498312;
        Tue, 20 Jul 2021 07:48:18 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id g24sm5080296qtr.86.2021.07.20.07.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 07:48:17 -0700 (PDT)
Message-ID: <39ee643d7a7721f8ad61e7ebc92a21ebcdeb4172.camel@ndufresne.ca>
Subject: Re: [PATCH 0/5] imx8q video decoder/encoder driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date:   Tue, 20 Jul 2021 10:48:15 -0400
In-Reply-To: <cover.1622429025.git.ming.qian@nxp.com>
References: <cover.1622429025.git.ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 31 mai 2021 à 10:51 +0800, Ming Qian a écrit :
> Hi all,
> 
> This patch series adds support for
> the imx8q video encoder and decoder
> via the VPU block present in imx8q platforms.
> Currently, support for IMX8QXP and IMX8QM is included.

Hi, 

might be repeating myself a little, but again, thanks for this hard work, this
is great. What I'd like to ask and raise is that this driver is mostly to
support Amphion CODEC (now owned by Allegro). The IMX/NXP specific is likely
larger then any other similar integration (like Hantro Codec or DesignWare HDMI
etc.). We likely don't want to reproduce error from the past. We should learn
from STM folks mistake. They created stmmac which we have to live with the name
now even though this endup being a DesignWare generic driver, used on a very
large amount of SoC today.

So perhaps this driver should be renamed and moved into media/platform/amphion.
If NXP remains the only SoC using it, it should have no side effect, you will
keep maintaining / owning this driver, otherwise it other integration will just
have to introduce a bit of infrastructure to abstract the SoC specific code
(like was done in Hantro to support IMX8M).

regards,
Nicolas

> 
> It features decoding for the following formats:
> - H.264
> - HEVC
> - MPEG4
> - MPEG2
> - MJPEG
> - VC1
> - VP8
> - AVS
> 
> It features encoding for the following formats:
> - H.264
> 
> The driver creates a separate device node for
> the encoder and decoder.
> 
> Compliance
> ==========
> # v4l2-compliance -d /dev/video0
> v4l2-compliance SHA: not available
> , 64 bits, 64-bit time_t
> 
> Compliance test for vpu B0 device /dev/video0:
> 
> Driver Info:
> 	Driver name      : vpu B0
> 	Card type        : imx vpu decoder
> 	Bus info         : platform: imx8q-vpu
> 	Driver version   : 5.10.35
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> 	test invalid ioctls: OK
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
> 	Standard Controls: 3 Private Controls: 2
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK
> 	test Composing: OK
> 	test Scaling: OK
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
> Total for vpu b0 device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0
> 
> # v4l2-compliance -d /dev/video1
> v4l2-compliance SHA: not available
> , 64 bits, 64-bit time_t
> 
> Compliance test for imx vpu encoder device /dev/video1:
> 
> Driver Info:
> 	Driver name      : imx vpu encoder
> 	Card type        : imx vpu encoder
> 	Bus info         : platform: imx8q-vpu
> 	Driver version   : 5.10.35
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
> 
> Allow for multiple opens:
> 	test second /dev/video1 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> 	test invalid ioctls: OK
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
> Total for imx vpu encoder device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0
> 
> Ming Qian (5):
>   dt-bindings: media: imx8q: add imx video codec bindings
>   media: v4l: add some definition of v4l2
>     colorspace/xfer_func/ycbcr_encoding
>   media: imx: imx8q: add v4l2 m2m video codec driver
>   ARM64: dts: freescale: imx8q: add imx vpu codec entries
>   firmware: imx: scu-pd: imx8q: add vpu mu resources
> 
>  .../bindings/media/nxp,imx8q-vpu.yaml         |  201 ++
>  .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi |   76 +
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |   22 +
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   27 +
>  drivers/firmware/imx/scu-pd.c                 |    4 +
>  drivers/media/platform/Kconfig                |    2 +
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/imx/Kconfig            |   19 +
>  drivers/media/platform/imx/Makefile           |    1 +
>  drivers/media/platform/imx/vpu-8q/Makefile    |   23 +
>  drivers/media/platform/imx/vpu-8q/vdec.c      | 1783 +++++++++++++++++
>  drivers/media/platform/imx/vpu-8q/venc.c      | 1411 +++++++++++++
>  drivers/media/platform/imx/vpu-8q/vpu.h       |  339 ++++
>  drivers/media/platform/imx/vpu-8q/vpu_cmds.c  |  443 ++++
>  drivers/media/platform/imx/vpu-8q/vpu_cmds.h  |   34 +
>  drivers/media/platform/imx/vpu-8q/vpu_codec.h |   77 +
>  drivers/media/platform/imx/vpu-8q/vpu_color.c |  201 ++
>  drivers/media/platform/imx/vpu-8q/vpu_core.c  |  923 +++++++++
>  drivers/media/platform/imx/vpu-8q/vpu_core.h  |   26 +
>  drivers/media/platform/imx/vpu-8q/vpu_dbg.c   |  505 +++++
>  drivers/media/platform/imx/vpu-8q/vpu_defs.h  |  194 ++
>  .../media/platform/imx/vpu-8q/vpu_dev_imx8q.c |   82 +
>  drivers/media/platform/imx/vpu-8q/vpu_drv.c   |  248 +++
>  .../media/platform/imx/vpu-8q/vpu_helpers.c   |  405 ++++
>  .../media/platform/imx/vpu-8q/vpu_helpers.h   |   80 +
>  drivers/media/platform/imx/vpu-8q/vpu_imx8q.c |  227 +++
>  drivers/media/platform/imx/vpu-8q/vpu_imx8q.h |  125 ++
>  drivers/media/platform/imx/vpu-8q/vpu_log.h   |   53 +
>  .../media/platform/imx/vpu-8q/vpu_malone.c    | 1744 ++++++++++++++++
>  .../media/platform/imx/vpu-8q/vpu_malone.h    |   51 +
>  drivers/media/platform/imx/vpu-8q/vpu_mbox.c  |  135 ++
>  drivers/media/platform/imx/vpu-8q/vpu_mbox.h  |   25 +
>  drivers/media/platform/imx/vpu-8q/vpu_msgs.c  |  420 ++++
>  drivers/media/platform/imx/vpu-8q/vpu_msgs.h  |   23 +
>  drivers/media/platform/imx/vpu-8q/vpu_rpc.c   |  266 +++
>  drivers/media/platform/imx/vpu-8q/vpu_rpc.h   |  472 +++++
>  drivers/media/platform/imx/vpu-8q/vpu_v4l2.c  |  730 +++++++
>  drivers/media/platform/imx/vpu-8q/vpu_v4l2.h  |   56 +
>  .../media/platform/imx/vpu-8q/vpu_windsor.c   | 1253 ++++++++++++
>  .../media/platform/imx/vpu-8q/vpu_windsor.h   |   48 +
>  include/linux/imx_vpu.h                       |   19 +
>  include/uapi/linux/imx_vpu.h                  |  120 ++
>  include/uapi/linux/videodev2.h                |   30 +
>  43 files changed, 12925 insertions(+)
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


