Return-Path: <linux-media+bounces-30449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C95D1A91A5D
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 13:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13CE33A9457
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 11:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55030238173;
	Thu, 17 Apr 2025 11:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LOUnWDIr"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A99B238C18
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 11:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888475; cv=none; b=Q3eeqFZUZcjEyHisGyXHf0vARW7Cj8z6KB3N8bnf0nJfOQI5LHrnsSrGhdChPJXWnZ6rpMJQ0f5OISjhGlwq52KaXzyScwvG/cBLzFaxPohtmuPzQt+K4F0mMsqWksPjZoMWDxm1ZWl0+3siqX4p8JjF4wyaKQ6AY7EqEKyexGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888475; c=relaxed/simple;
	bh=4A1gHcjAmIV5ZH+g5WDpCt9GGv1Z7fyOyQagXYu8U8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TG6TAj7nBovzKf2t/xTWeiLPhDjpbBVtTfexNe2sf8at5p6/32mCm173srXe3fFyXUEm5vV/qWTKmNGI+36cQiax/3dqPAcrWVgYSIM5q0fPe0+1DI2ggbTULH0BwZJgXrapgVSi/RmFivoCqXOfrP831c+Spqc1AILRx1VpDK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LOUnWDIr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744888470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FKgWBrGNN4/2FyqMIQl+z4/Z9VFWr/dDKLcwoAB3Sow=;
	b=LOUnWDIr5A/nVAkYjc/yFLnOexe/dHTRrCWFf0W1ax+a3WjtRoTWpN1jiDTPyV7kNqqeNz
	9QpkcUe71/L5KQRtxEoiBXIQ3sa4ZZehAdCtNHrtwJMXHRE45U4VX4n0ZGRO4QYiq3n5LC
	kOi1eUOg9+SwJ16ADFsKldSd9XBBw9s=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-665-ksIidirGM9m4K5Gmu6_3iQ-1; Thu,
 17 Apr 2025 07:14:26 -0400
X-MC-Unique: ksIidirGM9m4K5Gmu6_3iQ-1
X-Mimecast-MFC-AGG-ID: ksIidirGM9m4K5Gmu6_3iQ_1744888464
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C87CE1956094;
	Thu, 17 Apr 2025 11:14:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.34.7])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5A962180045C;
	Thu, 17 Apr 2025 11:14:21 +0000 (UTC)
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
Subject: [PATCH v4 9/9] platform/x86: int3472: Debug log when remapping pins
Date: Thu, 17 Apr 2025 13:13:37 +0200
Message-ID: <20250417111337.38142-10-hdegoede@redhat.com>
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

Debug log when remapping a pin/function because of a int3472_gpio_map[]
match.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index bcc7bb122a56..394975f55d64 100644
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


