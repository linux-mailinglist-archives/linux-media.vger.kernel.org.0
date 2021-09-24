Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB70417226
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 14:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343807AbhIXMqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 08:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343764AbhIXMqB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 08:46:01 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF2AC0613CF
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 05:44:27 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id e15so39911383lfr.10
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 05:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4SH01R4UDbpzsZN06ben0KINDaSwIp1BbvQxp2nm2/8=;
        b=DWYLB7LLuHrQ4AlVw9RILzREmVIi26O/N+wD49YjLAC06D8X3+1H81eGOAjuogTmMa
         1Kgh0vPwtXHoGazJ3LDH1yHhtVN/afScINETDCMBLoZwE41d/G0htuP0+PPfkQOpo6H3
         /OZPlGRSs0pdyU79ig8FFWyjWGx+vXoDU99cDlJYOA4+4zIh/X6NYQrjF3ylxGHJ52Gy
         cyS8RzSg3lPtGpaZFHrMQKSnBPxXRDRmkpguJ63K9M4iwAw/XR8CV4Gj0FncMGVxFOks
         2uQibfNBixU4r3GmH8hta7yibVmWcSYJbjPHE+XoRtaF1DMcGtV0R9a7Q3BlMJW8zdSL
         ZK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4SH01R4UDbpzsZN06ben0KINDaSwIp1BbvQxp2nm2/8=;
        b=lUH283iaW17SR+Y10CTNjRYxqInkHRd4cjoLFZu7VfSqAi+YFobM8DAmC3PSJbDfwF
         7rTOmZWBQ179FfgA8/kPV9H4Lhjn/9ABEqen0jSbF+ctGZ7Jt1bpz93HjWHWIiGcIONA
         /cbMyeNymKqBGt9HExz+fHBp/A5Df1MkErbZmhuC5h/ILaf5qFDAGoccoDwfxL2nDLtB
         9QFzm0F5XbzAbITPBHFTSuuNZXlpQyhUd30orjpex08VXekVT7ZjpIiWu5abtXF95qbo
         zRrMKmvc8wSMcHZ3C1F3fdDe5QnwDFrChyJB+KLo0fPLBUPJXe7B2ac4T4smxjUQe6Gj
         jh3g==
X-Gm-Message-State: AOAM533I4ObECSiEyAksbY5RlOep7mgg5b8wr/4ZsbFGqSWUKUkC3Tqg
        29j04sgXWojVMRc9GquLskEc1A==
X-Google-Smtp-Source: ABdhPJy2dYwh7NjFnfNcBe7E7qiksBX17nrHZH5BgOqdkUVYgQKDRpJbDF4u1d1YWulSJ7Qz1Gqo4A==
X-Received: by 2002:a2e:7f04:: with SMTP id a4mr11514596ljd.308.1632487465519;
        Fri, 24 Sep 2021 05:44:25 -0700 (PDT)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id d23sm746793lfs.125.2021.09.24.05.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 05:44:25 -0700 (PDT)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH v2] media: rcar-vin: add GREY format
Date:   Fri, 24 Sep 2021 15:43:17 +0300
Message-Id: <20210924124315.26164-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YU2htCDCbedXi4ai@oden.dyn.berto.se>
References: <YU2htCDCbedXi4ai@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>

This adds support for MEDIA_BUS_FMT_Y8_1X8 input and V4L2_PIX_FMT_GREY
output format.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
Changes from v1:
- fix coding style issue

 drivers/media/platform/rcar-vin/rcar-dma.c  | 15 +++++++++++++++
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index f5f722ab1d4e..4d0d95cf4c5f 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -114,6 +114,7 @@
 /* Video n Data Mode Register bits */
 #define VNDMR_A8BIT(n)		(((n) & 0xff) << 24)
 #define VNDMR_A8BIT_MASK	(0xff << 24)
+#define VNDMR_YMODE_Y8		(1 << 12)
 #define VNDMR_EXRGB		(1 << 8)
 #define VNDMR_BPSM		(1 << 4)
 #define VNDMR_ABIT		(1 << 2)
@@ -603,6 +604,7 @@ void rvin_crop_scale_comp(struct rvin_dev *vin)
 	case V4L2_PIX_FMT_SGBRG8:
 	case V4L2_PIX_FMT_SGRBG8:
 	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_GREY:
 		stride /= 2;
 		break;
 	default:
@@ -695,6 +697,7 @@ static int rvin_setup(struct rvin_dev *vin)
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_Y8_1X8:
 		vnmc |= VNMC_INF_RAW8;
 		break;
 	default:
@@ -774,6 +777,14 @@ static int rvin_setup(struct rvin_dev *vin)
 	case V4L2_PIX_FMT_SRGGB8:
 		dmr = 0;
 		break;
+	case V4L2_PIX_FMT_GREY:
+		if (input_is_yuv) {
+			dmr = VNDMR_DTMD_YCSEP | VNDMR_YMODE_Y8;
+			output_is_yuv = true;
+		} else {
+			dmr = 0;
+		}
+		break;
 	default:
 		vin_err(vin, "Invalid pixelformat (0x%x)\n",
 			vin->format.pixelformat);
@@ -1145,6 +1156,10 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 		if (vin->format.pixelformat != V4L2_PIX_FMT_SRGGB8)
 			return -EPIPE;
 		break;
+	case MEDIA_BUS_FMT_Y8_1X8:
+		if (vin->format.pixelformat != V4L2_PIX_FMT_GREY)
+			return -EPIPE;
+		break;
 	default:
 		return -EPIPE;
 	}
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 0d141155f0e3..bdeff51bf768 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -82,6 +82,10 @@ static const struct rvin_video_format rvin_formats[] = {
 		.fourcc			= V4L2_PIX_FMT_SRGGB8,
 		.bpp			= 1,
 	},
+	{
+		.fourcc			= V4L2_PIX_FMT_GREY,
+		.bpp			= 1,
+	},
 };
 
 const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
-- 
2.30.2

