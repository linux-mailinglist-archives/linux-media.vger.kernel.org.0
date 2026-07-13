Return-Path: <linux-media+bounces-67483-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kvBnAtXXVGrafgAAu9opvQ
	(envelope-from <linux-media+bounces-67483-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:19:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EC474ADC2
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:19:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fcozDjaz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67483-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67483-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 883A1303C679
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 12:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B098406805;
	Mon, 13 Jul 2026 12:11:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900F63F6C55
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:11:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944683; cv=none; b=Ka1poK/tuFInB9Kh2aG7D0S7Uqwp4IvtWq2iO6XuYsayiQ33J0vtQUGlilF2ebs5KIFu+WCIQERSm0zSAdprO0VAw40mytyNYlQcKm977w/CDvzE31PGtEBjy0eajQxTb4daIqftWuhhUIoOxHnC+Bg/AXL/QrGM5r4eTgFghdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944683; c=relaxed/simple;
	bh=G2NQafJclYTeJRa5vR4Nkq85FyLNUI0JvtBWv+71DF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6FnhVSNMPBx+BPdVpMRRl3/g9qCv+HCSuuyjrILKaE8mTTzQXAUxMqBl+H3sILBe09hNZNFiBWJyiz8IlziY/izl9R2kJhh3OY5N/7DIotwnuCFlL3OTRSMcv41/VCCaR4gJeFVadMOYazRgtTIKX2zJiJVYyd9Uz59MD49SbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcozDjaz; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso34088085ad.3
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944682; x=1784549482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nfm5E5YVw8Xk7Gt9ejcJe2nuIHpfZQPsIGFP/AIC7g=;
        b=fcozDjazFI/WUVc0BmHdQAQvM4spN0oJ9XlZLfElRLv4JT3GeeD7D5LQi7FGRoWlh+
         Iqfl11+DFcJBk+LqcHVZGverbbXqiJJdjBdSSLD7pyULmurii+Do/R5CGKPCmXr70M+/
         U9tMzOl+XMBityX623Sky1ZJ0wg7ozcnUohKb9GeEzkoJDWlQ+swCpWV8TB9JMkfAhKg
         JWSsS+b8El410LL/rkZvJTLt+cHHsl9bxarsiBYlJ1I7gSU/heipccqYdYtQs5Rl/+ZW
         uF/55/3JSWbS4WdOxoFZnyQlDbRgp6VrCXPq5DiXPlJq9PzbIXIGBOGHbQhEZN9PN5bW
         IFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944682; x=1784549482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7nfm5E5YVw8Xk7Gt9ejcJe2nuIHpfZQPsIGFP/AIC7g=;
        b=sOfYTHFFiypoedjSVimJ/0SD/t5DINEUrs2sIO7wty0xStuE5iMIESkLIflRxzaweD
         A7rZitclttRWoqixUKAMAK+gbqLWXXe1qEZhWVwYhUPiVnH2NkmO7XaMBBEJk9wl2CEl
         7sCPjLvaJa9e7261LoKJaAw3ktRoJjBDL9ql07Dbej6JSIJOdlWiVO6WcO4DUmbYNxDI
         7+P5axzw+IYxxWMo+V5MxwqiGmrR21fdocwhvfZqMDXlrjOyw/Rlh21iP1HQLX6YqDMn
         Ybg8iwkpPgwK/8eEq02NwJbRRAypO5BeGIR40UDrsTWvSYH8+7EXNl1ZP+/f1aFUXHKW
         nCOw==
X-Forwarded-Encrypted: i=1; AHgh+RpnbgqATXb4SBA36xV7fJi7y8L7kyHrEujdYZ6b9SytsqfuTB7s0L+mSfwuDBFyHne0IYlSHS2g+gdpfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3lzQI1PRoYPBvPo1BZZj+4/LsE6/a/dIoSWYvbXRUHo+Dk1H3
	EPcdDeMR/ulQJG9GqNpeYczXfqxkrl0ii/tHD72knAyr9J+fpmMoJUFJ
X-Gm-Gg: AfdE7cneJF7hbE2BeSM/BRaLfxVdq5o6ELkQyOjqQbmqneifqMI3e8GbdxCWFWmVnKO
	rCv+7IPjPLWZ3i+IOvUK7iYEER3JLLiDKJyTSYewveSEUmTAeTZ4L+9nw5C9mk4X+C0Oohhrylr
	wOdfzxvlJYGul9YqWVwYnzkrigVn+q9lq3z+Xlx5VtKEsuMd10FiBsuCiYy8Abz7DPXeJanmRIv
	FXwDtjOgLvTtbWQIbQYEr+rH2A/qCyvFdRdXZ1fO2H6i9kP/POxPFQAIkWlCqs9pZgfrrEzQNDa
	UaunmG4wxMl1GEA86KCdRPszjMYbKIXQvF6hTer9t2bG11DcEyRdZGxCBsINEvurVOJgSg3VGzQ
	dXvgbL9Umrb2r0NNi3VUvhc3G3SDSu4D7Gp9kYmYQqPNPVziXccLj9dZ7vKd8dbAO18koMVGoPO
	7iCE3UUb9OnQ==
X-Received: by 2002:a05:6300:220a:b0:3bf:aab1:cc8b with SMTP id adf61e73a8af0-3c110b436f6mr8836067637.46.1783944681879;
        Mon, 13 Jul 2026 05:11:21 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:21 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v7 14/19] media: meson: vdec: Correct atomic counter placement in dst_buf_done
Date: Mon, 13 Jul 2026 17:37:09 +0530
Message-ID: <20260713120840.17427-15-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67483-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux.amoon@gmail.com,m:doruk@0sec.ai,m:nicolas@ndufresne.ca,m:martinblumenstingl@gmail.com,m:linuxamoon@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,baylibre.com,googlemail.com,linuxfoundation.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,0sec.ai,ndufresne.ca];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxamoon@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ndufresne.ca:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67EC474ADC2

Fix an end-of-stream (EOS) boundary condition logic flaw in
dst_buf_done() by relocating the atomic decrement helper to execute
after state evaluation.

Previously, decrementing sess->esparser_queued_bufs at the entry point
of the function corrupted the conditional checks for the final video
frame. This premature decrement tricked the driver into flagging the
second-to-last buffer as the final frame (V4L2_BUF_FLAG_LAST) during
teardown sequences, which cut off the true final frame and broke
compliance validation.

Resolve this by moving atomic_dec() to execute immediately after the EOS
conditional tracking block finishes evaluating, right before invoking
v4l2_m2m_buf_done(). This ensures accurate stream termination
signaling.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec_helpers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index f02c21d5a9c18..303236f0647c0 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -314,6 +314,9 @@ static void dst_buf_done(struct amvdec_session *sess,
 	dev_dbg(dev, "Buffer %u done, ts = %llu, flags = %08X\n",
 		vbuf->vb2_buf.index, timestamp, flags);
 	vbuf->field = field;
+
+	atomic_dec(&sess->esparser_queued_bufs);
+
 	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 
 	/* Buffer done probably means the vififo got freed */
-- 
2.50.1


