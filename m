Return-Path: <linux-media+bounces-1043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF007F92FB
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 15:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 883D2B20EC2
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 14:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE85D51C;
	Sun, 26 Nov 2023 14:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aHImaN6R"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD4A10A
	for <linux-media@vger.kernel.org>; Sun, 26 Nov 2023 06:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701008132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQH17Du3lR459qD3dd6iJzqVauHBAWZDqoqB9UtPCIU=;
	b=aHImaN6Rx0dBJJYken+F2u4lh08Jyme4X09FvfWkO7L4gzMycvavfmy2FhUBUXEWUsvh+N
	z5hTv/v9fZqLA2befDYWotak8JOTBS3YtAC1WeeyqVKcmwoDYUFGBTrQB/2YgrjD8i3xhg
	iE2oR/Yy/u6CgcZfMyr+sW91ZENEmG8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-sJzXs14nO_OSUb0JtSHC1g-1; Sun,
 26 Nov 2023 09:15:28 -0500
X-MC-Unique: sJzXs14nO_OSUb0JtSHC1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDC06299E742;
	Sun, 26 Nov 2023 14:15:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E71E5202701E;
	Sun, 26 Nov 2023 14:15:26 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 3/9] media: ov2740: Move fwnode_graph_get_next_endpoint() call up
Date: Sun, 26 Nov 2023 15:15:11 +0100
Message-ID: <20231126141517.7534-4-hdegoede@redhat.com>
In-Reply-To: <20231126141517.7534-1-hdegoede@redhat.com>
References: <20231126141517.7534-1-hdegoede@redhat.com>
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
 drivers/media/i2c/ov2740.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 0396e40419ca..832f24721dca 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -926,6 +926,14 @@ static int ov2740_check_hwcfg(struct device *dev)
 	int ret;
 	unsigned int i, j;
 
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver,
+	 * wait for this.
+	 */
+	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!ep)
+		return -EPROBE_DEFER;
+
 	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
 	if (ret)
 		return ret;
@@ -935,10 +943,6 @@ static int ov2740_check_hwcfg(struct device *dev)
 				     "external clock %d is not supported\n",
 				     mclk);
 
-	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
-	if (!ep)
-		return -EPROBE_DEFER;
-
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
-- 
2.41.0


