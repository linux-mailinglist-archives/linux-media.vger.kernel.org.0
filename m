Return-Path: <linux-media+bounces-32668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7B5ABA9CF
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 545B6189B0E0
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7B21F8755;
	Sat, 17 May 2025 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ckMypNOS"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827311DED57
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482141; cv=none; b=H092FH0wiVqvHkDUzOT8z6cw6UvTaNNcqdAexdO8tmrNHt25l9D1HyFEjKKRJOuQ/opRpEZ2B+9aeJMQ9wlO+W5j8pb35E3Vv/mbiSHNc7+Y2AwluSwgmM2pE3Cf+wAsgmpvxe/vuBcKb6gA7Rusrdw6zl811Z0wYlTb/axBy1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482141; c=relaxed/simple;
	bh=TjueDCKE5AzmyOZpRzwXO2Mb4S/RMrF81njeRm6JlF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=foD86mwi0UqofylNKCYBQKJ+DgzKEowfHCuFsetizMALlFmmsZC7Ftdb+PJgUg0IFrcwht5vdkqnJ9yk/Lz/l/mBLnqNW1HqixS5F4ZL7Ahn5ZntpSzut8QUHhay+aeTpapn73lInQD3h1RD30B22BWWSlyXIPTZmUSgYHNm2Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ckMypNOS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wlj9FJg+iuWU4RW63rYD2HbLLPV1cGCBWgQJvxbAuIs=;
	b=ckMypNOSTAb1Fg6Ly54GAbez750p4UXkYWCP96KX3mJM6UBi23ZPdFrxcr36BBiq78889+
	TysZAqR+P4edC8G2m3l1W/LnsbAl0lSIJzuyXlDgr74h3J1oktRJoz8DQutGlibdyL40f/
	+BlubJ7EFPqt+kr+28nv8X0csvBFXOM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-299-nt2C2uIhNpy9JvwKIJWoVw-1; Sat,
 17 May 2025 07:42:15 -0400
X-MC-Unique: nt2C2uIhNpy9JvwKIJWoVw-1
X-Mimecast-MFC-AGG-ID: nt2C2uIhNpy9JvwKIJWoVw_1747482134
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1056F1800446;
	Sat, 17 May 2025 11:42:14 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0139518003FC;
	Sat, 17 May 2025 11:42:09 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 10/23] media: atomisp: gc0310: Limit max exposure value to mode-height + vblank
Date: Sat, 17 May 2025 13:40:53 +0200
Message-ID: <20250517114106.43494-11-hdegoede@redhat.com>
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

When an exposure value > (mode-height + vblank) gets set the sensor will
automatically increase vblank, lowering the framerate.

This is not desirable, limit exposure the maximum exposure to mode-height +
vblank to avoid the unwanted framerate slowdown.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/i2c/atomisp-gc0310.c        | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 889e03b89ee7..e053982a6512 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -306,12 +306,27 @@ static int gc0310_gain_set(struct gc0310_device *sensor, u32 gain)
 	return ret;
 }
 
+static int gc0310_exposure_update_range(struct gc0310_device *sensor)
+{
+	int exp_max = GC0310_NATIVE_HEIGHT + sensor->ctrls.vblank->val;
+
+	return __v4l2_ctrl_modify_range(sensor->ctrls.exposure, 0, exp_max,
+					1, exp_max);
+}
+
 static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct gc0310_device *sensor =
 		container_of(ctrl->handler, struct gc0310_device, ctrls.handler);
 	int ret;
 
+	/* Update exposure range on vblank changes */
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		ret = gc0310_exposure_update_range(sensor);
+		if (ret)
+			return ret;
+	}
+
 	/* Only apply changes to the controls if the device is powered up */
 	if (!pm_runtime_get_if_in_use(sensor->sd.dev))
 		return 0;
@@ -599,7 +614,7 @@ static int gc0310_init_controls(struct gc0310_device *sensor)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
 	struct v4l2_ctrl_handler *hdl = &sensor->ctrls.handler;
 	struct v4l2_fwnode_device_properties props;
-	int ret;
+	int exp_max, ret;
 
 	v4l2_ctrl_handler_init(hdl, 8);
 
@@ -607,8 +622,10 @@ static int gc0310_init_controls(struct gc0310_device *sensor)
 	hdl->lock = &sensor->input_lock;
 	sensor->sd.ctrl_handler = hdl;
 
+	exp_max = GC0310_NATIVE_HEIGHT + GC0310_V_BLANK_DEFAULT;
 	sensor->ctrls.exposure =
-		v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_EXPOSURE, 0, 4095, 1, 1023);
+		v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_EXPOSURE, 0,
+				  exp_max, 1, exp_max);
 
 	/* 32 steps at base gain 1 + 64 half steps at base gain 2 */
 	sensor->ctrls.gain =
-- 
2.49.0


