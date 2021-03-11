Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F19233782B
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 16:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234257AbhCKPlW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 10:41:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234232AbhCKPlE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 10:41:04 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65695C061574
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 07:41:04 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id v15so2394155wrx.4
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 07:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4dPzQoidf5vtocnR10xIvJiNylBWsI78KoL3BBU9vQ=;
        b=I+bAsulCdkt+lVCylDNKLobwxXzgSLuVltYeHq+F0SXZTNT1+Ol1lT2fq8F1tpy40D
         c2Iju/OcLhSXSaxISalcVRTgUt2Bm1hb2KTRtoIOvdNPgqYaoZkhDUqFM8ChzjkxU5Lb
         u1+vrIMYZJgtvAhCurjORzz6uTgeno2Ohg25IbE7il6TQ02YSFjc7FRPVDKgKOTVhlgc
         7gC9lvn/flsNmggOafASCfjJdzXv+aEOo3HoXvTewmNF6bEpLu/AjywVY27FD+fTtC00
         E16EPhfWQYKDCt2YdABfIQtOtjm69nTzMrgm2NI1jRVtbBTuDuZ4dnX6iUxmmy/cekBw
         5Awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q4dPzQoidf5vtocnR10xIvJiNylBWsI78KoL3BBU9vQ=;
        b=DN6+AWywOm8gq7lVCvb2/PwhwzMGKNW4fKEwMxCYxujdxQb6dh+ITZqTCnf6TWqn+1
         H3+1+klYQUHrJS4d2vznInR33AdHVZMmscT3uiP5rJvKa0WmBeUo8cWHGZiFt1W/BBRN
         VlLClo/eyqQxPslPs22tu3EsNAgcIs9CiMO643uKzAguhhVetCZdwKmueFG+ssIYswWx
         3lI5+xqFFy/OFZ+KapUhN1rGFVZjMUGRrta7KNv56NIokcz2scOz/JtNzi7l3NBxegl0
         THl4etS46jsE2wCsZ0VW6bvkZjBvVJLjGlk7Tm6ipMJS4hlVgRmnwr3PuTa1PbO7UPe7
         N1qg==
X-Gm-Message-State: AOAM5315uhsVHH03CSVUXPR31pu1bJY1CNeDYAogOfHUPG4EyRujq1IM
        mchjp8P5bBTdJYqMzXLL3dk=
X-Google-Smtp-Source: ABdhPJxU1HuvUtEcMRItxvCfrPrKwoGRw1pHQPExwdjuUkuMll+2Tmw5tpIE5jkSGL+KA66RYcqraw==
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr9248759wrj.185.1615477263160;
        Thu, 11 Mar 2021 07:41:03 -0800 (PST)
Received: from arch-x1c3.. ([2a00:5f00:102:0:b16d:9752:8f38:7d6b])
        by smtp.gmail.com with ESMTPSA id a17sm4008547wmj.9.2021.03.11.07.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:41:02 -0800 (PST)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     emil.l.velikov@gmail.com
Subject: [PATCH v2 00/10] Microship SAMA5D4 VPU support et al
Date:   Thu, 11 Mar 2021 15:40:45 +0000
Message-Id: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all

This series adds support for the Microchip SAMA5D4 VPU, which it based
on the Hantro G1.

The hardware can support up-to 1280x720 for each of the MPEG2, VP8 and
H264 codecs. There is only a single decoder and no encoders on the SoC.

The Hantro G1 post-processing is also enabled on the platform.

To minimise duplication, the series starts with a few small cleanups.


As you may have noticed, this is my first patches series to linux-media,
so any tips how to make this as smoother process are appreciated.


Changes in v2:
 - Add testing results in the cover letter (thanks Eze)
 - s/Atmel/Microchip/ through the series (thanks Nicolas)
 - Split defconfig change into separate commit (thanks Eze, Nicolas)
 - Added Reviewed-by and Fixes tags (thanks Philipp)
 - Split DT into separate commit, wrote binding document, fixup minor DT
   warnings (thanks Eze)
 - Rebased on top of 5.12-rc2, as per Linus' email to avoid 5.12-rc1
   https://lwn.net/Articles/848265/



Testing
-------

 - v4l-compliance

Command used:
  v4l2-compliance -m0

Output summary:

v4l2-compliance 1.21.0-4740, 32 bits, 32-bit time_t
v4l2-compliance SHA: f253495fa6de 2021-03-06 15:32:09

Compliance test for hantro-vpu device /dev/media0:

Total for hantro-vpu device /dev/media0: 8, Succeeded: 8, Failed: 0,
Warnings: 0

Compliance test for hantro-vpu device /dev/video0:

Total for hantro-vpu device /dev/video0: 46, Succeeded: 46, Failed: 0,
Warnings: 0


 - Post-processor testing

Command used:
  gst-launch-1.0 -v filesrc location=test.mp4  ! decodebin3 !
video/x-raw,format=YUY2 ! ...

Confirmed the VPU is used by observing the interrupts triggering, strace
showed extra v4l2 ioctls - VIDIOC_S_FMT(... V4L2_PIX_FMT_YUYV  ...)


 - MPEG2 testing, custom ffmpeg from
   https://github.com/Kwiboo/FFmpeg/commits/v4l2-request-hwaccel-4.3

Command used:
  ffmpeg -hwaccel drm -i mpeg2.mpeg2 -f rawvideo -pix_fmt yuv420p out.raw

Confirmed the VPU is used by observing the interrupts triggering, strace
showed the v4l2 ioctls being used plus played back the resulting file.


 - VP8 testing, using fluster

Command used:
  fluster.py run -ts VP8-TEST-VECTORS -d GStreamer-VP8-V4L2SL-Gst1.0

Output summary:

Running test suite VP8-TEST-VECTORS with decoder GStreamer-VP8-V4L2SL-Gst1.0
Ran 61 tests in 103.273s

FAILED (failures=9, errors=2)


 - H264 testing, using fluster

Command used:
  fluster.py run -ts JVT-AVC_V1 -d GStreamer-H.264-V4L2SL-Gst1.0

Output summary:

Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2SL-Gst1.0
Ran 135 tests in 420.444s

FAILED (failures=9, errors=55)


Looking forward to your feedback,
Emil


Emil Velikov (10):
  media: hantro: use G1_REG_INTERRUPT directly for the mpeg2
  media: hantro: imx: reuse MB_DIM define
  media: hantro: imx: remove duplicate dec_base init
  media: hantro: imx: remove unused include
  media: hantro: introduce hantro_g1.c for common API
  media: dt-bindings: Document SAMA5D4 VDEC bindings
  media: hantro: add initial SAMA5D4 support
  ARM: dts: sama5d4: enable Hantro G1 VDEC
  ARM: configs: at91: sama5: update with savedefconfig
  ARM: configs: at91: sama5: enable the Hantro G1 engine

 .../media/microchip,sama5d4-vdec.yaml         |  59 +++++++++
 arch/arm/boot/dts/sama5d4.dtsi                |   9 ++
 arch/arm/configs/sama5_defconfig              |  40 +++---
 drivers/staging/media/hantro/Kconfig          |  10 +-
 drivers/staging/media/hantro/Makefile         |   4 +
 drivers/staging/media/hantro/hantro_drv.c     |   3 +
 drivers/staging/media/hantro/hantro_g1.c      |  39 ++++++
 .../media/hantro/hantro_g1_mpeg2_dec.c        |   5 +-
 drivers/staging/media/hantro/hantro_hw.h      |   4 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c   |  27 +---
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |  36 +-----
 .../staging/media/hantro/sama5d4_vdec_hw.c    | 117 ++++++++++++++++++
 12 files changed, 274 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/microchip,sama5d4-vdec.yaml
 create mode 100644 drivers/staging/media/hantro/hantro_g1.c
 create mode 100644 drivers/staging/media/hantro/sama5d4_vdec_hw.c

-- 
2.30.1

