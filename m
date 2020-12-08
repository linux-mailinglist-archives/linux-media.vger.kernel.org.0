Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1CB22D30E3
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 18:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728764AbgLHRXZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 12:23:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgLHRXY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 12:23:24 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7125EC061749
        for <linux-media@vger.kernel.org>; Tue,  8 Dec 2020 09:22:44 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id l9so7902502wrt.13
        for <linux-media@vger.kernel.org>; Tue, 08 Dec 2020 09:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XD3A/Hgy2w7ED+KHWEDAEWtmfq38edOfffXRoY3O++I=;
        b=0i04wM9qSP8ajhFiTYP0II1IrX72brtRIT6kv+d6ivXi56G3VA9Ijj8z2ynd8zxFXQ
         ZBTERgJEhlOU3LJt8735Yd4AiPsCjjGiB6kmwAiLUA4MEmRE4133u/MpIZUbWxkRcMBh
         eC/8Nd8uMEOzOlc8Zxpz73sp0laKFf2c6Ep4evlEk+i5EH53ScOQYWoaisMfKwvrOywF
         TNy9++6oOSGfq2wA0wPNY8BBkhQQYiKyxYPJl+ot2xY7Wp8IOygyqnB5W3JFHT6Ce7xa
         EjhH0WUDckLF69ZKEG6bFk9mMok9PZEx5IWih3cp4+t1UomNybsfU1lgRKygZD4VWCWp
         npbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=XD3A/Hgy2w7ED+KHWEDAEWtmfq38edOfffXRoY3O++I=;
        b=KkTD23jh3ws0GkoBSV3uEN7+j5MCy5FI+ZSZKfPy3uRdAgtLZA0cd6kZpDzztNpzYP
         OqBFf0XuqpUGhwM0AHhkXgh/NPSC+w3GNIdU4Qf+9f1bODGeRl8JP/K+iV6slneyYR85
         H9po/f8O/fVC6rH47VFH2nuCqLz9Utn4OKfk0abJPsj4pp8j4q5UlmmWqbCPJAUjqo6D
         wek3QvirqlBgtMefiNCR1hvaKsREamkNHDFFwSghB7CCsqyMUvPIAIw/NiEPf0dlHG7q
         +MON/BYCsOrq72T/rcUw3vEQ1Zr4ziVwGmrtsgjOcZOauKYRRTLvU1hdgHDLz37OOsmo
         ZU+g==
X-Gm-Message-State: AOAM5339IUoM2lbTeQxoI4emHN1wFmy0yYCW5IFCDTW69u6FKzN9uanN
        QFnIScnoYkrMwm/vQDcSyvnMHQ==
X-Google-Smtp-Source: ABdhPJwGg3NupyHpUJ8qCy2rLYp/VYmhQnj4l3Wx7w9/N/0Krf1e7AmwAY6TlPlXVn7Cb2VfuUjTyA==
X-Received: by 2002:adf:94c7:: with SMTP id 65mr6422377wrr.423.1607448162887;
        Tue, 08 Dec 2020 09:22:42 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:910e:74fe:9d52:c072? ([2a01:e35:2ec0:82b0:910e:74fe:9d52:c072])
        by smtp.gmail.com with ESMTPSA id 138sm4963606wma.41.2020.12.08.09.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Dec 2020 09:22:42 -0800 (PST)
Subject: Re: [PATCH v3 0/4] media: meson: Add support for the Amlogic GE2D
 Accelerator Unit
To:     Nicolas Dufresne <nicolas@ndufresne.ca>, hverkuil@xs4all.nl
Cc:     linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20201117084440.578540-1-narmstrong@baylibre.com>
 <ec5fd04e7bcec92ae021bc4d36373deaa50e96fd.camel@ndufresne.ca>
From:   Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <ac948743-22a3-cb09-3105-788fd435230c@baylibre.com>
Date:   Tue, 8 Dec 2020 18:22:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ec5fd04e7bcec92ae021bc4d36373deaa50e96fd.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 08/12/2020 17:54, Nicolas Dufresne wrote:
> Le mardi 17 novembre 2020 à 09:44 +0100, Neil Armstrong a écrit :
>> The GE2D is a 2D accelerator with various features like configurable blitter
>> with alpha blending, frame rotation, scaling, format conversion and colorspace
>> conversion.
>>
>> The driver implements a Memory2Memory VB2 V4L2 streaming device permitting:
>> - 0, 90, 180, 270deg rotation
>> - horizontal/vertical flipping
>> - source cropping
>> - destination compositing
>> - 32bit/24bit/16bit format conversion
>>
>> This adds the support for the GE2D version found in the AXG SoCs Family.
>>
>> The missing features are:
>> - Source scaling
>> - Colorspace conversion
>> - Advanced alpha blending & blitting options
> 
> Is there some Open Source software using this driver ? GStreamer got some
> support, but it's mostly focused on CSC and Scaling (flipping should work, but
> rotation is not implemented). But I'm not aware of anything else, hence asking.

Rotation orks with gstreamer by tweaking the rotation control manually and forcing the reversed height/width
after the v4l2convert.
Apart that, I made it works with the LVGL UI library to accelerate buffers switching and blitting
on the DRM buffers.

Neil

> 
>>
>> Dependencies:
>> - Patches 1-3: None
>> - Patch 4: 
>> https://lkml.kernel.org/r/20200915124553.8056-1-narmstrong@baylibre.com (appli
>> ed for 5.11)
>>
>> Changes since v2:
>> - removed error check in and after get_frame()
>> - moved the v4l2_file_operations lower in the code to avoid adding
>> vidioc_setup_cap_fmt on top
>> - removed all memcpy of pix_fmt
>> - simplified & fixed ge2d_start_streaming
>> - added local buffer type check in vidioc_g_selection instead of using
>> get_frame error
>> - removed impossible <0 rectangle check, fixed error string
>> - added comment on condition after V4L2_CID_ROTATE
>>
>> Changes since v1:
>> - Rebased on v5.10-rc1
>>
>> / # v4l2-compliance -s
>> v4l2-compliance SHA: ea16a7ef13a902793a5c2626b0cefc4d956147f3, 64 bits, 64-bit
>> time_t
>>
>> Compliance test for meson-ge2d device /dev/video0:
>>
>> Driver Info:
>>         Driver name      : meson-ge2d
>>         Card type        : meson-ge2d
>>         Bus info         : platform:meson-ge2d
>>         Driver version   : 5.9.0
>>         Capabilities     : 0x84208000
>>                 Video Memory-to-Memory
>>                 Streaming
>>                 Extended Pix Format
>>                 Device Capabilities
>>         Device Caps      : 0x04208000
>>                 Video Memory-to-Memory
>>                 Streaming
>>                 Extended Pix Format
>>
>> Required ioctls:
>>         test VIDIOC_QUERYCAP: OK
>>
>> Allow for multiple opens:
>>         test second /dev/video0 open: OK
>>         test VIDIOC_QUERYCAP: OK
>>         test VIDIOC_G/S_PRIORITY: OK
>>         test for unlimited opens: OK
>>
>>         test invalid ioctls: OK
>> Debug ioctls:
>>         test VIDIOC_DBG_G/S_REGISTER: OK
>>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>         Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>         Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>         test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>         test VIDIOC_QUERYCTRL: OK
>>         test VIDIOC_G/S_CTRL: OK
>>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>         Standard Controls: 4 Private Controls: 0
>>
>> Format ioctls:
>>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>         test VIDIOC_G/S_PARM: OK (Not Supported)
>>         test VIDIOC_G_FBUF: OK (Not Supported)
>>         test VIDIOC_G_FMT: OK
>>         test VIDIOC_TRY_FMT: OK
>>         test VIDIOC_S_FMT: OK
>>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>         test Cropping: OK
>>         test Composing: OK
>>         test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>         test VIDIOC_EXPBUF: OK
>>         test Requests: OK (Not Supported)
>>
>> Test input 0:
>>
>> Streaming ioctls:
>>         test read/write: OK (Not Supported)
>>         test blocking wait: OK
>>         Video Capture: Captured 58 buffers                
>>         test MMAP (no poll): OK
>>         Video Capture: Captured 58 buffers                
>>         test MMAP (select): OK
>>         Video Capture: Captured 58 buffers                
>>         test MMAP (epoll): OK
>>         test USERPTR (no poll): OK (Not Supported)
>>         test USERPTR (select): OK (Not Supported)
>>         test DMABUF: Cannot test, specify --expbuf-device
>>
>> Total for meson-ge2d device /dev/video0: 52, Succeeded: 52, Failed: 0,
>> Warnings: 0
>>
>> Neil Armstrong (4):
>>   dt-bindings: media: Add bindings for the Amlogic GE2D Accelerator Unit
>>   media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit
>>   MAINTAINERS: Add myself as maintainer of the Amlogic GE2D driver
>>   arm64: dts: meson-axg: add GE2D node
>>
>>  .../bindings/media/amlogic,axg-ge2d.yaml      |   47 +
>>  MAINTAINERS                                   |    9 +
>>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |    9 +
>>  drivers/media/platform/Kconfig                |   13 +
>>  drivers/media/platform/Makefile               |    2 +
>>  drivers/media/platform/meson/ge2d/Makefile    |    3 +
>>  drivers/media/platform/meson/ge2d/ge2d-regs.h |  360 ++++++
>>  drivers/media/platform/meson/ge2d/ge2d.c      | 1091 +++++++++++++++++
>>  8 files changed, 1534 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/amlogic,axg-
>> ge2d.yaml
>>  create mode 100644 drivers/media/platform/meson/ge2d/Makefile
>>  create mode 100644 drivers/media/platform/meson/ge2d/ge2d-regs.h
>>  create mode 100644 drivers/media/platform/meson/ge2d/ge2d.c
>>
> 
> 

