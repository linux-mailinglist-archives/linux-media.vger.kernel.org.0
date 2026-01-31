Return-Path: <linux-media+bounces-51906-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2J8YAfF/fmn0ZwIAu9opvQ
	(envelope-from <linux-media+bounces-51906-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 23:19:29 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22209C41E2
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 23:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4DB29300B456
	for <lists+linux-media@lfdr.de>; Sat, 31 Jan 2026 22:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037C738A715;
	Sat, 31 Jan 2026 22:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="bG6F9UWI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E945238A2BE
	for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 22:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769897953; cv=none; b=SfWP4wOf6wNJVKsnvH669U7OOSlR9nTsa0lQz2oUmAus6uchQHZTl4n2cRqPUBklhRTee17kJ5PmswDKg90ffGQb6lfz0LlfHyEbX8voiplQj1ncLJgSzSPv3tfKNVOqHeevrMpkhSs9OPACFy8/yUJ7G4JTDHJ4CPWoVYAYNCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769897953; c=relaxed/simple;
	bh=XQzXV5RsU1ucKWmL9/NTjI6ZtXNXLK+awDZjr+Wac7w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BvYMtehVnpMOAg+lYFnvvWyEFdfh9Jli5CJ4+oSoRrkvLamRyIa3UxwtJc/XvKrVjDiRDwi7bsnrpGEfeNoqJBPYllvuH5lFhPbnT4ciJcutn47M8ho7XiPWq4c/aXSW+oGpM2MxyjOhASMc0ok7BNIh6zZPXxDbMcnim4VHN1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=bG6F9UWI; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-45f0c1f1b54so2012598b6e.1
        for <linux-media@vger.kernel.org>; Sat, 31 Jan 2026 14:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1769897950; x=1770502750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M+GROKcYP9TzY9wl/o9M+TDsv2+lescxpK+bfyqozIU=;
        b=bG6F9UWIb1+TMhK1z2vdkv+v/x5WGntqUOFpj01U1CX1F8Hrf6wJ9tYFIUiK8AIZYa
         v/Ph3wUouBiZlQBAloqMfxh5dNewblQG7/CkGUg3VJJcxjSOwb6WR2/HlnzaEaG85eTv
         gVPWBGy2FH03dY3jpmjvGYnhAO7PiZUBvTPIT3rdfBXR/k2pvhOLdzRLbuScUZkjOmuL
         Ev1usp+kNZFG50NB2+6SNrcD2SjANkoo3CcwDfjysKjUizQyHZOS4ssvbG455Ao7vt/p
         n709jYXgY0fzLvU7Sw+sQ2QO25edHBKB5Dzz1NWRO0xvXLEO68G7ch7dkah8IFuqIwdC
         OSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769897950; x=1770502750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+GROKcYP9TzY9wl/o9M+TDsv2+lescxpK+bfyqozIU=;
        b=XFCo8tptBJW+ZGm+Rwe6M/jUeMOR9p9NRYQk0py8pKLrIHUJDNw0X/OE61So56iNdC
         YhX1PVyrfCjF14sDDKL/Ad9Gfql7vJLbGvQM5KMewhB3BJbKXa5K/K5tRePYjD/1uUUo
         I9pz28BExr2KHRgPQBX05TgYuaUFSJhQSq6+7ulOam/sdmJi7p20ANiPSFvX3aKQfN6z
         Eme9GFjIBfkKrCbQdB0/YbqpWeXXPNjuXZVbUqxpuLj81Di/8OJOKHW0gCEgjSXVAae2
         Li+I59k7/QDlEp84SYici+TkPcgICT1MxPSE1SjHNgsq13g5++jYtgkD5B27Sv6t9dNK
         pFag==
X-Forwarded-Encrypted: i=1; AJvYcCVwRSpYuSRnaDI80QdKkIRiP5rWbRFKyYOV62B8gv+qnGJSyNoVPaQC1A1aqe3Vgt4a0j1wG8EF+y8iWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBwZTIbSKHFwNxs1F/tVSYAbq4w890hBLBpc60wyzKE2ppmJ9p
	u7rwLEMs1eAqq5fm4tSCnGT9MR42IJcydu+xcCYOZYSc9kNTEsTy/o+YbUrR9bzXvAc=
X-Gm-Gg: AZuq6aIEOFzuTfz9wTpFKnUZauewu3amFor77LsVe+tERIQtpnlcYf6PejiTm+MWjB3
	TSNR/KJq9HCHIqaATnlZztpj9juYuG6XG5bFGnPdW2N8nER5wqu4ze7L0/93dMs+23rHuHw2KeX
	stKqYOVWVF4+guY3jHSwLltgr0U6PCBR7u8bIKNNDo7H7wDhJ5AjVSf2+eDeeYSWT/GdgEoG4lD
	A+uHWdfbZu18kXPF68cA4OlAuksGvKWzeUoK+B6ZrbaTBq4FNxcGv1MYdlcVafPLS0NeRZWb/5J
	QUjGI5DaxG+NanfwggM8lS07Wyv4quu8+r5tQ40hSgsodIb3gA3Tb2zYSDFpDTf5uHBkabt2t3F
	IQNzGY3Oi8ZSq5IAwSWJttZ6BqUWx8BbrhMm/yjMh9Mg/eYeggvZcdLYzIt7baduv5yMglZem38
	NbnLuwojnR033scT3zu/0d9xiHEIMboOlx03rP0tVdR5JeD6+TSpMPXoxrO+emFWYf4T2H1WsD5
	wa5Gt3v6F1AfP3gmixSz/aONnY2GF0=
X-Received: by 2002:a05:6808:1596:b0:459:a26c:2c3c with SMTP id 5614622812f47-45f34b9d012mr3573161b6e.26.1769897949848;
        Sat, 31 Jan 2026 14:19:09 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45f08fb82f5sm6765485b6e.22.2026.01.31.14.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 14:19:09 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] media: chips-media: wave5: add missing spinlock protection for handle_dynamic_resolution_change()
Date: Sat, 31 Jan 2026 22:19:07 +0000
Message-Id: <20260131221907.3313423-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-51906-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 22209C41E2
X-Rspamd-Action: no action

initialize_sequence() calls handle_dynamic_resolution_change() without
holding inst->state_spinlock. However, handle_dynamic_resolution_change()
has lockdep_assert_held(&inst->state_spinlock) indicating that callers
must hold this lock.

Other callers of handle_dynamic_resolution_change() properly acquire the
spinlock:
- wave5_vpu_dec_finish_decode()
- wave5_vpu_dec_device_run()

Add spin_lock_irqsave()/spin_unlock_irqrestore() around the
handle_dynamic_resolution_change() call in initialize_sequence() to fix
the missing lock protection.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index e3038c18ca36..73f21f60e7f5 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1533,6 +1533,7 @@ static int initialize_sequence(struct vpu_instance *inst)
 {
 	struct dec_initial_info initial_info;
 	int ret = 0;
+	unsigned long flags;
 
 	memset(&initial_info, 0, sizeof(struct dec_initial_info));
 
@@ -1554,7 +1555,9 @@ static int initialize_sequence(struct vpu_instance *inst)
 		return ret;
 	}
 
+	spin_lock_irqsave(&inst->state_spinlock, flags);
 	handle_dynamic_resolution_change(inst);
+	spin_unlock_irqrestore(&inst->state_spinlock, flags);
 
 	return 0;
 }
-- 
2.34.1


