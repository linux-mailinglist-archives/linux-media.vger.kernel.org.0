Return-Path: <linux-media+bounces-29258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB69A79673
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 22:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7D3E188F150
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 20:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C321EFFA9;
	Wed,  2 Apr 2025 20:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dfHc4wvB"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2A71E51E7
	for <linux-media@vger.kernel.org>; Wed,  2 Apr 2025 20:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625527; cv=none; b=uusSO9Myo3fN2h+ljmYeM1Vvk35bE7IMT3IVTEEGQ1+Go9AAiC2ep+q7MFGpOPxOd6MBsoyEVi1C5V56ImT/ADDYE09NKS8tLRkarr2vwII9+T0F53soHhev0ZLpRLFUKMeDq7y5i8l/RY7S9qf2Qc82hbV8KL1pfZ/6U9o6y0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625527; c=relaxed/simple;
	bh=DF9uLVCmcppGaYrzAQ/097853xSxX5JBUgPcUUDVnAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gk1z/bnbDPV0fvSFzpwiQ+2K5gAEBD0+lZ11Ppdfo9Jr0VnAfT9Ir7I37Qa9g5It+dsCFTUY9qTZK3/IA75HrYv4CvVXKX3IvdTqK0gAjYR+LJgBx+MXzTDaa33ed9puWEjwK9ai/g6eBk4fc8Y2wgKJFpyROD9ILBIygMsplE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dfHc4wvB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743625524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nqvRoUOS45eqYZyUu/oyin/hyEkH6Sk3qKL5WSi0Vdk=;
	b=dfHc4wvBNgGzkZJ+DnOyrmelFyWyHoJXf2ciCrvC/AfByRg0KmNfadaLK/NoIqxUCQLkbF
	UwUuOxA+qCggeJwJ2vGpIcsA71qZi+hNSEq3Gy8ApXWN5sKLLBJFGPRupw4o4AbjwZ9e3r
	4MzkhcD6nV2isacXJdW9vArX9VQ7FlU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-209-vltAgjnWPDqat50_cdk5lQ-1; Wed,
 02 Apr 2025 16:25:22 -0400
X-MC-Unique: vltAgjnWPDqat50_cdk5lQ-1
X-Mimecast-MFC-AGG-ID: vltAgjnWPDqat50_cdk5lQ_1743625520
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 374181956048;
	Wed,  2 Apr 2025 20:25:20 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.44.32.69])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 90D5B1801752;
	Wed,  2 Apr 2025 20:25:16 +0000 (UTC)
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
Subject: [PATCH v2 1/9] platform/x86: int3472: Add skl_int3472_register_clock() helper
Date: Wed,  2 Apr 2025 22:25:02 +0200
Message-ID: <20250402202510.432888-2-hdegoede@redhat.com>
In-Reply-To: <20250402202510.432888-1-hdegoede@redhat.com>
References: <20250402202510.432888-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

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


