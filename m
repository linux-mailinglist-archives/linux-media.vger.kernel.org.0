Return-Path: <linux-media+bounces-59479-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEimNc4E62m2HQAAu9opvQ
	(envelope-from <linux-media+bounces-59479-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 07:51:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E3A45A118
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 07:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C49473014C7A
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 05:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE33C346E73;
	Fri, 24 Apr 2026 05:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giwRt2mu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C84318B9D
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 05:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009745; cv=none; b=BGQeFE6DHFOhmT/gLXJugxGDqX8CBmxm9RIQOrKbPdWaZA+wvpq2WIJdtenrGEP18ZXv9FTT2WQOONi361j4YirWkqBenwmSAxBFnmEKwoFlQcHnj5QibhgIHN7ceerLE0zZsC9DWGZhMfX5oJstjbvy4stNLNBHbythMbNaFZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009745; c=relaxed/simple;
	bh=QL36iCxJvrAKverR2bsI02V8ii8bfBdNBFY2qQ0lS8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z+IHnLh0ew91KyzVoT4XHUyhOCAXetdI7k0O7I+A1zpE4nVUziW7Zs/IhP3h/O5tF4gDh7vf571r3U+5E/nRijeoMmlq9HMvVTSvqMZwuvS5MY2ELFuY7Or4mPjqNlv1Ut7XAIIUEL7gglRVFITXuIDYXwBqwNX8Eltk2Oj5w4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giwRt2mu; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ab39b111b9so30968935ad.1
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 22:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009743; x=1777614543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=begHw2Fh55YIAbwVuxIcFKYuQNkyXTaAo0Peazo3t08=;
        b=giwRt2muKV0aWZwVt68C/tVKGzzH9LcT3/8dgzXSZ4YBO+9F9EOsCDsP+Ox2M7+WHQ
         RqFy5s6Rbcx4M2OwLjb79iRcKyPfNKGYnbaR3tYrEsKfUuRCXsORvkWE476iv9vbwPn/
         z38aEDkXIg9+3V+0+pRi4Khg8Nkum2Fl5a92HNDK+R2DaG5J2pAIGLYB4w9sBm1PrpoQ
         IqbdD3RIHgMNKUjJ3Pt7NMTiDEEIXpQkOZoRjvQn4NcYIVQWoHbNoSvzyxpJefp1CC1x
         U21iDffRJ4kOuLIch7PgSB3pO85sAJ/GxCuL/gm5ZI8aySbOLxXiofqZKaEMPfco0T1i
         XaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009743; x=1777614543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=begHw2Fh55YIAbwVuxIcFKYuQNkyXTaAo0Peazo3t08=;
        b=Q+nSxtAiB7LnfGWTtlOMrxIdYG+F6T4PzZ14BiFN7HZWFYstcDIPuXwWehZeZxiVHJ
         rR2mP3zxmNzFHXQtebKGxT4aGuMkvaHFQdZn+UvBJN9MpYcxfzCMks+HZ3slr2vFpR1o
         e/0uwW3PXmzgNQ/rGo6d6l0XRB8donmfsJALu70SqqSsOh3NBffrfsEYq6RAT1YaV8Dg
         6iIav9qwzKzH1D3mTwPjASAqv2N4Nm1+T0ojT5DGV/XrVu1SLQbRpQThhBlqrYqMipJI
         tL9+QKvtEomf+lwmnaoa4DWGYsnKu1kJ50ktSmXlCtgF2pORkc+l4wKdEdw2LCIy7WxC
         gjNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wtAHjmfIj/3OLrlIDSWay3wb/6CQjVw/CsQktphwvL8GFM8KlU7F/nnEIXkHzFFDqwWfy+dmSAhttrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBlJuHkXpxmujNiO1mtNyk1gHiG9cL5LKrnr3rQZa2LAU9Qf1W
	Ojvv3rnrYjCXJkqkZZHooxI+n3M0Xj8PjcVbu2nBmQVt5KWefHb6PxLP
X-Gm-Gg: AeBDiesUs9q7DkazUBtk6QeDIPJ78rVoW1L3qUsfaOruoobxLkL8SChQhMN5cpvPp14
	PFj3dOXsLZIRjpG6HCX5jyxKoQMhoMRmJ6qLTKVxSkuqDkuiDBuvDCM8PtV8tS52bmZMFAje7QE
	tV+p9sDyA1aZZFE7IIyUzPExc1rs8ewDhm63MAoumDX/sdnX7TCOjdVZCliUmh90C9S0adObmob
	Jwq7JFSwKWgFn+oZs2GQ2QIm/3Nmjbjh9yCGR1kR+e8eXExsf4dVcs45n3oefUsLUcHSfzJIOkC
	OvfmIFu/lMbN2aTJBSNuFvy27E8U9+/V9BKxjABOD5O3OAKtURkN4cQJAmIlgp6TfOMbfIkdpqo
	zEQrhAtV7amKhHrK5GokpLZhO0YMnY7sG7Yokv3p3VOKJix2Yxc/Tn+u9dIeKdiCq9PfUTsxrBd
	NW3DbGB37TQMWxlN356+wuwUqqHtSoqya0lr5UJ1bI+IamdMh2QzPwya5DtbEq+5uCh2VpZhLoG
	jvk4hwQf7cpghQ=
X-Received: by 2002:a17:903:1a45:b0:2b2:65db:8c5f with SMTP id d9443c01a7336-2b5f9f4f562mr323157805ad.27.1777009743184;
        Thu, 23 Apr 2026 22:49:03 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:49:02 -0700 (PDT)
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
Subject: [PATCH V13 6/7] rust: Add PowerPC support
Date: Fri, 24 Apr 2026 11:17:41 +0530
Message-ID: <20260424054742.45832-7-mkchauras@gmail.com>
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
X-Rspamd-Queue-Id: 49E3A45A118
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59479-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linkmauve.fr:email]

From: Link Mauve <linkmauve@linkmauve.fr>

For now only Big Endian 32-bit PowerPC is supported, as that is the only
hardware I have.  This has been tested on the Nintendo Wii so far, but I
plan on also using it on the GameCube, Wii U and Apple G4.

These changes aren’t the only ones required to get the kernel to compile
and link on PowerPC, libcore will also have to be changed to not use
integer division to format u64, u128 and core::time::Duration, otherwise
__udivdi3() and __umoddi3() will have to be added.  I have tested this
change by replacing the three implementations with unimplemented!() and
it linked just fine.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
Link: https://github.com/Rust-for-Linux/linux/issues/105
Link: https://github.com/linuxppc/issues/issues/451
Acked-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/Kconfig  | 1 +
 arch/powerpc/Makefile | 2 ++
 rust/Makefile         | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e93df95b79e7..4ac897b650d4 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -285,6 +285,7 @@ config PPC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
+	select HAVE_RUST			if PPC32
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a58b1029592c..589613eaa5dc 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,6 +61,8 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
+KBUILD_RUSTFLAGS 	+= --target=powerpc-unknown-linux-gnu
+
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
 KBUILD_LDFLAGS	+= -EL
diff --git a/rust/Makefile b/rust/Makefile
index ee11fba7a03d..fd9c1bf026ca 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -400,13 +400,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
 	-fdiagnostics-show-context -fdiagnostics-show-context=% \
-	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
+	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
+	-ffixed-r2 -mmultiple -mno-readonly-in-sdata
 
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.53.0


