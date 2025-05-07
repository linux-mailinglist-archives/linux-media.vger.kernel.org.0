Return-Path: <linux-media+bounces-31954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB187AADD26
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 13:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5C203B60CF
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 11:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6908A21A94F;
	Wed,  7 May 2025 11:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="dj04i0MV"
X-Original-To: linux-media@vger.kernel.org
Received: from forward100d.mail.yandex.net (forward100d.mail.yandex.net [178.154.239.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B068E21772A
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 11:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746616788; cv=none; b=LxCiXaEEbQvm/zhHwKgxo8e6iIBYFssSwqrSPj+nELvCicMcNljs4TsShhm8+6zUgBp92LHvl2atSV686mnzLaA5m1VmmQa0CGEDxFfXZA0Kqebt6YO6sukouBgNwTluCMlw5ihuKxV25oExp1CtF3jCYH9zvagoG/l5go5wMXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746616788; c=relaxed/simple;
	bh=uSX1x+evxO0ETIA/PkO9aq9lAyxufi2dG5NDvPivE2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KyCOICCyvxwpKDzfxLhnRv+h1ZEkdY+95Lba1R/R2NAau/lIWmSsreYnrNB7U5emdBDHrImQtpTk7tBFigmJd4rYtwozyqsETALNttY9UrIZ4UWG7jTe0hNsVw/eIWSP8p73Kmhl564w62/kay7VpeY5okYriJ8bmCTQ71DadTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=dj04i0MV; arc=none smtp.client-ip=178.154.239.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:2347:0:640:6ae5:0])
	by forward100d.mail.yandex.net (Yandex) with ESMTPS id 6651360958;
	Wed,  7 May 2025 14:19:38 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id bJbnwAELdmI0-JKETeZnd;
	Wed, 07 May 2025 14:19:37 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1746616778; bh=hzLOcFt7xLM+zg2uJywimRErozi+4yQ9eiaVBAeO3G0=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=dj04i0MVmuBlqpzM+sBUujX6oszDkm4eNX+qknOgxKujqmdUfGfXBNwEeHlIWueUq
	 KkhoYYqmzcmOOydlJioxVgguXJe2wrUqzqhdOhY55xZPJ2y/jmN6mQIXZnbRAmr7bd
	 Gq2fcsqEZqvpiiEc+5iR/nfDoIO4kgVOlktuXNaU=
Authentication-Results: mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] media: usb: as102: reset file private data on device release
Date: Wed,  7 May 2025 14:18:08 +0300
Message-ID: <20250507111808.546803-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case of successful 'as102_open()', store 'struct file' pointer
in 'struct as102_dev_t' data to ensure that file's private data
is reset to NULL after device removal via 'as102_usb_release()'.
Leaving private data dangling may be the reason of things like
https://syzkaller.appspot.com/bug?extid=47321e8fd5a4c84088db.
Since there is no reproducer, mark this as compile tested only.

Fixes: 41b44e041811 ("[media] staging: as102: Initial import from Abilis")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/media/usb/as102/as102_drv.h     | 3 +++
 drivers/media/usb/as102/as102_usb_drv.c | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/media/usb/as102/as102_drv.h b/drivers/media/usb/as102/as102_drv.h
index 4342c7ce3407..037795dd955f 100644
--- a/drivers/media/usb/as102/as102_drv.h
+++ b/drivers/media/usb/as102/as102_drv.h
@@ -61,6 +61,9 @@ struct as102_dev_t {
 	/* timer handle to trig ts stream download */
 	struct timer_list timer_handle;
 
+	/* used to reset private data on device release */
+	struct file *file;
+
 	struct mutex sem;
 	dma_addr_t dma_addr;
 	void *stream;
diff --git a/drivers/media/usb/as102/as102_usb_drv.c b/drivers/media/usb/as102/as102_usb_drv.c
index e0ef66a522e2..c1b8eb1d055a 100644
--- a/drivers/media/usb/as102/as102_usb_drv.c
+++ b/drivers/media/usb/as102/as102_usb_drv.c
@@ -304,6 +304,8 @@ static void as102_usb_release(struct kref *kref)
 
 	as102_dev = container_of(kref, struct as102_dev_t, kref);
 	usb_put_dev(as102_dev->bus_adap.usb_dev);
+	if (as102_dev->file)
+		as102_dev->file->private_data = NULL;
 	kfree(as102_dev);
 }
 
@@ -439,6 +441,9 @@ static int as102_open(struct inode *inode, struct file *file)
 	/* save our device object in the file's private structure */
 	file->private_data = dev;
 
+	/* save file's pointer to reset private data on release */
+	dev->file = file;
+
 	/* increment our usage count for the device */
 	kref_get(&dev->kref);
 
-- 
2.49.0


