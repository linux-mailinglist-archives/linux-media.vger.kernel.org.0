Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B113260D5
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 11:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbhBZKDw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 05:03:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbhBZKDa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 05:03:30 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B3AC061794
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:12 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id p5so5049636plo.4
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6/Bo4By7p3IUz3tjBrdPpIJAcax042CocWRAmdAp4Ks=;
        b=VYBMbiSQNniHtWFP82fU0Kr7M8kPq1JBFTFWg8ZGcG28lnshC+I3gymdEwzZrg5tPW
         f4Djm++OaK6QO1G7R1x3utmR+TIDcHCEr/Uf84tet6accRFMq40NbGwgE7u3b5f0pgK9
         uSGdPTTTiQSdPNf9Z8ElVnJZA5KUg8O2qaXIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6/Bo4By7p3IUz3tjBrdPpIJAcax042CocWRAmdAp4Ks=;
        b=towJg4+EirgkWLeOURP06bHQo65h5MimOnInankXu0p2aclOOXhCUTvheLANzy1eeW
         +0+T0xlB4vYXJt5U6NoC/hyft6tJZDMZpeLi0ppR2QaNVaJRGLiE1jhcDr+goikbfRwE
         +4AI4s0WVTXHCFhbDhI/autGpfli7wvwhv7eyEYuYIj1RFYGfZC7N5OGSCaut6a320y0
         DhZA/BfR/s4hOY5ZAjqRj2AmaY1it+rCyNL5zXruTC9BVcHQNPhZ1NyZ44HSwkSuCmQo
         GDN6OenPBE1pRUgYlyhtTRcV/QWOk4XgHSv3dcX6HhJHwbVPfQX806wKiFhIHvB2nLqz
         kGwA==
X-Gm-Message-State: AOAM533jSOr/bOjTij39FQRI7gC8BbiZHInkITOOWg6yGO2jn6E4bkd5
        ywcvXsj9BBYsVMn6haXi9ALWTg==
X-Google-Smtp-Source: ABdhPJw3kCQN2MNyQCJvMWFx2xvw9NHuseQeEU68r1BlhsFrDDf2RaczEiFSqGOMMNTA49VFafeGyA==
X-Received: by 2002:a17:90a:2e89:: with SMTP id r9mr2623085pjd.95.1614333731638;
        Fri, 26 Feb 2021 02:02:11 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
        by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 02:02:11 -0800 (PST)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v3 04/15] media: add Mediatek's MM21 format
Date:   Fri, 26 Feb 2021 19:01:37 +0900
Message-Id: <20210226100148.1663389-5-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add Mediatek's non-compressed 8 bit block video mode. This format is
produced by the MT8183 codec and can be converted to a non-proprietary
format by the MDP3 component.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 Documentation/userspace-api/media/v4l/pixfmt-reserved.rst | 7 +++++++
 drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
 include/uapi/linux/videodev2.h                            | 1 +
 3 files changed, 9 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index c9231e18859b..187ea89f7a25 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -242,6 +242,13 @@ please make a proposal on the linux-media mailing list.
 	It is an opaque intermediate format and the MDP hardware must be
 	used to convert ``V4L2_PIX_FMT_MT21C`` to ``V4L2_PIX_FMT_NV12M``,
 	``V4L2_PIX_FMT_YUV420M`` or ``V4L2_PIX_FMT_YVU420``.
+    * .. _V4L2-PIX-FMT-MM21:
+
+      - ``V4L2_PIX_FMT_MM21``
+      - 'MM21'
+      - Non-compressed, tiled two-planar format used by Mediatek MT8183.
+	This is an opaque intermediate format and the MDP3 hardware can be
+	used to convert it to other formats.
     * .. _V4L2-PIX-FMT-SUNXI-TILED-NV12:
 
       - ``V4L2_PIX_FMT_SUNXI_TILED_NV12``
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 31d1342e61e8..0b85b2bbc628 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1384,6 +1384,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_TM6000:	descr = "A/V + VBI Mux Packet"; break;
 	case V4L2_PIX_FMT_CIT_YYVYUY:	descr = "GSPCA CIT YYVYUY"; break;
 	case V4L2_PIX_FMT_KONICA420:	descr = "GSPCA KONICA420"; break;
+	case V4L2_PIX_FMT_MM21:		descr = "Mediatek 8-bit block format"; break;
 	case V4L2_PIX_FMT_HSV24:	descr = "24-bit HSV 8-8-8"; break;
 	case V4L2_PIX_FMT_HSV32:	descr = "32-bit XHSV 8-8-8-8"; break;
 	case V4L2_SDR_FMT_CU8:		descr = "Complex U8"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 79dbde3bcf8d..e6890dae76ec 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -731,6 +731,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greyscale 12-bit L/R interleaved */
 #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
 #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
+#define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediatek 8-bit block mode, two non-contiguous planes */
 #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
 #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
 #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
-- 
2.30.1.766.gb4fecdf3b7-goog

