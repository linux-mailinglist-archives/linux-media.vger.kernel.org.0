Return-Path: <linux-media+bounces-9393-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF3D8A5123
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 15:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F2251C21F2D
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 13:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF9C79B8E;
	Mon, 15 Apr 2024 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bfA8+mij"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF3478C69
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713186661; cv=none; b=cSieDi5z7NqppjYRcaZvWyfjEuPOJqTElwhzOQgHTev/xtl1nzmkgoMJlCp7aks3t7hsXh1PaloIWdrPNAPVQqGcHdJo1n3XyzhleVvcMHVCP8cTuZOBcWHfNuGqu9OtF/TkoqnBnfATQQadI+Vxh6zJtOMYyZeRhHAn9XE9kls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713186661; c=relaxed/simple;
	bh=JjQR04bYDJsvJA3KiDfj6dqgfZ2oHaYjb6uUcuyVwkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=otJgFKMyoKdbVOtnxI0i7YKEDPjs6v9AuOvl+Hkn7w1WfSbmdJqFN4bldsX6ku6WPkQpJO67u3jKNc1ko+CZtJYtX/bdbtMcbhUrnQN1uB0/SEFQh3NpKCGyKrHBnhITcB266h9NCUt+UzaeJQNziNGtpRIXktO1HHQsfJQ5orI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bfA8+mij; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713186658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t9GKKxLS+13ur9fqPef0+H/zMRyvRoahWi4/DIbyC+Y=;
	b=bfA8+mijRmJ1+xCUOu7JLYTCwbO68GLtSm6qrjH/SJjunDmJLKeTvghiLX9tx/889uwSMX
	kdTSqB89UzvttQm7hRhME0yW0Qyw35ohbRqOdVPWEF9AgopTTMVi7Ny4BVCj34cxr1bdrT
	IJSEIFsSRa8EN4HaQl3ITCsV2835zbU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-167-Tgp4xjqJPTK1BRG5d6EG0g-1; Mon,
 15 Apr 2024 09:10:53 -0400
X-MC-Unique: Tgp4xjqJPTK1BRG5d6EG0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 115AA28B7279;
	Mon, 15 Apr 2024 13:10:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 17EBB1BDAA;
	Mon, 15 Apr 2024 13:10:51 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 1/4] media: hi556: Return -EPROBE_DEFER if no endpoint is found
Date: Mon, 15 Apr 2024 15:10:35 +0200
Message-ID: <20240415131038.236660-2-hdegoede@redhat.com>
In-Reply-To: <20240415131038.236660-1-hdegoede@redhat.com>
References: <20240415131038.236660-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

With ipu bridge, endpoints may only be created when ipu bridge has
initialised. This may happen after the sensor driver has first probed.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Parse endpoint immediately after getting it and then call
  fwnode_handle_put(ep) to avoid leaking the endpoint fwnode on errors
---
 drivers/media/i2c/hi556.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 38c77d515786..c54cd49e56a1 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1206,8 +1206,18 @@ static int hi556_check_hwcfg(struct device *dev)
 	int ret = 0;
 	unsigned int i, j;
 
-	if (!fwnode)
-		return -ENXIO;
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver,
+	 * wait for this.
+	 */
+	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!ep)
+		return -EPROBE_DEFER;
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
 
 	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
 	if (ret) {
@@ -1220,15 +1230,6 @@ static int hi556_check_hwcfg(struct device *dev)
 		return -EINVAL;
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
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
 		dev_err(dev, "number of CSI2 data lanes %d is not supported",
 			bus_cfg.bus.mipi_csi2.num_data_lanes);
-- 
2.44.0


