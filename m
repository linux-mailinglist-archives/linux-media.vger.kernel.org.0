Return-Path: <linux-media+bounces-29266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7949DA79686
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 22:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90FCD3B43CE
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 20:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAB81F3B83;
	Wed,  2 Apr 2025 20:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZhfTF/qT"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55201F236C
	for <linux-media@vger.kernel.org>; Wed,  2 Apr 2025 20:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625561; cv=none; b=eoG0GWAq3rtH3MT9VNFd+47lTBCaZsyjNe8lttNRMWUcwEhqlIsBH2lJnWlxz2J6HilR5+qwm8gjND4FG6khpSbZXYrBfQBlWGGZ2J5znoK+eSjDLqIOpF+bdQ6Bn0w7H4c9z7uEaFwoYakZdtyUuRoyrAlymZp+8jLAfieSgvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625561; c=relaxed/simple;
	bh=4TFCQkjm8ZWoMygApTj7O9FRLHI9Is5CTNrUGm+RH3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BYnYlLLGDoT4EmlvKMDTX6i8mKNI5Ka3vZ4wUMz1HjQmc4xXYEWO+iQEj3ztEbpsXOMP73FofO7t1cdK/H1F3xLeu63+VvzJ98NCQrnh45FgmkfTFLLzJaEvB+R/gtAzonwwlOkezJk/G/5OufSKwhg3rPmhOAh61Xfo/ABbeRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZhfTF/qT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743625558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qx7NFNg0lzrd3DInGFHSRimrSYUHOEl4hi7oupjLJcs=;
	b=ZhfTF/qTYzE0HebHY2/LKi0QU+shjB8pvlcPScV2E6h8hVyMifW8r6DimcdxVaPp/AYsKp
	KzblP0AtWVjHGQnAC1ivSuZhbHMGRF1XpX4cYbKXpPa+w4QM2KSIbgkCp4NLPOJACWWROC
	VIjloi6qLVZ9fiBHrxdrj4ggWGSync4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-556-Octwrw7JO1WsksP4mTFOKw-1; Wed,
 02 Apr 2025 16:25:53 -0400
X-MC-Unique: Octwrw7JO1WsksP4mTFOKw-1
X-Mimecast-MFC-AGG-ID: Octwrw7JO1WsksP4mTFOKw_1743625551
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD1781800258;
	Wed,  2 Apr 2025 20:25:51 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.44.32.69])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 64C661801752;
	Wed,  2 Apr 2025 20:25:48 +0000 (UTC)
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
Subject: [PATCH v2 9/9] platform/x86: int3472: Debug log when remapping pins
Date: Wed,  2 Apr 2025 22:25:10 +0200
Message-ID: <20250402202510.432888-10-hdegoede@redhat.com>
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

Debug log when remapping a pin/function because of a int3472_gpio_map[]
match.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 4dddba4e1fde..9fd4fce7063c 100644
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


