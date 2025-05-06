Return-Path: <linux-media+bounces-31846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0A1AAC3B1
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 14:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90BC33AD8DA
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 12:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB8D27FB0C;
	Tue,  6 May 2025 12:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fiin0zTB"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69B01DDE9
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533934; cv=none; b=rD83VaiCGYmzyohwelaY6uVhEf2WJpD4R+yTLTUsDAi6Ijp9DBILDs6lsMHw/uqbCZofvg/LK08rjc0Lt8m/XUUpAx/KwgWm5Vr/aM+lpdF8ETlOead2tnsFxojW5HI7PXyB5ZZHQiVcBKhsQYg9GeOTqhbvhHQdlMQyN5TfGPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533934; c=relaxed/simple;
	bh=eThdzJElMjho2lOikLfo7PezK0gG++8zqgDmvflFbG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ef60V4pMrv6pDhpBoqKJV+4HUxyQOKopvdOz+JqHq2wGIS4l0CorozkfvNHge35nvFMRWDZmEw9VH0G94Nd6id9IrUsRwNFkb7zy+tAgqUMbb6Lx5//nmCRsg5hoElXWcvbuT5KGbTXlVwODwrNIPqCGqjLFutZc6Hwku6uXrXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fiin0zTB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746533931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=S55F//gi6KZ1m8cN/BFRl94mV6eKsImKhnwhe1eLFio=;
	b=Fiin0zTBcWoKJvitO78DmVASRoxlx20dJngaOv3LkgSy9p7mR3NYjszAHNkkbQotKbXtPv
	aw3orcfj+/S+ryY4SWNF4GmwWCveFMxSNNG7NBnctZ7QNAkQtTWrXiyWsFBsNZTT92MP00
	cCl9VJ3Mc1eoqYcNPA94uwgoo0p3ScQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-464-wbe4KHLBPuay7DagTkvo7w-1; Tue,
 06 May 2025 08:18:48 -0400
X-MC-Unique: wbe4KHLBPuay7DagTkvo7w-1
X-Mimecast-MFC-AGG-ID: wbe4KHLBPuay7DagTkvo7w_1746533927
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 70F4118009A1;
	Tue,  6 May 2025 12:18:47 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.225.249])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6AB63195608D;
	Tue,  6 May 2025 12:18:45 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: ipu-bridge: Add Onsemi MT9M114 HID to list of supported sensors
Date: Tue,  6 May 2025 14:18:42 +0200
Message-ID: <20250506121843.250995-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Add INT33F0 ACPI HID for the Onsemi MT9M114 sensor to the list of supported
sensors. This sensor is found on the Asus T100TA using this HID.

Tested-by: Hans de Goede <hdegoede@redhat.com> # Asus T100TA with MT9M114
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index eb41f0ac8a90..a12bc1676c81 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -58,6 +58,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT0310", 0),
 	/* Omnivision OV5693 */
 	IPU_SENSOR_CONFIG("INT33BE", 1, 419200000),
+	/* Onsemi MT9M114 */
+	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
 	/* Omnivision OV8865 */
-- 
2.49.0


