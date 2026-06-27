Return-Path: <linux-media+bounces-65786-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FqsMAA90P2pUTgkAu9opvQ
	(envelope-from <linux-media+bounces-65786-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:56:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8E06D15C5
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 08:56:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=0sec.ai header.s=google header.b="xIj/0eGN";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65786-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65786-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBF73303CA78
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 06:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB49390217;
	Sat, 27 Jun 2026 06:55:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FF5390C8A
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 06:55:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782543341; cv=none; b=S9PQSZtCyu+y00gzi2Ex2zm4j1PFK7DiK6S0iKgxILj12Z8huZFIJEhXvRq8e4UBJcebz1BDaYKfzkkaQYuXKeKL2JMDwe3KAvFL4w404xgMpnSu4MSZLcRHm7RiQbzUbHBOUjP70AJ9o3wnkXORh08zoYZghX3N0+qzSLHjeVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782543341; c=relaxed/simple;
	bh=/9Jmmg7n/1wL8dwr1mXSnzfdn3ik6xwgtLV28dDJ2H0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0Bbu1qYrVn1t+ePGMJcJh0nyAiZIDZGqYhogZwdPWWOw74aFNfO8PiFHVJLT2R5glqlYfk5NZKrp2d1sSDEs3FqhAo6ho6yc+sO/Wi5S7DKnyVT4hon7YV01xvIA3qSNQt62lc9l5Wqh/ofYoKxQEVzgUazEIe6BxDTscG4H/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=xIj/0eGN; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-46f27bd4c45so1199011f8f.2
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 23:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782543339; x=1783148139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SY5IObv1DsntvWInFkK4gkjbbOppwkuoQ6M12vyKR9M=;
        b=xIj/0eGNtchMBvki1kdATb4IZlw0KXbasduN37KmfLWWPYE+rYzWu0SyVN2bZNsg8o
         K1NgvQau9OImGo8s9bzZOP0Sr7+itv/9no2SVUDIf+Vg3MJ01OQb5WY5B6143dvO45ps
         5viXeb2tYkA4nUqQQkFMhdOj5fgnK3LLHBfUG1t/hIsgWf7oqgSIMFyBfAVXumIK13hU
         MPFYOpCTdUs32iod0+ZNu/h28DC57qmy2JqmPyMbT493W9oo8uISJflqvKGTXqXBIFaE
         k1+YSJy+aUQevGaOzTTqmTg8IRl1jYeKbmRISVnKcMZkmxRh+tYYP/5XiUoTaxz0ezkf
         pCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782543339; x=1783148139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SY5IObv1DsntvWInFkK4gkjbbOppwkuoQ6M12vyKR9M=;
        b=Lv24K2yOmBOsnmwJtiWuWtGNEcW+C94fHoqQvJaIfpRrVlm6NMmj8IXTnXjPph7IZs
         B2vzw9W5CdwqTijizbwDkwRiumpHvNrSr3dVgWoxIcdlT4klofEAXqR/R75nnLjY+6CA
         /gvOhdoAtzTp8tIceox9q+dwIeERYCRZR6T/RhUGLavLddBs8pKblXIyNFqjxMfrehgd
         goEazyT6sjaJghUhSCOTuGpGnmfVofvUR56T9trgTz+WG3VTBmdo253SnYMsXXVVro72
         M11ksLkSOYyRHKwUtMxlu8kQlNDSh6EvraEIh7XQxyS+3GoUwtdvnXRBenZgCP3t0X40
         w4kg==
X-Forwarded-Encrypted: i=1; AHgh+RqHMtP3YUXiR41RCFGPIWeDofADOjBmh2wQKMJvnJYDRV87OUcaX8ee3HOtjfTt2hH0sGPrH7jDsYKDyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXoROlvwUhLJqUGyyVk1/OMfp92sR09NhntNJiv1hShi5GCUrd
	6PcTKb42TnqX1IwHroOtLoSwkhJzLMdB2z3gtJ/T+aFrHY8AY5+SrzGJ/NZCOmQKWv0/
X-Gm-Gg: AfdE7ck2sd2uF7jdbXgSa6RkBMjlFAPY/ZO4cdz6CPgt+FeUC2CWXksqBvpeJCT2zza
	5OntFy0iiDPl6pjII+s4W2xr/gg0xrvOQKIzTG5oupdLqlQdke6KhdVUOjIjbFnKFrOqe0iqTwP
	BZHDEjkF1Yzmk377CaWCvuM78X7jatkWtum32OvH1Un2GypXI03TayHfb7KTIG/KYXrMLHojRdB
	6xQ7uny8aJlGQ5fpNKAK9sErSIB3ujdWCPtGvCZ5zUi155wAwO1WhcU5Jv4VoZ8+f5ipjSzp6a2
	oxnrAwQHFs700F8R+NvBzhZF4ocve1c3AYQ0qsg20cMi4VtTZikpP+o48h6R14Ixd4xgOgNIung
	Hn4s+tC9MxOtVqmsWp/dioUeLMi08jXvljfQPNhyXsZm2+mw9kzeCHcS8PoNJyID/Nmr2s6RfHA
	pbe7oBPswfCRhSKKsSCGZ6eIIfgpi2jV2B1p42pAolnuWW3jeTeEMyFQSewnYDD4mANIw/eZgUb
	TiFl7dnuVOfORlmRGgkLWDt/Nmhvb7LV68=
X-Received: by 2002:a05:6000:4204:b0:460:30bd:4dca with SMTP id ffacd0b85a97d-46dc12e056fmr15051536f8f.30.1782543338095;
        Fri, 26 Jun 2026 23:55:38 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee0189esm32691380f8f.9.2026.06.26.23.55.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:55:37 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH 1/2] media: meson: vdec: clear stale prev_frame/cur_frame on flush
Date: Sat, 27 Jun 2026 08:55:33 +0200
Message-ID: <20260627065534.88527-2-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627065534.88527-1-doruk@0sec.ai>
References: <20260627065534.88527-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[0sec.ai:s=google];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65786-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_NA(0.00)[0sec.ai];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-media@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-staging@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,0sec.ai];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[0sec.ai:-];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0sec.ai:mid,0sec.ai:email,0sec.ai:url,0sec.ai:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C8E06D15C5

codec_vp9_flush_output() (the .drain callback) walks ref_frames_list
and kfree()s every vp9_frame node, but never clears vp9->prev_frame
or vp9->cur_frame, which alias nodes that were just freed.

If decoding resumes after a flush with an inter (non-key) frame,
codec_vp9_process_frame() calls codec_vp9_set_mpred_mv(), which
dereferences vp9->prev_frame->{width,height,intra_only,show,type}
and feeds vp9->prev_frame to codec_vp9_get_frame_mv_paddr(). With
prev_frame still pointing at freed memory this is a use-after-free.

Clear both cached pointers once the list has been freed so a resumed
decode starts from a clean state.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Amlogic Meson
hardware required).

Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/meson/vdec/codec_vp9.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 8e80ecf84193..5ca27930239f 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -681,6 +681,16 @@ static void codec_vp9_flush_output(struct amvdec_session *sess)
 		list_del(&tmp->list);
 		kfree(tmp);
 	}
+
+	/*
+	 * All ref_frames_list nodes have been freed above. Drop the cached
+	 * pointers so a decode resuming after the flush (e.g. an inter frame
+	 * following a drain) cannot dereference freed vp9_frame memory in
+	 * codec_vp9_set_mpred_mv().
+	 */
+	vp9->prev_frame = NULL;
+	vp9->cur_frame = NULL;
+
 	mutex_unlock(&vp9->lock);
 }
 
-- 
2.53.0


