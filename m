Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 016822336F9
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 18:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729832AbgG3Qkc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 12:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728473AbgG3Qkb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 12:40:31 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2B92C06174A
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 09:40:30 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id t14so1624533wmi.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2020 09:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z7c6G7LA4wMI31rE/G3DFB1zXivUhfsc+gRf5Yk3dzQ=;
        b=Xv2eFc52v202z0TsmV3ZVb/X/kfvDRq60L5cb8HHWuJFHy7Nft5APTCNJVJpdQ2FoU
         +4F5xWb7DgQu0I8dv78ZWgE+RELjBjNFa3PyKTAUCgR+0yFC00pRlnPtihNKHsOVOHE3
         KONmwpSssoSbwoZ6OfwU8UbNDHWvCknicBeYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z7c6G7LA4wMI31rE/G3DFB1zXivUhfsc+gRf5Yk3dzQ=;
        b=gwiSX6LXAp4JnWkyW7bvYIQLwcRiKCq3BiUX/mgQi2x6HnTwkcCBosud7LYZWEB1m1
         CBgs/aRUPZeFkOj/lpS5A1cuhjn2sRk/O1ZH6HmKku55h7qd2VaiM2jTARQQL+GhJc9V
         XctQ7DEhHAPen3EP1YvIjjBfsyfsZc687k6FLjWzwhPdc4OoPwLsqbmVbqaoYyeGEN+Q
         +13b7X1ecrUcuK2VwxXOIQkpDlc9oNjeePNZdV+T95r0PWOdC4fKlLeGTY9naoPVeFts
         tS/UbCtTfr6rKKO22hqmFUVQYlZ9Bb6PwGfpt5I/zgCykiw/904mPSTpk6ZnzbB4dCpi
         SLPQ==
X-Gm-Message-State: AOAM532uW4lVQ7rfjJk4y2hJcd/0faIkdAwz1ZlC0UBXZE+ZI6JQWZd/
        4wJKB4lUWnMt/dBVx81bqbueTg==
X-Google-Smtp-Source: ABdhPJzaQjBxQauL+AG6AmnnI1vp9FaY8avLYCkRXAg/NRbM+27Ya8LMA5DQET7r/Tro7gvu+Dq4JA==
X-Received: by 2002:a1c:bcd6:: with SMTP id m205mr108371wmf.47.1596127229300;
        Thu, 30 Jul 2020 09:40:29 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id n18sm10825044wrw.45.2020.07.30.09.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 09:40:28 -0700 (PDT)
Date:   Thu, 30 Jul 2020 16:40:27 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream@mediatek.com, senozhatsky@chromium.org,
        mojahsu@chromium.org, drinkcat@chromium.org,
        maoguang.meng@mediatek.com
Subject: Re: [PATCH v10 00/28] Add support for mt2701 JPEG ENC support
Message-ID: <20200730164027.GB3779380@chromium.org>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723030451.5616-1-xia.jiang@mediatek.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Thu, Jul 23, 2020 at 11:04:23AM +0800, Xia Jiang wrote:
> This patchset add support for mt2701 JPEG ENC support.      
>                                                             
> This is the compliance test result for jpeg dec and enc.    
>                                                             
> The JPEG dec log:                                           
> ------------------------------------------------------------
> v4l2-compliance -d /dev/video0
> v4l2-compliance SHA: 697ae940b60a172ef31948dd74316fe9de365b7e, 32 bits, 32-bit time_t
> 
> Compliance test for mtk-jpeg-dec device /dev/video0:
> 
> Driver Info:
>         Driver name      : mtk-jpeg-dec
>         Card type        : mtk-jpeg-dec
>         Bus info         : platform:15004000.jpegdec
>         Driver version   : 5.8.0
>         Capabilities     : 0x84204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>         Detected JPEG Decoder
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
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
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
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
> 
> Total for mtk-jpeg-dec device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0
> ------------------------------------------------------------
>                                                             
> The JPEG enc log:                                           
>                                                             
> ------------------------------------------------------------
> v4l2-compliance -d /dev/video1 
> v4l2-compliance SHA: 697ae940b60a172ef31948dd74316fe9de365b7e, 32 bits, 32-bit time_t
> 
> Compliance test for mtk-jpeg-enc device /dev/video1:
> 
> Driver Info:
>         Driver name      : mtk-jpeg-enc
>         Card type        : mtk-jpeg-enc
>         Bus info         : platform:1500a000.jpegenc
>         Driver version   : 5.8.0
>         Capabilities     : 0x84204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x04204000
>                 Video Memory-to-Memory Multiplanar
>                 Streaming
>                 Extended Pix Format
>         Detected JPEG Encoder
> 
> Required ioctls:
>         test VIDIOC_QUERYCAP: OK
> 
> Allow for multiple opens:
>         test second /dev/video1 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
> 
>         test invalid ioctls: OK
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
>         test Cropping: OK
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
> Total for mtk-jpeg-enc device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0
> ------------------------------------------------------------
> 
> Change compared to v9:
> - use pm_runtime_force_*()helpers of patch 07/28
> - add one patch for handling jpeg hardware's locking up
> - delete mtk_jpeg_qbuf() in patch 09/28
> - add one patch for deletting vidioc_s_selection ioctl of jpeg dec
> - add one patch for changing the maximum width and height supported by jpeg dec
> - add one patch for refactoring mtk_jpeg_try_fmt_mplane function
> - add one patch for refactoring mtk_jpeg_find_format function
> - add one patch for redefinition of mtk_jpeg_q_data structure
> - add one patch for changing the colorspace of jpeg to the fixed value
> - add one patch for refactoring mtk_jpeg_set_default_params function
> - add one patch for changing the call function of getting/enable/disable the jpeg's clock
> - add one patch for using the variant structure to contain the varability between jpeg dec and enc
> - return active crop information in mtk_jpeg_enc_g_selection function
> - cancel mtk_jpeg_enc_bs structure
> - refactor the setting hardware register functions in mtk_jpeg_enc_hw.c
> - remove mtk_jpeg_enc_job_ready function
> - refactor mtk_jpeg_enc_irq function
> - cancel setting up a control handler for jpeg dec
> - add the mechanism to ensure that the buffer is enough to hold the EXIF data in .buf_prepare callback
> 
> Xia Jiang (28):
>   media: platform: Improve subscribe event flow for bug fixing
>   media: platform: Improve queue set up flow for bug fixing
>   media: platform: Improve getting and requesting irq flow for bug
>     fixing
>   media: platform: Change the fixed device node number to unfixed value
>   media: platform: Improve power on and power off flow
>   media: platform: Delete the resetting hardware flow in the system PM
>     ops
>   media: platform: Improve the implementation of the system PM ops
>   media: platform: Add mechanism to handle jpeg hardware's locking up
>   media: platform: Cancel the last frame handling flow
>   media: platform: Delete zeroing the reserved fields
>   media: platform: Stylistic changes for improving code quality
>   media: platform: Use generic rounding helpers
>   media: platform: Change MTK_JPEG_COMP_MAX macro definition location
>   media: platform: Delete redundant code and add annotation for an enum
>   media: platform: Delete vidioc_s_selection ioctl of jpeg dec
>   media: platform: Change the maximum width and height supported by JPEG
>     dec
>   media: platform: Refactor mtk_jpeg_try_fmt_mplane()
>   media: platform: Refactor mtk_jpeg_find_format()
>   media: platform: Redefinition of mtk_jpeg_q_data structure
>   media: platform: Change the colorspace of jpeg to the fixed value
>   media: platform: Refactor mtk_jpeg_set_default_params()
>   media: platform: Change the call functions of getting/enable/disable
>     the jpeg's clock

Except one comment to that one patch, the series looks good to me. After
fixing that last comment, feel free to add my Reviewed-by to all the
patches which still don't have it.

Thanks a lot for patiently addressing the comments. I think the series
improves the driver a lot.

Best regards,
Tomasz
