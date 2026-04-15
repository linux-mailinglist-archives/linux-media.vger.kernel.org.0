Return-Path: <linux-media+bounces-58828-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DlIDMK232lVYQAAu9opvQ
	(envelope-from <linux-media+bounces-58828-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:03:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB216406305
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AE5B30B286A
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03233E3DB4;
	Wed, 15 Apr 2026 16:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oGuW7A14"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C643F3E317C
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 16:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776268805; cv=none; b=bzfabmVrAW6WvVzyzj0xuVi+68tAIxXrK5tUUhOms8jL4v3TSCUlfS1JRUTNx+3v0DB0xUFzJ3JmGw40XaUt71qeTKE3rfbFKfyA9iPOdvmLHgGdgoSA59jMLqFcjF3xW1G4pNJTMo4bap8n6eLy8l3Su/Rv7a/MFVujYAf8Dic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776268805; c=relaxed/simple;
	bh=bZDr22NN2iZqQw4Om81Z4JS6DXre6UyaxvybpH7wtYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r326Rz3kXNh5+1iWggCukmIE5Iz3NhpJbaPpa22Y9ztYkbPLdahABcacg0rFwbBIo+SrF9cI4G5BQcH2ZwVOccCtr3fijnIOkr0NjOMlkMLn2PIgDKnVf53BQi+hXUNVSoYRVo8zLgxZiUAJoNYPGcvENyNeVw2MITO+1wuPYkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oGuW7A14; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38ce8a5bc20so73359281fa.1
        for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 09:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776268802; x=1776873602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHZQFjksRdXwK8frm/erkjYO22S9wiIjEh2bp+EQ8v4=;
        b=oGuW7A145Uw1I45zhZzzo91mkAtHfSAJTFNxgkdwhPQP/iU1fQ7GC2IL55kLmnJW9S
         1Vi7ykd3H9Y3P2x+GhgcOrcHon3pkxTEHyRR2nm/e4H6o8B/ou1fqDDKvjJQJMgFmzlN
         Or788vXbw3lpN8cS2CXLcVZP4IDnZ8E2NaUn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776268802; x=1776873602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lHZQFjksRdXwK8frm/erkjYO22S9wiIjEh2bp+EQ8v4=;
        b=XXs3iGzwe11zoz7y8wp5/4DsNyHpS7vho9200sWOr2fq4x5+Kl6hMVn1C93QugzQNH
         UssTsdo+Kxvk1VwctH9DC9bIVOn8z4HvZVd456t+K5HrjVbzhg/BoCUEavjix9U9OeOv
         e0R6aIUQkWsb3ZJ8mDa4959rJy6RPeMPX7U7VUSch590RYkQVsQQb8IycWvFRjDcXmno
         j/Io5/rflQ+D3l6u3S5/b5TUE1V8dz6RfvfhCHGqBTvPdZGWwKpRh9MOq3BdhKGqI0jx
         oNkgGkEIsfFN9eUIxCFKMcUntuyZshtUsHafVbyK2yR29U0ROE1BgRYJN/TPxquOBQsH
         N7mA==
X-Gm-Message-State: AOJu0YydP5cjcUk7eMN91FnIy0I8bnqhJr+9p46C8u/JbPQgmbv70cmY
	RLPLR9ccP5Vj66582ZfsdzKiv7tnuhH/4J30mnQ9855xtDRhSZFOiGKGa9Luqen+F1mxDy6ztVQ
	Wja8=
X-Gm-Gg: AeBDiespK0C1AyNZJZG4za+JhWIi+cvdcEXMZLFEsSUuL4tebPyAEL7LW8eVd5uL80J
	JR2TX1sLTEo3ibX0dgNneh1RvEr4WOiOHtj/kCcztJGo5lGc1LFEjYJdYZERVFDR1Q6aTGbjQsk
	Pto8fAjuFWrUzsNSN1TWLlAEzO9IHY8AqimVjzjPnLf37OBeII9GCQiwjHDTsdtqOw27tT+O9f9
	CJGy7N2OQGGyWGs4NSz1coyrdjjXbiWo7j373JKUU0AhLaFN3ry9J5hZncEjQydHcjjI4nNM1Dw
	NzZ/OC1P/hBcKOq/kSwuSqpV3H4ozba5Cy7F+bri4Ce+j+eGnC4sEmJFZ5tN5lR1qQGJ+IRIFs3
	Qav8TMGQsA5TTQxkEgOJrLJPct73QigARO2J0AvQXy2fLmIB22SsbVr0lL0Mu9wEaXRu9RScnF2
	SO+wOPNyb5w6UPxOYXvYsoxPykyI5o8FgG9YzsAdhx03jBy351PRDS3LBMGNyA3R4tXuTZOQTRh
	QfC2rI=
X-Received: by 2002:a2e:bc26:0:b0:38e:8216:13f9 with SMTP id 38308e7fff4ca-38e8225584amr43479661fa.26.1776268801702;
        Wed, 15 Apr 2026 09:00:01 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e9ea096desm4664531fa.18.2026.04.15.09.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 09:00:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 15 Apr 2026 15:59:57 +0000
Subject: [PATCH 1/2] media: uvcvideo: Do not open code
 uvc_queue_get_current_buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-uvc-meta-partial-v1-1-a0acc79a6300@chromium.org>
References: <20260415-uvc-meta-partial-v1-0-a0acc79a6300@chromium.org>
In-Reply-To: <20260415-uvc-meta-partial-v1-0-a0acc79a6300@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58828-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim,chromium.org:mid]
X-Rspamd-Queue-Id: DB216406305
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Do not re-implement uvc_queue_get_current_buffer() logic inside
uvc_video_complete(), just call the function.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_video.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 40c76c051da2..4feb3699f520 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1693,7 +1693,6 @@ static void uvc_video_complete(struct urb *urb)
 	struct vb2_queue *vb2_qmeta = stream->meta.queue.vdev.queue;
 	struct uvc_buffer *buf = NULL;
 	struct uvc_buffer *buf_meta = NULL;
-	unsigned long flags;
 	int ret;
 
 	switch (urb->status) {
@@ -1719,13 +1718,8 @@ static void uvc_video_complete(struct urb *urb)
 
 	buf = uvc_queue_get_current_buffer(queue);
 
-	if (vb2_qmeta) {
-		spin_lock_irqsave(&qmeta->irqlock, flags);
-		if (!list_empty(&qmeta->irqqueue))
-			buf_meta = list_first_entry(&qmeta->irqqueue,
-						    struct uvc_buffer, queue);
-		spin_unlock_irqrestore(&qmeta->irqlock, flags);
-	}
+	if (vb2_qmeta)
+		buf_meta = uvc_queue_get_current_buffer(qmeta);
 
 	/* Re-initialise the URB async work. */
 	uvc_urb->async_operations = 0;

-- 
2.54.0.rc1.513.gad8abe7a5a-goog


