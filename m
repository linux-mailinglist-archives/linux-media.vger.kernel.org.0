Return-Path: <linux-media+bounces-19470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D1B99AA5C
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 19:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88CF91C236DD
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2024 17:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58211E764E;
	Fri, 11 Oct 2024 17:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbSi5BFL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AB11E5022;
	Fri, 11 Oct 2024 17:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728667889; cv=none; b=n1uUVszHWAVG77e7mg+pWw8hQPaT5tcpKJpXkt/+A7fSq4AqvZKbBr+UGPghyxvOnixnngxdXUrjSMqLi5sq9c9luLRrMTuP6Clw4ohWnGT0kZ5wpftqwykaZ0ruG1j10hzeY/aDmpKW2DANOB3zbOrl5KYHbwyExOzu4EWlzdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728667889; c=relaxed/simple;
	bh=4Z4zcz6qi1DRZkhl3ogXePn4yxxghDB3ja6oNYNj7pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6YGj5IRAtpejVJp3R0FpBmIdf4KL7ykCQlJXxSseb5tQhD9/Z50vnHBjlz4olNqz5+hEuNiYo9uqZu9vw2Hxv21Tvu/86BO8zfKUVtBwlJue8vsIpo8DyQXvBiLsRJzN1q7sgJ7zWNRtRmYg5LidqFCy6AIAh3JrJDng/6XyiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbSi5BFL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4311fd48032so5676735e9.0;
        Fri, 11 Oct 2024 10:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728667884; x=1729272684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvRKqiDQxMChmwwfQQzV2pZodEp0URXdasfkV2jAffQ=;
        b=JbSi5BFLb3fJELr31BY9/FH9ZlF+BK3Cvdxm4jHi4G8GweIPSuVfWBvQNvs2MwaYuo
         UYlKdjinO0uafevxsu6lt1e9C8NmpdKqB0wEXu0fTFe5hMd3ei2Bfz4IeDd1rMItL/Z5
         oPrsWQjYQJq69Rg8Ay05HKRXVIGkLcMS97ch160eaUvaNqHYlm33UH0xn13s7VgcPG6I
         HQBn7h9HJmcWVfatt6ZopRGFbhT91sMuRMH+lf96JvNZHTOxuU6UPyMl4QYLMu60sIwt
         jxNRMTw+Hp0Hck4+EXS81BQuv5ja2ApMXcR6ELS1vf1DNf83McDrE8xisakW/7ralwIq
         qvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728667884; x=1729272684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvRKqiDQxMChmwwfQQzV2pZodEp0URXdasfkV2jAffQ=;
        b=hB9AhZBpqEU3s+9mogopcY3nvEcNqVdujnKFjvh/nHlGZc/0d/N1TE5YZPZ5A6KgLC
         3k5s+l6y9PNod2hWoJKy1K3+y1LJY3k8KAMeueBdEq5cBWKp1bk9xX6/OEbPr/VKbghB
         Ob5e31VRjDK5dwGr9x029KL4gZqN9OqV0s6+kOyWBSlUou2/zHlgIrIgXRCwx4IVQHpr
         4LfpEjHlwnV3HOpu8z7vMTyrhfvWngGTMQYta/6WkxMmJEI/s/SWrBNdXhmkE5V4GgyM
         rXkSOFST4/1zg9xNR/oRIUhokvH+jcYiTVM74+9jNf43Ac3snFKBzD8DJqUsxEAda1lC
         O1ug==
X-Forwarded-Encrypted: i=1; AJvYcCVnCPLFvpeEG8bd5JwsFciPPK/FJL044xdWX3+wfA372EWhCOZm7jdIMQrLyRXgtDyTKvLkn3LO654Jh0ochDL/NV8=@vger.kernel.org, AJvYcCX64Nt8mwXu+Gf3SB3kskJiuslBSJLtfXX67azfuqhH1wYYh4cJoDetmRg2G907LmRMZx4CF1U9fNGC+G4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9oMkF3EqbiDJzmkxQ0lFzjwmNLFVZk/HnDwNGo9tH1haNBkpD
	40zPNMm4j2g0CmoNhiGp2XTqZ+jAGxlP1K56JKD/HcqYTz62cGv/
X-Google-Smtp-Source: AGHT+IGv2zXgVW4ojNjjD2WUBJJsLA91ulJPLgeim0WVTbZ/7G/GhMhudylAQhsqN/5E2Nd7h9TAdA==
X-Received: by 2002:a05:600c:45d1:b0:426:60b8:d8ba with SMTP id 5b1f17b1804b1-4311df47678mr25904805e9.28.1728667884504;
        Fri, 11 Oct 2024 10:31:24 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm4396516f8f.83.2024.10.11.10.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 10:31:23 -0700 (PDT)
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
Subject: [PATCH v5 22/22] media: rzg2l-cru: Move register definitions to a separate file
Date: Fri, 11 Oct 2024 18:30:52 +0100
Message-ID: <20241011173052.1088341-23-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


