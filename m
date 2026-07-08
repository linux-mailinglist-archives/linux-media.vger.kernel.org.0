Return-Path: <linux-media+bounces-66975-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zLsHGMg6TmqUJQIAu9opvQ
	(envelope-from <linux-media+bounces-66975-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 13:55:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A5C72610E
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 13:55:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gCnsAKSY;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66975-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66975-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 957F2302C487
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 11:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1A5436BDA;
	Wed,  8 Jul 2026 11:53:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC18F434E34;
	Wed,  8 Jul 2026 11:53:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511631; cv=none; b=qfXyIKprx2qK2GszCIQ+9bnEyZbu21Zv3j2rAAwOi12qDKRT/rE11PS1ajyseP9BdeVebWiSsHuS5VMlvtM+yVIVx/xLcq6m14aopd9WfGiKXpkhTLmnf3gSCNyCAqyNOK97w37zjqIzRdFIG/0dejg5nhr8QXxaFzfcrLy17uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511631; c=relaxed/simple;
	bh=GFw7D/JMS0BsuGX/tR7HOdbhomGNW/4YluYwoedfrRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=s7t2NDv6WYzM1UQCah4HOu/5RUopaGHvh664Zzbz+UFMGZ0tX2lJdBb4f5FmMW8Mlq/VHCH5aiwJn2YIRcV+mANp0tyvTlkAuP5pgtaMSsuJwgIKH1b9+YMM1crl4oMnv9ZPQuKeJC/dblr0EvEyGoH5+loMAfoC0aVPGKqmCQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCnsAKSY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211EA1F000E9;
	Wed,  8 Jul 2026 11:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783511629;
	bh=rdxl7IdBBRnl/VjmGlLMS0ydVwD25wn/ZqHLovQ6J6I=;
	h=From:Date:Subject:To:Cc;
	b=gCnsAKSY+e6QbI+E+K7+TivToH0yJwdaWxYXBes+wU8hsG0n0ifOMFczy/pA5VyOD
	 c+Fgnq+QddgwI4x7CFLcN3oCn5ymePLeucyEQ8EVgK56u1YAFpw1JO1f+EFZPc20Uq
	 ref8rB2EbglbPiCVHMADGqYvGXCc0SpneRRs6vIKc4tMWPbg2GfwSU+g0sKzrYmyX3
	 Rp1o7wuSniLXA33RteEWnIKrazXENCrXN723ImJ8KbD1K7khmQUCEpTANVDHpiNIvx
	 F/hu+632nGu7qojRmvN2+Ah2GILBmvhw5FVZc/WHtRQqRaE/yjhiK1kUxaWbk1ybxK
	 /alm3AcHuOPig==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 08 Jul 2026 13:52:21 +0200
Subject: [PATCH] rust: helpers: guard dma_resv helpers with
 CONFIG_DMA_SHARED_BUFFER
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dma-shared-buffer-config-v1-1-8c1571000855@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPQ5TmoC/yXMTQ6CQAxA4auQrm0yg4jGqxgX89NCTRxMC8aEc
 HdGXX6L91YwUiGDa7OC0ltMplLhDw2kMZSBUHI1tK7t3dldMD8D2hiUMsaFmRTTVFgGjNEfT5x
 j77mDmr+UWD6/9e3+ty3xQWn+/mDbdtC4iq58AAAA
X-Change-ID: 20260708-dma-shared-buffer-config-bb135fdb61f4
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Asahi Lina <lina+kernel@asahilina.net>, David Airlie <airlied@gmail.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1895; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=GFw7D/JMS0BsuGX/tR7HOdbhomGNW/4YluYwoedfrRI=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqTjohxZF84h7fJ2UmPYxqA3vKydhfq68R9bG+u
 XHX9BC8+nyJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCak46IQAKCRD6UCkIqsW9
 0KbgD/4qZPbBYIIzwFdYkfFfWNNcSR/UjYKuc8ShlJJMJuVC+okSfR/t/PEmKH/d5rWhgoZKSQI
 wakFdKarTn2mL5aUUGzxVg3c+XZDhMsbTn7ORMkIXS0xJb/i1Al8lq7zRIvtWqo+yxdG35npfY8
 Br2odXPH9fId8f7pZ+1tWTJNxjk7xHSooaqmHwGJe9Tb8ZvED7IzQq/tdCB3II/Z9gfJDJToBVx
 cefsOFlTGR8bZJ7p6jY177YFeuCrQbK43Q7ayEUpnR2obYAIqpX8kTHt2W/LIV+/74DfhxE0jJy
 EHd49f+i66phQnOhTnAWgSWZH3tHIudzPfcnKC+PmJyHqOOtp+WyAZXjO0lnTVKGFpZF4nqJLVb
 rtLItXxPl7+HQE/ZvaD90Qy+fD2DSUNpSn2m0yZFDRvxBJ2iYD7CRm010mrzqXVePAokiD7tA5y
 Eu3jvLQ8RHO4FMch1BE3MCmfZXUs2qVatz8njLXLJNrNaaYK78M1yVAlcDdETAkEfr8seGYf11F
 LtAH7YfmA88CYenw8iKSvX6vHMtU5LteV3Pb5UfJhy54fF59Z3z9U58YVDHNPKltY6xeb2pZMlW
 lDanf/t1GhoEViAW/wHPWS7921LNLacFViQ/gym8xnBZJ8Y555VO6287s0vXMjWsFdrj1dN9fiX
 a93sMYAhVp+8LwQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:lina+kernel@asahilina.net,m:airlied@gmail.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:a.hindborg@kernel.org,m:lina@asahilina.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[a.hindborg@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[linaro.org,amd.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,asahilina.net,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66975-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a.hindborg@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5A5C72610E

Commit 9b836641d3bf ("rust: helpers: Add bindings/wrappers for
dma_resv_lock") added rust_helper_dma_resv_lock() and
rust_helper_dma_resv_unlock() unconditionally. However, the dma-resv
functionality is only available when CONFIG_DMA_SHARED_BUFFER is
enabled, resulting in the following link error when it is not:

      LD      .tmp_vmlinux1
    ld.lld: error: undefined symbol: dma_resv_reset_max_fences
    >>> referenced by dma-resv.h:463
    >>>               rust/helpers/helpers.o:(rust_helper_dma_resv_unlock) in archive vmlinux.a

The dma_resv_unlock() inline in <linux/dma-resv.h> calls
dma_resv_reset_max_fences(), which is only compiled into
drivers/dma-buf/dma-resv.c when CONFIG_DMA_SHARED_BUFFER is set. With
the option disabled the symbol is never defined, so the helper fails
to link.

Fix this by guarding the helper definitions with `#ifdef
CONFIG_DMA_SHARED_BUFFER`.

The only user of this helper is the DRM shmem abstractions, which already
depend on `CONFIG_DMA_SHARED_BUFFER`.

Cc: stable@vger.kernel.org
Fixes: 9b836641d3bf ("rust: helpers: Add bindings/wrappers for dma_resv_lock")
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/helpers/dma-resv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
index 71914d8241e2..1698092b9317 100644
--- a/rust/helpers/dma-resv.c
+++ b/rust/helpers/dma-resv.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#ifdef CONFIG_DMA_SHARED_BUFFER
+
 #include <linux/dma-resv.h>
 
 __rust_helper
@@ -12,3 +14,5 @@ __rust_helper void rust_helper_dma_resv_unlock(struct dma_resv *obj)
 {
 	dma_resv_unlock(obj);
 }
+
+#endif

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260708-dma-shared-buffer-config-bb135fdb61f4

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>



