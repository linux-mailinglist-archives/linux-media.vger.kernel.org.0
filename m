Return-Path: <linux-media+bounces-18937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A2998BF38
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2E6FB251AC
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD291C9DD3;
	Tue,  1 Oct 2024 14:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoXYj9bt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F471C9B69;
	Tue,  1 Oct 2024 14:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791789; cv=none; b=ZurYK+TlIsV9g+N0FQSz+SY6tZDblzz0VC2FJMT2Wg+/ZgiElqjhx/YjWqqjZPtViVYRgsa+JoiTvBMOQu4qFtit7uHnmCI0ijXWAvGEUZyCZEGGCI6PNLHzClzfXUcNkaJL8sMxAhltYChwHqLpvwTubfL0XjW7NN+3rKAih7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791789; c=relaxed/simple;
	bh=c9vX15A31VpiTtvs4AN6ElEuVWXO4KreviWo3f3fyf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tIB8faC0lsFvyACYF62Wp4lPP5nrRX81u8unkXxEsWzFX0GAn9wOcv6oYylefnZN/myLCF6ya+N5oTRy0d4u4W2WprWaclrK+sw3uKQ5oHKECDhfDzaezX+mqYkTUqmmh9tU5663kA6pUDEe4gMF1/ORzGb5P1rbREuHjfRSv+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoXYj9bt; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8ce5db8668so969775766b.1;
        Tue, 01 Oct 2024 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791786; x=1728396586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lx1ETSedcsd+vrLUvhKjry54pz5h22KPwWnuNfi33ow=;
        b=RoXYj9btb95jz1wsM4TTHjZ4jJSrSjt2aUunC13AOwEluzv7cJmdZYsAZeuJhxb6sn
         GksqlIbFC5L9hCYU6s3ECtbBJW4APWwepinAmWIynzsJ4zB0aqtCddq2Eac48zdcsjuq
         XlJW1GdWUuKtAHdH0kSgv6gCu/f39iozgojAS/ioFZmS4j07uPW0bpg7/Hgfa3TcqU2n
         PSkr2nv3qH+Gqx0KTMr6qjmBA5kHg1GjhLi90sVcB45H3KTmSI9W50X2DVxxQ6YJEXvt
         yAxrKNRrOyfxyi48VJnTxc1hWBKujksTg7Uk6HA8zNLG1HuYZIhBWgWG1vVT41RRiCDW
         h+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791786; x=1728396586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lx1ETSedcsd+vrLUvhKjry54pz5h22KPwWnuNfi33ow=;
        b=B0gURfq/fGseD6QzLY0AwFml9c2mbgy9gwzCXF8nRzrJY0SfUilCk1oCYaPpuqkNDq
         C47p3lZALm0W9tsH3yV/omB5DgSXh5iAoKPCZdZzuJsYC6LKjLFgsgfVpLh+nitA9Z+U
         Olea4Y32FWE1cH/8sxry+Fn+b06NiXYedT9a5DI0sEpJ3sDIwIoJbJC6R5tfXoJMZDBF
         Q38h79CdUfSZXZkrKLyk3IlVOjQYn1VrsNb89GDwxX2AqmNX6dV7Jv6nh2vjPoDC5tzC
         IE7Js9joXQAARXoKwfJWBL81sSt0cahgtOAIbhrzp3HrM89VQBbe+NdSvOC/O9SAJA9C
         /5nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBTJTgcgOdy4mZ0h4uRahG3ULBzdobWgSRG87Mmp5rYODB7KICVS3/xdoSb+Dm/kkenPjXmDsaxxM+YBw=@vger.kernel.org, AJvYcCXweJZda6R2ZFlnZfJsbmFXRNYlz4Okz77YkMS5LXS5qkQ+/8b/lIKIx30Tkvz+05Fg0DqU0UjVLZbg8Bp0Wj07cNk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvmy/zPVDsAdpZb4KpgMWSt5L7vALjJdjAPtaR4cmOPexKoD3y
	7jiOCO0HSjr7OTkOHNeH+xRxnIFnc+6k8zEHMJ+ict5iTZ8hdi9Xps1ZFw==
X-Google-Smtp-Source: AGHT+IHRkRap/WN1EUUjdTpE9GrXX8eFr9QFl1DVJqFAtMSKFX9sfxcYkTvl/I0NQY10TQBukhzS9w==
X-Received: by 2002:a17:906:fe47:b0:a91:158a:a900 with SMTP id a640c23a62f3a-a93c4a988e5mr2030139866b.58.1727791786383;
        Tue, 01 Oct 2024 07:09:46 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:45 -0700 (PDT)
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
Subject: [PATCH v3 08/17] media: rzg2l-cru: Use MIPI CSI-2 data types for ICnMC_INF definitions
Date: Tue,  1 Oct 2024 15:09:10 +0100
Message-ID: <20241001140919.206139-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The INF field in the ICnMC register accepts data type codes as specified
in the MIPI CSI-2 v2.1 specification. This patch introduces the
`ICnMC_INF()` macro to use the MIPI CSI-2 data types, which are available
in the `media/mipi-csi2.h` header.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2->v3
- Updated subject line
- Collected RB tag

v1->v2
- New patch
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 9ab7ef33c9da..de88c0fab961 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -15,6 +15,7 @@
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-dma-contig.h>
 
@@ -77,8 +78,7 @@
 /* CRU Image Processing Main Control Register */
 #define ICnMC				0x208
 #define ICnMC_CSCTHR			BIT(5)
-#define ICnMC_INF_YUV8_422		(0x1e << 16)
-#define ICnMC_INF_USER			(0x30 << 16)
+#define ICnMC_INF(x)			((x) << 16)
 #define ICnMC_VCSEL(x)			((x) << 22)
 #define ICnMC_INF_MASK			GENMASK(21, 16)
 
@@ -307,12 +307,12 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
 
 	switch (ip_sd_fmt->code) {
 	case MEDIA_BUS_FMT_UYVY8_1X16:
-		icnmc = ICnMC_INF_YUV8_422;
+		icnmc = ICnMC_INF(MIPI_CSI2_DT_YUV422_8B);
 		*input_is_yuv = true;
 		break;
 	default:
 		*input_is_yuv = false;
-		icnmc = ICnMC_INF_USER;
+		icnmc = ICnMC_INF(MIPI_CSI2_DT_USER_DEFINED(0));
 		break;
 	}
 
-- 
2.43.0


