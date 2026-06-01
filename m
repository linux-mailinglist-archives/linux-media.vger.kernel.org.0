Return-Path: <linux-media+bounces-63283-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CmTHn6lHWr5cgkAu9opvQ
	(envelope-from <linux-media+bounces-63283-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:30:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B97621BAA
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 30BE9301878B
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 15:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91D73DB318;
	Mon,  1 Jun 2026 15:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVxcXrPx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFDA3DB324
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 15:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327619; cv=none; b=Miq1MaoxmL3c9WQlN5yvdi8/UXAM+ayFupNgiOgyO2c1gskMdeFH20MY8eBA+uYMAi2QvkXamByRGJVeSllJEpWqGoQnbTHe8Hiut5TuvqQXovVGVXwwYQS6wZCgDsHnwgsewENwPbHiJMZIp1csUlk4IU2q7r4m9BnMkOY3q60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327619; c=relaxed/simple;
	bh=Dom/OBqAZGodnCE/T9Y1Sbt2RRI/kwyL909HVty7DJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8EJrkh70wqQQ9BMuFeE6zcaCkef1XpgUGyFkjFYSIb+unxzca1cBuKGCjgv/Ndadt0c84nmPUspg2c7HtO8TIX1uT1oMMP6zau+FiupipCeEjdQpo5TeTwBWe45QYXLzuQ+WNhlurK6VLuzP2M6G3TZiMZzDPiHT7T6Mq7x66A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVxcXrPx; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ccd1f57b32so56191426d6.2
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 08:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327610; x=1780932410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgcr4kRnavya7iTNuTNnh5xrfyv778Tvy0/PoadSxg8=;
        b=GVxcXrPxUatmaH9ZLy8z6LUN6dxosdjsYz6kN+6lhOID+bfgRlN8SvZz35pypHfB15
         nJtXpL6RfYzV0Bm4+r/eEIjoKkZ3HX9DfWYQeOQfA3qG0Wh//4BwHttQfPj+gTjpOQsT
         HyFv/iy0uf2uqslFp3ZB1qL7dBgwbB4I+PVhLebbCFuO2FYBj28Bw9RgIfQ7DmJHjCsR
         veFwIiDVyNRvnBX0ozMf4unXxNHsFdeH47Cv90W+ZzdWdVftCVQJi062YUH/hUpkbzkd
         GRzwS/npqdiqqgGefMLHzdcKZjRbzfhjG45gTEes2s2SZf5x7mf7bUW/AhxCxzSswGDc
         wwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327610; x=1780932410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dgcr4kRnavya7iTNuTNnh5xrfyv778Tvy0/PoadSxg8=;
        b=FOqOR/+61TNs47zWR0SYxI4sZBnafpEZpVq0TAs5g6vxROxt4VzhO+lLIowtn7I2u6
         V3ORMyKvV3j+po0IwVDuOm3ZddIo0YnsEj4iNWBdKP/oxOlQLXDZbfvBfK+ZJlKWNP6S
         w0t+tlqPDUxLsM984YEyLvUaFeyl2tI58e9ozLW1/dIjHljiBo9tkMrcaIxvikep3CwA
         GPpAyiRci/nGQ3JrzEIwDy3jfIS4quxei/sr8GfsW/XJVgV6UEB26/6o7slq6nMPpWZX
         Zai0RHShXw5FQWPHN1DZwEQD6DRr5XE5L7p5P5HZpgPLV7fCXWD1CwkZg3EOP6+NKMWz
         /5IQ==
X-Forwarded-Encrypted: i=1; AFNElJ+FcS7Sa7KWCuOj7CSbEt5pCSFQ9bAKx5WOrebCeTf2BTu2skPalB873TRCc5z8RXQC6Vrb5wlHqGdU+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjeEM9tHPY09HnT6dxzNYfjRJR0apeXd4VmYzkcy09spe3+WdK
	t/Oa18o4ZKzuRpRHhBLYsqYhksQT27DbO3ayUFA4qweMYGErYG7RYchd
X-Gm-Gg: Acq92OHCe7wI+RzOKzGxn8SLVySv0H5TjWh0BLdlx1XqH4wbysJj0NHxROGrfgKuJgN
	n6r0/rh5OosSMXeb7+SlaqNUEsLu1vronCZpkFNKkKVCrbiStxNo5zI/duFsjxqRRiR91Rsc4KC
	KTmkX7rMgnrWjA1f92Pjn/YDUJpM3gLi+q8oS0TAfpksqLEQX11Ax/BFs2oH1wocCmPP9YzxLvu
	TnKHELgHkFfJejbwkuRhcT/rN/eYHhGFTvoMzLIBefL5Fi5aYbVAQO1qyeqkyHvg7t3oVWpwRKG
	fVFFvPrGuqMkALtxQdpIditivWiO16hNHroa+5kspiM4UmPTLrbiRwRBkFYmKriNbwisB7eX0gr
	7cEG0IWFtsBbzEInBG/gnwzZwCJSa3XmB14mm4YoZ/5+ABz6hGuyUOQtpJuCuIUPjbteOa64929
	8D+YC3X5E728nIQ+07bGMXIW+3htJUinftIRaySMWYn6u1/eB396twQq0Y8s6yLwKZ4E/CVkMMr
	zkE
X-Received: by 2002:a05:6214:da4:b0:8ac:9fc3:b9fb with SMTP id 6a1803df08f44-8ccefe0cb21mr201075176d6.45.1780327610157;
        Mon, 01 Jun 2026 08:26:50 -0700 (PDT)
Received: from localhost.localdomain ([2600:4041:42f2:d000:5598:1322:a565:857b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea2164cfsm95097686d6.37.2026.06.01.08.26.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Jun 2026 08:26:49 -0700 (PDT)
From: Rohith Matam <rohithmatham@gmail.com>
To: mchehab@kernel.org
Cc: duoming@zju.edu.cn,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rohith Matam <rohithmatham@gmail.com>,
	syzbot+0d6ef2b7ceb6014d756c@syzkaller.appspotmail.com
Subject: [PATCH v3] media: siano: fix URB work teardown
Date: Mon,  1 Jun 2026 11:26:42 -0400
Message-ID: <20260601152642.55313-1-rohithmatham@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601150922.52822-1-rohithmatham@gmail.com>
References: <20260601150922.52822-1-rohithmatham@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[zju.edu.cn,kernel.org,vger.kernel.org,gmail.com,syzkaller.appspotmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63283-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rohithmatham@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,0d6ef2b7ceb6014d756c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 19B97621BAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

smsusb_onresponse() reinitializes the URB work item immediately before
scheduling it. If teardown races with a queued work item,
cancel_work_sync() can observe workqueue state with WORK_STRUCT_PWQ
still set and trip the workqueue warning reported by syzbot.

The teardown path also has related lifetime bugs. URB_FREE_BUFFER makes
USB core free a smscore-owned buffer, and a work item can submit an URB
after usb_kill_urb() has already returned. If that submission fails, the
worker keeps ownership of the smscore buffer and the streaming pipeline
loses an URB.

Initialize each work item before any error path can tear down the device,
remove URB_FREE_BUFFER, stop resubmission before killing URBs, and kill
URBs again after canceling work so any URB submitted by an already-running
worker is completed before buffers and the device are freed. Return the
smscore buffer if URB submission fails.

smscore_getbuffer() waits in TASK_UNINTERRUPTIBLE, so return buffers to
the pool before waking waiters and use wake_up() instead of
wake_up_interruptible().

Fixes: ebad8e731c1c ("media: usb: siano: Fix use after free bugs caused by do_submit_urb")
Reported-by: syzbot+0d6ef2b7ceb6014d756c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0d6ef2b7ceb6014d756c
Signed-off-by: Rohith Matam <rohithmatham@gmail.com>
---
Changes in v3:
- Initialize work items before early probe error paths can call teardown.
- Return the smscore buffer when URB submission fails.
- Wake buffer waiters after returning the buffer, and use wake_up().

Changes in v2:
- Initialize all work items before allocating URBs.
- Remove URB_FREE_BUFFER from smscore-owned buffers.
- Stop resubmission before teardown and kill URBs again after canceling work.

 drivers/media/common/siano/smscoreapi.c |  2 +-
 drivers/media/usb/siano/smsusb.c        | 37 +++++++++++++++++++------
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
index 017629e3c..e256344eb 100644
--- a/drivers/media/common/siano/smscoreapi.c
+++ b/drivers/media/common/siano/smscoreapi.c
@@ -1654,8 +1654,8 @@ EXPORT_SYMBOL_GPL(smscore_getbuffer);
  */
 void smscore_putbuffer(struct smscore_device_t *coredev,
 		struct smscore_buffer_t *cb) {
-	wake_up_interruptible(&coredev->buffer_mng_waitq);
 	list_add_locked(&cb->entry, &coredev->buffers, &coredev->bufferslock);
+	wake_up(&coredev->buffer_mng_waitq);
 }
 EXPORT_SYMBOL_GPL(smscore_putbuffer);
 
diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 0fdc2e095..fab64e5fa 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -58,6 +58,7 @@ struct smsusb_device_t {
 	unsigned char in_ep;
 	unsigned char out_ep;
 	enum smsusb_state state;
+	bool streaming;
 };
 
 static int smsusb_submit_urb(struct smsusb_device_t *dev,
@@ -71,8 +72,14 @@ static void do_submit_urb(struct work_struct *work)
 {
 	struct smsusb_urb_t *surb = container_of(work, struct smsusb_urb_t, wq);
 	struct smsusb_device_t *dev = surb->dev;
+	int rc;
 
-	smsusb_submit_urb(dev, surb);
+	if (!READ_ONCE(dev->streaming))
+		return;
+
+	rc = smsusb_submit_urb(dev, surb);
+	if (rc < 0 && READ_ONCE(dev->streaming))
+		pr_err("smsusb_submit_urb(...) failed\n");
 }
 
 /*
@@ -143,13 +150,15 @@ static void smsusb_onresponse(struct urb *urb)
 
 
 exit_and_resubmit:
-	INIT_WORK(&surb->wq, do_submit_urb);
-	schedule_work(&surb->wq);
+	if (READ_ONCE(dev->streaming))
+		schedule_work(&surb->wq);
 }
 
 static int smsusb_submit_urb(struct smsusb_device_t *dev,
 			     struct smsusb_urb_t *surb)
 {
+	int rc;
+
 	if (!surb->cb) {
 		/* This function can sleep */
 		surb->cb = smscore_getbuffer(dev->coredev);
@@ -168,19 +177,25 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
 		smsusb_onresponse,
 		surb
 	);
-	surb->urb->transfer_flags |= URB_FREE_BUFFER;
+	rc = usb_submit_urb(surb->urb, GFP_ATOMIC);
+	if (rc) {
+		smscore_putbuffer(dev->coredev, surb->cb);
+		surb->cb = NULL;
+	}
 
-	return usb_submit_urb(surb->urb, GFP_ATOMIC);
+	return rc;
 }
 
 static void smsusb_stop_streaming(struct smsusb_device_t *dev)
 {
 	int i;
 
+	WRITE_ONCE(dev->streaming, false);
+
 	for (i = 0; i < MAX_URBS; i++) {
 		usb_kill_urb(dev->surbs[i].urb);
-		if (dev->surbs[i].wq.func)
-			cancel_work_sync(&dev->surbs[i].wq);
+		cancel_work_sync(&dev->surbs[i].wq);
+		usb_kill_urb(dev->surbs[i].urb);
 
 		if (dev->surbs[i].cb) {
 			smscore_putbuffer(dev->coredev, dev->surbs[i].cb);
@@ -193,6 +208,8 @@ static int smsusb_start_streaming(struct smsusb_device_t *dev)
 {
 	int i, rc;
 
+	WRITE_ONCE(dev->streaming, true);
+
 	for (i = 0; i < MAX_URBS; i++) {
 		rc = smsusb_submit_urb(dev, &dev->surbs[i]);
 		if (rc < 0) {
@@ -401,6 +418,11 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 	if (!dev)
 		return -ENOMEM;
 
+	for (i = 0; i < MAX_URBS; i++) {
+		dev->surbs[i].dev = dev;
+		INIT_WORK(&dev->surbs[i].wq, do_submit_urb);
+	}
+
 	memset(&params, 0, sizeof(params));
 	usb_set_intfdata(intf, dev);
 	dev->udev = interface_to_usbdev(intf);
@@ -467,7 +489,6 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 
 	/* initialize urbs */
 	for (i = 0; i < MAX_URBS; i++) {
-		dev->surbs[i].dev = dev;
 		dev->surbs[i].urb = usb_alloc_urb(0, GFP_KERNEL);
 		if (!dev->surbs[i].urb)
 			goto err_unregister_device;
-- 
2.54.0

