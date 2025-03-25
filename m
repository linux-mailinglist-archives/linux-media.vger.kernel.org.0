Return-Path: <linux-media+bounces-28725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A4A7068A
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 17:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C11A13B9C8B
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 16:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB9225D1E2;
	Tue, 25 Mar 2025 16:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i+X+vT1O"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4B825D1FA
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 16:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742919252; cv=none; b=cDCmrrrKj5ToMyEXxl+H3GbS8X9+qRdYN5eUj55QOA1o90fh5Vgv4C1rMUwYTPxOU8jGx2Rf/+Putn1oXIE3hhzjcf8uIHhSfsuWAMSfNAWwLnbj5Bb5JymhIOb90e2JaPpV/CSJjBmH7qXt4PX/dSy7nedfexSQdCYyCFmy6l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742919252; c=relaxed/simple;
	bh=yLj4z+jqDXv/XbwjnmtZJj42RpgP/iMihdjydmeZqjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MvgIZ38Ny0gMcFJUiC1ddsBXT6JGBRI28hTjbUaH1uT9Yz8mSQy0f3037XEyQV9jnIvxhVewzWCzMLpDQ4UOIWa84pnDsPtufLMI+EKV3t1Iul1SUHA6ZqzSuDgAu6W2LHxAdumw0D/7DcSdJDYFxNWSii7/1F+IxbOsPjVDkUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i+X+vT1O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742919250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XgP8EzgSaGGRGVenkO80yzIIdLrjN4fqfxhFtuQOr48=;
	b=i+X+vT1O3vBY6wNJKD71qAYX4nECV4pPQBnWEGB2rUId+w8IaLqAsLbmajF1ovVOMqErVr
	yeAYv5Uir6ILpFsdLifUNwAX1KcHeMC6ER49QwZ/MeGSEDWPC79k4dViZkWl083I8+xn1m
	Egv8PVGoh8yWoynoVb7AcLGJ2/P3w0I=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-669-4YoMZcLXNn2fd-GwOJZ7Qg-1; Tue,
 25 Mar 2025 12:14:03 -0400
X-MC-Unique: 4YoMZcLXNn2fd-GwOJZ7Qg-1
X-Mimecast-MFC-AGG-ID: 4YoMZcLXNn2fd-GwOJZ7Qg_1742919242
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0555D196E08E;
	Tue, 25 Mar 2025 16:14:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.32.136])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9B95E1828A80;
	Tue, 25 Mar 2025 16:13:58 +0000 (UTC)
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
Subject: [PATCH 3/8] platform/x86: int3472: Drop unused gpio field from struct int3472_gpio_regulator
Date: Tue, 25 Mar 2025 17:13:35 +0100
Message-ID: <20250325161340.342192-4-hdegoede@redhat.com>
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

The gpio field in struct int3472_gpio_regulator is only briefly used to
store the gpio in skl_int3472_register_regulator() instead just store
the gpio directly into cfg.ena_gpiod an drop the gpio field.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/clk_and_regulator.c | 4 +---
 drivers/platform/x86/intel/int3472/common.h            | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 40434591dd0b..5f6c66215f63 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -261,11 +261,9 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 						int3472->regulator.regulator_name,
 						&int3472_gpio_regulator_ops);
 
-	int3472->regulator.gpio = gpio;
-
 	cfg.dev = &int3472->adev->dev;
 	cfg.init_data = &init_data;
-	cfg.ena_gpiod = int3472->regulator.gpio;
+	cfg.ena_gpiod = gpio;
 
 	int3472->regulator.rdev = regulator_register(int3472->dev,
 						     &int3472->regulator.rdesc,
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index 72ef222629b6..e0fa34be8a07 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -80,7 +80,6 @@ struct int3472_discrete_device {
 		/* SUPPLY_MAP_COUNT * 2 to make room for second sensor mappings */
 		struct regulator_consumer_supply supply_map[GPIO_REGULATOR_SUPPLY_MAP_COUNT * 2];
 		char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
-		struct gpio_desc *gpio;
 		struct regulator_dev *rdev;
 		struct regulator_desc rdesc;
 	} regulator;
-- 
2.49.0


