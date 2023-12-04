Return-Path: <linux-media+bounces-1551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A778B803333
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 617E8281018
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 12:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C5F2420B;
	Mon,  4 Dec 2023 12:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="icckBK+w"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3822C3
	for <linux-media@vger.kernel.org>; Mon,  4 Dec 2023 04:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701693608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=orLuRfxIetcHEw9MMbuL2S74NUj1NlcceSFJMVB6MsQ=;
	b=icckBK+wLwmRO7lGRA60L+DbcO2H0q2HpN6hfv0pe2CfhO2vSf0eA+v5v09Qd3qmZOdoYe
	RZ4fiSiE9lXky45XjpJwgzgSdEO+8mDL3aAo8ctKeSHp3hLqobVgpntafWT+5Dj4DnZH46
	wtnYd9jvGgfSQKZxNQPoxPG529K3aOA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-B41vNluQMY262_sAuXl0nQ-1; Mon, 04 Dec 2023 07:40:03 -0500
X-MC-Unique: B41vNluQMY262_sAuXl0nQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 140748007B3;
	Mon,  4 Dec 2023 12:40:03 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.73])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1FA1D40C6EBC;
	Mon,  4 Dec 2023 12:40:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v4 9/9] media: ipu-bridge: Change ov2740 link-frequency to 180 MHz
Date: Mon,  4 Dec 2023 13:39:46 +0100
Message-ID: <20231204123947.5754-10-hdegoede@redhat.com>
In-Reply-To: <20231204123947.5754-1-hdegoede@redhat.com>
References: <20231204123947.5754-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

The only known devices that use an ov2740 sensor in combination with
the ipu-bridge code are various Lenovo ThinkPad models, which all
need the link-frequency to be 180 MHz for things to work properly.

The ov2740 driver used to only support 360 MHz link-frequency,
which is why the ipu-bridge entry used 360 MHz, but now the
ov2740 driver has been extended to also support 180 MHz.

The ov2740 is actually used with 360 MHz link-frequency on Chromebooks.
On Chromebooks the camera/sensor fwnode graph is part of the ACPI tables.
The ipu-bridge code is used to dynamically generate the graph when it is
missing, so it is not used on Chromebooks and the ov2740 will keep using
360 MHz link-frequency there as before.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index e38198e259c0..f980e3125a7b 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -53,7 +53,7 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* Omnivision ov8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
 	/* Omnivision ov2740 */
-	IPU_SENSOR_CONFIG("INT3474", 1, 360000000),
+	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
 	/* Hynix hi556 */
 	IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
 	/* Omnivision ov13b10 */
-- 
2.43.0


