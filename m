Return-Path: <linux-media+bounces-28724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B61A70687
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 17:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D1E33A7368
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 16:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803FB25C6E2;
	Tue, 25 Mar 2025 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gMqK/Ugg"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3589025D1E2
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 16:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742919244; cv=none; b=U5BeMWJQ1wco+pvA4HZqsBVNOsBKT/bOvVaAiV4fOWcbdNiaI/7820id0BlHOvi89Czj2KrU4xUllO4NTObGje/fjNh0DCw816argrQ2hItUXUsoSmZ6ZxhX+b3gusiL2gzVowHSAQUcdvfnUeLlBQ3IdwVpzIez4/OrHPBtG5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742919244; c=relaxed/simple;
	bh=k+HLpllO8OvHjE7fsyflYX5Rblwty6u1ZL05HLuLcOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJLS1J0N4Il1G3y3TSjyQQzCdswEZ2N4DJnpl390GudEsL9J4vGfdPg2KDvEEzfS8Zl03+H7PDK9I1tQ9Pji+66+Gp4F4A+Je1CU4wb4CGvIziQXgLu9Cl3pD71j0lOl3ZEF4jymanaXLgJGEMb4utq6l/M/xxJITPnYcrrDA9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gMqK/Ugg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742919242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=et5Rh9pm5XvYqJB+08XCF+9N9H8OANUvzqjOWuv8NAM=;
	b=gMqK/UggfU4zwUvyl7we3ZvRjdL7DszSnn62JkHtjQESpkleMp1eCtsk7eZDnhPZw21lfY
	xJF+rgAW6EEuf8aZcVRgSKlht4o7wKxhI8llBPX/oIPz86ftKpe1eSP6pa2gu2rB50ByqY
	Q3OFk+LYTEyTottPAXNaTVRtHxGaH8I=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-685-5PZtpQk9OpS9q7q17DmHaw-1; Tue,
 25 Mar 2025 12:13:56 -0400
X-MC-Unique: 5PZtpQk9OpS9q7q17DmHaw-1
X-Mimecast-MFC-AGG-ID: 5PZtpQk9OpS9q7q17DmHaw_1742919234
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D803196EB97;
	Tue, 25 Mar 2025 16:13:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.32.136])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E6BAD180B48D;
	Tue, 25 Mar 2025 16:13:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 1/8] platform/x86: int3472: Add skl_int3472_register_clock() helper
Date: Tue, 25 Mar 2025 17:13:33 +0100
Message-ID: <20250325161340.342192-2-hdegoede@redhat.com>
In-Reply-To: <20250325161340.342192-1-hdegoede@redhat.com>
References: <20250325161340.342192-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

skl_int3472_register_dsm_clock() and skl_int3472_register_gpio_clock() are
80% the same code. Factor out the common code into a new
skl_int3472_register_clock() helper.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../x86/intel/int3472/clk_and_regulator.c     | 57 +++++--------------
 1 file changed, 13 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 16e36ac0a7b4..837990af24fe 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -118,7 +118,7 @@ static const struct clk_ops skl_int3472_clock_ops = {
 	.recalc_rate = skl_int3472_clk_recalc_rate,
 };
 
-int skl_int3472_register_dsm_clock(struct int3472_discrete_device *int3472)
+static int skl_int3472_register_clock(struct int3472_discrete_device *int3472)
 {
 	struct acpi_device *adev = int3472->adev;
 	struct clk_init_data init = {
@@ -127,12 +127,6 @@ int skl_int3472_register_dsm_clock(struct int3472_discrete_device *int3472)
 	};
 	int ret;
 
-	if (int3472->clock.cl)
-		return 0; /* A GPIO controlled clk has already been registered */
-
-	if (!acpi_check_dsm(adev->handle, &img_clk_guid, 0, BIT(1)))
-		return 0; /* DSM clock control is not available */
-
 	init.name = kasprintf(GFP_KERNEL, "%s-clk", acpi_dev_name(adev));
 	if (!init.name)
 		return -ENOMEM;
@@ -161,51 +155,26 @@ int skl_int3472_register_dsm_clock(struct int3472_discrete_device *int3472)
 	return ret;
 }
 
+int skl_int3472_register_dsm_clock(struct int3472_discrete_device *int3472)
+{
+	if (int3472->clock.cl)
+		return 0; /* A GPIO controlled clk has already been registered */
+
+	if (!acpi_check_dsm(int3472->adev->handle, &img_clk_guid, 0, BIT(1)))
+		return 0; /* DSM clock control is not available */
+
+	return skl_int3472_register_clock(int3472);
+}
+
 int skl_int3472_register_gpio_clock(struct int3472_discrete_device *int3472,
 				    struct gpio_desc *gpio)
 {
-	struct clk_init_data init = {
-		.ops = &skl_int3472_clock_ops,
-		.flags = CLK_GET_RATE_NOCACHE,
-	};
-	int ret;
-
 	if (int3472->clock.cl)
 		return -EBUSY;
 
 	int3472->clock.ena_gpio = gpio;
 
-	init.name = kasprintf(GFP_KERNEL, "%s-clk",
-			      acpi_dev_name(int3472->adev));
-	if (!init.name)
-		return -ENOMEM;
-
-	int3472->clock.frequency = skl_int3472_get_clk_frequency(int3472);
-
-	int3472->clock.clk_hw.init = &init;
-	int3472->clock.clk = clk_register(&int3472->adev->dev,
-					  &int3472->clock.clk_hw);
-	if (IS_ERR(int3472->clock.clk)) {
-		ret = PTR_ERR(int3472->clock.clk);
-		goto out_free_init_name;
-	}
-
-	int3472->clock.cl = clkdev_create(int3472->clock.clk, NULL,
-					  int3472->sensor_name);
-	if (!int3472->clock.cl) {
-		ret = -ENOMEM;
-		goto err_unregister_clk;
-	}
-
-	kfree(init.name);
-	return 0;
-
-err_unregister_clk:
-	clk_unregister(int3472->clock.clk);
-out_free_init_name:
-	kfree(init.name);
-
-	return ret;
+	return skl_int3472_register_clock(int3472);
 }
 
 void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
-- 
2.49.0


