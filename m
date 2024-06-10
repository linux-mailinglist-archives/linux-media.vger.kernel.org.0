Return-Path: <linux-media+bounces-12881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD879027CB
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 19:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B8E4B23936
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 17:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A540E14659A;
	Mon, 10 Jun 2024 17:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FLO52sL2"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE548F6D
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 17:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718040868; cv=none; b=T9WCNrh4KwFPU3NGxE0G+DcNmr3wWocf3P/lObeQKrhIdlCVTEVey9n1XWzmNGuxBndNB9Cc6UZVgI0+aVahAEtXVtqg5Ze/5RRc4UxXFSl5U619zpY8iX8z3Nudj7NLN6bHHFMYjCg7kYRJyLG9S02/Z2pkoUfGTz4qjGdOGjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718040868; c=relaxed/simple;
	bh=6BL43B9XAdbcFfry/EVwYGwfmvcVYVpkVARnqTHxVfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mgPZd2BAKvi3bpWlZa6aii+V694G0AlV3ALsu/gS6wDAZFC1SW/iY74rkusmsvcZOoXkRxxmbVccXXr4FIBabPDturQA96v6dKudL18kTWxDMhWS5mZjSr4BNw1VtIjs0LcEZshrK79PzsndbADsAiI8M2Yev6IHg1hAZuRyW/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FLO52sL2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718040865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lD06i76qDc78lsTuKc4whE4gcJwNVz6YxpAk8sVYZ1s=;
	b=FLO52sL27eqWMroA++Wt52GKVw9TJ7FbcXRLiiEKWYKK33PuIigLK+VJzfDUJZatHz1liQ
	6wYM5VrEa5/viYuIQk3TPHe4k9XrJzcpqTsvKjVLvixvs0NubpMzP1zCkLSdhfSCkpJisX
	NkILYD63M0WHjzIOBQQ5xH2F+zGxo6A=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-rHgAfufKPOOj5bXTjkZBrQ-1; Mon,
 10 Jun 2024 13:34:23 -0400
X-MC-Unique: rHgAfufKPOOj5bXTjkZBrQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E86A719560AD;
	Mon, 10 Jun 2024 17:34:21 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.77])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D63DD30000C3;
	Mon, 10 Jun 2024 17:34:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: ipu-bridge: Sort ipu_supported_sensors[] array by ACPI HID
Date: Mon, 10 Jun 2024 19:34:17 +0200
Message-ID: <20240610173418.16119-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Sort the sensors in ipu_supported_sensors[] by ACPI HID rather then having
them in some random order.

While at it also use the correct (same as datasheet) capitalization
for the sensor names in the comments. Instead of sometimes writing
OV#### and sometimes ov####.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 61750cc98d70..f1d0d5f4854e 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -43,28 +43,30 @@
  * becoming apparent in the future.
  *
  * Do not add an entry for a sensor that is not actually supported.
+ *
+ * Please keep the list sorted by ACPI HID.
  */
 static const struct ipu_sensor_config ipu_supported_sensors[] = {
+	/* GalaxyCore GC0310 */
+	IPU_SENSOR_CONFIG("INT0310", 0),
 	/* Omnivision OV5693 */
 	IPU_SENSOR_CONFIG("INT33BE", 1, 419200000),
+	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
 	/* Omnivision OV8865 */
 	IPU_SENSOR_CONFIG("INT347A", 1, 360000000),
 	/* Omnivision OV7251 */
 	IPU_SENSOR_CONFIG("INT347E", 1, 319200000),
+	/* Hynix Hi-556 */
+	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
+	/* Omnivision OV01A10 */
+	IPU_SENSOR_CONFIG("OVTI01A0", 1, 400000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
-	/* Omnivision ov8856 */
+	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
-	/* Omnivision ov2740 */
-	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
-	/* Hynix hi556 */
-	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
-	/* Omnivision ov13b10 */
+	/* Omnivision OV13B10 */
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
-	/* GalaxyCore GC0310 */
-	IPU_SENSOR_CONFIG("INT0310", 0),
-	/* Omnivision ov01a10 */
-	IPU_SENSOR_CONFIG("OVTI01A0", 1, 400000000),
 };
 
 static const struct ipu_property_names prop_names = {
-- 
2.45.1


