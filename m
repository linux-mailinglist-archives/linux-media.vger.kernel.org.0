Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 344D867E98E
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 16:34:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234130AbjA0Pe5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 10:34:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232364AbjA0Pez (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 10:34:55 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C0F7FA3C
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 07:34:53 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id m14so4849267wrg.13
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 07:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fM6XpDLHZ2dNg83duhBIk1CD6AVxANzisyiUMXm/+bs=;
        b=Xe7PcHDRv7LUSLIHHwuRnTXw5KY1RYHRvX2GDGb2YhyJ9K98IouQWUZd6ERzlzMdNl
         aQCl6QRVJRCaT9cqsovNcfY1WL8aF0sIlsZa6Y+cvxLQsnsmySWd9y9QoyyQXxfdsSS8
         dAymtS4LrOxIvMc+iPvxyRRJ1dHWioKVa7WpiqmXfq7TsRM96ESZ9CMqSuf5zetavWC6
         lB/XfpbJF6rbYKuEIOLA8bk7oGobommt6fXPfypS7fQeKOT9iDCB5HGCMBY4R0+J4sKO
         LKydy5TZkSELdr/bN2LVkQpPjejXfxYOlWqPeFjQLIaCzjsl4WA1zK3YRrepss/6rH8k
         VIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fM6XpDLHZ2dNg83duhBIk1CD6AVxANzisyiUMXm/+bs=;
        b=k0VDI5jx3qUisIccZ2C9v6L/HHYyVnOz+zTyOrkkNeQ3pNM4dvssTvEYaWyD1aau8I
         IOlxnHFySYburAEGVMNRvezaf88M+kwXv0FCohgjHQt35cMIQb5ByeyIa+pnHB7ZGcwC
         mKZxg+EPnXU+pEfpouIM58zhY7aaZbdEdBW2F29xE99NApQNy39c9S5VqeiF+UR5Pg4i
         4lv4Spl77j7RDP9iBeSQo0oUXYExXr+zKPJZfRIp8jWVZtp01U1dZiQL9zTmSy83tM8F
         LcC/YQwopIi2zb4RFyA0Kiesvy0n8pRlzS3HkNOAuWsXGY11LJcS88vBIe39E2PAKiiY
         MWQg==
X-Gm-Message-State: AFqh2kop7VgqEaHIDlV43tPY0I40qp7AriaV+shu83c1nFqrK0NWTlJn
        uWWd+ZldCETvtPI9CwgJuxbQsNBE2q6VoxkkWFA=
X-Google-Smtp-Source: AMrXdXus5KHW0y8tDyWnC/1Jhfbzbc5xXxiEvDBSyuxdC5SddQ8wLQ4z8Pw3W0YsOQu1wN4FSOM6kQ==
X-Received: by 2002:adf:f950:0:b0:2bd:fb81:6317 with SMTP id q16-20020adff950000000b002bdfb816317mr31134623wrr.33.1674833692111;
        Fri, 27 Jan 2023 07:34:52 -0800 (PST)
Received: from sucnaath.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d4d0e000000b002bde537721dsm4231826wrt.20.2023.01.27.07.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:34:51 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, John Cox <jc@kynesim.co.uk>
Subject: [PATCH 2/2] media: v4l: Add documentation for Broadcom sand formats
Date:   Fri, 27 Jan 2023 15:34:15 +0000
Message-Id: <20230127153415.83126-3-jc@kynesim.co.uk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230127153415.83126-1-jc@kynesim.co.uk>
References: <20230127153415.83126-1-jc@kynesim.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for for the Broadcom sand formats to pixfmt-yuv-planar.

Signed-off-by: John Cox <jc@kynesim.co.uk>
---
 .../media/v4l/pixfmt-yuv-planar.rst           | 192 ++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index f1d5bb7b806d..c1dd0856f497 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -123,6 +123,20 @@ All components are stored with the same number of bits per component.
       - Cb, Cr
       - Yes
       - 4x4 tiles
+    * - V4L2_PIX_FMT_NV12_C128
+      - 'CN12'
+      - 8
+      - 4:2:0
+      - Cb, Cr
+      - Yes
+      - 128 byte columns
+    * - V4L2_PIX_FMT_P030_C128
+      - 'CN30'
+      - 10
+      - 4:2:0
+      - Cb, Cr
+      - Yes
+      - 128 byte columns
     * - V4L2_PIX_FMT_NV16
       - 'NV16'
       - 8
@@ -277,6 +291,8 @@ of the luma plane.
 .. _V4L2-PIX-FMT-NV12M-10BE-8L128:
 .. _V4L2-PIX-FMT-NV12-10BE-8L128:
 .. _V4L2-PIX-FMT-MM21:
+.. _V4L2-PIX-FMT-NV12-C128:
+.. _V4L2-PIX-FMT-P030-C128:
 
 Tiled NV12
 ----------
@@ -364,6 +380,182 @@ two non-contiguous planes.
 
     Example V4L2_PIX_FMT_NV12MT memory layout of tiles
 
+``V4L2_PIX_FMT_NV21_C128`` store 8 bit luma and chroma data in 128 byte
+columns. Chroma data follows luma in each column. Height, which must be
+a multiple of 2 (h in the table below) determines the offset to the start
+of chroma data. Overall (luma + chroma)
+column height (ch in the table below) is also required and this is obtained
+by dividing the sizeimage by bytesperline. bytesperline is width rounded up
+to the next multiple of the column width (128).
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 15 10 10 10 10 4 10 10 10 10
+
+    * - start + 0:
+      - Y'\ :sub:`0,0`
+      - Y'\ :sub:`0,1`
+      - Y'\ :sub:`0,2`
+      - Y'\ :sub:`0,3`
+      - ...
+      - Y'\ :sub:`0,124`
+      - Y'\ :sub:`0,125`
+      - Y'\ :sub:`0,126`
+      - Y'\ :sub:`0,127`
+    * - start + 128:
+      - Y'\ :sub:`1,0`
+      - Y'\ :sub:`1,1`
+      - Y'\ :sub:`1,2`
+      - Y'\ :sub:`1,3`
+      - ...
+      - Y'\ :sub:`1,124`
+      - Y'\ :sub:`1,125`
+      - Y'\ :sub:`1,126`
+      - Y'\ :sub:`1,127`
+    * - start + 256:
+      - Y'\ :sub:`2,0`
+      - Y'\ :sub:`2,1`
+      - Y'\ :sub:`2,2`
+      - Y'\ :sub:`2,3`
+      - ...
+      - Y'\ :sub:`2,124`
+      - Y'\ :sub:`2,125`
+      - Y'\ :sub:`2,126`
+      - Y'\ :sub:`2,127`
+    * - ...
+      - ...
+      - ...
+      - ...
+      - ...
+      - ...
+      - ...
+      - ...
+    * - start + ((h-1) * 128):
+      - Y'\ :sub:`h-1,0`
+      - Y'\ :sub:`h-1,1`
+      - Y'\ :sub:`h-1,2`
+      - Y'\ :sub:`h-1,3`
+      - ...
+      - Y'\ :sub:`h-1,124`
+      - Y'\ :sub:`h-1,125`
+      - Y'\ :sub:`h-1,126`
+      - Y'\ :sub:`h-1,127`
+    * - start + ((h) * 128):
+      - Cb\ :sub:`0,0`
+      - Cr\ :sub:`0,0`
+      - Cb\ :sub:`0,1`
+      - Cr\ :sub:`0,1`
+      - ...
+      - Cb\ :sub:`0,62`
+      - Cr\ :sub:`0,62`
+      - Cb\ :sub:`0,63`
+      - Cr\ :sub:`0,63`
+    * - start + ((h+1) * 128):
+      - Cb\ :sub:`1,0`
+      - Cr\ :sub:`1,0`
+      - Cb\ :sub:`1,1`
+      - Cr\ :sub:`1,1`
+      - ...
+      - Cb\ :sub:`1,62`
+      - Cr\ :sub:`1,62`
+      - Cb\ :sub:`1,63`
+      - Cr\ :sub:`1,63`
+    * - ...
+      - ...
+      - ...
+      - ...
+      - ...
+      - ...
+      - ...
+      - ...
+    * - start + ((h+(h/2)-1) * 128):
+      - Cb\ :sub:`(h/2)-1,0`
+      - Cr\ :sub:`(h/2)-1,0`
+      - Cb\ :sub:`(h/2)-1,1`
+      - Cr\ :sub:`(h/2)-1,1`
+      - ...
+      - Cb\ :sub:`(h/2)-1,62`
+      - Cr\ :sub:`(h/2)-1,62`
+      - Cb\ :sub:`(h/2)-1,63`
+      - Cr\ :sub:`(h/2)-1,63`
+    * - start + (ch * 128):
+      - Y'\ :sub:`0,128`
+      - Y'\ :sub:`0,129`
+      - Y'\ :sub:`0,130`
+      - Y'\ :sub:`0,131`
+      - ...
+      - Y'\ :sub:`0,252`
+      - Y'\ :sub:`0,253`
+      - Y'\ :sub:`0,254`
+      - Y'\ :sub:`0,255`
+    * - ...
+      - ...
+      - ...
+      - ...
+      - ...
+      - ...
+      - ...
+      - ...
+
+``V4L2_PIX_FMT_P030_C128`` uses the same 128 byte column structure as
+``V4L2_PIX_FMT_NV12_C128``, but encodes 10-bit YUV.
+3 10-bit values are packed into 4 bytes as bits 9:0, 19:10, and 29:20, with
+bits 30 & 31 unused. For the luma plane, bits 9:0 are Y0, 19:10 are Y1, and
+29:20 are Y2. For the chroma plane the samples always come in pairs of Cr
+and Cb, so it needs to be considered 6 values packed in 8 bytes. bytesperline
+is ((width + 95)/96)*128
+
+Bit-packed representation - Luma:
+
+.. flat-table::
+    :header-rows:  1
+    :stub-columns: 0
+
+    * - byte
+      - value(s)
+    * - 0
+      - Y'\ :sub:`00[7:0]`
+    * - 1
+      - Y'\ :sub:`01[5:0]`\  (bits 7--2)
+      - Y'\ :sub:`00[9:8]`\  (bits 1--0)
+    * - 2
+      - Y'\ :sub:`02[3:0]`\  (bits 7--4)
+      - Y'\ :sub:`01[9:6]`\  (bits 3--0)
+    * - 3
+      - unused (bits 7--6)
+      - Y'\ :sub:`02[9:4]`\  (bits 5--0)
+
+Bit-packed representation - Chroma:
+
+.. flat-table::
+    :header-rows:  1
+    :stub-columns: 0
+
+    * - byte
+      - value(s)
+    * - 0
+      - Cb\ :sub:`00[7:0]`
+    * - 1
+      - Cr\ :sub:`00[5:0]`\  (bits 7--2)
+      - Cb\ :sub:`00[9:8]`\  (bits 1--0)
+    * - 2
+      - Cb\ :sub:`01[3:0]`\  (bits 7--4)
+      - Cr\ :sub:`00[9:6]`\  (bits 3--0)
+    * - 3
+      - unused (bits 7--6)
+      - Cb\ :sub:`02[9:4]`\  (bits 5--0)
+    * - 4
+      - Cr\ :sub:`01[7:0]`
+    * - 5
+      - Cb\ :sub:`02[5:0]`\  (bits 7--2)
+      - Cr\ :sub:`01[9:8]`\  (bits 1--0)
+    * - 6
+      - Cr\ :sub:`02[3:0]`\  (bits 7--4)
+      - Cb\ :sub:`02[9:6]`\  (bits 3--0)
+    * - 7
+      - unused (bits 7--6)
+      - Cr\ :sub:`02[9:4]`\  (bits 5--0)
 
 .. _V4L2-PIX-FMT-NV16:
 .. _V4L2-PIX-FMT-NV61:
-- 
2.37.2

