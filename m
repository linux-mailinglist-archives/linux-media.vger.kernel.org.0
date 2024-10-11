Return-Path: <linux-media+bounces-19456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D63B99AA2A
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DBA51F2776B
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D0A1D096B;
	Fri, 11 Oct 2024 17:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/eZNimj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E23C1D0784;
	Fri, 11 Oct 2024 17:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667871; cv=none; b=UcEGSDPSIbajmu3BiFw7p88q1GoJ+Xj3xR3kvV4i6d7filRMjt3heALqTIZz205hW9vHPSMDFVZ2JDQxCg7mV/UKmgMgQKyD3JReJXXYrBZXJ002QwidlLC0OiIIBFrK9APv+dgr/m9+NDg8/8JtjbThogkDAGPnh5yWcIRXWow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667871; c=relaxed/simple;
	bh=C1qUYYuRnWzN0Zz7CliMFvIfZZC42AzyLPIVnw9T4s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=utAZv64B8Ra+vsodh51AQ2Kq7DS725/1NqokHMF7OkXUcFmtPvj6ZmqSbBtfvvRQ09VQ27P55k3A75fJP3FW09XTb+qSd3I87GDeisWz340jR2vd9xbdAKKOf+6BFrzvpOnVduh3eSy7BiO51lCBa5YbJIUWpDLe5X73o3ZIWlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/eZNimj; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d47b38336so1297956f8f.3;
        Fri, 11 Oct 2024 10:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667868; x=1729272668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WL+Bmul59N0MJqBB8bgrzNdSKYlWKVm6sYmTP9eyLfQ=;
        b=a/eZNimjGIHSEDraZFSojXe47UlndxgFq/12pCdK3cEI8n1EdV6T6AKyALmmS0dg90
         bjt0GnrsXTvVyE4U2fjn6Dc63D+WhQ+3slGyl6POBrwts8gw16WZUkogkBlkqCzSmIvY
         yL9/WZtSMGjjIrc2lOrfT3+//zxx+XUmn+S5KpvirAKVAeubC3fYvnLFyekJ0fQgh8u/
         p5M0cfzc/oreuPgKaysUAZo9Aaj46dyEzpDhFI5E6/2uT+TOGz3QNdUY4xWqIlWm70rK
         0x2BjtQf1aV1ptHBv9CsGDQUUvbhqDylWaqXL/icOHDRVuefqYrRKuX4ErZXuX7DhZvY
         t7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667868; x=1729272668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WL+Bmul59N0MJqBB8bgrzNdSKYlWKVm6sYmTP9eyLfQ=;
        b=clBhvlBz3pP4lwMU4jWo6dr24sYUakOjGx4WF6XnteAd4G4ss5ZpepWKC0lSQSrVw/
         yTCg1sJE2qD+vQeSR0wZhBAerYyX+XAQGDXAlaeBzhzMoAXHg+u3qKEEchKIeKKkNr7g
         v8BcNAGB3et+eLkG+I1gd3b4NUNJDX4fCf3NjhzMjJ2gDK0Kr27XQkA4R2he4j4lyToc
         gjFnbRsTKSsnsW2v9Q0iD+Djo1G5GINRlyVXAPhYSzi5DJQRbjNtyTed31FYEJTKBi+G
         nBk/aWuzMS6XSOu1f0i63wea0dOh6/FKISg7iHoNXPkg6rgQfszUbSD569zp7yIv/1sA
         bCkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFaZIKkGgQZABpMlwF5qoJZfGnbbfULZLLkrh9sVBzgzlOXGvwODvgc/H1W/OTNU+4PsEvFPXHtLzt5wM=@vger.kernel.org, AJvYcCXP9fnj47eNqRf4RafzduK4foV0pMg2XuzfIr6y8xSaMRzsypVjJZWH3DjZ2NDpNsWGvaW8B5EG5gDn7tPSACQ59ZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys+N0ymlSRf//NHfB1A6bKw0zU4Fc0o5xSSL1g2CFiFnByhkQu
	6mdbvBx23h0xcjDAbGVwN3lvVIVhJwnyNVrwZlqHDKE1unpY9zof
X-Google-Smtp-Source: AGHT+IFztpNTjDwWyqlddWZsTSa+MgMCE+EdK4jeW57kb8jDEWOo2Q/3AbOS/9Rbz/eUNsI97rTmsw==
X-Received: by 2002:a5d:4e0c:0:b0:37d:4ebe:164f with SMTP id ffacd0b85a97d-37d552fe3f2mr2209975f8f.46.1728667867628;
        Fri, 11 Oct 2024 10:31:07 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:06 -0700 (PDT)
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
Subject: [PATCH v5 08/22] media: rzg2l-cru: Use MIPI CSI-2 data types for ICnMC_INF definitions
Date: Fri, 11 Oct 2024 18:30:38 +0100
Message-ID: <20241011173052.1088341-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


