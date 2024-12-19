Return-Path: <linux-media+bounces-23794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 680679F7CB0
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 14:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65EF4189277A
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 13:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59B6225768;
	Thu, 19 Dec 2024 13:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g8hHSxkV"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9330B224AE2
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734616202; cv=none; b=ADH7YkQSkMCk2+hZwNbidklx2mDyIPhuJqtpMRh/4vJjdt30bUBV/B+MK1sXFtfdclyAvuI9GMMyYfigRY26h43uxGCOJTcolPY8SXtc9VYiuodG2o3xQXQPG775wL+wu3haV9BfmJkZCXiQn7MdXCEuO4sNAi9AqLPO8ILXuQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734616202; c=relaxed/simple;
	bh=3iRlFbw/K2s7a1bQ5oQPXGfheamMiCbkAKtqeGcyZX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L6RENNSL8OEAet5lmCm+ykKU/LBLNo3CWNtFu33no8GB+QlOran0LlqjEH1GXs2Bhx9spCDtpDKnaSnXe9oHIBdssknZyj29mForHm7n1VciP5/H3Il1jNzFxZF9Tu7y7thRG0gEeHG6QgpCiWecBw49glVngUhsIFO70gsSzp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g8hHSxkV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734616199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+TPNHDCY+ZVW1/YfFzlwJrNsMDY/FroqwNoqV41XJIs=;
	b=g8hHSxkVladEdXiJEDll3fXtZ2/xUGB6jeJjZ0AJZkE9u4FfLb5HmaY/YYnOXFj9Xlscc+
	30TOM/Cm5NC4S7WcmXMKXcBb73iF6KA+LXFryXdMO42YG8uRaHaeUvh/l+71gzBrkwJl/Q
	YH9LuJXj5nXt21EyYocZ0ycqbgQh7aU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-60-li8UEwV0PLuwVD-_A4bn5Q-1; Thu,
 19 Dec 2024 08:49:56 -0500
X-MC-Unique: li8UEwV0PLuwVD-_A4bn5Q-1
X-Mimecast-MFC-AGG-ID: li8UEwV0PLuwVD-_A4bn5Q
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BB39D1956048;
	Thu, 19 Dec 2024 13:49:54 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.60])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F223A1955F54;
	Thu, 19 Dec 2024 13:49:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 5/8] media: ov08x40: Move ov08x40_identify_module() function up
Date: Thu, 19 Dec 2024 14:49:37 +0100
Message-ID: <20241219134940.15472-6-hdegoede@redhat.com>
In-Reply-To: <20241219134940.15472-1-hdegoede@redhat.com>
References: <20241219134940.15472-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Move the ov08x40_identify_module() function to above ov08x40_set_stream()
this is a preparation patch for adding a missing ov08x40_identify_module()
call to ov08x40_set_stream().

No functional changes, just moving code around.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 52 ++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index de8291e8b6e7..44989a37c2f3 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1931,6 +1931,32 @@ static int ov08x40_stop_streaming(struct ov08x40 *ov08x)
 				 OV08X40_REG_VALUE_08BIT, OV08X40_MODE_STANDBY);
 }
 
+/* Verify chip ID */
+static int ov08x40_identify_module(struct ov08x40 *ov08x)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
+	int ret;
+	u32 val;
+
+	if (ov08x->identified)
+		return 0;
+
+	ret = ov08x40_read_reg(ov08x, OV08X40_REG_CHIP_ID,
+			       OV08X40_REG_VALUE_24BIT, &val);
+	if (ret)
+		return ret;
+
+	if (val != OV08X40_CHIP_ID) {
+		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
+			OV08X40_CHIP_ID, val);
+		return -ENXIO;
+	}
+
+	ov08x->identified = true;
+
+	return 0;
+}
+
 static int ov08x40_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov08x40 *ov08x = to_ov08x40(sd);
@@ -1968,32 +1994,6 @@ static int ov08x40_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-/* Verify chip ID */
-static int ov08x40_identify_module(struct ov08x40 *ov08x)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
-	int ret;
-	u32 val;
-
-	if (ov08x->identified)
-		return 0;
-
-	ret = ov08x40_read_reg(ov08x, OV08X40_REG_CHIP_ID,
-			       OV08X40_REG_VALUE_24BIT, &val);
-	if (ret)
-		return ret;
-
-	if (val != OV08X40_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
-			OV08X40_CHIP_ID, val);
-		return -ENXIO;
-	}
-
-	ov08x->identified = true;
-
-	return 0;
-}
-
 static const struct v4l2_subdev_video_ops ov08x40_video_ops = {
 	.s_stream = ov08x40_set_stream,
 };
-- 
2.47.1


