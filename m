Return-Path: <linux-media+bounces-1552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 931C5803338
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 493331F2111E
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 12:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6F52377D;
	Mon,  4 Dec 2023 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b49jKz+e"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24CF018A
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 04:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701693656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQbIf09VR9SngZSlmqAfqaoPYVOBA8CnZ7s8eB+OLuM=;
	b=b49jKz+edyvrHlLTIIOPv8SOzZ3YZq1OqeUTa1BOTcseSxWGlELV/YiQlMkGzDAj/3DOfp
	SWa+XL+eguuT1g2XQIb1u4/eJiKVMekOraHtnBqxqjk0gXJD73WhYYajDjfjWO6Zdv1sWG
	k/HVpkEzN8KLxmfVq2YcDCzt6FKPlNY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-27-JaFsKm3KOVu-tH3Gj8WUFg-1; Mon,
 04 Dec 2023 07:40:16 -0500
X-MC-Unique: JaFsKm3KOVu-tH3Gj8WUFg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E98723806721;
	Mon,  4 Dec 2023 12:39:53 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.73])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99B6C40C6EB9;
	Mon,  4 Dec 2023 12:39:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v4 3/9] media: ov2740: Move fwnode_graph_get_next_endpoint() call up
Date: Mon,  4 Dec 2023 13:39:40 +0100
Message-ID: <20231204123947.5754-4-hdegoede@redhat.com>
In-Reply-To: <20231204123947.5754-1-hdegoede@redhat.com>
References: <20231204123947.5754-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

If the bridge has not yet setup the fwnode-graph then
the fwnode_property_read_u32("clock-frequency") call will fail.

Move the fwnode_graph_get_next_endpoint() call to above reading
the clock-frequency.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Add fwnode_handle_put() in error-exit-paths
---
 drivers/media/i2c/ov2740.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 653cd96bb156..06427e886d15 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -929,19 +929,27 @@ static int ov2740_check_hwcfg(struct device *dev)
 	int ret;
 	unsigned int i, j;
 
-	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
-	if (ret)
-		return ret;
-
-	if (mclk != OV2740_MCLK)
-		return dev_err_probe(dev, -EINVAL,
-				     "external clock %d is not supported\n",
-				     mclk);
-
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver,
+	 * wait for this.
+	 */
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
 		return -EPROBE_DEFER;
 
+	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
+	if (ret) {
+		fwnode_handle_put(ep);
+		return ret;
+	}
+
+	if (mclk != OV2740_MCLK) {
+		fwnode_handle_put(ep);
+		return dev_err_probe(dev, -EINVAL,
+				     "external clock %d is not supported\n",
+				     mclk);
+	}
+
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
-- 
2.43.0


