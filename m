Return-Path: <linux-media+bounces-28162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B17A5FFBE
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 19:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6673719C0840
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 18:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB911EFF9F;
	Thu, 13 Mar 2025 18:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZP8WsYtW"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3FF1EEA51
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 18:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741891429; cv=none; b=F9kSd76z4l1OsXGBSDk+c0aq8qYNQfft4KUOf4D1m0R5hqiSwofh+q0rn09lcBijUqn2ed7EPWeSQN/59c4wP+cbVlpocRYFFLGcRBcfAgf9oqi+VFAcrd/fungqDplVxSV0vndLameJiUIO33/XuvL1bt4xTEiPd1Bie+f4T+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741891429; c=relaxed/simple;
	bh=Ic1kKssEI0uaaEraaU6gsgRVC3jZNN3pJZDwTqt1uIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aaQH36eBifVRG6PbYvUM8lb70TIXsfHYFYwkX++xLMd6MkYnsa7G774IgwIVqqtfTCbQBgMiu9dK6KuDsslqsO8W30uh4QfLvZAQHzwE7NTSvFTOGFTKMcsT28l32gBWE5BIRdbVQBl/WkbVUwwc5JoIcBudpyrvokQnpfPqHIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZP8WsYtW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741891427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bD+mqbgkHA0PlnzJdZdo2V3QIhUAmxPfhQd5ON0+tGI=;
	b=ZP8WsYtWTsrlC7FFtNkGOt13Lh/+SBHBaML52Y6O/6+v8HTjyRJERWHiRBmh+R1Q7TwZUy
	tgIaaZf+j12etMTsG165hQ2ecRacTtXRPj2w9EKGFxdQ5qzWSP3h2VjODpTbuIPLfZ4Kjd
	xJNsL57uRkIAKkC+PTWmXHb4Zo+ZgxI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-120-f15o8LhFP5mqXObQEeQk_w-1; Thu,
 13 Mar 2025 14:43:45 -0400
X-MC-Unique: f15o8LhFP5mqXObQEeQk_w-1
X-Mimecast-MFC-AGG-ID: f15o8LhFP5mqXObQEeQk_w_1741891424
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 25C161956046;
	Thu, 13 Mar 2025 18:43:44 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 434A5300376F;
	Thu, 13 Mar 2025 18:43:41 +0000 (UTC)
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
Subject: [PATCH v8 07/14] media: ov02c10: CCI usage fixes
Date: Thu, 13 Mar 2025 19:43:07 +0100
Message-ID: <20250313184314.91410-8-hdegoede@redhat.com>
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

Several fixes to ov02c10's usage of the CCI helpers:
- Fix indentation of some cci_*() calls
- Make sure logged register writing errors end with '\n'
- CCI functions already log errors themselves, drop error
  logging for them
- CCI functions being passed &ret as last argument can be chained
  without need to check ret in between, if ret != 0 then the next
  CCI call(s) will be a no-op
- err/&ret argument passed to cci_*() functions should be signed
- Move devm_cci_regmap_init_i2c() to ov02c10_probe() and add error check

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov02c10.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index a6ea747243e6..b9f28368e29f 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -423,16 +423,12 @@ static int ov02c10_test_pattern(struct ov02c10 *ov02c10, int pattern)
 
 	if (!pattern)
 		return cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
-			BIT(7), 0, NULL);
+				       BIT(7), 0, NULL);
 
 	cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
 			0x03, pattern - 1, &ret);
-	if (ret)
-		return ret;
-
 	cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
 			BIT(7), OV02C10_TEST_PATTERN_ENABLE, &ret);
-
 	return ret;
 }
 
@@ -590,7 +586,7 @@ static int ov02c10_start_streaming(struct ov02c10 *ov02c10)
 	ret = regmap_multi_reg_write(ov02c10->regmap,
 				     reg_sequence, sequence_length);
 	if (ret) {
-		dev_err(&client->dev, "failed to set mode");
+		dev_err(&client->dev, "failed to set mode\n");
 		return ret;
 	}
 
@@ -607,21 +603,12 @@ static int ov02c10_start_streaming(struct ov02c10 *ov02c10)
 	if (ret)
 		return ret;
 
-	ret = cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 1, NULL);
-	if (ret)
-		dev_err(&client->dev, "failed to start streaming");
-
-	return ret;
+	return cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 1, NULL);
 }
 
 static void ov02c10_stop_streaming(struct ov02c10 *ov02c10)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov02c10->sd);
-	int ret = 0;
-
-	ret = cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
-	if (ret)
-		dev_err(&client->dev, "failed to stop streaming");
+	cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
 }
 
 static int ov02c10_set_stream(struct v4l2_subdev *sd, int enable)
@@ -900,10 +887,9 @@ static int ov02c10_identify_module(struct ov02c10 *ov02c10)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov02c10->sd);
 	u64 chip_id;
-	u32 ret = 0;
+	int ret;
 
-	ov02c10->regmap = devm_cci_regmap_init_i2c(client, 16);
-	cci_read(ov02c10->regmap, OV02C10_REG_CHIP_ID, &chip_id, &ret);
+	ret = cci_read(ov02c10->regmap, OV02C10_REG_CHIP_ID, &chip_id, NULL);
 	if (ret)
 		return ret;
 
@@ -1009,6 +995,10 @@ static int ov02c10_probe(struct i2c_client *client)
 	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
 	ov02c10_get_pm_resources(&client->dev);
 
+	ov02c10->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(ov02c10->regmap))
+		return PTR_ERR(ov02c10->regmap);
+
 	ret = ov02c10_power_on(&client->dev);
 	if (ret) {
 		dev_err_probe(&client->dev, ret, "failed to power on\n");
-- 
2.48.1


