Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 955324874BE
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 10:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236561AbiAGJfH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jan 2022 04:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbiAGJfG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jan 2022 04:35:06 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1FB9C061201
        for <linux-media@vger.kernel.org>; Fri,  7 Jan 2022 01:35:06 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id rj2-20020a17090b3e8200b001b1944bad25so5934919pjb.5
        for <linux-media@vger.kernel.org>; Fri, 07 Jan 2022 01:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M72YZwYw9pvtbpSVTp5m5V5BckLQlYZpyBC+Fudq/gQ=;
        b=FCvRy/NgcsWkWaftL3OklPtrwlp3MakeGnyg3cfrO2T1HD/fsyh3L5GeeCeFioBMq1
         hSL9ttME9mJXV2oZPc1y0C+l820gcPs+bfTNOep8HCpDh/415gXnxTV5eVDDLDD861ju
         mAf2ui5aodGlhqLI6Tq869SrwIW07cn1XDsZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M72YZwYw9pvtbpSVTp5m5V5BckLQlYZpyBC+Fudq/gQ=;
        b=GQ/EEjPaZjxgK91/c1LYs4ZmiYXAH+yuhQ8Ks/pguRZlfkgjoouPNLEnvEQ/kDfhTW
         6mARzYacoKhw2r0nqAruvEY4p90DCAe5TINmEf8gDt1fatsMm+dk2sr8jtTMBfDjZbkR
         ODAWco+9Z4gr1+PSsWpttDTwG7HtOooAGNiHAuj9YEZXrHeoAHUVA+Lk/2MFU0JIR0k1
         A/UAgQ3ZGbk3gGCbjHCjgvIupShmZJNIAhxOFB7DPniY6Jg5AjV6WhNlmEQm0WmRHhEB
         s4qhU7t+ylTwqqSpWpvs86ANEAcjHDr/G5JKpaAElLhKykTszlEYMsmRqZ5PIQhr4rLg
         gpdw==
X-Gm-Message-State: AOAM533L0KyJUG1vle4e1hPufe2O53VeEeYOzYUaV4eyjXpFDenWU7WG
        UkswWY8QDynfbCBMwABPl4umKA==
X-Google-Smtp-Source: ABdhPJzSA56kYIS/uw09iEzjo1FQYuRC75hjOlr6z5DRrfMoNU3Mj+lNSS1VRZxmv/3eS4ZNnns7gg==
X-Received: by 2002:a17:902:bc4c:b0:149:ed05:3027 with SMTP id t12-20020a170902bc4c00b00149ed053027mr7388414plz.174.1641548105983;
        Fri, 07 Jan 2022 01:35:05 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8f6b:ee:64d8:ae81])
        by smtp.gmail.com with ESMTPSA id j17sm5269192pfu.77.2022.01.07.01.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 01:35:05 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH RFT v2 0/8] media: hantro: jpeg: Various improvements
Date:   Fri,  7 Jan 2022 17:34:47 +0800
Message-Id: <20220107093455.73766-1-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi everyone,

Here are some improvements to the Hantro JPEG encoder driver. This
finishes two of the TODO items.

Changes since v1:

- New patch 8 cleaning up JPEG quantization table dimension magic
  numbers and sanity checking of various tables

- Add sanity checks for JPEG header size and alignment

- Drop linux/dma-mapping.h header now that the DMA bounce buffer is gone

- Make JPEG_ACTIVE_MARKER control read only

Patch 1 cleans up the final register write sequence in the JPEG encoder
driver. This particular bit was a bit confusing and hard to understand
given the lack of context around the original wmb(). Was it used to
force all the register writes to finish or to make sure memory writes
were completed? In the end I stuck with what the other hantro decoders
were doing.

Patch 2 fixes a misleading register name.

Patch 3 implements cropping on the output queue with the selection API
for the JPEG encoder. This allows specifying the visible area slightly
smaller than the macroblock-aligned coded size. This bit can be reused
by other stateless encoders once they are implemented.

Patch 4 adds a JFIF APP0 segment to the JPEG encoder output.

Patch 5 adds a COM segment to the JPEG encoder output. This is used to
align the SOS segment payload area.

Patch 6 implements the V4L2_CID_JPEG_ACTIVE_MARKER control. This is only
used to signal the segments added to userspace. The driver ignores any
changes requested.

Patch 7 lets the encoder output directly into the capture buffer,
getting rid of the DMA bounce buffer.

Patch 8 cleans up some of the magic number 64 instances around the
quantization table code. Sanity checks are also added.

Please have a look and test. I only tested this on the RK3399 with
gstreamer, and with Chromium's jpeg_encode_accelerator_unittest with the
patches backported to v5.10 on a RK3399 Kevin Chromebook. The H1 variant
is untested by me.

To test the selection API bits with gstreamer, the v4l2videoenc plugin
needs to be patched. A gst_v4l2_object_set_crop() call should be
inserted after gst_v4l2_object_set_format() in
gst_v4l2_video_enc_set_format().


Regards
ChenYu


Chen-Yu Tsai (8):
  media: hantro: jpeg: Relax register writes before write starting
    hardware
  media: hantro: Fix overfill bottom register field name
  media: hantro: Support cropping visible area for encoders
  media: hantro: jpeg: Add JFIF APP0 segment to JPEG encoder output
  media: hantro: jpeg: Add COM segment to JPEG header to align image
    scan
  media: hantro: Implement V4L2_CID_JPEG_ACTIVE_MARKER control
  media: hantro: output encoded JPEG content directly to capture buffers
  media: hantro: jpeg: Remove open-coded size in quantization table code

 drivers/staging/media/hantro/TODO             |  7 --
 drivers/staging/media/hantro/hantro.h         |  1 -
 drivers/staging/media/hantro/hantro_drv.c     | 41 ++++++---
 .../staging/media/hantro/hantro_h1_jpeg_enc.c | 44 ++++++----
 drivers/staging/media/hantro/hantro_h1_regs.h |  2 +-
 drivers/staging/media/hantro/hantro_hw.h      | 11 ---
 drivers/staging/media/hantro/hantro_jpeg.c    | 86 ++++++++++---------
 drivers/staging/media/hantro/hantro_jpeg.h    |  2 +-
 drivers/staging/media/hantro/hantro_v4l2.c    | 77 +++++++++++++++++
 .../media/hantro/rockchip_vpu2_hw_jpeg_enc.c  | 47 +++++-----
 .../staging/media/hantro/rockchip_vpu_hw.c    |  6 --
 11 files changed, 206 insertions(+), 118 deletions(-)

-- 
2.34.1.575.g55b058a8bb-goog

