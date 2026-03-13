Return-Path: <linux-media+bounces-55663-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKSHOvPxs2nYdgAAu9opvQ
	(envelope-from <linux-media+bounces-55663-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:16:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EC793282121
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 12:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BA85130462C2
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 11:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C06386C22;
	Fri, 13 Mar 2026 11:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q62C+uRg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E7538CFED;
	Fri, 13 Mar 2026 11:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400478; cv=none; b=KzMR3dSMpPrihWnrCK9j1XZAcvDmMsDl+3TD8gTYmb4ij/yMyffWjrKvx+51BGfXz+S4aA+M3ceIge9sdZq4knW5benDF2MiaL6xB30ybYj+odtEBpy9iE718YpOvMOS5kvBE4n1pskwE/v1DG2AR4HyxTPYlwZag3OqFoSCLBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400478; c=relaxed/simple;
	bh=adhoSvnhWHsnz+gAqddMsvFxEj6E+iuaCoKJ6szkzfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQJni+gtTUSa7jutMyQhvkXtYIDjzc4DD6JNitR/5+ufIbr93Ul+jW4klWBJoS8wThQ8z6MY59RPEZ8LCDwRo+VZD3SBJaSHG0FJD9UwC8nhGJ3D9k22OMxb16IJK/lSzau1mYODZHspUs7DVkCTIKYY9GhjlH1f/7FL1QHz6Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q62C+uRg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.224.131] (unknown [37.159.92.229])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC0B61934;
	Fri, 13 Mar 2026 12:13:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773400390;
	bh=adhoSvnhWHsnz+gAqddMsvFxEj6E+iuaCoKJ6szkzfQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q62C+uRg1XqjxsKsK6aLacr6AAymii7t6oxYduAzuNdCnuiB4HNyvM9GQfeVRc9ks
	 l4oYt/0Qn/NDyuc9BKLQOdaoCbGInd/vWkHtqX2iO1a+YqkW3ghE8ScIrM9DVfOqsp
	 tQ50OgCoizp4QPiCA7hvLpktVaBTDRVPkz1EwAUE=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Fri, 13 Mar 2026 12:14:03 +0100
Subject: [PATCH 7/7] media: rzv2h-ivc: Replace workqueue with direct
 function call
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-mali-ivc-fixes-v7-0-v1-7-cb0714cd1279@ideasonboard.com>
References: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
In-Reply-To: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 =?utf-8?q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4599;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=RLxKh9LLFJfWQAEK94Cwm+qxy9A5QI8aeTsdnt+gvpo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBps/GBMMivD6HKWbmCpaQUkXkFczR8IcsNlE4Ye
 +UKCs2ewguJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCabPxgQAKCRByNAaPFqFW
 PGfjD/9VgF84T/beep+NWluqFz4YxAL0pvaGrYjTG2DM2KTTxc+o4RsOR8CbZw9C3yBfvYe3C3X
 yyHyG8ymTg4YEwiIHldnVu45NkFyW+DNDVPJ2fbscVUItl5aP7ctuDMwnEMC3XIv81UlTz5kGMM
 KDqKrNyOFQPdGyXewJD4MAZnvEezNqZwT0VNRii8L/rd3uYtI9Ekt55bAB64uLUnD2NmwQugb2x
 U3cXEsw80cu/SPhWzsZGTLW8K2g4fRsNvnUfrg0uiYZT9xgVF9gRCC9rR7kQ9sMegqo06e0cD+a
 5GpD9sMuIljlv7UNjiDxd9p+M7VHQ42UnXgGjRQOzOVEfKySHgzXZmHiU64iQjuvr1KXlZ6f87U
 jgddy9BiX8AQ5sTNuw2HE7UAOpclR/1s4Mjxz4yDYKkS5LcVXxUa14+jP3pWgemSZWdZJFjzkKv
 NRR6kRpf2CFseYk/fYrHmnHkcRBNYoqI3SL5BOSTXXCWxx2l9JEP0ZKSLskYwDn+bZr4j0wQQDx
 OGBTZbl3ybc4rzz4vgUp7pAKL+1+MNzftnkdJyYzL6BiPNDJPhj6qJcpKNzaajbDoPfG69Jn0uQ
 AXwcF/d/t/e186n/0G2ItE4wklnsFu+WcwrC/GDLOkng6XxbJWA3s5MEuMqwvWsj7zyJmBB52nv
 aobimz3G8Q0zU8g==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55663-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: EC793282121
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Scheduling of work items with an async workqueue opens the door to
potential races between multiple instances of a work item.

While the frame transfer function is now protected agains races, using a
workqueue doesn't provide much benefit considering the limited cost of
creating a job transfer.

Replace usage of the work queue with direct function calls.

Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
---
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c      |  2 +-
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c    | 21 +++++++--------------
 .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h    |  3 +--
 3 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
index e9857eb5b51a..355842abb24b 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
@@ -119,7 +119,7 @@ static irqreturn_t rzv2h_ivc_isr(int irq, void *context)
 	 * The second interrupt indicates that the post-frame transfer VBLANK
 	 * has completed, we can now schedule a new frame transfer, if any.
 	 */
-	queue_work(ivc->buffers.async_wq, &ivc->buffers.work);
+	rzv2h_ivc_transfer_buffer(ivc);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
index 3580a57738a6..b167f1bab7ef 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
@@ -143,13 +143,11 @@ void rzv2h_ivc_buffer_done(struct rzv2h_ivc *ivc)
 	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 }
 
-static void rzv2h_ivc_transfer_buffer(struct work_struct *work)
+void rzv2h_ivc_transfer_buffer(struct rzv2h_ivc *ivc)
 {
-	struct rzv2h_ivc *ivc = container_of(work, struct rzv2h_ivc,
-					     buffers.work);
 	struct rzv2h_ivc_buf *buf;
 
-	guard(spinlock_irqsave)(&ivc->spinlock);
+	lockdep_assert_held(&ivc->spinlock);
 
 	if (ivc->vvalid_ifp)
 		return;
@@ -204,7 +202,7 @@ static void rzv2h_ivc_buf_queue(struct vb2_buffer *vb)
 
 	scoped_guard(spinlock_irq, &ivc->spinlock) {
 		if (vb2_is_streaming(vb->vb2_queue))
-			queue_work(ivc->buffers.async_wq, &ivc->buffers.work);
+			rzv2h_ivc_transfer_buffer(ivc);
 	}
 }
 
@@ -282,7 +280,9 @@ static int rzv2h_ivc_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	rzv2h_ivc_format_configure(ivc);
 
-	queue_work(ivc->buffers.async_wq, &ivc->buffers.work);
+	scoped_guard(spinlock_irq, &ivc->spinlock) {
+		rzv2h_ivc_transfer_buffer(ivc);
+	}
 
 	return 0;
 
@@ -449,11 +449,6 @@ int rzv2h_ivc_init_vdev(struct rzv2h_ivc *ivc, struct v4l2_device *v4l2_dev)
 
 	spin_lock_init(&ivc->buffers.lock);
 	INIT_LIST_HEAD(&ivc->buffers.queue);
-	INIT_WORK(&ivc->buffers.work, rzv2h_ivc_transfer_buffer);
-
-	ivc->buffers.async_wq = alloc_workqueue("rzv2h-ivc", 0, 0);
-	if (!ivc->buffers.async_wq)
-		return -EINVAL;
 
 	/* Initialise vb2 queue */
 	vb2q = &ivc->vdev.vb2q;
@@ -471,7 +466,7 @@ int rzv2h_ivc_init_vdev(struct rzv2h_ivc *ivc, struct v4l2_device *v4l2_dev)
 	ret = vb2_queue_init(vb2q);
 	if (ret) {
 		dev_err(ivc->dev, "vb2 queue init failed\n");
-		goto err_destroy_workqueue;
+		return ret;
 	}
 
 	/* Initialise Video Device */
@@ -520,8 +515,6 @@ int rzv2h_ivc_init_vdev(struct rzv2h_ivc *ivc, struct v4l2_device *v4l2_dev)
 	media_entity_cleanup(&vdev->entity);
 err_release_vb2q:
 	vb2_queue_release(vb2q);
-err_destroy_workqueue:
-	destroy_workqueue(ivc->buffers.async_wq);
 
 	return ret;
 }
diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
index 049f223200e3..6f644ba796a9 100644
--- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
+++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
@@ -104,8 +104,6 @@ struct rzv2h_ivc {
 	struct {
 		/* Spinlock to guard buffer queue */
 		spinlock_t lock;
-		struct workqueue_struct *async_wq;
-		struct work_struct work;
 		struct list_head queue;
 		struct rzv2h_ivc_buf *curr;
 		unsigned int sequence;
@@ -130,3 +128,4 @@ void rzv2h_ivc_deinit_subdevice(struct rzv2h_ivc *ivc);
 void rzv2h_ivc_write(struct rzv2h_ivc *ivc, u32 addr, u32 val);
 void rzv2h_ivc_update_bits(struct rzv2h_ivc *ivc, unsigned int addr,
 			   u32 mask, u32 val);
+void rzv2h_ivc_transfer_buffer(struct rzv2h_ivc *ivc);

-- 
2.53.0


