Return-Path: <linux-media+bounces-18946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B02398BF5C
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 16:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA232281354
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 14:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EAB1CC154;
	Tue,  1 Oct 2024 14:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lijWMfAI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E481CBE8A;
	Tue,  1 Oct 2024 14:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791800; cv=none; b=HlIEB3cZnn+QfCA9v8iH71AVAkWMSoOh07pzpyN0e8XBIye0d/gXi5/2Sj7C6VKBnVxY8ZiwwJnjZJBBkpAZPMQPhGJCDA32okhck3kIDOlJSdFHaKHci8cN05sAhurSrz/hutr/miiLm4+X0kjpzERcAYCCq42egD+l4aZEi+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791800; c=relaxed/simple;
	bh=VY91vW/qC6MJTXVGzHNIgCf1mq1jUFKjewgTdlz4O8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kfeDvUw/4MLPU/nM3+XgouwhJE0W8djDOY2olvz4LNmp9vgnpe3qJLtZnYKDU1dQIHr9RJPJUZK8eib1Ka8RVrhpom/7WJRzF7a0N87hwhvwzjWsShWYAb8OPk9SilEUmSegXBhTbl1QiE7tS2w7TUuE9Dughi6OFyqTZJbWgbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lijWMfAI; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a93b2070e0cso674327966b.3;
        Tue, 01 Oct 2024 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727791797; x=1728396597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEOzuVCWMUdGlzBesvO8nBRO0Iupuq39zvRd6ja3B6U=;
        b=lijWMfAI49IaTFg4HKr0uwOFrtS2CNv+fySQ5+LV9a5CfNmO3rbSoLmJ+vn5W1rCjR
         7Mhr6Tqih5T0pYBbS+mkoOMS2R1NoN/3Pwo0Iwp2yc9YjPWmQr84ONYerHWjLfyy+JKo
         TqflngFFTQWq2xbJhiSTRDmMbWVZvUAPJypSg30L8UY1LpLjbiYaB/zVBPwgb9VKs3d5
         +qUc1tiD6Ly13tHt79ymlSAyoK0+PFF2FYfAjmtXDJlM+hodgwHDflr6Qnxv+elMHs99
         Frt9tb9MmnUUowcOBfxyULdeFk2C/CXuvflmZ828mY3ddTMLo/4cHtdTzGBbFovfxQR0
         9OAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791797; x=1728396597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEOzuVCWMUdGlzBesvO8nBRO0Iupuq39zvRd6ja3B6U=;
        b=Hwi2F7Xii9Qz7iJyzIqbVYaCh/1+6EFqg449d8xDYHEKSgS0lSpAPKBUiFfkRGmdBl
         s7NirpvaWR34R1he8TMkQOsbkbobX2YqbAn+/ShAVuWWfSekjzXwoZ5yCT9WxUFTUMi9
         bObdf0we8W/mGSCbL8slNPjG5oosTNxAULgtfvt4UI6ijCpeGJ6rNXXx/vkfqACJ2IQr
         /FTQwoprSju1UIwxKNje+ScUmXivvWCQlGvsyfRgZC+we5gxCtrLwp07UfeasTKRecpI
         aDAfaGKUIfiXXY79/qrmQ/1OJFGRy97U0pF+8KYcS5+l9HYUbNH88hHQwIo1vNlDF/KO
         JVjw==
X-Forwarded-Encrypted: i=1; AJvYcCUQeLl2J56Ywo0N8s+MPb4vU9YZz5VCoqBBRLwXLrIQC/I2kmRd0P2y2XLTIgj7Jx6VtPdfHxYH71SWCoY=@vger.kernel.org, AJvYcCWHW6D0AOweOpoC+rQWC3NBOnGWCeRkJvlXLWNqrNtjkrsopHIuTRJ/BujMbrJiWD1m/mWRcB3xDt3q0sGMQRjede8=@vger.kernel.org
X-Gm-Message-State: AOJu0YweoggMgwz5vmy5lrE0aMMr3dU4aYv/yrRWFiAGKD+co3k5n003
	GqpNfgzAvHiyILJW8qu0rGd5b6ise18SLc8rLEGMPlMou000WW3F
X-Google-Smtp-Source: AGHT+IGD5XwMQGufA+hBlEEu8kdEe7bkLLmIhLCjRvsQ4yUNdPPf9Cz3ZFuNrk2j+NlI1cLmGhTnuQ==
X-Received: by 2002:a17:907:9812:b0:a91:1634:9e92 with SMTP id a640c23a62f3a-a93c4919832mr1616220666b.21.1727791796741;
        Tue, 01 Oct 2024 07:09:56 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2776de0sm723532966b.2.2024.10.01.07.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:09:55 -0700 (PDT)
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
Subject: [PATCH v3 17/17] media: rzg2l-cru: Move register definitions to a separate file
Date: Tue,  1 Oct 2024 15:09:19 +0100
Message-ID: <20241001140919.206139-18-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Move the RZ/G2L CRU register definitions from `rzg2l-video.c` to a
dedicated header file, `rzg2l-cru-regs.h`. Separating these definitions
into their own file improves the readability of the code.

Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- New patch
---
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 79 +++++++++++++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 69 +---------------
 2 files changed, 80 insertions(+), 68 deletions(-)
 create mode 100644 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
new file mode 100644
index 000000000000..458f7452e5d3
--- /dev/null
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
@@ -0,0 +1,79 @@
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
+
+#endif /* __RZG2L_CRU_REGS_H__ */
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index c3d10b001b7c..d7c82c7b9044 100644
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


