Return-Path: <linux-media+bounces-19883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CDA9A4010
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CC79283FFA
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 13:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7564C206941;
	Fri, 18 Oct 2024 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LoAsJB/3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AB3205AA5;
	Fri, 18 Oct 2024 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258526; cv=none; b=L0E6DVYFvRx7izPJWcAja8a/lVs7ZMWl5R/Qr7GFZsZGKPmiR7T1VJb8kLum91/a0+iczdlDVQusjL0/XKs0oPxn/UcL3BnGtgOrDMkHaOpISRfXgl7HDhPo3ZypTn3TFAt5NnhctuKds0KzK1o32EgluVW7Oagdoegdnvo27PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258526; c=relaxed/simple;
	bh=4Z4zcz6qi1DRZkhl3ogXePn4yxxghDB3ja6oNYNj7pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ICtFAHpIxdDn2KGdMDc43vrRt64mThwHXlJvBUXx0STe5PMcAHHJb0kWbT7D0O5mSjFiYlyqxj1wgvHjWZufduKCmf2GiVbhlNl5mjZYpKyN72dy3ra71hP/5YDulQGFtc6YByAPlmkphzr119rcLrBHgwhSFo1aaz/is5xe9x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LoAsJB/3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43118c9a955so20182935e9.3;
        Fri, 18 Oct 2024 06:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729258523; x=1729863323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvRKqiDQxMChmwwfQQzV2pZodEp0URXdasfkV2jAffQ=;
        b=LoAsJB/3N4b6s3sbLYgZ32RTs837O0RsUkW5idECh24HwFKXyQgHSODCnzbpdPx3Xw
         PGlSuu1negqb9kPGFzsla9lua0pRwacU/mkoCMsk18bMf078vaipLeFHaWtAhMYBMP1t
         0sdgT3KqBsapzE7Btk0uaIZ4Lyd8DVgpEc/mKoR0GkvPh+/6a9IPmdY9t7V8FXeHVKi2
         L0wqDnlH0KG65gDkyvtgeQLrgGBbOqRxf/sZvTtWfmgh1oRhlYd7ZBQXMVLsAqfqCj29
         QHSUZs4E6GgzoBtNwSQRWItZLskvanbUDktnxz18Jxhf9sSgeFVZ9GjojjCEDeP+LQgC
         6b3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258523; x=1729863323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvRKqiDQxMChmwwfQQzV2pZodEp0URXdasfkV2jAffQ=;
        b=pVU8WSR+C5mXX2CbSNXxU7jXqARSmnpapd1BqJK3FV2ngLfU4W16Ac6XZ8VUxNjq4A
         RfZQjEiHslLTRjMQzcr8SS9FlxRDHDX111OeYEBcEVi8zMeL/iC2034J793qcqAxxI9t
         lhyRIYy/4FJIHeQcx+aEMF9dC0LSqnrl3QvqCSY2Jnc+ytU7Q2tKJv0+agd+o1jqZH/C
         0SZ+mld/5Bf4OjpebkyebqAqReE3aFYK6xQfzCGbqOk4GD27L8A59Xb0E1MHV6d6+uTP
         6uaupTPCnl5iWdY4elY91NSLoQVF3iyfZSQzKBLtm4Ls3R9Vc9yy5bqYnVHiLL4YwnWv
         WmAw==
X-Forwarded-Encrypted: i=1; AJvYcCVFtt0YVJi0Uq649qJvezFgy3kLWIbgOBielyqohLZo3+HD1k0YqkCZYK2resuFEy1Vw9TeRXhFFO3S2uw=@vger.kernel.org, AJvYcCWaWVL/DS+6WiM4gML0ZPdWHNv+An95d1ZTTf7QvP3Iag4gTW4yVwhnUrPbMkd03J8t+y4q+xHNpZdYzpgI2ON0lhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpmGEfNxW41ohRfoIenX9c6DGzCCGOQhIkiWiTPIPT/m/rTgdz
	GqRsUhOZNIt6Q5nCRL4Gib2pN5pkSCo4+SzI5Dpb0AMq3gNEVBIeS7IPjg==
X-Google-Smtp-Source: AGHT+IFm/sQpEJx8xrU7sZUzaW0cpIpGkhzvT5j0SpN4+A2vDu2nJ8j3l3AlHcdYTN3Qy67scIWS2A==
X-Received: by 2002:adf:fe0c:0:b0:37d:4517:acdb with SMTP id ffacd0b85a97d-37ea218248fmr1772402f8f.20.1729258522751;
        Fri, 18 Oct 2024 06:35:22 -0700 (PDT)
Received: from localhost.localdomain ([2a06:5906:61b:2d00:d416:f456:3869:adaf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e0a7acsm24320475e9.22.2024.10.18.06.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:35:22 -0700 (PDT)
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
Subject: [PATCH v6 22/23] media: rzg2l-cru: Move register definitions to a separate file
Date: Fri, 18 Oct 2024 14:34:45 +0100
Message-ID: <20241018133446.223516-23-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Move the RZ/G2L CRU register definitions from `rzg2l-video.c` to a
dedicated header file, `rzg2l-cru-regs.h`. Separating these definitions
into their own file improves the readability of the code.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 80 +++++++++++++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  2 -
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  1 +
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 69 +---------------
 4 files changed, 82 insertions(+), 70 deletions(-)
 create mode 100644 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
new file mode 100644
index 000000000000..1c9f22118a5d
--- /dev/null
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * rzg2l-cru-regs.h--RZ/G2L (and alike SoCs) CRU Registers Definitions
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#ifndef __RZG2L_CRU_REGS_H__
+#define __RZG2L_CRU_REGS_H__
+
+/* HW CRU Registers Definition */
+
+/* CRU Control Register */
+#define CRUnCTRL			0x0
+#define CRUnCTRL_VINSEL(x)		((x) << 0)
+
+/* CRU Interrupt Enable Register */
+#define CRUnIE				0x4
+#define CRUnIE_EFE			BIT(17)
+
+/* CRU Interrupt Status Register */
+#define CRUnINTS			0x8
+#define CRUnINTS_SFS			BIT(16)
+
+/* CRU Reset Register */
+#define CRUnRST				0xc
+#define CRUnRST_VRESETN			BIT(0)
+
+/* Memory Bank Base Address (Lower) Register for CRU Image Data */
+#define AMnMBxADDRL(x)			(0x100 + ((x) * 8))
+
+/* Memory Bank Base Address (Higher) Register for CRU Image Data */
+#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
+
+/* Memory Bank Enable Register for CRU Image Data */
+#define AMnMBVALID			0x148
+#define AMnMBVALID_MBVALID(x)		GENMASK(x, 0)
+
+/* Memory Bank Status Register for CRU Image Data */
+#define AMnMBS				0x14c
+#define AMnMBS_MBSTS			0x7
+
+/* AXI Master Transfer Setting Register for CRU Image Data */
+#define AMnAXIATTR			0x158
+#define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
+#define AMnAXIATTR_AXILEN		(0xf)
+
+/* AXI Master FIFO Pointer Register for CRU Image Data */
+#define AMnFIFOPNTR			0x168
+#define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
+#define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
+
+/* AXI Master Transfer Stop Register for CRU Image Data */
+#define AMnAXISTP			0x174
+#define AMnAXISTP_AXI_STOP		BIT(0)
+
+/* AXI Master Transfer Stop Status Register for CRU Image Data */
+#define AMnAXISTPACK			0x178
+#define AMnAXISTPACK_AXI_STOP_ACK	BIT(0)
+
+/* CRU Image Processing Enable Register */
+#define ICnEN				0x200
+#define ICnEN_ICEN			BIT(0)
+
+/* CRU Image Processing Main Control Register */
+#define ICnMC				0x208
+#define ICnMC_CSCTHR			BIT(5)
+#define ICnMC_INF(x)			((x) << 16)
+#define ICnMC_VCSEL(x)			((x) << 22)
+#define ICnMC_INF_MASK			GENMASK(21, 16)
+
+/* CRU Module Status Register */
+#define ICnMS				0x254
+#define ICnMS_IA			BIT(2)
+
+/* CRU Data Output Mode Register */
+#define ICnDMR				0x26c
+#define ICnDMR_YCMODE_UYVY		(1 << 4)
+
+#endif /* __RZG2L_CRU_REGS_H__ */
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index c40754732576..a83e78d9b0be 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -31,8 +31,6 @@
 #define RZG2L_CRU_MIN_INPUT_HEIGHT	240
 #define RZG2L_CRU_MAX_INPUT_HEIGHT	4095
 
-#define ICnDMR_YCMODE_UYVY		(1 << 4)
-
 enum rzg2l_csi2_pads {
 	RZG2L_CRU_IP_SINK = 0,
 	RZG2L_CRU_IP_SOURCE,
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 982c996cc777..d935d981f9d3 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -9,6 +9,7 @@
 #include <media/mipi-csi2.h>
 
 #include "rzg2l-cru.h"
+#include "rzg2l-cru-regs.h"
 
 static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 	{
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index a686a5cd4f59..a4dc3689599c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -20,74 +20,7 @@
 #include <media/videobuf2-dma-contig.h>
 
 #include "rzg2l-cru.h"
-
-/* HW CRU Registers Definition */
-
-/* CRU Control Register */
-#define CRUnCTRL			0x0
-#define CRUnCTRL_VINSEL(x)		((x) << 0)
-
-/* CRU Interrupt Enable Register */
-#define CRUnIE				0x4
-#define CRUnIE_EFE			BIT(17)
-
-/* CRU Interrupt Status Register */
-#define CRUnINTS			0x8
-#define CRUnINTS_SFS			BIT(16)
-
-/* CRU Reset Register */
-#define CRUnRST				0xc
-#define CRUnRST_VRESETN			BIT(0)
-
-/* Memory Bank Base Address (Lower) Register for CRU Image Data */
-#define AMnMBxADDRL(x)			(0x100 + ((x) * 8))
-
-/* Memory Bank Base Address (Higher) Register for CRU Image Data */
-#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
-
-/* Memory Bank Enable Register for CRU Image Data */
-#define AMnMBVALID			0x148
-#define AMnMBVALID_MBVALID(x)		GENMASK(x, 0)
-
-/* Memory Bank Status Register for CRU Image Data */
-#define AMnMBS				0x14c
-#define AMnMBS_MBSTS			0x7
-
-/* AXI Master Transfer Setting Register for CRU Image Data */
-#define AMnAXIATTR			0x158
-#define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
-#define AMnAXIATTR_AXILEN		(0xf)
-
-/* AXI Master FIFO Pointer Register for CRU Image Data */
-#define AMnFIFOPNTR			0x168
-#define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
-#define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
-
-/* AXI Master Transfer Stop Register for CRU Image Data */
-#define AMnAXISTP			0x174
-#define AMnAXISTP_AXI_STOP		BIT(0)
-
-/* AXI Master Transfer Stop Status Register for CRU Image Data */
-#define AMnAXISTPACK			0x178
-#define AMnAXISTPACK_AXI_STOP_ACK	BIT(0)
-
-/* CRU Image Processing Enable Register */
-#define ICnEN				0x200
-#define ICnEN_ICEN			BIT(0)
-
-/* CRU Image Processing Main Control Register */
-#define ICnMC				0x208
-#define ICnMC_CSCTHR			BIT(5)
-#define ICnMC_INF(x)			((x) << 16)
-#define ICnMC_VCSEL(x)			((x) << 22)
-#define ICnMC_INF_MASK			GENMASK(21, 16)
-
-/* CRU Module Status Register */
-#define ICnMS				0x254
-#define ICnMS_IA			BIT(2)
-
-/* CRU Data Output Mode Register */
-#define ICnDMR				0x26c
+#include "rzg2l-cru-regs.h"
 
 #define RZG2L_TIMEOUT_MS		100
 #define RZG2L_RETRIES			10
-- 
2.43.0


