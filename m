Return-Path: <linux-media+bounces-19514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D35B99BA24
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 17:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34B1E1C20991
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 15:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B12A1474BF;
	Sun, 13 Oct 2024 15:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iIQsClJF"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5BF1482ED
	for <linux-media@vger.kernel.org>; Sun, 13 Oct 2024 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728834074; cv=none; b=eG9j6mksUzCjVBmyoutwOxHmDDm3iwzMVDBBQ6/oOMylAu0ALl/lQ3mfcIJerRND9DCj91EYBxC6UKwWmY3anEXmSIFzH9AwE0vaNmNcSCW5lf3vnth/9mlMzRpv2y9c2fol1QZO3UfJGKHbuUcaW098XosmCdIiW5Eat1CwbtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728834074; c=relaxed/simple;
	bh=OOd9rgHIIWHZo+d9xSlAkUbBCkL9qEIOTHTSVpxKOu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ff+IAUPhfXUK0Yurv53Q5EFAPnbo4V6rRQxDNfnD9XIHtZR9YJFvOc5MVnCEjWGhiAYMWLYbJxBbz/cAFcoYqeJSbFEVU0/pSSKDGIErCc9K88LCdcx4dyDlQZC05zCNupabVargGqaZtCrgCDbSZ5VN0vdDg33F6pRiDET1oF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iIQsClJF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728834071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TaLMKjq7VTsIaWf+6+uA8TU8YvBwNEuYElA3Ml/v4LM=;
	b=iIQsClJFWB4xViSaMo/MxPxjIc+mDiqn3RQTV0/nHc69g4tiLCdXXCPlkX20okQcFuhHs+
	A08Fth0n+An/K4jaX4PCPjfp+k6jrxOUI0pI7UEOlMq5iVMlHxw48XuOO6m74ZNNppXyHe
	/mG6+bTLyl2Fp3Wbx9rcq3mS7JLaao4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-477-Gd3tzlboN6ao3FAoWPDDew-1; Sun,
 13 Oct 2024 11:41:10 -0400
X-MC-Unique: Gd3tzlboN6ao3FAoWPDDew-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0EA7019560AA;
	Sun, 13 Oct 2024 15:41:09 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.70])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AE80019560AA;
	Sun, 13 Oct 2024 15:41:06 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Robert Mast <rn.mast@zonnet.nl>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 3/4] media: atomisp: mt9m114: Add missing mutex_init() call
Date: Sun, 13 Oct 2024 17:40:55 +0200
Message-ID: <20241013154056.12532-4-hdegoede@redhat.com>
In-Reply-To: <20241013154056.12532-1-hdegoede@redhat.com>
References: <20241013154056.12532-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

The input_lock was not being initialized, fix this.

Also switch to devm_kzalloc() for the main driver data struct, so that
devm_mutex_init() can be used for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index b0b740dd3ca3..1a67f93a53d7 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -30,6 +30,7 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/acpi.h>
+#include <linux/mutex.h>
 #include "../include/linux/atomisp_gmin_platform.h"
 #include <media/v4l2-device.h>
 
@@ -1527,7 +1528,6 @@ static void mt9m114_remove(struct i2c_client *client)
 	v4l2_device_unregister_subdev(sd);
 	media_entity_cleanup(&dev->sd.entity);
 	v4l2_ctrl_handler_free(&dev->ctrl_handler);
-	kfree(dev);
 }
 
 static int mt9m114_probe(struct i2c_client *client)
@@ -1538,10 +1538,14 @@ static int mt9m114_probe(struct i2c_client *client)
 	void *pdata;
 
 	/* Setup sensor configuration structure */
-	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	dev = devm_kzalloc(&client->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
 
+	ret = devm_mutex_init(&client->dev, &dev->input_lock);
+	if (ret)
+		return ret;
+
 	v4l2_i2c_subdev_init(&dev->sd, client, &mt9m114_ops);
 	pdata = gmin_camera_platform_data(&dev->sd,
 					  ATOMISP_INPUT_FORMAT_RAW_10,
@@ -1550,14 +1554,12 @@ static int mt9m114_probe(struct i2c_client *client)
 		ret = mt9m114_s_config(&dev->sd, client->irq, pdata);
 	if (!pdata || ret) {
 		v4l2_device_unregister_subdev(&dev->sd);
-		kfree(dev);
 		return ret;
 	}
 
 	ret = atomisp_register_i2c_module(&dev->sd, pdata);
 	if (ret) {
 		v4l2_device_unregister_subdev(&dev->sd);
-		kfree(dev);
 		/* Coverity CID 298095 - return on error */
 		return ret;
 	}
-- 
2.47.0


