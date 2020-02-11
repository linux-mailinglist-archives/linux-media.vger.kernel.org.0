Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C930415997B
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2020 20:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730803AbgBKTNE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Feb 2020 14:13:04 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:56066 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730748AbgBKTND (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Feb 2020 14:13:03 -0500
Received: by mail-wm1-f68.google.com with SMTP id q9so5066485wmj.5;
        Tue, 11 Feb 2020 11:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yV/W7OjVzhnhoaIiEdL5uYFmycb/yF6SI7jbHOa+uWc=;
        b=XxVpd6ihEfbwxBp+qxEzeKf0oZ/85cRaNzdsbUqXfckCxjQG62IQBhPcPdizMenASB
         qsuC9ar8wQz/krCqUR0J+X58c079DdyqoqkUuL/Y/VdBAXETCYrbBPUbswx17VOAjVfG
         cFgYivKeJbcgOkoZFYKb7MxLWd6Pt6dlVRH+T/OXC/7DPNYK998M0fKHB7FFc2X3huGy
         EnYAuKPEFUH4HrXnbjyn8m1qB6f/zkGU9/NpXx1Bz17ehNaKkn5ruhbg1oSVA9GVKLHA
         fv83L/+adklWgobU+QCC91VEQ7A8wq8kjD+ikwZsAUzydC0CaB+NB6umg/94+bCcMQtp
         CwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yV/W7OjVzhnhoaIiEdL5uYFmycb/yF6SI7jbHOa+uWc=;
        b=cltOUuu4BZFxBiXF+Yaf495dvi6OGPIwdKnDjlH2wkoJda3GAdcapPwDkxLYP9ZcfR
         x5my3LziPfkCeVrpe6lz/hh+4Gv1GjJ/QT0kI0OjylYguR7qBEiqa4HwFNfrvC/lU453
         z9uAtxQMaD42J0wUCQlhvWmJwsXYx5PF2qdQ5X43LXLsYECfYm6xF4J3kWzcRvjvI2iA
         7sTup+MMKBsuQxNAOD064akrHXg4r+OYWDdNGCKapMTIoVIjKCCrONDCNNjzSOdP6Kf9
         20YM2xYcD/8fJcYjBDr4vdvuBSN94waqsTHdT/vZbIO0bAUXs5Kf+5KZ4UJC6HSfGQ8v
         yaTQ==
X-Gm-Message-State: APjAAAXXVexfrZC4pZB8+Qmmyo+VFmzc8rRs5b4OpaJOU70PME0MQdrB
        LmmlI7dibz+wUi9IyesFiYE=
X-Google-Smtp-Source: APXvYqzHGEsEDjUipivXQXZOOpPKSbnu17FHNNxOAmtRHg7brAQ9dvSPOc6wceHdQw0a9+uOrmOSRw==
X-Received: by 2002:a05:600c:2c06:: with SMTP id q6mr7570602wmg.154.1581448379274;
        Tue, 11 Feb 2020 11:12:59 -0800 (PST)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net. [194.152.20.232])
        by smtp.gmail.com with ESMTPSA id w1sm7076839wro.72.2020.02.11.11.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 11:12:57 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     mripard@kernel.org, wens@csie.org, linux-sunxi@googlegroups.com
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com, jernej.skrabec@siol.net
Subject: Re: [linux-sunxi] [PATCH 0/8] media: sunxi: Add DE2 rotate driver
Date:   Tue, 11 Feb 2020 20:12:56 +0100
Message-ID: <4206703.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20200124232014.574989-1-jernej.skrabec@siol.net>
References: <20200124232014.574989-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne sobota, 25. januar 2020 ob 00:20:06 CET je Jernej Skrabec napisal(a):
> Some of Allwinner SoCs like A83T and A64 SoCs contain DE2 rotate core
> which can flip image horizontal and vertical and rotate it in 90 deg.
> steps. It support a lot of output formats, but a bit less capture
> formats. All YUV input formats get converted to yuv420p, while RGB
> formats are preserved.
> 
> Patches 1-2 fix few issues with DE2 clocks.
> 
> Patches 3-4 fix register range of DE2 clocks (it would overlap with
> rotate driver)
> 
> Patches 5-8 provide binding, implement driver and add nodes.
> 
> v4l2-compliance SHA: ec55a961487b449bedbe07650674b4965814cf07, 32 bits,
> 32-bit time_t
> 
> Compliance test for sun8i-rotate device /dev/video0:
> 
> Driver Info:
>         Driver name      : sun8i-rotate
>         Card type        : sun8i-rotate
>         Bus info         : platform:sun8i-rotate
>         Driver version   : 5.5.0
>         Capabilities     : 0x84208000
>                 Video Memory-to-Memory
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04208000
>                 Video Memory-to-Memory
>                 Streaming
>                 Extended Pix Format
> 
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>         test second /dev/video0 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
>         test invalid ioctls: OK
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK
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
>         Standard Controls: 4 Private Controls: 0
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
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Total for sun8i-rotate device /dev/video0: 45, Succeeded: 45, Failed: 0,
> Warnings: 0
> 
> Best regards,
> Jernej
> 
> Jernej Skrabec (8):
>   clk: sunxi-ng: sun8i-de2: Swap A64 and H6 definitions
>   clk: sunxi-ng: sun8i-de2: Fix A83T clocks and reset

Please disregard above two patches. It turns out that many more changes are 
required to fix mess with rotation clocks and reset. I sent separate patch 
series: http://lists.infradead.org/pipermail/linux-arm-kernel/2020-February/
710242.html

Comments on the rest of the series are welcome, though.

Best regards,
Jernej

>   ARM: dts: sunxi: Fix DE2 clocks register range
>   arm64: dts: allwinner: a64: Fix display clock register range
>   media: dt-bindings: media: Add Allwinner A83T Rotate driver
>   media: sun8i: Add Allwinner A83T Rotate driver
>   ARM: dts: sun8i: a83t: Add device node for rotation core
>   arm64: dts: allwinner: a64: add node for rotation core
> 
>  .../allwinner,sun8i-a83t-de2-rotate.yaml      |  70 ++
>  MAINTAINERS                                   |   8 +
>  arch/arm/boot/dts/sun8i-a83t.dtsi             |  13 +-
>  arch/arm/boot/dts/sun8i-r40.dtsi              |   2 +-
>  arch/arm/boot/dts/sun8i-v3s.dtsi              |   2 +-
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi            |   2 +-
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  14 +-
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  49 +-
>  drivers/media/platform/Kconfig                |  12 +
>  drivers/media/platform/sunxi/Makefile         |   1 +
>  .../platform/sunxi/sun8i-rotate/Makefile      |   2 +
>  .../sunxi/sun8i-rotate/sun8i-formats.c        | 273 ++++++
>  .../sunxi/sun8i-rotate/sun8i-formats.h        |  25 +
>  .../sunxi/sun8i-rotate/sun8i-rotate.c         | 924 ++++++++++++++++++
>  .../sunxi/sun8i-rotate/sun8i-rotate.h         | 135 +++
>  15 files changed, 1512 insertions(+), 20 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-de2-rotate.yam
> l create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/Makefile
> create mode 100644
> drivers/media/platform/sunxi/sun8i-rotate/sun8i-formats.c create mode
> 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-formats.h create
> mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotate.c create
> mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotate.h




