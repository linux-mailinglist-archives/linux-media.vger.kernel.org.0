Return-Path: <linux-media+bounces-28165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF92A5FFC7
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 19:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DDBC3B7570
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 18:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1AA1F03EE;
	Thu, 13 Mar 2025 18:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FN5qFqyi"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9541DB54C
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 18:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741891441; cv=none; b=nEpwiZuEsp/Gggrkk1+5/DjuVTKuzxqgJUXfEYmznIov4uO+rCi0kflBtKb85YjOVNVY51rPCrgDqQd0BAg2UPJT+uBWU4fXVJgWlulIoBybbaKOj8oEhtQNOe3RzCfeS/WO8ahvKtyrwJioaTRYI+WsVKlZdpNES7sv77bPEVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741891441; c=relaxed/simple;
	bh=DIyGsatYkhoePTrU7WidzwRugLZOZ3AE05ZtLutDKxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dcbHGaZEu+AI7Fc2f0E+h+5NW7WM1GBh+ni+6Lr9r6+etQY4H4i0N24W8UNvXRWaDoGTNEoiaVHZd2Uwl5LrQLCT/3L8m2qPpIz2Rwne/m78FoIgErqYlXKwzXjUx5pdGNFanA9fITj4jBfYVodp9OXYqzEwfXKla1Fm9/yPwP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FN5qFqyi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741891439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wKcsmW384YnM7IYtDAT4hSYR7b+myO/wAdDVChhWqwo=;
	b=FN5qFqyibVpstzetdKinZTX18pOHsId9vs5N2zGJpE4dvQt3tJNm34MbZbPo3djy5zVO4W
	3bMFgJEr/FplKq5ZBfOyyg3Et+jl+PFYIwouTRVlSerlnd73bsTredb5CJpXcZP5Kr1vv/
	G0hSB2/I1CvrH3U/9IUco4whcgsWM54=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-599-cA5W91IBN5mtZMQqq3pVLQ-1; Thu,
 13 Mar 2025 14:43:55 -0400
X-MC-Unique: cA5W91IBN5mtZMQqq3pVLQ-1
X-Mimecast-MFC-AGG-ID: cA5W91IBN5mtZMQqq3pVLQ_1741891434
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2B5D1180AF4E;
	Thu, 13 Mar 2025 18:43:54 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 47EFD3003770;
	Thu, 13 Mar 2025 18:43:51 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Ingvar Hagelund <ingvar@redpill-linpro.com>,
	Joachim Reichel <joachim.reichel@posteo.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hao Yao <hao.yao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v8 10/14] media: ov02c10: ov02c10_get_pm_resources() fixes
Date: Thu, 13 Mar 2025 19:43:10 +0100
Message-ID: <20250313184314.91410-11-hdegoede@redhat.com>
In-Reply-To: <20250313184314.91410-1-hdegoede@redhat.com>
References: <20250313184314.91410-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

A set of ov02c10_get_pm_resources() fixes:

1. Reset should only be de-asserted after enabling the regulators and
   clocks. Request the reset GPIO with GPIOD_OUT_HIGH and on success
   sleep for 1 ms to ensure that it is asserted for at least 1 ms
   before ov02c10_power_on() de-asserts it.

2. Use plain devm_regulator_get() for avdd.

3. Add error checking to the ov02c10_get_pm_resources() call in probe(),
   it may fail with -EPROBE_DEFER.

4. While at it move the v4l2_i2c_subdev_init() call to directly after
   allocating the ov02c10 struct, it has nothing to do with
   the ov02c10_get_pm_resources() call.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov02c10.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 38918b1b6a95..a46cacf301a2 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -642,26 +642,23 @@ static int ov02c10_get_pm_resources(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
-	int ret;
 
-	ov02c10->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	ov02c10->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ov02c10->reset))
 		return dev_err_probe(dev, PTR_ERR(ov02c10->reset),
 				     "failed to get reset gpio\n");
+	if (ov02c10->reset)
+		fsleep(1000);
 
 	ov02c10->img_clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(ov02c10->img_clk))
 		return dev_err_probe(dev, PTR_ERR(ov02c10->img_clk),
 				     "failed to get imaging clock\n");
 
-	ov02c10->avdd = devm_regulator_get_optional(dev, "avdd");
-	if (IS_ERR(ov02c10->avdd)) {
-		ret = PTR_ERR(ov02c10->avdd);
-		ov02c10->avdd = NULL;
-		if (ret != -ENODEV)
-			return dev_err_probe(dev, ret,
-					     "failed to get avdd regulator\n");
-	}
+	ov02c10->avdd = devm_regulator_get(dev, "avdd");
+	if (IS_ERR(ov02c10->avdd))
+		return dev_err_probe(dev, PTR_ERR(ov02c10->avdd),
+				     "failed to get avdd regulator\n");
 
 	return 0;
 }
@@ -966,13 +963,16 @@ static int ov02c10_probe(struct i2c_client *client)
 	if (!ov02c10)
 		return -ENOMEM;
 
+	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
+
 	/* Check HW config */
 	ret = ov02c10_check_hwcfg(&client->dev, ov02c10);
 	if (ret)
 		return ret;
 
-	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
-	ov02c10_get_pm_resources(&client->dev);
+	ret = ov02c10_get_pm_resources(&client->dev);
+	if (ret)
+		return ret;
 
 	ov02c10->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(ov02c10->regmap))
-- 
2.48.1


