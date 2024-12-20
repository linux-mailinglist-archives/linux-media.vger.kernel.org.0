Return-Path: <linux-media+bounces-23931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 558899F94AC
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67B13188ABC8
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C0721882C;
	Fri, 20 Dec 2024 14:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IuWdVzBu"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C6A218828
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705713; cv=none; b=V92g2eWUAHmmQsC6v6T5OjP61Vh0+y0l8p4UkGxYO+NuiTeDj0DErhxwIfZj7l+ePt/vqASPyqOg4H5cpZ+nk/aT+eNdbZEgc6drimLkTHO1xkyjMteAaVBEPJniMfqS3XE9uDArwJp1o31p2JPtRdVeBnrtKSeUc3KF9QhIBDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705713; c=relaxed/simple;
	bh=dNHP0Vnk0oESiLPrIZC5uEoQ50/buQM5n9mlbB4vSQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJbW5VCONPERzqBAM8Ofg4Jpfs36MV6I3GF/YYbGeM1h0olbEWpWR/M/+ho1sp1uxyXqauWqi7/zo79x001w+Zs4rMmeNc3GVAWBbfp4fGeJ3PlrBRKtMu2DY8xT6ilVxh3EleKpSIgjthmVO2L4TcRwRauvasXXYtH2FNDbTnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IuWdVzBu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734705710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kA1wpD4Nt80suqGrtQDzAVbBW3ugtlV7eFt9WMy+W1c=;
	b=IuWdVzBuUzBUVtNcYkLWjvv0vOpkATozAzgJ5KW02glbAmuacNpiOFwre4pbayHLLdVBkp
	cye1rej6Obslkvcqrs8E3+MIkNps70Tqhpo6LOPjtowcsVGhI9qZSkPex3LlbT2qr/2/xA
	DTwOrKyvAJE2v5dEILg6U3gIRfJ8bkA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-694-Uhd5fmsNOVGZ2fp5kfxFLA-1; Fri,
 20 Dec 2024 09:41:46 -0500
X-MC-Unique: Uhd5fmsNOVGZ2fp5kfxFLA-1
X-Mimecast-MFC-AGG-ID: Uhd5fmsNOVGZ2fp5kfxFLA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9CE0719560BA;
	Fri, 20 Dec 2024 14:41:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.74])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D7FC2195605F;
	Fri, 20 Dec 2024 14:41:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 02/10] media: ov08x40: Move fwnode_graph_get_next_endpoint() call up
Date: Fri, 20 Dec 2024 15:41:22 +0100
Message-ID: <20241220144130.66765-3-hdegoede@redhat.com>
In-Reply-To: <20241220144130.66765-1-hdegoede@redhat.com>
References: <20241220144130.66765-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

If the bridge has not yet setup the fwnode-graph then
the fwnode_property_read_u32("clock-frequency") call will fail.

Make the fwnode_graph_get_next_endpoint() call the first call in
ov08x40_check_hwcfg() and return -EPROBE_DEFER if it fails.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 40 +++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 83b49cf114ac..908a4752117b 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -2151,23 +2151,37 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
 	int ret;
 	u32 xvclk_rate;
 
-	if (!fwnode)
-		return -ENXIO;
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver.
+	 * Bridge drivers doing this also add sensor properties, wait for this.
+	 */
+	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!ep)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
 
 	if (!is_acpi_node(fwnode)) {
 		ov08x->xvclk = devm_clk_get(dev, NULL);
 		if (IS_ERR(ov08x->xvclk)) {
 			dev_err(dev, "could not get xvclk clock (%pe)\n",
 				ov08x->xvclk);
-			return PTR_ERR(ov08x->xvclk);
+			ret = PTR_ERR(ov08x->xvclk);
+			goto out_err;
 		}
 
 		xvclk_rate = clk_get_rate(ov08x->xvclk);
 
 		ov08x->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 							    GPIOD_OUT_LOW);
-		if (IS_ERR(ov08x->reset_gpio))
-			return PTR_ERR(ov08x->reset_gpio);
+		if (IS_ERR(ov08x->reset_gpio)) {
+			ret = PTR_ERR(ov08x->reset_gpio);
+			goto out_err;
+		}
 
 		for (i = 0; i < ARRAY_SIZE(ov08x40_supply_names); i++)
 			ov08x->supplies[i].supply = ov08x40_supply_names[i];
@@ -2176,31 +2190,23 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
 					      ARRAY_SIZE(ov08x40_supply_names),
 					      ov08x->supplies);
 		if (ret)
-			return ret;
+			goto out_err;
 	} else {
 		ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
 					       &xvclk_rate);
 		if (ret) {
 			dev_err(dev, "can't get clock frequency");
-			return ret;
+			goto out_err;
 		}
 	}
 
 	if (xvclk_rate != OV08X40_XVCLK) {
 		dev_err(dev, "external clock %d is not supported",
 			xvclk_rate);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_err;
 	}
 
-	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
-	if (!ep)
-		return -ENXIO;
-
-	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
-	fwnode_handle_put(ep);
-	if (ret)
-		return ret;
-
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV08X40_DATA_LANES) {
 		dev_err(dev, "number of CSI2 data lanes %d is not supported",
 			bus_cfg.bus.mipi_csi2.num_data_lanes);
-- 
2.47.1


