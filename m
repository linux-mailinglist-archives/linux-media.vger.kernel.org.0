Return-Path: <linux-media+bounces-65792-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XcAFIn+fP2qFVAkAu9opvQ
	(envelope-from <linux-media+bounces-65792-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 12:01:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8BA6D1B28
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 12:01:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=mrE5+Fyq;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65792-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65792-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6688F300EEA6
	for <lists+linux-media@lfdr.de>; Sat, 27 Jun 2026 10:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C299739EB47;
	Sat, 27 Jun 2026 10:01:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC73396B9D
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 10:01:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554486; cv=none; b=VHdP56fxGmTYM3EkrzGOjfQOsi+CH6OfL2xjgj3OpdaOWkIW3RjUIxVAduXiUCIdAEDTYdhyfFadZFvPjZJLU1yMinI7sW5XyfHhEi9ZahRBnRLNWq0f337KEpQIMsqVasWRxMAFEju4xZEKgs1vSWOE/RqGTbr577mcWOeMZ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554486; c=relaxed/simple;
	bh=vKQ0tFRaNgyCQPPW7FV5oOwk5g1uCMnAXYZmzILRviU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F6iVnV3EZa70GNHcUZPEKjO+atgDpTsBhuMKVk9NxJXdjfg/lrV0zU3JlWCu25RkNnx0amn/RsqxsHU83+ITJ8HduGg+l+dCzcSdy/GyXJ+6J6CUvn6N8WBFyb0euZlP1jyq9dXND5kHB8rZ6p7dzOSoOrrK3FweyYZIPAHqH3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=mrE5+Fyq; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4926fe5be4bso9333845e9.0
        for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 03:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782554483; x=1783159283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Dv/Mm0JfcC4346InPEi7M99NfG9WPL/LtSaq5m0Xv8=;
        b=mrE5+FyqE69ERJl7dPzE8DP7lLc06qQPAO2iw6J/CpU50MH8ifRU9c6O/DwdsiGVfw
         ibiVeFdgznd6UOOepwzfotH+5k/EG8B5CFEVNBsa+UUqytqkpYp1efZYd13gys9m/fpF
         y8OlLi6G15wDvVuqinC9VW14y+7JkDdNExSelwOQpRcI4Eh/kodNCl/FO1J3fTfu9xBD
         QKvCJTYYGu2CKTdpKf3ECqrevhhRcHcjYtCuJWyscl3kPQ4YNpr9aIb7W07h8oe/GmoQ
         ehIZmFmqlONrjVPqChiVfoDUIg8+J6qCIrB8GL3rCO6aGGWE8Wh06ebfHHKuFBZoFJ1H
         AoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554483; x=1783159283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Dv/Mm0JfcC4346InPEi7M99NfG9WPL/LtSaq5m0Xv8=;
        b=JxQJRT+vnoNWuVHMrYbB+ICdoM+MdiQcynozQPRhO4QDk502KL8J1hsf9KpxXxN4G+
         bH5sKhuCxqoXmTRJx4S9qju2l2efNop89FJlt4p8/tkWDnM7Oq+Vsr3+OIhRH8BvGYwj
         WZtKMk9G3WM8JEQPjesAbwBoCNq8oMq2AthC7W5/VDJ97PmDWFPb4/Xr0Hsk+sheH3/X
         NgDEgZsPpFmSkpXYp2x6TgTafFpEkJoCYR6i2A4utkaUC40xuCVt/Ndl8s9pm08AKHtV
         pk0G/npz74AJ+PTabu2iPK3tYJIeghWiPVMKNFDNXcrlBrlbvbH1SGWCEuay7bWITgxT
         +7SA==
X-Forwarded-Encrypted: i=1; AFNElJ+PqLzKUmzhiOdr7Fvxdy+l2FjKwt+arl7yW+NQwvq01JDv7hZss8oAFkW9A+uTkcVlyz+iO1jIK/P2sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyljQUOiKSJiKW5NBqD7JGav9I6EyAAlYtBZYkDhoHCOoYXZY69
	QSPkZA+6gZfvdhbQ4AXrvvTMRTOP06wwh5h/NdY4OKkyd4/6AAFpsOP/lt0W2Mcbzekw
X-Gm-Gg: AfdE7cmWetaoj1p547ZyUQ+iJezVQQHM+JCnw9+viqogxgG69f44TAzJkgTbXFW5YjR
	ggbbm+QxUyrntMZx+2di1eDnFcbqwcCylUU7ewtu49IUcexexoJ4F5qI5mggFKPX0b8XRC7Dsns
	T+hfu+hFOLXJ+XeyKGagwhAWoQxLc6Ylf7IhsszRHl5wdFLzpe/IUNq+9G7ZWtaSXOTUrAO7gMC
	M/Qu73+f64aasRPSpcjK1QfleoKV3FhishjXebnSyY8bNgmBCHuT0Rc5phJDi86IeEUnkMv1ot4
	FqFUDSgKoCKhj/srlosOlsQgqQrELfLrAtlZDElQsEA2Uy9rpD5no2l0/p75i+esNdT3MEcOP8y
	BN/VZiOhPtsLOxehC89njBFI3dDrdVC/I/H7xUn+RnTv2SeNGS9ifbfvmd2JnYr4Wn/aplzJdsb
	0SIYYkuMy2lpjZoxHLn1u+dtriTv4W1nMCzX300Mh7HMJqQgaAdOYGg+6U+Ia15aKOpZZty1apN
	gCxECHNrvK/MISrmpFjg9dj1SMk7zPUxSHC/RUSi9NIjQ==
X-Received: by 2002:a05:600c:4e8c:b0:492:425b:c773 with SMTP id 5b1f17b1804b1-4926fc3a548mr68637505e9.10.1782554483095;
        Sat, 27 Jun 2026 03:01:23 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49271465f35sm69047735e9.9.2026.06.27.03.01.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 03:01:22 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: hansg@kernel.org,
	andy@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v3 1/2] media: atomisp: validate sizeimage against the allocated frame in framebuffer-to-CSS
Date: Sat, 27 Jun 2026 12:01:18 +0200
Message-ID: <20260627100119.97650-2-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627100119.97650-1-doruk@0sec.ai>
References: <20260627100119.97650-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-65792-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,vger.kernel.org,lists.linux.dev,0sec.ai];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[0sec.ai];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[0sec.ai:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0sec.ai:url,0sec.ai:from_mime,0sec.ai:dkim,0sec.ai:email,0sec.ai:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B8BA6D1B28

atomisp_v4l2_framebuffer_to_css_frame() allocates the CSS frame from
arg->fmt.{width,height,pixelformat}, but then copies and stores
arg->fmt.sizeimage bytes into it. sizeimage is an independent,
user-controlled v4l2_pix_format field, and nothing checks it against the
allocated frame, so a sizeimage larger than width*height*bpp overflows
res->data in hmm_store().

Reject a sizeimage that exceeds the allocated frame (res->data_bytes)
before the copy/store.

Note this ioctl path (S_ISP_FPN_TABLE) is currently gated off by
2b7eb2c5dc72 ("staging: media: atomisp: Disallow all private IOCTLs"),
so it is not reachable from userspace today; this hardens the
disabled-but-revivable path.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Intel
Baytrail/Cherrytrail ISP hardware required).

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Assisted-by: 0sec:claude-opus-4.8
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d88..04e7b2e03f34 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3323,6 +3323,11 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 		goto err;
 	}
 
+	if (arg->fmt.sizeimage > res->data_bytes) {
+		ret = -EINVAL;
+		goto err;
+	}
+
 	tmp_buf = vmalloc(arg->fmt.sizeimage);
 	if (!tmp_buf) {
 		ret = -ENOMEM;
-- 
2.53.0


