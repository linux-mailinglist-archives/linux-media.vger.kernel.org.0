Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE5612D3046
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 17:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730227AbgLHQzR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 11:55:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbgLHQzR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 11:55:17 -0500
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA03C0617A6
        for <linux-media@vger.kernel.org>; Tue,  8 Dec 2020 08:54:07 -0800 (PST)
Received: by mail-qt1-x843.google.com with SMTP id h19so10125019qtq.13
        for <linux-media@vger.kernel.org>; Tue, 08 Dec 2020 08:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Li9FNCs+r58sHgUOn9VW6RK53rMll07O7ewT2tY4odA=;
        b=Fn4TFkg8LVUpkF3uZWMrIIVrR9qv9K0uaOsxdLqirCT+GuhPpBkfyqJKKmc2MzNXA1
         CRsNfWYertDeSU9pI/MquqCbO8CajOsm/tX2jbcUFfGy1TNFzrKDx3sO+0qJvCRQN6It
         KtZCzqktmOs+rauKpG+D/8qrzev7UP5cRcFfSqwULKcchhYq28uB38TTglkuOKZoDltL
         kxJKdECY1Prl+vhlg1wC5vt2ppSsHViN5lVT9PcZZUH8P1J+7StadDEAAHDfTa0Uj/tk
         6B+Rkoiv3pUmvePjwvEyF8SgAxltomKubLQuTu9IRUWl/fbpNnYxRAyeRxLCpZqJbLHk
         T2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Li9FNCs+r58sHgUOn9VW6RK53rMll07O7ewT2tY4odA=;
        b=WVTUp7hNffvCKh0tkBWkVvboUOy0pvGK9S3jULX1ZRY4PS5GXDjPA4aeLvrN/OPdK5
         lmwzZ/9xaxiYCCCAM2EOqPbDjAXC0o3KLwYJPwYEheQwBhbHcfACgb2uN2GSQnGSyvJQ
         duPDxaNyRt4C8UdHoCkqhKl7DHoN+Gy32XGAKfJHfmN5r2DBzfE3Gn9UWsKwrpts3GgG
         v0PENS94UG5CbEGruZVt2PtnrrD7v6xTTaiDIDLRfPF7sgKmyai7uh13gFKz482t4ReF
         Zly94q9bfYscnfuZ4BAZttot+TzCrW0Qf58iICTXNPq7OKhsc7Sv9eAEsQZdBtPAptFX
         x0Vg==
X-Gm-Message-State: AOAM533yk/hBMZGWSeE1Gj1JqmPvkBqolfKs1bdJ689mHRixAFvO6pSv
        /lAQljnV7kc9S0sNJYrBbH0HNg==
X-Google-Smtp-Source: ABdhPJzKu5k+opBWMLTGG0G/Z/6Z9q2u7NhuuDnQp0Sf5WJDN+jkuUUS2L/iO9uH9pzo+FkgQiLq0g==
X-Received: by 2002:ac8:59d5:: with SMTP id f21mr31218834qtf.2.1607446446643;
        Tue, 08 Dec 2020 08:54:06 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id z78sm3374497qkb.0.2020.12.08.08.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 08:54:05 -0800 (PST)
Message-ID: <ec5fd04e7bcec92ae021bc4d36373deaa50e96fd.camel@ndufresne.ca>
Subject: Re: [PATCH v3 0/4] media: meson: Add support for the Amlogic GE2D
 Accelerator Unit
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Neil Armstrong <narmstrong@baylibre.com>, hverkuil@xs4all.nl
Cc:     linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date:   Tue, 08 Dec 2020 11:54:04 -0500
In-Reply-To: <20201117084440.578540-1-narmstrong@baylibre.com>
References: <20201117084440.578540-1-narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 17 novembre 2020 à 09:44 +0100, Neil Armstrong a écrit :
> The GE2D is a 2D accelerator with various features like configurable blitter
> with alpha blending, frame rotation, scaling, format conversion and colorspace
> conversion.
> 
> The driver implements a Memory2Memory VB2 V4L2 streaming device permitting:
> - 0, 90, 180, 270deg rotation
> - horizontal/vertical flipping
> - source cropping
> - destination compositing
> - 32bit/24bit/16bit format conversion
> 
> This adds the support for the GE2D version found in the AXG SoCs Family.
> 
> The missing features are:
> - Source scaling
> - Colorspace conversion
> - Advanced alpha blending & blitting options

Is there some Open Source software using this driver ? GStreamer got some
support, but it's mostly focused on CSC and Scaling (flipping should work, but
rotation is not implemented). But I'm not aware of anything else, hence asking.

> 
> Dependencies:
> - Patches 1-3: None
> - Patch 4: 
> https://lkml.kernel.org/r/20200915124553.8056-1-narmstrong@baylibre.com (appli
> ed for 5.11)
> 
> Changes since v2:
> - removed error check in and after get_frame()
> - moved the v4l2_file_operations lower in the code to avoid adding
> vidioc_setup_cap_fmt on top
> - removed all memcpy of pix_fmt
> - simplified & fixed ge2d_start_streaming
> - added local buffer type check in vidioc_g_selection instead of using
> get_frame error
> - removed impossible <0 rectangle check, fixed error string
> - added comment on condition after V4L2_CID_ROTATE
> 
> Changes since v1:
> - Rebased on v5.10-rc1
> 
> / # v4l2-compliance -s
> v4l2-compliance SHA: ea16a7ef13a902793a5c2626b0cefc4d956147f3, 64 bits, 64-bit
> time_t
> 
> Compliance test for meson-ge2d device /dev/video0:
> 
> Driver Info:
>         Driver name      : meson-ge2d
>         Card type        : meson-ge2d
>         Bus info         : platform:meson-ge2d
>         Driver version   : 5.9.0
>         Capabilities     : 0x84208000
>                 Video Memory-to-Memory
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04208000
>                 Video Memory-to-Memory
>                 Streaming
>                 Extended Pix Format
> 
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>         test second /dev/video0 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
>         test invalid ioctls: OK
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 4 Private Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK
>         test Composing: OK
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Test input 0:
> 
> Streaming ioctls:
>         test read/write: OK (Not Supported)
>         test blocking wait: OK
>         Video Capture: Captured 58 buffers                
>         test MMAP (no poll): OK
>         Video Capture: Captured 58 buffers                
>         test MMAP (select): OK
>         Video Capture: Captured 58 buffers                
>         test MMAP (epoll): OK
>         test USERPTR (no poll): OK (Not Supported)
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for meson-ge2d device /dev/video0: 52, Succeeded: 52, Failed: 0,
> Warnings: 0
> 
> Neil Armstrong (4):
>   dt-bindings: media: Add bindings for the Amlogic GE2D Accelerator Unit
>   media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit
>   MAINTAINERS: Add myself as maintainer of the Amlogic GE2D driver
>   arm64: dts: meson-axg: add GE2D node
> 
>  .../bindings/media/amlogic,axg-ge2d.yaml      |   47 +
>  MAINTAINERS                                   |    9 +
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |    9 +
>  drivers/media/platform/Kconfig                |   13 +
>  drivers/media/platform/Makefile               |    2 +
>  drivers/media/platform/meson/ge2d/Makefile    |    3 +
>  drivers/media/platform/meson/ge2d/ge2d-regs.h |  360 ++++++
>  drivers/media/platform/meson/ge2d/ge2d.c      | 1091 +++++++++++++++++
>  8 files changed, 1534 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/amlogic,axg-
> ge2d.yaml
>  create mode 100644 drivers/media/platform/meson/ge2d/Makefile
>  create mode 100644 drivers/media/platform/meson/ge2d/ge2d-regs.h
>  create mode 100644 drivers/media/platform/meson/ge2d/ge2d.c
> 


