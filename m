Return-Path: <linux-media+bounces-28728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 309E2A7068C
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 17:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B79D3BF14F
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 16:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A1C2586C3;
	Tue, 25 Mar 2025 16:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bqJQ2m2X"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2459E253B62
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 16:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742919271; cv=none; b=Sz4lD2/0xya385ofnu25ZMIpPJ2B5yGE0Dn/vQ50wLj9v4XfNMEMU7uqCEeo9j10T3lJjEuT5NrMvSi6sFZ8Rmus07uRIE6f+s3EELETnB9Nc8T1a84E9zBn623WGYp7/8GNcYAOsjwvsHVVLsAc2Zq4uFi7/5VTSqgEfdBAPgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742919271; c=relaxed/simple;
	bh=xHtTjOnfqslyEf5nNraAARjtXo0yA93xXulC8FlcSGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KHSJR8SlC+etzFJHjnHBOueL7hIkL5VZt5kqvC9hrXePsBT/M4yYdWZwdIoEkWdGEF2l9A6umEOYvYtmR7GxggL14lB95xvEVd0e1lZFPUVtraYTIe/0m8przd1H/pC2mH1H2VFqOVnqE0k4oDs/xyutmMk35Kp/eGzUn9/5iu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bqJQ2m2X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742919268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oY04XDzTqG5kgSmTQQlmF75HpIxb7CjotpT08cdY0RY=;
	b=bqJQ2m2X+sRy5OV5oBe0FrS6eVs/NXZrHYcdGAhR+KxxnYTTzBqlUR77kp5JSvobnESpWF
	DZh9ovnrPNS3Ix/csGRoSck3od9rys2grqcn8mNnTKUqMB4pZYT+acNEGRVJoO+cs5ESoC
	oRjI+SZXn1goqGVoHtrIKejL7cK4jvU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-361-_fu3mrA_MmKk0qLBCMJ6Kg-1; Tue,
 25 Mar 2025 12:14:23 -0400
X-MC-Unique: _fu3mrA_MmKk0qLBCMJ6Kg-1
X-Mimecast-MFC-AGG-ID: _fu3mrA_MmKk0qLBCMJ6Kg_1742919262
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3D6031808868;
	Tue, 25 Mar 2025 16:14:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.32.136])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1AB35180A802;
	Tue, 25 Mar 2025 16:14:16 +0000 (UTC)
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
Subject: [PATCH 8/8] platform/x86: int3472: Debug log when remapping pins
Date: Tue, 25 Mar 2025 17:13:40 +0100
Message-ID: <20250325161340.342192-9-hdegoede@redhat.com>
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

Debug log when remapping a pin/function because of a int3472_gpio_map[]
match.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 903b35f999d0..eab4235f4b38 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -146,9 +146,10 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
 	{ "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, false, "enable" },
 };
 
-static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
+static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3472, u8 *type,
 					    const char **con_id, unsigned long *gpio_flags)
 {
+	struct acpi_device *adev = int3472->sensor;
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(int3472_gpio_map); i++) {
@@ -163,6 +164,9 @@ static void int3472_get_con_id_and_polarity(struct acpi_device *adev, u8 *type,
 		if (!acpi_dev_hid_uid_match(adev, int3472_gpio_map[i].hid, NULL))
 			continue;
 
+		dev_dbg(int3472->dev, "mapping type 0x%02x pin to 0x%02x %s\n",
+			*type, int3472_gpio_map[i].type_to, int3472_gpio_map[i].con_id);
+
 		*type = int3472_gpio_map[i].type_to;
 		*gpio_flags = int3472_gpio_map[i].polarity_low ?
 			      GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
@@ -267,7 +271,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 	type = FIELD_GET(INT3472_GPIO_DSM_TYPE, obj->integer.value);
 
-	int3472_get_con_id_and_polarity(int3472->sensor, &type, &con_id, &gpio_flags);
+	int3472_get_con_id_and_polarity(int3472, &type, &con_id, &gpio_flags);
 
 	pin = FIELD_GET(INT3472_GPIO_DSM_PIN, obj->integer.value);
 	/* Pin field is not really used under Windows and wraps around at 8 bits */
-- 
2.49.0


