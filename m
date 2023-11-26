Return-Path: <linux-media+bounces-1049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E911B7F9303
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 15:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD9FCB21044
	for <lists+linux-media@lfdr.de>; Sun, 26 Nov 2023 14:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0FEDDD8;
	Sun, 26 Nov 2023 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P2/fvupF"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA6C93
	for <linux-media@vger.kernel.org>; Sun, 26 Nov 2023 06:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701008138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KCKhLRnQDtnZkqxQQSWrlj7RcZm7z14IhJgsBTHOrUc=;
	b=P2/fvupFso4IouhM4g7ccXh5z7Pnj1smb4qr4r+rd0AFrAkGH0mCZkMlpNxRl5cijBdmdJ
	MmAazEhleJ8PaKl//OjnVZDYqlPzHE4qB+hFYmiz544AkmAcJoK4qaRtB/TlRZhvvxwNpi
	riv3ttbkdkeuk4JE/5SH4w2WmopASkQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-WdTQ0ng-P7qQJFn6NbcbHQ-1; Sun, 26 Nov 2023 09:15:35 -0500
X-MC-Unique: WdTQ0ng-P7qQJFn6NbcbHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E71FF8007B3;
	Sun, 26 Nov 2023 14:15:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EDED42027019;
	Sun, 26 Nov 2023 14:15:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 9/9] media: ipu-bridge: Change ov2740 link-frequency to 180 MHz
Date: Sun, 26 Nov 2023 15:15:17 +0100
Message-ID: <20231126141517.7534-10-hdegoede@redhat.com>
In-Reply-To: <20231126141517.7534-1-hdegoede@redhat.com>
References: <20231126141517.7534-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

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
2.41.0


