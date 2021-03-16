Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D96633DAE6
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 18:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234702AbhCPRYX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 13:24:23 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43644 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239283AbhCPRXr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 13:23:47 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 81C461F416B7
Message-ID: <5ecf1d3b8a8f88d6387a1549faeb4f4180cf5d4b.camel@collabora.com>
Subject: Re: [PATCH v2 00/10] Microship SAMA5D4 VPU support et al
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Emil Velikov <emil.l.velikov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        ludovic.desroches@microchip.com
Date:   Tue, 16 Mar 2021 14:23:35 -0300
In-Reply-To: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2021-03-11 at 15:40 +0000, Emil Velikov wrote:
> Hi all
> 
> This series adds support for the Microchip SAMA5D4 VPU, which it based
> on the Hantro G1.
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
>    warnings (thanks Eze)
>  - Rebased on top of 5.12-rc2, as per Linus' email to avoid 5.12-rc1
>    https://lwn.net/Articles/848265/
> 
> 
> 
> Testing
> -------
> 
>  - v4l-compliance
> 
> Command used:
>   v4l2-compliance -m0
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
>   gst-launch-1.0 -v filesrc location=test.mp4  ! decodebin3 !
> video/x-raw,format=YUY2 ! ...
> 
> Confirmed the VPU is used by observing the interrupts triggering, strace
> showed extra v4l2 ioctls - VIDIOC_S_FMT(... V4L2_PIX_FMT_YUYV  ...)
> 
> 
>  - MPEG2 testing, custom ffmpeg from
>    https://github.com/Kwiboo/FFmpeg/commits/v4l2-request-hwaccel-4.3
> 
> Command used:
>   ffmpeg -hwaccel drm -i mpeg2.mpeg2 -f rawvideo -pix_fmt yuv420p out.raw
> 
> Confirmed the VPU is used by observing the interrupts triggering, strace
> showed the v4l2 ioctls being used plus played back the resulting file.
> 
> 
>  - VP8 testing, using fluster
> 
> Command used:
>   fluster.py run -ts VP8-TEST-VECTORS -d GStreamer-VP8-V4L2SL-Gst1.0
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
>   fluster.py run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2SL-Gst1.0
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
>   media: hantro: use G1_REG_INTERRUPT directly for the mpeg2
>   media: hantro: imx: reuse MB_DIM define
>   media: hantro: imx: remove duplicate dec_base init
>   media: hantro: imx: remove unused include
>   media: hantro: introduce hantro_g1.c for common API

For patches 1-5:

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

>   media: dt-bindings: Document SAMA5D4 VDEC bindings

This one need to be reviewed by DT maintainers, I think.

>   media: hantro: add initial SAMA5D4 support

For patch 7:

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

>   ARM: dts: sama5d4: enable Hantro G1 VDEC
>   ARM: configs: at91: sama5: update with savedefconfig
>   ARM: configs: at91: sama5: enable the Hantro G1 engine
> 

These need review from Microchip maintainers.

Thanks!
Ezequiel

>  .../media/microchip,sama5d4-vdec.yaml         |  59 +++++++++
>  arch/arm/boot/dts/sama5d4.dtsi                |   9 ++
>  arch/arm/configs/sama5_defconfig              |  40 +++---
>  drivers/staging/media/hantro/Kconfig          |  10 +-
>  drivers/staging/media/hantro/Makefile         |   4 +
>  drivers/staging/media/hantro/hantro_drv.c     |   3 +
>  drivers/staging/media/hantro/hantro_g1.c      |  39 ++++++
>  .../media/hantro/hantro_g1_mpeg2_dec.c        |   5 +-
>  drivers/staging/media/hantro/hantro_hw.h      |   4 +
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   |  27 +---
>  drivers/staging/media/hantro/rk3288_vpu_hw.c  |  36 +-----
>  .../staging/media/hantro/sama5d4_vdec_hw.c    | 117 ++++++++++++++++++
>  12 files changed, 274 insertions(+), 79 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
>  create mode 100644 drivers/staging/media/hantro/hantro_g1.c
>  create mode 100644 drivers/staging/media/hantro/sama5d4_vdec_hw.c
> 


