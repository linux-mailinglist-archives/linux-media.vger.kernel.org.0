Return-Path: <linux-media+bounces-32672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5BAABA9D3
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F26AE17F692
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928C71F8EEC;
	Sat, 17 May 2025 11:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UzA2sKlo"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6841F8723
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482160; cv=none; b=WEm3i88SbDwtYlwYbnguRW+OG7G1UTwTTZ58ISQar9vAi17S0CI6qefCSr1241y0M+AYoYCnQz5RHl/6vhd4YIv48/M14bwU+PXrEQziJ5CfKsyU01DUEUddNwoOfOB6OtQBV98IugcuAShI0vYF0tK2CzoTF0pcRaG2f0N0QLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482160; c=relaxed/simple;
	bh=y2+SS0m/6h4uliEu3TICp/VglwflA+Ark7SABvaBklY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m93IuNirCFLrAmTmg2OFw2Vmc/WLSczMK0KyqJj6LiuiulG4zYCgkzuQ9SsQaR06F3/o3dOYHpjIN5dDBYPsYjnJYXQeifZiRQBlIDZO56zfhSUBRZBGog6gpfgPIP+nHE2r3QaSu8R8Qjf/xH3E0c/xZ0gW4sftH53/kZ2Js1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UzA2sKlo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3oZz2CNPekrwQLZNXPElONMEEapACsiPI8Z3R05XgA=;
	b=UzA2sKloIu9/ccI3AMlPk5EKFLXPEdvlO7AYX2+ViIKwMuHEjXtJCa2cytD1xuhWQmFw7M
	mzv+O0DH3lgvJJ9mSV0/8+x3v/dca/hQ4rhjt6EJBb3e/wBAnA7OzrhF8DRQ6KD62j3R6l
	STZZint4Sbf/il7G+aCtGIGBJNR0y6g=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-38-xV2eWLnmN5Gi8zXG2G2gqw-1; Sat,
 17 May 2025 07:42:33 -0400
X-MC-Unique: xV2eWLnmN5Gi8zXG2G2gqw-1
X-Mimecast-MFC-AGG-ID: xV2eWLnmN5Gi8zXG2G2gqw_1747482152
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C40BD18004AD;
	Sat, 17 May 2025 11:42:32 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6A320180045B;
	Sat, 17 May 2025 11:42:28 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 14/23] media: atomisp: gc0310: Switch to {enable,disable}_streams
Date: Sat, 17 May 2025 13:40:57 +0200
Message-ID: <20250517114106.43494-15-hdegoede@redhat.com>
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Switch from s_stream() to enable_streams() and disable_streams() pad
operations. They are preferred and required for streams support.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 94 +++++++++++--------
 1 file changed, 54 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 948579c0373d..5d25be0f4cf4 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -473,58 +473,70 @@ static int gc0310_detect(struct gc0310_device *sensor)
 	return 0;
 }
 
-static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
+static int gc0310_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 u32 pad, u64 streams_mask)
+{
+	struct gc0310_device *sensor = to_gc0310_sensor(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	int ret;
+
+	mutex_lock(&sensor->input_lock);
+
+	ret = pm_runtime_get_sync(&client->dev);
+	if (ret)
+		goto error_power_down;
+
+	ret = regmap_multi_reg_write(sensor->regmap,
+				     gc0310_reset_register,
+				     ARRAY_SIZE(gc0310_reset_register));
+	if (ret)
+		goto error_power_down;
+
+	ret = regmap_multi_reg_write(sensor->regmap,
+				     gc0310_VGA_30fps,
+				     ARRAY_SIZE(gc0310_VGA_30fps));
+	if (ret)
+		goto error_power_down;
+
+	/* restore value of all ctrls */
+	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
+
+	/* enable per frame MIPI and sensor ctrl reset  */
+	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG, 0x30, &ret);
+
+	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
+		  GC0310_REGISTER_PAGE_3, &ret);
+	cci_write(sensor->regmap, GC0310_SW_STREAM_REG,
+		  GC0310_START_STREAMING, &ret);
+	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
+		  GC0310_REGISTER_PAGE_0, &ret);
+
+error_power_down:
+	if (ret)
+		pm_runtime_put(&client->dev);
+
+	mutex_unlock(&sensor->input_lock);
+	return ret;
+}
+
+static int gc0310_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
 {
 	struct gc0310_device *sensor = to_gc0310_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	dev_dbg(&client->dev, "%s S enable=%d\n", __func__, enable);
 	mutex_lock(&sensor->input_lock);
 
-	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0)
-			goto error_power_down;
-
-		ret = regmap_multi_reg_write(sensor->regmap,
-					     gc0310_reset_register,
-					     ARRAY_SIZE(gc0310_reset_register));
-		if (ret)
-			goto error_power_down;
-
-		ret = regmap_multi_reg_write(sensor->regmap,
-					     gc0310_VGA_30fps,
-					     ARRAY_SIZE(gc0310_VGA_30fps));
-		if (ret)
-			goto error_power_down;
-
-		/* restore value of all ctrls */
-		ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
-		if (ret)
-			goto error_power_down;
-
-		/* enable per frame MIPI and sensor ctrl reset  */
-		cci_write(sensor->regmap, GC0310_RESET_RELATED_REG, 0x30, &ret);
-	}
-
 	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
 		  GC0310_REGISTER_PAGE_3, &ret);
 	cci_write(sensor->regmap, GC0310_SW_STREAM_REG,
-		  enable ? GC0310_START_STREAMING : GC0310_STOP_STREAMING,
-		  &ret);
+		  GC0310_STOP_STREAMING, &ret);
 	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
 		  GC0310_REGISTER_PAGE_0, &ret);
-	if (ret)
-		goto error_power_down;
 
-	if (!enable)
-		pm_runtime_put(&client->dev);
-
-	mutex_unlock(&sensor->input_lock);
-	return 0;
-
-error_power_down:
 	pm_runtime_put(&client->dev);
 	mutex_unlock(&sensor->input_lock);
 	return ret;
@@ -586,7 +598,7 @@ static const struct v4l2_subdev_sensor_ops gc0310_sensor_ops = {
 };
 
 static const struct v4l2_subdev_video_ops gc0310_video_ops = {
-	.s_stream = gc0310_s_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
@@ -597,6 +609,8 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
 	.get_selection = gc0310_get_selection,
 	.set_selection = gc0310_set_selection,
 	.get_frame_interval = gc0310_get_frame_interval,
+	.enable_streams = gc0310_enable_streams,
+	.disable_streams = gc0310_disable_streams,
 };
 
 static const struct v4l2_subdev_ops gc0310_ops = {
-- 
2.49.0


