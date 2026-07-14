Return-Path: <linux-media+bounces-67532-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 79cFBVOaVWoGqwAAu9opvQ
	(envelope-from <linux-media+bounces-67532-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 04:09:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F7275049D
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 04:09:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67532-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67532-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69E43308CB0E
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 02:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5849D37B03C;
	Tue, 14 Jul 2026 02:05:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FED35957;
	Tue, 14 Jul 2026 02:05:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783994753; cv=none; b=P8SrfBoSYe9EeK+L7ubSZ9duDu8Fsv4I6bhL8GxHZkN0fpIV3zHo4PJOu+OZaSL1PeS1gloKLbIguxDoXTWh4KwyhATJEmdfhAWxoUycSTj9BMH19SJfDhePC8D5HTZpxjyys09lOcbh6BupDMakMekeaAJ1RJ9EK5G57zHRPpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783994753; c=relaxed/simple;
	bh=0ti1Ldu58kffWfgSL38M+Cff0aojGKXgxJSvseRuz9E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R0XhON3uRmH2cVIGvILnJyDnBaQVaGaElu1fdbfIhvqz1F0BmoLtTQIamryr3OiADSyI3ghkxi8ld2BPfEi3vkGpL6AZly33uNX8R59iO45etFUFrCbqq20LTuHfMeDmxQXZyhGQd2VhXnlexSTrMsgTB7PC4faxUx2XKMVebqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=162.243.161.220
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wA3AuJzmVVqpHlJAA--.6138S3;
	Tue, 14 Jul 2026 10:05:40 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app1 (Coremail) with SMTP id yy_KCgBXyKFymVVqmyDSAg--.28764S2;
	Tue, 14 Jul 2026 10:05:38 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH] media: nuvoton: npcm-video: quiesce VCD IRQ before teardown in remove
Date: Tue, 14 Jul 2026 02:04:43 +0000
Message-Id: <20260714020443.2795883-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yy_KCgBXyKFymVVqmyDSAg--.28764S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?iUNvXwXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnVCjTgEH9dVomQuWcozCBBFuQHMub3xCTcaqJhWvQUrmJzcPvPZRWmrwNbr1jlDSOWph
	btrZUVyggrj9ydiDOc6p9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoWxZF45Kr15Cr4UJFWxtrWrWFX_yoWrWr4xpF
	WrKa13ArZ8JF10q3WUZF4rZFy5Awn7CF4akryjk34fA345JryFqF10vFyUt3y5Ar97WrW2
	qrWFvw4kur4YqFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8
	JbIYCTnIWIevJa73UjIFyTuYvjxU7gAwDUUUU
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[zju.edu.cn];
	TAGGED_FROM(0.00)[bounces-67532-lists,linux-media=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kwliu@nuvoton.com,m:kflin@nuvoton.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:fanwu01@zju.edu.cn,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[fanwu01@zju.edu.cn,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[fanwu01@zju.edu.cn,linux-media@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,zju.edu.cn:from_mime,zju.edu.cn:email,zju.edu.cn:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76F7275049D

The VCD interrupt is requested with devm_request_threaded_irq() in
npcm_video_init(), so it stays registered until the devm release that
follows npcm_video_remove().  remove() itself calls kfree(video), so a
VCD interrupt delivered between kfree(video) and that devm release
dereferences freed memory: npcm_video_irq() reads VCD_STAT off
video->vcd_regmap before the VIDEO_STREAMING flag early-return, so the
use-after-free is unconditional on delivery, not gated by streaming
state.

With streaming active, stop_streaming() (run from vb2_queue_release())
masks VCD_INTE and resets the VCD, but an in-flight handler can
re-enable VCD_INTE afterward.  On a DONE or FIFO-overrun/overflow
interrupt the handler finishes its buffer under buffer_lock and then
calls npcm_video_start_frame().  start_frame() drops buffer_lock before
it re-enables VCD_INTE (VCD_INTE_DONE_IE) and starts the next capture
(npcm_video_command() with VCD_CMD_GO); it can therefore perform those
operations after stop_streaming() masks and resets the VCD.

For the re-arm to happen, start_frame() must take buffer_lock, find a
next queued buffer, and release the lock before stop_streaming() empties
the list.  Once start_frame() has released the lock, the VCD re-enable
and capture start that follow are outside buffer_lock, so emptying the
list afterwards cannot stop them.  buffer_lock protects the buffer list
only; it is not held for the re-arm and capture start, nor for
stop_streaming()'s mask and reset, so those VCD writes are not
serialized with each other.  start_frame() returns without re-arming
when no next buffer is queued, there is no video signal, or the VCD
stays busy past its poll timeout.

That capture can complete and raise VCD_STAT_DONE; with VCD_INTE
re-armed, a new interrupt can then fire after kfree(video), and the
handler dereferences the freed per-device structure.

Unregister the video device, then mask the VCD interrupt source and
unregister and drain the threaded handler with devm_free_irq() before
releasing the vb2 buffers, the ECE state and the per-device structure.
devm_free_irq() also clears the devm action, so the later devm release
is a no-op and does not double-free.  Gating the re-arm alone would not
close the window: the handler dereferences the per-device structure
before any streaming-flag check, so any interrupt delivered after
kfree(video) is fatal regardless of re-arm.

This issue was found by an in-house static analysis tool.

Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.5
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 drivers/media/platform/nuvoton/npcm-video.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 52505af35c08..637b1fe54824 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -120,6 +120,7 @@ struct npcm_video {
 
 	struct list_head buffers;
 	struct mutex buffer_lock; /* buffer list lock */
+	int irq;
 	unsigned long flags;
 	unsigned int sequence;
 
@@ -1707,6 +1708,7 @@ static int npcm_video_init(struct npcm_video *video)
 		dev_err(dev, "Failed to find VCD IRQ\n");
 		return -ENODEV;
 	}
+	video->irq = irq;
 
 	rc = devm_request_threaded_irq(dev, irq, NULL, npcm_video_irq,
 				       IRQF_ONESHOT, DEVICE_NAME, video);
@@ -1808,6 +1810,8 @@ static void npcm_video_remove(struct platform_device *pdev)
 	struct npcm_video *video = to_npcm_video(v4l2_dev);
 
 	video_unregister_device(&video->vdev);
+	regmap_write(video->vcd_regmap, VCD_INTE, 0);
+	devm_free_irq(dev, video->irq, video);
 	vb2_queue_release(&video->queue);
 	v4l2_ctrl_handler_free(&video->ctrl_handler);
 	v4l2_device_unregister(v4l2_dev);
-- 
2.34.1


