Return-Path: <linux-media+bounces-32665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A9EABA9CC
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 766001888764
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18161DE8B2;
	Sat, 17 May 2025 11:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dAdOgzVw"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00BB1EF080
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482123; cv=none; b=Q9PyRG+wrBJoLTDdJMIWOCsjDIJYJJBMUM9kICuhm4mghTwLZxWOF7XSqwc2g0JSdjKbYmRAamYVpW5AtZpWFtQMSLIdG0UFZFv/YMqfaGnilDSlcHKjK5a0plGuwCHyvoGsqbsjpfxWexi4P8PXKZdhW568YyI+GzC3GsDdz9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482123; c=relaxed/simple;
	bh=g6RTdmPQydu3N73AFUA9tAmB/ZCZLAapM6DVUpLSTaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rrD54uGAEbSZD2r5DPidq3K2txXh5cb4vr5t9Py74tf5r6uJALrM0g0SEi0kZ8p+J6rM5GS1luJoQEuK2TkFzAg6Sr1DaHaOHca6M28+savqeA9lvIJybNQep2cN869AmS6yAcr/SW4vcKOeRaK6T8tNbpG1r37+fD7R1o92FR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dAdOgzVw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ENy+lwBIYYMMt7i/UP9ASvIPDHYJ2PjUSQYKRDJPjTI=;
	b=dAdOgzVwWemsCUIQzgXJbha7wwIJb+YlSk+r03AJTOvBS2JkMq4sz5/U8aUG9HiMmWZOxO
	YC9hOclPfvotxaL8MTrYdXTWvV0kxh5vlfQfKKrN6IL/GGUenALZqSlau8Luo5sEomqni8
	bQyM1wTxgXkoK4bH5sfqlV30hP3QhMs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-62-UOrry5U3Pruqw5-trRsA0w-1; Sat,
 17 May 2025 07:41:59 -0400
X-MC-Unique: UOrry5U3Pruqw5-trRsA0w-1
X-Mimecast-MFC-AGG-ID: UOrry5U3Pruqw5-trRsA0w_1747482118
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EF9BF1800446;
	Sat, 17 May 2025 11:41:57 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 03CEC180045B;
	Sat, 17 May 2025 11:41:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 07/23] media: atomisp: gc0310: Add link-frequency and pixelrate controls
Date: Sat, 17 May 2025 13:40:50 +0200
Message-ID: <20250517114106.43494-8-hdegoede@redhat.com>
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

Add support for the pixelrate control as expected by libcamera,
while at it also add the link-frequency control.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 33 +++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 7902e732a3ca..2bb309b51a3a 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -24,6 +24,17 @@
 #define GC0310_NATIVE_WIDTH			656
 #define GC0310_NATIVE_HEIGHT			496
 
+/*
+ * The actual PLL output rate is unknown, the datasheet
+ * says that the formula for the frame-time in pixels is:
+ * rowtime = win-width + hblank + sh-delay + 4
+ * frametime = rowtime * (win-height + vblank)
+ * Filling this in and multiplying by 30 fps gives:
+ * pixelrate = (660 + 178 + 42 + 4) * (498 + 27) * 30 = 13923000
+ */
+#define GC0310_PIXELRATE			13923000
+/* single lane, bus-format is 8 bpp, CSI-2 is double data rate */
+#define GC0310_LINK_FREQ			(GC0310_PIXELRATE * 8 / 2)
 #define GC0310_FPS				30
 #define GC0310_SKIP_FRAMES			3
 
@@ -76,6 +87,8 @@ struct gc0310_device {
 		struct v4l2_ctrl_handler handler;
 		struct v4l2_ctrl *exposure;
 		struct v4l2_ctrl *gain;
+		struct v4l2_ctrl *link_freq;
+		struct v4l2_ctrl *pixel_rate;
 	} ctrls;
 };
 
@@ -251,6 +264,10 @@ static const struct reg_sequence gc0310_VGA_30fps[] = {
 	{ 0xfe, 0x00 },
 };
 
+static const s64 link_freq_menu_items[] = {
+	GC0310_LINK_FREQ,
+};
+
 static int gc0310_gain_set(struct gc0310_device *sensor, u32 gain)
 {
 	u8 again, dgain;
@@ -561,7 +578,7 @@ static int gc0310_init_controls(struct gc0310_device *sensor)
 {
 	struct v4l2_ctrl_handler *hdl = &sensor->ctrls.handler;
 
-	v4l2_ctrl_handler_init(hdl, 2);
+	v4l2_ctrl_handler_init(hdl, 4);
 
 	/* Use the same lock for controls as for everything else */
 	hdl->lock = &sensor->input_lock;
@@ -574,7 +591,19 @@ static int gc0310_init_controls(struct gc0310_device *sensor)
 	sensor->ctrls.gain =
 		v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_ANALOGUE_GAIN, 0, 95, 1, 31);
 
-	return hdl->error;
+	sensor->ctrls.link_freq =
+		v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_LINK_FREQ,
+				       0, 0, link_freq_menu_items);
+	sensor->ctrls.pixel_rate =
+		v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXEL_RATE, 0,
+				  GC0310_PIXELRATE, 1, GC0310_PIXELRATE);
+
+	if (hdl->error)
+		return hdl->error;
+
+	sensor->ctrls.pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	sensor->ctrls.link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	return 0;
 }
 
 static void gc0310_remove(struct i2c_client *client)
-- 
2.49.0


