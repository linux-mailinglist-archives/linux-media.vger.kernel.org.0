Return-Path: <linux-media+bounces-28161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA96CA5FFB7
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 19:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 552FA3BF2C4
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 18:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C7D1EFFB8;
	Thu, 13 Mar 2025 18:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UNpafNSo"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0791EF363
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 18:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741891426; cv=none; b=IL4cwZZLI65eYkezVT20/6F1UogvvI6qQbqgCzLwzZ5tWOQIn1eDjNkG+iMYqmUQZfx9Sxx2GIan4CnXLJKQZigd/DVs2CxsrG6nXBVSH/NyWUD7c6j6E12UiK7vmPUcW1I+1NkjHHFjKcPNTx6Kcad3HAcqXqT/1ocVeYFq2tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741891426; c=relaxed/simple;
	bh=Mb9fkzRdoJS1PvLxX3EgtGaGXc5/2dnzzjCcgsS6lTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hpx6IOXghUw50dC5ySIP2w1w0NKknyaniHDW4I+bx3mFd9K98s/8aHkmgyvnxDkzF8aMDIe1Hrisd1y3Po2tKMzdvXv5bLqtPuiNkmscoxnbZPq1WkgUqJLuOhIrrOJgpytVvDaikFRiIOvnE6EyjjgwDenef8+MdXRfJ5TmS54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UNpafNSo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741891423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cl93H+ENlRD2MtPsMlsIzDedHC89AjIG8eNVkzppe3c=;
	b=UNpafNSoX8mPftxpGxytRrwHKHrXyS4lB26pBODTHbwpjnujUmKXU/DPNFZTQoqow58F6Y
	Y4GGMVP1oX5Rw/1OKwE0UY+rBLlNIXmvkuMa3IL9i3D+WGyvCF9DAjfn28VvAg+CeepfHL
	1wzeZZJzwIE17+d9RR053WCnPFbUG1o=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-55-zspREh7zPT2wPlkhe09ECQ-1; Thu,
 13 Mar 2025 14:43:42 -0400
X-MC-Unique: zspREh7zPT2wPlkhe09ECQ-1
X-Mimecast-MFC-AGG-ID: zspREh7zPT2wPlkhe09ECQ_1741891420
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C8D221800EC5;
	Thu, 13 Mar 2025 18:43:40 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E6960300376F;
	Thu, 13 Mar 2025 18:43:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Ingvar Hagelund <ingvar@redpill-linpro.com>,
	Joachim Reichel <joachim.reichel@posteo.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hao Yao <hao.yao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v8 06/14] media: ov02c10: ov02c10_check_hwcfg() improvements
Date: Thu, 13 Mar 2025 19:43:06 +0100
Message-ID: <20250313184314.91410-7-hdegoede@redhat.com>
In-Reply-To: <20250313184314.91410-1-hdegoede@redhat.com>
References: <20250313184314.91410-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

ov02c10_check_hwcfg() improvements:
- Drop unnecessary return -ENXIO when there is no fwnode, this is already
  caught by the fwnode_graph_get_next_endpoint() call
- Use dev_err_probe() in ov02c10_check_hwcfg()
- Make sure all error messages have '\n' at the end
- Add missing fwnode_handle_put() on clock-frequency read errors
- Check clock-frequency matches OV02C10_MCLK
- Log an error on v4l2_fwnode_endpoint_alloc_parse() failure
- ov02c10 code supports 1 or 2 lane setups not 2 or 4 lane setups
- replace return -EINVAL no mipi-lanes mismatch with
  goto check_hwcfg_error to properly free the bus_cfg
- Don't log an error in probe() when ov02c10_check_hwcfg() fails, in all
  cases ov02c10_check_hwcfg() already logs an error using dev_probe_err()
  and if the error is -EPROBE_DEFER then we don't want to keep logging that
  multiple times until the dependency is resolved (dev_probe_err()
  suppresses logging for -EPROBE_DEFER errors)

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov02c10.c | 55 +++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 4b1b41f74ca2..a6ea747243e6 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -921,30 +921,38 @@ static int ov02c10_check_hwcfg(struct device *dev, struct ov02c10 *ov02c10)
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
-	struct fwnode_handle *ep;
-	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	struct fwnode_handle *ep, *fwnode = dev_fwnode(dev);
 	unsigned long link_freq_bitmap;
-	u32 ext_clk;
+	u32 mclk;
 	int ret;
 
-	if (!fwnode)
-		return -ENXIO;
-
-	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver,
+	 * wait for this.
+	 */
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
 	if (!ep)
-		return -EPROBE_DEFER;
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
-	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &ext_clk);
+	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
 	if (ret) {
-		dev_err(dev, "can't get clock frequency");
-		return ret;
+		fwnode_handle_put(ep);
+		return dev_err_probe(dev, ret,
+				     "reading clock-frequency property\n");
+	}
+
+	if (mclk != OV02C10_MCLK) {
+		fwnode_handle_put(ep);
+		return dev_err_probe(dev, -EINVAL,
+				     "external clock %u is not supported\n",
+				     mclk);
 	}
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
 
 	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
@@ -952,22 +960,23 @@ static int ov02c10_check_hwcfg(struct device *dev, struct ov02c10 *ov02c10)
 				       ARRAY_SIZE(link_freq_menu_items),
 				       &link_freq_bitmap);
 	if (ret)
-		goto out_err;
+		goto check_hwcfg_error;
 
 	/* v4l2_link_freq_to_bitmap() guarantees at least 1 bit is set */
 	ov02c10->link_freq_index = ffs(link_freq_bitmap) - 1;
 
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2 &&
-	    bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
-		dev_err(dev, "number of CSI2 data lanes %d is not supported",
-			bus_cfg.bus.mipi_csi2.num_data_lanes);
-		return(-EINVAL);
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1 &&
+	    bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "number of CSI2 data lanes %u is not supported\n",
+				    bus_cfg.bus.mipi_csi2.num_data_lanes);
+		goto check_hwcfg_error;
 	}
+
 	ov02c10->mipi_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
 
-out_err:
+check_hwcfg_error:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
-
 	return ret;
 }
 
@@ -994,10 +1003,8 @@ static int ov02c10_probe(struct i2c_client *client)
 
 	/* Check HW config */
 	ret = ov02c10_check_hwcfg(&client->dev, ov02c10);
-	if (ret) {
-		dev_err(&client->dev, "failed to check hwcfg: %d", ret);
+	if (ret)
 		return ret;
-	}
 
 	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
 	ov02c10_get_pm_resources(&client->dev);
-- 
2.48.1


