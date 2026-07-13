Return-Path: <linux-media+bounces-67509-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZRiJLDdDVWromAAAu9opvQ
	(envelope-from <linux-media+bounces-67509-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:57:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4898374EEC2
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:57:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67509-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67509-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07FDE303D2EC
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 19:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EBF35AC07;
	Mon, 13 Jul 2026 19:57:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9697630D3EE;
	Mon, 13 Jul 2026 19:57:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783972651; cv=none; b=DNuWe8H4eL9U16IarTbroGauvTpElc42EYX7ZZoq3o3bw7dtEaSyfw6TFdDeuJjVpEuqYE9eO3miNKTx0a4TmadI7XKroccjDVwWbw8E3Leenf4PopPa+5kKBwCWwC1XxeyTfU6lNii7VSRL7VLz0FA5zIZIbox3q/fxrlsu5W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783972651; c=relaxed/simple;
	bh=Sd7fHcOFnkGjJGPE8BmjmTlPObz8Jf/LGVvBbYeQkXw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t2S86keDo5S1lTPxVh97FdVhhvQubGW5jX8MT/flMys3cvO67dVQzxK41NZSBR2qHp+TWLN2Yk2YVIkPQt+BeJaHSBOwFRxjh7xaaLsJYhj4O2FkEIEf6rgjlxy+fd9kL86DgRljUneODumGYGtKVr1z50u7WXf2BiBlf14Ba2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=13.76.78.106
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wAH_qggQ1VqT3xHAA--.1248S3;
	Tue, 14 Jul 2026 03:57:21 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app1 (Coremail) with SMTP id yy_KCgBXyKEeQ1VqC9PQAg--.28257S2;
	Tue, 14 Jul 2026 03:57:18 +0800 (CST)
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
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH v3] media: ti: vpe: quiesce overflow recovery before freeing streams
Date: Mon, 13 Jul 2026 19:56:22 +0000
Message-Id: <20260713195622.2181593-1-fanwu01@zju.edu.cn>
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
X-CM-TRANSID:yy_KCgBXyKEeQ1VqC9PQAg--.28257S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?kGdEngXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnVCjTgEH9dVomQuWcozCBBG9Iukj1Xax7yW6ylA20n27RyoaAVcJDbMCPodUEUXyEsBx
	KMMkRUgLtvtnz4bsoi2p9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoW3Ary8Jw43Zry7Gw4UZry8Xrc_yoW3GFy3pF
	Z5t34SkrZ7JF40qF47Aw1akFyYkrWvy3y2yryUu345Aw45JryYvF1xtF18ZF93Arn2va42
	vrs8t3yxur45XFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9mb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r1j6r4UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lF7xvr2IYc2Ij64vIr40E4x8a64kEw24l42xK82IYc2Ij64vIr41l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4U
	YxBIdaVFxhVjvjDU0xZFpf9x07jbo7NUUUUU=
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
	TAGGED_FROM(0.00)[bounces-67509-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[zju.edu.cn];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:y-abhilashchandra@ti.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:bparrot@ti.com,m:dale@farnsworth.org,m:dagriego@biglakesoftware.com,m:sbellary@baylibre.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fanwu01@zju.edu.cn,m:hverkuil@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4898374EEC2

The VIP overflow recovery worker is armed from the hardirq handler when a
FIFO overflow is detected, and the list-complete path looks the stream up
through the VPDMA list private pointer. Both keep touching stream, port
and device state; the recovery worker also resets the parser and VPDMA,
repopulates the descriptor list, and re-enables the per-list IRQs.

vip_stop_streaming() masks and clears the per-list IRQs, but it neither
synchronizes the hardirq handler nor disables recovery_work. An overflow
IRQ that has already queued recovery_work, or a list-complete IRQ in
flight when the stream is torn down, can therefore still dereference the
stream after its resources are released: the descriptor list is freed by
vip_release_stream() on file release, and the stream itself by
free_stream() on unbind/remove.

Drain the recovery worker and the IRQ handler at both teardown points
through a shared vip_quiesce_stream() helper, before any stream-owned
resource is released. disable_work_sync() cancels pending recovery_work,
drains a running instance, and raises its disable depth, so a subsequent
schedule_work() issued by a racing IRQ handler is rejected at the
workqueue scheduler: recovery_work cannot be requeued after
disable_work_sync() takes effect. The worker may still re-enable the
per-list IRQs before disable_work_sync() returns; disable_irqs() then
masks those sources and synchronize_irq() waits for any in-flight handler
that still dereferences stream state. recovery_work is created disabled
and enabled in vip_start_streaming() before IRQs, pairing the enable with
the teardown disable across the streaming lifecycle.

Return the released slot's value instead of the array base in
vpdma_hwlist_release(), and clear the slot so subsequent list-complete
lookups cannot recover the freed stream through the stale slot value.

This issue was found by an in-house static analysis tool and confirmed by
manual code review.

Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
Assisted-by: Codex:gpt-5.6
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
Changes in v3:
- Replace the per-stream irq_rearm_allowed flag and the repeated IRQ
  disable/synchronize_irq() in vip_quiesce_stream() with the workqueue
  disable-depth API, as suggested by Yemike Abhilash Chandra.
  disable_work_sync() cancels pending recovery_work, drains a running
  instance, and blocks any future schedule_work() from a racing IRQ
  handler at the scheduler; this also closes a window the v2 double-drain
  left open, where its second IRQ drain (synchronize_irq) waited for the
  in-flight handler but did not cancel the recovery_work it had requeued,
  so that work could run after free.
- Create recovery_work disabled and enable it in vip_start_streaming()
  before IRQs.
- In vip_stop_streaming(), quiesce before stopping the parser: a worker
  drained by disable_work_sync() may re-enable the parser before exiting, so
  stopping the parser first would be undone.

Changes in v2:
- Drain the overflow recovery worker at both teardown points through a
  shared vip_quiesce_stream() helper: vip_stop_streaming() (file release
  path) and free_stream() (unbind/remove). v1 drained only in
  free_stream().
- Document how the issue was found and that the patch was prepared with
  LLM assistance (Assisted-by trailer and body note).

Link: https://lore.kernel.org/r/20260708013738.110752-1-fanwu01@zju.edu.cn/
---
 drivers/media/platform/ti/vpe/vip.c   | 37 ++++++++++++++++++++++++---
 drivers/media/platform/ti/vpe/vpdma.c |  3 ++-
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
index cb0a5a07a3d4..30e9a85d4cf5 100644
--- a/drivers/media/platform/ti/vpe/vip.c
+++ b/drivers/media/platform/ti/vpe/vip.c
@@ -814,6 +814,22 @@ static void clear_irqs(struct vip_dev *dev, int irq_num, int list_num)
 	vpdma_clear_list_stat(dev->shared->vpdma, irq_num, dev->slice_id);
 }
 
+/*
+ * Quiesce recovery work and per-list IRQs before releasing stream resources.
+ * disable_work_sync() prevents the overflow handler from requeueing recovery
+ * work. Mask and synchronize IRQs afterwards because a running worker may
+ * have re-enabled them before exiting.
+ */
+static void vip_quiesce_stream(struct vip_stream *stream)
+{
+	struct vip_dev *dev = stream->port->dev;
+
+	disable_work_sync(&stream->recovery_work);
+	disable_irqs(dev, dev->slice_id, stream->list_num);
+	clear_irqs(dev, dev->slice_id, stream->list_num);
+	synchronize_irq(dev->irq);
+}
+
 static void populate_desc_list(struct vip_stream *stream)
 {
 	struct vip_port *port = stream->port;
@@ -2428,6 +2444,7 @@ static int vip_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto err;
 
 	stream->num_recovery = 0;
+	enable_work(&stream->recovery_work);
 
 	clear_irqs(dev, dev->slice_id, stream->list_num);
 	enable_irqs(dev, dev->slice_id, stream->list_num);
@@ -2452,13 +2469,17 @@ static void vip_stop_streaming(struct vb2_queue *vq)
 	struct vip_dev *dev = port->dev;
 	int ret;
 
+	/*
+	 * A running recovery worker may re-enable the parser, so quiesce it
+	 * and its IRQ handler before stopping the parser or releasing the
+	 * descriptor list.
+	 */
+	vip_quiesce_stream(stream);
+
 	vip_parser_stop_imm(port, true);
 	vip_enable_parser(port, false);
 	unset_fmt_params(stream);
 
-	disable_irqs(dev, dev->slice_id, stream->list_num);
-	clear_irqs(dev, dev->slice_id, stream->list_num);
-
 	if (port->subdev) {
 		ret = v4l2_subdev_call(port->subdev, video, s_stream, 0);
 		if (ret)
@@ -3074,6 +3095,8 @@ static int alloc_stream(struct vip_port *port, int stream_id, int vfl_type)
 		goto do_free_hwlist;
 
 	INIT_WORK(&stream->recovery_work, vip_overflow_recovery_work);
+	/* Start disabled; vip_start_streaming() enables it before IRQs. */
+	disable_work(&stream->recovery_work);
 
 	INIT_LIST_HEAD(&stream->vidq);
 
@@ -3139,6 +3162,13 @@ static void free_stream(struct vip_stream *stream)
 		return;
 
 	dev = stream->port->dev;
+	/*
+	 * Unpublish the stream and quiesce its IRQ handler and recovery worker
+	 * before releasing stream-owned resources.
+	 */
+	stream->port->cap_streams[stream->stream_id] = NULL;
+	vip_quiesce_stream(stream);
+
 	/* Free up the Drop queue */
 	list_for_each_safe(pos, q, &stream->dropq) {
 		buf = list_entry(pos,
@@ -3150,7 +3180,6 @@ static void free_stream(struct vip_stream *stream)
 
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


