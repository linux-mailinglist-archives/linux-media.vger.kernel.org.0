Return-Path: <linux-media+bounces-63323-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO3HHmvpHWp0fwkAu9opvQ
	(envelope-from <linux-media+bounces-63323-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 22:19:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D23CA624FE4
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 22:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0581D30131C8
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 20:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892313EFD35;
	Mon,  1 Jun 2026 20:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTOGtOZ4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80011346ADC
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 20:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345007; cv=none; b=PGlMdi6etCCxDoFNiCFD3OPYoZnB/t0uULbjJhAt6A3cYML5QIZWBbWRv4OTnd0/oNipfybfl42lxUdkKfgrpRjaj1zk1zSCfGNW1lnasXqUZWHRgNAwqBEg45ZpxLyByL+5j12K1c5BZOo1i75SoC+E6CYn18BoOeUJk3dzcF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345007; c=relaxed/simple;
	bh=/EnxGHEeNEocOb+vZCdZEOodrWB95vFpILdqMyb7S4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c0P1SI5h0w2GemYONlApMQKmdHRN73Jv7mjuhKvKoKa0KgIfrmkWWkfHmmmyeFIufK1ZtxwJUYnyrXHHFCsW26fPOgimWFiFCgB1wDmj0hnYK7J8omla74OxZheg2KkGxVKeLuBPCHie7K5w/lQogYGKc5LO+j8XU8RIGDaT6rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTOGtOZ4; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-915671abde5so109950085a.3
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 13:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780345003; x=1780949803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeR4WL59kTXKD/bHwazItpYL/nCmf40guV4oSdZazAQ=;
        b=LTOGtOZ4QW98BuL8T3j4II0Ayxrb8GqDHSJ73+r5e7pER/sgkSan8AIOLyrt+qG3zb
         cnM39P6pUJiJxvmkP+l4jdhv0HY6QKw3pXaykQuhJ28JxnHXjaPQJPH9SY1iXfXI4QTO
         IVYQch8sE+hOqCZ1w1u59eQATf4PPHz47z9PUCYLg9d6rop29+ncXd0N1D51F3UfsckJ
         0dXme52BdDppwIIsJYOw796/MorO+F8z44+dhiLHvCM5Fjr/3KVgSeHNRpr62O8aQ+S+
         NuDWdVmLMZyZcZorlaj/t6zCO5Z3m0xGpLcg7kSspcFoYN1IMVzo/HqhDovvPiK2Lgls
         8HMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780345003; x=1780949803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CeR4WL59kTXKD/bHwazItpYL/nCmf40guV4oSdZazAQ=;
        b=IjaWBpNApPgR1SyMfOOf+VY6mz1Eofy7z/5kFIJvDyn7iF29GJAEtCzUAkEysfwE+f
         4e56nq1OPa4wjJbusAOIbbaW8PYeeYcB8/PCO49gPE6+uRjCywtGLmm+XhkCE0MDTRrN
         2RUBYV9lSZInfzrYGyTVdTQg7Vtyd9AHUL2DHSE25fJlhwf5TCneSGccpRbBgAVjQIs3
         uuUfMGDFO9xuWzgPYVtUiTGMrEV013Po8sKMzSwyD5gyL17LWWLPkfVj/21DZ0HYNDWq
         q18Y4uULoAtGACnAms76NI+sCk2KBQe+fQJy1jYeLKs+gYhHOsbABrw3kZkJqc12IYef
         059Q==
X-Forwarded-Encrypted: i=1; AFNElJ/iPS4Yq60jahTyn9iP/TwekYxc6aEQqV6UxDWlBgkg3LMbkxYrikbWCWM+KlYjDBhdiWitBDjdtJHtdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh6GmnFD4ZCZZHq5K3AzKYHDDFIX4DnyhRVQrWsyX5wN9/cRcw
	vN53tZeHpu7AKpxthZUBcs04a3jhA34xIztPiP+lcMXLgSgRCG+KEaSe
X-Gm-Gg: Acq92OFNT94AweRI0gbUEepU8TvF1otl9/OZ00/vKlAdBpT5fTkcFIuLW284EnDB7uU
	9YmJIjL0qH1JUcu3UBIYO+pr9xkF0ugfgZTUSOfoaTMv2uJGoJlXPui+KffJn1dPsWptRBrSzQE
	9QDIJdxHgRiJ0o7/MSrIYdaWweWXsWw8NoNTl9BHhHo7H9uub3al1VhBPKh94M/keXlvUXsOny0
	gZtcbF1aarzHQHjmopG5Y2Vv+M2r+wR9J0Gy91w4VfVdGJt2uKkkWdVIYRn9fgjv0fF7JnWQeih
	jh5FfLBdqUo8kz41IbPOf7AYsU1De6B0fpvTI+wc2Xwo4sijKfk0hpefH1Y+A1C5brnltDu90+8
	eKvw9fkVIU4JOdhGPg0aHqEhtwlKJSyVUnr0gkeaGD+rYRzykI0e1al7eyk5hm7MA2rmAb9eHpf
	pCj77+TA0c7MQj26EOkW012Linmyz0/RE9DxrtKo4pPtOE0RaRmc84RrX/Y9KzmquASS+bgqoiG
	5vtqX767g==
X-Received: by 2002:a05:620a:6481:b0:915:769d:554 with SMTP id af79cd13be357-915769d0fefmr296852485a.46.1780345003477;
        Mon, 01 Jun 2026 13:16:43 -0700 (PDT)
Received: from Mac.mynetworksettings.com ([2600:4041:42f2:d000:5598:1322:a565:857b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91532473bb9sm1095732785a.11.2026.06.01.13.16.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Jun 2026 13:16:43 -0700 (PDT)
From: Rohith Matam <rohithmatham@gmail.com>
To: mchehab@kernel.org
Cc: duoming@zju.edu.cn,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rohith Matam <rohithmatham@gmail.com>,
	syzbot+0d6ef2b7ceb6014d756c@syzkaller.appspotmail.com
Subject: [PATCH v6] media: siano: fix URB work teardown
Date: Mon,  1 Jun 2026 16:16:39 -0400
Message-ID: <20260601201639.63171-1-rohithmatham@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601160447.59917-1-rohithmatham@gmail.com>
References: <20260601160447.59917-1-rohithmatham@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[zju.edu.cn,kernel.org,vger.kernel.org,gmail.com,syzkaller.appspotmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63323-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,appspotmail.com:email]
X-Rspamd-Queue-Id: D23CA624FE4
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

During teardown, wake workers blocked in smscore_getbuffer() by adding an
abortable buffer wait. Then cancel work before returning any URB-owned
buffer to avoid racing with workers that are still using surb->cb. Guard
the wakeup because early probe failure can call teardown before coredev is
registered.

Fixes: ebad8e731c1c ("media: usb: siano: Fix use after free bugs caused by do_submit_urb")
Reported-by: syzbot+0d6ef2b7ceb6014d756c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0d6ef2b7ceb6014d756c
Signed-off-by: Rohith Matam <rohithmatham@gmail.com>
---
Changes in v6:
- Guard the buffer waitqueue wakeup for early probe failures before
  coredev has been registered.

Changes in v5:
- Replace the v4 early-buffer-return ordering with an abortable smscore
  buffer wait so workers can exit before teardown returns surb->cb.

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

 drivers/media/common/siano/smscoreapi.c | 14 ++++++-
 drivers/media/common/siano/smscoreapi.h |  2 +
 drivers/media/usb/siano/smsusb.c        | 56 +++++++++++++++++++------
 3 files changed, 59 insertions(+), 13 deletions(-)

diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
index 017629e3c..23be7347d 100644
--- a/drivers/media/common/siano/smscoreapi.c
+++ b/drivers/media/common/siano/smscoreapi.c
@@ -1644,6 +1644,18 @@ struct smscore_buffer_t *smscore_getbuffer(struct smscore_device_t *coredev)
 }
 EXPORT_SYMBOL_GPL(smscore_getbuffer);
 
+struct smscore_buffer_t *
+smscore_getbuffer_abortable(struct smscore_device_t *coredev, bool *abort)
+{
+	struct smscore_buffer_t *cb = NULL;
+
+	wait_event(coredev->buffer_mng_waitq,
+		   READ_ONCE(*abort) || (cb = get_entry(coredev)));
+
+	return cb;
+}
+EXPORT_SYMBOL_GPL(smscore_getbuffer_abortable);
+
 /*
  * return buffer descriptor to a pool
  *
@@ -1654,8 +1666,8 @@ EXPORT_SYMBOL_GPL(smscore_getbuffer);
  */
 void smscore_putbuffer(struct smscore_device_t *coredev,
 		struct smscore_buffer_t *cb) {
-	wake_up_interruptible(&coredev->buffer_mng_waitq);
 	list_add_locked(&cb->entry, &coredev->buffers, &coredev->bufferslock);
+	wake_up(&coredev->buffer_mng_waitq);
 }
 EXPORT_SYMBOL_GPL(smscore_putbuffer);
 
diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
index d945a2d6d..f8a9e6ef7 100644
--- a/drivers/media/common/siano/smscoreapi.h
+++ b/drivers/media/common/siano/smscoreapi.h
@@ -1117,6 +1117,8 @@ extern void smscore_onresponse(struct smscore_device_t *coredev,
 
 extern
 struct smscore_buffer_t *smscore_getbuffer(struct smscore_device_t *coredev);
+struct smscore_buffer_t *
+smscore_getbuffer_abortable(struct smscore_device_t *coredev, bool *abort);
 extern void smscore_putbuffer(struct smscore_device_t *coredev,
 			      struct smscore_buffer_t *cb);
 
diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 0fdc2e095..98ae94e19 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -58,6 +58,8 @@ struct smsusb_device_t {
 	unsigned char in_ep;
 	unsigned char out_ep;
 	enum smsusb_state state;
+	bool streaming;
+	bool stopping;
 };
 
 static int smsusb_submit_urb(struct smsusb_device_t *dev,
@@ -71,8 +73,14 @@ static void do_submit_urb(struct work_struct *work)
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
@@ -143,19 +151,22 @@ static void smsusb_onresponse(struct urb *urb)
 
 
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
-		surb->cb = smscore_getbuffer(dev->coredev);
+		surb->cb = smscore_getbuffer_abortable(dev->coredev,
+						       &dev->stopping);
 		if (!surb->cb) {
-			pr_err("smscore_getbuffer(...) returned NULL\n");
-			return -ENOMEM;
+			pr_debug("device is stopping\n");
+			return -ESHUTDOWN;
 		}
 	}
 
@@ -168,20 +179,34 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
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
+	WRITE_ONCE(dev->stopping, true);
+	if (dev->coredev)
+		wake_up(&dev->coredev->buffer_mng_waitq);
+
+	for (i = 0; i < MAX_URBS; i++)
 		usb_kill_urb(dev->surbs[i].urb);
-		if (dev->surbs[i].wq.func)
-			cancel_work_sync(&dev->surbs[i].wq);
 
+	for (i = 0; i < MAX_URBS; i++)
+		cancel_work_sync(&dev->surbs[i].wq);
+
+	for (i = 0; i < MAX_URBS; i++)
+		usb_kill_urb(dev->surbs[i].urb);
+
+	for (i = 0; i < MAX_URBS; i++) {
 		if (dev->surbs[i].cb) {
 			smscore_putbuffer(dev->coredev, dev->surbs[i].cb);
 			dev->surbs[i].cb = NULL;
@@ -193,6 +218,9 @@ static int smsusb_start_streaming(struct smsusb_device_t *dev)
 {
 	int i, rc;
 
+	WRITE_ONCE(dev->stopping, false);
+	WRITE_ONCE(dev->streaming, true);
+
 	for (i = 0; i < MAX_URBS; i++) {
 		rc = smsusb_submit_urb(dev, &dev->surbs[i]);
 		if (rc < 0) {
@@ -401,6 +429,11 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
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
@@ -467,7 +500,6 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 
 	/* initialize urbs */
 	for (i = 0; i < MAX_URBS; i++) {
-		dev->surbs[i].dev = dev;
 		dev->surbs[i].urb = usb_alloc_urb(0, GFP_KERNEL);
 		if (!dev->surbs[i].urb)
 			goto err_unregister_device;
-- 
2.54.0

