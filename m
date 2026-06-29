Return-Path: <linux-media+bounces-65994-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sycfBEuaQmr9+QkAu9opvQ
	(envelope-from <linux-media+bounces-65994-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:16:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5764F6DD377
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:16:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DetOiwBQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65994-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65994-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63F253074699
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7324418FF;
	Mon, 29 Jun 2026 16:03:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D714418CB
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 16:03:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748994; cv=none; b=ueo2ps4Z7a0b3bFGXg6VjoEvhDbmBi35jVYn96mb79v2mlCMV27jkJ8lXgIw7TDMdoL/whGPYmySWR/+/ifCMyzu/76HPQ75CjUOhDAcsLmroEnKTJ9gTIb7RWpHs/0qXol+xi61EOyDNsRlx1jmd5/61DBzVAJpPoRn0ZRuXcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748994; c=relaxed/simple;
	bh=TChvif//UlGX4BiPL0HFon0QXD/z6TGdXUMmTLSiyFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VnT3Lfxj3YKUGInyeWKe/GrU0xuyyOl/WK2rcFSAblzL7bsYP+FnMKhBHRpbwNi+DouConhEc6NKWAOtu1UD9bVIVOxYygULxhVleUDAH2h/ekv7EyToP0Cp1UUSscadiZKNdMJcQozNAcZbROEDsCL4Xt54eEJhr82xQdDkzA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DetOiwBQ; arc=none smtp.client-ip=209.85.160.41
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4472500e25fso1184674fac.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 09:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782748991; x=1783353791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G47o06VjlX8VcRcaeK5b+BgTp2kgv5PYRRvWYpQg9dQ=;
        b=DetOiwBQkFI9LrXAoQNixhPeLsoZRe1cXWZC2jtNrTX/rDYM4CbWF6WkmQ4A8zF3Bc
         mos13SxHo9xVlkhgfJvKAjAKtgBz90rk/N18iW9WAXb11pGiKMFVHwT8onx33xfNbXS6
         dhoOnIqwBl6U7qIhodNzcj3gbJXqP4qb+bCoBRPFroXNuBMoR/jfTqVxZPpU5qJEVlJz
         yv5ULmHky03iR7eaYG3Q+cQUydX2/GPvNlfGMTuAKRKD6IOvU8aVOxLfms8RRk+OIbtH
         A+6aKwV0XoMgEHgTJjd7KKGDNXsqPR8VL1JmJzJ6WE1r0mTIMwO6KSph8gNg2EEa0dU1
         BIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782748991; x=1783353791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G47o06VjlX8VcRcaeK5b+BgTp2kgv5PYRRvWYpQg9dQ=;
        b=QXzSVztN72Tzxcl2tmmjOze+b+hRrxAkmC3SwCctV9Ad4gBiGkXAQOGMxkYXXu0K0H
         mm00fRV65eU0mAeajZ3M41N/hYSE2HSmF8a8YKIgZWS5Hb8ZiS3tDg8G9nABWBUIMTHy
         oQEcD2aEzNPlDFSb4OSTYRn9M6UlLH4zCed4UTBgttpujCVfNOqixuoO/ggGOcMJ5DHt
         nYXdaGBIaEOflwCuXU+dvIYiQpIqsnsJBGl2U/o6+6ijYyc/CsoK3Geh27OykpcYXWU5
         kTL6yBUKITUTre92ExJir3s8Ckl29t9mVt5ynw04mOAFhgEd5SM1izGGG7kxlySvw5E1
         HzAg==
X-Forwarded-Encrypted: i=1; AHgh+RrloxM8j7SUgjpP+oUmpxISt0k2wbgmE2QubpFuPDmv5r4/oSnkwqJlU+qUSOe8TMRnCD/hw33bC7qOMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJZfFl1RqQ+42HCtnMOkY/pBorp/HDM9ikHxW0Oy0cl+zlWFus
	70G3lcusJ3IzVfbREgaegvGqDi9dD8KTiTAciqAkZ/X9EhkkGfL9nl1B
X-Gm-Gg: AfdE7cmwW7OEfHhS3K9HmkHV+iNyQEQu1x2Peanq3TutmIaJNQ66z3XivxGY6H2lyAU
	rdzdMX5f02dUW1wbdNJJgmLIlBV59GPiWV3dmNL40qu63PIQ8SfmYrqtG4OHyP7YHqmHsCoGwSe
	Pi8C8NC5hJvJqmH2OFEg3VKpjE7SESDDJ2uiP5I/BRtLjtUH756BeBQzShqVxphHRZ2v/2DfJI9
	KOe9D8DW0VoKmw34F4hRfGtZV2umvmmszak/9zXovez2uOCcCtE8N+kWuKHxJIEG4gnARbSeg7z
	4nr7Csw16L1VuTKKx6g8Rricp2wX36/v1Rn60JyaeLJoVG1TqXVhyrsQykdCBCT261yscPs6XgN
	MhUC5dihmT9JwMf7J7CYvt4vEFkQyoNG4Z8dOFV5O/J8RWLZnb2TI6+Vg1qvvBh0YIGMw+AVMEH
	tOH8WLCha7VwS/jbQXLgTI60prYb7MmzNQpmwJ6q7rFhl+1vR+0mN3bvuV5oM5Qw==
X-Received: by 2002:a05:6870:21e4:b0:43a:677d:241d with SMTP id 586e51a60fabf-448dc9be034mr97127fac.31.1782748991161;
        Mon, 29 Jun 2026 09:03:11 -0700 (PDT)
Received: from father (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-448db9370c9sm145868fac.1.2026.06.29.09.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:03:10 -0700 (PDT)
From: hoff.benjamin.k@gmail.com
To: mchehab@kernel.org,
	hverkuil+cisco@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 4/5] media: hws: harden video DMA queue ownership
Date: Mon, 29 Jun 2026 12:03:03 -0400
Message-ID: <20260629160304.154046-5-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629160304.154046-1-hoff.benjamin.k@gmail.com>
References: <20260629160304.154046-1-hoff.benjamin.k@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65994-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5764F6DD377

From: Ben Hoff <hoff.benjamin.k@gmail.com>

---
 drivers/media/pci/hws/hws_video.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hws_video.c
index 3a7b2abda502..58bcc2e7030d 100644
--- a/drivers/media/pci/hws/hws_video.c
+++ b/drivers/media/pci/hws/hws_video.c
@@ -330,8 +330,8 @@ static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
 	struct hws_pcie_dev *hws;
 	unsigned long flags;
 	struct hwsvideo_buffer *buf = NULL, *next = NULL;
-	bool have_next = false;
 	bool programmed = false;
+	int ret = 0;
 
 	if (!v)
 		return false;
@@ -354,22 +354,31 @@ static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
 	if (v->next_prepared) {
 		next = v->next_prepared;
 		v->next_prepared = NULL;
-		next->slot = HWS_VIDEO_DIRECT_SLOT;
 		v->active = next;
-		have_next = true;
+		programmed = true;
 	} else if (!list_empty(&v->capture_queue)) {
 		next = list_first_entry(&v->capture_queue,
 					struct hwsvideo_buffer, list);
 		list_del_init(&next->list);
 		if (v->queued_count)
 			v->queued_count--;
-		next->slot = HWS_VIDEO_DIRECT_SLOT;
-		v->active = next;
-		have_next = true;
+		ret = hws_program_dma_for_buffer(hws, v->channel_index, next);
+		if (ret) {
+			list_add(&next->list, &v->capture_queue);
+			v->queued_count++;
+			next = NULL;
+		} else {
+			v->active = next;
+			programmed = true;
+		}
 	} else {
 		v->active = NULL;
 	}
 	spin_unlock_irqrestore(&v->irq_lock, flags);
+	if (ret)
+		dev_warn_ratelimited(&hws->pdev->dev,
+				     "%s: failed to arm no-signal buffer ch=%u ret=%d\n",
+				     tag, v->channel_index, ret);
 	if (!buf)
 		return false;
 	/* Complete buffer with a neutral frame so dequeuers keep running. */
@@ -385,10 +394,6 @@ static bool hws_force_no_signal_frame(struct hws_video *v, const char *tag)
 		vb2v->vb2_buf.timestamp = ktime_get_ns();
 		vb2_buffer_done(&vb2v->vb2_buf, VB2_BUF_STATE_DONE);
 	}
-	if (have_next && next) {
-		if (!hws_program_dma_for_buffer(hws, v->channel_index, next))
-			programmed = true;
-	}
 	if (programmed) {
 		wmb(); /* ensure descriptors visible before enabling capture */
 		hws_enable_video_capture(hws, v->channel_index, true);
-- 
2.54.0



