Return-Path: <linux-media+bounces-66999-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nZqwA5NdTmpkLQIAu9opvQ
	(envelope-from <linux-media+bounces-66999-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:24:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D257274A0
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:24:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66999-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66999-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 984133072AF6
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4D644CAFC;
	Wed,  8 Jul 2026 14:17:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA6644BC92;
	Wed,  8 Jul 2026 14:17:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520256; cv=none; b=Y4OsmAshwl5N3VAjodC1vgpqQxpxZFSKa/sJtCfEW8fXgmmCgnc9JlFEv1Zqp9JNJu3fOjpA81yROpVebPdwB6n/JKlKTJdADdHyM7Vcvrq5nUx33fBTj4aEYt5VEKjmtvCBUG9MEO/8gSTd33aHBKLN9mUO73a/NW3E+QAn1O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520256; c=relaxed/simple;
	bh=nmLFcrmIJBCQo0MYGrdfkiIK6Al0g/cT/7J2OLj2+EE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TLFJGknm/3du7FeBYd3sIo3O27j1EfU6TgU1W+tjJzeRWeYLP1HIno+xhUdpRea0U3p72iWNPhSjxaIyb0nadeEvJa4/9Ka80zRVOtDI+MJtoDuJPW8r97bjFAa3Rd/XqDOl+2TLnt0DooDs+BoK/ebgGl9Aqfoo/mCfg956474=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=209.97.182.222
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wD3oBTuW05qgJsjAA--.14020S3;
	Wed, 08 Jul 2026 22:17:19 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app4 (Coremail) with SMTP id zi_KCgDH+TDuW05qzMApAg--.39271S2;
	Wed, 08 Jul 2026 22:17:18 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH] media: cx231xx-audio: gate wq_trigger on an audio-local teardown flag
Date: Wed,  8 Jul 2026 14:16:22 +0000
Message-Id: <20260708141622.3936490-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zi_KCgDH+TDuW05qzMApAg--.39271S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?+7646wXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnXz+g1OQfMo27QHy5TwQyZzo5cbFrir2M8XDhP8w/SFwD5FlG7u2q/6dT3oGcduNxjlG
	stkPrON9NZL78exfTAXN5RPxYw6l01w8CbPzC/8w
X-Coremail-Antispam: 1Uk129KBj93XoWxKr1UKF15JFyDAFWkXF43Jwc_yoWxJry7pa
	4kKa4rKFW7Ja4UZrsrXw1rWF13Cws7ta1DG3y7u3Wqqwn5tr1rGF43AryxuryruF97ua17
	ur4UX3yjvws2vagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Gb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Tv3UUUUUU==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[zju.edu.cn];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:fanwu01@zju.edu.cn,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66999-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[fanwu01@zju.edu.cn,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fanwu01@zju.edu.cn,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47D257274A0

audio_trigger() is deferred work (dev->wq_trigger) armed from
snd_cx231xx_capture_trigger() on every PCM START/STOP; it dereferences
dev->adev state and may free the URBs via cx231xx_isoc_audio_deinit().
cx231xx_audio_fini() tore down that state (snd_card_free_when_closed,
alt_max_pkt_size) without draining wq_trigger, so work armed before or
racing fini ran against freed state.

Adding cancel_work_sync() alone is insufficient: in capture_trigger() the
DEV_DISCONNECTED test and schedule_work() were not atomic, and
DEV_DISCONNECTED is only set on USB disconnect, but fini also runs on
cx231xx-alsa module unload (cx231xx_unregister_extension()), which never
sets it.  A trigger that passed the check could still queue work after
fini's cancel returned an empty queue.

Add an audio-local teardown gate (dev->adev.teardown): fini raises it under
adev.slock, releases the lock, then calls cancel_work_sync() outside the
spinlock.  Both arm sites perform the teardown check and schedule_work()
inside one adev.slock section, so once the gate is visible no new work can
arm after cancel returns.  Initialize the lock, work and gate at the top of
cx231xx_audio_init(), before any fallible allocation, and clear the
partially-built audio state on its error path, so fini is safe even if a
later step fails.

This issue was found by an in-house static analysis tool.

Fixes: 61b04cb24a12 ("[media] cx231xx-audio: fix some locking issues")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.5
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 drivers/media/usb/cx231xx/cx231xx-audio.c | 42 +++++++++++++++++++----
 drivers/media/usb/cx231xx/cx231xx.h       |  1 +
 2 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-audio.c b/drivers/media/usb/cx231xx/cx231xx-audio.c
index 9c71b32552df..44ca75b18a5d 100644
--- a/drivers/media/usb/cx231xx/cx231xx-audio.c
+++ b/drivers/media/usb/cx231xx/cx231xx-audio.c
@@ -441,6 +441,7 @@ static int snd_cx231xx_capture_open(struct snd_pcm_substream *substream)
 static int snd_cx231xx_pcm_close(struct snd_pcm_substream *substream)
 {
 	int ret;
+	unsigned long flags;
 	struct cx231xx *dev = snd_pcm_substream_chip(substream);
 
 	dev_dbg(dev->dev, "closing device\n");
@@ -470,7 +471,11 @@ static int snd_cx231xx_pcm_close(struct snd_pcm_substream *substream)
 		dev_dbg(dev->dev, "released lock\n");
 		if (atomic_read(&dev->stream_started) > 0) {
 			atomic_set(&dev->stream_started, 0);
-			schedule_work(&dev->wq_trigger);
+
+			spin_lock_irqsave(&dev->adev.slock, flags);
+			if (!dev->adev.teardown)
+				schedule_work(&dev->wq_trigger);
+			spin_unlock_irqrestore(&dev->adev.slock, flags);
 		}
 	}
 	return 0;
@@ -509,11 +514,14 @@ static int snd_cx231xx_capture_trigger(struct snd_pcm_substream *substream,
 {
 	struct cx231xx *dev = snd_pcm_substream_chip(substream);
 	int retval = 0;
+	unsigned long flags;
 
-	if (dev->state & DEV_DISCONNECTED)
+	spin_lock_irqsave(&dev->adev.slock, flags);
+	if (dev->adev.teardown || (dev->state & DEV_DISCONNECTED)) {
+		spin_unlock_irqrestore(&dev->adev.slock, flags);
 		return -ENODEV;
+	}
 
-	spin_lock(&dev->adev.slock);
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		atomic_set(&dev->stream_started, 1);
@@ -525,10 +533,10 @@ static int snd_cx231xx_capture_trigger(struct snd_pcm_substream *substream,
 		retval = -EINVAL;
 		break;
 	}
-	spin_unlock(&dev->adev.slock);
 
 	schedule_work(&dev->wq_trigger);
 
+	spin_unlock_irqrestore(&dev->adev.slock, flags);
 	return retval;
 }
 
@@ -576,12 +584,20 @@ static int cx231xx_audio_init(struct cx231xx *dev)
 	dev_dbg(dev->dev,
 		"probing for cx231xx non standard usbaudio\n");
 
+	/*
+	 * Extension init errors are ignored by the cx231xx core, so fini()
+	 * must be safe even if initialization fails part way through.
+	 */
+	spin_lock_init(&adev->slock);
+	INIT_WORK(&dev->wq_trigger, audio_trigger);
+	adev->teardown = false;
+	atomic_set(&dev->stream_started, 0);
+
 	err = snd_card_new(dev->dev, index[devnr], "Cx231xx Audio",
 			   THIS_MODULE, 0, &card);
 	if (err < 0)
 		return err;
 
-	spin_lock_init(&adev->slock);
 	err = snd_pcm_new(card, "Cx231xx Audio", 0, 0, 1, &pcm);
 	if (err < 0)
 		goto err_free_card;
@@ -596,8 +612,6 @@ static int cx231xx_audio_init(struct cx231xx *dev)
 	strscpy(card->shortname, "Cx231xx Audio", sizeof(card->shortname));
 	strscpy(card->longname, "Conexant cx231xx Audio", sizeof(card->longname));
 
-	INIT_WORK(&dev->wq_trigger, audio_trigger);
-
 	err = snd_card_register(card);
 	if (err < 0)
 		goto err_free_card;
@@ -651,14 +665,18 @@ static int cx231xx_audio_init(struct cx231xx *dev)
 
 err_free_pkt_size:
 	kfree(adev->alt_max_pkt_size);
+	adev->alt_max_pkt_size = NULL;
 err_free_card:
 	snd_card_free(card);
+	adev->sndcard = NULL;
 
 	return err;
 }
 
 static int cx231xx_audio_fini(struct cx231xx *dev)
 {
+	unsigned long flags;
+
 	if (dev == NULL)
 		return 0;
 
@@ -669,6 +687,16 @@ static int cx231xx_audio_fini(struct cx231xx *dev)
 		return 0;
 	}
 
+	/*
+	 * Block new trigger work before draining already queued work.
+	 * cancel_work_sync() may sleep, so it must run after dropping slock.
+	 */
+	spin_lock_irqsave(&dev->adev.slock, flags);
+	dev->adev.teardown = true;
+	spin_unlock_irqrestore(&dev->adev.slock, flags);
+
+	cancel_work_sync(&dev->wq_trigger);
+
 	if (dev->adev.sndcard) {
 		snd_card_free_when_closed(dev->adev.sndcard);
 		kfree(dev->adev.alt_max_pkt_size);
diff --git a/drivers/media/usb/cx231xx/cx231xx.h b/drivers/media/usb/cx231xx/cx231xx.h
index 19f5036a78d7..99c6a279944f 100644
--- a/drivers/media/usb/cx231xx/cx231xx.h
+++ b/drivers/media/usb/cx231xx/cx231xx.h
@@ -418,6 +418,7 @@ struct cx231xx_audio {
 	struct snd_card *sndcard;
 
 	int users, shutdown;
+	bool teardown;		/* audio fini in progress; set under slock */
 	/* locks */
 	spinlock_t slock;
 
-- 
2.34.1


