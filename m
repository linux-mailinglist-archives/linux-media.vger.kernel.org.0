Return-Path: <linux-media+bounces-59472-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKqcMiUE62m2HQAAu9opvQ
	(envelope-from <linux-media+bounces-59472-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 07:48:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC3045A08A
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 07:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1603A30156E9
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 05:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD96346E68;
	Fri, 24 Apr 2026 05:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHMqY7He"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6308223DE7
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 05:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009682; cv=none; b=ox3+rQh3yhqTOsANyRl1bcgpCgRIjDEMb21wBdOZScGuyHaEbrhC+/UmJzuB9sWAVfxWg7PU8U0+vzY4rSuFGownXK4IB794mdgXYEREeS5lvndX5CzqoCB/zUjdKAk8Af4/beggEoqJPbU3DCf7Yvznjav9IQuq9nN/ia6So/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009682; c=relaxed/simple;
	bh=Wbj58W73Rvn11UjYWl9yYv7iLUdHME6E7yi35WzUH1g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MBVy1eSmqINmaPTee6MdPDnAIEtFV+43yf6MrMolnwrosVoXiZqpnHQ0zq6cdH7bu7JpSHcWJVON6A9uaeafrw6f3ff72Ov7kFlH6PSO+qfoP9iZCBdbnMw/ZKpW/vEqbkAQdBzDAlRnr17fN/ii+9865RsCu1R0ZkSGbnoKy3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHMqY7He; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b7adb38d65so13792425ad.2
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 22:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009679; x=1777614479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7M2fwY604nxmRG1YIO02Z14fgzwwg1Pa67qHupVFxk=;
        b=cHMqY7He+W2KB9nqyY8WWga6dOfHRzrhkB2ojWV9hG4/tUkwbWI8E3xNEUv430vMug
         hJb1hnUxJ7CxHksmxdFV/NgfRch6aXRo9JxJQxHkdUxTt4DVIZCY1qaY7SbGCZktpu9R
         ZnpEGZjyy+Pak3g6YS0CjQTKUlNJG1EC4Cv/VPpf2SD5bJE9ZIERx2Gkjupu6cb/dFFP
         Lb9m3iFpFQD43/mjg8cgJ4lgV4yq34z2aogqpXizwJWHkc/RTpqYqk/dqW2HsVsND+md
         4aHzWgK84BgRpYdu48MLUznmzmmk2akOAb0BZtYimhb9zVjH8W3yjwgoFd5UxNKizgb5
         BI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009679; x=1777614479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7M2fwY604nxmRG1YIO02Z14fgzwwg1Pa67qHupVFxk=;
        b=mLA8nnomogYnC9YzURD/6lbdOmLa4s/gFFGPvnWL9/oqEfAdZa25iKCSKbPWd+fEPj
         8afoBdVx2Gx8XYViao1PlokP5dEb/6WD495EmD5Zc/nBr/7ftJuysbYDOALZI/Nnv2Ev
         hkJ3FcVImR9C2O9yuwLoMoEM7j7tYATHReSJRxUy2fxwlPuauz5hDhqgS8HKNbbWwUc3
         GlRuBAmJdBUsBo5DDxRFE+L1DRNZRdPHemFNMpu2Wp4iRa+RbmXKYHyaUQB5nZU2oXUg
         sjMy20xxJ0AcX3sm/hHBcVGw0P11vXlHK6QF4cDuDthPWNiDX2JkE4ZB/CKxGOHogIh7
         zRJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9f3pAM6IhpO91517QgOeCJviDQR+cYNGR2KuLEpEgI0/fDO08G8rJ4Z46FbW5H2JkLHaQz100qNsBDNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0uvyJg0DGvY6WTIVH0N/CzJ7dFXdRLT1AsgIdK/1VLNPweqL
	6YedM5FVqIRkXrmBJwWvnH0SVeIFF8OD/eAhdsQZXUMPx8FPgSy4fZQZ
X-Gm-Gg: AeBDieuLTqtwrKN0tOcvxSbkoK/ohljfA0P94IncNGG6neQIKnUyPPyEG79DiKbV1LY
	wBTNgDTK2CyFwLC80+7axnlIJG9wiK1tRtF7Tlc6hRfq7HVV1aLCqtBm3c9NYcg/UY/xslOFO0i
	Rq14aHjuN/blFWK1B5br8X37d7bjybzqZ1pO+2UQTnJgEbwMThe5wQM3CWeOTx5GQpqjkU7O6Q1
	dL9BGD5Pt/mdr2a+/Mi0RJE6g3GA7tCIumsi7Ir2Gzvug8GO+lAFJ6eWkf+IojL39hhd7FTL8vV
	FATLL0GULrwO0MggMsN5dE0I/1dXWlzbJ8HsFTgjnbP57WeKmniYso//+mIVvq43IY6Q9bhLxDi
	tYzXSUdAp/MVMHdYdNmdsSO36GwzkLlOOomos5LqDCHBs99/8dfRsYSmmAn4r6aT0DrJ3jWYTOd
	OUD0VikFzx6K44NoRcQ6aGs/CZatzjaLmJBMIQmu8izWXar+ESGXMwWpkdQGv3cZN6IcKVF8ky2
	zTIp8kaU7rA1ns=
X-Received: by 2002:a17:903:28e:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2b5f9f9f125mr305572665ad.41.1777009679150;
        Thu, 23 Apr 2026 22:47:59 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:47:58 -0700 (PDT)
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
Subject: [PATCH V13 0/7] Rust support for powerpc
Date: Fri, 24 Apr 2026 11:17:35 +0530
Message-ID: <20260424054742.45832-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3BC3045A08A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[36];
	TAGGED_FROM(0.00)[bounces-59472-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,amd.com,garyguo.net,protonmail.com,umich.edu,arndb.de,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Enable experimental rust support for ppc64le and ppc32be. The patch for
ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been
merged over it. ppc32 needs some toolchain fixes mentioned in the patch
`rust: Add PowerPC support` and the discussion for that is done here[1].

This has been tested on
- powernv9 hardware
- pseries P11 hardware
- pseries(9, 10) qemu
- powernv(9, 10) qemu
- rustdoc on x86 and powerpc64le
- rusttest on x86 and powerpc64le

We are actively working with our LLVM team to get the target for ppc,
ppc64 and ppc64le in the rust compiler.

[1] https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
[2] https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com

Changelog:
V12 -> V13:
- Added a patch for fixing build issue on ppc32 by Link Mauve
- Added another patch to fix a build issue in dma-buf
- Added another patch to enforce minimum `rustc` version for powerpc
V12: https://lore.kernel.org/all/20260421120958.190430-1-mkchauras@gmail.com/

V11 -> V12:
- Rebased to mainline (rust/Makefile conflict resolved)
V11: https://lore.kernel.org/all/20260417152253.2312961-1-mkchauras@gmail.com/

V10 -> V11:
- Updated `rust/Makefile`
- Not all libraries are move to `rust/host` directory now. Only
  proc_macro2, quote and syn are moved
- Special handling for pin init is added. Details in commit
- Removed mkdir for `rust/host`, this is now handled by toolchain.
V10: https://lore.kernel.org/all/20260406200149.3727922-1-mkchauras@gmail.com/

V9 -> V10:
- rust/Makefile updated with review comments from Miguel
- Patch 1/4 updated with commit message and subject
V9: https://lore.kernel.org/all/20260404121610.1956528-1-mkchauras@gmail.com/

V8 -> V9:
- rust/Makefile updated with a directory instead of abspath
V8: https://lore.kernel.org/all/20260403145308.1042622-1-mkchauras@gmail.com/

V7 -> V8:
- rust/Makefile updated to separate host libraries from target
V7: https://lore.kernel.org/all/20260329160254.2592207-1-mkchauras@gmail.com/

Changelog:
V6 -> V7:
- Documentation removed as powerpc is still under development
- Added a fix for race condition in rust/Makefile
V6: https://lore.kernel.org/all/20260210090023.2587534-1-mkchauras@gmail.com

V5 -> V6:
- Added a missing Tested by from Venkat which got missed since V3
- Support is marked as Maintained instead of experimental
V5: https://lore.kernel.org/all/20260210053756.2088302-1-mkchauras@gmail.com

V4 -> V5:
- Removed a nested ifdef from PPC64 for Little endian toolchain
V4: https://lore.kernel.org/all/20260209105456.1551677-1-mkchauras@gmail.com

V3 -> V4:
- Co-developed-by header added in patch 1
V3: https://lore.kernel.org/all/20260205180429.3280657-1-mkchauras@gmail.com

V2 -> V3:
- Splited HAVE_RUST in 2 lines
- BINDGEN_TARGET_powerpc initialized before assigning the same to
  BINDGEN_TARGET
V2: https://lore.kernel.org/all/20260204210125.613350-1-mkchauras@gmail.com

V1 -> V2:
- jump label fix for rust has been moved to a separate patch
- PPC32 support has been taken
- rust support has been marked experimental
- target.json dependency has been removed
- HAVE_RUST now depends on CPU_LITTLE_ENDIAN for PPC64

Link Mauve (2):
  rust: Make __udivdi3() and __umoddi3() panic
  rust: Add PowerPC support

Mukesh Kumar Chaurasiya (IBM) (5):
  rust: Fix "multiple candidates for rmeta dependency core" error
  dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is
    disabled
  powerpc/jump_label: adjust inline asm to be consistent
  rust/powerpc: Set min rustc version for powerpc
  powerpc: Enable Rust for ppc64le

 arch/powerpc/Kconfig                  |  2 ++
 arch/powerpc/Makefile                 |  7 ++++
 arch/powerpc/include/asm/jump_label.h | 23 ++++++------
 include/linux/dma-resv.h              |  2 +-
 rust/Makefile                         | 52 +++++++++++++++++----------
 rust/compiler_builtins.rs             |  6 ++++
 scripts/min-tool-version.sh           |  6 +++-
 7 files changed, 68 insertions(+), 30 deletions(-)

-- 
2.53.0


