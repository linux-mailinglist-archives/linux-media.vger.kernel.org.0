Return-Path: <linux-media+bounces-65761-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gi9kEKOsPmpIKAkAu9opvQ
	(envelope-from <linux-media+bounces-65761-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 18:45:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 865E56CF36F
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 18:45:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=pcScHQdk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65761-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65761-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 177923054F60
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64203F7A8C;
	Fri, 26 Jun 2026 16:40:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D942296BC8
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 16:40:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782492033; cv=none; b=jHgFA90RIDxDMyQwEV+nRVbhqcK3VHE8RxC3iSvar/BK9WjEpCkQ9JbeZgOc20FTUU5+jdM4mgFJ/DoYKUTMcS+HCGUhdGExRQo1WnpoXZ908NtpELyLMwghCry5mP2S01J41O7Vq9da5eOpY+SO0ggGGjpXzXn8y+w9iaesOXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782492033; c=relaxed/simple;
	bh=TGDLvvCVGmvqtdxVLR+8MsqId329e6OscgKxGUUUdFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GmMXATpgSIsvM0YV0kVGk37EnBMAazVTMr7FoaCQW9idmekyzBv9ghGv999h1IhD/DYKEpl87II7Yt1C7qVJatgkVC4il9zZlwVKW+BfTw4tshPASMIwXo8bIJqaD24EljIK/1mDvj8yt9NC7lFsDBcILRYevl7qUFroQdTegVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=pcScHQdk; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso15358945e9.2
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 09:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782492029; x=1783096829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XFdrr1aj+JZ4LS4KDt4mRxZWjc/rOk51r42pgK7BZ1Y=;
        b=pcScHQdk6/Z6dB/qOlI0BlYFjK7SzdIOe8keBrqxU+NcyuO6YjkpqJbUw3iwpYgpoK
         qZ1qcSN3+vb8nokNcm5TFavCpSc0XDbjU29IkvYUeiey8JU+ccNCMbD/804MueGgp1OD
         QeSxCOXF25lukSvqf62k0B6vnlA8UV4rFs50cswb2sZeUYSsnYdBmHrrGJPvaMl/w5A6
         XNHEjgpIXuQuyV5o6AgcSIQsZt77LSVArqydhBQkWYXfny7tqfZYrfGBA1ffaAsEv9Ne
         ExEB9FESQVgp8RQ/YUiLsh44bumYmw8L/lRAGXpNwvVP+WSaCStjxvB9tbOFUhclurUz
         gF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782492029; x=1783096829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFdrr1aj+JZ4LS4KDt4mRxZWjc/rOk51r42pgK7BZ1Y=;
        b=lwzR0wgfR/Zs8lttklwVtnUGQB//QpkPuiD6nlVScL/3y8L4hvR73FAqynqjGQ9d4p
         Ry7mnoPy3zaHSbynlgA/4OgmAZ1pMj728taI2uDzKrjIKNKbtKd/ZXj8G+5WdeDS9EOi
         W0+CUlh0LRDopKZu/6jN+LOeEzBw1g1KNPpDF87ArH5DO+nxlm2Iur/wR2IUuxUsMgIW
         Mke1TyXKi43EIkJwF7qE7lpvmgOYUPFPpPH4Da9Yak9DALG3++Gw0qpmb8XgOeyWMLRE
         zOxcdDi5ftviPEWJe6lnrZKjFnN/zJ1qmvl/Qh4AYlBaRpmsFhbCfZOfItiuwACkQrWb
         rJTg==
X-Forwarded-Encrypted: i=1; AFNElJ9eap5Tclj3WzQv21jUuDiXtvBZhk2exUkk+9Yp+n3nUkHh2ladrVUd3P2ujXtyOEOwdqwf3iDEc2TKAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMsHVW6y+O9j3IWSsmv/jMg5fAxTZq23qvS6PPDuELf72z+tbX
	blasL7WUkmVydtgE2RR0hWNXKhOSddI722r5Vu2zZRk+vDDYvkwG7SLy4Z5/yQdQdtBO
X-Gm-Gg: AfdE7cnGYRdecjU1BpG4pghi2JYWouJCAJQHSPNhKmt3sAu+u9qg07PDpCleT/vDdOw
	NB52Hug+zisUEv2ab9Ocw3lOkkwAItrgbhLUdRznWhnLz9XC+i/f90XVmVxSgkz34imtzqXvPJl
	nDwJUMh7a5OkolgZhU8lfJAcSjtfDta822MHYhG8DWYAcw6+CzutxE2TUuufkVHI4Ur7/rSNm9N
	/vG/Uq7n9Ds5cax7AxkYiqtsGaOvjx5Fo8WIFWKrmt4G3DdL/D4zkbkWhaz3sWQGl4Vq/s4nYok
	b6gHhT6M8YliUVYux98xFwOsZioq6pF7st1EBy7EELSd+9BC8rJ2s2dVhDmvBjWx3w0ByIVjDZ3
	ceCirtm6cswRfKsh+MmRUA7JAHHfkFyEWrrLB+iMXdtJ1mjvJ9uBfOKmJ6qbhph5Nw+zB/kdRtR
	XPx/XOpOED0fkgcPxQGQuWbgtyKWcximw/A+t3/Ix2LTroIog1ySNRcq0qAFpuKhvcVvSL93QFX
	j9lnO9gVj4qfcx9oO5kVZUaZJIQd+jhxPw=
X-Received: by 2002:a05:600c:8109:b0:490:bad9:de43 with SMTP id 5b1f17b1804b1-492667ca5fbmr116117235e9.0.1782492028118;
        Fri, 26 Jun 2026 09:40:28 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926f94f213sm30866825e9.12.2026.06.26.09.40.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 09:40:27 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Subject: [PATCH] media: meson: vdec: fix use-after-free of prev_frame in codec_vp9_rm_noshow_frame()
Date: Fri, 26 Jun 2026 18:40:25 +0200
Message-ID: <20260626164025.52694-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65761-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-media@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-staging@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[0sec.ai];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,0sec.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[0sec.ai:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,0sec.ai:url,0sec.ai:from_mime,0sec.ai:dkim,0sec.ai:email,0sec.ai:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 865E56CF36F

codec_vp9_rm_noshow_frame() frees the first non-shown reference frame on
ref_frames_list without excluding vp9->prev_frame. When the previously
decoded frame was a non-show (alt-ref) frame and the current frame is a
non-show inter frame, the freed object is the one vp9->prev_frame still
points to; codec_vp9_set_mpred_mv() then dereferences the stale pointer
(use_prev_frame_mvs and codec_vp9_get_frame_mv_paddr()), a use-after-free.

The sibling cleanup codec_vp9_show_frame() already guards this pointer
(tmp == vp9->prev_frame); rm_noshow_frame() simply omits the same check.
Add it.

The fields that drive this path (show_frame, frame_type, intra_only) are
parsed from the VP9 bitstream, so a crafted stream fed to the stateless
decoder can trigger the free-then-use.

Found by static analysis; not yet runtime-reproduced (Amlogic Meson
hardware required).

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).

Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/meson/vdec/codec_vp9.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 8e80ecf84..572f418c9 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -1247,6 +1247,15 @@ static void codec_vp9_rm_noshow_frame(struct amvdec_session *sess)
 		if (tmp->show)
 			continue;
 
+		/*
+		 * prev_frame is still referenced by the MV predictor in
+		 * codec_vp9_set_mpred_mv(); the sibling codec_vp9_show_frame()
+		 * already excludes it before freeing. Do the same here to avoid
+		 * a use-after-free of vp9->prev_frame.
+		 */
+		if (tmp == vp9->prev_frame)
+			continue;
+
 		pr_debug("rm noshow: %u\n", tmp->index);
 		v4l2_m2m_buf_queue(sess->m2m_ctx, tmp->vbuf);
 		list_del(&tmp->list);
-- 
2.43.0


