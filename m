Return-Path: <linux-media+bounces-28167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A4FA5FFCF
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 19:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7DE21755D4
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 18:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0381F03E5;
	Thu, 13 Mar 2025 18:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NzEdtQTI"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE94E1DB54C
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 18:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741891448; cv=none; b=NLgCzh5IGFzvuwYcFCQSiap4SNRDu1xUDIbM5y6f8jihEcv6hBDcDs8AdMl8WWT2rSf+1CNQB0UdKxfDAHRKju9f8b81q10LeRYYtDbMWxnL4SmyveUwMAOF5ZGbpyJUWiqFhKXokVR4ttQV0ddHWW0ch0ZWP6u00Bz39NFQJTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741891448; c=relaxed/simple;
	bh=XWTQrdQdiC78UysD6Ih5Rqa7iOi4/ORYBzSgZ9QUt2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HuGGeOQ0mvwhhnFl6Y1XQPN/0K57ZqhkeWAnsc4ICzGO0XOp08u1hnnrJzcs9RkLyeKKcrkFGb0tmHo8skWBSS21leS1yM90NoSHRTg+wAbvicIF5DGozn6XYsTi73nb5XFIZMprMNp9NZ+ZczsgZhERPVFKxQoYz9cRcngSLgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NzEdtQTI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741891445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dyB8Mqumd9azPLY1PP1PR8hLAUSxfSze7YPjDN5OZkc=;
	b=NzEdtQTIBLDIfC/BR+TmJvQcH8dKHmoHKd6NulkZhXmNlM8KDB2WWz4EowiQh5wBsnoIfu
	xsMhd27Usxn/RCHmRezsJK+RhOJYUundqdoZWijSx46Hm/m/oaLB3cZEYnkL8P4Hokovml
	dyo9LvewhbrOukSH1/xGlvUir0BLmjE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-264-uzG_xOxxP1mzweEo8Gi8qg-1; Thu,
 13 Mar 2025 14:44:02 -0400
X-MC-Unique: uzG_xOxxP1mzweEo8Gi8qg-1
X-Mimecast-MFC-AGG-ID: uzG_xOxxP1mzweEo8Gi8qg_1741891441
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D168718001FA;
	Thu, 13 Mar 2025 18:44:00 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ED334300376F;
	Thu, 13 Mar 2025 18:43:57 +0000 (UTC)
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
Subject: [PATCH v8 12/14] media: ov02c10: Drop system suspend and resume handlers
Date: Thu, 13 Mar 2025 19:43:12 +0100
Message-ID: <20250313184314.91410-13-hdegoede@redhat.com>
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

Stopping streaming on a camera pipeline at system suspend time, and
restarting it at system resume time, requires coordinated action between
the bridge driver and the camera sensor driver. This is handled by the
bridge driver calling the sensor's .s_stream() handler at system suspend
and resume time. There is thus no need for the sensor to independently
implement system sleep PM operations. Drop them.

The streaming field of the driver's private structure is now unused,
drop it as well.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov02c10.c | 53 +++----------------------------------
 1 file changed, 4 insertions(+), 49 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index da727e18a282..09e70ffcf07a 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -393,9 +393,6 @@ struct ov02c10 {
 	/* MIPI lane info */
 	u32 link_freq_index;
 	u8 mipi_lanes;
-
-	/* Streaming on/off */
-	bool streaming;
 };
 
 static inline struct ov02c10 *to_ov02c10(struct v4l2_subdev *subdev)
@@ -618,9 +615,7 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
 		return ret;
 
 	ret = ov02c10_start_streaming(ov02c10);
-	if (ret == 0)
-		ov02c10->streaming = true;
-	else
+	if (ret)
 		pm_runtime_put(&client->dev);
 
 	return ret;
@@ -636,7 +631,6 @@ static int ov02c10_disable_streams(struct v4l2_subdev *sd,
 	guard(mutex)(&ov02c10->mutex);
 
 	ov02c10_stop_streaming(ov02c10);
-	ov02c10->streaming = false;
 	pm_runtime_put(&client->dev);
 
 	return 0;
@@ -711,43 +705,6 @@ static int ov02c10_power_on(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ov02c10_suspend(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov02c10 *ov02c10 = to_ov02c10(sd);
-
-	mutex_lock(&ov02c10->mutex);
-	if (ov02c10->streaming)
-		ov02c10_stop_streaming(ov02c10);
-
-	mutex_unlock(&ov02c10->mutex);
-
-	return 0;
-}
-
-static int __maybe_unused ov02c10_resume(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov02c10 *ov02c10 = to_ov02c10(sd);
-	int ret = 0;
-
-	mutex_lock(&ov02c10->mutex);
-	if (!ov02c10->streaming)
-		goto exit;
-
-	ret = ov02c10_start_streaming(ov02c10);
-	if (ret) {
-		ov02c10->streaming = false;
-		ov02c10_stop_streaming(ov02c10);
-	}
-
-exit:
-	mutex_unlock(&ov02c10->mutex);
-	return ret;
-}
-
 static int ov02c10_set_format(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *sd_state,
 			      struct v4l2_subdev_format *fmt)
@@ -1047,10 +1004,8 @@ static int ov02c10_probe(struct i2c_client *client)
 	return ret;
 }
 
-static const struct dev_pm_ops ov02c10_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ov02c10_suspend, ov02c10_resume)
-	SET_RUNTIME_PM_OPS(ov02c10_power_off, ov02c10_power_on, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(ov02c10_pm_ops, ov02c10_power_off,
+				 ov02c10_power_on, NULL);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov02c10_acpi_ids[] = {
@@ -1064,7 +1019,7 @@ MODULE_DEVICE_TABLE(acpi, ov02c10_acpi_ids);
 static struct i2c_driver ov02c10_i2c_driver = {
 	.driver = {
 		.name = "ov02c10",
-		.pm = &ov02c10_pm_ops,
+		.pm = pm_sleep_ptr(&ov02c10_pm_ops),
 		.acpi_match_table = ACPI_PTR(ov02c10_acpi_ids),
 	},
 	.probe = ov02c10_probe,
-- 
2.48.1


