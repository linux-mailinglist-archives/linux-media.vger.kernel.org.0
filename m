Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84F62A63A3
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 12:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729243AbgKDLxQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 06:53:16 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:50433 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728700AbgKDLwa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 06:52:30 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id aHKtkUfLD1R0xaHKwkHfqO; Wed, 04 Nov 2020 12:52:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604490743; bh=toNJ5TT0JPby3+Tl2rMCfmEOox/rzcuEcDGj7MXUk8Q=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=jKxNZlDMuc7RB6mOPhjajO/AP0b6TJc0Fo1kDtyc3uU05hNn73A4HngCxuFog9TcR
         QJHnKb76hSKxqWtWZmfwWDRz8WjqSq73kogpQ7BwTub8Sgu1PxRDrstVXVUVLuUNH+
         pNrY1abm0xu/f3HDSNjsEjQxHLDJUc5DCBXZ7ZcSXO0Ptl07NLkhwGPh6IOqUeIjoz
         Jx22QwhXf0k1cNxakn7XlalEzMe81yxJg0JX3zWKkF6iCvUUiXqSfeNU5cWEmE3zMg
         j4ii647kErwnqB5JgcKfjmE266NUsRlu8woJP7ZSgOfA0YGfutPJDKVm9a7EiZN8F+
         3K+YGMKuftvpQ==
Subject: Re: [PATCH v4 00/11] Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
References: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9c6cf9bf-f6d8-78f5-5f31-d7ea9e25da0d@xs4all.nl>
Date:   Wed, 4 Nov 2020 12:52:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEUWeBmrHKObsUsH9Y2REA2s9GY16a1AnauCpf88xRQ5Q7TIh3i3B5Tp83UDHeo1Yz1CAWxoVZqhKmzQNJKzShXQKjUqr2luai0az0E4o0/ij8ZBdGrt
 T720HDEwVqEbwQo5MbEqSkYVlJPmo1Blx7LXJhZSckP7m89lf1Jp9+qnKgb0OK2YcvjiAYhqaC+C+dePkFhMC4l15eHbMYOMc7il4oTWb4XMVx/+mrXzXX3m
 2PZyo2ZwI4e3jYpu2v3cO12TqexbaXTygGoejvE7bovCAuo1RbLx8DVvsne9cpy/yaIExQbPmgBUrCeTq5arW0O6nuPQ4slUYJu7rNRYOWhWNKBCYxxMZKzP
 xc2aQoi7Vug19IwHqhOXhdGkqKA/u/IiBi83WFOfxRzwvGfruvMydAZp2Ni4nYJusOKyDICwmpthUasAMUnHU7tNtJ9y/tfXvbSmTJCOVDbdx53KJdE6y1IL
 t9/3u95JMC5auTLSsd42YJ9Yd99J9/MiBNwl6v4x7uunj32PHU0EDuyrmGEhpLjXa/eXv1x2Mj2n3+lKsN3FBsZxR5BDaeY+El1TckCQlVvi0/gr0RJv9J4G
 17cP6JQMvzkQ5g49gzKne4a/9ge3fD1YQpPAKn3xmjwJpveh63xmut1I6vgx1EbPH7vHfV/bnlFw17466CPjWKiDZ7XQJjHcfRUMrLwByfXBYMjk9X1yDpUU
 nPtwY/RzNtdiwYj/I99jrj98+NXxHmiNSKIZBrK9VMvi8n4fn8KfwoOO8CtmgKvLb8rUQditqzzQ1N4znr6U93GGI7bFC4kHM4/kPMZKyCIZSTjpyg6BYLpF
 VHB5JFGvhJRAvOc9IpmAxOscL31y6CwC01bq1Ys1AJXrmuu0SlEQljG39bNag1uS3TmT6sOO/F1LviM9lCJ18sF7RslSYdyzqqDaWRWHMfH36Vm7gVBjycGM
 5T2hHw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/11/2020 04:08, Mirela Rabulea (OSS) wrote:
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> Changes in v4:
> The main change is using the common jpeg helpers in imx-jpeg
> Summary of changes:
> Patch 1, 2, 3, 5, 6 - no change
> Patch 4 - small update: VFL_TYPE_VIDEO-> VFL_TYPE_GRABBER and 2 typos
> Patch 7 - new, fixed a problem with v4l2-compliance streaming tests on decoder
> Patch 8,9,10 - new, changes in jpeg helpers.
> Patch 11- new, use jpeg helpers in imx-jpeg, as requested during review, requires patch 8
> 
> This patch set adds the V4L2 driver for i.MX8QXP/QM JPEG encoder/decoder
> and it's dependencies.
> The driver was tested on i.MX8QXP, using a unit test application and
> the v4l2-compliance tool, including the  streaming tests for decoder & encoder.
> 
> The output of v4l2-compliance (stable-1.20) on i.MX8QXP, decoder & encoder:
> 
> root@imx8qxpmek:/unit_tests/JPEG# ./v4l2-compliance-stable-1.20 -d /dev/video0 -s
> v4l2-compliance SHA: 6c415a11fceb32067cdb5c2e33f90dbf018182a4, 64 bits, 64-bit time_t

This is much too old. Always compile v4l2-compliance from the v4l-utils git
repository (https://git.linuxtv.org/v4l-utils.git/) to ensure you use the
latest version and the latest compliance checks.

I.e., the reported SHA should match that of HEAD.

Regards,

	Hans

> 
> Compliance test for mxc-jpeg decode device /dev/video0:
> 
> Driver Info:
> 	Driver name      : mxc-jpeg decode
> 	Card type        : mxc-jpeg decoder
> 	Bus info         : platform:58400000.jpegdec
> 	Driver version   : 5.10.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 	Detected JPEG Decoder
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
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 0 Private Controls: 0
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
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
> 	test blocking wait: OK
> 	Video Capture Multiplanar: Captured 58 buffers    
> 	test MMAP (no poll): OK
> 	Video Capture Multiplanar: Captured 58 buffers    
> 	test MMAP (select): OK
> 	Video Capture Multiplanar: Captured 58 buffers    
> 	test MMAP (epoll): OK
> 	test USERPTR (no poll): OK (Not Supported)
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for mxc-jpeg decode device /dev/video0: 52, Succeeded: 52, Failed: 0, Warnings: 0
>  
> root@imx8qxpmek:/unit_tests/JPEG# ./v4l2-compliance-stable-1.20 -d /dev/video1 -s
> v4l2-compliance SHA: 6c415a11fceb32067cdb5c2e33f90dbf018182a4, 64 bits, 64-bit time_t
> 
> Compliance test for mxc-jpeg decode device /dev/video1:
> 
> Driver Info:
> 	Driver name      : mxc-jpeg decode
> 	Card type        : mxc-jpeg decoder
> 	Bus info         : platform:58450000.jpegenc
> 	Driver version   : 5.10.0
> 	Capabilities     : 0x84204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04204000
> 		Video Memory-to-Memory Multiplanar
> 		Streaming
> 		Extended Pix Format
> 	Detected JPEG Encoder
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
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 0 Private Controls: 0
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
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
> 	test blocking wait: OK
> 	Video Capture Multiplanar: Captured 58 buffers    
> 	test MMAP (no poll): OK
> 	Video Capture Multiplanar: Captured 58 buffers    
> 	test MMAP (select): OK
> 	Video Capture Multiplanar: Captured 58 buffers    
> 	test MMAP (epoll): OK
> 	test USERPTR (no poll): OK (Not Supported)
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for mxc-jpeg decode device /dev/video1: 52, Succeeded: 52, Failed: 0, Warnings: 0
> root@imx8qxpmek:/unit_tests/JPEG# 
> 
> 
> Mirela Rabulea (11):
>   media: v4l: Add packed YUV444 24bpp pixel format
>   firmware: imx: scu-pd: Add power domains for imx-jpeg
>   media: dt-bindings: Add bindings for i.MX8QXP/QM JPEG driver
>   media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder
>   arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
>   Add maintainer for IMX jpeg v4l2 driver
>   media: imx-jpeg: Fix v4l2-compliance streaming tests on decoder
>   media: Add parsing for APP14 data segment in jpeg helpers
>   media: Quit parsing stream if doesn't start with SOI
>   media: Avoid parsing quantization and huffman tables
>   media: imx-jpeg: Use v4l2 jpeg helpers in mxc-jpeg
> 
>  .../devicetree/bindings/media/imx8-jpeg.yaml  |   83 +
>  .../media/v4l/pixfmt-packed-yuv.rst           |   37 +-
>  MAINTAINERS                                   |    8 +
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |    8 +
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   37 +
>  drivers/firmware/imx/scu-pd.c                 |    6 +
>  drivers/media/platform/Kconfig                |    2 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/imx-jpeg/Kconfig       |   11 +
>  drivers/media/platform/imx-jpeg/Makefile      |    3 +
>  drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c |  168 ++
>  drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h |  140 ++
>  drivers/media/platform/imx-jpeg/mxc-jpeg.c    | 2185 +++++++++++++++++
>  drivers/media/platform/imx-jpeg/mxc-jpeg.h    |  184 ++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
>  drivers/media/v4l2-core/v4l2-jpeg.c           |   52 +-
>  include/media/v4l2-jpeg.h                     |   16 +-
>  include/uapi/linux/videodev2.h                |    1 +
>  18 files changed, 2933 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/imx8-jpeg.yaml
>  create mode 100644 drivers/media/platform/imx-jpeg/Kconfig
>  create mode 100644 drivers/media/platform/imx-jpeg/Makefile
>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.c
>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg-hw.h
>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.c
>  create mode 100644 drivers/media/platform/imx-jpeg/mxc-jpeg.h
> 

