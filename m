Return-Path: <linux-media+bounces-32669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B63F3ABA9D0
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD7FB189B219
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC271F8744;
	Sat, 17 May 2025 11:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UkllxWkE"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB931F9F61
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482147; cv=none; b=FxqyVNOf3uQXTy1X4AZOLLQIawPKxP0w9Cnpr+t8gFSJK472elI2jvd75dFjAv18ObvxtTtfYiJ63v3EEnadDtuqFsxfUwmimteSozRMbSMc32cWv6sTeb/OGd0a5tsuBiPRxlCO3PfopGxrjWKnSmcW4toW+6U2yVF8IzVhmsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482147; c=relaxed/simple;
	bh=WxJiMxFWGy58LjBh3KaBA6vviR2IHM1TtvBQP+vdtgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/gl/zWxTqji+JXbFqr/G7cJ8tenbGQrFwA5eaYUSa55oqqwzcI/Cdgc1sqXi7L+f7IQBfRkXmkQfrAq+I/KlQmSPDN6qPTn70eRhgpviW5Pz+c/wVDljcluLn/615wsSnG0Y7Hh6n7p+MMr2Aagy3z5Y2w2q8S2va7uEgqWr/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UkllxWkE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y1xrFIyc9aacmml6a+Hq91W8qFOeGc1J+hupW2QHfIY=;
	b=UkllxWkEDUrjMn7c/ZCSVt5RtXp3n8NO/HAMEGIBb7wyM0HDvKwaWGw++L4bDW0/kVQEfN
	ouws10VYLVkonJ9FzYCou0kSwaTt3BV22ynejsIQeSlgcayZsIKbax6EN2fMEu0ZkXeu3Q
	yZxn+hOi1/S3TVE3w4iuQ12eBSnQRmI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-688-E1qbdYSUPu-mmtQk3OmUkA-1; Sat,
 17 May 2025 07:42:20 -0400
X-MC-Unique: E1qbdYSUPu-mmtQk3OmUkA-1
X-Mimecast-MFC-AGG-ID: E1qbdYSUPu-mmtQk3OmUkA_1747482139
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C4B4F19560BC;
	Sat, 17 May 2025 11:42:19 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9B48418003FC;
	Sat, 17 May 2025 11:42:14 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 11/23] media: atomisp: gc0310: Add check_hwcfg() function
Date: Sat, 17 May 2025 13:40:54 +0200
Message-ID: <20250517114106.43494-12-hdegoede@redhat.com>
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Add a check_hwcfg() function to check if the external clk-freq, CSI
link-freq and lane-count match the driver's expectations.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 56 +++++++++++++++++--
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index e053982a6512..8acb4517c67b 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -36,6 +36,7 @@
 #define GC0310_PIXELRATE			13923000
 /* single lane, bus-format is 8 bpp, CSI-2 is double data rate */
 #define GC0310_LINK_FREQ			(GC0310_PIXELRATE * 8 / 2)
+#define GC0310_MCLK_FREQ			19200000
 #define GC0310_FPS				30
 #define GC0310_SKIP_FRAMES			3
 
@@ -679,21 +680,68 @@ static void gc0310_remove(struct i2c_client *client)
 	pm_runtime_disable(&client->dev);
 }
 
-static int gc0310_probe(struct i2c_client *client)
+static int gc0310_check_hwcfg(struct device *dev)
 {
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
 	struct fwnode_handle *ep_fwnode;
-	struct gc0310_device *sensor;
+	unsigned long link_freq_bitmap;
+	u32 mclk;
 	int ret;
 
 	/*
 	 * Sometimes the fwnode graph is initialized by the bridge driver.
 	 * Bridge drivers doing this may also add GPIO mappings, wait for this.
 	 */
-	ep_fwnode = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
+	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
 	if (!ep_fwnode)
-		return dev_err_probe(&client->dev, -EPROBE_DEFER, "waiting for fwnode graph endpoint\n");
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
+	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
+				       &mclk);
+	if (ret) {
+		fwnode_handle_put(ep_fwnode);
+		return dev_err_probe(dev, ret,
+				     "reading clock-frequency property\n");
+	}
+
+	if (mclk != GC0310_MCLK_FREQ) {
+		fwnode_handle_put(ep_fwnode);
+		return dev_err_probe(dev, -EINVAL,
+				     "external clock %u is not supported\n",
+				     mclk);
+	}
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep_fwnode, &bus_cfg);
 	fwnode_handle_put(ep_fwnode);
+	if (ret)
+		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
+
+	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       link_freq_menu_items,
+				       ARRAY_SIZE(link_freq_menu_items),
+				       &link_freq_bitmap);
+
+	if (ret == 0 && bus_cfg.bus.mipi_csi2.num_data_lanes != 1)
+		ret = dev_err_probe(dev, -EINVAL,
+				    "number of CSI2 data lanes %u is not supported\n",
+				    bus_cfg.bus.mipi_csi2.num_data_lanes);
+
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+	return ret;
+}
+
+static int gc0310_probe(struct i2c_client *client)
+{
+	struct gc0310_device *sensor;
+	int ret;
+
+	ret = gc0310_check_hwcfg(&client->dev);
+	if (ret)
+		return ret;
 
 	sensor = devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL);
 	if (!sensor)
-- 
2.49.0


