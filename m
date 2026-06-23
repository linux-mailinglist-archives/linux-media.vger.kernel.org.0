Return-Path: <linux-media+bounces-65461-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8Jt3KpdgOmoI7gcAu9opvQ
	(envelope-from <linux-media+bounces-65461-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 12:31:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 555C16B64BD
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 12:31:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65461-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65461-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5330B304E43E
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 10:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA773CCA19;
	Tue, 23 Jun 2026 10:31:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D95B1EB5E3;
	Tue, 23 Jun 2026 10:31:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210698; cv=none; b=nBHZqLOXjEuz8SzsTFI12m1GhFhGHGZ4Cglz4yUngH2dsF5bHZRW7ssCTAHTFSB/+hICsSNsaawKGpt/V5gPcfkSiI3A9d1wOqL18URgKAkeI+2GQPrSLiRmFR1ji48IS0dOLXe3gJQrNzeKs6NVc1sYkTveKrJ2UO8YJsHCWZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210698; c=relaxed/simple;
	bh=g9w1nnoj9PZP9t30ycj4eQL/Tri898VteycyFYDJrpg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gSaWMtXtbeSbQ5Ql3GjdVJlMgBQwD5v+6kFkR2pPaxQOebsoD8BeHyjuLI7L7NUxE9jEThBTPaUmwlW+lmgx+8DxwtfXhBItFe1OtBhQks98BGHqJRdermOIbSar2skYfwQ4S+tF6QSo3AfwImqQza0S2QHHfv2nZaP71qi+SO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=13.76.78.106
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wDnVpR_YDpqJsP8Ag--.4251S3;
	Tue, 23 Jun 2026 18:31:29 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app4 (Coremail) with SMTP id zi_KCgAX_DR_YDpqqnXDAQ--.12246S2;
	Tue, 23 Jun 2026 18:31:27 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: mirela.rabulea@nxp.com,
	mchehab@kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH] media: imx-jpeg: cancel timeout worker when streaming stops
Date: Tue, 23 Jun 2026 10:30:31 +0000
Message-Id: <20260623103031.3051-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zi_KCgAX_DR_YDpqqnXDAQ--.12246S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?8uYBzAXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnXz+g1OQfMo27QHy5TwQyZxPleTyGUXbnChair7cETXyoYXOFSx3siTBxadejsxrIXHa
	8lA0M4uvHQv4iMs7l3up9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoWxGw48Xw15Jr15WrWrtrW5urX_yoW5ZrWDpr
	WSg3yUAFWUtF4ktFyqqa18uF95GrnxXayUur40g34fArZ3Wr1YqrW8K3W5KFW7A392kFZ2
	qF45K3y7Za1YqFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
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
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU85l1PUUUUU==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65461-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[zju.edu.cn];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,zju.edu.cn];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fanwu01@zju.edu.cn,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mirela.rabulea@nxp.com,m:mchehab@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:imx@lists.linux.dev,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:fanwu01@zju.edu.cn,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fanwu01@zju.edu.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zju.edu.cn:email,zju.edu.cn:mid,zju.edu.cn:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 555C16B64BD

Each per-fd context ctx owns a delayed_work (ctx->task_timer, callback
mxc_jpeg_device_run_timeout) armed via schedule_delayed_work() at the end
of mxc_jpeg_device_run() to recover a stalled encode/decode job. The only
existing cancellation is cancel_delayed_work() in the frame-done IRQ
handler, which de-queues a pending work item but does not wait for a
callback that has already started, and it only runs when a frame completes.

When the fd is closed while a job is in flight (the frame-done IRQ has not
fired yet), nothing syncs the worker before mxc_jpeg_release() frees ctx
with kfree() after v4l2_m2m_ctx_release(). A queued or executing
mxc_jpeg_device_run_timeout() can then recover ctx through
container_of(&ctx->task_timer) and dereference it (ctx->mxc_jpeg,
slot_data, dev_warn) after ctx has been freed.

Cancel the worker from mxc_jpeg_stop_streaming(). The cancel cannot live
in mxc_jpeg_release(): mxc_jpeg_device_run() arms the timer while holding
only hw_lock, not the mxc_jpeg->lock mutex that release holds, so a cancel
in release could still race a concurrent mxc_jpeg_device_run() that
re-arms the timer afterwards. mxc_jpeg_stop_streaming() instead runs inside
v4l2_m2m_ctx_release() -> vb2_queue_release(), i.e. after
v4l2_m2m_cancel_job() has set TRANS_ABORT and waited for any in-flight job
to finish (so __v4l2_m2m_try_queue() will not queue and v4l2_m2m_try_run()
will not run any further job for this context, which prevents
mxc_jpeg_device_run() from re-arming the timer) and before the m2m context
is freed. cancel_delayed_work_sync() removes a pending work item and waits
for a running callback, so the worker can no longer race with the
subsequent kfree(). The cancel is placed before the buffer-release loop so
a concurrently running timeout callback cannot race with it over the same
buffers. If the frame-done IRQ canceled a still-pending timer, this cancel
is a no-op; if the timeout callback has already started, it waits for the
callback to finish. The same mxc_jpeg_stop_streaming() call is also
reached from VIDIOC_STREAMOFF, which drains the worker early, although
STREAMOFF itself does not free ctx -- the use-after-free arises only
when the fd is later closed.

This bug was found by static analysis.

Fixes: cfed9632ca8e ("media: imx-jpeg: Add a timeout mechanism for each frame")
Cc: stable@vger.kernel.org
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 9e4a813489c0..d85a9d196269 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1735,6 +1735,8 @@ static void mxc_jpeg_stop_streaming(struct vb2_queue *q)
 
 	dev_dbg(ctx->mxc_jpeg->dev, "Stop streaming ctx=%p", ctx);
 
+	cancel_delayed_work_sync(&ctx->task_timer);
+
 	/* Release all active buffers */
 	for (;;) {
 		if (V4L2_TYPE_IS_OUTPUT(q->type))
-- 
2.34.1


