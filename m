Return-Path: <linux-media+bounces-66015-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hc4lH0O5QmrfAAoAu9opvQ
	(envelope-from <linux-media+bounces-66015-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 20:28:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C80F6DE0A9
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 20:28:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MYjG86ng;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66015-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66015-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4152F3008FEE
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39A13890E7;
	Mon, 29 Jun 2026 18:27:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D067388E64
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 18:26:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782757619; cv=none; b=N9aNMvUbovj9/jzPezB7v15yawTRGAjttA4+7VEVYxpdk+shVon6Pr0ofQ45uXdsG3glnnitAqAuRBiWXBYD6t0/vjZ4LbtrG0ZbaSGwVa79uffBvufBW+m46GmQczKi/UQMby9LKXaGevfVLyrcG8hy2l23w8oBnhL4eByjweU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782757619; c=relaxed/simple;
	bh=2F8FThk36fGYGqM7ya/UzUOnxeInBO0PFRux5j6iCrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RiMDPPz9rWqXQyrQA0Nny1WTJ2mMzsDtqu48Ms74itwfvP9PMaSEvOwefNrZEOa0CML6j3mXMJegNLVYbL7cM92INl/MHbADs6ZQc0BuxLCpToJKgwhKnkpUFtCjHX7JLSn+/V4s1FkXBFsRZphH1PgHjIXNH5I4QpoIXHvGZA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYjG86ng; arc=none smtp.client-ip=209.85.210.53
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e93f93ed01so2321670a34.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782757614; x=1783362414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsdbL5DRAkQaaXeT75avZqk+uqsSMeuaN3eTXvarUe4=;
        b=MYjG86ngofaWSvnVXWBXJ1J4+eTKKg5nryLR3rd5J1CRNYHmJBGeypuclb9DT83xXP
         K/stpB8uVEAJxZgBje+gSci9isLFIZnl0boaKe0hEU9HQx6xYVnRK7NTxGfj8ozFvpNu
         ayIHXP6ZdDRLjEl940d62EvxXMtACt2yA/YMCJNCARzGMW42/rYf9apqmkq2lJfU1YfK
         SuKemsfYmONPZ2MlXpaGCuOggj9lvxesvGf5mTxDgQ8SE50T9TdaSeqoYdcCY0yCC62Q
         kymk60QxPwzu+oxiBOW+5SSNAdCz5AlPRQTYej2L07Ns595u1r+s5etMar56aoSuZDUS
         iEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782757614; x=1783362414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BsdbL5DRAkQaaXeT75avZqk+uqsSMeuaN3eTXvarUe4=;
        b=FmlU1id5sJWOdORcwdglkwB7sjvFHxa9M+TxLDLpsQc0Dpgi5+YfPDAX7b2S1oqbUB
         NJh4Q1foyEbc1m5GZilgBzvIN8PSpL/YIW4f7uVXMyA/R+Vhpf9G39eO/b7GYms3sH1q
         abxhdBcq6a9P0NovkL0ipu4chgxK5lWbuZvrfQu3MbD66FqM8yI9+vW20nLuHW5xH0Eh
         E6Erf3wPSUXmwIw1V1jUOnPuf+WG8OBu5dBE72a+KkxC+A7NPd3y8pLsY2Wwxp9ICzCK
         1pCJXPOmsRX4xhbd0PORrmdLVxm7UvgdlethrISp//+0tsoIVK6SQBNiIuubTSzgu8ZQ
         Nx1Q==
X-Forwarded-Encrypted: i=1; AFNElJ88aZqGyVm6yTR9uEv9u54bK1xMuNODCiEzQ3JHEwrWL4cLYjmYzTjYlzJzwdACLZU5qmxFf126GtsKjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCJDnUKFirKh2ozE9eeTEtbQcLDk7+uYYVJ88Zs+HHKY7s8a0e
	ctq+26K3w1EduwiZL7F9/l3wyAcptWJWbF/L1LQy0a3ZO9X0Axp+/7rv54c2fg==
X-Gm-Gg: AfdE7cmxkaMqK3IFIOYqxgEWVQTwfhaSlznKhy6fWXpSU3sqQrDDER+aYThFo9aYtm6
	Xlqxxn4jfE3j04hsw+/N38r4Tenye9vkOznqmUVlTsNaOR3n/r4zL3wsuH7I99J1qj4CHLNHRjL
	6gEm1ZopRMxQo9PJdn5XKF17stYqzvqGPQrs3m6WO6sDhF0Q6/M+MiGu0ORwo8r67C3wHeDztl+
	QNE5zfcJHcTo0jI61ylqi5TskYptOTv7kG7Y5ghrOLTVVqHmyGJjxccF0/pcb5/X4RncrklxZoN
	aGKjfJHlm0xrQ/UAQDow5X0AsXuMnJivitohbNLTOe7fUhLbBYSf0ohOZbRSz2si0ju3iVNTDt4
	++4AthmEmgA06fAcEZGzCwLuxjrpEqgdyn8SXnBtmgxODSKrtkkj8hqtXGm1QAGhqOvqwSjGaOv
	85TpWMqm7NBU0AdFMW5yRIXxLfx9NI1jLkvDYQeURj6vkwwOo/HDd0x6xwe0V88Q==
X-Received: by 2002:a05:6830:210b:b0:7de:5bad:ace1 with SMTP id 46e09a7af769-7e9ec60e793mr552019a34.12.1782757614199;
        Mon, 29 Jun 2026 11:26:54 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec2ba18esm396875a34.16.2026.06.29.11.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 11:26:53 -0700 (PDT)
From: hoff.benjamin.k@gmail.com
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 3/5] media: hws: add video bounce path for shared remap windows
Date: Mon, 29 Jun 2026 14:26:47 -0400
Message-ID: <20260629182649.247879-4-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629182649.247879-1-hoff.benjamin.k@gmail.com>
References: <20260629182649.247879-1-hoff.benjamin.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66015-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[hoffbenjamink@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C80F6DE0A9

From: Ben Hoff <hoff.benjamin.k@gmail.com>

The hardware selects BAR remap windows from the high bits of the
device-side capture address. Since video and audio share one remap window
per channel, direct programming of arbitrary vb2 DMA addresses is not
reliable once audio capture also needs that window.

Add a per-channel video bounce path through the coherent scratch arena,
copy completed frames into userspace buffers, and keep the threaded IRQ
queue ownership rules explicit while pre-arming the next buffer.

Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 drivers/media/pci/hws/hws.h       |   3 +
 drivers/media/pci/hws/hws_irq.c   | 272 +++++++++++++++++-------
 drivers/media/pci/hws/hws_irq.h   |   1 +
 drivers/media/pci/hws/hws_pci.c   |  16 +-
 drivers/media/pci/hws/hws_video.c | 330 +++++++++++++++++++++++++-----
 drivers/media/pci/hws/hws_video.h |  10 +-
 6 files changed, 501 insertions(+), 131 deletions(-)

diff --git a/drivers/media/pci/hws/hws.h b/drivers/media/pci/hws/hws.h
index c0541190c047..552f0663e5d8 100644
--- a/drivers/media/pci/hws/hws.h
+++ b/drivers/media/pci/hws/hws.h
@@ -53,6 +53,7 @@ struct hwsvideo_buffer {
 	int slot;
 };
 
+#define HWS_VIDEO_DIRECT_SLOT (-1)
 #define HWS_VIDEO_BOUNCE_SLOTS 2
 
 struct hws_video {
@@ -174,6 +175,8 @@ struct hws_pcie_dev {
 
 	bool suspended;
 	int irq;
+	spinlock_t irq_thread_lock; /* protects threaded video IRQ counters */
+	unsigned int irq_pending_vdone[MAX_VID_CHANNELS];
 
 	/* Error flags */
 	int pci_lost;
diff --git a/drivers/media/pci/hws/hws_irq.c b/drivers/media/pci/hws/hws_irq.c
index a79cc10720d7..9ad0a69c0b9d 100644
--- a/drivers/media/pci/hws/hws_irq.c
+++ b/drivers/media/pci/hws/hws_irq.c
@@ -7,8 +7,6 @@
 #include <linux/minmax.h>
 #include <linux/string.h>
 
-#include <media/videobuf2-dma-contig.h>
-
 #include "hws_irq.h"
 #include "hws_reg.h"
 #include "hws_video.h"
@@ -45,6 +43,24 @@ static int hws_arm_next(struct hws_pcie_dev *hws, u32 ch)
 	}
 
 	spin_lock_irqsave(&v->irq_lock, flags);
+	if (v->active) {
+		buf = v->active;
+		spin_unlock_irqrestore(&v->irq_lock, flags);
+		dev_dbg(&hws->pdev->dev,
+			"arm_next(ch=%u): active buffer already armed %p\n",
+			ch, buf);
+		return 0;
+	}
+	if (v->next_prepared) {
+		buf = v->next_prepared;
+		v->active = buf;
+		v->next_prepared = NULL;
+		spin_unlock_irqrestore(&v->irq_lock, flags);
+		dev_dbg(&hws->pdev->dev,
+			"arm_next(ch=%u): promoted prepared buffer %p\n",
+			ch, buf);
+		return 0;
+	}
 	if (list_empty(&v->capture_queue)) {
 		spin_unlock_irqrestore(&v->irq_lock, flags);
 		dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): queue empty\n", ch);
@@ -70,7 +86,7 @@ static int hws_arm_next(struct hws_pcie_dev *hws, u32 ch)
 		dev_dbg(&hws->pdev->dev,
 			"arm_next(ch=%u): suspended after pick\n", ch);
 		spin_lock_irqsave(&v->irq_lock, f);
-		if (v->active) {
+		if (v->active == buf) {
 			list_add(&buf->list, &v->capture_queue);
 			v->queued_count++;
 			v->active = NULL;
@@ -79,11 +95,22 @@ static int hws_arm_next(struct hws_pcie_dev *hws, u32 ch)
 		return -EBUSY;
 	}
 
-	/* Program the video DMA window for the selected buffer. */
+	/* Program the baseline DMA window; use arena bounce if needed. */
 	{
-		dma_addr_t dma_addr =
-		    vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
-		hws_program_dma_for_addr(hws, ch, dma_addr);
+		int ret = hws_program_dma_for_buffer(hws, ch, buf);
+
+		if (ret) {
+			unsigned long f;
+
+			spin_lock_irqsave(&v->irq_lock, f);
+			if (v->active == buf) {
+				v->active = NULL;
+				list_add(&buf->list, &v->capture_queue);
+				v->queued_count++;
+			}
+			spin_unlock_irqrestore(&v->irq_lock, f);
+			return ret;
+		}
 	}
 
 	dev_dbg(&hws->pdev->dev, "arm_next(ch=%u): programmed buffer %p\n", ch,
@@ -99,16 +126,16 @@ static void hws_video_handle_vdone(struct hws_video *v)
 	struct hws_pcie_dev *hws = v->parent;
 	unsigned int ch = v->channel_index;
 	struct hwsvideo_buffer *done;
+	struct hwsvideo_buffer *promoted_active = NULL;
 	unsigned long flags;
 	bool promoted = false;
+	int ret;
 
 	dev_dbg(&hws->pdev->dev,
 		"bh_video(ch=%u): stop=%d cap=%d active=%p\n",
 		ch, READ_ONCE(v->stop_requested), READ_ONCE(v->cap_active),
 		v->active);
 
-	int ret;
-
 	dev_dbg(&hws->pdev->dev,
 		"bh_video(ch=%u): entry stop=%d cap=%d\n", ch,
 		v->stop_requested, v->cap_active);
@@ -123,6 +150,7 @@ static void hws_video_handle_vdone(struct hws_video *v)
 	if (done && v->next_prepared) {
 		v->active = v->next_prepared;
 		v->next_prepared = NULL;
+		promoted_active = v->active;
 		promoted = true;
 	}
 	spin_unlock_irqrestore(&v->irq_lock, flags);
@@ -130,31 +158,38 @@ static void hws_video_handle_vdone(struct hws_video *v)
 	/* 1) Complete the buffer the HW just finished (if any) */
 	if (done) {
 		struct vb2_v4l2_buffer *vb2v = &done->vb;
-		size_t expected = v->pix.sizeimage;
-		size_t plane_size = vb2_plane_size(&vb2v->vb2_buf, 0);
+		enum vb2_buffer_state state = VB2_BUF_STATE_DONE;
 
-		if (expected > plane_size) {
+		ret = hws_video_prepare_done_buffer(v, done);
+		if (ret) {
 			dev_warn_ratelimited(&hws->pdev->dev,
-					     "bh_video(ch=%u): sizeimage %zu > plane %zu, dropping seq=%u\n",
-					     ch, expected, plane_size,
-					     (u32)atomic_read(&v->sequence_number) + 1);
-			vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_ERROR);
-			goto arm_next;
+					     "bh_video(ch=%u): failed to prepare completed buffer ret=%d\n",
+					     ch, ret);
+			state = VB2_BUF_STATE_ERROR;
+		} else {
+			dev_dbg(&hws->pdev->dev,
+				"bh_video(ch=%u): DONE buf=%p seq=%u half_seen=%d toggle=%u\n",
+				ch, done, vb2v->sequence, v->half_seen,
+				v->last_buf_half_toggle);
 		}
-		vb2_set_plane_payload(&vb2v->vb2_buf, 0, expected);
 
-		dma_rmb();	/* device writes visible before userspace sees it */
-
-		vb2v->sequence = (u32)atomic_inc_return(&v->sequence_number);
-		vb2v->vb2_buf.timestamp = ktime_get_ns();
-		dev_dbg(&hws->pdev->dev,
-			"bh_video(ch=%u): DONE buf=%p seq=%u half_seen=%d toggle=%u\n",
-			ch, done, vb2v->sequence, v->half_seen,
-			v->last_buf_half_toggle);
+		spin_lock_irqsave(&v->irq_lock, flags);
+		if (v->active == done) {
+			if (v->next_prepared) {
+				v->active = v->next_prepared;
+				v->next_prepared = NULL;
+				promoted_active = v->active;
+				promoted = true;
+			} else {
+				v->active = NULL;
+			}
+		} else if (v->active) {
+			promoted_active = v->active;
+			promoted = true;
+		}
+		spin_unlock_irqrestore(&v->irq_lock, flags);
 
-		if (!promoted)
-			v->active = NULL;	/* channel no longer owns this buffer */
-		vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_DONE);
+		vb2_buffer_done(&vb2v->vb2_buf, state);
 	}
 
 	if (READ_ONCE(hws->suspended))
@@ -163,14 +198,17 @@ static void hws_video_handle_vdone(struct hws_video *v)
 	if (promoted) {
 		dev_dbg(&hws->pdev->dev,
 			"bh_video(ch=%u): promoted pre-armed buffer active=%p\n",
-			ch, v->active);
+			ch, promoted_active);
 		spin_lock_irqsave(&v->irq_lock, flags);
-		hws_prime_next_locked(v);
+		ret = hws_prime_next_locked(v);
 		spin_unlock_irqrestore(&v->irq_lock, flags);
+		if (ret)
+			dev_warn_ratelimited(&hws->pdev->dev,
+					     "bh_video(ch=%u): failed to pre-arm next buffer ret=%d\n",
+					     ch, ret);
 		return;
 	}
 
-arm_next:
 	/* 2) Immediately arm the next queued buffer (if present) */
 	ret = hws_arm_next(hws, ch);
 	if (ret == -EAGAIN) {
@@ -178,16 +216,113 @@ static void hws_video_handle_vdone(struct hws_video *v)
 			"bh_video(ch=%u): no queued buffer to arm\n", ch);
 		return;
 	}
+	if (ret) {
+		dev_warn_ratelimited(&hws->pdev->dev,
+				     "bh_video(ch=%u): stopping video queue after DMA arm failure ret=%d\n",
+				     ch, ret);
+		hws_enable_video_capture(hws, ch, false);
+		WRITE_ONCE(v->cap_active, false);
+		WRITE_ONCE(v->stop_requested, true);
+		vb2_queue_error(&v->buffer_queue);
+		return;
+	}
 	dev_dbg(&hws->pdev->dev,
 		"bh_video(ch=%u): armed next buffer, active=%p\n", ch,
 		v->active);
 	/* On success the engine now points at v->active's DMA address */
 }
 
+static void hws_irq_ack_status(struct hws_pcie_dev *pdx, u32 int_state)
+{
+	if (!int_state || !pdx || !pdx->bar0_base)
+		return;
+
+	writel(int_state, pdx->bar0_base + HWS_REG_INT_STATUS);
+	(void)readl(pdx->bar0_base + HWS_REG_INT_STATUS);
+}
+
+static void hws_irq_record_vdone(struct hws_pcie_dev *pdx, unsigned int ch)
+{
+	unsigned long flags;
+
+	if (!pdx || ch >= MAX_VID_CHANNELS)
+		return;
+
+	spin_lock_irqsave(&pdx->irq_thread_lock, flags);
+	pdx->irq_pending_vdone[ch]++;
+	spin_unlock_irqrestore(&pdx->irq_thread_lock, flags);
+}
+
+static bool hws_irq_take_vdone(struct hws_pcie_dev *pdx, unsigned int *ch)
+{
+	unsigned long flags;
+	unsigned int i;
+
+	if (!pdx || !ch)
+		return false;
+
+	spin_lock_irqsave(&pdx->irq_thread_lock, flags);
+	for (i = 0; i < pdx->cur_max_video_ch && i < MAX_VID_CHANNELS; i++) {
+		if (pdx->irq_pending_vdone[i]) {
+			pdx->irq_pending_vdone[i]--;
+			*ch = i;
+			spin_unlock_irqrestore(&pdx->irq_thread_lock, flags);
+			return true;
+		}
+	}
+	spin_unlock_irqrestore(&pdx->irq_thread_lock, flags);
+	return false;
+}
+
+static bool hws_irq_queue_video(struct hws_pcie_dev *pdx, u32 int_state)
+{
+	bool wake_thread = false;
+	unsigned int ch;
+
+	for (ch = 0; ch < pdx->cur_max_video_ch; ++ch) {
+		u32 vbit = HWS_INT_VDONE_BIT(ch);
+
+		if (!(int_state & vbit))
+			continue;
+
+		if (READ_ONCE(pdx->video[ch].cap_active) &&
+		    !READ_ONCE(pdx->video[ch].stop_requested)) {
+			if (hws_toggle_debug) {
+				u32 toggle =
+				    readl_relaxed(pdx->bar0_base +
+						  HWS_REG_VBUF_TOGGLE(ch)) & 0x01;
+
+				WRITE_ONCE(pdx->video[ch].last_buf_half_toggle,
+					   toggle);
+			}
+			WRITE_ONCE(pdx->video[ch].half_seen, true);
+			hws_irq_record_vdone(pdx, ch);
+			wake_thread = true;
+			dev_dbg(&pdx->pdev->dev,
+				"irq: VDONE ch=%u queued for threaded completion\n",
+				ch);
+		} else {
+			dev_dbg(&pdx->pdev->dev,
+				"irq: VDONE ch=%u ignored (cap=%d stop=%d)\n",
+				ch,
+				READ_ONCE(pdx->video[ch].cap_active),
+				READ_ONCE(pdx->video[ch].stop_requested));
+		}
+	}
+
+	return wake_thread;
+}
+
 irqreturn_t hws_irq_handler(int irq, void *info)
 {
 	struct hws_pcie_dev *pdx = info;
 	u32 int_state;
+	bool wake_thread;
+
+	(void)irq;
+
+	if (!pdx || !pdx->bar0_base)
+		return IRQ_NONE;
 
 	dev_dbg(&pdx->pdev->dev, "irq: entry\n");
 	if (pdx->bar0_base) {
@@ -200,12 +336,11 @@ irqreturn_t hws_irq_handler(int irq, void *info)
 	/* Fast path: if suspended, quietly ack and exit */
 	if (READ_ONCE(pdx->suspended)) {
 		int_state = readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
-		if (int_state) {
-			writel(int_state, pdx->bar0_base + HWS_REG_INT_STATUS);
-			(void)readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
-		}
+		if (int_state)
+			hws_irq_ack_status(pdx, int_state);
 		return int_state ? IRQ_HANDLED : IRQ_NONE;
 	}
+
 	int_state = readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
 	if (!int_state || int_state == 0xFFFFFFFF) {
 		dev_dbg(&pdx->pdev->dev,
@@ -215,53 +350,35 @@ irqreturn_t hws_irq_handler(int irq, void *info)
 	}
 	dev_dbg(&pdx->pdev->dev, "irq: entry INT_STATUS=0x%08x\n", int_state);
 
-	/* Loop until all pending bits are serviced (max 100 iterations) */
-	for (u32 cnt = 0; int_state && cnt < MAX_INT_LOOPS; ++cnt) {
-		for (unsigned int ch = 0; ch < pdx->cur_max_video_ch; ++ch) {
-			u32 vbit = HWS_INT_VDONE_BIT(ch);
+	wake_thread = hws_irq_queue_video(pdx, int_state);
+	hws_irq_ack_status(pdx, int_state);
 
-			if (!(int_state & vbit))
-				continue;
+	return wake_thread ? IRQ_WAKE_THREAD : IRQ_HANDLED;
+}
 
-			if (READ_ONCE(pdx->video[ch].cap_active) &&
-			    !READ_ONCE(pdx->video[ch].stop_requested)) {
-				if (hws_toggle_debug) {
-					u32 toggle =
-					    readl_relaxed(pdx->bar0_base +
-						  HWS_REG_VBUF_TOGGLE(ch)) & 0x01;
-					WRITE_ONCE(pdx->video[ch].last_buf_half_toggle,
-						   toggle);
-				}
-				dma_rmb();
-				WRITE_ONCE(pdx->video[ch].half_seen, true);
-				dev_dbg(&pdx->pdev->dev,
-					"irq: VDONE ch=%u toggle=%u handling inline (cap=%d)\n",
-					ch,
-					READ_ONCE(pdx->video[ch].last_buf_half_toggle),
-					READ_ONCE(pdx->video[ch].cap_active));
-				hws_video_handle_vdone(&pdx->video[ch]);
-			} else {
-				dev_dbg(&pdx->pdev->dev,
-					"irq: VDONE ch=%u ignored (cap=%d stop=%d)\n",
-					ch,
-					READ_ONCE(pdx->video[ch].cap_active),
-					READ_ONCE(pdx->video[ch].stop_requested));
-			}
+irqreturn_t hws_irq_thread(int irq, void *info)
+{
+	struct hws_pcie_dev *pdx = info;
+	unsigned int ch;
+	unsigned int count = 0;
+	bool handled = false;
 
-			writel(vbit, pdx->bar0_base + HWS_REG_INT_STATUS);
-			(void)readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
-		}
+	(void)irq;
 
-		/* Re-read in case new interrupt bits popped while processing */
-		int_state = readl_relaxed(pdx->bar0_base + HWS_REG_INT_STATUS);
-		dev_dbg(&pdx->pdev->dev,
-			"irq: loop cnt=%u new INT_STATUS=0x%08x\n", cnt,
-			int_state);
-		if (cnt + 1 == MAX_INT_LOOPS)
+	if (!pdx || !pdx->bar0_base)
+		return IRQ_NONE;
+
+	while (hws_irq_take_vdone(pdx, &ch)) {
+		handled = true;
+		if (READ_ONCE(pdx->suspended))
+			continue;
+
+		hws_video_handle_vdone(&pdx->video[ch]);
+		count++;
+		if (count == MAX_INT_LOOPS)
 			dev_warn_ratelimited(&pdx->pdev->dev,
-					     "IRQ storm? status=0x%08x\n",
-					     int_state);
+					     "threaded IRQ processing many VDONE events\n");
 	}
 
-	return IRQ_HANDLED;
+	return handled ? IRQ_HANDLED : IRQ_NONE;
 }
diff --git a/drivers/media/pci/hws/hws_irq.h b/drivers/media/pci/hws/hws_irq.h
index a42867aa0c46..4374e9758e4d 100644
--- a/drivers/media/pci/hws/hws_irq.h
+++ b/drivers/media/pci/hws/hws_irq.h
@@ -6,5 +6,6 @@
 #include "hws.h"
 
 irqreturn_t hws_irq_handler(int irq, void *info);
+irqreturn_t hws_irq_thread(int irq, void *info);
 
 #endif /* HWS_INTERRUPT_H */
diff --git a/drivers/media/pci/hws/hws_pci.c b/drivers/media/pci/hws/hws_pci.c
index 589d4840e116..b042bbfae350 100644
--- a/drivers/media/pci/hws/hws_pci.c
+++ b/drivers/media/pci/hws/hws_pci.c
@@ -28,6 +28,11 @@
 #define HWS_BUSY_POLL_DELAY_US 10
 #define HWS_BUSY_POLL_TIMEOUT_US 1000000
 
+static bool hws_enable_audio = true;
+module_param_named(enable_audio, hws_enable_audio, bool, 0644);
+MODULE_PARM_DESC(enable_audio,
+		 "Enable ALSA HDMI audio capture devices; set to 0 for video-only mode");
+
 static unsigned long long hws_elapsed_us(u64 start_ns)
 {
 	return div_u64(ktime_get_mono_fast_ns() - start_ns, 1000);
@@ -125,6 +130,8 @@ static void hws_configure_hardware_capabilities(struct hws_pcie_dev *hdev)
 
 	if (hdev->cur_max_audio_ch > hdev->cur_max_video_ch)
 		hdev->cur_max_audio_ch = hdev->cur_max_video_ch;
+	if (!hws_enable_audio)
+		hdev->cur_max_audio_ch = 0;
 
 	/* universal buffer capacity */
 	hdev->max_hw_video_buf_sz = MAX_MM_VIDEO_SIZE;
@@ -519,6 +526,7 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	hws->irq = -1;
 	hws->suspended = false;
 	mutex_init(&hws->scratch_lock);
+	spin_lock_init(&hws->irq_thread_lock);
 	pci_set_drvdata(pdev, hws);
 
 	/* 1) Enable device + bus mastering (managed) */
@@ -584,10 +592,12 @@ static int hws_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	hws_irq_clear_pending(hws);
 
 	/* D) Request the legacy shared interrupt line (no vectors/MSI/MSI-X) */
-	ret = devm_request_irq(&pdev->dev, irq, hws_irq_handler, irqf,
-			       dev_name(&pdev->dev), hws);
+	ret = devm_request_threaded_irq(&pdev->dev, irq, hws_irq_handler,
+					hws_irq_thread, irqf, dev_name(&pdev->dev),
+					hws);
 	if (ret) {
-		dev_err(&pdev->dev, "request_irq(%d) failed: %d\n", irq, ret);
+		dev_err(&pdev->dev, "request_threaded_irq(%d) failed: %d\n",
+			irq, ret);
 		goto err_unwind_channels;
 	}
 
diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
index 1531d703f6d8..3a7b2abda502 100644
--- a/drivers/media/pci/hws/hws_video.c
+++ b/drivers/media/pci/hws/hws_video.c
@@ -11,6 +11,7 @@
 #include <linux/math64.h>
 #include <linux/interrupt.h>
 #include <linux/moduleparam.h>
+#include <linux/string.h>
 
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-ctrls.h>
@@ -39,7 +40,7 @@ static u32 hws_calc_sizeimage(struct hws_video *v, u16 w, u16 h,
 			      bool interlaced);
 
 /* DMA helper functions */
-static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma);
+static int hws_program_dma_window(struct hws_video *vid, dma_addr_t dma);
 static struct hwsvideo_buffer *
 hws_take_queued_buffer_locked(struct hws_video *vid);
 
@@ -58,7 +59,108 @@ module_param_named(dma_window_verify, dma_window_verify, bool, 0644);
 MODULE_PARM_DESC(dma_window_verify,
 		 "Read back DMA window registers after programming (debug)");
 
-static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma)
+static bool hws_dma_same_remap_page(dma_addr_t a, dma_addr_t b)
+{
+	return upper_32_bits(a) == upper_32_bits(b) &&
+	       (lower_32_bits(a) & PCI_E_BAR_ADD_MASK) ==
+	       (lower_32_bits(b) & PCI_E_BAR_ADD_MASK);
+}
+
+static size_t hws_video_bounce_size(void)
+{
+	return ALIGN((size_t)MAX_VIDEO_SCALER_SIZE, 64);
+}
+
+static bool hws_video_uses_audio_window(struct hws_video *vid)
+{
+	if (!vid || !vid->parent || vid->channel_index < 0)
+		return false;
+
+	return vid->channel_index < vid->parent->cur_max_audio_ch;
+}
+
+static void hws_ack_video_pending(struct hws_pcie_dev *hws, unsigned int ch)
+{
+	u32 vbit = HWS_INT_VDONE_BIT(ch);
+
+	if (!hws || !hws->bar0_base)
+		return;
+
+	writel(vbit, hws->bar0_base + HWS_REG_INT_STATUS);
+	(void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
+}
+
+static bool hws_video_dma_shares_channel_page(struct hws_video *vid,
+					      dma_addr_t dma, size_t size)
+{
+	struct hws_pcie_dev *hws;
+	struct hws_scratch_dma *aud;
+
+	if (!vid || !vid->parent)
+		return false;
+
+	if (!hws_dma_fits_remap_window(dma, size))
+		return false;
+
+	if (!hws_video_uses_audio_window(vid))
+		return true;
+
+	hws = vid->parent;
+	aud = &hws->scratch_aud[vid->channel_index];
+	if (!aud->cpu || !aud->size)
+		return true;
+
+	return hws_dma_same_remap_page(dma, aud->dma);
+}
+
+static int hws_select_video_dma(struct hws_video *vid,
+				struct hwsvideo_buffer *buf,
+				dma_addr_t *dma)
+{
+	struct hws_pcie_dev *hws;
+	struct hws_scratch_dma *arena;
+	dma_addr_t direct_dma;
+	size_t bounce_size;
+	unsigned int slot;
+
+	if (!vid || !buf || !dma)
+		return -EINVAL;
+
+	hws = vid->parent;
+	if (!hws)
+		return -ENODEV;
+
+	direct_dma = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
+	if (hws_video_dma_shares_channel_page(vid, direct_dma,
+					      vid->pix.sizeimage)) {
+		buf->slot = HWS_VIDEO_DIRECT_SLOT;
+		*dma = direct_dma;
+		return 0;
+	}
+
+	if (!hws_video_uses_audio_window(vid))
+		return -EFBIG;
+
+	if (buf->vb.vb2_buf.memory == VB2_MEMORY_DMABUF)
+		return -EOPNOTSUPP;
+
+	arena = &hws->scratch_vid[vid->channel_index];
+	if (!arena->cpu || !arena->size)
+		return -ENOMEM;
+
+	bounce_size = hws_video_bounce_size();
+	if (vid->pix.sizeimage > bounce_size ||
+	    arena->size < HWS_VIDEO_BOUNCE_SLOTS * bounce_size)
+		return -EFBIG;
+
+	slot = vid->next_bounce_slot % HWS_VIDEO_BOUNCE_SLOTS;
+	vid->next_bounce_slot = (slot + 1) % HWS_VIDEO_BOUNCE_SLOTS;
+	buf->slot = slot;
+	*dma = arena->dma + slot * bounce_size;
+	return 0;
+}
+
+static int hws_program_dma_window(struct hws_video *vid, dma_addr_t dma)
 {
 	const u32 addr_mask = PCI_E_BAR_ADD_MASK;
 	const u32 addr_low_mask = PCI_E_BAR_ADD_LOWMASK;
@@ -120,6 +222,8 @@ static void hws_program_dma_window(struct hws_video *vid, dma_addr_t dma)
 		/* Flush posted writes before arming DMA */
 		readl_relaxed(hws->bar0_base + HWS_HALF_SZ_OFF(ch));
 	}
+
+	return 0;
 }
 
 static struct hwsvideo_buffer *
@@ -138,32 +242,87 @@ hws_take_queued_buffer_locked(struct hws_video *vid)
 	return buf;
 }
 
-void hws_prime_next_locked(struct hws_video *vid)
+int hws_prime_next_locked(struct hws_video *vid)
 {
 	struct hws_pcie_dev *hws;
 	struct hwsvideo_buffer *next;
-	dma_addr_t dma;
+	int ret;
 
 	if (!vid)
-		return;
+		return -EINVAL;
 
 	hws = vid->parent;
 	if (!hws || !hws->bar0_base)
-		return;
+		return -ENODEV;
 
 	if (!READ_ONCE(vid->cap_active) || !vid->active || vid->next_prepared)
-		return;
+		return 0;
 
 	next = hws_take_queued_buffer_locked(vid);
 	if (!next)
-		return;
+		return 0;
+
+	ret = hws_program_dma_for_buffer(hws, vid->channel_index, next);
+	if (ret) {
+		list_add(&next->list, &vid->capture_queue);
+		vid->queued_count++;
+		return ret;
+	}
 
 	vid->next_prepared = next;
-	dma = vb2_dma_contig_plane_dma_addr(&next->vb.vb2_buf, 0);
-	hws_program_dma_for_addr(hws, vid->channel_index, dma);
 	dev_dbg(&hws->pdev->dev,
-		"ch%u pre-armed next buffer %p dma=0x%llx\n",
-		vid->channel_index, next, (u64)dma);
+		"ch%u pre-armed next buffer %p slot=%d\n",
+		vid->channel_index, next, next->slot);
+	return 0;
+}
+
+int hws_video_prepare_done_buffer(struct hws_video *vid,
+				  struct hwsvideo_buffer *buf)
+{
+	struct hws_pcie_dev *hws;
+	struct vb2_v4l2_buffer *vb2v;
+	size_t expected;
+	size_t plane_size;
+
+	if (!vid || !buf)
+		return -EINVAL;
+
+	hws = vid->parent;
+	vb2v = &buf->vb;
+	expected = vid->pix.sizeimage;
+	plane_size = vb2_plane_size(&vb2v->vb2_buf, 0);
+
+	if (expected > plane_size)
+		return -EMSGSIZE;
+
+	dma_rmb();
+	if (buf->slot != HWS_VIDEO_DIRECT_SLOT) {
+		struct hws_scratch_dma *arena;
+		size_t bounce_size = hws_video_bounce_size();
+		void *src;
+		void *dst;
+
+		if (!hws || buf->slot < 0 || buf->slot >= HWS_VIDEO_BOUNCE_SLOTS)
+			return -EINVAL;
+
+		arena = &hws->scratch_vid[vid->channel_index];
+		if (!arena->cpu || arena->size < (buf->slot + 1) * bounce_size)
+			return -ENOMEM;
+
+		dst = vb2_plane_vaddr(&vb2v->vb2_buf, 0);
+		if (!dst)
+			return -EFAULT;
+
+		src = (u8 *)arena->cpu + buf->slot * bounce_size;
+		memcpy(dst, src, expected);
+	}
+
+	vb2_set_plane_payload(&vb2v->vb2_buf, 0, expected);
+	vb2v->field = vid->pix.field;
+	vb2v->sequence = (u32)atomic_fetch_inc(&vid->sequence_number);
+	vb2v->vb2_buf.timestamp = ktime_get_ns();
+	buf->slot = HWS_VIDEO_DIRECT_SLOT;
+	return 0;
 }
 
 static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
@@ -183,19 +342,19 @@ static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
 	if (v->active) {
 		buf = v->active;
 		v->active = NULL;
-		buf->slot = 0;
+		buf->slot = HWS_VIDEO_DIRECT_SLOT;
 	} else if (!list_empty(&v->capture_queue)) {
 		buf = list_first_entry(&v->capture_queue,
 				       struct hwsvideo_buffer, list);
 		list_del_init(&buf->list);
 		if (v->queued_count)
 			v->queued_count--;
-		buf->slot = 0;
+		buf->slot = HWS_VIDEO_DIRECT_SLOT;
 	}
 	if (v->next_prepared) {
 		next = v->next_prepared;
 		v->next_prepared = NULL;
-		next->slot = 0;
+		next->slot = HWS_VIDEO_DIRECT_SLOT;
 		v->active = next;
 		have_next = true;
 	} else if (!list_empty(&v->capture_queue)) {
@@ -204,7 +363,7 @@ static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
 		list_del_init(&next->list);
 		if (v->queued_count)
 			v->queued_count--;
-		next->slot = 0;
+		next->slot = HWS_VIDEO_DIRECT_SLOT;
 		v->active = next;
 		have_next = true;
 	} else {
@@ -221,16 +380,14 @@ static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
 		if (dst)
 			memset(dst, 0x10, v->pix.sizeimage);
 		vb2_set_plane_payload(&vb2v->vb2_buf, 0, v->pix.sizeimage);
-		vb2v->sequence = (u32)atomic_inc_return(&v->sequence_number);
+		vb2v->field = v->pix.field;
+		vb2v->sequence = (u32)atomic_fetch_inc(&v->sequence_number);
 		vb2v->vb2_buf.timestamp = ktime_get_ns();
 		vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_DONE);
 	}
 	if (have_next && next) {
-		dma_addr_t dma =
-		    vb2_dma_contig_plane_dma_addr(&next->vb.vb2_buf, 0);
-
-		hws_program_dma_for_addr(hws, v->channel_index, dma);
-		programmed = true;
+		if (!hws_program_dma_for_buffer(hws, v->channel_index, next))
+			programmed = true;
 	}
 	if (programmed) {
 		wmb(); /* ensure descriptors visible before enabling capture */
@@ -475,6 +632,7 @@ static int hws_buf_init(struct vb2_buffer *vb)
 	struct hwsvideo_buffer *b = to_hwsbuf(vb);
 
 	INIT_LIST_HEAD(&b->list);
+	b->slot = HWS_VIDEO_DIRECT_SLOT;
 	return 0;
 }
 
@@ -492,12 +650,17 @@ static void hws_buf_cleanup(struct vb2_buffer *vb)
 		list_del_init(&b->list);
 }
 
-void hws_program_dma_for_addr(struct hws_pcie_dev *hws, unsigned int ch,
-			      dma_addr_t dma)
+int hws_program_dma_for_buffer(struct hws_pcie_dev *hws, unsigned int ch,
+			       struct hwsvideo_buffer *buf)
 {
 	struct hws_video *vid = &hws->video[ch];
+	dma_addr_t dma;
+	int ret;
 
-	hws_program_dma_window(vid, dma);
+	ret = hws_select_video_dma(vid, buf, &dma);
+	if (ret)
+		return ret;
+	return hws_program_dma_window(vid, dma);
 }
 
 void hws_enable_video_capture(struct hws_pcie_dev *hws, unsigned int chan,
@@ -1091,6 +1254,11 @@ static void hws_buffer_queue(struct vb2_buffer *vb)
 	struct hwsvideo_buffer *buf = to_hwsbuf(vb);
 	struct hws_pcie_dev *hws = vid->parent;
 	unsigned long flags;
+	bool queue_error = false;
+	bool streaming;
+	int ret;
+	LIST_HEAD(done);
+	struct hwsvideo_buffer *b, *tmp;
 
 	dev_dbg(&hws->pdev->dev,
 		"buffer_queue(ch=%u): vb=%p sizeimage=%u q_active=%d\n",
@@ -1098,16 +1266,16 @@ static void hws_buffer_queue(struct vb2_buffer *vb)
 		READ_ONCE(vid->cap_active));
 
 	/* Initialize buffer slot */
-	buf->slot = 0;
+	buf->slot = HWS_VIDEO_DIRECT_SLOT;
 
 	spin_lock_irqsave(&vid->irq_lock, flags);
 	list_add_tail(&buf->list, &vid->capture_queue);
 	vid->queued_count++;
+	streaming = vb2_is_streaming(&vid->buffer_queue) &&
+		    !READ_ONCE(vid->stop_requested);
 
 	/* If streaming and no in-flight buffer, prime HW immediately */
-	if (READ_ONCE(vid->cap_active) && !vid->active) {
-		dma_addr_t dma_addr;
-
+	if (streaming && !vid->active) {
 		dev_dbg(&hws->pdev->dev,
 			"buffer_queue(ch=%u): priming first vb=%p\n",
 			vid->channel_index, &buf->vb.vb2_buf);
@@ -1115,17 +1283,35 @@ static void hws_buffer_queue(struct vb2_buffer *vb)
 		vid->queued_count--;
 		vid->active = buf;
 
-		dma_addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
-		hws_program_dma_for_addr(vid->parent, vid->channel_index,
-					 dma_addr);
+		ret = hws_program_dma_for_buffer(vid->parent,
+						 vid->channel_index, buf);
+		if (ret) {
+			vid->active = NULL;
+			list_add(&buf->list, &vid->capture_queue);
+			vid->queued_count++;
+			WRITE_ONCE(vid->stop_requested, true);
+			hws_enable_video_capture(hws, vid->channel_index, false);
+			hws_video_collect_done_locked(vid, &done);
+			queue_error = true;
+			goto out_unlock;
+		}
 
+		hws_ack_video_pending(hws, vid->channel_index);
 		wmb(); /* ensure descriptors visible before enabling capture */
 		hws_enable_video_capture(hws, vid->channel_index, true);
 		hws_prime_next_locked(vid);
-	} else if (READ_ONCE(vid->cap_active) && vid->active) {
+	} else if (streaming && READ_ONCE(vid->cap_active) && vid->active) {
 		hws_prime_next_locked(vid);
 	}
+out_unlock:
 	spin_unlock_irqrestore(&vid->irq_lock, flags);
+	if (queue_error) {
+		list_for_each_entry_safe(b, tmp, &done, list) {
+			list_del_init(&b->list);
+			vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		}
+		vb2_queue_error(&vid->buffer_queue);
+	}
 }
 
 static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
@@ -1133,8 +1319,8 @@ static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct hws_video *v = q->drv_priv;
 	struct hws_pcie_dev *hws = v->parent;
 	struct hwsvideo_buffer *to_program = NULL;	/* local copy */
-	struct vb2_buffer *prog_vb2 = NULL;
 	unsigned long flags;
+	bool scratch_acquired = false;
 	int ret;
 
 	dev_dbg(&hws->pdev->dev, "start_streaming: ch=%u count=%u\n",
@@ -1169,15 +1355,48 @@ static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
 		return ret;
 	}
 
+	if (hws_video_uses_audio_window(v)) {
+		ret = hws_alloc_channel_scratch(hws, v->channel_index);
+		if (ret) {
+			struct hwsvideo_buffer *b, *tmp;
+			unsigned long f;
+			LIST_HEAD(queued);
+
+			spin_lock_irqsave(&v->irq_lock, f);
+			if (v->active) {
+				list_add_tail(&v->active->list, &queued);
+				v->active = NULL;
+			}
+			if (v->next_prepared) {
+				list_add_tail(&v->next_prepared->list, &queued);
+				v->next_prepared = NULL;
+			}
+			while (!list_empty(&v->capture_queue)) {
+				b = list_first_entry(&v->capture_queue,
+						     struct hwsvideo_buffer, list);
+				list_move_tail(&b->list, &queued);
+			}
+			spin_unlock_irqrestore(&v->irq_lock, f);
+
+			list_for_each_entry_safe(b, tmp, &queued, list) {
+				list_del_init(&b->list);
+				vb2_buffer_done(&b->vb.vb2_buf, VB2_BUF_STATE_QUEUED);
+			}
+			return ret;
+		}
+		scratch_acquired = true;
+	}
+
 	(void)hws_read_active_state(hws, v->channel_index,
 				       &v->pix.interlaced);
 
 	lockdep_assert_held(&v->state_lock);
 	/* init per-stream state */
 	WRITE_ONCE(v->stop_requested, false);
-	WRITE_ONCE(v->cap_active, true);
+	WRITE_ONCE(v->cap_active, false);
 	WRITE_ONCE(v->half_seen, false);
 	WRITE_ONCE(v->last_buf_half_toggle, 0);
+	atomic_set(&v->sequence_number, 0);
 
 	/* Try to prime a buffer, but it's OK if none are queued yet */
 	spin_lock_irqsave(&v->irq_lock, flags);
@@ -1187,7 +1406,6 @@ static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
 		list_del_init(&to_program->list);
 		v->queued_count--;
 		v->active = to_program;
-		prog_vb2 = &to_program->vb.vb2_buf;
 		dev_dbg(&hws->pdev->dev,
 			"start_streaming: ch=%u took buffer %p\n",
 			v->channel_index, to_program);
@@ -1196,17 +1414,35 @@ static int hws_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	/* Only program/enable HW if we actually have a buffer */
 	if (to_program) {
-		if (!prog_vb2)
-			prog_vb2 = &to_program->vb.vb2_buf;
 		{
-			dma_addr_t dma_addr;
-
-			dma_addr = vb2_dma_contig_plane_dma_addr(prog_vb2, 0);
-			hws_program_dma_for_addr(hws, v->channel_index, dma_addr);
+			LIST_HEAD(queued);
+			struct hwsvideo_buffer *b, *tmp;
+
+			ret = hws_program_dma_for_buffer(hws, v->channel_index,
+							 to_program);
+			if (ret) {
+				unsigned long f;
+
+				WRITE_ONCE(v->cap_active, false);
+				WRITE_ONCE(v->stop_requested, true);
+				spin_lock_irqsave(&v->irq_lock, f);
+				hws_video_collect_done_locked(v, &queued);
+				spin_unlock_irqrestore(&v->irq_lock, f);
+
+				list_for_each_entry_safe(b, tmp, &queued, list) {
+					list_del_init(&b->list);
+					vb2_buffer_done(&b->vb.vb2_buf,
+							VB2_BUF_STATE_QUEUED);
+				}
+				if (scratch_acquired)
+					hws_release_channel_scratch(hws,
+								    v->channel_index);
+				return ret;
+			}
 			dev_dbg(&hws->pdev->dev,
-				"start_streaming: ch=%u programmed buffer %p dma=0x%08x\n",
-				v->channel_index, to_program,
-				lower_32_bits(dma_addr));
+				"start_streaming: ch=%u programmed buffer %p slot=%d\n",
+				v->channel_index, to_program, to_program->slot);
+			hws_ack_video_pending(hws, v->channel_index);
 			(void)readl(hws->bar0_base + HWS_REG_INT_STATUS);
 		}
 
@@ -1295,6 +1531,8 @@ static void hws_stop_streaming(struct vb2_queue *q)
 		"video:streamoff:done ch=%u completed=%u (%lluus)\n",
 		v->channel_index, done_cnt, hws_elapsed_us(start_ns));
 	hws_log_video_state(v, "streamoff", "end");
+	if (hws_video_uses_audio_window(v))
+		hws_release_channel_scratch(hws, v->channel_index);
 }
 
 static const struct vb2_ops hwspcie_video_qops = {
@@ -1363,7 +1601,7 @@ int hws_video_register(struct hws_pcie_dev *dev)
 		q = &ch->buffer_queue;
 		memset(q, 0, sizeof(*q));
 		q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-		q->io_modes = VB2_MMAP | VB2_DMABUF;
+		q->io_modes = VB2_MMAP;
 		q->drv_priv = ch;
 		q->buf_struct_size = sizeof(struct hwsvideo_buffer);
 		q->ops = &hwspcie_video_qops;
diff --git a/drivers/media/pci/hws/hws_video.h b/drivers/media/pci/hws/hws_video.h
index fcd3eca0b0c3..c5a4c9a545a7 100644
--- a/drivers/media/pci/hws/hws_video.h
+++ b/drivers/media/pci/hws/hws_video.h
@@ -9,7 +9,7 @@ void hws_video_unregister(struct hws_pcie_dev *dev);
 void hws_enable_video_capture(struct hws_pcie_dev *hws,
 			      unsigned int chan,
 			      bool on);
-void hws_prime_next_locked(struct hws_video *vid);
+int hws_prime_next_locked(struct hws_video *vid);
 
 int hws_video_init_channel(struct hws_pcie_dev *pdev, int ch);
 void hws_video_cleanup_channel(struct hws_pcie_dev *pdev, int ch);
@@ -17,9 +17,11 @@ void check_video_format(struct hws_pcie_dev *pdx);
 int hws_check_card_status(struct hws_pcie_dev *hws);
 void hws_init_video_sys(struct hws_pcie_dev *hws, bool enable);
 
-void hws_program_dma_for_addr(struct hws_pcie_dev *hws,
-			      unsigned int ch,
-			      dma_addr_t dma);
+int hws_program_dma_for_buffer(struct hws_pcie_dev *hws,
+			       unsigned int ch,
+			       struct hwsvideo_buffer *buf);
+int hws_video_prepare_done_buffer(struct hws_video *vid,
+				  struct hwsvideo_buffer *buf);
 
 int hws_video_quiesce(struct hws_pcie_dev *hws, const char *reason);
 void hws_video_pm_resume(struct hws_pcie_dev *hws);
-- 
2.54.0



