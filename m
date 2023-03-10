Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0268B6B5118
	for <lists+linux-media@lfdr.de>; Fri, 10 Mar 2023 20:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbjCJTmV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Mar 2023 14:42:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbjCJTmP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Mar 2023 14:42:15 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56BC1138F5D
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 11:42:12 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso4219163wmo.0
        for <linux-media@vger.kernel.org>; Fri, 10 Mar 2023 11:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20210112.gappssmtp.com; s=20210112; t=1678477331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QExVOblCY3u97Tsoofi4Jvymy6eK/2rmk1ou10/SPTw=;
        b=CE/hIiTgIrbD7DjYqNOKtP549RzKGEC0wo7rWRGOenMN65qoOQ1muGvxMqiiU/W8Fx
         Js0PcxY5bNGEtxhkQJDujDkSQ6bXmiR0SO3VrNbbl41Wqj8B31WGcLhBFWRwrW6gNRfE
         mjm2pjWZ82vaaYNs1Xja9Yn3m2G9dYPmjOPxoUSH9ladjGyurFNH+KfVoIvga0hkirc2
         daorMjZ5N/JDPuyWjjr5yglTMrOllVpBV85GnyYa6mMzZXeFeWSNXIWPNTLMh3MTPOZa
         3ivc/tPdUvCEDE9AETofLHDuGpq6wCnD4R6PS2r19mfsgfZ6DljiFPbFAW+pYV4qcg8M
         k+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678477331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QExVOblCY3u97Tsoofi4Jvymy6eK/2rmk1ou10/SPTw=;
        b=EPFUImhQM3kiaViCYFflX2LedXxbXatT/h+YF7VYFC1Vw15fUS+nsoQ5LJ160LPtWD
         2ERUhhnagnNBUfwyxBl4UIjFF/qWdMppglukXjXT3PptCis2PJVcmpb2pqpebmbqp7xd
         Ly7EYX+q9dNS3CWKiITMExAm4FdCAO6IF3DJ86LZW3WEiC+dKsY0FmCkmb6fW/SxRI4V
         LM/TiRX/mmrBVugvs4t25NVPdmmKnStj1pcFIfxeIXSYKdq9A1b61sMTWR8Y+CfsjY0y
         +vwfvTIyJXRyaZxOUxDZUfQIyFI2o9UvBujiZLK8aexSSEA8KIC/mhWQ1SuxGIpvEC6A
         M6/Q==
X-Gm-Message-State: AO0yUKU0mrfow1/fJge8vzEql1JkvH8PlAwE/5EEmEF+3CmjaL/CfJt8
        jk030Ca5PHBlOadkr4Q1SBgGXGhQvZrJUboTSLI=
X-Google-Smtp-Source: AK7set8+fvCtsEh6o1KfEVFa0APK5MKWFRoPrarn1MCcg46ZH72PIRN3POSx5VEHRxa1cQv56sQRPQ==
X-Received: by 2002:a05:600c:19d3:b0:3eb:5d17:8ddc with SMTP id u19-20020a05600c19d300b003eb5d178ddcmr3910376wmq.18.1678477330913;
        Fri, 10 Mar 2023 11:42:10 -0800 (PST)
Received: from sucnaath.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id n4-20020adffe04000000b002c54c92e125sm585400wrr.46.2023.03.10.11.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 11:42:10 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     linux-media@vger.kernel.org, nicolas@ndufresne.ca,
        hverkuil-cisco@xs4all.nl
Cc:     John Cox <jc@kynesim.co.uk>
Subject: [PATCH v2 3/5] media: v4l: Add documentation for Broadcom sand formats
Date:   Fri, 10 Mar 2023 19:41:19 +0000
Message-Id: <20230310194121.61928-4-jc@kynesim.co.uk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230310194121.61928-1-jc@kynesim.co.uk>
References: <20230310194121.61928-1-jc@kynesim.co.uk>
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
 .../media/v4l/pixfmt-yuv-planar.rst           | 195 ++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index f1d5bb7b806d..753e05beddc8 100644
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
@@ -364,6 +380,185 @@ two non-contiguous planes.
 
     Example V4L2_PIX_FMT_NV12MT memory layout of tiles
 
+``V4L2_PIX_FMT_NV12_C128`` stores 8 bit luma and chroma data in 128 byte
+columns. Chroma data follows luma in each column so in effect this format
+consists of a sequence of NV12 pictures 128 pixels wide which are displayed
+side by side. Height, which must be a multiple of 2 (h in the table below)
+determines the offset to the start of chroma data. Overall (luma + chroma)
+column height (ch in the table below) is also required and this is obtained
+by dividing the sizeimage by bytesperline. Set bytesperline equal to number
+of columns times column width i.e. bytesperline is width rounded up
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
+and Cb, so it needs to be considered 6 values packed in 8 bytes.
+This gives 96 pixels per 128 byte column so bytesperline
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

