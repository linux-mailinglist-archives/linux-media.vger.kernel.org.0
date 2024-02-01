Return-Path: <linux-media+bounces-4574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCCE84630E
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 22:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70AC51C23F6B
	for <lists+linux-media@lfdr.de>; Thu,  1 Feb 2024 21:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C34D405FE;
	Thu,  1 Feb 2024 21:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NcTkPSn2"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DCF405F7
	for <linux-media@vger.kernel.org>; Thu,  1 Feb 2024 21:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706824760; cv=none; b=Vl+T2v//UuCW6+Ufes/3rL/g92Mc7iMHUb46rh49Xyjq14WKhtSFDOpndQm4ZxcINeJYrDVFGT1gLVypjRQY1biOCZIos6KEtgqsyZJoAd2HeJV+s0v0MbtE452A2uH+uvq+gy+oGaGTqAy0gG04F2imMVa3FwJ3fQFSZIYH/Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706824760; c=relaxed/simple;
	bh=MxHFiQ75RMMAn2Pd7EqfjIwPil8ghP5/wWhvZhawwd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkWQ2iff9LG/7iGi32jd5D9KX6fpOjzIEmlwQunhRbZKDiNfDQfGkegVTE5JjtPBgr8YDv5VgTCe+mRhE6cOakI/ZGpyr0lGcmkgk0RRAK5dU3n0qcpJnks1wmU/Ru6g93DridCmYd7tI7rST2ti70s3xN5r1L4fA8YWF1f3fxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NcTkPSn2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706824756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+K/nBNBA1ccQeZQp3Cf+CfDEJDxxtczZe0Nu8ha7LKY=;
	b=NcTkPSn2SuBhEnGUShdskzT4HozS9NLRdkeU1enJavsZlAQYh+DKcMyl63cEWg1hUcS0eU
	eO8RkV8kuOoYiRQ1/lDVDfbcDAWCbf3FmoKAkZQVywmMw8txW7A3QQC8EEfCgeGL3jNsfS
	ScnR3JsIx66nn4YBxJIhqofNskvujPY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-dG851qS8NTSdqF7d2cFlHw-1; Thu, 01 Feb 2024 16:59:12 -0500
X-MC-Unique: dG851qS8NTSdqF7d2cFlHw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AAD1185A780;
	Thu,  1 Feb 2024 21:59:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7AFFC3C2E;
	Thu,  1 Feb 2024 21:59:11 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/4] media: hi556: Return -EPROBE_DEFER if no endpoint is found
Date: Thu,  1 Feb 2024 22:58:38 +0100
Message-ID: <20240201215841.153499-2-hdegoede@redhat.com>
In-Reply-To: <20240201215841.153499-1-hdegoede@redhat.com>
References: <20240201215841.153499-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

With ipu bridge, endpoints may only be created when ipu bridge has
initialised. This may happen after the sensor driver has first probed.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/hi556.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index f6ea9b7b9700..258614b33f51 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1207,8 +1207,13 @@ static int hi556_check_hwcfg(struct device *dev)
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
 
 	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
 	if (ret) {
@@ -1221,10 +1226,6 @@ static int hi556_check_hwcfg(struct device *dev)
 		return -EINVAL;
 	}
 
-	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
-	if (!ep)
-		return -ENXIO;
-
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
-- 
2.43.0


