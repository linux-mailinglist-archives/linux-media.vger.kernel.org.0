Return-Path: <linux-media+bounces-32667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F35ABA9CE
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42D6317F948
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B43E1F8744;
	Sat, 17 May 2025 11:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gXWmEvBY"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6870B1DED57
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482135; cv=none; b=FFitTyNL1T1IbMA+8g6ATbG93qrcBS4XLYlyqa7uMuUwxJ2eAxcypYOwDI/ZfXNJlfmvvTZmaXn2ZSXfiG/K9nrCU3UBUqlUzVA+7HSmjCRNJYAq+u5tRcuNAvnXHKk7YDzOtxzAClKl1On2BXfSJSQ11FVLpwYX1qE6+t5nqvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482135; c=relaxed/simple;
	bh=zatqsTiNVt0mizH5icHO5VIaXzhq6Tzs0YbvpxqcW3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9R2z/Y1Dw9Ya8F1xX3tey2Ks46vtsh75seb+GjqU8sRz81jvllmQsx93RV1UsEb9/FC1L+tTdDyInvsGURORl/KQo2b+Hmhw0UGwwWZnme8uQ9QPVB/wBRIArngzP0J0L6TSeRky7etZh2v54v2THbGH7sc/ZUgC32XXO0+3KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gXWmEvBY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Abb/XWpvsZRHOky6X9DeXY5nVyF4W3yOOrEo6J5UAE=;
	b=gXWmEvBYQrk3WxLRwZA48la4Faqx0XKQfYi8u2g21JbyhGl3VLCpKND9pJAJSIKzzH+rj6
	kYExWtdKwzvY1BcDk7nec1QbASQpDzitng9cK0yjfne1RdrpULQROZoYu4Mnswj3Ivbfui
	LKvm5I+2JIAVEnfyXTm9iKWdyw+drV0=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-462-R6cuqmxsMYK851djr4kBgQ-1; Sat,
 17 May 2025 07:42:10 -0400
X-MC-Unique: R6cuqmxsMYK851djr4kBgQ-1
X-Mimecast-MFC-AGG-ID: R6cuqmxsMYK851djr4kBgQ_1747482129
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 035371956089;
	Sat, 17 May 2025 11:42:09 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 43564180045B;
	Sat, 17 May 2025 11:42:03 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 09/23] media: atomisp: gc0310: Add camera orientation and sensor rotation controls
Date: Sat, 17 May 2025 13:40:52 +0200
Message-ID: <20250517114106.43494-10-hdegoede@redhat.com>
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

Add camera orientation and sensor rotation controls using
the v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties()
helpers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 568b501f7e87..889e03b89ee7 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -20,6 +20,7 @@
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
 
 #define GC0310_NATIVE_WIDTH			656
 #define GC0310_NATIVE_HEIGHT			496
@@ -595,9 +596,12 @@ static const struct v4l2_subdev_ops gc0310_ops = {
 
 static int gc0310_init_controls(struct gc0310_device *sensor)
 {
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
 	struct v4l2_ctrl_handler *hdl = &sensor->ctrls.handler;
+	struct v4l2_fwnode_device_properties props;
+	int ret;
 
-	v4l2_ctrl_handler_init(hdl, 6);
+	v4l2_ctrl_handler_init(hdl, 8);
 
 	/* Use the same lock for controls as for everything else */
 	hdl->lock = &sensor->input_lock;
@@ -629,6 +633,12 @@ static int gc0310_init_controls(struct gc0310_device *sensor)
 				  GC0310_H_BLANK_DEFAULT, 1,
 				  GC0310_H_BLANK_DEFAULT);
 
+	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (ret)
+		return ret;
+
+	v4l2_ctrl_new_fwnode_properties(hdl, &ctrl_ops, &props);
+
 	if (hdl->error)
 		return hdl->error;
 
-- 
2.49.0


