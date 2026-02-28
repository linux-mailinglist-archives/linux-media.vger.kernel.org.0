Return-Path: <linux-media+bounces-53850-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB+xKiRHo2lM/AQAu9opvQ
	(envelope-from <linux-media+bounces-53850-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 20:51:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDB71C76B5
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 20:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DBBF32A69BE
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 19:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E834963B9;
	Sat, 28 Feb 2026 17:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlIjiGn8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C2641C0A0
	for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 17:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772300743; cv=none; b=R5sRqr8+1VEHcmVk4BFUDCMy4ngg0jj/iPnUSrz1VT5ZHiPGh4ucAJOCffJOPE5xtxgOP/xxneAjZAmXWmE/VCp4bsuzLKBr534vTCvw3EBohCubERQjRwET0WM3PIljjibOEFiFJTDc+9JUlGr0H2waGbKim9qj1JMH1Fhf6Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772300743; c=relaxed/simple;
	bh=hUOm4ysu6sscV+qXKGVby0sK7oX9mMORXDbvXLQ8GYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sx6rt6Lzk0EerrB67xIiXCRBmzHFh8NMVGeeiRjIA9gQ3W+bHHUQXUHYjQTWzrn+lLY+lKO/gn9uw6b6Pq5TJTY+kcT15LeSIGE3VHh1j0gusOMIYJQLrEJP/UDShRo5b+pm7VIfjHTFhLgWlTuEXoD1hUucu8ltSi4cOpKWxxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlIjiGn8; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4398c7083d7so2728750f8f.3
        for <linux-media@vger.kernel.org>; Sat, 28 Feb 2026 09:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772300740; x=1772905540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E6YYW3cSzdb2YBl2OC4QCr7tRqVIs/LAbAgpcEPINS4=;
        b=KlIjiGn8HKl7E4ZUc9wB/aCloBvzfF/IB4zDznqiBBOojPeQxS7bzIq74UqB40TMGd
         VPwoFqDi/2fyJHgnPl3NQmWel8JY8PLuTqtX05yoJ37MtN1KM9Mh+Tou+XphuHgtlLpI
         W7owGHKWbo5CDhjq0rEa3mFlwGPewUvZl3cmc02vqGB4BVj75UvtRcg6DTwmmeIQsXmu
         ARhkUKR5KKfG2CJIiyfm+y9rUs84UBH5GvOmPKeFS0/1x0Juqib/pG9CAdWyGZOJfCRT
         OlUrAHd0MPncUSL5BPTPni/f9c0/YWk9mqZ1aqPh3ENAZsAY6XPahXWPW0vuAeDPDRcL
         GawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772300740; x=1772905540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6YYW3cSzdb2YBl2OC4QCr7tRqVIs/LAbAgpcEPINS4=;
        b=oNMWNeV4/LpKbBA/18J09UsdxAgVd1dQtnOL1+i7IcJrpMlTYGog1vkNAQTzjy6GOF
         kki+FizHmpk2wvoXiUjpz1RduZp08d1gI++FCGrqd17mMg0Spo/5z3h4DEEHMUeBWWr2
         jevbt3lJCu9gnRS6GOyBCmUbFv+XoANKXNng2c9pCi7xSS7y8Gzb8HcE92LLETk/cAd8
         VYuivwTMPsncuRC3HX+Z2/YImhvQkxKv9F8nVr6be5dx9Zpw3ZQ6PdF4+6j1+lqev0zW
         wpxNrLk24DiXGP0CMVS5TTXugNSXElNOPoyik4b+ewPhSKVkNJGymxTCXmibyYh/S/tf
         9MgQ==
X-Gm-Message-State: AOJu0YwNwWUvEfiuEdRIDcsEBEqkIAYx/w6lquwzMPUGlxXAAwImbTG4
	yTE6RBqylqez+0rq8tr6vaYNOAufHyVzDsPhAAWd7bQrT+REhGpUFEx3WnRtKs5z
X-Gm-Gg: ATEYQzy25t/wmA9/4IWOes7CR1U+WGIgQOUcYyuKMI95yzOc8ZAyYCJ4jmk+4mCaEul
	gcpsJiq6VJPSw9E3bZRJX3pS7o1yV0I9Jg9eX+5ALYn1Zm3kswgRsfS23FmK6sbKBhOGxlLxJjI
	9hgTyANtfektBTCvsoF5yrbdCvhjUCnoEiJ8nvs4Ax26WrKH9rV4iRkD8PRvmYlZ2rK2rPyv736
	g93CWPiUezdc8Vm0Aj5DzIugX6D6LDTMaRZgrOwIrvGJEs9CLuC4URUCmSIFUxhJcLx3D2uGHII
	ISmotLAWaeM5TvDrzJa9vJdjODB60rMa/RSM9L3VZnblnJpmJCVA0g2bpbP56CHOAnsJQqLKWYo
	0HRM425B2Ld43LZ8TPYOIJOPvmwdC1SmVZgPIneBZKRGgNvNd1gtLmEQ/85EaVTEuM4xhplgTVi
	RLyfAxFartIWEea4D5SS9KGJfI4AerHhu9lsstlOs+umwkPySfiD+w4yV25QYvyvO83cnAaIPUd
	Xp8QXpJ8iuNDV2QXQ==
X-Received: by 2002:a5d:64e8:0:b0:439:af0e:5798 with SMTP id ffacd0b85a97d-439af0e58e8mr1388640f8f.41.1772300739900;
        Sat, 28 Feb 2026 09:45:39 -0800 (PST)
Received: from localhost.localdomain ([37.60.47.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ad3daf89sm6394786f8f.20.2026.02.28.09.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 09:45:39 -0800 (PST)
From: Esther Zilberberg <esty5664@gmail.com>
To: linux-media@vger.kernel.org
Cc: Esther Zilberberg <esty5664@gmail.com>
Subject: [PATCH v4l-utils] v4l2-sysfs-path: add description
Date: Sat, 28 Feb 2026 17:44:58 +0000
Message-ID: <20260228174458.11614-1-esty5664@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-53850-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[esty5664@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,readme.md:url]
X-Rspamd-Queue-Id: 0FDB71C76B5
X-Rspamd-Action: no action

Add a missing description for the v4l2-sysfs-path utility in README.md.

Signed-off-by: Esther Zilberberg <esty5664@gmail.com>
---
 README.md | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/README.md b/README.md
index fe893b16..8420417c 100644
--- a/README.md
+++ b/README.md
@@ -272,7 +272,8 @@ Installed under `<prefix>/sbin`.
 
 ### v4l2-sysfs-path
 
-*FIXME* add description.
+Tool to show relationships between V4L2 video devices and other related devices
+belonging to the same physical device by parsing the sysfs tree.
 
 Installed under `<prefix>/bin`.
 
-- 
2.43.0


