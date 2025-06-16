Return-Path: <linux-media+bounces-34844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 049BDADA56F
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 03:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C20A16D6DB
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 01:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B741B4248;
	Mon, 16 Jun 2025 01:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tyz+nXuw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A6C1AF4C1;
	Mon, 16 Jun 2025 01:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750036307; cv=none; b=iW4wvyunx9fv3CnlNUJRyzlToRIhiwbjuywsv9SIURjCkreSFRS7vJouXSQ8jg97fDXpD+2Qxi6MK2ISqxtivSt/L4P8jEXFx859Lb9tfQZ4uBHJ0UiH/vIqQkcxv7mdw2tCr5rjVO89Fx90T/hUp2ep8WQbshgpLtQcEhKa1Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750036307; c=relaxed/simple;
	bh=GRl0JIc4kCtRBEQIaLx1LHQE2BexgbhyJvECCKqnWoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QpK3schGJRKPkplpSoh/PsvJb+wq7hkrMjr8Nnch0Vna+qvuLAf3VMWNvb/f9avcxgChjIvVSqZvvYY+OEXoxe+TjcoPRWIh1FJaU+4yusW64hV06zUwzAOO0lvHYOQ/VjP1EknbMl5hHpoNrRwRWm7mahehFIVNVsTSexJSKR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tyz+nXuw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9327516D4;
	Mon, 16 Jun 2025 03:11:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750036286;
	bh=GRl0JIc4kCtRBEQIaLx1LHQE2BexgbhyJvECCKqnWoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tyz+nXuwqOoUGKOnE+GjYL31oFp+rAG/NCEzK0dtaIjQVpftdSkEcthEwrv0q2rgP
	 OJf43s9KrKgwt/96a3JxORzKlc4pPS1nDK3eNNlOdgLrZMu3O9I9LzfNmThsIhslQ1
	 ta644lxn2mo86gXmmbo7+Et3IHxZ2hAS74PVjXd0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 5/6] media: rkisp1: Add support for multiple power domains
Date: Mon, 16 Jun 2025 04:11:14 +0300
Message-ID: <20250616011115.19515-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
References: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISP instances in the NXP i.MX8MP need two power domains. While
single power domains are managed automatically by the device core,
support for multiple power domains requires manually attaching to the
power domains. Do so based on platform data.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  9 ++++
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 45 +++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index c4af1277fc6b..ce900440c78d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -24,6 +24,7 @@
 #include "rkisp1-regs.h"
 
 struct dentry;
+struct dev_pm_domain_list;
 struct regmap;
 
 /*
@@ -146,6 +147,8 @@ enum rkisp1_feature {
  * @features: bitmask of rkisp1_feature features implemented by the ISP
  * @max_width: maximum input frame width
  * @max_height: maximum input frame height
+ * @pm_domains.names: name of the power domains
+ * @pm_domains.count: number of power domains
  *
  * This structure contains information about the ISP specific to a particular
  * ISP model, version, or integration in a particular SoC.
@@ -158,6 +161,10 @@ struct rkisp1_info {
 	unsigned int features;
 	unsigned int max_width;
 	unsigned int max_height;
+	struct {
+		const char * const *names;
+		unsigned int count;
+	} pm_domains;
 };
 
 /*
@@ -479,6 +486,7 @@ struct rkisp1_debug {
  * @dev:	   a pointer to the struct device
  * @clk_size:	   number of clocks
  * @clks:	   array of clocks
+ * @pm_domains:    power domains
  * @gasket:	   the gasket - i.MX8MP only
  * @gasket_id:	   the gasket ID (0 or 1) - i.MX8MP only
  * @v4l2_dev:	   v4l2_device variable
@@ -503,6 +511,7 @@ struct rkisp1_device {
 	struct device *dev;
 	unsigned int clk_size;
 	struct clk_bulk_data clks[RKISP1_MAX_BUS_CLK];
+	struct dev_pm_domain_list *pm_domains;
 	struct regmap *gasket;
 	unsigned int gasket_id;
 	struct v4l2_device v4l2_dev;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index fb4ccf497bad..1791c02a40ae 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -17,6 +17,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
@@ -532,6 +533,11 @@ static const struct rkisp1_isr_data imx8mp_isp_isrs[] = {
 	{ NULL, rkisp1_isr, BIT(RKISP1_IRQ_ISP) | BIT(RKISP1_IRQ_MI) },
 };
 
+static const char * const imx8mp_isp_pm_domains[] = {
+	"isp",
+	"csi2",
+};
+
 static const struct rkisp1_info imx8mp_isp_info = {
 	.num_clocks = 3,
 	.isrs = imx8mp_isp_isrs,
@@ -542,6 +548,10 @@ static const struct rkisp1_info imx8mp_isp_info = {
 		  | RKISP1_FEATURE_COMPAND,
 	.max_width = 4096,
 	.max_height = 3072,
+	.pm_domains = {
+		.names = imx8mp_isp_pm_domains,
+		.count = ARRAY_SIZE(imx8mp_isp_pm_domains),
+	},
 };
 
 static const struct of_device_id rkisp1_of_match[] = {
@@ -605,6 +615,37 @@ static int rkisp1_init_clocks(struct rkisp1_device *rkisp1)
 	return 0;
 }
 
+static int rkisp1_init_pm_domains(struct rkisp1_device *rkisp1)
+{
+	const struct rkisp1_info *info = rkisp1->info;
+	struct dev_pm_domain_attach_data pm_domain_data = {
+		.pd_names = info->pm_domains.names,
+		.num_pd_names = info->pm_domains.count,
+	};
+	int ret;
+
+	/*
+	 * Most platforms have a single power domain, which the PM domain core
+	 * automatically attaches at probe time. When that's the case there's
+	 * nothing to do here.
+	 */
+	if (rkisp1->dev->pm_domain)
+		return 0;
+
+	if (!pm_domain_data.num_pd_names)
+		return 0;
+
+	ret = devm_pm_domain_attach_list(rkisp1->dev, &pm_domain_data,
+					 &rkisp1->pm_domains);
+	if (ret < 0) {
+		dev_err_probe(rkisp1->dev, ret,
+			      "Failed to attach power domains\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int rkisp1_probe(struct platform_device *pdev)
 {
 	const struct rkisp1_info *info;
@@ -666,6 +707,10 @@ static int rkisp1_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = rkisp1_init_pm_domains(rkisp1);
+	if (ret)
+		return ret;
+
 	if (info->isp_ver == RKISP1_V_IMX8MP) {
 		unsigned int id;
 
-- 
Regards,

Laurent Pinchart


