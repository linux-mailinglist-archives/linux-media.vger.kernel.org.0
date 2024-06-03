Return-Path: <linux-media+bounces-12466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DEF8D83C6
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 15:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92E161F2297B
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 13:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCCD12D762;
	Mon,  3 Jun 2024 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cbJ488gZ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB2312D761
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 13:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717420875; cv=none; b=G/dOpWoneYSv/KtogmTwwlRMNS7ZjFfNCJLsMP6/fgZzDIiEe13GIEDWpsZ+ETUffAvZ59wEAEEqJaGkX0+rPDJfw1FdwPQnc82PML71q7Cq/K1I/wVBVag03zp8wHy95rbNPdscaPycOgAUNekM+ap0ZAY5VkXTry0PQp+UA7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717420875; c=relaxed/simple;
	bh=spejO9Ax59qDBxq1FpiCyDkZRm2XUKwAyhbS7yGL19Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdph1T4xzQ7t04QeQuGVUdHOxTyb+WHA/dqtMbYVjBpp9Wr3n1BjLFJ34Wgyvf4jPZl7Ry5SSYtXF7Ydgk5bvPCX49OEm4WQcKmOgxWh8+bJ2h4cANvjQJWV8v3e/jNO2+D22zNIURdkIaSOmmXHtJQJ9rrp86vQUiVTuW4Sa3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cbJ488gZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717420873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+IcFdSJronQ1oWSHAS+kEkqniZ7f8peJp91iub+LhQ=;
	b=cbJ488gZ/DEv8Wc/PN0bAzw7uMnmsFkzFvktipPbrhVUzmJyyDSqYh4RCES9E4QKQOMjqM
	IeCp9CtsT+XImwxS3izQIeNnPgW77+dCYhxbwPxf4QdCOKlnVKOV3dm3l+ijJCQvUaVuQh
	jngfT+UHqUfvJ2T71hX5QxN7RhoPIAM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-9jvRd3VtPTKq22AYvfJxvQ-1; Mon, 03 Jun 2024 09:21:07 -0400
X-MC-Unique: 9jvRd3VtPTKq22AYvfJxvQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A783D801785;
	Mon,  3 Jun 2024 13:21:06 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.39])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4409B5624;
	Mon,  3 Jun 2024 13:21:05 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 5/5] media: atomisp: csi2-bridge: Add DMI quirk for OV5693 on Xiaomi Mipad2
Date: Mon,  3 Jun 2024 15:20:57 +0200
Message-ID: <20240603132057.255917-5-hdegoede@redhat.com>
In-Reply-To: <20240603132057.255917-1-hdegoede@redhat.com>
References: <20240603132057.255917-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

The OV5693 the Xiaomi Mipad2 is used as a front facing sensor and
as such is connected to CsiPort 0, but the _DSM has CsiPort 1, add
a DMI quirk to override the wrong _DSM setting.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 03940c11505f..31c9e05a1435 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -106,6 +106,12 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
 	{}
 };
 
+static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
+	/* _DSM contains the wrong CsiPort for the front facing OV5693 sensor */
+	{ "INT33BE:00", "CsiPort", "0" },
+	{}
+};
+
 static const struct dmi_system_id gmin_cfg_dmi_overrides[] = {
 	{
 		/* Lenovo Ideapad Miix 310 */
@@ -115,6 +121,14 @@ static const struct dmi_system_id gmin_cfg_dmi_overrides[] = {
 		},
 		.driver_data = lenovo_ideapad_miix_310_vars,
 	},
+	{
+		/* Xiaomi Mipad2 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Xiaomi Inc"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Mipad2"),
+		},
+		.driver_data = xiaomi_mipad2_vars,
+	},
 	{}
 };
 
-- 
2.45.1


