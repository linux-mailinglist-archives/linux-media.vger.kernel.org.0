Return-Path: <linux-media+bounces-31667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 024C4AA85D8
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 12:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44A011748A6
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 10:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6801A2391;
	Sun,  4 May 2025 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PJ12DzaX"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E64B1A0B0E
	for <linux-media@vger.kernel.org>; Sun,  4 May 2025 10:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746353647; cv=none; b=gOmjJ/NvXKMBmCZP/S0mAQtjh+Hh6e+WRHYixrRb/2trzjKwSmTkviFsPLsYVzN5j4aaPgxuq6upub1Tut3TgLH3YLDeMHGmx8dKnmFL1Zcz5pn5lA3WyA4ZgrTrzoKsEoP85+IeIuL47AkVCLTPWgxLTgC0Wa0nP6nWzc9RzMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746353647; c=relaxed/simple;
	bh=XoZprWNa9JKk5ppMXBcMXSaLmWUfFr10GO1ZFnoV1Js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oOoKCWmD0ymCa56nAU6vjbLhr/LkbK4jgm3zkjDuxv7K7VRFxXk095OK5TvGtyJjfIP1ro7sURT1hrxaTiJSkWGYPyfmR1HrCY5/o/o7IRRs4wCI/O3JU00qd9sFhxWZDJrPfbSni3BPj4Kr4S1hVv+jw9ynXW+2UgSfNcN2oFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PJ12DzaX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746353644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kjlDMye80bw5PamgWNoCtD7hGoHfE+o7Tbf7Fijtc8Y=;
	b=PJ12DzaX7kEWTwKCJqsXlDAKVYFErQZi94BWR3EQiEUOjxszZp2nKEewxwQCyyUW5VPK9a
	kk5fnDRTMTbbQKWQR0D32VPPZ7tJ9z9095/ZT2MToM1g0GHq+/jH63zuZLQU0hurC32bv4
	HWWFJyo8s6OPstYYrjgHnehWytH/lO4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-180-yw-2kVqyMX6JJfL6kc5EAA-1; Sun,
 04 May 2025 06:14:01 -0400
X-MC-Unique: yw-2kVqyMX6JJfL6kc5EAA-1
X-Mimecast-MFC-AGG-ID: yw-2kVqyMX6JJfL6kc5EAA_1746353640
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 347B01800446;
	Sun,  4 May 2025 10:14:00 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.28])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 179A31800352;
	Sun,  4 May 2025 10:13:57 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 07/13] media: mt9m114: Update hblank and vblank defaults on pixel-array format changes
Date: Sun,  4 May 2025 12:13:28 +0200
Message-ID: <20250504101336.18748-8-hdegoede@redhat.com>
In-Reply-To: <20250504101336.18748-1-hdegoede@redhat.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Update hblank and vblank defaults when the pixel-array format changes,
to maintain 30 fps on format changes.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/mt9m114.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index ba8b7660f88a..be3e7bb44ad8 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -333,6 +333,10 @@
 #define MT9M114_MIN_VBLANK				21
 #define MT9M114_DEF_HBLANK				308
 #define MT9M114_DEF_VBLANK				21
+#define MT9M114_DEF_HTS					\
+	(MT9M114_PIXEL_ARRAY_WIDTH + MT9M114_DEF_HBLANK)
+#define MT9M114_DEF_VTS					\
+	(MT9M114_PIXEL_ARRAY_HEIGHT + MT9M114_DEF_VBLANK)
 
 #define MT9M114_DEF_FRAME_RATE				30
 #define MT9M114_MAX_FRAME_RATE				120
@@ -1130,18 +1134,22 @@ static void mt9m114_pa_ctrl_update_exposure(struct mt9m114 *sensor, bool manual)
 static void mt9m114_pa_ctrl_update_blanking(struct mt9m114 *sensor,
 					    const struct v4l2_mbus_framefmt *format)
 {
-	unsigned int max_blank;
+	unsigned int def_blank, max_blank;
 
 	/* Update the blanking controls ranges based on the output size. */
 	max_blank = MT9M114_CAM_SENSOR_CFG_LINE_LENGTH_PCK_MAX
 		  - format->width;
+	def_blank = MT9M114_DEF_HTS - format->width;
 	__v4l2_ctrl_modify_range(sensor->pa.hblank, MT9M114_MIN_HBLANK,
-				 max_blank, 1, MT9M114_DEF_HBLANK);
+				 max_blank, 1, def_blank);
+	__v4l2_ctrl_s_ctrl(sensor->pa.hblank, def_blank);
 
 	max_blank = MT9M114_CAM_SENSOR_CFG_FRAME_LENGTH_LINES_MAX
 		  - format->height;
+	def_blank = MT9M114_DEF_VTS - format->height;
 	__v4l2_ctrl_modify_range(sensor->pa.vblank, MT9M114_MIN_VBLANK,
-				 max_blank, 1, MT9M114_DEF_VBLANK);
+				 max_blank, 1, def_blank);
+	__v4l2_ctrl_s_ctrl(sensor->pa.vblank, def_blank);
 }
 
 /* -----------------------------------------------------------------------------
-- 
2.49.0


