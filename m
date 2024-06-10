Return-Path: <linux-media+bounces-12882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F659027CC
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 19:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A80B21F22DC5
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 17:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60034147C89;
	Mon, 10 Jun 2024 17:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P/9QKB6o"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAB08F6D
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 17:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718040870; cv=none; b=Fx+ciPd+6/Yd89NAzCZJDKz71aIUFkBTQcX+X7H+DzANrBcGiXOxLnUlnMuQ3HpsanGgmrC/c89z41lhdleuAmti4tZwhjzwTlMcF4TsjHxmCd2odqYy1h5xa2FswI8dESTsinWFlN7gZoHcFnsx3mSSCzGbR/zPb8QWECcagvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718040870; c=relaxed/simple;
	bh=OI1ctTHkCsMH4Yd0bz8xm9EXdTGTPnqRPNky58Yo9h4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jguX63JqcKNRjB2ChjhHvmcHrXo2NTlmQC4Nbi5cxu2P0e37/SCzBf1JwiWuuHmvs2Rs6rR9E6wlcFS6qP5CMsI0BSPTpDpoK2nsysUYnpMB/Y5PHq1cwfPUInXNGE3Me/fGRbUO0M19hCFU/JmNzV4jXLSLJxpQnlzlLxUScHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P/9QKB6o; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718040868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/t2Kvn5czuKZiRPB4kiAYw1d5tMUfUZmntRPocdNxUM=;
	b=P/9QKB6oBGHbXeO+rR1ZjmtnR1I4R2G6ovMZLqB+vRTkBlDf5qrzObCgGSzdLJK9+8gp+P
	rlaeyhnoBlKI+ILdxqvAUX2D97cxQjShXR62FrLdVVI9wBCVi/mOo/odiEatqL23/JPcwU
	4G8czRi7a3KHmmMo01LRFGIuhw1X90I=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-85-ZXH68SGVN-iRdvOQYIW6WQ-1; Mon,
 10 Jun 2024 13:34:24 -0400
X-MC-Unique: ZXH68SGVN-iRdvOQYIW6WQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E34C1195608A;
	Mon, 10 Jun 2024 17:34:23 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.77])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E5E1830000C4;
	Mon, 10 Jun 2024 17:34:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: ipu-bridge: Add HIDs from out of tree IPU6 driver ipu-bridge copy
Date: Mon, 10 Jun 2024 19:34:18 +0200
Message-ID: <20240610173418.16119-2-hdegoede@redhat.com>
In-Reply-To: <20240610173418.16119-1-hdegoede@redhat.com>
References: <20240610173418.16119-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The out of tree IPU6 driver comes with its own copy of the ipu-bridge code.
It also comes bundled with standard v4l2 sensor drivers. Many of these have
been mainlined and the rest is being mainlined but not all are upstream
yet.

The latest version of the out of tree code now will use the mainline kernel
ipu-bridge version when build against new enough kernels.

This however breaks support for (bundled) sensor drivers which do not (yet)
have an entry in the mainline ipu-bridge code.

Add the missing entries to the mainline ipu-bridge code to make
the transition to having everything in mainline easier.

The alternative HID for the OV13B10 and the OV08x40 entries both are for
sensors already supported in mainline which were missing.

The downside of adding these HIDs is that this will cause the IPU3 / IPU6
drivers to delay registering there /dev/video# nodes until a sensor driver
has bound, which for the non mainline drivers may never happen. This is
not really an issue because almost all IPU designs only have front (user)
facing sensors and all the added HIDs are for the main RGB (not IR) sensor.
So if the sensor driver is missing then the user can already not use
the camera and adding these HIDs does not really change that.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index f1d0d5f4854e..a0e9a71580b5 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -47,6 +47,12 @@
  * Please keep the list sorted by ACPI HID.
  */
 static const struct ipu_sensor_config ipu_supported_sensors[] = {
+	/* Himax HM11B1 */
+	IPU_SENSOR_CONFIG("HIMX11B1", 1, 384000000),
+	/* Himax HM2170 */
+	IPU_SENSOR_CONFIG("HIMX2170", 1, 384000000),
+	/* Himax HM2172 */
+	IPU_SENSOR_CONFIG("HIMX2172", 1, 384000000),
 	/* GalaxyCore GC0310 */
 	IPU_SENSOR_CONFIG("INT0310", 0),
 	/* Omnivision OV5693 */
@@ -59,14 +65,24 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT347E", 1, 319200000),
 	/* Hynix Hi-556 */
 	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
-	/* Omnivision OV01A10 */
+	/* Omnivision OV01A10 / OV01A1S */
 	IPU_SENSOR_CONFIG("OVTI01A0", 1, 400000000),
+	IPU_SENSOR_CONFIG("OVTI01AS", 1, 400000000),
+	/* Omnivision OV02C10 */
+	IPU_SENSOR_CONFIG("OVTI02C1", 1, 400000000),
+	/* Omnivision OV02E10 */
+	IPU_SENSOR_CONFIG("OVTI02E1", 1, 360000000),
+	/* Omnivision OV08A10 */
+	IPU_SENSOR_CONFIG("OVTI08A1", 1, 500000000),
+	/* Omnivision OV08x40 */
+	IPU_SENSOR_CONFIG("OVTI08F4", 1, 400000000),
+	/* Omnivision OV13B10 */
+	IPU_SENSOR_CONFIG("OVTI13B1", 1, 560000000),
+	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
-	/* Omnivision OV13B10 */
-	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 };
 
 static const struct ipu_property_names prop_names = {
-- 
2.45.1


