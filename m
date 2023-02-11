Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F92C6933DE
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 21:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjBKU5k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 15:57:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjBKU5j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 15:57:39 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFB214492
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 12:57:38 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id n13so6177016wmr.4
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 12:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dUEr9eXoMzbYbCBQ2hq4AC5F7Kd/oMpb0hpij4vvQM=;
        b=a0JQo3aYXVyztb7HQZ98PLUwN4ku+afRvomMN5g+LOmC66BiC4Bkq7gY2/5LaZPCwV
         qqBLgTbKoKdaxl91S8vBUEmCJ+/T9lH0/l6h6c+aOkxoePFkP3kIOx/E41/ZfP+Bquon
         /cGXkVYoiadSqzVSS6mNIRsdhbvgvNQF0S59i9PwADyJlyqsJbEYHvYlpWIne5FJeQNi
         RdL6rJf3WI9eu3S7XjaPJhgHYCUk4KRd9v+UhDCesiQBqesBUMtZ0aqqjwnpCCk500dy
         GuHji54KHmnt71bFsp+BAwsTRP7vfm7jUdxYx3PJlT8YpMljuyfZCOQgCWCfloko5PPk
         o/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dUEr9eXoMzbYbCBQ2hq4AC5F7Kd/oMpb0hpij4vvQM=;
        b=Kv8DT1+shr4P3OdhPe65iDcghIuiQzwIgz4/UOBxVT3li7sdsKldrs3IWg1QfwgF7e
         WuRAmMB92rvMd+VSvS9uIRi1iQzJmhJ+8PUbOGxNXt3jYKcoFCTzO1KYZmvPmMhUnPpO
         q7H7sdASdEyby4ufdalBt3DrSKG7otIIsSxQxM6PuMrzBie52MPeGegP4tYoUrBXH3GH
         SwIoWmBekHr63M/Vgb7nO3MOrciSMbricePERjIoeTND1kMcIanf6bnSTy1ovfFMZQuD
         ge610+wMM1UlJDdrrEJq45q65iy9wD4BNlfTpr84CUiY00d7N/mIvqofikQe6Efg1nPL
         s6rg==
X-Gm-Message-State: AO0yUKV7GWn1ggAZB/QuEyUUsmgLzSagEY59lYw0Iy/sXJU+TNpGzGfU
        KcJNLUTU3RyItn6XB8LxeSXweQ==
X-Google-Smtp-Source: AK7set/OFb7Gf2/iCgzjEdsyOMm1Hu7JXruMNd/x3hTEETALA+SFIL6aby+oKNHlZYqb/8BcyGkD4w==
X-Received: by 2002:a05:600c:a68f:b0:3da:db4:6105 with SMTP id ip15-20020a05600ca68f00b003da0db46105mr15970788wmb.37.1676149056868;
        Sat, 11 Feb 2023 12:57:36 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id n6-20020a7bcbc6000000b003dfe57f6f61sm8438522wmi.33.2023.02.11.12.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 12:57:36 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-media@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [RFT/PATCH] media: rcar-vin: Add support for RAW10 on V3U
Date:   Sat, 11 Feb 2023 21:57:14 +0100
Message-Id: <20230211205714.494998-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The R-Car V3U SoC is capable of capturing RAW10. Add support for it
using the V4L2_PIX_FMT_Y10 pixel format, which I think is the correct
format to express RAW10 unpacked to users.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---

Hi Renesas BSP team,

I don't have a RAW10 capable device, could you please test this patch
and provide a Tested-by tag?

Kind Regards
Niklas
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c |  1 +
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c  | 12 ++++++++++++
 drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c |  8 ++++++++
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h  |  2 ++
 4 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 5e53d6b7036c..061e83578d5d 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1299,6 +1299,7 @@ static const struct rvin_info rcar_info_r8a779a0 = {
 	.use_mc = true,
 	.use_isp = true,
 	.nv12 = true,
+	.raw10 = true,
 	.max_width = 4096,
 	.max_height = 4096,
 };
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 2a77353f10b5..4935dbecc68d 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -123,7 +123,9 @@
 /* Video n Data Mode Register bits */
 #define VNDMR_A8BIT(n)		(((n) & 0xff) << 24)
 #define VNDMR_A8BIT_MASK	(0xff << 24)
+#define VNDMR_RMODE_RAW10	(2 << 19)
 #define VNDMR_YMODE_Y8		(1 << 12)
+#define VNDMR_YC_THR		(1 << 11)
 #define VNDMR_EXRGB		(1 << 8)
 #define VNDMR_BPSM		(1 << 4)
 #define VNDMR_ABIT		(1 << 2)
@@ -780,6 +782,9 @@ static int rvin_setup(struct rvin_dev *vin)
 	case MEDIA_BUS_FMT_Y8_1X8:
 		vnmc |= VNMC_INF_RAW8;
 		break;
+	case MEDIA_BUS_FMT_Y10_1X10:
+		vnmc |= VNMC_INF_RGB666;
+		break;
 	default:
 		break;
 	}
@@ -888,6 +893,9 @@ static int rvin_setup(struct rvin_dev *vin)
 			dmr = 0;
 		}
 		break;
+	case V4L2_PIX_FMT_Y10:
+		dmr = VNDMR_RMODE_RAW10 | VNDMR_YC_THR;
+		break;
 	default:
 		vin_err(vin, "Invalid pixelformat (0x%x)\n",
 			vin->format.pixelformat);
@@ -1270,6 +1278,10 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
 		if (vin->format.pixelformat != V4L2_PIX_FMT_GREY)
 			return -EPIPE;
 		break;
+	case MEDIA_BUS_FMT_Y10_1X10:
+		if (vin->format.pixelformat != V4L2_PIX_FMT_Y10)
+			return -EPIPE;
+		break;
 	default:
 		return -EPIPE;
 	}
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 073f70c6ac68..c9be192cb4e5 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -86,6 +86,10 @@ static const struct rvin_video_format rvin_formats[] = {
 		.fourcc			= V4L2_PIX_FMT_GREY,
 		.bpp			= 1,
 	},
+	{
+		.fourcc			= V4L2_PIX_FMT_Y10,
+		.bpp			= 4,
+	},
 };
 
 const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
@@ -106,6 +110,10 @@ const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
 		if (!vin->info->nv12 || !(BIT(vin->id) & 0x3333))
 			return NULL;
 		break;
+	case V4L2_PIX_FMT_Y10:
+		if (!vin->info->raw10)
+			return NULL;
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index cb206d3976dd..921e35d9dfe0 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -152,6 +152,7 @@ struct rvin_group_route {
  * @use_mc:		use media controller instead of controlling subdevice
  * @use_isp:		the VIN is connected to the ISP and not to the CSI-2
  * @nv12:		support outputing NV12 pixel format
+ * @raw10:		support outputing RAW10 pixel format
  * @max_width:		max input width the VIN supports
  * @max_height:		max input height the VIN supports
  * @routes:		list of possible routes from the CSI-2 recivers to
@@ -163,6 +164,7 @@ struct rvin_info {
 	bool use_mc;
 	bool use_isp;
 	bool nv12;
+	bool raw10;
 
 	unsigned int max_width;
 	unsigned int max_height;
-- 
2.39.1

