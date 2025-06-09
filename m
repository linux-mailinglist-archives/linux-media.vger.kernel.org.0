Return-Path: <linux-media+bounces-34369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8706AD2653
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 21:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FD0A18874F1
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 19:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D4921FF2A;
	Mon,  9 Jun 2025 19:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DyhvTiAm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F772191F89;
	Mon,  9 Jun 2025 19:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495727; cv=none; b=nbucQpXqfG/6TPqI4jQAok2umCFGxL82inBqbUBiDkYGIZDZpznrE8uEqPJ/mTLqc3hf3pDWyp3YhhAF5mMSwJo6CIXIamZu89QA154SVANDTCfVPsI0tT3sdU2y2IuKxIu+GpKWhExlQsO07VPbMZGRG/jIyRJ2OKmrtGfjqTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495727; c=relaxed/simple;
	bh=KZHtGmdBMSdfWI9IcNY1F6osvTSelHgEDN+7hkcS54Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gyNBfyAKmzEwnz0RDJyyU2g46+RjymnyeP1oHPFdXzHa55SxVn962F6rTG4K6kVxorN+XNO0cfNiVFx5aWuUjMEa/jaYJMZHeFXcu4afLPIaUgzwx+jIeZ5KtjI/dIqD/ojiwHypqSgemVFY6zeOQSBRldP691GvAkNdyTTSRQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DyhvTiAm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C60E3833;
	Mon,  9 Jun 2025 21:01:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749495715;
	bh=KZHtGmdBMSdfWI9IcNY1F6osvTSelHgEDN+7hkcS54Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DyhvTiAmX+96uW0/G7z7i4BAg9vhl0tkP2jKdyA610iqf9QO9NFFqL2v/f+Sf5vF5
	 eFs7p9T2WkkyMoMhfhKEjRA75iUfoeDzrcG0xwrOWtprNEndNpFUrJ3VShqGo7L5Ae
	 r0hbvTfUS3A2tU+39QulQkl13HgFBJ4h5wIH4sM8=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 09 Jun 2025 21:01:42 +0200
Subject: [PATCH 1/3] media: rcar-fcp: Add rcar_fcp_soft_reset()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-vspx-reset-v1-1-9f17277ff1e2@ideasonboard.com>
References: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
In-Reply-To: <20250609-vspx-reset-v1-0-9f17277ff1e2@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3700;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=KZHtGmdBMSdfWI9IcNY1F6osvTSelHgEDN+7hkcS54Q=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoRy+nYn7jMzAuPr7Ye21M4SjPT+++A7ym+m6O7
 C3t61SWNhiJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaEcvpwAKCRByNAaPFqFW
 POJNEACUQCQC2i7YtrdvA/SS18z8RynR5HuHWxA/ze++FhrhSI7HfWB4qqSiIbFgLu0Vr+2Jhsg
 NX0R/NhykKEEICZ7cl1Ocr0q0nhIBNZt987SnZQ4RJ+iYHYTgH+CB59pcPzpuHY/TgTtjIxhqLv
 RjEZcv94a1eJj1OfYgdpmQ1Z6Th3oSa8hHkbDdXXNOcLujRYX8Pjpoe19sWZmeBzP1t7fMCJwav
 hSQ27+CzFAuTTZ8Gz8c38X4zuzxUTA2YHQrIWzCwHHt5BYYSC/nEmRAWYe/kjuUSnzENMhOOupi
 Ap5xR0a/MbY6JV0O6oIR0H6o9k67+mBaX7SxRyo5yqkQQqX6a1rPVdj2XnRxYFC3aRGuYaQuYP/
 IhRO3ryqMH1VRJaqFtC53ougxU0K/EmdVg7j1iDak7yVhusfM6nEwaIsGgrM6HcKjc2lmeJv7BL
 nFT0kbnF6w/iUnRsC8cf8CK5Whp6QqLWmXKn4troXP2cMYOcR8O28spzgkPxIaSfMuBNN+ekkZQ
 uZRBeSv/P2SPpF38OzTj0EOPY1VLk0LRPuPnZ2WG/mPmakMN0nZTtH6wI3yKYcmy83gKeaIFjDM
 SatJrDg5MbyjcoPzAFu0Hk2NT0OsWNzsmudXYjaWXh9fgZpaqZzLJSRqYYkMM5r2HVPzGMEshgh
 7doB4Wcaf9RweBw==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add a function to perform soft reset of the FCP.

It is intended to support the correct stop procedure of the VSPX-FCPVX
and VSPD-FCPD pairs according to section "62.3.7.3 Reset Operation" of
the R-Car Hardware Manual at revision 1.20.

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
2.49.0


