Return-Path: <linux-media+bounces-58053-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBBIGJkc0WmIFQcAu9opvQ
	(envelope-from <linux-media+bounces-58053-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 16:13:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D84D39B54A
	for <lists+linux-media@lfdr.de>; Sat, 04 Apr 2026 16:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 313BC300EAA6
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2026 14:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69512350298;
	Sat,  4 Apr 2026 14:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcSElRud"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5972ED15D
	for <linux-media@vger.kernel.org>; Sat,  4 Apr 2026 14:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775312000; cv=none; b=fBy3dzJid8iHOEqXe0103fYRGwxkXr6bsCrj9zjp0O8LowSiHF1IhXD5xogTzWnO2g91IlsL+h1EHYD6RHriFPjxc2Jb1emuz3yFNomm0/Jsst02dXajxaYCbC0McikmxoFhjjB/bCp2BOVhaQxFXVW6G/VvCiBiZ1wTNFYIQrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775312000; c=relaxed/simple;
	bh=Jg+fsTOROnVvaQQAL6cybgivgl+SdIXbV247NOJdpxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ta2DvYnNWI5qUyS+WJn1cLA1BOVhCquEXt7lX1VJhWKcJU0AO/ta5Hsp10bSFh+WI3SYN2cY5rjPJ9Pb8gyUwaHWf8PjEGtJl8eEZ/2Su2nQWuMQUTH1tX9Xa62HU1JCHNPyv93ZXKIrViJihP2DUuCHVW+A+0kTTJpcLE8FSJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcSElRud; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35d971fb6f1so2346711a91.0
        for <linux-media@vger.kernel.org>; Sat, 04 Apr 2026 07:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775311999; x=1775916799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rM5lqMnANidrsdiMfZkTev2S1xmCByaOcAvF7f91gpU=;
        b=PcSElRudadyn6yC36tiaSARgtiBc6O1eFUSzDGfCUXjW92neZFO7GVuDFAWWgnM1LX
         iP3/I1fUomy9MhFJJAoDU8L3TkLcV0XjBprVzHGm537rs9GLoHnvEIU1Wf8J+1b52BJ2
         DHVThi0q2c9/p+zPsSA4GUwbM3mPttTm4lPEwWIjR6KfYNR8TrrKikpiTMLDsBl9ur82
         r81bqVi6HrpDyfg53/LONJiidrwI0ygKUtbmLtry1INztR6/5RtTIx7HvaQrs3ugnrkS
         X4ZL6QI367YDAZ7D5HxSP+wrUoXuK++o7Sv47eVVPixbVDG6TjKlGM6SICwBEvFwOjmO
         5YQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775311999; x=1775916799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rM5lqMnANidrsdiMfZkTev2S1xmCByaOcAvF7f91gpU=;
        b=SWOly1mLaRB7jJJ1BVksaEZ7LIigS+vjl94Az+k+Io8MiiTywuj5DMRc8MCV4RyGad
         4+DV8mzErp1hajiwuoAStxTyBWOLAzCAkLPlAtV6CJijBit9vHoPSqFGTO3xYh3Q8ORE
         fGV73Xgszhr8ONNKjlAb4KhpcryMGmGUYBY5ht70sV/+VeyAKNOpGjkUBNw3az3sdITY
         UfR5fpVp7lZVJphmCzMuLnNQAM4qOvCi+Q4cX/S/gAwWarn5vRjQA/rAQy0O+G8EM24g
         b55Mvbnqbi0ejIqQNoNsyA9aLnHCZPdFWinrHYn20Pt/h9MOVNC5cPjSLJ80Pw7cWRcy
         L01A==
X-Forwarded-Encrypted: i=1; AJvYcCUIEZl64Itv/iJ+vD/feS7qalXjSwYcnAPVWI4BQo0OmrZ0qK2d1WGVWhXCpquPPI7LGceDyirqdmUMCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhHPz2FMMqf01HzS3fbvnvnxFQtCURSmiKt3L5B5htiY3Tg0g5
	SXdMX9lfjxFFmvHd6bMZuidgnRs6OH0hhNYDNnX96+fnvae7QPefsRFm
X-Gm-Gg: AeBDiesjKXldfhhYRDpcAW1tK3VY5XLvYSemqtuPZItZn0lW1U5pGFpX9cNJKPJqdoj
	kL46f0XMJNd73AcOUJbE5ZgLG6FQY7qS6X2qWC2gDAYwqUou2PajRf9A3rwaTBaw5K59jXis544
	K4Gw3B/yCAPty+wsaZYAOD1oD/IzBEYiTYR8eJZ5ZJJGw7sbswPGa7dpTSvw1oogER504npAQyi
	GMsRFJmEqkFTRZhYijCQY8ZyKY+nQtoXUtIxBrze+GimLWEv/q7x8HpI72J/yCvVNaGA+zvtQwE
	xg/Iz941/mvhMVp1iEl1O5IqukTJTCy892/o63hpOGSQB63kaTwAiz+IslisB+erBNJeGP+9GIm
	NfxzkJhGWAQ84S9H8TaRVgbaeOvvWyRnV4B1bqukL4WJE8TnH+pYXebB5U+bSlIoPvQn/qAs+7E
	M5ym0f4fEzNt8ILRSGfxOnY/UdJwB9eiZqFPYPGmlBvDbGdiF4WKAGUBeJ
X-Received: by 2002:a17:90b:1348:b0:35d:a542:2dc4 with SMTP id 98e67ed59e1d1-35de6957354mr5908061a91.21.1775311999183;
        Sat, 04 Apr 2026 07:13:19 -0700 (PDT)
Received: from tech-Alienware-m15-R6.. ([122.171.19.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe937925sm18477140a91.12.2026.04.04.07.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 07:13:18 -0700 (PDT)
From: Sunny Patel <nueralspacetech@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sunny Patel <nueralspacetech@gmail.com>
Subject: [PATCH] media: v4l2-core: v4l2-subdev: Removed duplicate lockdep  assertion
Date: Sat,  4 Apr 2026 19:42:26 +0530
Message-ID: <20260404141226.77477-1-nueralspacetech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-58053-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nueralspacetech@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0D84D39B54A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---
 drivers/media/v4l2-core/v4l2-subdev.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 32e6f60e26c7..4616e9280a28 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1843,8 +1843,6 @@ __v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
 	if (WARN_ON(!state))
 		return NULL;
 
-	lockdep_assert_held(state->lock);
-
 	if (state->pads) {
 		if (stream)
 			return NULL;
-- 
2.43.0


