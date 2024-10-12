Return-Path: <linux-media+bounces-19493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A50699B49E
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 13:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3102D1F24530
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 11:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719D2146D57;
	Sat, 12 Oct 2024 11:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P7lu+9eJ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2FA47F69
	for <linux-media@vger.kernel.org>; Sat, 12 Oct 2024 11:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728733970; cv=none; b=P0V8pz1RwfdtCQB0NIBmuRzDEUclaiA0UHB9fo2UFY8nQYzjmKvSChnNEGoRBSgvUDV1v0DUVRkLyIfGaIrcYEb9ZZ/AXNicf7OujKjteXTev36fqRLFcR6amwBDuO8x/RRoMZ7KfB6lmYlzydAhzIPwlUljeZq32NArz2yxsLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728733970; c=relaxed/simple;
	bh=LEv9VAsRycRb8lh4QY1/LjERcmn7pvxCBv2DKmOLkPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TrFIIytJf3vBsDwCNj+VmFjIGBlpV+Zpo4OATqUtpykzIjMna2skOW7YIrK+ub7zU7AClZCLp6/UtrTujlJdeDhkQhg2MHwaXzD3e2xeTDsGAsKs2GA8Nm0vqymD+lW8jpN9fb6BHFuvN0Hv1bf/uAOVIWIeXrxY40f0qGLzXfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P7lu+9eJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728733967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XYBXxyFSoBJFfDMfj5Li2P2cSQjTj2dYdiIYmRfTnjE=;
	b=P7lu+9eJlVFngI7dYuMdfM8V6k18+mnoGhLtt1aE3DfSm6yRC89BJSgBCbz2pOzXSIL8ff
	2grck01fhO+rV513erIYuvh8RJ4JdPWPkKLh3mFvDo/lJQG+rNvqXUN9KKcq4xeyd50dvo
	ogaCzn0fWPEgWyTq9+7u8dSKzrBOCrE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-63-uxdegPf3MQGMPAjglEjWuA-1; Sat,
 12 Oct 2024 07:52:45 -0400
X-MC-Unique: uxdegPf3MQGMPAjglEjWuA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 375AD19560A2;
	Sat, 12 Oct 2024 11:52:44 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.20])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9D39B1956052;
	Sat, 12 Oct 2024 11:52:42 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: ov08x40: Move fwnode_property_read_u32("clock-frequency") call down
Date: Sat, 12 Oct 2024 13:52:35 +0200
Message-ID: <20241012115236.53998-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

If the bridge has not yet setup the fwnode-graph then
the fwnode_property_read_u32("clock-frequency") call will fail.

Move the fwnode_property_read_u32("clock-frequency") call below
the fwnode_graph_get_next_endpoint() call and return -EPROBE_DEFER
if the latter fails.

While moving the fwnode_property_read_u32("clock-frequency") call also
switch to dev_err_probe() for logging when it fails so that the error
code gets logged.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 7ead3c720e0e..c0dc918edc3c 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -2060,31 +2060,32 @@ static int ov08x40_check_hwcfg(struct device *dev)
 	int ret;
 	u32 ext_clk;
 
-	if (!fwnode)
-		return -ENXIO;
-
-	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &ext_clk);
-	if (ret) {
-		dev_err(dev, "can't get clock frequency");
-		return ret;
-	}
-
-	if (ext_clk != OV08X40_EXT_CLK) {
-		dev_err(dev, "external clock %d is not supported",
-			ext_clk);
-		return -EINVAL;
-	}
-
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver.
+	 * Bridge drivers doing this also add sensor properties, wait for this.
+	 */
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
-		return -ENXIO;
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
 		return ret;
 
+	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &ext_clk);
+	if (ret) {
+		dev_err_probe(dev, ret, "reading clock-frequency\n");
+		goto out_err;
+	}
+
+	if (ext_clk != OV08X40_EXT_CLK) {
+		dev_err(dev, "external clock %u is not supported\n", ext_clk);
+		ret = -EINVAL;
+		goto out_err;
+	}
+
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV08X40_DATA_LANES) {
 		dev_err(dev, "number of CSI2 data lanes %d is not supported",
 			bus_cfg.bus.mipi_csi2.num_data_lanes);
-- 
2.47.0


