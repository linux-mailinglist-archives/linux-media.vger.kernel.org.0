Return-Path: <linux-media+bounces-30442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE5BA91A54
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 13:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4C045A6126
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 11:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D4823875A;
	Thu, 17 Apr 2025 11:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RlSNzVh/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBB8238147
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 11:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888447; cv=none; b=gdeNoiwE2e2k/KOX/5QEszU0hWH9n+b2vPw4ezyrM4rwHZxWuljt3gSQnxk/tkm1W3hN6ANnCDpMWSAlo/nRFUXdZWLsD6yqiDFv1cuGlfLqn31rywC4eeUNe+j+F/GBoMWXUykESNgz59c4UDmrF7W3Yzq55cClqHVASZhiDIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888447; c=relaxed/simple;
	bh=nVnBfmspl+DON/YD3BIcEG78H4IhwBM2t0pL72M0Zjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QeBARs2ExiCLcvBZCOHD5uC0AuVdHMwDtXMQ/Jw4f0BbhzSw1HJTX7U0gGAfie0KuZvALCKihsDGo+ia9gC9Z99Py1Eji662ZYfdYfWGuOJjAnaMNSZEvNeWQAAjagVAZ8LV2rGfnhwczE46V/Y2Ixsd9agCWHRm7kIZM4MqM98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RlSNzVh/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744888441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XlHtPHUZ660q5i4ytAKPVW+2iA+L4bNpvIUVcx+G3mQ=;
	b=RlSNzVh/zeiHC2h+VNLkwOJGKiDsOo0Rf+eIdxu+neoaUkr5E4N4TGYu+oz9puP+5k4bh6
	Ru9M30aK7qlRJNgn4+YKpqJe/k8Cl/FAq20uFlZZwc3ZS5BSXfeicYzc7fpLRUJ8Una6l5
	+h4GToyMRn+DR2YklMPYzqQh9JeaGo8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-21-fZEMoCZpMoK4P88a2LQL6g-1; Thu,
 17 Apr 2025 07:13:58 -0400
X-MC-Unique: fZEMoCZpMoK4P88a2LQL6g-1
X-Mimecast-MFC-AGG-ID: fZEMoCZpMoK4P88a2LQL6g_1744888436
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 92541180087C;
	Thu, 17 Apr 2025 11:13:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.34.7])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E202E18002AD;
	Thu, 17 Apr 2025 11:13:52 +0000 (UTC)
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
Subject: [PATCH v4 2/9] platform/x86: int3472: Stop setting a supply-name for GPIO regulators
Date: Thu, 17 Apr 2025 13:13:30 +0200
Message-ID: <20250417111337.38142-3-hdegoede@redhat.com>
In-Reply-To: <20250417111337.38142-1-hdegoede@redhat.com>
References: <20250417111337.38142-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The supply_name field is not mandatory and is supposed to be set to
the name of another regulator when it is known that the regulator being
registered is supplied by that other regulator.

Having a regulator supplying the regulator which is being registered does
not apply to the INT3472 GPIO regulator, stop setting a supply_name.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/clk_and_regulator.c | 3 ---
 drivers/platform/x86/intel/int3472/common.h            | 5 +----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 837990af24fe..40434591dd0b 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -256,12 +256,9 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	snprintf(int3472->regulator.regulator_name,
 		 sizeof(int3472->regulator.regulator_name), "%s-regulator",
 		 acpi_dev_name(int3472->adev));
-	snprintf(int3472->regulator.supply_name,
-		 GPIO_REGULATOR_SUPPLY_NAME_LENGTH, "supply-0");
 
 	int3472->regulator.rdesc = INT3472_REGULATOR(
 						int3472->regulator.regulator_name,
-						int3472->regulator.supply_name,
 						&int3472_gpio_regulator_ops);
 
 	int3472->regulator.gpio = gpio;
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index 145dec66df64..72ef222629b6 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -27,17 +27,15 @@
 #define INT3472_MAX_SENSOR_GPIOS				3
 
 #define GPIO_REGULATOR_NAME_LENGTH				21
-#define GPIO_REGULATOR_SUPPLY_NAME_LENGTH			9
 #define GPIO_REGULATOR_SUPPLY_MAP_COUNT				2
 
 #define INT3472_LED_MAX_NAME_LEN				32
 
 #define CIO2_SENSOR_SSDB_MCLKSPEED_OFFSET			86
 
-#define INT3472_REGULATOR(_name, _supply, _ops)			\
+#define INT3472_REGULATOR(_name, _ops)				\
 	(const struct regulator_desc) {				\
 		.name = _name,					\
-		.supply_name = _supply,				\
 		.type = REGULATOR_VOLTAGE,			\
 		.ops = _ops,					\
 		.owner = THIS_MODULE,				\
@@ -82,7 +80,6 @@ struct int3472_discrete_device {
 		/* SUPPLY_MAP_COUNT * 2 to make room for second sensor mappings */
 		struct regulator_consumer_supply supply_map[GPIO_REGULATOR_SUPPLY_MAP_COUNT * 2];
 		char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
-		char supply_name[GPIO_REGULATOR_SUPPLY_NAME_LENGTH];
 		struct gpio_desc *gpio;
 		struct regulator_dev *rdev;
 		struct regulator_desc rdesc;
-- 
2.49.0


