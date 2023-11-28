Return-Path: <linux-media+bounces-1199-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D408B7FB684
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E448282091
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372824CE0E;
	Tue, 28 Nov 2023 10:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OgRvMXuj"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3340CD45
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 02:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701165660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b9gqnWcdjixT8WmdgbGnq10a7YNQqGVYoljol85NfXE=;
	b=OgRvMXujH5zFNS4I6K1dPlNPpqKpofausVS2iMi2y7K83fk1Sk7tBqWjGrLFi972rVgCqc
	uCBCixHAYKshhPHOhF236j1OHEfQWJaV5UvKMo2zQDRduRKzn2UjSg41KL389PFzi719NP
	sLO/+t1rBov1asNMZgijCnM3L5zDeys=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-505-p171jBnjN8Wz-MRlB0eVYA-1; Tue,
 28 Nov 2023 05:00:58 -0500
X-MC-Unique: p171jBnjN8Wz-MRlB0eVYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FE5C1C0314C;
	Tue, 28 Nov 2023 10:00:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.244])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58B3120268D7;
	Tue, 28 Nov 2023 10:00:57 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 3/9] media: ov2740: Move fwnode_graph_get_next_endpoint() call up
Date: Tue, 28 Nov 2023 11:00:41 +0100
Message-ID: <20231128100047.17529-4-hdegoede@redhat.com>
In-Reply-To: <20231128100047.17529-1-hdegoede@redhat.com>
References: <20231128100047.17529-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

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
index 0396e40419ca..35b2f43bd3e5 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -926,19 +926,27 @@ static int ov2740_check_hwcfg(struct device *dev)
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
2.41.0


