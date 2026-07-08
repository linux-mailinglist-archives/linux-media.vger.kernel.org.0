Return-Path: <linux-media+bounces-66938-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ev9GGWiqTWp48gEAu9opvQ
	(envelope-from <linux-media+bounces-66938-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 03:39:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C87C7720E0E
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 03:39:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66938-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66938-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30C173043FFF
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 01:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCA8363C4C;
	Wed,  8 Jul 2026 01:38:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CC41B87C9;
	Wed,  8 Jul 2026 01:38:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783474738; cv=none; b=kC/axLgH3eGb9goFEYA5HGgYzXdDKav6kqYvWJl7Q38gSjbz2Lhlt8JOfd2pyQA5xtiGEy7+maTLc171StjlKZpJtcS9f6R772O1vlQYWF1CX7ZJRaUzsHrlTcPoEPjE9LVQxmcuH7rvyKZpW0eaj7ZwHTpK78UmKH6fEWGMGGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783474738; c=relaxed/simple;
	bh=1PJ6NSrp383TBP5Fo5f1Hbp75E76A3A5fov5bxwUv5c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R618aT5sIvmPAG2fq9/hjvZIcQzlbkYVleUmbBeHyXRem51CEKqmf3BtoUaKwW/8MkH//PQ/rn9VXAlMGNIK1/Xc8rIGJLy7xOYJOurTXwzrkAFHhHDSrktgMq9Sw50INYF6bxZzs2nXl6XocCOJ2pyGhJ/3J7UYzNS0WeCXMBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=207.46.229.174
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wCXYOAaqk1qZHYeAA--.13011S3;
	Wed, 08 Jul 2026 09:38:35 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app3 (Coremail) with SMTP id zS_KCgB3jW8Zqk1qLcv0Ag--.9992S2;
	Wed, 08 Jul 2026 09:38:34 +0800 (CST)
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
Subject: [PATCH v2] media: ti: vpe: quiesce overflow recovery before freeing streams
Date: Wed,  8 Jul 2026 01:37:38 +0000
Message-Id: <20260708013738.110752-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <246a3e47-02ac-46c1-b3cc-dfcf30c00065@ti.com>
References: <246a3e47-02ac-46c1-b3cc-dfcf30c00065@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zS_KCgB3jW8Zqk1qLcv0Ag--.9992S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?FLfBEgXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnZPoDCNGYdHSfuFmYJL54WN9NBOBqpb7oUmuxhhZW0TgVr2Czv30HbdtLhMVeYyILSnM
	rHVjaCmtEVoP/BqCypk=
X-Coremail-Antispam: 1Uk129KBj93XoWxKF4UGrWUZw43trykWFW8KrX_yoW3tF4fpF
	WrJ34SkrZ7JF40qF47Aw1akFWFkryFqayjyry7u343Cr45Kr4YvF1xt3W8Zr97JF1rZay7
	tr45t3yxur48XFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66938-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zju.edu.cn:from_mime,zju.edu.cn:email,zju.edu.cn:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C87C7720E0E

The VIP overflow recovery work is armed from the hardirq handler when a
FIFO overflow is detected, and the list-complete path looks the stream
up through the VPDMA list private pointer. Both keep touching stream,
port and device state; the recovery worker also resets the parser and
VPDMA, repopulates the descriptor list, and can re-enable overflow
interrupts.

vip_stop_streaming() masks and clears the per-list IRQs, but it neither
synchronizes the hardirq handler nor cancels recovery_work. If an
overflow IRQ has already queued recovery_work, or a list-complete IRQ is
in flight when the stream is torn down, the handler or worker can still
dereference the stream after its resources are released: the descriptor
list is freed by vip_release_stream() on file release, and the stream
itself by free_stream() on unbind/remove.

Drain the IRQ handler and recovery work at both teardown points through
a shared vip_quiesce_stream() helper, before any stream-owned resource
is released: vip_stop_streaming() (the vb2 stop reached on file release)
and free_stream() (reached on unbind/remove) each disable IRQs for the
list, wait for any in-flight handler, cancel the worker, then disable
and synchronize one more time. vip_overflow_recovery_work() checks a
per-stream irq_rearm_allowed flag before it re-enables IRQs and
restarts the parser, so the worker does not re-arm the capture path
once streaming is stopping; the flag cannot close the check-then-act
window on its own, so the second disable/synchronize remains as the
backstop.

Clear the VPDMA list private pointer in vpdma_hwlist_release (and return
the released slot's value instead of the array base), so later
list-complete handling cannot recover a freed stream through a stale
private pointer.

This issue was found by an in-house static analysis tool and confirmed
by manual code review.

Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.5
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---

Changes in v2:
- Drain the overflow recovery worker at both teardown points through a
  shared vip_quiesce_stream() helper: vip_stop_streaming() (file release
  path, where vip_release_stream() frees the descriptor list) and
  free_stream() (unbind/remove). v1 drained only in free_stream().
- vip_overflow_recovery_work() checks a per-stream irq_rearm_allowed
  flag before re-enabling IRQs (suggested by Yemike Abhilash Chandra);
  keep the final disable/clear/synchronize_irq() as a backstop, since the
  flag check is not a synchronization primitive.
- Document how the issue was found and that the patch was prepared with
  LLM assistance (Assisted-by trailer and body note).

 drivers/media/platform/ti/vpe/vip.c   | 56 +++++++++++++++++++++++++--
 drivers/media/platform/ti/vpe/vip.h   |  1 +
 drivers/media/platform/ti/vpe/vpdma.c |  3 +-
 3 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
index cb0a5a07a3d4..82a1b3f8f1ac 100644
--- a/drivers/media/platform/ti/vpe/vip.c
+++ b/drivers/media/platform/ti/vpe/vip.c
@@ -814,6 +814,30 @@ static void clear_irqs(struct vip_dev *dev, int irq_num, int list_num)
 	vpdma_clear_list_stat(dev->shared->vpdma, irq_num, dev->slice_id);
 }
 
+/*
+ * Drain the overflow IRQ handler and recovery worker for this stream
+ * before its resources are released. disable_irqs() masks both the
+ * parser-overflow and the list-complete IRQ for this list.
+ * vip_overflow_recovery_work() checks irq_rearm_allowed before it
+ * re-enables IRQs, but it may have passed that check just before the
+ * flag is cleared and then enabled IRQs before cancel_work_sync()
+ * returns, so disable and synchronize one more time. Reached on
+ * close(fd) through vip_stop_streaming() and on unbind/remove through
+ * free_stream().
+ */
+static void vip_quiesce_stream(struct vip_stream *stream)
+{
+	struct vip_dev *dev = stream->port->dev;
+
+	disable_irqs(dev, dev->slice_id, stream->list_num);
+	clear_irqs(dev, dev->slice_id, stream->list_num);
+	synchronize_irq(dev->irq);
+	cancel_work_sync(&stream->recovery_work);
+	disable_irqs(dev, dev->slice_id, stream->list_num);
+	clear_irqs(dev, dev->slice_id, stream->list_num);
+	synchronize_irq(dev->irq);
+}
+
 static void populate_desc_list(struct vip_stream *stream)
 {
 	struct vip_port *port = stream->port;
@@ -1041,6 +1065,16 @@ static void vip_overflow_recovery_work(struct work_struct *work)
 	populate_desc_list(stream);
 	stream->num_recovery++;
 	if (stream->num_recovery < 5) {
+		/*
+		 * Streaming may have stopped while this work was pending or
+		 * running. If re-arming is no longer allowed, leave the
+		 * interrupts disabled and return instead of restarting the
+		 * capture path. vip_stop_streaming() and free_stream() clear
+		 * the flag before tearing the path down.
+		 */
+		if (!READ_ONCE(stream->irq_rearm_allowed))
+			return;
+
 		/* Reload the vpdma */
 		vip_load_vpdma_list_fifo(stream);
 
@@ -2428,6 +2462,7 @@ static int vip_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto err;
 
 	stream->num_recovery = 0;
+	WRITE_ONCE(stream->irq_rearm_allowed, true);
 
 	clear_irqs(dev, dev->slice_id, stream->list_num);
 	enable_irqs(dev, dev->slice_id, stream->list_num);
@@ -2452,12 +2487,18 @@ static void vip_stop_streaming(struct vb2_queue *vq)
 	struct vip_dev *dev = port->dev;
 	int ret;
 
+	/*
+	 * The stream is going down: forbid the recovery worker from
+	 * re-arming the capture path and drain any in-flight overflow IRQ
+	 * handler and worker before the descriptor list is freed by
+	 * vip_release_stream().
+	 */
+	WRITE_ONCE(stream->irq_rearm_allowed, false);
 	vip_parser_stop_imm(port, true);
 	vip_enable_parser(port, false);
 	unset_fmt_params(stream);
 
-	disable_irqs(dev, dev->slice_id, stream->list_num);
-	clear_irqs(dev, dev->slice_id, stream->list_num);
+	vip_quiesce_stream(stream);
 
 	if (port->subdev) {
 		ret = v4l2_subdev_call(port->subdev, video, s_stream, 0);
@@ -3139,6 +3180,16 @@ static void free_stream(struct vip_stream *stream)
 		return;
 
 	dev = stream->port->dev;
+	/*
+	 * Unbind/remove path: drop the stream from cap_streams[] so a
+	 * racing overflow handler misses the lookup, then drain the IRQ
+	 * handler and recovery worker (shared with vip_stop_streaming())
+	 * before releasing the stream-owned resources.
+	 */
+	WRITE_ONCE(stream->irq_rearm_allowed, false);
+	stream->port->cap_streams[stream->stream_id] = NULL;
+	vip_quiesce_stream(stream);
+
 	/* Free up the Drop queue */
 	list_for_each_safe(pos, q, &stream->dropq) {
 		buf = list_entry(pos,
@@ -3150,7 +3201,6 @@ static void free_stream(struct vip_stream *stream)
 
 	video_unregister_device(stream->vfd);
 	vpdma_hwlist_release(dev->shared->vpdma, stream->list_num);
-	stream->port->cap_streams[stream->stream_id] = NULL;
 	kfree(stream);
 }
 
diff --git a/drivers/media/platform/ti/vpe/vip.h b/drivers/media/platform/ti/vpe/vip.h
index 20525369955d..6976affc9ece 100644
--- a/drivers/media/platform/ti/vpe/vip.h
+++ b/drivers/media/platform/ti/vpe/vip.h
@@ -215,6 +215,7 @@ struct vip_stream {
 	char			name[16];
 	struct work_struct	recovery_work;
 	int			num_recovery;
+	bool			irq_rearm_allowed;
 	enum v4l2_field		field;		/* current field */
 	unsigned int		sequence;	/* current frame/field seq */
 	enum v4l2_field		sup_field;	/* supported field value */
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


