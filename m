Return-Path: <linux-media+bounces-62713-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKa2LjQdFGoGJwcAu9opvQ
	(envelope-from <linux-media+bounces-62713-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:58:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9EF5C8DBF
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 11:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E553305451F
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 09:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB5F3E8334;
	Mon, 25 May 2026 09:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aq7KE4OA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5EB3E5EE3
	for <linux-media@vger.kernel.org>; Mon, 25 May 2026 09:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779702803; cv=none; b=WO14UaUUu3QpP8a69Edo8PUxuZl/Sr7ih1aGFlwQwT/KQyGmkarz6DT2S5cLqqDBDmJ//HTqt7aDaha9RQZVVHi4xahDhHu7t1Zihirt1Qm4xdf9Hrbzqr5wqRth37b3pCp9hmg9xCZLUH7BUQiYZpS++yET7cQzLuB5SzSTxmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779702803; c=relaxed/simple;
	bh=E43zb/0exWQdHZ2/viBusfLWpvPfMhAC55xSTIPBc2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QKPxqoHdPG7Qt3oJvQbNk6Tow5Ass228CZJvT+1aPORvJKhyv6wl53ioo3A1RHatTyGC238f7E3hwnxPdMVI1a000GftRCX0ha+NxUcVXIqaBlWQc7ua5yd0FJvc2QvevnlwzXOAV0wW1eepkexaSzQvu7Fjq0/sr5bJjuqnZkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aq7KE4OA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b45cb89f7eso63454335ad.0
        for <linux-media@vger.kernel.org>; Mon, 25 May 2026 02:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702802; x=1780307602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKwrXEXaLENw99YJowK3xb8rjn7NyiynQVbSpLY2vlI=;
        b=Aq7KE4OAPg8ajzf+yYY4MhHT+Swy8gwyGx/gV2LJZo5ACSLHCagj684d3oq+KOVfQ+
         OZmdWaWtCfWMQSCQwbjifruDHZSOWIF2kaomyFdphxIZrRSlLCPjgyW+AST1tlL6EQ6j
         mrfZ70HPKxkaBFUnMRV+Ac99poa9BhTiTrfSAS+wjh6+WVwHEJJcOmMPXhZDaLWyXQsB
         QktFpjBhRwWqLj3vIjB8Hv4zbtuSnwN87hHk0yfza0xLeqe22ca/8ENFEnfvkkW0bROR
         tgSYPc4EU6g8fzBXY8p+7kO9zRKqtInwIcd0wNwIqLFbnDOpQLnCK/BqzzZ072RnKuAm
         /jTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702802; x=1780307602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AKwrXEXaLENw99YJowK3xb8rjn7NyiynQVbSpLY2vlI=;
        b=r7RQFJC9/tfCJyE8XM+d+9+KP+NOc9ICP5jyZp3BNw/Q4l1kHUwkF1rEP8NhUJsPDl
         YCt21Wgj783NmWTTmwpIa0g3SAyR+ZEwAjsbAHfAmlQg52/GRKypKYoSpH4sqngQJ2yv
         /UYxSd5P+KElc/WK1y4bYETylss0Gei8RS8dtNJpMM83oSrV8f+7r/H39ewS0KREaZWO
         rpKfqEk0d/YdCqmznEeQGwSU37tqJ3VBO7c569w9xNaSobyWZ3UGCHkFOpdsNvFNPgRu
         T5ntZSBuTaYrRU9uSa8raP8Hvpk2DXDiTg+iohr0GKdlN4CYwgBqatw/V7YRta62Neot
         IEyg==
X-Forwarded-Encrypted: i=1; AFNElJ/8bU+6+uddILtBjCewRXhpUqFWCS60xr+9tbTg77pDDDynQOsds0Ws+3cBFUO5pQOtBEYlQavZpZ/8ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBFwiLMNgOmCGlofspmVFZLfMvWDXQfuShaxKLowjNHXhlYZ0Q
	J9lWCPsGe36VNppMn13aordmuW2LjT8VfRM2W7VLzOKhuuMPuZDWazIq
X-Gm-Gg: Acq92OHwABxzcW4WyJEkFi6c987FFXF9ODRsKiuM9SZBJURB9YDKfO97F06ay69HbP7
	rwD7g1dJCvFT50XwRKFCuFrEsGiW87TfebBX9r4a6Y8/woRhQnLxQZg9hhC1beCqI0B+z0sR4MY
	BrCEWQwFNDYpDyQxgjowHdOPDpdozRtmJf5L7+pM+DW8c53ZJJErUzI6bcfPan29q7zVN0aM4DO
	cWqTrsH2h5vufuQuiYxDesJzEdXawR60i0f/IXYgY+ptAUUjC+XXvRSnupN6dOHcOpCHeWYcM/P
	VkuQ4zxveI6e2LTeG4NS7C1Uk3Ijy+3W5A7ZZdSOewLnhV5mjSNVpM6+zLCCKTqbMGG3QiFO6FL
	XnmSPDbrRISOdas3AHvjtDtWiRIE72QS0sX6UPHkSufuD/eu8ZDuQ4Lg8spsCIRX8+29n6CwwdY
	XHseMNyqYbDvc5wRYdcbzy
X-Received: by 2002:a17:902:ebc2:b0:2ae:6259:5aff with SMTP id d9443c01a7336-2beb031adfdmr138558515ad.6.1779702802100;
        Mon, 25 May 2026 02:53:22 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:53:21 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v5 6/6] media: meson: vdec: Cancel esparser work in error and stop paths
Date: Mon, 25 May 2026 15:21:54 +0530
Message-ID: <20260525095216.12078-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260525095216.12078-1-linux.amoon@gmail.com>
References: <20260525095216.12078-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62713-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,ndufresne.ca,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1B9EF5C8DBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The esparser workqueue may remain pending when streaming is stopped or
the device is closed, leading to use-after-free if it runs after session
teardown. vdec_start_streaming(), vdec_stop_streaming(), and vdec_close()
did not cancel this work, leaving a race between session cleanup and
work execution.

Fix this by calling cancel_work_sync(&sess->esparser_queue_work) in all
cleanup paths. Unlocking and relocking sess->lock around the cancel
ensures the work handler cannot run concurrently with teardown. This
prevents dangling work items from accessing freed session memory and
eliminates a potential kernel crash.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: Tried to fix the order of cancel_work_sync() which could lead to
   a use-after-free. update the commit message.
---
 drivers/staging/media/meson/vdec/vdec.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 925537bd4d0b..296b387f3667 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -372,6 +372,10 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
+	mutex_unlock(&sess->lock);
+	cancel_work_sync(&sess->esparser_queue_work);
+	mutex_lock(&sess->lock);
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		sess->streamon_out = 0;
 		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
@@ -430,6 +434,9 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 			kthread_stop(sess->recycle_thread);
 
 		vdec_poweroff(sess);
+		mutex_unlock(&sess->lock);
+		cancel_work_sync(&sess->esparser_queue_work);
+		mutex_lock(&sess->lock);
 		vdec_free_canvas(sess);
 		dma_free_coherent(sess->core->dev, sess->vififo_size,
 				  sess->vififo_vaddr, sess->vififo_paddr);
@@ -948,6 +955,8 @@ static int vdec_close(struct file *file)
 {
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_fh_del(&sess->fh, file);
-- 
2.50.1


