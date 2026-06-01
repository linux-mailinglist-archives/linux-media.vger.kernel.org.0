Return-Path: <linux-media+bounces-63279-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMM8MoSiHWrmcgkAu9opvQ
	(envelope-from <linux-media+bounces-63279-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:17:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAB06217D6
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 17:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2107D309F75A
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 15:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A893D905D;
	Mon,  1 Jun 2026 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ku614tos"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFE63D7D84
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326582; cv=none; b=Z1QUcb3K3xiY9ZSNgDtkXvZN8xnJN3Wx+5pOT3/0GJb/UED/ePcigUZxSx0uwHIUd80VLP4/IqvMHjfySYrn3XY8wNIzrMhT5TsN1micaiIkM41Rul0THrqvsYOPFCf99N+gjJF+gREgMLbXJV9MvU8hFpTok+bSBdDkpAutTAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326582; c=relaxed/simple;
	bh=ux/l2r9lqBMN5d9LUxEofokoFYoBUlP9gw41ZIX3yOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FXTy4VlKrydi7C6iHt6P9DoTY0pXMZsNnxOQVMQDuikYDdcJHrMi4NmGmZICrunyZn4THi0HJptRkgJ3HNIUSyhBb4v+cZepMBhek5tA1OTblWnHwAi6FjhnvzGtvD4oLUfr/+AyTu49YwxVT5iC4JEp4SNZXG2BztfAIL/8SYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ku614tos; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51764768c36so1636991cf.0
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 08:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780326578; x=1780931378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2ebOdxHchr4hjPg1aJ0yJAo9tx+BE+yBY+QV1SbZL0=;
        b=Ku614tosGtmyoSxuhMmM5+Q2Va9sdtRrA3gLd2AQbpnAUmVdcFPkAiZaYCThr41HxP
         dnQKuzqNxT0uUwaM+lexvBpoTQ/KU5cV6ezxOxwU31JsoW0UcAeNmJuPaFUb6VgYPoWg
         OGtiw/QcPyrfvwMtylk/p59GuW4fwv7Iw7igG2GwfgjK4Ku2hm5Z4BCWLNpXBS7oJdrY
         u87MlLACQdvbZhF+/PFhhvbGOGYNKpccOFKG2ZvXL8ps9oO1Vm6f0Qu0hfTamDJKzspr
         /i//INqKK4XlwY7Ms6ukrqh60BlZYidtvvF+BmdtZRiGPiSXE9Fd/p5SXzhn2/2UKdAG
         1ZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326578; x=1780931378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W2ebOdxHchr4hjPg1aJ0yJAo9tx+BE+yBY+QV1SbZL0=;
        b=m5Kav5+BmvuN/ySOZF2His3oZFg1AK/xDQhVaB4LOCrkE8dxJ1ebpdYO7wfVl7H/0n
         wzqWdwZXg6XSjyqZ/CpkLM1hHWo7w0ExwQWc7kkzoZMAc6EuL+YCZhNQcVUugTgEJIQG
         4RWwdkQjSrsGLWek17F+9+OCRJqOijGAHCIIk7RlcYasSsnrUApqRu8mnpvKQFaSRVrs
         yb3cbvst4A1zpbLpMWeTerWltRGgAvjvCo+X8jPzcf9rKYBsPqkHssOGfhH1jvuYahvI
         xIl/RAK3NaDyM8w//js/7N3FMvlQ4GvjrVRItZfQwuwmWqYc3yxw0rBKEbTYRpcwIC7C
         uZww==
X-Forwarded-Encrypted: i=1; AFNElJ+BvbWDcDod3NVpaTGyN1LFPUK+czOWrxsAqfpzw9whHJDx5hKmNUGc/GETEbZkqLZCV9T/c+1FNOq+3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE3CdLrFr9YKrsTSBdPP2g065kYYh/8IsGspH1rTRr+kPBhjUz
	odB8+vU9XkLct5Iz9frCvKfvoDkIATZiI+Qgnc+MQRuCyfzfW83qVdK7e/PxxGsAlrs=
X-Gm-Gg: Acq92OGXj95O7cV09opp44SmkLbD1GFhj7y5ccsgshIiv6hXIbLXWcmVSGzdjw5zbyy
	RKQjKA/jfgEDOaEINbmW7UhyDpZR5OurjA69ObI/zpbEabMIY9Lls1GJK2d1FNSS8RlziAk6ASu
	Sg0vt4u6EgIE333vcSKth3yKABZ0EQLV10Porv0Gnx52yurNYEPtSn5cNdqsJHcRArusdMixujW
	VLgavqDZOoftSc6n71ptJYJkwdHYuh9f0y4OzSBdqLFjnS6FI9EAgx0O7Nm8FMqbGLL/AQyWhS+
	97XDx7Hu32m48zYJ4yeB+senMmq2abiKAuJqkxQk6Vjmn1gMtCasVHIIF6Oa2jt4gyEst7nuAKR
	fjUxpjY1VPq7gWTxW//HgUwysJ+Rxc53wVySQysCF1/R4Ye+5fjH1wPWaAodqB6breI4PksJsR+
	BZA50JSzs90Mdxp9eSrq2yRHS/r9yvPKauGzCabVbVDFDqXfjBAZMIE8m9YlgUMVeN0YC4KKnWk
	3INiKvmMppMf7Y=
X-Received: by 2002:a05:622a:d0f:b0:516:e36f:e18a with SMTP id d75a77b69052e-5173a6e5ccdmr155225501cf.2.1780326577489;
        Mon, 01 Jun 2026 08:09:37 -0700 (PDT)
Received: from localhost.localdomain ([2600:4041:42f2:d000:5598:1322:a565:857b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5175c83a1b9sm13769841cf.11.2026.06.01.08.09.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Jun 2026 08:09:37 -0700 (PDT)
From: Rohith Matam <rohithmatham@gmail.com>
To: mchehab@kernel.org
Cc: duoming@zju.edu.cn,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rohith Matam <rohithmatham@gmail.com>,
	syzbot+0d6ef2b7ceb6014d756c@syzkaller.appspotmail.com
Subject: [PATCH v2] media: usb: siano: fix URB work teardown
Date: Mon,  1 Jun 2026 11:09:22 -0400
Message-ID: <20260601150922.52822-1-rohithmatham@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601061855.47423-1-rohithmatham@gmail.com>
References: <20260601061855.47423-1-rohithmatham@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[zju.edu.cn,kernel.org,vger.kernel.org,gmail.com,syzkaller.appspotmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63279-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 3FAB06217D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

smsusb_onresponse() reinitializes the URB work item immediately before
scheduling it. If teardown races with a queued work item,
cancel_work_sync() can observe workqueue state with WORK_STRUCT_PWQ
still set and trip the workqueue warning reported by syzbot.

The teardown path also has two related lifetime bugs: URB_FREE_BUFFER
makes USB core free a smscore-owned buffer, and a work item can submit
an URB after usb_kill_urb() has already returned.

Initialize each work item once before URB allocation, remove
URB_FREE_BUFFER, stop resubmission before killing URBs, and kill URBs
again after canceling work so any URB submitted by an already-running
worker is completed before buffers and the device are freed.

Fixes: ebad8e731c1c ("media: usb: siano: Fix use after free bugs caused by do_submit_urb")
Reported-by: syzbot+0d6ef2b7ceb6014d756c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0d6ef2b7ceb6014d756c
Signed-off-by: Rohith Matam <rohithmatham@gmail.com>
---
Changes in v2:
- Initialize all work items before allocating URBs.
- Remove URB_FREE_BUFFER from smscore-owned buffers.
- Stop resubmission before teardown and kill URBs again after canceling work.

 drivers/media/usb/siano/smsusb.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 0fdc2e095..e3ca51072 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -58,6 +58,7 @@ struct smsusb_device_t {
 	unsigned char in_ep;
 	unsigned char out_ep;
 	enum smsusb_state state;
+	bool streaming;
 };
 
 static int smsusb_submit_urb(struct smsusb_device_t *dev,
@@ -72,7 +73,8 @@ static void do_submit_urb(struct work_struct *work)
 	struct smsusb_urb_t *surb = container_of(work, struct smsusb_urb_t, wq);
 	struct smsusb_device_t *dev = surb->dev;
 
-	smsusb_submit_urb(dev, surb);
+	if (READ_ONCE(dev->streaming))
+		smsusb_submit_urb(dev, surb);
 }
 
 /*
@@ -143,8 +145,8 @@ static void smsusb_onresponse(struct urb *urb)
 
 
 exit_and_resubmit:
-	INIT_WORK(&surb->wq, do_submit_urb);
-	schedule_work(&surb->wq);
+	if (READ_ONCE(dev->streaming))
+		schedule_work(&surb->wq);
 }
 
 static int smsusb_submit_urb(struct smsusb_device_t *dev,
@@ -168,8 +170,6 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
 		smsusb_onresponse,
 		surb
 	);
-	surb->urb->transfer_flags |= URB_FREE_BUFFER;
-
 	return usb_submit_urb(surb->urb, GFP_ATOMIC);
 }
 
@@ -177,10 +177,12 @@ static void smsusb_stop_streaming(struct smsusb_device_t *dev)
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
@@ -193,6 +195,8 @@ static int smsusb_start_streaming(struct smsusb_device_t *dev)
 {
 	int i, rc;
 
+	WRITE_ONCE(dev->streaming, true);
+
 	for (i = 0; i < MAX_URBS; i++) {
 		rc = smsusb_submit_urb(dev, &dev->surbs[i]);
 		if (rc < 0) {
@@ -468,6 +472,10 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 	/* initialize urbs */
 	for (i = 0; i < MAX_URBS; i++) {
 		dev->surbs[i].dev = dev;
+		INIT_WORK(&dev->surbs[i].wq, do_submit_urb);
+	}
+
+	for (i = 0; i < MAX_URBS; i++) {
 		dev->surbs[i].urb = usb_alloc_urb(0, GFP_KERNEL);
 		if (!dev->surbs[i].urb)
 			goto err_unregister_device;
-- 
2.54.0

