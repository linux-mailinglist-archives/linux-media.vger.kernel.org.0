Return-Path: <linux-media+bounces-23933-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BD19F94AE
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C569B188D6A7
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B1C2185B9;
	Fri, 20 Dec 2024 14:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R31kp4gy"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214FF2185AB
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705717; cv=none; b=dkocARDim2DKX84BIWGL2uR1H97rkgIr//xYdYFCrXbyql3dUj74gYpj3BbmPdxhLpEFqTjLbMfTZ2GxAaDDf7ze4gIITeHamv2GnlfKNkRaZuO6aSlphHWLT8gW0go6DpZvlW9zqKo1KfwTqNeAkJ4FmZezWgBXMlAz7whCxf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705717; c=relaxed/simple;
	bh=8g09XRDrXuskXVhXYN7OYwMlRP8DlMu2B8V9krpvMes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LWE/WqYz08bUbPURhvIS8+hcxVwDIJUr3vHoWDmjWNXxwcrDrn5aQsg1QiPdKUEoFxLrdU7J5EJ9sD85zbYxSEgWtAzJ2427r8zToczGaUgXyy4SXNEYjajW+MsN6dVLlprhp7upF1Ihnkm1UNze7W2c37N8RyYmwMFH2QxGva4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R31kp4gy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734705715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kOAnJ3lAQa1ZvTyqtV59EyW4XdbH3Q44RLq9wAYaU6I=;
	b=R31kp4gyuT/577NnSQbRszwKACBx8NMB+Vun+cNQrxDYfuWDIqF99irT0AWs2eroJYvfsS
	WhXqDeljscs6cFi3TbR+mADgD+Hp04qFvc6w7cdKeNG5FRRxn7K4RtPK0Tiys0iegFGAk7
	tzDahqYv1ZbyUf302Xkj8+i03NdITjI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102-BgjDsAPaP_SSNywf0ZOMEg-1; Fri,
 20 Dec 2024 09:41:53 -0500
X-MC-Unique: BgjDsAPaP_SSNywf0ZOMEg-1
X-Mimecast-MFC-AGG-ID: BgjDsAPaP_SSNywf0ZOMEg
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5B63A19560B4;
	Fri, 20 Dec 2024 14:41:52 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.74])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9943B19560AD;
	Fri, 20 Dec 2024 14:41:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 05/10] media: ov08x40: Move ov08x40_identify_module() function up
Date: Fri, 20 Dec 2024 15:41:25 +0100
Message-ID: <20241220144130.66765-6-hdegoede@redhat.com>
In-Reply-To: <20241220144130.66765-1-hdegoede@redhat.com>
References: <20241220144130.66765-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Move the ov08x40_identify_module() function to above ov08x40_set_stream()
this is a preparation patch for adding a missing ov08x40_identify_module()
call to ov08x40_set_stream().

No functional changes, just moving code around.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 52 ++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index a01c5333ce6e..8d683af54d35 100644
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


