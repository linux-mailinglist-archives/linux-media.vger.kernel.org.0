Return-Path: <linux-media+bounces-1203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAE27FB688
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B7451C210CC
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314974C3AB;
	Tue, 28 Nov 2023 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dFa1IbAm"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5E35113
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 02:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701165664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oabumjFAtVAUuxFamlzljfkfhYoPF9c8RqQAIOinOYw=;
	b=dFa1IbAmmSEd+nfr7qLVZlTWW7UXXX6abeEiv3H8ztV7HG7jSJDiXIx+9MnztCRG5sbVyz
	/RVs9OF4nsc1O7paPm4oY3j4NpcMQ31nukZ0PgWpN/kH0xe+WGik1Mtgt+UkeQEbFc8IR9
	zZDaD5GutH7jbx29oUQQwd2ySlId+bc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-7Eq7U-BzP6mE5MLqmwCouA-1; Tue,
 28 Nov 2023 05:01:02 -0500
X-MC-Unique: 7Eq7U-BzP6mE5MLqmwCouA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91FF03C0DF70;
	Tue, 28 Nov 2023 10:01:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.244])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53EAB20268D7;
	Tue, 28 Nov 2023 10:01:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 6/9] media: ov2740: Check hwcfg after allocating the ov2740 struct
Date: Tue, 28 Nov 2023 11:00:44 +0100
Message-ID: <20231128100047.17529-7-hdegoede@redhat.com>
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

Alloc ov2740_data and set up the drvdata pointer before calling
ov2740_check_hwcfg().

This is a preparation patch to allow ov2740_check_hwcfg()
to store some of the parsed data in the ov2740 struct.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index a646be427ab2..28f4659a6bfb 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1095,14 +1095,16 @@ static int ov2740_probe(struct i2c_client *client)
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
+
+	ret = ov2740_check_hwcfg(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to check HW configuration\n");
+
 	ov2740->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ov2740->reset_gpio))
 		return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
@@ -1113,7 +1115,6 @@ static int ov2740_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(ov2740->clk),
 				     "failed to get clock\n");
 
-	v4l2_i2c_subdev_init(&ov2740->sd, client, &ov2740_subdev_ops);
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
 		/* ACPI does not always clear the reset GPIO / enable the clock */
-- 
2.41.0


