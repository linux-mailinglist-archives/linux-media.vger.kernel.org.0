Return-Path: <linux-media+bounces-19177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 875CC9936AD
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F8892822F6
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCB81DE4FF;
	Mon,  7 Oct 2024 18:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnUyPTIG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F961DED66;
	Mon,  7 Oct 2024 18:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326941; cv=none; b=mmLNcGd39yS773kh9ge3TETDyXtWu8tcPxraZYEfqpmdUMYpPpMzwiubvly4P18N9aKT9uPY3E9R4b2xWekRHKCo5bYNnrl2/x5He5qITyHg6xi3G3/dZFwtUCUfD69UnWJ6vbZJ7StvIC/p2B3VKHmkBQxVWCqd3/JyOnU+Z7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326941; c=relaxed/simple;
	bh=C1qUYYuRnWzN0Zz7CliMFvIfZZC42AzyLPIVnw9T4s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kURhk0zlcnBszICNsDr44zoDl3GTg1Ajf+Js/OCD7dER9wPac3TiSctz6VuahcDRoD/tMusP22yK/o11oOp3W1FPmbSPj57Vnd59+kS7EGSHb7F74BLrKkUwZxOYJuZk7r85rGgbT+dboNIDcYTnUpHjUtrO/mAjEvcOsvqR3Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnUyPTIG; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9952ea05c5so196339466b.2;
        Mon, 07 Oct 2024 11:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326938; x=1728931738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WL+Bmul59N0MJqBB8bgrzNdSKYlWKVm6sYmTP9eyLfQ=;
        b=DnUyPTIGsc7Z3pxrUU6TiBcmhLsRb4bDmr2+qEMG1qbn7pXsapjbMhHNr9iWl0A1sw
         2hQ1NZPTX2BNRLoZNCZ2wuFV3rWlzLJaIdQPbpdYHzeH2firE3EcIK5k9QfeqhgolIu1
         IZqnh+HQrxILUB1Z8eZEfqblm2V9PBbXh2qTVKIc66Zcmob+00gzbbu0jiTKet+17F9t
         wC2cojgB3tvA1UaYL8W8ctLhc0A9cAV7Ufl0/li6jyUQVNsyDUdopJkYWW4Fk2TJxGVR
         7Ho1IsMLPCulDQUZYPtnuXYMfiK0S3fQGpsNvMx329qxsUq8ykHdte22J4XtVvQFsqCl
         qa9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326938; x=1728931738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WL+Bmul59N0MJqBB8bgrzNdSKYlWKVm6sYmTP9eyLfQ=;
        b=B/ugPeeMwvlvIVtZtXefzsdSvfxeToAGNdD6p0WRpdnJI3yh3yuZmwIMrExjvhoUC2
         1bKnJgRErQkhivbZQ/Vn4YldTsQmAVm5ppr7sdx/QBPYUrmVtygF48R0AogYUb0xR5Jf
         I2yd/7iQpeo2apzozZbaNhq4HZAr4yPih6aNzTUtZ0jmbCwnKVRkssTWQQkPWitL+3SO
         ENNrL76MkYWT3rD6fF8h51qWzzie/35FgDeBowj5CBthxA8GgUnF8UsZlkuzndEZvv3a
         jjQIBxXHA4Mvb6Zl3eQMJKimZ88GiVqgdnXght7a9a/drslksBgFYUmHUQVOgJuXKXY3
         PPAw==
X-Forwarded-Encrypted: i=1; AJvYcCUsstBIhxVfHjXAWXcMfsE/QpOCWRRbv091Gp7km/oswQjv53u9iWi/mZvhiya7TcRAHlfaUF5RBzHmIexgtvxI2Ko=@vger.kernel.org, AJvYcCX4jyT8kW6Mv1SwTzy6mTq3NsvVpEigsF4+n9wTHOQhvdTB/iOMhcm6zYXXM8OSaSamtSdBzXbpsyDLZy8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2a5cuXoFykcF7fPT8G/uicsMypGHD82g/vo9rw7uWNPsMcjxi
	kRzPD1c5WXSBOVWFQqs4oSmSVrCTiaMnCvL1LLPGnYy4ib1FlGU2
X-Google-Smtp-Source: AGHT+IGoGPCc2haTehShacwfXhr0S8R4aW3Lrk5v1QOoP1i5oKHQdY9yIasewRpq4rSrFgRJ12C3tQ==
X-Received: by 2002:a17:906:7303:b0:a99:22e:9658 with SMTP id a640c23a62f3a-a991c031334mr1424195766b.40.1728326938105;
        Mon, 07 Oct 2024 11:48:58 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:48:56 -0700 (PDT)
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
Subject: [PATCH v4 08/17] media: rzg2l-cru: Use MIPI CSI-2 data types for ICnMC_INF definitions
Date: Mon,  7 Oct 2024 19:48:30 +0100
Message-ID: <20241007184839.190519-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241007184839.190519-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


