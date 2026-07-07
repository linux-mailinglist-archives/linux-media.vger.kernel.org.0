Return-Path: <linux-media+bounces-66804-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BMGmI0tcTGpvjgEAu9opvQ
	(envelope-from <linux-media+bounces-66804-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 03:54:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE846716B3D
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 03:54:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66804-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66804-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02C993033FB8
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 01:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500A131326F;
	Tue,  7 Jul 2026 01:53:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594373101A9;
	Tue,  7 Jul 2026 01:53:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783389236; cv=none; b=hm+Otw2VZpBb4HjOtNGm5gc1fTDzkaZIYhOJMfdrTwnLkX2T5HGAuJaZ6iEvLATafkxY4XeSGDJvJWWTKoeXiA7WoSsFFTE9mGLP1FZAuw9/V6tGs4jokUWof40Z/T3CzmG8G7a6cX02pLPn1mOlznWoIXlVGmwa+vFXTBqO06A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783389236; c=relaxed/simple;
	bh=Co06N/H4+kM77LKr0xFPV4VHsc2xnihPmlU/wcj0Uw0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O7qbBKOcZhq5ilk0ZJHB80Lw7KsrmQnEpB5v7LRtgKUe91qJAqyhjrXYuKpVNrqJSK90Ts+0TYSJrDYJQUZBkhsKaGThwBwOLJKz9cYCjUGJ60Rat1oXCZH7nwrkgRxErfC6RMpr7DcdkFGNi9Mp8sobexCTElNiGMVZK0taY0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=206.189.21.223
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wCHx10qXExqDZ4VAA--.47898S3;
	Tue, 07 Jul 2026 09:53:47 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app1 (Coremail) with SMTP id yy_KCgC3BZ4qXExqGomhAg--.62828S2;
	Tue, 07 Jul 2026 09:53:46 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: y-abhilashchandra@ti.com
Cc: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	bparrot@ti.com,
	dale@farnsworth.org,
	dagriego@biglakesoftware.com,
	sbellary@baylibre.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH] media: ti: vpe: quiesce overflow recovery before freeing streams
Date: Tue,  7 Jul 2026 01:52:51 +0000
Message-Id: <20260707015251.877945-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yy_KCgC3BZ4qXExqGomhAg--.62828S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?FTPsNgXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnVCjTgEH9dVomQuWcozCBBEOdrwoTKE/heUMp91lDG7JJs3IuOigzybroPMUl6E8cnJy
	7r+uZYCb4yuNbR3k7Ump9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoWxAr45XFy3trW8WrykKry8JFc_yoWrWF1fpr
	WrJ34SkF97KF48tF43Cw1Y9FW5Ar1rtayjkry7u34UC3y3Gr4YvF18K3W8Zr97Ar93Zay3
	tr45Kay8uF45WFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU85l1PUUUUU==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66804-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[zju.edu.cn];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:y-abhilashchandra@ti.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:bparrot@ti.com,m:dale@farnsworth.org,m:dagriego@biglakesoftware.com,m:sbellary@baylibre.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:fanwu01@zju.edu.cn,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[fanwu01@zju.edu.cn,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fanwu01@zju.edu.cn,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zju.edu.cn:from_mime,zju.edu.cn:email,zju.edu.cn:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE846716B3D

The VIP overflow recovery work is armed from the hardirq handler when a
FIFO overflow is detected, and the list-complete path looks the stream
up through the VPDMA list private pointer. Both keep touching stream,
port and device state; the recovery worker also resets the parser and
VPDMA and can re-enable overflow interrupts.

vip_stop_streaming() masks and clears the per-list IRQs, but it neither
synchronizes the hardirq handler nor cancels recovery_work. If an
overflow IRQ has already queued recovery_work, or a list-complete IRQ is
in flight when the stream is torn down, the handler or worker can still
dereference the stream after its resources are released.

free_stream() owns the stream lifetime, so drain the IRQ handler and
recovery work there before freeing stream-owned resources: drop the
stream from cap_streams[], disable IRQs for its list (disable_irqs()
masks both the parser-overflow and the list-complete IRQ), wait for any
in-flight handler, cancel the worker, then disable and sync again
because the worker may have re-enabled interrupts while it ran. Only
then are the drop queue, video device and VPDMA list released and the
stream freed.

Additionally clear the VPDMA list private pointer in vpdma_hwlist_release
(and return the released slot's value instead of the array base), so
later list-complete handling cannot recover a freed stream through a
stale private pointer.

Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
Cc: stable@vger.kernel.org
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 drivers/media/platform/ti/vpe/vip.c   | 20 +++++++++++++++++++-
 drivers/media/platform/ti/vpe/vpdma.c |  3 ++-
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
index cb0a5a07a3d4..9c5bf91ade1b 100644
--- a/drivers/media/platform/ti/vpe/vip.c
+++ b/drivers/media/platform/ti/vpe/vip.c
@@ -3139,6 +3139,25 @@ static void free_stream(struct vip_stream *stream)
 		return;
 
 	dev = stream->port->dev;
+	/*
+	 * Quiesce the overflow IRQ and recovery work for this stream
+	 * before releasing its resources: the handler and the worker
+	 * both keep touching stream, port and device state. disable_irqs()
+	 * masks both the parser-overflow and the list-complete IRQ for
+	 * this list. Drop the stream from cap_streams[] first so a racing
+	 * overflow handler misses the lookup, wait for any in-flight
+	 * handler, cancel the worker, then disable and sync again because
+	 * the worker may have re-enabled interrupts while it ran.
+	 */
+	stream->port->cap_streams[stream->stream_id] = NULL;
+	disable_irqs(dev, dev->slice_id, stream->list_num);
+	clear_irqs(dev, dev->slice_id, stream->list_num);
+	synchronize_irq(dev->irq);
+	cancel_work_sync(&stream->recovery_work);
+	disable_irqs(dev, dev->slice_id, stream->list_num);
+	clear_irqs(dev, dev->slice_id, stream->list_num);
+	synchronize_irq(dev->irq);
+
 	/* Free up the Drop queue */
 	list_for_each_safe(pos, q, &stream->dropq) {
 		buf = list_entry(pos,
@@ -3150,7 +3169,6 @@ static void free_stream(struct vip_stream *stream)
 
 	video_unregister_device(stream->vfd);
 	vpdma_hwlist_release(dev->shared->vpdma, stream->list_num);
-	stream->port->cap_streams[stream->stream_id] = NULL;
 	kfree(stream);
 }
 
diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
index 573aa83f62eb..f9f5b2f1ee1a 100644
--- a/drivers/media/platform/ti/vpe/vpdma.c
+++ b/drivers/media/platform/ti/vpe/vpdma.c
@@ -988,7 +988,8 @@ void *vpdma_hwlist_release(struct vpdma_data *vpdma, int list_num)
 
 	spin_lock_irqsave(&vpdma->lock, flags);
 	vpdma->hwlist_used[list_num] = false;
-	priv = vpdma->hwlist_priv;
+	priv = vpdma->hwlist_priv[list_num];
+	vpdma->hwlist_priv[list_num] = NULL;
 	spin_unlock_irqrestore(&vpdma->lock, flags);
 
 	return priv;
-- 
2.34.1


