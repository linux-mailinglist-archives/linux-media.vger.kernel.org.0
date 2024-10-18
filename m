Return-Path: <linux-media+bounces-19872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 265369A3FED
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46FAB1C20D1D
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE00E20371F;
	Fri, 18 Oct 2024 13:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTV/89bV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B433202F65;
	Fri, 18 Oct 2024 13:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258512; cv=none; b=p2goUiFVpcbhHMDmcrQIYJbEwCZdV9tVrPQbRcAZvzX2oLLTtNiaGGMygC3vQxp9j49v+X7qmUwS72/rkTrGJPui+DuOvzISjwHIR6OKr9sEAgte8QYLvEXdosNUYgpSR9Vv/GikepVnyvKljzhearIeo/2fC0X3E0Z84W9HTkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258512; c=relaxed/simple;
	bh=6WpIL0bspVMBgaKsR4KGjVyON4QJ3HcAnrUnUJMYobE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L6ndvB0cczGWTtbDANTng4tOekll+wMooIXOEA+9KRU2uHZ923h2khoUooWsqb0VxUXF8ndzK0GxknzDbQL639K8N89YZleUuugSAmKpMNnvi2C7y1Fbmw0lOAmzi761yIxj0hi1qujO4nRpviaijLegCpo7QGTa6e5m3rfj3b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTV/89bV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43118c9a955so20179565e9.3;
        Fri, 18 Oct 2024 06:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258508; x=1729863308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/6N4lQ0Uquk2VO7s5YzfVz5ebCQEGPSZSJXM/9H7Ig=;
        b=iTV/89bVR4lSjCdNmQAMkT44+cPqrNMMcd1PKJfEyJbPwCyb7Zt4lasddwxGjZkxYe
         Kv5TQDSc4+lJuSS2IgtrSEt8bPNmLKRmKfSQ/5D18Ld9TmXYI7sEDAhTYXT0doKNdBJZ
         +nLUZrxzmjlKox4uPVPx5AL0Ea6FinpC+6ooLnlIfoiXmEcEFN9WkrM6g10j6sZJw+Vl
         eP0d1JZUpoHagWUjW908dcL07Zjf3QgDvDYJby+I4K9qZaD/kv1eLtHk1MhRB/5Mj90a
         XH6lO7N4B1AjX9j8I3XNgufQPxvqK2d9LbFmbUta0rOAiyA9D1cJ43J/GhW9aiExbN3H
         S2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258508; x=1729863308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/6N4lQ0Uquk2VO7s5YzfVz5ebCQEGPSZSJXM/9H7Ig=;
        b=iEbSJm0L0pNldCWMLfX9d1Vt4iWGe4Kt2y/MXr1w82DZx6cprpPxhwkAQpRUf1e4Fz
         Tu33YEhmZlUOBuTL/4R7AuCtlDr5tv07vMaS2WiVQODTzTBDMOrv9K0voE0Kd3fO0uK3
         wSYNb7VOqizCdYD1VIdUupCuyEWoPqQf6GEHs2OmfhMbBoj1TUds7/jwXelKtXTo0FDd
         etaF6MeTu6UW5Q5Gc15ACf5ngYbBX3rb3YwogqO991iFGEMUcv7VBUAXTkLC1M1s7UNx
         LjcOD8cE1jVsLAShIRQde8jA4HLWlGStmu/SpUvAcEkDVm0/4xdoIPJRtynur1dQprfN
         ibqA==
X-Forwarded-Encrypted: i=1; AJvYcCVORgaIR7IXCt+Q7lwBBX/ejVwAzxSrTusW3VcX4p21y2ic/Hxu+OQny0iEU+d6p0TDQNFTf9kpxklwo7+TDiUz/70=@vger.kernel.org, AJvYcCWeSSs+PM/6dbtRLc1CJLle4BW9SZSX1S6YDhqFXu8HcJawirRAgnXG5XnH/OcqH23GTpQv3Diapgws5vU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/MNsgyNb1wsUyXH1rfPwYovKfm3ZuLCislo1u3rd0YsetZ4Us
	0DWEPn+dwZCn3bhBNvpFmRe9l04tVPJiVdXcSelWR83x1qXx/b6c
X-Google-Smtp-Source: AGHT+IHyebNjnIr+8rDF4nR+d3BKtuJ8twSr9VVau33AX0FqtjLZTQe0+r9jdH863EMwlJ6yTozPrg==
X-Received: by 2002:a05:600c:458d:b0:431:5aea:964 with SMTP id 5b1f17b1804b1-4316166a975mr17064335e9.19.1729258508270;
        Fri, 18 Oct 2024 06:35:08 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:07 -0700 (PDT)
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
Subject: [PATCH v6 11/23] media: rzg2l-cru: Simplify configuring input format for image processing
Date: Fri, 18 Oct 2024 14:34:34 +0100
Message-ID: <20241018133446.223516-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241018133446.223516-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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


