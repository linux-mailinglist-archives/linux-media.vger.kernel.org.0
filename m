Return-Path: <linux-media+bounces-63297-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNUtD1mpHWq+cwkAu9opvQ
	(envelope-from <linux-media+bounces-63297-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:46:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C5962201B
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4177302FF7B
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 15:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03C73DB65D;
	Mon,  1 Jun 2026 15:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pbsZmkK3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B480D3DA5CC
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 15:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328600; cv=none; b=NH0vFNJxHY23vtkZx00czrTQsau22NJuH25ozAYDLnG1WE3apQ10UkW1LKU9Ure2jmzfa006DU+2Fwf/vu5mwfUf2bhKU0GUNufr8K2AahA8b/GP00Ejc50RzZthvXNdvaT41jdG3hki34Z4AGXRa83w6dJba2qD6hU04seRR/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328600; c=relaxed/simple;
	bh=gjRGSuHTFaMpWrg/aj9gtDO3Px00ekN2KTlN3bmjMC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QUQbhZmn4CaNyec8wpvpR95Kh1ZdKooqmLf6xsSFIV3WxIzM+1V3FZrmW9P0sVx1AecVkuveJsz7WEf+yhhSBqo0RL+KipVYERnyXZnNgS7HiSLAfXVqkPHL1SGTA8kjup+FrfxJHRoxxamqKg0ogH4Ed+30SgiHdO3Mr3Om/Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pbsZmkK3; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8cce87d7995so41671316d6.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 08:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780328598; x=1780933398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNnTDOSD25WnJEqdpyi7uEMknZ0Iy/maLAUEpuwj10s=;
        b=pbsZmkK3t2XXA4yTICxdttI0BzTWTftw4vaO1qQXEkIOcBo7yJPscFqbL0E9Citovc
         nTNAQZzKAeN7piNja4rDcyPHC/A8Lbs0usX9zzbbeg+JQXbNkwdUsXPjxbdVzme0f7L0
         d8YjEf6rbjKr8Uw5c+KshUQvbxNzZCNnRoPkCE5ZyUv+Nhu7tpoYSMxud+L9j2yWOeQH
         MXuqQlkkGEFB2xtaz8l3+Wbmf4Rq7MjY+bG2gjeC316ZdszczlQ+2aKZbgXw+Jrkl5Ch
         93z4+W6ThDSX/AZ3N0QozY0zf9E810mnDCTGkem14M5rss7WykSWT+ncYRFxq2R8MaBU
         R/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780328598; x=1780933398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yNnTDOSD25WnJEqdpyi7uEMknZ0Iy/maLAUEpuwj10s=;
        b=UbuHBCc+BqbKsLGBwlTtk4wNG5BlpRT7sS8vz5c04NPGVo1Jo8Z8px3Kj6tl4GsA6w
         1H6YU9zevwasP92LYJzSjB0BxPZKuvIjhATBPoEayQ6YJ2bbo8mOIlJktABLNYuyt76E
         L41hjTlK3Ur3Ao9HmN+QFgArlsxkoFQVH69ZOuv4MENACBi7U4xVnoED9Q1/qKARY/fO
         7WP6T9zd6F8qJ57qo3l31DkCVzFtNHg/l+v0wiDyKI9eZCljFJ/hr6dAd2JMkjl0NBUL
         6qnzv6Fq7XiA3AXjfFwU0pAknY/0Gk/JLy4ugDd/+XlZkCdDncGOB9gYpFIRz44GPIwS
         eJrg==
X-Forwarded-Encrypted: i=1; AFNElJ9qnu4skOfgMp6k22Vq/lnI3sy1khxHZlm5ESBHvuL/Vm0Ct6Ku1ZbWSG26dsb53akCMdsT//6RRf6zvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4HXwSRkDdi2xpvtGDDsgjujlQOxWOXfafHrvgJIkb3hxb4A/I
	bEcfFl8DEQc3AJSOA5zmc4L3dyW4rLoKj299dEM3qgm+cyuXttA35fYb
X-Gm-Gg: Acq92OGrjis1Or6XwHWsqZ+AJh8vqG9CFYG4Nh/FiRa2ue62bFUfghSnwk5ZUPQeuXA
	1TW5cGMyn9iKxtPoDombqhXbgL7kHTAlxBr3qr8fi2Fz9XyFj51E2G1sX00SMDy1N7mL8yejYCO
	8pzmCGfbf1XUn4NvRrHqw9sRREXRNEua8JxBNh9HeCWsIAJCg6RCwxH2mqgwyO7dLZhy2jaO6tu
	2/HMkkTWZZkDarugvXJPoahegs0PIJ+2kmQqAw910s37ybwjEb5cAmrlfomYq4N/EtHFnWObRDy
	KBTotKCRnrnIkgy5Q7qIPgyaePHF29an4v9ObkG27+nV5CW+INPRnfJHFwSFuSV5TFl7uJK1lrv
	SxnHTNUuWLLi36jc5t85ePbBZ/Jh7m/+Jf4BTUt3p4jKWpgOw4pUXHkeDDZCv7L10cD0oDrO2Mf
	ZJeJbwXHIdFzpQBrvzls3dzEErHmEmDgmGnUE0XHj1fy9WpH8/iwp/lntJm8pvtL6jTtA5piHAX
	J2A
X-Received: by 2002:ad4:5cc9:0:b0:89c:e4c3:dc1a with SMTP id 6a1803df08f44-8ccefb1e7femr207925136d6.1.1780328597571;
        Mon, 01 Jun 2026 08:43:17 -0700 (PDT)
Received: from localhost.localdomain ([2600:4041:42f2:d000:5598:1322:a565:857b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea1c384esm95315146d6.28.2026.06.01.08.43.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Jun 2026 08:43:17 -0700 (PDT)
From: Rohith Matam <rohithmatham@gmail.com>
To: mchehab@kernel.org
Cc: duoming@zju.edu.cn,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rohith Matam <rohithmatham@gmail.com>,
	syzbot+0d6ef2b7ceb6014d756c@syzkaller.appspotmail.com
Subject: [PATCH v4] media: siano: fix URB work teardown
Date: Mon,  1 Jun 2026 11:43:14 -0400
Message-ID: <20260601154314.56784-1-rohithmatham@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601152642.55313-1-rohithmatham@gmail.com>
References: <20260601152642.55313-1-rohithmatham@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[zju.edu.cn,kernel.org,vger.kernel.org,gmail.com,syzkaller.appspotmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63297-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,syzkaller.appspot.com:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 50C5962201B
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

During teardown, kill all URBs first and return all held buffers before
canceling work so a worker blocked in smscore_getbuffer() can make
progress and exit. smscore_getbuffer() waits in TASK_UNINTERRUPTIBLE, so
return buffers to the pool before waking waiters and use wake_up()
instead of wake_up_interruptible().

Fixes: ebad8e731c1c ("media: usb: siano: Fix use after free bugs caused by do_submit_urb")
Reported-by: syzbot+0d6ef2b7ceb6014d756c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0d6ef2b7ceb6014d756c
Signed-off-by: Rohith Matam <rohithmatham@gmail.com>
---
Changes in v4:
- During teardown, kill all URBs and return held buffers before canceling
  workers so smscore_getbuffer() waiters can wake and exit.

Changes in v3:
- Initialize work items before early probe error paths can call teardown.
- Return the smscore buffer when URB submission fails.
- Wake buffer waiters after returning the buffer, and use wake_up().

Changes in v2:
- Initialize all work items before allocating URBs.
- Remove URB_FREE_BUFFER from smscore-owned buffers.
- Stop resubmission before teardown and kill URBs again after canceling work.

 drivers/media/common/siano/smscoreapi.c |  2 +-
 drivers/media/usb/siano/smsusb.c        | 44 ++++++++++++++++++++-----
 2 files changed, 36 insertions(+), 10 deletions(-)

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
index 0fdc2e095..c941a05a4 100644
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
@@ -168,31 +177,44 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
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
 
-	for (i = 0; i < MAX_URBS; i++) {
+	WRITE_ONCE(dev->streaming, false);
+
+	for (i = 0; i < MAX_URBS; i++)
 		usb_kill_urb(dev->surbs[i].urb);
-		if (dev->surbs[i].wq.func)
-			cancel_work_sync(&dev->surbs[i].wq);
 
+	for (i = 0; i < MAX_URBS; i++) {
 		if (dev->surbs[i].cb) {
 			smscore_putbuffer(dev->coredev, dev->surbs[i].cb);
 			dev->surbs[i].cb = NULL;
 		}
 	}
+
+	for (i = 0; i < MAX_URBS; i++)
+		cancel_work_sync(&dev->surbs[i].wq);
+
+	for (i = 0; i < MAX_URBS; i++)
+		usb_kill_urb(dev->surbs[i].urb);
 }
 
 static int smsusb_start_streaming(struct smsusb_device_t *dev)
 {
 	int i, rc;
 
+	WRITE_ONCE(dev->streaming, true);
+
 	for (i = 0; i < MAX_URBS; i++) {
 		rc = smsusb_submit_urb(dev, &dev->surbs[i]);
 		if (rc < 0) {
@@ -401,6 +423,11 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
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
@@ -467,7 +494,6 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 
 	/* initialize urbs */
 	for (i = 0; i < MAX_URBS; i++) {
-		dev->surbs[i].dev = dev;
 		dev->surbs[i].urb = usb_alloc_urb(0, GFP_KERNEL);
 		if (!dev->surbs[i].urb)
 			goto err_unregister_device;
-- 
2.54.0

