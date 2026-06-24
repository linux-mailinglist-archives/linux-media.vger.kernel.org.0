Return-Path: <linux-media+bounces-65500-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2y6HDzSAO2qLYwgAu9opvQ
	(envelope-from <linux-media+bounces-65500-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 08:59:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBEC6BBF57
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 08:58:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QGN7DOH5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65500-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65500-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09BC23039CB4
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 06:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9207438BF61;
	Wed, 24 Jun 2026 06:58:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1721038A714
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 06:58:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782284298; cv=none; b=s0UryLMvek1ZLrLhccgHMXllTMO+QakE4Hnkr3oEuMSPB6TEmDUq02LQU0fIsAKVp9z9jXZuuXUoNMI6984hSF4+ujUXaLx9ty6YFSqGZmAeg0kAC7A2Kd5NRnU0BWIR4bY9CsYjfyZYNOi9CiMmqnIINIv0ixaEuXw3wHCmhpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782284298; c=relaxed/simple;
	bh=uDO1v86RFnRqY9b7pEBAt1odbVMighkS8NBZ6lOz7RU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=UXZIjBqcqoBvxx/u/hPIruGcGWu/h3UBtCSP5b4HWOUp2TNFhBR16NNDVpAfTnOoNN1UpZVHf31fETVtoaC3jvr6XRJ/6O7A7QVcg1Oul9nr9o+1x1l2NT4m6FvTVm3h/Bq6LLA2jjlPDvg8yu1m9p8yR1M6hxxkOzr7ECogmsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGN7DOH5; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4922244f7c7so5979035e9.0
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 23:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782284294; x=1782889094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lHjTaNhWGw4oT+1H9Ma8AJEBTl6gVGKQowJPh+3SQpo=;
        b=QGN7DOH54PoRT5vxDs2cOewi73NPG6qxXwyM06TH5pPzf44R3aLJmfdigMzn1i9+G8
         AAp3fq3pSTu+7fdlexTlxKl4rp1uv8DTctLRs0BzHKW9EeU/tHXca47ut4zZC1Dg5AnR
         RRLTzz7IG57Du/Jc2IQjEBGAVx9TEmQPGkP/12Ke3NpGlzar/0ET01v6fYUcZZIU9Kkf
         H7+SHKAhHaZh9gnCzIcKc87cKE1xaCvMS6hbCO5QRCOUP0TocK/BA9cm/D8moc3c/N3H
         2fGlaBr3mtDPv7ux6eGR+MNVelZsJUDE3rIdxbD4gUnHTE2C7bNmjZxNBzMfMokJNCao
         TIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284294; x=1782889094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHjTaNhWGw4oT+1H9Ma8AJEBTl6gVGKQowJPh+3SQpo=;
        b=gmY7xFfhtju9PTeST5EfAF4ng14yZnHEew+YQmU/kuI/GoZlswx1ju5vvhqfgTOrOO
         sJvOjl3HHy6XHgh4sjTPkiWDccMhRsN+fClRM5DsVopdNRAcNBcOSYFat33B8BqtVOtg
         mSCoZ7gkBwEWUsOiUvrVGOl6xmXp1ssNm9ubKEfZcBTwzCf4pFeluh/aqSLA3adVjccr
         +QvfFaI84HEqQZpE58BDsUUFU4b9soMb8nx7w9owcpgD9QzTD8lCBbymy+heJLxYQ2Iz
         nuCpF7vpT2GDl8BAXf+Fv4DoGcWNkctMc0LFdqHNq+qn8inZfhNrhipx2VUuyz3QgblO
         qbtw==
X-Forwarded-Encrypted: i=1; AFNElJ8cQ06EfQEB6aUo6qvty8svkI3aHLVuIyzXYg6vJwfKeZRJjMLTBtp8hi1JRH4L0JAstKmENP9mIz39ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4feP3/MdA4TFRzQM6HuPbvZkOBDkABeG9tlRtzkWjseIGNhEP
	6qZrGZYaJSEHDz0xvp0ybXFIUECT4zVFrg4C3wlKc6KVDvnCMK8EJsyA
X-Gm-Gg: AfdE7cl3p3P59kXLC95FiaGU1v7kXtP9Cd3dQcmGQq7MF594PfRZVHvCk1ouj6G1aM1
	2KxkqYsDy1kcS95qS7RhOyAVSKM1z/++uGVYlyQxsbGjmtikaBfK3CJ841mSK6EvRGobUs3piTG
	dGgCvcdcDibyFeWKpfBpZeflN+G8uJ4KK6SHArd9Ha6R1Oy/6LBpcy7pEFTZpM0TDnoCXsq7cex
	HUeQ11sGCigz9e6uEzxhx60pb0IFAXri1eD2HlW/D8ePPEfjQTLpyBmq0s/1yMXdpo1Ypc86k1L
	rnUOC5bJpsw09MD+KHhCQQeMimIAGcv6JR7eJs38fDQGWqSowAvfYGLL6KlgKV2LpIsYI9W2pW2
	Oei5bYPPcIWLhItiRr29VySDUKYrEtvurlj0JVgWEDMbCNawtCfs8F9BasWZIi2t5k2eiFSz/he
	Ls1NWrFIuCjtAQ6sKg
X-Received: by 2002:a05:600c:a49:b0:492:4b68:c80b with SMTP id 5b1f17b1804b1-4926084aac6mr23722445e9.1.1782284293970;
        Tue, 23 Jun 2026 23:58:13 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49260d77e8asm20013925e9.1.2026.06.23.23.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 23:58:12 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: vdec: fix NULL pointer deref in vdec_try_fmt_common
Date: Wed, 24 Jun 2026 06:58:08 +0000
Message-ID: <20260624065809.2460720-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65500-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,linuxfoundation.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:gregkh@linuxfoundation.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-media@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-staging@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[christianshewitt@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christianshewitt@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DBEC6BBF57

When VIDIOC_TRY_FMT is called with an unsupported pixel format on the
OUTPUT queue, vdec_try_fmt_common() falls back to V4L2_PIX_FMT_MPEG2.
However, if a distro has locally patched MPEG2 support out (as it has
been broken for some time) the platform format table does not contain
MPEG2 so find_format() returns NULL and the subsequent dereference of
fmt_out->max_width triggers a NULL pointer dereference.

Fix this by falling back to the first format in the platform's format
array instead of hardcoding V4L2_PIX_FMT_MPEG2. This is always valid
since every platform defines at least one format.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

---
This fixes use of v4l2-ctl and v4l2-compliance tools when MPEG2 support
has been disabled via vdec_platform.c - NB: although this is a fix it's
also a rather niche scenario so there's no need to backport it to older
stable kernels.

 drivers/staging/media/meson/vdec/vdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..f3e7072f221a 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -504,8 +504,8 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt_out = find_format(fmts, size, pixmp->pixelformat);
 		if (!fmt_out) {
-			pixmp->pixelformat = V4L2_PIX_FMT_MPEG2;
-			fmt_out = find_format(fmts, size, pixmp->pixelformat);
+			pixmp->pixelformat = fmts[0].pixfmt;
+			fmt_out = &fmts[0];
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-- 
2.43.0


