Return-Path: <linux-media+bounces-28166-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D628A5FFCD
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 19:44:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A66D53BC30F
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 18:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670C81EFFB8;
	Thu, 13 Mar 2025 18:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OBQUYpup"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323211EFF9F
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 18:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741891447; cv=none; b=W8TbDucPHouVh2AjP+eUE1KC0jxbzuyEts0IqFrPE5P8P4kLFKElHAzbjaPsCbwqkvow0Niv94QDA5Jko+brT0o4YdwemXxQCI29iCDQejdApTpfikO60X06VtXrk4e9zUODbbeWBsJyXcYnaZMY11+booTkus0jgeyWKURXfZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741891447; c=relaxed/simple;
	bh=edr9iy2A8cylz/h/xCNd3QjoCQ37pNqgk4oblataiws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OkMxhNfEYCm0l9ml8a5lhng4LGQXWE++NQvyHQdl6ZS/HjvDYblQMEXzFWuI/3Y1OyAeUgLfCPa+qK08zzVHUTrCwC6bLWM55Tb8mSkk7FpeDmYMW+OeRpdS1VRoJvurOyG/gCQYXyQnLvdTwIbS52C9AHEkXbDHc/agtO0s08M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OBQUYpup; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741891441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=36Ck9jMgE/IDvdowq/TfUWiiXsumgSZZiybTXurn5AQ=;
	b=OBQUYpupJ6IP9AOEkInjsGt2z/cpiCApJld39m33B7PbzagSLv6CuyAXe8TcWr9VdcOLke
	v6pqgd7gnFRrpIzfW1a8sQnypwrkPqaynvnhhDCpySKG0Gl7OaxrMXxHtsL1aTUrAZ3zvg
	SlggKfhJDqTlmb7gjsQwpYQ9N1aaW5U=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-393-zHLZrfbMMwugW1WfrT9SSw-1; Thu,
 13 Mar 2025 14:43:59 -0400
X-MC-Unique: zHLZrfbMMwugW1WfrT9SSw-1
X-Mimecast-MFC-AGG-ID: zHLZrfbMMwugW1WfrT9SSw_1741891437
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7EA2D19560AB;
	Thu, 13 Mar 2025 18:43:57 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9A205300376F;
	Thu, 13 Mar 2025 18:43:54 +0000 (UTC)
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
Subject: [PATCH v8 11/14] media: ov02c10: Switch to {enable,disable}_streams
Date: Thu, 13 Mar 2025 19:43:11 +0100
Message-ID: <20250313184314.91410-12-hdegoede@redhat.com>
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

Switch from s_stream() to enable_streams() and disable_streams() pad
operations. They are preferred and required for streams support.

Note this also stops calling ov02c10_stop_streaming() on enable_streams()
errors. If ov02c10_start_streaming() fails OV02C10_REG_STREAM_CONTROL bit 0
will have never been set so there is no need to clear it on errors.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov02c10.c | 59 +++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index a46cacf301a2..da727e18a282 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2022 Intel Corporation.
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -602,41 +603,45 @@ static void ov02c10_stop_streaming(struct ov02c10 *ov02c10)
 	cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
 }
 
-static int ov02c10_set_stream(struct v4l2_subdev *sd, int enable)
+static int ov02c10_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
 {
-	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret = 0;
+	struct ov02c10 *ov02c10 = to_ov02c10(sd);
+	int ret;
 
-	if (ov02c10->streaming == enable)
-		return 0;
+	guard(mutex)(&ov02c10->mutex);
 
-	mutex_lock(&ov02c10->mutex);
-	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
-			mutex_unlock(&ov02c10->mutex);
-			return ret;
-		}
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret)
+		return ret;
 
-		ret = ov02c10_start_streaming(ov02c10);
-		if (ret) {
-			enable = 0;
-			ov02c10_stop_streaming(ov02c10);
-			pm_runtime_put(&client->dev);
-		}
-	} else {
-		ov02c10_stop_streaming(ov02c10);
+	ret = ov02c10_start_streaming(ov02c10);
+	if (ret == 0)
+		ov02c10->streaming = true;
+	else
 		pm_runtime_put(&client->dev);
-	}
-
-	ov02c10->streaming = enable;
-	mutex_unlock(&ov02c10->mutex);
 
 	return ret;
 }
 
+static int ov02c10_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   u32 pad, u64 streams_mask)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ov02c10 *ov02c10 = to_ov02c10(sd);
+
+	guard(mutex)(&ov02c10->mutex);
+
+	ov02c10_stop_streaming(ov02c10);
+	ov02c10->streaming = false;
+	pm_runtime_put(&client->dev);
+
+	return 0;
+}
+
 /* This function tries to get power control resources */
 static int ov02c10_get_pm_resources(struct device *dev)
 {
@@ -836,7 +841,7 @@ static int ov02c10_init_state(struct v4l2_subdev *sd,
 }
 
 static const struct v4l2_subdev_video_ops ov02c10_video_ops = {
-	.s_stream = ov02c10_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops ov02c10_pad_ops = {
@@ -844,6 +849,8 @@ static const struct v4l2_subdev_pad_ops ov02c10_pad_ops = {
 	.get_fmt = ov02c10_get_format,
 	.enum_mbus_code = ov02c10_enum_mbus_code,
 	.enum_frame_size = ov02c10_enum_frame_size,
+	.enable_streams = ov02c10_enable_streams,
+	.disable_streams = ov02c10_disable_streams,
 };
 
 static const struct v4l2_subdev_ops ov02c10_subdev_ops = {
-- 
2.48.1


