Return-Path: <linux-media+bounces-59478-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II6KA6kE62m2HQAAu9opvQ
	(envelope-from <linux-media+bounces-59478-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 07:50:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0314B45A100
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 07:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F1FF53012D48
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 05:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6607B346ACC;
	Fri, 24 Apr 2026 05:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJ+d3qB3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44AC2C859
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 05:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009733; cv=none; b=Q+pj5ecBebgqeEjPyaml+EZtkz7lBUsPM+u9ebyR8rVO2JO0GTE//EIr3XAAa55lVBzPNvKQpnqu8VmPA4s5+t4VC+HFDpfBZLWl+90AJ0ApZkvW+M6sX5IacelSBFN/qk0G7jGfQwdsQZfdxVtdj0Qz72fAsrDrEEG8Xhel3w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009733; c=relaxed/simple;
	bh=8uYxXlCsfJ2qoRnT3JSJJZBu6F4nxjWNt9la1fSIEJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gjT2ag6eU2qC8fIN4R4/QAFHJeA8duFxZLrOGqzehWFye0ws/MZ2XwK3Mv5kzkCrruQm3scEC0hnHdTGupAEYF2DtxrzX53KBF2B7TbwlK3x8KK4RL2vLrobCio8/jBowT43JC6nVkgGWrS11BK7CgqsaKg6lOCBSaR86Ych0Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJ+d3qB3; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35fc258aaa4so4741394a91.2
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 22:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009732; x=1777614532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jOMf9sHPOP+Fk6bUCc/tdd0deN6bifNBcXjhksEyrM=;
        b=TJ+d3qB39ZfoGP1a8weDZ0sKdmP5QYZPrMXom4t09zQgy4oyTEiWwO0rwCEkA3d6iN
         6yX1DokORZ48Pv/ExE9+Fvq2shhd3Jzed9xdMrBAMYErZ0Ebz6dY/vMuP6/kT6uhkVhc
         Oa0fawmqNyE0/HbZEpbjWCI3lHhYlZ0d3sirDsiTN64cyP4U5QZBOK+IHsH0WjGGFN52
         b8a2GXaqKJrDkasG/SLxkmNbqYPs4jqItsQNr/MAGsVvIennvqBJVsYV3CNg0aZpBmwm
         HnTzG5QfqgI2YSrkPXj3amX9IvNHIBSlEAVq0j+2jFQusannO9ErtVgweqb69eEmyj3G
         pi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009732; x=1777614532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/jOMf9sHPOP+Fk6bUCc/tdd0deN6bifNBcXjhksEyrM=;
        b=Li9qunPFBAww4fgIIHL6zhZ+q51slThgODRL2jE4+o7m30grrMhelyHEUkquLrn/KC
         FsJy8rJZAPvAcN/o6qga05j12YudaDmYxHh6n6TuKnhnSHtooPyyVe/S1JE1Tw0j3Sz5
         wKgS73R8DZklGkp2Usm41NkEVqDHi/vav3vtLm9tWXXxxdFgh5U3f3KuiGx9qD/V5Ju2
         Kt5Wq9rg9jXrl6cE2puRZ8e/lFn/9gnN+Ou7d8CaQUpcNAR23HhFQt/whPL6/e2W9p+M
         z8asbSjrjykkNAjE1gCYZwyjDWmXhmuq36Vl5clGFljn9bo+faScO1O8nGkWdKWo+g8f
         FiYw==
X-Forwarded-Encrypted: i=1; AFNElJ/sU1oClmtAhq89PTJbNICqowZQnrW83gRG5EYVDER7xQuhHXasMKXjaSzyGZA5Pdp3FtD8vC7KESr0Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7TXbgQPxZTwAe2QVBGmy4TTI+zmRTBfq+usLzGUay3UZeEqtN
	F0Qtzxc5xwH9FOWHP6FqVhNtE//BuFvxEfLFqR8E103jCAzoSqwgsdwU
X-Gm-Gg: AeBDiev7bzfOTAwUzyyPp86c1jzSFJ2eBcav/syOOAOcOtPH2A+b4CpvHXsaw6sjEaW
	Y5paz2PeLrwO2b+sMcprjw6NRGcfWEeEaP9rJ+t0olcfmQB3FO5WrmBL6gHBiFGMrh2lBp0L2Ti
	0v3LP7JnXAvcxLe4LibUgwwAkEaD95//XGxDRItm+BOau8tFwfHPREZYe5Q/dvzZOksD9hQwIzP
	YlUagZgjY6mZ0QmhksDvM/DgWYIwIsDOlfggkeWy53CYMzqzcSX4kNwaKNNST3cqj8WsOUtxHmU
	EOj9zxyLS+mwOB9Hc1B9YeyNsSwPkha6iJ8fdAEhu3RfhqbRrurEzuefLNNrGdbzzs/QEgW/cA/
	dbmAlwCJWfBbKKRmdOBtxfESDIH/1kYvZzV5qyySi05+sv6LDPGUTuZgkoEO2vtm9b2/8Cex3pn
	XK4Z5zqFgeFTHeeH3b9OuJQSPMDiXosNkF9AEDBeOKHLBu07t5tIjMlzshEXUEkeaQu23Hr8JhY
	z3bmKnSGQ7aKU8=
X-Received: by 2002:a17:90b:5185:b0:35c:29ba:bf92 with SMTP id 98e67ed59e1d1-361403d5988mr33141482a91.5.1777009732009;
        Thu, 23 Apr 2026 22:48:52 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:48:51 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	tamird@kernel.org,
	arnd@arndb.de,
	nsc@kernel.org,
	mkchauras@gmail.com,
	simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Date: Fri, 24 Apr 2026 11:17:40 +0530
Message-ID: <20260424054742.45832-6-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424054742.45832-1-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0314B45A100
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59478-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,amd.com,garyguo.net,protonmail.com,umich.edu,arndb.de,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[37];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linkmauve.fr:email]

From: Link Mauve <linkmauve@linkmauve.fr>

The core crate currently depends on these two functions for i64/u64/
i128/u128/core::time::Duration formatting, but we shouldn’t use that in
the kernel so let’s panic if they are ever called.

This doesn’t yet fix drm_panic_qr.rs, which also uses __udivdi3 when
CONFIG_CC_OPTIMIZE_FOR_SIZE=y, but at least makes the rest of the kernel
build on PPC32.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/Makefile             | 4 ++++
 rust/compiler_builtins.rs | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 2a5428a5503d..ee11fba7a03d 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -616,6 +616,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
 		__ashrti3 \
 		__ashlti3 __lshrti3
 endif
+ifdef CONFIG_PPC32
+	redirect-intrinsics += \
+		__udivdi3 __umoddi3
+endif
 
 ifdef CONFIG_MODVERSIONS
 cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
index dd16c1dc899c..fc6b54636dd5 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/compiler_builtins.rs
@@ -97,5 +97,11 @@ pub extern "C" fn $ident() {
     __aeabi_uldivmod,
 });
 
+#[cfg(target_arch = "powerpc")]
+define_panicking_intrinsics!("`u64` division/modulo should not be used", {
+    __udivdi3,
+    __umoddi3,
+});
+
 // NOTE: if you are adding a new intrinsic here, you should also add it to
 // `redirect-intrinsics` in `rust/Makefile`.
-- 
2.53.0


