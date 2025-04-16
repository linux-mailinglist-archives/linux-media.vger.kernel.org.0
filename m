Return-Path: <linux-media+bounces-30339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEACA8B958
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C54616BFA7
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB4370807;
	Wed, 16 Apr 2025 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eHeVhjTN"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8916335977
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807261; cv=none; b=KsszU2VDpl/JFbCZ7UqVPoKxHREt7tGXH3UGzUNXmr3WTsWqMx1HCW5N5vZcyexTZjN75YwjQL3P6FB/elmpMC/g1fs3EWbA+9E7Qv344zQMAV/wii/Qv8w/7Lh0Oe8J8I3gb2Ot1XOYUjdb91RmwBL7T/AButBPh6jLV9PV0h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807261; c=relaxed/simple;
	bh=DF9uLVCmcppGaYrzAQ/097853xSxX5JBUgPcUUDVnAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRlVQFSglF8bjkj2kdubyJrRTXyODWHQulikKg70oxkIEmnDEgM6ULxxHDW3yrn8/YOfTLLO40AdAgcxP+m230ecwYGBY5iZfBtoC1BpGdus2bOUU5rnwn/WjAr1SzwW2ZPWC1i+vkLV1/n1eNs7i+Wqs4hQlcSNhlf51kxRSHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eHeVhjTN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744807258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nqvRoUOS45eqYZyUu/oyin/hyEkH6Sk3qKL5WSi0Vdk=;
	b=eHeVhjTN2osyBKzyOY7semVIeO3guBQNoVkLXYANRBz6XM3SQ1M8Ybkop++MAKCAjoabYK
	VPb6cCWuMWDIocgkt4eLiEheruWPByJ/kXfK/bMlARXCnM0oM/h6liW71mCygsgOKV81fi
	URGAOGf6DDbyDkDvg5TtDFaT1DTnux0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-htXx4iO6O4yelGN8L-zuRQ-1; Wed,
 16 Apr 2025 08:40:54 -0400
X-MC-Unique: htXx4iO6O4yelGN8L-zuRQ-1
X-Mimecast-MFC-AGG-ID: htXx4iO6O4yelGN8L-zuRQ_1744807252
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3300518004A9;
	Wed, 16 Apr 2025 12:40:52 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.34.142])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A6F1E195608D;
	Wed, 16 Apr 2025 12:40:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Duane <duanek@chorus.net>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 1/9] platform/x86: int3472: Add skl_int3472_register_clock() helper
Date: Wed, 16 Apr 2025 14:40:29 +0200
Message-ID: <20250416124037.90508-2-hdegoede@redhat.com>
In-Reply-To: <20250416124037.90508-1-hdegoede@redhat.com>
References: <20250416124037.90508-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

skl_int3472_register_dsm_clock() and skl_int3472_register_gpio_clock() are
80% the same code. Factor out the common code into a new
skl_int3472_register_clock() helper.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
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


