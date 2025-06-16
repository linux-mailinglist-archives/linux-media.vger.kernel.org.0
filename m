Return-Path: <linux-media+bounces-34901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D58ADAFFA
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43AF618837B7
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 12:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986D72E4278;
	Mon, 16 Jun 2025 12:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Av5OAFcS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A8A285C88;
	Mon, 16 Jun 2025 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750076091; cv=none; b=n0FGgo6DXQuvdAPvH5Gb3TCKt2SmR3r6W06F9wOXT/nM+b3iC1jf6IwKtip2T6plcN1wkjf/TGbY7rmEwb8sfgIB5yky9zLWF3FSTKPpF2xuHQm3JOaEPfW6n0VPbH/y3GZdizfHEg8hIpe3LHUG/kTNv63VAY3j3lrSfV0Nc3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750076091; c=relaxed/simple;
	bh=aGQJ3lWOoYHOcdlt3LXWUsJAQj2gtH3Kjj9P2RbeY+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUeih1uSUtU5vVxugTOwoU4uckC1xTryUGf6oHTT9qExCBTAnxZraH77658hDFtI2PROX+EO7t0AyhYrl6vSYngmH4/uAE7Fs9fZbWMAQpCbzBYDONlCaq9+oCQ5xYrn/X1sOYxVWKhcBJJ9XHnS6SuUDsv+jrh/5dcVZL0LdLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Av5OAFcS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-141-184.net.vodafone.it [5.90.141.184])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB9DD752;
	Mon, 16 Jun 2025 14:14:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750076076;
	bh=aGQJ3lWOoYHOcdlt3LXWUsJAQj2gtH3Kjj9P2RbeY+M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Av5OAFcSurUWYByUMgq8XAKVZa9544SqKrI5Go00WZApXvwi8dmEsak+LuZVfFtD4
	 HWMjiynfndrQ80XpTMiT13agiing6JCjzeX98nUfQzyTcLuFpgfre4HoYLT+D3W8yJ
	 jHGahXsyW/2jH8BpiXSu2bxnPrXT6lZHdYq3/qRQ=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Mon, 16 Jun 2025 14:14:24 +0200
Subject: [PATCH v2 1/2] media: rcar-fcp: Add rcar_fcp_soft_reset()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-vspx-reset-v2-1-6cc12ed7e9bb@ideasonboard.com>
References: <20250616-vspx-reset-v2-0-6cc12ed7e9bb@ideasonboard.com>
In-Reply-To: <20250616-vspx-reset-v2-0-6cc12ed7e9bb@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3740;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=aGQJ3lWOoYHOcdlt3LXWUsJAQj2gtH3Kjj9P2RbeY+M=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoUAqrHdW4LB33VMvdZgaCRYEFBA2iJjE3uNTGM
 w1w6vqYbk+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaFAKqwAKCRByNAaPFqFW
 PLygD/48VXMdimLaISdYLzyih0r0KyTIUbjYpsPWQ9yXlZeK3X0j+5oosRTCXe7cmuelBLSwd9W
 XqhMG5EDnovoIIuy7jNI51uV7Spatj9Wg+tYxskJ0xZF2YNowEqvUyu7n+q8/wQLFKkjsVY+Zca
 jfU7grF0tETG8A2LzKFjCRqWN03isjoTnyL+/cVScQXD2L0q/WIXGriQljL5K2rtnBp+Zld0w2d
 TqY9pEMJUlGFKUICKFQCqgqHxpRto41Bm6SraT1mtAo680j3WLOXDZLcED1zEflGFkHktPKPtsK
 9C0o/JTTWfn+oNuVSlCrAsfu79PdAOsjlLSena2xaqDauHdk9HpxUq4rrOnwJe2RtZJlTR2trnF
 etFEqPgdg2ZoAEup0P691crf2ABmcKH0W0tC7BynddXfpztMY5BYYxRyMTNv7Bt3qw3kgjbxEw2
 PIVv/zqc/aZH+Do842fu+SsKGST4GgHv8LX/6oyBpuXbA3yfRYJ5B9kMNfrDfY6m/N9rUN/VQ8W
 +WEQQVrbxLdlRvV8s1A1Vlvgw7zHFaE4tY/tX20uS+LvmCdq2NeDhc+lS+EVLjY1mpI0eTDoWr1
 TTrWYUjRJzNGQGByUZ7mPpZrq1XHo+GMQLjAASjdlyzOZJ383USK/dlGIkMJ0Z3M5HduX8S5AqS
 M6J8OPB0B1ndpgQ==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add a function to perform soft reset of the FCP.

It is intended to support the correct stop procedure of the VSPX-FCPVX
and VSPD-FCPD pairs according to section "62.3.7.3 Reset Operation" of
the R-Car Hardware Manual at revision 1.20.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-fcp.c | 41 +++++++++++++++++++++++++++++++
 include/media/rcar-fcp.h                  |  5 ++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-fcp.c b/drivers/media/platform/renesas/rcar-fcp.c
index cee9bbce4e3affb2467dbc28142e1ab2304bf5b0..584add9f7a803e5ef041589c7c0be7eb8371fe9f 100644
--- a/drivers/media/platform/renesas/rcar-fcp.c
+++ b/drivers/media/platform/renesas/rcar-fcp.c
@@ -9,6 +9,8 @@
 
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
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
+				 1, 100);
+	if (ret)
+		dev_err(fcp->dev, "Failed to soft-reset\n");
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


