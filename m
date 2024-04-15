Return-Path: <linux-media+bounces-9358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A51C8A4E5C
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 188A1B20BBE
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CF06BFD5;
	Mon, 15 Apr 2024 12:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R+t7oSkL"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728B06BB54
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182574; cv=none; b=VxwdhcWVnxgfW0ms+uDRsj51hyRLvg06Hfo81rOw2JmWylGjKIv4dFpcW5k811qiGrYZMyh+yiDpuc8Z9sMfO4dH2oP9dIUsw7/jn2lultOEIRCHutlFbvo5HCm7Qbajp6KZO6UUtluVKczo+cuI1Uew+mTsRscVXs6I4/4u+tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182574; c=relaxed/simple;
	bh=TyvtyYWLVLteFRLJofQYoGhX4EBIYlVcQvdNAJOt1U8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7mOt/gBXaxQ3as0p17sG5sFAUeyeyDl35dlD2dm6sTDCaCOtYZNJ2Q8Hfb2j2GmSQCOgJaa0p9i8buPNQZwQKKHsd1w5uzJPDLTSB89/scCBRv+ANphyLwX8v108apO4JCvLetDb1K7sxhrNC6ZH3WbX5Y2zzJA33SX865Hgaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R+t7oSkL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oY80KwTzoqhoG9HboYfuMAuXhGbSeDqny1msoJyxThg=;
	b=R+t7oSkLO/IAHStuHERZlkioOEceZeOQ9X7XixKwtqZ4QaP7uMmbNW/p2KLHOzvfHflmR+
	Bc0bWFFBaol4ZqmxBNeEaXwi/cvFGfbSXLe3sMH5QCRgK8c15H3npGeXxGqTtbbTPeYKAc
	pcA19LcJ4IGC6ICBTrYnmivh+dT5ngk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-_6SAe04KNyuULr8ktd3SHQ-1; Mon, 15 Apr 2024 08:02:49 -0400
X-MC-Unique: _6SAe04KNyuULr8ktd3SHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9877B802A6F;
	Mon, 15 Apr 2024 12:02:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 601F5C01594;
	Mon, 15 Apr 2024 12:02:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 10/23] media: atomisp: ov2722: Remove power on sensor from set_fmt() callback
Date: Mon, 15 Apr 2024 14:02:07 +0200
Message-ID: <20240415120220.219480-11-hdegoede@redhat.com>
In-Reply-To: <20240415120220.219480-1-hdegoede@redhat.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

The atomisp driver now properly ensures s_power(1) is called before calling
the set_fmt() callback, so this workaround is no longer necessary.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 12 ------------
 drivers/staging/media/atomisp/i2c/ov2722.h         |  1 -
 2 files changed, 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 133e346ae51b..d60630ea16df 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -528,9 +528,6 @@ static int power_up(struct v4l2_subdev *sd)
 		return -ENODEV;
 	}
 
-	if (dev->power_on == 1)
-		return 0; /* Already on */
-
 	/* power control */
 	ret = power_ctrl(sd, 1);
 	if (ret)
@@ -555,7 +552,6 @@ static int power_up(struct v4l2_subdev *sd)
 	/* according to DS, 20ms is needed between PWDN and i2c access */
 	msleep(20);
 
-	dev->power_on = 1;
 	return 0;
 
 fail_clk:
@@ -579,9 +575,6 @@ static int power_down(struct v4l2_subdev *sd)
 		return -ENODEV;
 	}
 
-	if (dev->power_on == 0)
-		return 0; /* Already off */
-
 	ret = dev->platform_data->flisclk_ctrl(sd, 0);
 	if (ret)
 		dev_err(&client->dev, "flisclk failed\n");
@@ -599,7 +592,6 @@ static int power_down(struct v4l2_subdev *sd)
 	if (ret)
 		dev_err(&client->dev, "vprog failed.\n");
 
-	dev->power_on = 0;
 	return ret;
 }
 
@@ -677,9 +669,6 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&dev->input_lock);
 
-	/* s_power has not been called yet for std v4l2 clients (camorama) */
-	power_up(sd);
-
 	dev->pixels_per_line = dev->res->pixels_per_line;
 	dev->lines_per_frame = dev->res->lines_per_frame;
 
@@ -978,7 +967,6 @@ static int ov2722_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	mutex_init(&dev->input_lock);
-	dev->power_on = -1;
 
 	dev->res = &ov2722_res_preview[0];
 	v4l2_i2c_subdev_init(&dev->sd, client, &ov2722_ops);
diff --git a/drivers/staging/media/atomisp/i2c/ov2722.h b/drivers/staging/media/atomisp/i2c/ov2722.h
index 640d3ffcaa5c..5920a4d45d06 100644
--- a/drivers/staging/media/atomisp/i2c/ov2722.h
+++ b/drivers/staging/media/atomisp/i2c/ov2722.h
@@ -198,7 +198,6 @@ struct ov2722_device {
 	struct ov2722_resolution *res;
 
 	struct camera_sensor_platform_data *platform_data;
-	int power_on;
 	u16 pixels_per_line;
 	u16 lines_per_frame;
 	u8 type;
-- 
2.44.0


