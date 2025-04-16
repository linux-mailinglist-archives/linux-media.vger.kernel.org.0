Return-Path: <linux-media+bounces-30341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0E8A8B95C
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB69C3A6F6F
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E093D3B3;
	Wed, 16 Apr 2025 12:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ae7HDobQ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0111EA73
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807271; cv=none; b=cJrBHIl4GHAJK/0vDUS1LDwsNqoJasQtqLvaU4qYDgeAIOS6yExM4yIJk2044d3bzsXTH/3b/QcspgV3O8QtFw9lQi2l5hXQAK8krUCuLg4pt5uCZvxf4wZuKbRdhvOnQpIKhuy+ftgq0veq2LZ3jVoCqmoUP90xhd/fC9m4TiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807271; c=relaxed/simple;
	bh=vJOovRwT5oBTlJtE96qNm/0UqugHRiAShonypF+q16g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2E9e8r3/edpU5uf5r3km1FNlJzuQHIzAtmDlRms33/U+VTqVSXNi6ebRHjUpAln1/Op6bbL/bk/AaZwkZ4PM9lNDqHn8vlKKqqkOrjLKe+qvU6SAenosGCWG/z/s8YWQmffPJuPugJVhrMFHYdoj3o4srZ5P9TXTaMjVogKuFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ae7HDobQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744807269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CgikGdvC8j108bQE/mdQFjk6E8b6Q6tIt4AUZ/HzCuM=;
	b=Ae7HDobQysNDPHjGMMs0q+bhekTF9ntFuGAHiCOsiZfSCuSMnsLY4t83VhmHe0xk6gEC0E
	nNvSS0fZbn9UhT6+Y/AGIsTFERk8ftwNpfGP9B1ZCgMKhkEB1reObD7FuooPLmnKLuvqjH
	PEw0TxAgRVIcafN8dVM/aoANCqZXPP4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-zmyN06YZOI-dYprGeszR4Q-1; Wed,
 16 Apr 2025 08:41:02 -0400
X-MC-Unique: zmyN06YZOI-dYprGeszR4Q-1
X-Mimecast-MFC-AGG-ID: zmyN06YZOI-dYprGeszR4Q_1744807261
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 108A119560A6;
	Wed, 16 Apr 2025 12:41:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.34.142])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ACA25195608D;
	Wed, 16 Apr 2025 12:40:56 +0000 (UTC)
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
Subject: [PATCH v3 3/9] platform/x86: int3472: Drop unused gpio field from struct int3472_gpio_regulator
Date: Wed, 16 Apr 2025 14:40:31 +0200
Message-ID: <20250416124037.90508-4-hdegoede@redhat.com>
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

The gpio field in struct int3472_gpio_regulator is only briefly used to
store the GPIO in skl_int3472_register_regulator(). Instead just store
the GPIO directly into cfg.ena_gpiod an drop the gpio field.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
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


