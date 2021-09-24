Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B01416D9C
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 10:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244673AbhIXIWP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 04:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244645AbhIXIWO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 04:22:14 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EAA3C061756
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 01:20:41 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id b20so37350585lfv.3
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 01:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2lK4itpWLfIP47gsHiFv57wO+RI/8c66M8TUwLd+fZQ=;
        b=0p/tiWj+5/28CIwO/D67HDf77KD9XTJredqQcfOXKFifpJZkO1a6w0cZX+WEG1q0aT
         kKdI254BvEy5JKnqrj9XcuS31PwwGpslxtyRx9gvhiTxPRalevQM4FmWFsKvyPRp5VVK
         JacToDvTUsm1eRu9RrDHP+ySPP7Q1drN4TxX1+UnUdI5vqn+Hxxf/fTbrAH6MJwsJXLX
         TwGw0vbSLkI9UcaYfab403lcDpSv9sDfyqpwxsP/JkE0Q6RiP7TdULAk4kdACFTtPdf8
         YYRNQeecgLwYwJJ8lZ/cvNZzh42JvXOwwqbxWzae8B9JSVvWGIn9odTIXxFCO0Xw3vvE
         DReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2lK4itpWLfIP47gsHiFv57wO+RI/8c66M8TUwLd+fZQ=;
        b=lTiyPIiIc5QLFx0WBtHys9xeQ9UFpvfW67vgcBzh8txuXINYawCh5HZeLFZ8HnBZmB
         wR8IpQfaTU++ThR+P+ptAVvZQ1cc4DH7evnJfPaGszfsBy2IXohYFRjSEd+Nipv4qNkV
         eSvAWjL7oR7f0h304fU3Ts/rBTSrcwkuqsCJzRgdyJ18f+eckCybjny5Fl2JapMnWPHM
         iYxy6W8hwql3j2Hlfbg9ZfOFu4y0Ly9g+G5D8lnCeZ7wFay/JFyPKjjfElP/AP5uMp0W
         2L77ndo/qwWSzNPlVq7bgTHKmQYBV0SGs2JnWJFtw+enNH7e+N6hAUr95vNSW44vwBdp
         pzQA==
X-Gm-Message-State: AOAM531NIBc9fvgg+I3Hvis+naBVmvEiiPPnLUAorCUxBPDtp0pDsY2y
        aOBJe14apkaF8kUVl3QQaQZ1EA==
X-Google-Smtp-Source: ABdhPJwuBjxTqLU5M23xYZwBF39sXMpA4WHImPOj7s4pn3sGY8Ncg6nsho6omLrJI0Fzt7sc/rVv7Q==
X-Received: by 2002:a05:6512:1102:: with SMTP id l2mr7294591lfg.181.1632471639797;
        Fri, 24 Sep 2021 01:20:39 -0700 (PDT)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id d16sm679128lfg.138.2021.09.24.01.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 01:20:39 -0700 (PDT)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH] media: rcar-vin: add support for GREY format
Date:   Fri, 24 Sep 2021 11:19:39 +0300
Message-Id: <20210924081938.30230-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
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
 drivers/media/platform/rcar-vin/rcar-dma.c  | 14 ++++++++++++++
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index f5f722ab1d4e..d2bfd3e575fa 100644
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
@@ -774,6 +777,13 @@ static int rvin_setup(struct rvin_dev *vin)
 	case V4L2_PIX_FMT_SRGGB8:
 		dmr = 0;
 		break;
+	case V4L2_PIX_FMT_GREY:
+		if (input_is_yuv) {
+			dmr = VNDMR_DTMD_YCSEP | VNDMR_YMODE_Y8;
+			output_is_yuv = true;
+		} else
+			dmr = 0;
+		break;
 	default:
 		vin_err(vin, "Invalid pixelformat (0x%x)\n",
 			vin->format.pixelformat);
@@ -1145,6 +1155,10 @@ static int rvin_mc_validate_format(struct rvin_dev *vin, struct v4l2_subdev *sd,
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

