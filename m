Return-Path: <linux-media+bounces-1045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E2A7F92FD
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 15:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4308F1C2097C
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 14:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19F9DDA0;
	Sun, 26 Nov 2023 14:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RLChlKLq"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4D093
	for <linux-media@vger.kernel.org>; Sun, 26 Nov 2023 06:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701008135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RiNyucctcqnwWpn5JEuFXd/g8Z2Zv1DXZzykJQFJLvg=;
	b=RLChlKLqZ/1UvHXhhLK4qAVc/7KkaFGdraVaYczsTOXXb6Zz8Ug8AnaZtlUmY77SWAgsdo
	NFcOjljfVCdCjTeUdS/WiIln1kUYxxAeoc+eHyInSUPoGhPLZ/EfPtcuTMDuHqxeBAeago
	7wx+j+ElESlLphD+1imsnJROC8155GU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-UU784M-UNguzOYPp33BD8g-1; Sun, 26 Nov 2023 09:15:31 -0500
X-MC-Unique: UU784M-UNguzOYPp33BD8g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6892F856F60;
	Sun, 26 Nov 2023 14:15:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 722442026D33;
	Sun, 26 Nov 2023 14:15:30 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 6/9] media: ov2740: Check hwcfg after allocating the ov2740 struct
Date: Sun, 26 Nov 2023 15:15:14 +0100
Message-ID: <20231126141517.7534-7-hdegoede@redhat.com>
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

Alloc ov2740_data and set up the drvdata pointer before calling
ov2740_check_hwcfg().

This is a preparation patch to allow ov2740_check_hwcfg()
to store some of the parsed data in the ov2740 struct.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov2740.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 14a90dcf0199..3ee907bcebbf 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1091,14 +1091,16 @@ static int ov2740_probe(struct i2c_client *client)
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
@@ -1109,7 +1111,6 @@ static int ov2740_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(ov2740->clk),
 				     "failed to get clock\n");
 
-	v4l2_i2c_subdev_init(&ov2740->sd, client, &ov2740_subdev_ops);
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
 		/* ACPI does not always clear the reset GPIO / enable the clock */
-- 
2.41.0


