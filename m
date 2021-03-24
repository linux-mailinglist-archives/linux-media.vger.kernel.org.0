Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E52D34825A
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 20:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238087AbhCXT65 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 15:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237981AbhCXT6f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 15:58:35 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F4DC061763
        for <linux-media@vger.kernel.org>; Wed, 24 Mar 2021 12:58:35 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id j17so12886116qvo.13
        for <linux-media@vger.kernel.org>; Wed, 24 Mar 2021 12:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=WohtsYNWEdFTIn8E+Et3spzWAWV2YpfFIl4Sn9otDIc=;
        b=O1asTqeApZJOrRJ3N58wnaLH6u5ZyLuKnbnLod3nO2S3ZYzpQ4ItwhhbC8VDfU579j
         C7+c9zj17/nKO2QP6w7qw7CBLdYA9y0tZgQ7NgNbDDYlA0rqHCAJtc64XilqbeqEcnsz
         v1JrWWjIVee8T2eXC9VcV8Exj+wrChvmAcoGllkoWyPCyv1yYNdP4uwqZw2Ol30naFld
         AVKxcCqAoc3UMMWvADruEuNZ2e+WrZ518AaoqiGrASGXAiumlkw62S0nSp7OcSoiYbDJ
         3VXfUK/S04M0h/M9wcBIpPZegSUeqDqt8wWnRbaJMg1kSMZQcNYckREMWgV++dmTZZWR
         ugOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WohtsYNWEdFTIn8E+Et3spzWAWV2YpfFIl4Sn9otDIc=;
        b=QYyemDKFeKxKBUmNkYzoPO+vfSeTVGQfBpvxPC4pI0O3i9XGMcLpgftbwrZf0u8ROO
         PAGGflks4y5B+mXyLFN7muxBHhjDG50xUZxEDdj5lYYF9COSlkX0HCB/RmPf0LS+MZek
         DfIVJWRzV5AjXrfqoaQ2p4jT76+Pkwh+ZlC8Wsg7Lya2T2YhO6cnABilbda1dDvBkaz9
         4dOSXnyV5aqkn2egE2TjKgb3rCiTt+o5pmYdbihLa6yC5V+OPP7EEVz6ww3xSAK0rKUZ
         ZkmMW2exbgddCwnNa+gT6Kf8E4OJ1cjPm7DZwOsLV6p667+0VFc0itNXT6dSp30IblRY
         +MjA==
X-Gm-Message-State: AOAM5315bNuQztr7OgCxfeSvZFHFfmBN7hLg4J58IjwHpCg9qhDIxZB8
        CioiEuiZWBdN1DkX7bNsy/rO8A==
X-Google-Smtp-Source: ABdhPJwVOGZjBIbcrcxsjTB8BxQREUcVPDREe/rzhL7mQYvJXvkATuDxxPdELSWp+C0ZUKN8e2iOXw==
X-Received: by 2002:a0c:bf47:: with SMTP id b7mr4326951qvj.38.1616615914732;
        Wed, 24 Mar 2021 12:58:34 -0700 (PDT)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id n6sm2009606qtx.22.2021.03.24.12.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 12:58:34 -0700 (PDT)
Message-ID: <45362b53cb3603597c2e83be68df439164572ad4.camel@ndufresne.ca>
Subject: Re: [PATCH v2 00/10] Microship SAMA5D4 VPU support et al
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Emil Velikov <emil.l.velikov@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Date:   Wed, 24 Mar 2021 15:58:33 -0400
In-Reply-To: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 11 mars 2021 à 15:40 +0000, Emil Velikov a écrit :
> Hi all
> 
> This series adds support for the Microchip SAMA5D4 VPU, which it based
> on the Hantro G1.

Perhaps in your next version you could fix the object line, you wrote Microship
instead of Microchip.

> 
> The hardware can support up-to 1280x720 for each of the MPEG2, VP8 and
> H264 codecs. There is only a single decoder and no encoders on the SoC.
> 
> The Hantro G1 post-processing is also enabled on the platform.
> 
> To minimise duplication, the series starts with a few small cleanups.
> 
> 
> As you may have noticed, this is my first patches series to linux-media,
> so any tips how to make this as smoother process are appreciated.
> 
> 
> Changes in v2:
>  - Add testing results in the cover letter (thanks Eze)
>  - s/Atmel/Microchip/ through the series (thanks Nicolas)
>  - Split defconfig change into separate commit (thanks Eze, Nicolas)
>  - Added Reviewed-by and Fixes tags (thanks Philipp)
>  - Split DT into separate commit, wrote binding document, fixup minor DT
>    warnings (thanks Eze)
>  - Rebased on top of 5.12-rc2, as per Linus' email to avoid 5.12-rc1
>    https://lwn.net/Articles/848265/
> 
> 
> 
> Testing
> -------
> 
>  - v4l-compliance
> 
> Command used:
>   v4l2-compliance -m0
> 
> Output summary:
> 
> v4l2-compliance 1.21.0-4740, 32 bits, 32-bit time_t
> v4l2-compliance SHA: f253495fa6de 2021-03-06 15:32:09
> 
> Compliance test for hantro-vpu device /dev/media0:
> 
> Total for hantro-vpu device /dev/media0: 8, Succeeded: 8, Failed: 0,
> Warnings: 0
> 
> Compliance test for hantro-vpu device /dev/video0:
> 
> Total for hantro-vpu device /dev/video0: 46, Succeeded: 46, Failed: 0,
> Warnings: 0
> 
> 
>  - Post-processor testing
> 
> Command used:
>   gst-launch-1.0 -v filesrc location=test.mp4  ! decodebin3 !
> video/x-raw,format=YUY2 ! ...
> 
> Confirmed the VPU is used by observing the interrupts triggering, strace
> showed extra v4l2 ioctls - VIDIOC_S_FMT(... V4L2_PIX_FMT_YUYV  ...)
> 
> 
>  - MPEG2 testing, custom ffmpeg from
>    https://github.com/Kwiboo/FFmpeg/commits/v4l2-request-hwaccel-4.3
> 
> Command used:
>   ffmpeg -hwaccel drm -i mpeg2.mpeg2 -f rawvideo -pix_fmt yuv420p out.raw
> 
> Confirmed the VPU is used by observing the interrupts triggering, strace
> showed the v4l2 ioctls being used plus played back the resulting file.
> 
> 
>  - VP8 testing, using fluster
> 
> Command used:
>   fluster.py run -ts VP8-TEST-VECTORS -d GStreamer-VP8-V4L2SL-Gst1.0
> 
> Output summary:
> 
> Running test suite VP8-TEST-VECTORS with decoder GStreamer-VP8-V4L2SL-Gst1.0
> Ran 61 tests in 103.273s
> 
> FAILED (failures=9, errors=2)
> 
> 
>  - H264 testing, using fluster
> 
> Command used:
>   fluster.py run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2SL-Gst1.0
> 
> Output summary:
> 
> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2SL-Gst1.0
> Ran 135 tests in 420.444s
> 
> FAILED (failures=9, errors=55)
> 
> 
> Looking forward to your feedback,
> Emil
> 
> 
> Emil Velikov (10):
>   media: hantro: use G1_REG_INTERRUPT directly for the mpeg2
>   media: hantro: imx: reuse MB_DIM define
>   media: hantro: imx: remove duplicate dec_base init
>   media: hantro: imx: remove unused include
>   media: hantro: introduce hantro_g1.c for common API
>   media: dt-bindings: Document SAMA5D4 VDEC bindings
>   media: hantro: add initial SAMA5D4 support
>   ARM: dts: sama5d4: enable Hantro G1 VDEC
>   ARM: configs: at91: sama5: update with savedefconfig
>   ARM: configs: at91: sama5: enable the Hantro G1 engine
> 
>  .../media/microchip,sama5d4-vdec.yaml         |  59 +++++++++
>  arch/arm/boot/dts/sama5d4.dtsi                |   9 ++
>  arch/arm/configs/sama5_defconfig              |  40 +++---
>  drivers/staging/media/hantro/Kconfig          |  10 +-
>  drivers/staging/media/hantro/Makefile         |   4 +
>  drivers/staging/media/hantro/hantro_drv.c     |   3 +
>  drivers/staging/media/hantro/hantro_g1.c      |  39 ++++++
>  .../media/hantro/hantro_g1_mpeg2_dec.c        |   5 +-
>  drivers/staging/media/hantro/hantro_hw.h      |   4 +
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   |  27 +---
>  drivers/staging/media/hantro/rk3288_vpu_hw.c  |  36 +-----
>  .../staging/media/hantro/sama5d4_vdec_hw.c    | 117 ++++++++++++++++++
>  12 files changed, 274 insertions(+), 79 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
>  create mode 100644 drivers/staging/media/hantro/hantro_g1.c
>  create mode 100644 drivers/staging/media/hantro/sama5d4_vdec_hw.c
> 


