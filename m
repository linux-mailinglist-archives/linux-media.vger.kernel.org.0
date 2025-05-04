Return-Path: <linux-media+bounces-31673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5287AA85DE
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 12:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1187A3BCA55
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 10:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF68E1A23B6;
	Sun,  4 May 2025 10:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dzs6322K"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC90193436
	for <linux-media@vger.kernel.org>; Sun,  4 May 2025 10:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746353665; cv=none; b=AQHg+eeAVRuyHwQMmOJtRKog967IHPKFLECztAplUWWSq4GY6vmB7ztAz+xBM/PWLAv9zVZHL4uG8ZbWJrgHXMy0bQ1T6fzWjVfRgFKOaMNneD/Qby0QC1DtQlqLQih3ABLzhKuUfJPxzqkE+PNq64pJa5eTMZwo3j96Y0ZOYA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746353665; c=relaxed/simple;
	bh=AslFh7oBQH6L6NOIkuD+MJZMrXDkBKdVRAIgvvVqgbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FdfFfPmM/JxKVhVGN84hI4Cit0FbQXv6cXy9NHz5xJ/5ZOBLoRv24duQwHOXC95IKUFRNThOsR9QyytR2bsDGGivJoSLSORP1ar/ie4Ed2bDXYdFpRe/DCx2Wrigoq0hEl2Kk07nAFw7uKHspueoKgH25svlaC/CkhVcKbtK4P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dzs6322K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746353662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SKXoU3eKpEQv7PyUJyy2GNLjdX3TIA2izx8WJ2vN35o=;
	b=Dzs6322KmZduUO2vv033O5DqEAa+yoP7FbOSBuhWzIiU17YLSb0OXGJLtEPMktSnPZSYc4
	nSxVCYDqy6orIr47XY4+83jbOSSAWn7dmJgTOOl3hEeBAbOatZCF2riPPe/1pWRrr9w5ZB
	/Ebz9oALO6pRAaFYWwyReDlX5J0E4sI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-322-br96YjJDOpaqIVtwXtHzRw-1; Sun,
 04 May 2025 06:14:17 -0400
X-MC-Unique: br96YjJDOpaqIVtwXtHzRw-1
X-Mimecast-MFC-AGG-ID: br96YjJDOpaqIVtwXtHzRw_1746353656
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6B33A1956048;
	Sun,  4 May 2025 10:14:16 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.28])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 256111800352;
	Sun,  4 May 2025 10:14:13 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 13/13] media: mt9m114: Add ACPI enumeration support
Date: Sun,  4 May 2025 12:13:34 +0200
Message-ID: <20250504101336.18748-14-hdegoede@redhat.com>
In-Reply-To: <20250504101336.18748-1-hdegoede@redhat.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Add support for the mt9m114 sensor being enumerated through ACPI
using the INT33F0 HID as found on the Asus T100TA.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/mt9m114.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index eba8232444c9..08e4d7ebcbd1 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2556,11 +2556,18 @@ static const struct of_device_id mt9m114_of_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mt9m114_of_ids);
 
+static const struct acpi_device_id mt9m114_acpi_ids[] = {
+	{ "INT33F0" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(acpi, mt9m114_acpi_ids);
+
 static struct i2c_driver mt9m114_driver = {
 	.driver = {
 		.name	= "mt9m114",
 		.pm	= &mt9m114_pm_ops,
 		.of_match_table = mt9m114_of_ids,
+		.acpi_match_table = mt9m114_acpi_ids,
 	},
 	.probe		= mt9m114_probe,
 	.remove		= mt9m114_remove,
-- 
2.49.0


