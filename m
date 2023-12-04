Return-Path: <linux-media+bounces-1548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37302803330
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E11181F2108B
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 12:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8379C24217;
	Mon,  4 Dec 2023 12:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fkaVf1SO"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90D5101
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 04:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701693602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2fVyd13P6go/xwzfiJa4aRN0zdl8tV/jDQrINzRwPvk=;
	b=fkaVf1SODjWN0b7iUp4fuSaWhTAaM/OUcI3T3A9taov80CEDEboQH2+ai/SBB4o+px2YeB
	hHy0lihRhfHkbURgt0RuOE9x7jr+0iwqX/7noA4I4KjwYPFq0KTVVaMK2Mi+i7F1sOL9se
	a2NUIvnB3w1ykm3etzmR8wRB0BdY0+Q=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-335-TVohPLeZMCmRyHtabEELmw-1; Mon,
 04 Dec 2023 07:39:58 -0500
X-MC-Unique: TVohPLeZMCmRyHtabEELmw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8987038035B1;
	Mon,  4 Dec 2023 12:39:58 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.73])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5115940C6EB9;
	Mon,  4 Dec 2023 12:39:57 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v4 6/9] media: ov2740: Check hwcfg after allocating the ov2740 struct
Date: Mon,  4 Dec 2023 13:39:43 +0100
Message-ID: <20231204123947.5754-7-hdegoede@redhat.com>
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

Alloc ov2740_data and set up the drvdata pointer before calling
ov2740_check_hwcfg().

This is a preparation patch to allow ov2740_check_hwcfg()
to store some of the parsed data in the ov2740 struct.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 759e91f4169b..54e6f62414ff 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1098,14 +1098,17 @@ static int ov2740_probe(struct i2c_client *client)
 	bool full_power;
 	int ret;
 
-	ret = ov2740_check_hwcfg(&client->dev);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to check HW configuration\n");
-
 	ov2740 = devm_kzalloc(&client->dev, sizeof(*ov2740), GFP_KERNEL);
 	if (!ov2740)
 		return -ENOMEM;
 
+	v4l2_i2c_subdev_init(&ov2740->sd, client, &ov2740_subdev_ops);
+	ov2740->sd.internal_ops = &ov2740_internal_ops;
+
+	ret = ov2740_check_hwcfg(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to check HW configuration\n");
+
 	ov2740->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ov2740->reset_gpio))
 		return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
@@ -1116,8 +1119,6 @@ static int ov2740_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(ov2740->clk),
 				     "failed to get clock\n");
 
-	v4l2_i2c_subdev_init(&ov2740->sd, client, &ov2740_subdev_ops);
-	ov2740->sd.internal_ops = &ov2740_internal_ops;
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
 		/* ACPI does not always clear the reset GPIO / enable the clock */
-- 
2.43.0


