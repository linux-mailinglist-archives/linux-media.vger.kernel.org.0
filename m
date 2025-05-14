Return-Path: <linux-media+bounces-32521-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA49CAB7197
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 18:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79BCC1896ED8
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 16:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A3F278E60;
	Wed, 14 May 2025 16:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aUWHqqkg"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D1217993
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 16:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240685; cv=none; b=s466LGuCHxQ+DWamNe5LbIw6MQiY4/wAIoKbXxDINeJu2T2JVmiKPOcQKIbnzj7jw2lz4NUjQgDL8hIzAEx6jT8bAkYYeERzrIYtfLDxYT9Y00AUK7K427zN/GXraiDs82kDTev/KZqGTRH4kjVPHeQTHf//F71z8vm671vis3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240685; c=relaxed/simple;
	bh=t5H40jSRgeg76HN3EwYHPX/zwYlm+UPMZyvB28u3gGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IAAT0kdbyIqcRiCy33VIsWlrA3y9DnJOUl0rf8y1FLIh2FNZOKVw1V/mGn/iRCbcTln4Z6dNvP7rX2kCJHp+cq5S280pAs3QthKR+r0Yp/FNfc9HoOUFV3rcwFFUfyACOqhnwuamHewQ9pq8N2h9cJ7l5TMrQ3i4yxSZzY9dHqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aUWHqqkg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747240682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HUKAjGS3NRNn8NzTCy70R7Y6WNm9h2g+oqTyiW4y1cQ=;
	b=aUWHqqkg4QgCDbRMKPiiyQBoytTwHJO0dshONZNo3GXfIF+qJtCvpTM7D/AMrj7t6TzKxQ
	bwBlvBdllcQ3aZPFMZFnTF+dggn1+tH7Qh5jJ75oQ0JcT5T97lvBgy/ocP4YMrOUZ2obTN
	5KuN+3dWhXNZy5SIhtcPrYJYGBN/eeM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-178-C84HTILFOX-EpUsdEPWg9g-1; Wed,
 14 May 2025 12:37:59 -0400
X-MC-Unique: C84HTILFOX-EpUsdEPWg9g-1
X-Mimecast-MFC-AGG-ID: C84HTILFOX-EpUsdEPWg9g_1747240678
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E351195DE61;
	Wed, 14 May 2025 16:37:58 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.44.32.105])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 25A361944B1A;
	Wed, 14 May 2025 16:37:55 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: ipu-bridge: Add link-frequency to the GC0310 entry
Date: Wed, 14 May 2025 18:37:54 +0200
Message-ID: <20250514163754.43879-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Add the missing link-frequency to the ipu_supported_sensors[] array's
Galaxy Core GC0310 entry.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index a12bc1676c81..ea9fe5fcd09b 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -55,7 +55,7 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* Himax HM2172 */
 	IPU_SENSOR_CONFIG("HIMX2172", 1, 384000000),
 	/* GalaxyCore GC0310 */
-	IPU_SENSOR_CONFIG("INT0310", 0),
+	IPU_SENSOR_CONFIG("INT0310", 1, 55692000),
 	/* Omnivision OV5693 */
 	IPU_SENSOR_CONFIG("INT33BE", 1, 419200000),
 	/* Onsemi MT9M114 */
-- 
2.49.0


