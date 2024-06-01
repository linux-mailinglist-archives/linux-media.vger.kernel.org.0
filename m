Return-Path: <linux-media+bounces-12382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF758D715D
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2024 19:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79CE12823D9
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2024 17:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6B6154BE0;
	Sat,  1 Jun 2024 17:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HBN8Pa9V"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7157DAD55
	for <linux-media@vger.kernel.org>; Sat,  1 Jun 2024 17:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717263592; cv=none; b=YsqaibwevibEL/ykoUcuNfCxhrSAmp0UXCt7Sxfv+qzOoqRYh2WKXTv4BDRYbeZLi2DzOsOVJ6BxrctWYKKFSwg6Nm0zwKTBESmNWEcaCJO6Or1pb/Uvzzh2Gr4Mo1ERyH3DcrxnW+fdbg/8NQwwZU2Zbo+xdqvteeN9gQM3y3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717263592; c=relaxed/simple;
	bh=Y9tmO1HmGHJSBAGavkF9OAGIi4NTQUMZMNvVTNXV8+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zx1a9Kv1rErxNpzjp3ZJifAYWKYGwXVhGcKdimtgDlx57a60L8o6J9Lz/EiB5GBN8V4Fcno4lWfsLSUb8WfSjq1znHxBRfj6RNqkaqPKL/wHOay/JxcnpFIYDT2IkTgUNvccAUB9NSGfu4GclGgGsykzK3kzSFtXT9Hp/MAHSmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HBN8Pa9V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717263589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sORrIRvy6Pm/bZlXxmtaGA9pNuQ1m5WCuQBTfSALtFU=;
	b=HBN8Pa9VdNYCzKN/nAca/zHKdGWchFv+pgBoaKh1uINWgzkGl4HYDeqF8ZpkCzwHYHEwdg
	yao+/YuzO6ufLpdDKrdkApoSNv8vt1BtfarsUK6bFZL7upcGla0Vfd8CsBqrqaQuecGO+n
	Am9i1NuTR92CnYyM2zVriDhtVGxDiIY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-510-vWGBw_X8Ph-FgMwCTvGx1A-1; Sat,
 01 Jun 2024 13:39:44 -0400
X-MC-Unique: vWGBw_X8Ph-FgMwCTvGx1A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D786C1C05129;
	Sat,  1 Jun 2024 17:39:43 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 05D703C27;
	Sat,  1 Jun 2024 17:39:42 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: ov5693: Drop privacy-LED GPIO control
Date: Sat,  1 Jun 2024 19:39:37 +0200
Message-ID: <20240601173937.26236-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

Drop privacy-LED GPIO control, after the privacy-LED GPIO control was added
to the ov5693 driver it was decided to model privacy-LEDs as LED class
devices and have them be controlled by the v4l2-core.

So this is dead code since on devices with privacy LEDs the led is not
a GPIO on the ov5693 fwnode, but rather is a LED class devices controlled
by the v4l2-core.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov5693.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 8deb28b55983..46b9ce111676 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -141,7 +141,6 @@ struct ov5693_device {
 
 	struct gpio_desc *reset;
 	struct gpio_desc *powerdown;
-	struct gpio_desc *privacy_led;
 	struct regulator_bulk_data supplies[OV5693_NUM_SUPPLIES];
 	struct clk *xvclk;
 
@@ -657,7 +656,6 @@ static int ov5693_sensor_init(struct ov5693_device *ov5693)
 
 static void ov5693_sensor_powerdown(struct ov5693_device *ov5693)
 {
-	gpiod_set_value_cansleep(ov5693->privacy_led, 0);
 	gpiod_set_value_cansleep(ov5693->reset, 1);
 	gpiod_set_value_cansleep(ov5693->powerdown, 1);
 
@@ -687,7 +685,6 @@ static int ov5693_sensor_powerup(struct ov5693_device *ov5693)
 
 	gpiod_set_value_cansleep(ov5693->powerdown, 0);
 	gpiod_set_value_cansleep(ov5693->reset, 0);
-	gpiod_set_value_cansleep(ov5693->privacy_led, 1);
 
 	usleep_range(5000, 7500);
 
@@ -1201,13 +1198,6 @@ static int ov5693_configure_gpios(struct ov5693_device *ov5693)
 		return PTR_ERR(ov5693->powerdown);
 	}
 
-	ov5693->privacy_led = devm_gpiod_get_optional(ov5693->dev, "privacy-led",
-						      GPIOD_OUT_LOW);
-	if (IS_ERR(ov5693->privacy_led)) {
-		dev_err(ov5693->dev, "Error fetching privacy-led GPIO\n");
-		return PTR_ERR(ov5693->privacy_led);
-	}
-
 	return 0;
 }
 
-- 
2.45.1


