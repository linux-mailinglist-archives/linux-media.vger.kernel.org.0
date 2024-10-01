Return-Path: <linux-media+bounces-18945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9209098BF59
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41039280D82
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6598B1CBEAE;
	Tue,  1 Oct 2024 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Py02r7KE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F84F1C6F66;
	Tue,  1 Oct 2024 14:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791798; cv=none; b=caw3iggitfcyYBymfGWxqCnl2c9rROV67l51O6+BxCgDCXQQ2uZRh4puP24J2ybtiXCGld5RBlY6Gjkt5T4fsLHMc5cKf0l9eQhh7MSMoq/L12uB32urv3Y/UHEy03UzkyotaWkH+Q0+0RJiLvhy48YxdB3gCiZqUJY12q/GJLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791798; c=relaxed/simple;
	bh=DXHAPbsDj/cwzlGpSaxnBgeGyc2inqFhC5IxtJKQ9BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJfPPtvJHCGO60pRcWO65wa6pqV0tyYM0lc2wUxJUlGDE0tCczF+bduTZaTvpWgL2eowlSVDpElsh0Txn9JmZDwfBGlTLK//nVPjIL3x/Vu56bz0sjz7QSo2wgSOreOiYeh+0MuSS6/rwRZwLtpB6/4IgVl+75xBejX594/qA9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Py02r7KE; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8b155b5e9eso24957166b.1;
        Tue, 01 Oct 2024 07:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791795; x=1728396595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qo8MBtYtUDbvTQNmhyCFYaBep+Kwt548CvVsfmRtKkw=;
        b=Py02r7KEevTxd1PpB68OytPmnMfTIgCyeBar3MKwsvypNpXv6WyA492rH/VPJqwoAQ
         7yhSpTUOXHKVY2ChSesrMizuqFd/jTj9OSAELocqyZAgN+WPladOJL7+DbpG2LaBd+b2
         rmBzqVuCykzUZxABtXSbrmpKD2USslYGPObudnK4apLRoc1Yac+sT7+X9U0Td4RnJUCY
         dnagwvGC0UAtiUHVPQ8+V1sp3QgPunSvv5Q+8/YjoPH33bXmtOOC5qUjXCX1N0Gc+yne
         thhDw92sMfch35nSmF907ptwfbrJpcj/uxBfNjJJCYR4pXhKImjuuRjjSwCAVI9jwD7Y
         bswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791795; x=1728396595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qo8MBtYtUDbvTQNmhyCFYaBep+Kwt548CvVsfmRtKkw=;
        b=vTA/dI+GDTeAolFF+tss4wurDzq9uhGzykNoL1j5W8MM6yzEQXp+qhv/mQ8WCYNZ7n
         xf0wk4E2Z/d0HSCJhHp3pPY/pvA8ptgEsZveszAyds6B4vGRLBBeDWNwzS94Pb5cvONS
         z1b5zH7aBNcyxJ3smOd0Ty1NILz0VJVV6B+sZYgowBaYbMxoV73np9F5NnjZeNF+tBt2
         NM5/CtLqVEtlOm1I0D0fZV7UDaC+YVN9KA9kQVgJnAZCD6DMaxSrwcMwYtGWyKUb8f18
         LLC/ssII/FHVp/zrU2gaO1+wMlWQGITIoeLKLT5Zuk1HMqowQjwNr8Mt1TdFYU2pvR5h
         Dw6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGxzl0akri82Ji7xfpvVZtS1UKOTsdEAgmt4CEr8JP6w/jHw78XChVbeUp8U4NcE8N8yWyJqti/z4oHJg=@vger.kernel.org, AJvYcCX1Q6Whl3TYHWC7Oyd/HjjRecrPUUC6dsam6o2R6fXLf/9IHX7wS19Q1GrkqbdnokEvFBmqkVfN4xtSHPg1fLSD/UU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL/KmAC2rQKlLhOztOFna7LmWN3V8hK+4uYDJoNDHc3z12w6ao
	zxF7iLEUJRyAmrisP0Sny/wqwFQDNuPyjbf+3wH27BhEpZB6+qfk
X-Google-Smtp-Source: AGHT+IEuetukOcYWO9V/MStpK5GipVWB5EOmhPOChI+zos5mMngpYLsEy2QB+wCWh9VrnoEf+YOY/A==
X-Received: by 2002:a17:907:9341:b0:a8d:4e26:c9b9 with SMTP id a640c23a62f3a-a93c49218abmr1631032166b.17.1727791795261;
        Tue, 01 Oct 2024 07:09:55 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:54 -0700 (PDT)
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
Subject: [PATCH v3 16/17] media: rzg2l-cru: Add support to capture 8bit raw sRGB
Date: Tue,  1 Oct 2024 15:09:18 +0100
Message-ID: <20241001140919.206139-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support to capture 8bit Bayer formats.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2->v3
- Updated subject line
- Collected RB tag

v1->v2
- Used the simplified version of format handling
---
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |  4 +++
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 28 +++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index e21142d3b67d..84230926875a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -188,6 +188,10 @@ struct rzg2l_csi2_format {
 
 static const struct rzg2l_csi2_format rzg2l_csi2_formats[] = {
 	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8, .bpp = 8, },
+	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .bpp = 8, },
+	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .bpp = 8, },
+	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .bpp = 8, },
 };
 
 static inline struct rzg2l_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index f14ac949cc64..7e3f725eeece 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -19,6 +19,34 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 		.bpp = 2,
 		.icndmr = ICnDMR_YCMODE_UYVY,
 	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.format = V4L2_PIX_FMT_SBGGR8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 1,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.format = V4L2_PIX_FMT_SGBRG8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 1,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.format = V4L2_PIX_FMT_SGRBG8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 1,
+		.icndmr = 0,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.format = V4L2_PIX_FMT_SRGGB8,
+		.datatype = MIPI_CSI2_DT_RAW8,
+		.bpp = 1,
+		.icndmr = 0,
+	},
 };
 
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)
-- 
2.43.0


