Return-Path: <linux-media+bounces-60889-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNuzEm57/WnnegAAu9opvQ
	(envelope-from <linux-media+bounces-60889-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 07:58:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8F74F22A7
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 07:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72EFD3013842
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 05:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B384372B56;
	Fri,  8 May 2026 05:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/7DpLix"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93DF37189C
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 05:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778219871; cv=none; b=gwWF85w/hMqGFupXooTfbl2bwBhtwyFTagHznp5bk/2EQsMhsStJuTfa00DLexySijEl1X0MhfBPlCozBkSokMYbe45BOAVolbw8pYyZmL0oYl4NNskUbNVRGilywiK2WOwfIBPWK6wazT5FC8WBoPYLlTZyS7KsMl/wRxIPOm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778219871; c=relaxed/simple;
	bh=CBQ+SncFB2uYqntCJUuXqdVfr19evlSniIdg1FFRmNk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HEdB7KVMUES7BHwYKugwITm3tvQU2t3paZP6Eq6FtwAZypnEeqs63DnExsAByle8FVdVUpy2rMnukTpgY0cmw5ApfysRQAcCRbOqBv0XzjmlMqv3sMZoGjHkUZGa7+uYt7FPeln9i83RVzr1N1n2N2Qo60xi6Fxr2WYWNOAXWtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p/7DpLix; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso15010615e9.2
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 22:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778219860; x=1778824660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dgm85ZTzRm7Et/N4PqeSajuQEpz4ZP+SV6Szdoh9oh0=;
        b=p/7DpLixNODIEfNSXfd4zWtGOJYIJp8SWok26N0JyhCusInA674riXU0ZmHqmNSRvj
         lzT1BqQ+YC8OX40gVUfF/mAVy9W/Xua1RnYeh/C46KC4zBmr9A4sxfPmiWxmBYhxmf5o
         fIp3TuFVQ3YaZwa2en2i+I2cp/ChhnGud8KZfWJwznDqZhz3b7rmnm3yBAjMCvvMVe5Z
         Z+dvh6BcCAWGniKgA45GgBE67HjteR6V9ahYZZxX36FIg0BgvLM1Sx+BhMoYUXobjncd
         722Tr4v3sO7BT7v88bd8rZTxSpcwZMaw91sZckwedkDlzZVoJgAB/ylWHtGkq6k2BkC+
         begw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778219860; x=1778824660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgm85ZTzRm7Et/N4PqeSajuQEpz4ZP+SV6Szdoh9oh0=;
        b=hw3pPtyJDs5HIixekJN+WKoFJHSrq/wRq64PaLmQ8V87SPanPKRQuvf52ywLe8kb2H
         E60sRFf/6oxW6eqAkGKjzSR/IvG+jMZqh1kfW6svOzG2MJZswC6j5WRaGom/6E0IsHuK
         etCXMYJ+rvkXiIMWturx836JR41zgQXZgThtdtDjDMjeB6s+hTAiHiWdVAyTfa52pD2N
         wMWj3jPNqWOR9IUbzZKBG2nywAJz8x24KHJfeLUR5SmM5ROR+tmnO4LKhd23kyXEsZ5E
         RG00MrRPMk2HuQEx/GWfTzV/nbqKvjNtRTw0vYG5XpKUX2dmg1MKyAsQA8bDzlb9GNNX
         LQnA==
X-Forwarded-Encrypted: i=1; AFNElJ+IhhGyzxyz0biSjrQsu4NxjAfrMOe/HQpPmziWrj6uVbhsL4tMXa3ux6kwtYk1VrMVuwDtzbC3MEV1uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaH8Sc5t/Cpo2lb8mEZUeNcPgI7nTHU/dPAL2dxhh+A9pkYwI6
	ErLu1prCW5+n0mfrXJ3VmKf2rYESnfGstbd6EDbcbA8iNiEUq4Ax+a8Qwx4CaxZl
X-Gm-Gg: AeBDietmnDVYpT+bqqJqDvyRuXCbSfIzU3jyhQ8SFtX5GkV3ANV1XZVPLRm9cMW3tsT
	gssYFFxHnvF+Mbb+7kx/SWJhOB1rtx1XgreYEPlPtzR2g9Z8KG8OGGDxE/Iu+3x67xIx2v6FYex
	05kH9D+KUhQTW9Ow202qCOP3uTRXWt4BZwWsf3CfV3iqGBgcCAYtTKyvf5v4mmB8VVbTuLM0nP3
	psleyxK++N8RED6NcxjZELVW/QO0cJ5obuBFOrLc5/9Xwz/ZqgZgSQWFfVUhK0lmewL5lxGQ0E7
	UzWNcZYq40mUiqaQoa3jr73Bupg4TzYs9LVCoJQoQaB2BR8uadJCM61BS5NTKQCLUm8mvlQZOKP
	r3s7Jf5+YuE+YHbt428YUeFRizr+lLU78AX5JE3wQTvOHLvOCutpYnFn9XgE8Y5H1H0jMoTlf9e
	Ng6G23Yw9VIaYKIMCfOpm3bv/wSA==
X-Received: by 2002:a05:600c:1c0f:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48e51f3deddmr194731085e9.21.1778219860332;
        Thu, 07 May 2026 22:57:40 -0700 (PDT)
Received: from House.. ([182.180.27.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68f5d48fsm10278735e9.14.2026.05.07.22.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 22:57:39 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org
Cc: mchehab@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: meson: fix typo in codec files
Date: Fri,  8 May 2026 10:57:31 +0500
Message-Id: <20260508055731.19784-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DB8F74F22A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,googlemail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-60889-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahamaryamjavaid@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Fix spelling mistake: substracted -> subtracted

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
Changes in v2:
- Combined both meson typo fixes into a single patch

 drivers/staging/media/meson/vdec/codec_h264.c   | 2 +-
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index 89e0f8624e5b..a6074de15118 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -16,7 +16,7 @@
 #define SIZE_SEI	(8 * SZ_1K)
 
 /*
- * Offset added by the firmware which must be substracted
+ * Offset added by the firmware which must be subtracted
  * from the workspace phyaddr
  */
 #define WORKSPACE_BUF_OFFSET	0x1000000
diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 76e9ca7191ab..ab4374e3b2ef 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -12,7 +12,7 @@
 #include "vdec_helpers.h"
 
 #define SIZE_WORKSPACE		SZ_128K
-/* Offset substracted by the firmware from the workspace paddr */
+/* Offset subtracted by the firmware from the workspace paddr */
 #define WORKSPACE_OFFSET	(5 * SZ_1K)
 
 /* map firmware registers to known MPEG1/2 functions */
-- 
2.34.1


