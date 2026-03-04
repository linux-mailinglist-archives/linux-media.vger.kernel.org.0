Return-Path: <linux-media+bounces-54452-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP74IDb9p2mlnAAAu9opvQ
	(envelope-from <linux-media+bounces-54452-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:36:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5FA1FDB53
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:36:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C639301F5CC
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 09:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969473988F6;
	Wed,  4 Mar 2026 09:36:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AB03822BE;
	Wed,  4 Mar 2026 09:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.78.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772617002; cv=none; b=LZnuc5Y4+mPjM4z17Z7u3EnoPrHzs4w/pUKiNJE8MzrcMXLpJX/XWOcXpyMwC5/lA6xrPj6YpizXRhtt5yzZnjyksF1oMCYdoXdOUoM8eXU9RbUOXscYoJstqxUPyr8yGYN4AS/N84alpq3BmsO8bJJrEOcDEJXRDcCyXJmBQoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772617002; c=relaxed/simple;
	bh=Nbar+qQ+FEFKmjSwZ/YKxYaxwW2O+L+vvwC6NhpahR0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oSWupMt70PS+mbo+QNWuMiS9ehlmT+V9mwBGDD1DGvglkqLXlereGVKoo33zYSnTGNBV5aUHO47n1eszPSY1Yn5/kGkxIxu6WkSv08cmTlILDz0JiIJjvyugnO1DfLju3kCOgvIpFp1TT5fbfTYRdDwN6iW89KnLXBJFjoERp4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=13.76.78.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wC3Nh0Q_adpkTIFAQ--.16844S3;
	Wed, 04 Mar 2026 17:36:17 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app4 (Coremail) with SMTP id zi_KCgDnfYMG_adp2KCYBQ--.53298S2;
	Wed, 04 Mar 2026 17:36:06 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: linux-media@vger.kernel.org
Cc: tiffany.lin@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH] media: mediatek: vcodec: fix use-after-free in encoder release path
Date: Wed,  4 Mar 2026 09:35:06 +0000
Message-Id: <20260304093506.236277-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zi_KCgDnfYMG_adp2KCYBQ--.53298S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?eygmewXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnVF/U4hEbTTFSw5kpxcvjRb6mQGmGX2Lq9AG8clAwRux2D2Ta4eYv/3f2xyhLs0q0Axz
	y3xBfAYJQz1E2yiHyG6p9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoWxZFyxtr13Jr1kXr1xKFWUKFX_yoWrXF17pF
	WfKrW2kayUJr4vyF1xta18Za4ruryagr47Gw40vw1fA3sxAr4qqr42kr109FWktrZ7tF4U
	ZrsFg3y3Gr4jyFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Gb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
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
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IU85l1PUUUUU==
X-Rspamd-Queue-Id: 5F5FA1FDB53
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-54452-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[zju.edu.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[mediatek.com,kernel.org,gmail.com,lists.infradead.org,vger.kernel.org,zju.edu.cn];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[fanwu01@zju.edu.cn,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

The fops_vcodec_release() function frees the context structure (ctx)
without first cancelling any pending or running work in ctx->encode_work.
This creates a race window where the workqueue handler (mtk_venc_worker)
may still be accessing the context memory after it has been freed.

Race condition:

    CPU 0 (release path)               CPU 1 (workqueue)
    ---------------------               ------------------
    fops_vcodec_release()
      v4l2_m2m_ctx_release()
        v4l2_m2m_cancel_job()
        // waits for m2m job "done"
                                        mtk_venc_worker()
                                          v4l2_m2m_job_finish()
                                          // m2m job "done"
                                          // BUT worker still running!
                                          // post-job_finish access:
                                        other ctx dereferences
                                          // UAF if ctx already freed
        // returns (job "done")
      kfree(ctx)  // ctx freed

Root cause: The v4l2_m2m_ctx_release() only waits for the m2m job
lifecycle (via TRANS_RUNNING flag), not the workqueue lifecycle.
After v4l2_m2m_job_finish() is called, the m2m framework considers
the job complete and v4l2_m2m_ctx_release() returns, but the worker
function continues executing and may still access ctx.

The work is queued during encode operations via:
  queue_work(ctx->dev->encode_workqueue, &ctx->encode_work)
The worker function accesses ctx->m2m_ctx, ctx->dev, and other ctx
fields even after calling v4l2_m2m_job_finish().

This vulnerability was confirmed with KASAN by running an instrumented
test module that widens the post-job_finish race window. KASAN detected:

  BUG: KASAN: slab-use-after-free in mtk_venc_worker+0x159/0x180
  Read of size 4 at addr ffff88800326e000 by task kworker/u8:0/12

  Workqueue: mtk_vcodec_enc_wq mtk_venc_worker

  Allocated by task 47:
    __kasan_kmalloc+0x7f/0x90
    fops_vcodec_open+0x85/0x1a0

  Freed by task 47:
    __kasan_slab_free+0x43/0x70
    kfree+0xee/0x3a0
    fops_vcodec_release+0xb7/0x190

Fix this by calling cancel_work_sync(&ctx->encode_work) before kfree(ctx).
This ensures the workqueue handler is both cancelled (if pending) and
synchronized (waits for any running handler to complete) before the
context is freed.

Placement rationale: The fix is placed after v4l2_ctrl_handler_free()
and before list_del_init(&ctx->list). At this point, all m2m operations
are done (v4l2_m2m_ctx_release() has returned), and we need to ensure
the workqueue is synchronized before removing ctx from the list and
freeing it.

Note: The open error path does NOT need cancel_work_sync() because
INIT_WORK() only initializes the work structure - it does not schedule
it. Work is only scheduled later during device_run() operations.

Fixes: 0934d3759615 ("media: mediatek: vcodec: separate decoder and encoder")
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index c977ed0c09b6..4e4541b2fc8e 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -215,6 +215,15 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
+	/*
+	 * Cancel any pending encode work before freeing the context.
+	 * Although v4l2_m2m_ctx_release() waits for m2m job completion,
+	 * the workqueue handler (mtk_venc_worker) may still be accessing
+	 * the context after v4l2_m2m_job_finish() returns. Without this,
+	 * a use-after-free occurs when the worker accesses ctx after kfree.
+	 */
+	cancel_work_sync(&ctx->encode_work);
+
 	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
 	list_del_init(&ctx->list);
 	spin_unlock_irqrestore(&dev->dev_ctx_lock, flags);
-- 
2.34.1


