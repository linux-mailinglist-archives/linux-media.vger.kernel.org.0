Return-Path: <linux-media+bounces-19223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70222994699
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B5AE1C217ED
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77D41DE2CF;
	Tue,  8 Oct 2024 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="DuduoAsi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1BE18CC13;
	Tue,  8 Oct 2024 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386497; cv=none; b=PI2t7E+Wix38wlQ0vs8I5Aeeuz/d0tPbsFiTgJWVkUZBKmzNuOFFYL47l34NsrSq/OzRXXgvEDYGMqHPV3GEp8wy4sf6Vt0Wt2A0ZhaN48W89x31L64cSZxJjKbplUwdldwjWdw7mPEsGWRXCklvMuOTq71ZsIWz2PFisDXwqLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386497; c=relaxed/simple;
	bh=cxvTBvHppFEvKTZXy684G2daCJtDj65voJbFfC74Bqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lW2G1sybSv/4WngXZOsrkapWXrkoJ3N/MlB8+GyFGm1HXFDXuL89byXlKyQy6SqGlouj0Wnjk2MogrB3zxZfGaQCeBCtRaipu+QDNBlfFcJCpzSvm30flfEOFMDrlvogGE/V0SuFoP8WEvpV9CzvYBWKmAAe3WP+7nNN7+a+gkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=DuduoAsi; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4987tkBn015666;
	Tue, 8 Oct 2024 13:21:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	EaHfvxmNER0DXnH2Agn3VHqyLs7M/NulIxtgQJeNUi8=; b=DuduoAsikI2LSMO9
	2NRgvTYQ9ZmkpYRMvs3eIgCfeq2ogpek7GUsYOVQktFGrRBpbxNqFVwuIdJpdJUq
	ZFcuGFcmrkWHxASC9dy1i59Cf8hacaadgEzBEAtCWzBmWkqCGz/oKZTdiKiQ4tMQ
	5IHseTfnZFyVf79aO0RTRYP9Li3DOyTOqw6sIDWX2Hzw9rp9PFIHcb4NDfXgnCdz
	65F6jvlqEp4La5DKCV49atYZuIoJbwzvH+M1KnD9Psa4ol9bV8mravgGIV2EbIm5
	ugO+qviNFWx0kv5d8tByWYYMynQZX1tubTrvbXgOn9u3tfG7ujjOjLMnewo/ZaIj
	CMYWyw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 423f10u8au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:21:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5B0674005D;
	Tue,  8 Oct 2024 13:20:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93409285A0E;
	Tue,  8 Oct 2024 13:18:21 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:18:21 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 8 Oct 2024 13:18:15 +0200
Subject: [PATCH 13/15] media: stm32: dcmipp: add core support for the
 stm32mp25
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241008-csi_dcmipp_mp25-v1-13-e3fd0ed54b31@foss.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
In-Reply-To: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

The stm32mp25 supports both parallel & csi inputs.
An additional clock control is necessary.
Skeleton of the subdev structures for the stm32mp25 is added,
identical for the time being to the stm32mp13 however more subdeves
will be added in further commits.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 98 ++++++++++++++++++----
 1 file changed, 80 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index d2cc19bb40d7..0087f9017f02 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -40,6 +40,7 @@ struct dcmipp_device {
 
 	/* Hardware resources */
 	void __iomem			*regs;
+	struct clk			*mclk;
 	struct clk			*kclk;
 
 	/* The pipeline configuration */
@@ -132,6 +133,40 @@ static const struct dcmipp_pipeline_config stm32mp13_pipe_cfg = {
 	.hw_revision	= DCMIPP_STM32MP13_VERR
 };
 
+static const struct dcmipp_ent_config stm32mp25_ent_config[] = {
+	{
+		.name = "dcmipp_input",
+		.init = dcmipp_inp_ent_init,
+		.release = dcmipp_inp_ent_release,
+	},
+	{
+		.name = "dcmipp_dump_postproc",
+		.init = dcmipp_byteproc_ent_init,
+		.release = dcmipp_byteproc_ent_release,
+	},
+	{
+		.name = "dcmipp_dump_capture",
+		.init = dcmipp_bytecap_ent_init,
+		.release = dcmipp_bytecap_ent_release,
+	},
+};
+
+static const struct dcmipp_ent_link stm32mp25_ent_links[] = {
+	DCMIPP_ENT_LINK(ID_INPUT, 1, ID_DUMP_BYTEPROC, 0,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_DUMP_BYTEPROC, 1, ID_DUMP_CAPTURE,  0,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+};
+
+#define DCMIPP_STM32MP25_VERR  0x30
+static const struct dcmipp_pipeline_config stm32mp25_pipe_cfg = {
+	.ents		= stm32mp25_ent_config,
+	.num_ents	= ARRAY_SIZE(stm32mp25_ent_config),
+	.links		= stm32mp25_ent_links,
+	.num_links	= ARRAY_SIZE(stm32mp25_ent_links),
+	.hw_revision    = DCMIPP_STM32MP25_VERR
+};
+
 #define LINK_FLAG_TO_STR(f) ((f) == 0 ? "" :\
 			     (f) == MEDIA_LNK_FL_ENABLED ? "ENABLED" :\
 			     (f) == MEDIA_LNK_FL_IMMUTABLE ? "IMMUTABLE" :\
@@ -212,6 +247,7 @@ static int dcmipp_create_subdevs(struct dcmipp_device *dcmipp)
 
 static const struct of_device_id dcmipp_of_match[] = {
 	{ .compatible = "st,stm32mp13-dcmipp", .data = &stm32mp13_pipe_cfg },
+	{ .compatible = "st,stm32mp25-dcmipp", .data = &stm32mp25_pipe_cfg },
 	{ /* end node */ },
 };
 MODULE_DEVICE_TABLE(of, dcmipp_of_match);
@@ -261,13 +297,22 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
 {
 	struct dcmipp_device *dcmipp = notifier_to_dcmipp(notifier);
 	unsigned int ret;
-	int src_pad;
+	int src_pad, i;
 	struct dcmipp_ent_device *sink;
-	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_PARALLEL };
+	struct v4l2_fwnode_endpoint vep = { 0 };
 	struct fwnode_handle *ep;
+	enum v4l2_mbus_type supported_types[] = {
+		V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656, V4L2_MBUS_CSI2_DPHY
+	};
+	int supported_types_nb = ARRAY_SIZE(supported_types);
 
 	dev_dbg(dcmipp->dev, "Subdev \"%s\" bound\n", subdev->name);
 
+	/* Only MP25 supports CSI input */
+	if (!of_device_is_compatible(dcmipp->dev->of_node,
+				     "st,stm32mp25-dcmipp"))
+		supported_types_nb--;
+
 	/*
 	 * Link this sub-device to DCMIPP, it could be
 	 * a parallel camera sensor or a CSI-2 to parallel bridge
@@ -284,21 +329,23 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
 		return -ENODEV;
 	}
 
-	/* Check for parallel bus-type first, then bt656 */
-	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
-	if (ret) {
-		vep.bus_type = V4L2_MBUS_BT656;
+	/* Check for supported MBUS type */
+	for (i = 0; i < supported_types_nb; i++) {
+		vep.bus_type = supported_types[i];
 		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
-		if (ret) {
-			dev_err(dcmipp->dev, "Could not parse the endpoint\n");
-			fwnode_handle_put(ep);
-			return ret;
-		}
+		if (!ret)
+			break;
 	}
 
 	fwnode_handle_put(ep);
 
-	if (vep.bus.parallel.bus_width == 0) {
+	if (ret) {
+		dev_err(dcmipp->dev, "Could not parse the endpoint\n");
+		return ret;
+	}
+
+	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
+	    vep.bus.parallel.bus_width == 0) {
 		dev_err(dcmipp->dev, "Invalid parallel interface bus-width\n");
 		return -ENODEV;
 	}
@@ -311,11 +358,13 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
 		return -ENODEV;
 	}
 
-	/* Parallel input device detected, connect it to parallel subdev */
+	/* Connect input device to the dcmipp_input subdev */
 	sink = dcmipp->entity[ID_INPUT];
-	sink->bus.flags = vep.bus.parallel.flags;
-	sink->bus.bus_width = vep.bus.parallel.bus_width;
-	sink->bus.data_shift = vep.bus.parallel.data_shift;
+	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+		sink->bus.flags = vep.bus.parallel.flags;
+		sink->bus.bus_width = vep.bus.parallel.bus_width;
+		sink->bus.data_shift = vep.bus.parallel.data_shift;
+	}
 	sink->bus_type = vep.bus_type;
 	ret = media_create_pad_link(&subdev->entity, src_pad, sink->ent, 0,
 				    MEDIA_LNK_FL_IMMUTABLE |
@@ -414,7 +463,7 @@ static int dcmipp_graph_init(struct dcmipp_device *dcmipp)
 static int dcmipp_probe(struct platform_device *pdev)
 {
 	struct dcmipp_device *dcmipp;
-	struct clk *kclk;
+	struct clk *kclk, *mclk;
 	const struct dcmipp_pipeline_config *pipe_cfg;
 	struct reset_control *rstc;
 	int irq;
@@ -474,12 +523,20 @@ static int dcmipp_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	kclk = devm_clk_get(&pdev->dev, NULL);
+	kclk = devm_clk_get(&pdev->dev, "kclk");
 	if (IS_ERR(kclk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(kclk),
 				     "Unable to get kclk\n");
 	dcmipp->kclk = kclk;
 
+	if (!of_device_is_compatible(pdev->dev.of_node, "st,stm32mp13-dcmipp")) {
+		mclk = devm_clk_get(&pdev->dev, "mclk");
+		if (IS_ERR(mclk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(mclk),
+					     "Unable to get mclk\n");
+		dcmipp->mclk = mclk;
+	}
+
 	dcmipp->entity = devm_kcalloc(&pdev->dev, dcmipp->pipe_cfg->num_ents,
 				      sizeof(*dcmipp->entity), GFP_KERNEL);
 	if (!dcmipp->entity)
@@ -542,6 +599,7 @@ static int dcmipp_runtime_suspend(struct device *dev)
 	struct dcmipp_device *dcmipp = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(dcmipp->kclk);
+	clk_disable_unprepare(dcmipp->mclk);
 
 	return 0;
 }
@@ -551,6 +609,10 @@ static int dcmipp_runtime_resume(struct device *dev)
 	struct dcmipp_device *dcmipp = dev_get_drvdata(dev);
 	int ret;
 
+	ret = clk_prepare_enable(dcmipp->mclk);
+	if (ret)
+		dev_err(dev, "%s: Failed to prepare_enable mclk\n", __func__);
+
 	ret = clk_prepare_enable(dcmipp->kclk);
 	if (ret)
 		dev_err(dev, "%s: Failed to prepare_enable kclk\n", __func__);

-- 
2.25.1


