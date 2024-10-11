Return-Path: <linux-media+bounces-19459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACAE99AA35
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B3B3289512
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99FA1D0E20;
	Fri, 11 Oct 2024 17:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmFZcYfK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1941D0DC0;
	Fri, 11 Oct 2024 17:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667875; cv=none; b=rQvzcJw4biwCVTwm+RdCGXwQvJWo0XSZNWbSUVIdCgrozigqGoLiO5cWdzLSbUIZk0sGaljQTW+0bpwp3qnUSbUJexIxuNP0WMZjqTqXDbDdRmWBKBQv9t7oPdYC5EsXxkSvriLNALC+Y/P6ywoQW9FMoLjFYiYUBb/fpWaweXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667875; c=relaxed/simple;
	bh=SBDLLvT+tYkHyYzrrt3YaV1ugUtMtCxAYl+lmcAG8Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FoF4+NX5ru0/dl1b3vwvJEzI5ygB8dwG567X1WqvjNmlJwA8y8LXla6QMb7X/vugHp4+5tW8SQyTltYzsTBgGj6Wc40k3bhx40/qocOTyNWXig22GFtaGB0iKkyKQ7BHq2kvgS+7pK2LgJQFsS3P0ki1xorxh250PnTNsHLQcR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmFZcYfK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d50fad249so1068556f8f.1;
        Fri, 11 Oct 2024 10:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667872; x=1729272672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EI4+FlVaH8+BwT126GKNT8C9nofJLcr7PU9LplAktD4=;
        b=RmFZcYfKYAUuUvra/e0fWlIddblddzPTjmWuppWYFC960lBgk903GvkafHmnZbnJv3
         MwuZW/mJW1pROfSLzlEYP6HsPpio2tjzJh/G+fYq39LrVMht2f8IOvyQE6n91lSAb1qP
         n14gQNYSutq80IUEMZgsvu3k++0PzTMZDHiPrln0uLdszKdcTWSBcGTzi45uBjjtnPnY
         YvrVfEmfBWKudn/V61qeCLZRsjsy54x9J2K3bCgUL5yjR+XgIDtuu0MeNwK0LTHRTc4B
         h0/4UW98t6GkHmFRcilaIu8CxyNZ4rwhTo48LVFWyImsiUVzwjGxO8S3CKzrQhowPjGa
         MVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667872; x=1729272672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EI4+FlVaH8+BwT126GKNT8C9nofJLcr7PU9LplAktD4=;
        b=qIRUYFPGlbZ3BEpSV75CRoMbzSmIcl++BazE0Wog2mHN5vhsvwTnHZIMuAGOPMd4lu
         FRnpYxDVFmOf1/mBm7I0LYcfaVkZeLrbl0SHCPWlgR9ueR0IAVonPifJmYG1alGx2ZWa
         AxgDJITeNbvshiRaaQQKN2j5qkcknvXCPK5Q6Ee5MAIFJ3oxUKVgT66LX/CFpuPJgmEp
         Md50eTHr2RFNmIdOQo33FTh2mdO4EhETqJC8/v2DDJV6DOqnZyzejUURS5xyNT8Au3lx
         spVgQX/rfKPwvK27/UZc3jPSchH23q2uv9NFQaj3jgVl5dOi6NodwHUBaIq0lRA1Wwil
         +PNg==
X-Forwarded-Encrypted: i=1; AJvYcCUVoFdiKOL8iAWI0NOy4iG2O5FTmi0RIUMUT2BeCU1hzR8lQahsOTQX+odt0PnKl42ICf00USE3xZ6OJg8=@vger.kernel.org, AJvYcCUie7RH8Uip37CWRnRVX64DRdm1amq0F/Jiw3IgoaBnG1raC3z3TT0tXuyh5hPTSHBmYYsMaV1g5Vq7fiz2Kttaqic=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEwvs0BrP3GNbhPFbhf0j+TayU4efeN/+c2SMsd5eJ4n+kPVtY
	3V9+59fK8IB0c73nzzFtyB3oNoMCkZplsw84xyuhImVWfuNgjVJ4
X-Google-Smtp-Source: AGHT+IFCz9ssNpLDIhUPAPmVUOSfySYRYt1ZBy1sIsYK0/Brg4zGbAAbq7w7Xfs0S4+z/Feg06mY1A==
X-Received: by 2002:a5d:404d:0:b0:37d:4f1b:35b with SMTP id ffacd0b85a97d-37d551fb778mr2255048f8f.34.1728667871522;
        Fri, 11 Oct 2024 10:31:11 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 11/22] media: rzg2l-cru: Simplify configuring input format for image processing
Date: Fri, 11 Oct 2024 18:30:41 +0100
Message-ID: <20241011173052.1088341-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move the `rzg2l_cru_ip_format` struct to `rzg2l-cru.h` for better
accessibility and add a `datatype` member to it, allowing the
configuration of the ICnMC register based on the MIPI CSI2 data type.

Also, move the `rzg2l_cru_ip_code_to_fmt()` function to `rzg2l-cru.h`
to streamline format lookup and make it more accessible across the
driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h    | 12 ++++++++++++
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 13 +++++++------
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c  | 13 +++++++------
 3 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 4fe24bdde5b2..9b1ba015df3b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -62,6 +62,16 @@ struct rzg2l_cru_ip {
 	struct v4l2_subdev *remote;
 };
 
+/**
+ * struct rzg2l_cru_ip_format - CRU IP format
+ * @code: Media bus code
+ * @datatype: MIPI CSI2 data type
+ */
+struct rzg2l_cru_ip_format {
+	u32 code;
+	u32 datatype;
+};
+
 /**
  * struct rzg2l_cru_dev - Renesas CRU device structure
  * @dev:		(OF) device
@@ -150,4 +160,6 @@ int rzg2l_cru_ip_subdev_register(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_ip_subdev_unregister(struct rzg2l_cru_dev *cru);
 struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru);
 
+const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
+
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 7b006a0bfaae..8f9683bf31fa 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -6,17 +6,18 @@
  */
 
 #include <linux/delay.h>
-#include "rzg2l-cru.h"
+#include <media/mipi-csi2.h>
 
-struct rzg2l_cru_ip_format {
-	u32 code;
-};
+#include "rzg2l-cru.h"
 
 static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
-	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, },
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.datatype = MIPI_CSI2_DT_YUV422_8B,
+	},
 };
 
-static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
+const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
 {
 	unsigned int i;
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 401ef7be58ec..37fea2bed00f 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -301,18 +301,17 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 }
 
 static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
-				 struct v4l2_mbus_framefmt *ip_sd_fmt, u8 csi_vc)
+				 const struct rzg2l_cru_ip_format *ip_fmt,
+				 u8 csi_vc)
 {
-	u32 icnmc;
+	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
 
-	switch (ip_sd_fmt->code) {
+	switch (ip_fmt->code) {
 	case MEDIA_BUS_FMT_UYVY8_1X16:
-		icnmc = ICnMC_INF(MIPI_CSI2_DT_YUV422_8B);
 		*input_is_yuv = true;
 		break;
 	default:
 		*input_is_yuv = false;
-		icnmc = ICnMC_INF(MIPI_CSI2_DT_USER_DEFINED(0));
 		break;
 	}
 
@@ -328,11 +327,13 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 					   struct v4l2_mbus_framefmt *ip_sd_fmt,
 					   u8 csi_vc)
 {
+	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 	bool output_is_yuv = false;
 	bool input_is_yuv = false;
 	u32 icndmr;
 
-	rzg2l_cru_csi2_setup(cru, &input_is_yuv, ip_sd_fmt, csi_vc);
+	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
+	rzg2l_cru_csi2_setup(cru, &input_is_yuv, cru_ip_fmt, csi_vc);
 
 	/* Output format */
 	switch (cru->format.pixelformat) {
-- 
2.43.0


