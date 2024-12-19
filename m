Return-Path: <linux-media+bounces-23828-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D96C9F8362
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 19:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 066E1188A98A
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 18:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CB51A4E98;
	Thu, 19 Dec 2024 18:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Yj1rVWTE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434C619CD19;
	Thu, 19 Dec 2024 18:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734633544; cv=none; b=Mv/SROAuABfV9M+7wQ/hCeXWy5/MW8lndV/aqHGLXnyGqCruWbJG2y2ByvTA4LiCz7zNo9nfeceEbJAAUjKu7OvJFSsKdlOXQYc6CCnx9fZgxoPzPIwXoZxwhl7HG9Pmg2Xe0z7w7lDr4G4nCG/StE1rxF2BfVLVBuybHJ3nTQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734633544; c=relaxed/simple;
	bh=0eOJ9xP+vWFagtAHpZNh3Z76ejtLjXXDPg0SxHQq6Xw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IgvhYYToGSMCM1BEUj6zjSDmxAVcVkaJb3BD0X5BhJ93fTgRfCfHrcu0rogrlQx7VhV70fOXT1h69ecZaNeBLxn8I+Q3eZyq4esgl8E8zMaxdj8e/uN83VCgqKXUL53N9IbYlPjuWhY0my09U4jMPThqFVkQSEw/orw1rn2YGEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Yj1rVWTE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 554A16D6;
	Thu, 19 Dec 2024 19:38:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734633501;
	bh=0eOJ9xP+vWFagtAHpZNh3Z76ejtLjXXDPg0SxHQq6Xw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yj1rVWTEYPLaULBwwkTi2z+qdONBUL2neI9O93QrjrriYN/GGbVW7Cqks4Ul3xfBy
	 woxlY5IoTri73kX2NdxGPZvlfyzvEVRhb0sH+CYUV+IAqWyExa2wPKSd8rI+drisv0
	 qdREtnQjWoBmHgk1d8rZrcnG4R7nn3+3XgE4dqrw=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Thu, 19 Dec 2024 19:38:29 +0100
Subject: [PATCH 1/2] media: rcar-fcp: Add rcar_fcp_soft_reset()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-v4h-fcp-soft-reset-v1-1-026e72dca514@ideasonboard.com>
References: <20241219-v4h-fcp-soft-reset-v1-0-026e72dca514@ideasonboard.com>
In-Reply-To: <20241219-v4h-fcp-soft-reset-v1-0-026e72dca514@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=3800;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=0eOJ9xP+vWFagtAHpZNh3Z76ejtLjXXDPg0SxHQq6Xw=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnZGhCNHS1omsVUY+ftcvDcyCT8qwnfpw/3Nbmu
 K/GoQUSCSuJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2RoQgAKCRByNAaPFqFW
 PPy/D/9bYOR3Ar6yH2oWps0irD8wQCuP3WlmwdNGAG5QOGrPCBl1DoNsZ3J2lQ93lyW8WOMqgle
 eUGo580F57HCeX2rwASBzrULBb6NZxwgJrf3qURPn2bqh1+pqsZvkWFAkWyNWb/mbYOt1Jr4zx/
 z42fG0igqlmazGc3iYANjDo1rI8MKSIkYNe57AoAlGvqq0U9jrf6ZGX3URx5g634ChBjqwrZVUC
 qdvEqtKA7mFLWmgRf3hu7whHALeIzp95nEZvazxmj6BTegytFNFrdvxOzEIRejak7cvyBnqoGNq
 Wk28mnzM+25mx/wDLqK0f4TIsw0tG6vfJyRsIFopdLmrIOcgl8cvrRBPfW1cN7D2KewyWESbzLx
 fONRzSLK4ytDbEaDVWaerrWcSXj9cxKt4ROhM0FpeAQDbega4kZqxCbQLchZKOnNNujHZxJi/5s
 qeGy0qpyVHokNR5jsv96AqiFsG153ufnORr7FTGW3pw3ZeBfQy/mDvXwcR22bZ+/Nn57kbrVrFv
 tEHHIxB7ybo57JkBtthKUwovaIBAGL+OwSXxwbg7L+ZSpvHndsnH2Qbol21wWQfAp8VyjS/f1w/
 nw1CHtu3LrPEzCXASdTixzlSbMKogl7ZHFPwD+jDA30fjEB4SdulakOTmZRyTBxl/2wzZbsNePL
 cyWi3jnImM6B8ww==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add a function to perform soft reset of the FCP. The function
needs to be called to correctly turn off the FCP operations before
disabling the module.

This function is intended to support the correct stop procedure of the
VSPX-FCPVX pair according to section "62.3.7.3 Reset Operation" of
the R-Car V4H User Manual at revision r120.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-fcp.c | 41 +++++++++++++++++++++++++++++++
 include/media/rcar-fcp.h                  |  5 ++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-fcp.c b/drivers/media/platform/renesas/rcar-fcp.c
index cee9bbce4e3affb2467dbc28142e1ab2304bf5b0..fefeaf77f0122a2d88ac03a5c42a892dc284a163 100644
--- a/drivers/media/platform/renesas/rcar-fcp.c
+++ b/drivers/media/platform/renesas/rcar-fcp.c
@@ -10,6 +10,8 @@
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/list.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
@@ -19,14 +21,30 @@
 
 #include <media/rcar-fcp.h>
 
+#define RCAR_FCP_REG_RST		0x0010
+#define RCAR_FCP_REG_RST_SOFTRST	BIT(0)
+#define RCAR_FCP_REG_STA		0x0018
+#define RCAR_FCP_REG_STA_ACT		BIT(0)
+
 struct rcar_fcp_device {
 	struct list_head list;
 	struct device *dev;
+	void __iomem *base;
 };
 
 static LIST_HEAD(fcp_devices);
 static DEFINE_MUTEX(fcp_lock);
 
+static inline u32 rcar_fcp_read(struct rcar_fcp_device *fcp, u32 reg)
+{
+	return ioread32(fcp->base + reg);
+}
+
+static inline void rcar_fcp_write(struct rcar_fcp_device *fcp, u32 reg, u32 val)
+{
+	iowrite32(val, fcp->base + reg);
+}
+
 /* -----------------------------------------------------------------------------
  * Public API
  */
@@ -117,6 +135,25 @@ void rcar_fcp_disable(struct rcar_fcp_device *fcp)
 }
 EXPORT_SYMBOL_GPL(rcar_fcp_disable);
 
+int rcar_fcp_soft_reset(struct rcar_fcp_device *fcp)
+{
+	u32 value;
+	int ret;
+
+	if (!fcp)
+		return 0;
+
+	rcar_fcp_write(fcp, RCAR_FCP_REG_RST, RCAR_FCP_REG_RST_SOFTRST);
+	ret = readl_poll_timeout(fcp->base + RCAR_FCP_REG_STA,
+				 value, !(value & RCAR_FCP_REG_STA_ACT),
+				 0, 100);
+	if (ret)
+		dev_err(fcp->dev, "Failed to soft-reset: %d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(rcar_fcp_soft_reset);
+
 /* -----------------------------------------------------------------------------
  * Platform Driver
  */
@@ -131,6 +168,10 @@ static int rcar_fcp_probe(struct platform_device *pdev)
 
 	fcp->dev = &pdev->dev;
 
+	fcp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(fcp->base))
+		return PTR_ERR(fcp->base);
+
 	dma_set_max_seg_size(fcp->dev, UINT_MAX);
 
 	pm_runtime_enable(&pdev->dev);
diff --git a/include/media/rcar-fcp.h b/include/media/rcar-fcp.h
index 179240fb163bd2e7cc347e559f99bae943bf0e34..6ac9be9f675e667d6482a5a2483963fa52a0c622 100644
--- a/include/media/rcar-fcp.h
+++ b/include/media/rcar-fcp.h
@@ -18,6 +18,7 @@ void rcar_fcp_put(struct rcar_fcp_device *fcp);
 struct device *rcar_fcp_get_device(struct rcar_fcp_device *fcp);
 int rcar_fcp_enable(struct rcar_fcp_device *fcp);
 void rcar_fcp_disable(struct rcar_fcp_device *fcp);
+int rcar_fcp_soft_reset(struct rcar_fcp_device *fcp);
 #else
 static inline struct rcar_fcp_device *rcar_fcp_get(const struct device_node *np)
 {
@@ -33,6 +34,10 @@ static inline int rcar_fcp_enable(struct rcar_fcp_device *fcp)
 	return 0;
 }
 static inline void rcar_fcp_disable(struct rcar_fcp_device *fcp) { }
+static inline int rcar_fcp_soft_reset(struct rcar_fcp_device *fcp)
+{
+	return 0;
+}
 #endif
 
 #endif /* __MEDIA_RCAR_FCP_H__ */

-- 
2.47.1


