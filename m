Return-Path: <linux-media+bounces-18944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD39498BF55
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FEEF2812F4
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE32B1C6F6C;
	Tue,  1 Oct 2024 14:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SufO6YGy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8EA1CB510;
	Tue,  1 Oct 2024 14:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791798; cv=none; b=nsgb0MNiuA6vnF6/3lTGmgG2VLor+N9bjCIlELWOgoa/ZisVCVzZbJKOjYHpMskO6kwQzVgeV3tNgtXpnwfCr8SCRSSj/vVM7PNFKrW0vIZT8g7P4UUE0PYc2mYzIfuBGnRkJg+haWsZ8sEJkwO+tJnaiqbiqaHYFvGhxo6lD1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791798; c=relaxed/simple;
	bh=C4zMQItZW/qfKIMM58l6qtq4Ef/XWpUnTtAiWDuuJng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uAZRjX4+CVvNUcKchHh+rmaMVagdxqq8ajjg0DAFAtwGNEuWO/mHvIVAD8GH2Io4zMIJLMegtMh6oQpLad8WB8iKww6/sATD2cTPoHUgjm5PK5ZTRkr1oUCysFRs8W3NZXidhAIEum2C6Sj3OGypVypEqIBQpKvCcwKKPKP+AT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SufO6YGy; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fad6de2590so21798851fa.0;
        Tue, 01 Oct 2024 07:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791795; x=1728396595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGUiaBEa3nzPljGE4aZ+kRrga+d/t1Ch2ngCb/UDkDs=;
        b=SufO6YGys3RmVxxV5vRFsBpby/Rc4Fx1HZcDxjWFow8XxOXApXAJ1EdH9lLPAR/6Wr
         k4/jvCls40BQ8SrwONNN7WMI/O9seVlXKve4RmMlGj9O6vw6DGIolK0DYL5mQoAYaBjS
         CIqoHwXXZjUyxWZMG8Mmr6s64LalKS4vDLpS2dwSqYdJu1rv3mJpaOXJjMsi3ZFIbxZM
         lzW/a43LmZv3J3Pfek0XgVWVYqPrWtV2zYgVNHV3ZxeaWc90GL3+k1cO9H3tz8yItfMR
         s9T8GFLXt4G/kCjLthRjCFZsGZKHU7EAVD8CT6jUL4JqFh0jMoX7HjLS5rtL/JelVisR
         icLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791795; x=1728396595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGUiaBEa3nzPljGE4aZ+kRrga+d/t1Ch2ngCb/UDkDs=;
        b=lAHejeXFDT9fifl/5u+ads0Kd9deYLjX5KCVOrHnfllPo0cau9Vm77MWYY254a+Btw
         oGDZPXDhEVvCS0gur8HpWhvvM9k9vOJEwGr7dkIkh5wT22VBx1b48WRMIo/HeVVn5IgR
         QasksIEJGXLFdl75Mw172EcdjarP1qS2IwbVCtNUOE14AGCdLs8XVKgdErc2fT+PbG2B
         EtLidx0v9WPmmZNSwj74YPdVfZL1JcSc6DMJ51U4VlYBJEP8V1HZTfzWB3Oxj5x2f7J9
         iMrUfwRjbCn4TVdBjNboBQ68QO1uEx/OR6g/ygu5BPPutthHNEyfzwi0cbX2vlm4cSL8
         jhgg==
X-Forwarded-Encrypted: i=1; AJvYcCUYdH4aq3ol340vJqmfYOW5rsNyQF5s8qZmvda8Xaf5E1ciH6iiZfkGii7pzev7RpMIDiCR8sFvkGG/zChuTts/vPk=@vger.kernel.org, AJvYcCWc1jekarH3FyAipEn0a/PFNXLv2dcySIWYJROAbpPvsu5hvX9MYh11uJgK1kiTL2lu42J68uRnX8sKFxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YygTkLpKDcDdMCSl2WsRrWE4h9QnSIYy2o/X6fh8VqS9xN42zhu
	SLepJYONMuo22dLlrZBPi7xP9+Z7+zCILrGZO+zO9eldU4vqAVno
X-Google-Smtp-Source: AGHT+IGUmBDHw2VGaxPSQ/ZD2Zyr1xQxy3o5T1VzZR29CXqpxiiDrj0Nd83h5T2+AZe3pqYNKI2iBw==
X-Received: by 2002:a2e:bc1c:0:b0:2fa:bd56:98c5 with SMTP id 38308e7fff4ca-2fabd569ad2mr92334061fa.33.1727791794218;
        Tue, 01 Oct 2024 07:09:54 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:53 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 15/17] media: rzg2l-cru: Refactor ICnDMR register configuration
Date: Tue,  1 Oct 2024 15:09:17 +0100
Message-ID: <20241001140919.206139-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241001140919.206139-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor the ICnDMR register configuration in
`rzg2l_cru_initialize_image_conv()` by adding a new member `icndmr` in the
`rzg2l_cru_ip_format` structure.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- Updated subject line and commit message
- Re-used rzg2l_cru_ip_format_to_fmt() to fetch icndmr details
- Collected RB tag

v1->v2
- New patch
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  4 ++++
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |  1 +
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 10 ++++------
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 39296a59b3da..51206373b7fe 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -31,6 +31,8 @@
 #define RZG2L_CRU_MIN_INPUT_HEIGHT	240
 #define RZG2L_CRU_MAX_INPUT_HEIGHT	4095
 
+#define ICnDMR_YCMODE_UYVY		(1 << 4)
+
 enum rzg2l_csi2_pads {
 	RZG2L_CRU_IP_SINK = 0,
 	RZG2L_CRU_IP_SOURCE,
@@ -68,12 +70,14 @@ struct rzg2l_cru_ip {
  * @format: 4CC format identifier (V4L2_PIX_FMT_*)
  * @datatype: MIPI CSI2 data type
  * @bpp: bytes per pixel
+ * @icndmr: ICnDMR register value
  */
 struct rzg2l_cru_ip_format {
 	u32 code;
 	u32 format;
 	u32 datatype;
 	u8 bpp;
+	u32 icndmr;
 };
 
 /**
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 6ce077ab42e2..f14ac949cc64 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -17,6 +17,7 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.format = V4L2_PIX_FMT_UYVY,
 		.datatype = MIPI_CSI2_DT_YUV422_8B,
 		.bpp = 2,
+		.icndmr = ICnDMR_YCMODE_UYVY,
 	},
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index c6c82b9b130a..c3d10b001b7c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -88,7 +88,6 @@
 
 /* CRU Data Output Mode Register */
 #define ICnDMR				0x26c
-#define ICnDMR_YCMODE_UYVY		(1 << 4)
 
 #define RZG2L_TIMEOUT_MS		100
 #define RZG2L_RETRIES			10
@@ -278,6 +277,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 					   u8 csi_vc)
 {
 	const struct v4l2_format_info *src_finfo, *dst_finfo;
+	const struct rzg2l_cru_ip_format *cru_video_fmt;
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 	u32 icndmr;
 
@@ -288,15 +288,13 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	dst_finfo = v4l2_format_info(cru->format.pixelformat);
 
 	/* Output format */
-	switch (cru->format.pixelformat) {
-	case V4L2_PIX_FMT_UYVY:
-		icndmr = ICnDMR_YCMODE_UYVY;
-		break;
-	default:
+	cru_video_fmt = rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat);
+	if (!cru_video_fmt) {
 		dev_err(cru->dev, "Invalid pixelformat (0x%x)\n",
 			cru->format.pixelformat);
 		return -EINVAL;
 	}
+	icndmr = cru_video_fmt->icndmr;
 
 	/* If input and output use same colorspace, do bypass mode */
 	if (v4l2_is_format_yuv(src_finfo) && v4l2_is_format_yuv(dst_finfo))
-- 
2.43.0


