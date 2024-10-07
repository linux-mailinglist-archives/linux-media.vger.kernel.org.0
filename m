Return-Path: <linux-media+bounces-19186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 807F09936CC
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 20:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 077511F23718
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 18:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9851DFE09;
	Mon,  7 Oct 2024 18:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJszzuNM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E220A1DFD88;
	Mon,  7 Oct 2024 18:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326955; cv=none; b=D4lJSURBf/5Q72xr7kmR8LolXiSfO6EP6LTWww5/0irrsOCKM7nrhOJhlpD+IfDmmphoFKhtv28CBsJL+tz8zPmXEcha8Qqvzrkesbb/5g7WrD7fgBsCSQBFk24QDR3XOgWbgoZn62SW/nQ3KkOxCLKI1p2ZxtNgwsZh0BWcIe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326955; c=relaxed/simple;
	bh=/kg0wXaUNUJsVPf5/WjELzEQzGfs3Fsju7G7m59Nh2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DGo1rdMs7rItIuW2GQoQKbNmz9/ivc5MFzEvs4D4yBpmWvdOkNhbVtx6zldrlQr4vJZy5HZBUdACjeIucQfMKMbhJ7XICV+PHOI3pKlZJY7G0mJUBi3fImTK4zzE7aQz1z6Np8ykTI5DY6sG5ewhmWMNk0uoG2I2RCkvm2eZ6gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJszzuNM; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53988c54ec8so5454561e87.0;
        Mon, 07 Oct 2024 11:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326952; x=1728931752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADogNEgxdb0AIMPfsSKEhNdNIaRQ/kooaT/qsVTDoQc=;
        b=TJszzuNMK/m86J7B1wf1a2TtMidfv3FZnIKkt2v5w/LdredlUgcAS+8hX8CyMbNz26
         PS/0JJpVa6+86AL/pKkJoigULTvgiBEi4GihitkPMBzpdQNp4wgS8K9nI1LYxRVh1VJf
         8sysZje/jZ4RVqjakuFxRVL4i+nMy3NFECNOl9VUqg5BdKWA396Wj6nNdRgGFWlmcYOs
         0vpr4NtAUmTPsxt8C0jwFxlnTiuyyuAr13qUH8HJeCv9veZ5bnhr7R7w0i1kGmqVLO4J
         kbdnnNZ+K3UPig/WdhAK5AnDq1yjNAAU2/2X6D66uyz1bKz2K8gb3Mqb2Ukgvh6OOi5P
         RE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326952; x=1728931752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADogNEgxdb0AIMPfsSKEhNdNIaRQ/kooaT/qsVTDoQc=;
        b=w9JmSDREnwEF2P9oL9E+mLL0zncNeKjxcyOW3r0qHKghlmTaUNguY8IitZzARswafH
         hiorXOPpJSU04gDl9rGPFnviF7c8uu41D27K/oNFneN9wIo0MZimvqSLQgysJ05ORYML
         2mZAEVyhu2u7+QIyjT5+ckIwv2BpW6fxxcc/WAkqg7PcK50+Q0d1MJf6WFsXK7CFUoQR
         n1OUKxiTLPxDGDPQDyRxyy0ksjelCk/bSD6EA5ExI6PpAkkMPELrJgcsXyiW2XLeJFHj
         vqrJf4W/OWxwA624THAm8Yl5giJeuLlQlZMwJsABNEW0k5ktXkuJKf7gbkE2sje3YoZO
         G1VA==
X-Forwarded-Encrypted: i=1; AJvYcCUmGAbEak/o7df0j4fcX6aSwZdmFk38pqeMp9cxRdc7WB2s7h+aHgsHv5qwwQ6OtPr/YIPhvvbOYs22jJI=@vger.kernel.org, AJvYcCVOk/X1goxvs51XVqCnYl7JKEVeOtJOFVYN5PEMDIpScIpu1IbpGIXo6yJ4vefY7wQc53KHkFClLoTaOVqBz0M/Yf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ/2E7ly+sTSbojhZJ03KC3dhi0SykZEUTSDc8oE2/pWoXx+/l
	wnx2HN1+vTjJly1Tsh0ojr7p9tNeocKwOqn9a2+dfk6ljT53BeaHkDCbew==
X-Google-Smtp-Source: AGHT+IH1Dp1botUtth7NGfauweW5F6dMgO0BPcocVe+4PSHjgoP6OW0EQVCQt9H3ND9iLZ8mFBl0ZA==
X-Received: by 2002:a05:6512:b9e:b0:534:3cdc:dbfe with SMTP id 2adb3069b0e04-539ab88d283mr5394476e87.28.1728326951860;
        Mon, 07 Oct 2024 11:49:11 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:f429:642d:d66a:1085])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9953d48594sm180102766b.176.2024.10.07.11.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:49:11 -0700 (PDT)
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
Subject: [PATCH v4 17/17] media: rzg2l-cru: Move register definitions to a separate file
Date: Mon,  7 Oct 2024 19:48:39 +0100
Message-ID: <20241007184839.190519-18-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 51206373b7fe..357086d026eb 100644
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
index 87c194961edf..012ca38bcd1a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -10,6 +10,7 @@
 #include <media/mipi-csi2.h>
 
 #include "rzg2l-cru.h"
+#include "rzg2l-cru-regs.h"
 
 static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
 	{
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index a96590178cb9..691b3f7c148e 100644
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


