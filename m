Return-Path: <linux-media+bounces-57934-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPooMEE2zmmAmAYAu9opvQ
	(envelope-from <linux-media+bounces-57934-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 11:26:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D66386E2A
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 11:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 524C631614F2
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 09:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB07F381B14;
	Thu,  2 Apr 2026 09:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nP3saTnx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DF232ABC0
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 09:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775121543; cv=none; b=Cq6llQlGDXLDOyDpZ5ux9lq76J/TVsOniJHaBeLUABHy4FA+spKYYU5wm1VkNSrHAt8URYIrAzhKDJyiBAUVFXG2fb2fLalCaytj9Be+xC8uhI66rPUxeTpovyG0guDcBFdOFSLErJIAnwKAusyUBxIWzOeE98ZJkUfXsBJi2Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775121543; c=relaxed/simple;
	bh=9dbv09lg00DQPK1dV+7JZpQUIqSigeiwnk61GGff5A0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W1c1Sq0Lm8Yg17fCeMOBCyExLanBiBiFMOSRK/kAKWCjHUCfxyrd4JDzXVdQmHwQAHb8olppDeLds9u/Az0ABgOdpo6cq5KPa9jF31dOPncyYzW9O9+cas8AjJIIJ9VQWEpXDh+719gIZkfB3p/JUk+CTDmOslv/8ckP5JF2clM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nP3saTnx; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66db0cf6a4aso1241678a12.0
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 02:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775121540; x=1775726340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eO9T/SGyYhQ9sXyC3ggbEF5VPpGqMQn6RrExsIa5gP0=;
        b=nP3saTnxHbid2YZ/4+GhqTlbfzYxYzSLqNMolqoOwhrT+vDW4puTq/azfl7tA3Ab1M
         AsIkc1fXoNXqTAxd9Itc1jDYr3ceLPl/kYzqzPfQdQ01OZlJ6DZC9LxHvyloam39jZQr
         cua3hC5e/6duwd2ZO3zK+E73YMqtluo/lSvssuhcy47+H19thuqpcpp8UMfagJKxhG42
         xgNP48iPeFaAo90fq52rgYi0Agn73OAwqvsG8HiNknGchS8SsIAATFHKeii6Zle0vW5s
         rkxGLRJUvXb4RuA5P4XJcuG5YilSZR6/HjYGC3U0vtwRJtIBdvFcBCwCmC28GSeqyzXM
         NF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775121540; x=1775726340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eO9T/SGyYhQ9sXyC3ggbEF5VPpGqMQn6RrExsIa5gP0=;
        b=Dbodnvex/VaIGRKAm3GD+WaR2hL446Jhd+lYXoNYbZzHmYZY+n4QGmhgkKaDrymPgB
         64L74O/fd4G5cFVRsFrfQ3DNcL8DY31ZfDA401WdmS4gxy7XDZbUHRTeBTLnfobB54Kz
         X32awtenl85NMViNt13XK1qqaUlzCclkbhswDqjlpGH9N+DiaUIKTD2TTXS2/pEX8iOo
         NdNTDa16tg7dLjO/1yc3YBTDvBNANbPq40aXZ78KYpE9S+gpDt37EbBr4Gf/CJ/y9aUa
         KKtJDGOrRGOQLZ27X8l4+yU0288k8F3tqD95zosCooixoUzDPYe37Ml79rS0mBAa+Y0z
         EANg==
X-Forwarded-Encrypted: i=1; AJvYcCVYdEC9UcjWRiqyxBCMn3k0gkTnh8VFd4r0xXikIcn7KiHB+7MgY++F9ZlY2eMx+hTRIWT+t4ZMQVjYFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPcwF1uOS1LAbpb5kP7L0of3/aM1kjeOgMcqE5oPaL7jAUnfUy
	0uVOo8M3kz6F8qX9vyGthPvYwjRg7DTrmeN7/pECuWnT+qV5lmUcam5wwlZSREvsZxo=
X-Gm-Gg: ATEYQzydi9cPMAIR8JoEkclTDnHOPt8j/K8eUycdebS7WieV9GqCAi4ZAO7lYcZqczw
	Y8QmucNyWjZt5nEAEzHQJlZqVOQuClc7/DNEiSUUPnIuzJGeukX0NGtlZeeUaKSR0xEQYvC6PB5
	e+m6pcOfcW7Kjcq+7E5jWUUtWcF17ckZvWjmKWOrJqyAI0HE4JPsC/FDK9Wr7dEzJW+igO/jsbr
	gvYngzTSD7AQJPuuh78gpuZJXMjzi/6hnwnZtPMBXMez3I5HHVKm/u9uLPpZf2P6OFU9HVW52dS
	IZunTeYFvqjrn+8E2HTnjG3pC86sEe6gyr/gHtoCTzx/Y+/bjnueECRP//Bw3nWxaB77/7qpsVV
	4I1/U5DhfUnNL/0krOpvUyHBHb5D4Cn/efeCJySkugg8hSqR3/YJIOSIdDFv4dENyxdhvMgpDML
	xk0lW51PP2cr2l5yvc2t8t8Rdu2rdu9VPpk+7sjcfNcH8MP6wy55Uuy3Xb4dV3wL4YlNCJsN93K
	FMC8a+o0V6qQ5ikSH2wROHmrIRTd8V+BsAkSxR1wwb07iDAhK8Y29hz+CbsqdXvtpUurH0wXbJU
	WOJGgPoFtIQfbh30d5s4rxX8/ZPAcWntwzzXomxIQo1LHd+Q9sEeo++MPotZokhfPrbVWe4nJiu
	aX3HrYzry/eU=
X-Received: by 2002:a05:6402:350f:b0:66b:a9bf:2f with SMTP id 4fb4d7f45d1cf-66dafeb831fmr4176050a12.2.1775121539912;
        Thu, 02 Apr 2026 02:18:59 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.od237066db22328bb-tp.internal (65.161.7.34.bc.googleusercontent.com. [34.7.161.65])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034c8065sm561809a12.28.2026.04.02.02.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:18:59 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	grondon@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH] staging: atomisp: fix alignment in function signature
Date: Thu,  2 Apr 2026 09:18:27 +0000
Message-ID: <20260402091827.2163-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57934-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[joshuacrofts1@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 45D66386E2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix alignment checks in function signatures

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_fops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index c7aef066f..c51d04af6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -96,8 +96,8 @@ static int atomisp_buf_init(struct vb2_buffer *vb)
 }

 static int atomisp_q_one_metadata_buffer(struct atomisp_sub_device *asd,
-       enum atomisp_input_stream_id stream_id,
-       enum ia_css_pipe_id css_pipe_id)
+                                        enum atomisp_input_stream_id stream_id,
+                                        enum ia_css_pipe_id css_pipe_id)
 {
        struct atomisp_metadata_buf *metadata_buf;
        enum atomisp_metadata_type md_type = ATOMISP_MAIN_METADATA;
--
2.47.3


