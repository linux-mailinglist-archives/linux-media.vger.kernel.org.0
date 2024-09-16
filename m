Return-Path: <linux-media+bounces-18307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EFD979E29
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 11:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D84A0280CE5
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 09:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BD114A4EB;
	Mon, 16 Sep 2024 09:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GocfpsO3"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00E114A4D1
	for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 09:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726478128; cv=none; b=XWz87iF3RtMJ7iPT7ceEpcwWXWxbjoMyPMOsclmOb49tuqhTPWHLRD46ipshjRVwU+Zt/xHhP7l5mTg08QmPsS6MSrd6Xk4myD+19ZA4Aa31XViEOZKud2OdJ9MqOGWjrix560hZYO+Oa/2Dtw1+652z7fP6nCyaiAh0XqZqqvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726478128; c=relaxed/simple;
	bh=no9FMBuciGwSEje/9dpr55+BjLrckOkZm1WWlWkH9+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XP8bvhVj1RuOR3hPSJChvHhe5fjxQsAMuYJaFPmzoFku2x1psRtkaAop4b04AC/pZIRWRqqddEPc3cE4aGnjTsKhvmtd+a7LQPQ23sPK63Z0cSL95MZOtmnLKF44fSmASyTBFHNhP3k7U/WQTSjy3TYKptCvOyVKjjiVhxX0a0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GocfpsO3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726478122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B1gwvJSddKllxmMaNvhBCJQlcWxxNGHOlsR5vJis1rk=;
	b=GocfpsO3L8QGn2HD6ViM2EDUR40IRwChnjWu50ng9I3plkvePtNtwSa6QLDFm5YDREIZjN
	LRp+pAC+/WDHd9KaA92SrUf4Eve1FfFdma2U7sCd94M3wQj1Ia9iFzJZIqnXF7Yh72yazT
	o29pLTonKSatBYKtLNnDWVc9P2bbkVY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-sWmAEzWHNda6rthRBUV1nw-1; Mon,
 16 Sep 2024 05:15:21 -0400
X-MC-Unique: sWmAEzWHNda6rthRBUV1nw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E048519560A2;
	Mon, 16 Sep 2024 09:15:19 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.139])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 02E571956088;
	Mon, 16 Sep 2024 09:15:15 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: atomisp: Remove unused libmsrlisthelper
Date: Mon, 16 Sep 2024 11:15:11 +0200
Message-ID: <20240916091512.81859-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Since commit 3a81c7660f80 ("media: staging: atomisp: Remove IMX sensor
support") the libmsrlisthelper code is no longer used, remove it.

Suggested-by: Dr. David Alan Gilbert <linux@treblig.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/Kconfig     |  10 -
 drivers/staging/media/atomisp/i2c/Makefile    |   2 -
 .../atomisp/i2c/atomisp-libmsrlisthelper.c    | 211 ------------------
 .../atomisp/include/linux/libmsrlisthelper.h  |  28 ---
 4 files changed, 251 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
 delete mode 100644 drivers/staging/media/atomisp/include/linux/libmsrlisthelper.h

diff --git a/drivers/staging/media/atomisp/i2c/Kconfig b/drivers/staging/media/atomisp/i2c/Kconfig
index 8710c483015c..f5ab23592f29 100644
--- a/drivers/staging/media/atomisp/i2c/Kconfig
+++ b/drivers/staging/media/atomisp/i2c/Kconfig
@@ -27,16 +27,6 @@ config VIDEO_ATOMISP_GC2235
 
 	  It currently only works with the atomisp driver.
 
-config VIDEO_ATOMISP_MSRLIST_HELPER
-	tristate "Helper library to load, parse and apply large register lists."
-	depends on I2C
-	help
-	  This is a helper library to be used from a sensor driver to load, parse
-	  and apply large register lists.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called libmsrlisthelper.
-
 config VIDEO_ATOMISP_MT9M114
 	tristate "Aptina mt9m114 sensor support"
 	depends on ACPI
diff --git a/drivers/staging/media/atomisp/i2c/Makefile b/drivers/staging/media/atomisp/i2c/Makefile
index 3073cfa75ecf..021a7ea0a075 100644
--- a/drivers/staging/media/atomisp/i2c/Makefile
+++ b/drivers/staging/media/atomisp/i2c/Makefile
@@ -7,5 +7,3 @@ obj-$(CONFIG_VIDEO_ATOMISP_MT9M114)    += atomisp-mt9m114.o
 obj-$(CONFIG_VIDEO_ATOMISP_GC2235)     += atomisp-gc2235.o
 obj-$(CONFIG_VIDEO_ATOMISP_OV2722)     += atomisp-ov2722.o
 obj-$(CONFIG_VIDEO_ATOMISP_GC0310)     += atomisp-gc0310.o
-
-obj-$(CONFIG_VIDEO_ATOMISP_MSRLIST_HELPER) += atomisp-libmsrlisthelper.o
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
deleted file mode 100644
index 3499353f8ea5..000000000000
--- a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
+++ /dev/null
@@ -1,211 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
- */
-#include <linux/i2c.h>
-#include <linux/firmware.h>
-#include <linux/device.h>
-#include <linux/export.h>
-#include "../include/linux/libmsrlisthelper.h"
-#include <linux/module.h>
-#include <linux/slab.h>
-
-/* Tagged binary data container structure definitions. */
-struct tbd_header {
-	u32 tag;          /*!< Tag identifier, also checks endianness */
-	u32 size;         /*!< Container size including this header */
-	u32 version;      /*!< Version, format 0xYYMMDDVV */
-	u32 revision;     /*!< Revision, format 0xYYMMDDVV */
-	u32 config_bits;  /*!< Configuration flag bits set */
-	u32 checksum;     /*!< Global checksum, header included */
-} __packed;
-
-struct tbd_record_header {
-	u32 size;        /*!< Size of record including header */
-	u8 format_id;    /*!< tbd_format_t enumeration values used */
-	u8 packing_key;  /*!< Packing method; 0 = no packing */
-	u16 class_id;    /*!< tbd_class_t enumeration values used */
-} __packed;
-
-struct tbd_data_record_header {
-	u16 next_offset;
-	u16 flags;
-	u16 data_offset;
-	u16 data_size;
-} __packed;
-
-#define TBD_CLASS_DRV_ID 2
-
-static int set_msr_configuration(struct i2c_client *client, uint8_t *bufptr,
-				 unsigned int size)
-{
-	/*
-	 * The configuration data contains any number of sequences where
-	 * the first byte (that is, uint8_t) that marks the number of bytes
-	 * in the sequence to follow, is indeed followed by the indicated
-	 * number of bytes of actual data to be written to sensor.
-	 * By convention, the first two bytes of actual data should be
-	 * understood as an address in the sensor address space (hibyte
-	 * followed by lobyte) where the remaining data in the sequence
-	 * will be written.
-	 */
-
-	u8 *ptr = bufptr;
-
-	while (ptr < bufptr + size) {
-		struct i2c_msg msg = {
-			.addr = client->addr,
-			.flags = 0,
-		};
-		int ret;
-
-		/* How many bytes */
-		msg.len = *ptr++;
-		/* Where the bytes are located */
-		msg.buf = ptr;
-		ptr += msg.len;
-
-		if (ptr > bufptr + size)
-			/* Accessing data beyond bounds is not tolerated */
-			return -EINVAL;
-
-		ret = i2c_transfer(client->adapter, &msg, 1);
-		if (ret < 0) {
-			dev_err(&client->dev, "i2c write error: %d", ret);
-			return ret;
-		}
-	}
-	return 0;
-}
-
-static int parse_and_apply(struct i2c_client *client, uint8_t *buffer,
-			   unsigned int size)
-{
-	u8 *endptr8 = buffer + size;
-	struct tbd_data_record_header *header =
-	    (struct tbd_data_record_header *)buffer;
-
-	/* There may be any number of datasets present */
-	unsigned int dataset = 0;
-
-	do {
-		/* In below, four variables are read from buffer */
-		if ((uint8_t *)header + sizeof(*header) > endptr8)
-			return -EINVAL;
-
-		/* All data should be located within given buffer */
-		if ((uint8_t *)header + header->data_offset +
-		    header->data_size > endptr8)
-			return -EINVAL;
-
-		/* We have a new valid dataset */
-		dataset++;
-		/* See whether there is MSR data */
-		/* If yes, update the reg info */
-		if (header->data_size && (header->flags & 1)) {
-			int ret;
-
-			dev_info(&client->dev,
-				 "New MSR data for sensor driver (dataset %02d) size:%d\n",
-				 dataset, header->data_size);
-			ret = set_msr_configuration(client,
-						    buffer + header->data_offset,
-						    header->data_size);
-			if (ret)
-				return ret;
-		}
-		header = (struct tbd_data_record_header *)(buffer +
-			 header->next_offset);
-	} while (header->next_offset);
-
-	return 0;
-}
-
-int apply_msr_data(struct i2c_client *client, const struct firmware *fw)
-{
-	struct tbd_header *header;
-	struct tbd_record_header *record;
-
-	if (!fw) {
-		dev_warn(&client->dev, "Drv data is not loaded.\n");
-		return -EINVAL;
-	}
-
-	if (sizeof(*header) > fw->size)
-		return -EINVAL;
-
-	header = (struct tbd_header *)fw->data;
-	/* Check that we have drvb block. */
-	if (memcmp(&header->tag, "DRVB", 4))
-		return -EINVAL;
-
-	/* Check the size */
-	if (header->size != fw->size)
-		return -EINVAL;
-
-	if (sizeof(*header) + sizeof(*record) > fw->size)
-		return -EINVAL;
-
-	record = (struct tbd_record_header *)(header + 1);
-	/* Check that class id mathes tbd's drv id. */
-	if (record->class_id != TBD_CLASS_DRV_ID)
-		return -EINVAL;
-
-	/* Size 0 shall not be treated as an error */
-	if (!record->size)
-		return 0;
-
-	return parse_and_apply(client, (uint8_t *)(record + 1), record->size);
-}
-EXPORT_SYMBOL_GPL(apply_msr_data);
-
-int load_msr_list(struct i2c_client *client, char *name,
-		  const struct firmware **fw)
-{
-	int ret = request_firmware(fw, name, &client->dev);
-
-	if (ret) {
-		dev_err(&client->dev,
-			"Error %d while requesting firmware %s\n",
-			ret, name);
-		return ret;
-	}
-	dev_info(&client->dev, "Received %lu bytes drv data\n",
-		 (unsigned long)(*fw)->size);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(load_msr_list);
-
-void release_msr_list(struct i2c_client *client, const struct firmware *fw)
-{
-	release_firmware(fw);
-}
-EXPORT_SYMBOL_GPL(release_msr_list);
-
-static int init_msrlisthelper(void)
-{
-	return 0;
-}
-
-static void exit_msrlisthelper(void)
-{
-}
-
-module_init(init_msrlisthelper);
-module_exit(exit_msrlisthelper);
-
-MODULE_AUTHOR("Jukka Kaartinen <jukka.o.kaartinen@intel.com>");
-MODULE_DESCRIPTION("Helper library to load, parse and apply large register lists");
-MODULE_LICENSE("GPL");
diff --git a/drivers/staging/media/atomisp/include/linux/libmsrlisthelper.h b/drivers/staging/media/atomisp/include/linux/libmsrlisthelper.h
deleted file mode 100644
index abc8fa809bce..000000000000
--- a/drivers/staging/media/atomisp/include/linux/libmsrlisthelper.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
- */
-#ifndef __LIBMSRLISTHELPER_H__
-#define __LIBMSRLISTHELPER_H__
-
-struct i2c_client;
-struct firmware;
-
-int load_msr_list(struct i2c_client *client, char *path,
-		  const struct firmware **fw);
-int apply_msr_data(struct i2c_client *client, const struct firmware *fw);
-void release_msr_list(struct i2c_client *client,
-		      const struct firmware *fw);
-
-#endif /* ifndef __LIBMSRLISTHELPER_H__ */
-- 
2.46.0


