Return-Path: <linux-media+bounces-67643-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xxJnIzNTV2pKJQEAu9opvQ
	(envelope-from <linux-media+bounces-67643-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:30:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 704E275C82F
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:30:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b="Lhc5T5d/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67643-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67643-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B26830071D7
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 09:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23D142B73B;
	Wed, 15 Jul 2026 09:30:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E27B429CC9;
	Wed, 15 Jul 2026 09:30:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784107818; cv=none; b=kn7wZehpN/eOqPgf+v1gvKKRSQtCuO6OSHOUSkZ/II2R/8IAClszjF6P+6nJUjD3LV5c9vQUMpHGmxdOOa+7ZX1+RrtR8efOnK5f6VTupGWabK8NOrct1Q1MBR52g2qAOoDMXeqxqyEdwXyYeF7UMeE5nHXh/b4Lx7StgJ1hykc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784107818; c=relaxed/simple;
	bh=2Kjc1BFOlgtJD8UJVtCyfhTiy2g23YKOQgb14GMfVoc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mfPDR0jf104ulP4H8QctRHHwbAn+2BksS3XtgzXXOXOZCc/ZEXADi5Oy83zNZDABMFmXhLd77HNeWl9OO681LbHqsGxRL3k7w2YpBQU6QKx7Yng459PbntRXc6+caqNh+RnTzMEuKZQc+1wVaU3sDQsMyCzU7hpGsgJy8+o/33k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Lhc5T5d/; arc=none smtp.client-ip=117.135.210.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=dy
	Q/fBxWoHZujlVBtTLZ1u8mkNl5Uaj9BWlYZ5OHHHQ=; b=Lhc5T5d/BA+Bshw3pI
	JkQQqGaLJOHe3SYgN0w77XxczzBVxm8pSpWD91Ti/pzAkyV+7Y/qYpbifExNxNsC
	1iOfkeYHwQ/rNEL5tspit/zRD5QXV3HVEAmQwhgkLcMFIceX6ATG0higQenxS7qf
	8Dp/y+LF4t9zJXL1ple4g0JPA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAXXroOU1dqRkKLJg--.52959S2;
	Wed, 15 Jul 2026 17:29:51 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2 1/2] media: s2255: Rename CamelCase goto labels to snake_case
Date: Wed, 15 Jul 2026 17:29:46 +0800
Message-Id: <20260715092947.772768-1-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXXroOU1dqRkKLJg--.52959S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr47Gr13tryUJw43XF4rAFb_yoWrAr48pa
	yxWa9Ygr4UJw1fJr9xJFWUW3WrWw48G3y5CFy2y397XryYy34kA3W8t34xuay2krW0ya17
	A3s8W3yj9rWqgFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8iSdUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC9A9IP2pXUw8zMAAA3u
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[huanglei814@163.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:johan@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:huanglei@kylinos.cn,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67643-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[huanglei814@163.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,kylinos.cn:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 704E275C82F

From: Lei Huang <huanglei@kylinos.cn>

Rename the error-path goto labels in s2255_probe() from CamelCase to
snake_case to comply with the Linux kernel coding style:

  errorBOARDINIT -> err_boardinit
  errorFWMARKER  -> err_fwmarker
  errorREQFW     -> err_reqfw
  errorFWDATA2   -> err_fwdata2
  errorFWURB     -> err_fwurb
  errorEP        -> err_ep
  errorUDEV      -> err_udev
  errorFWDATA1   -> err_fwdata1

No functional changes; all label definitions and goto references are
updated consistently.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 36 +++++++++++++++---------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 0b8182edf8e4..f22f6ad4e8ba 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -2216,14 +2216,14 @@ static int s2255_probe(struct usb_interface *interface,
 	dev->cmdbuf = kzalloc(S2255_CMDBUF_SIZE, GFP_KERNEL);
 	if (dev->cmdbuf == NULL) {
 		s2255_dev_err(&interface->dev, "out of memory\n");
-		goto errorFWDATA1;
+		goto err_fwdata1;
 	}
 
 	refcount_set(&dev->num_channels, 0);
 	dev->pid = id->idProduct;
 	dev->fw_data = kzalloc_obj(struct s2255_fw);
 	if (!dev->fw_data)
-		goto errorFWDATA1;
+		goto err_fwdata1;
 	mutex_init(&dev->lock);
 	mutex_init(&dev->cmdlock);
 	/* grab usb_device and save it */
@@ -2231,7 +2231,7 @@ static int s2255_probe(struct usb_interface *interface,
 	if (dev->udev == NULL) {
 		dev_err(&interface->dev, "null usb device\n");
 		retval = -ENODEV;
-		goto errorUDEV;
+		goto err_udev;
 	}
 	dev_dbg(&interface->dev, "dev: %p, udev %p interface %p\n",
 		dev, dev->udev, interface);
@@ -2243,7 +2243,7 @@ static int s2255_probe(struct usb_interface *interface,
 
 	if (usb_find_bulk_in_endpoint(iface_desc, &endpoint)) {
 		dev_err(&interface->dev, "Could not find bulk-in endpoint\n");
-		goto errorEP;
+		goto err_ep;
 	}
 
 	dev->read_endpoint = endpoint->bEndpointAddress;
@@ -2262,18 +2262,18 @@ static int s2255_probe(struct usb_interface *interface,
 
 	dev->fw_data->fw_urb = usb_alloc_urb(0, GFP_KERNEL);
 	if (!dev->fw_data->fw_urb)
-		goto errorFWURB;
+		goto err_fwurb;
 
 	dev->fw_data->pfw_data = kzalloc(CHUNK_SIZE, GFP_KERNEL);
 	if (!dev->fw_data->pfw_data) {
 		dev_err(&interface->dev, "out of memory!\n");
-		goto errorFWDATA2;
+		goto err_fwdata2;
 	}
 	/* load the first chunk */
 	if (request_firmware(&dev->fw_data->fw,
 			     FIRMWARE_FILE_NAME, &dev->udev->dev)) {
 		dev_err(&interface->dev, "sensoray 2255 failed to get firmware\n");
-		goto errorREQFW;
+		goto err_reqfw;
 	}
 	/* check the firmware is valid */
 	fw_size = dev->fw_data->fw->size;
@@ -2282,7 +2282,7 @@ static int s2255_probe(struct usb_interface *interface,
 	if (*pdata != S2255_FW_MARKER) {
 		dev_err(&interface->dev, "Firmware invalid.\n");
 		retval = -ENODEV;
-		goto errorFWMARKER;
+		goto err_fwmarker;
 	} else {
 		/* make sure firmware is the latest */
 		__le32 *pRel;
@@ -2300,30 +2300,30 @@ static int s2255_probe(struct usb_interface *interface,
 	/* load 2255 board specific */
 	retval = s2255_board_init(dev);
 	if (retval)
-		goto errorBOARDINIT;
+		goto err_boardinit;
 	s2255_fwload_start(dev);
 	/* loads v4l specific */
 	retval = s2255_probe_v4l(dev);
 	if (retval)
-		goto errorBOARDINIT;
+		goto err_boardinit;
 	dev_info(&interface->dev, "Sensoray 2255 detected\n");
 	return 0;
-errorBOARDINIT:
+err_boardinit:
 	s2255_board_shutdown(dev);
-errorFWMARKER:
+err_fwmarker:
 	release_firmware(dev->fw_data->fw);
-errorREQFW:
+err_reqfw:
 	kfree(dev->fw_data->pfw_data);
-errorFWDATA2:
+err_fwdata2:
 	usb_free_urb(dev->fw_data->fw_urb);
-errorFWURB:
+err_fwurb:
 	timer_shutdown_sync(&dev->timer);
-errorEP:
+err_ep:
 	usb_put_dev(dev->udev);
-errorUDEV:
+err_udev:
 	kfree(dev->fw_data);
 	mutex_destroy(&dev->lock);
-errorFWDATA1:
+err_fwdata1:
 	kfree(dev->cmdbuf);
 	kfree(dev);
 	pr_warn("Sensoray 2255 driver load failed: 0x%x\n", retval);
-- 
2.25.1


