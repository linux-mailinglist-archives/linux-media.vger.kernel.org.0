Return-Path: <linux-media+bounces-64596-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dJ+HDDbKKmo6xAMAu9opvQ
	(envelope-from <linux-media+bounces-64596-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 16:46:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A43672D0E
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 16:46:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=oKTF1xRk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64596-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64596-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D49F3387403
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 14:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035D1304BCB;
	Thu, 11 Jun 2026 14:45:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADF52AD37
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 14:45:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781189147; cv=pass; b=oLPAlOWg0/iCmc9RMe8tXiwtbwtk+uAOBSu09tCa36X01emQXeRDG3iMiBr7cWpKd8XSPD5UQTG3WFDjtjAo/8b3f4Chl4RSNAACxp6GXq3MTsO281gjWOCMgR55hzGVYFy1QCGSQleJnIOoRia1IPc4kemD+iibzKyO8RSHTqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781189147; c=relaxed/simple;
	bh=ZwBSIB66d1tL230+mKEjlH+JNTqmf3KSiuoOfRL20sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEOehORnhbjFeb65AtBtKULI6hi07E02OAVb91j9hgcJz+xa5zKfcJqfpHHxxaO8kjWSIdSJ8xz6Dgkg2aOigPEL7A9Z1F33zyac6/M/g59HpsMI02lW9/OQtyXAcpxNN33I5trzh2MBnOI9fD1VDd3qZxI8QHsNDgtgSc/foDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oKTF1xRk; arc=pass smtp.client-ip=209.85.218.51
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-befd83e0521so217767166b.1
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 07:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781189144; cv=none;
        d=google.com; s=arc-20240605;
        b=GD7UjORXeNU5LOogF58+Lh9lyIUQ511HKyNpeJt+iGhEkpbg71NYFe8swyqegZQBYK
         4tnMtXnzo7cq9gbrtRi7CfNeyA2K05TvyNbuyZfqZmabZV7Wx8qkFlplkzvrL5oC6xO/
         tmHSq3aDRXLs9JzX2w5jkxOSvW4yJCXQ71uxg7EVFWs/FHba9T53SdsYE5QvOP7G2ig+
         7635PgpJ28fZu/zjDoaKy8DqipxyygvniAjO4ICXwIxgKqxKZ2KJUYaIrGrOYzXnpYhi
         vSotWNMBsxgJomAfmIyAKTGwaaCGmSJEC6b1zKlgaeDtN8NpAsC6m6CX0x0zrKUdHLzQ
         tKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d1Q6VrmJUx+o7NgXdFZxExU41NgoiFIjQElz0CF6684=;
        fh=DhDZAftil3e2Zn0rWeyki9e3oWq5gAhx2aZfoHH3uy4=;
        b=EtHEH2zj/+fu+rInIWHIHffn9s7llfbfjyg9Uj7WfHAvH4DGYFbNkLLcRdZzQ5Ci8i
         c6XEAmd/WVm6CTAR47D2kK0mzT/iy3+4bA9+M+VsGZAfb8tQsjjE9xhMFKz92KMD2zVT
         SUaigB5lj2hqM3Uc/9LMrz4gFtkv1jE3o2uGsqSpHLoljM/z47a1Jejxph5gGE6lt+QY
         CeSqDi4swL3/9ErBqMH0KsR1TuUjFVL93bZcsc0oyXVKkVHxvBnWTLW1DnWIKkYFUndk
         7xuO41vHPQHuW+d1T5rwkye6msdXgpVohig66eZ0DT2nBWckP+KEv12ugaFD9NBLOOlb
         PkUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781189144; x=1781793944; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d1Q6VrmJUx+o7NgXdFZxExU41NgoiFIjQElz0CF6684=;
        b=oKTF1xRkGsnpLk64bMT7Of1ScwuLfP2HoSZUImbFDHaOIM7jrZ3vAxGbuIORM6uAQe
         kE5Swb551sovL0ik3GX5PbqyoHeNc//xeY5idvrcdwvf6gSeYeUiqgCNT6yemDqW0qBE
         tjI+kIWj+xE4NWVxrFmqjpINnAtTsgnD5odgG38Z5WFtpmwv9fkrgdp2Xr+gyIMUAQnk
         EOceaM8DLDcCj3u9saT4LWxrhPNU/NA5c1NIT9TIOIh4STIR1yC54AwV00ugBcrhnpHk
         XIg3NBWZhE8ZxGgLQ3p0BGadefN2Mc3HaP3k1ZDGFeoDbI6UfwGqLlI5KWHK5gleEI5i
         X9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781189144; x=1781793944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1Q6VrmJUx+o7NgXdFZxExU41NgoiFIjQElz0CF6684=;
        b=M7QDMV6EzFYm00Juea7efvAjHQgALt5JGzppLcJFjWvF/neCIBFwinAbUyZCIJh8Sz
         13H3Z88JUg9oMV5L47vYyCpH57idvmWBoEo7doLbKJMDeWUGLYjHHuVyIWU1g4luDr/u
         Taf6BN9OV0qxYllmSCZKeRN4ku47ubCs8qxOV5h+hkOUndiHsopqY0hlK1qXgpT0xoG9
         zS1/fFDYYYVouLY+87e3aG06dMbbO8DUqQTNtPCWee3HImLPL0Neb8g2naVseDH+BvyR
         JNp3tTJJhZ1vfxuM6JY22sIsGyM8dUZIOwi8vTXjZvX/2niEdhb3LBbnRnuBBaENUuEZ
         tF1A==
X-Forwarded-Encrypted: i=1; AFNElJ9b4kGwINn92qE1WYo5jFufv9zf8tEENuiXmQ9x2FZ+yhERcLghshhJZDbrRtj+bwrdS3o3X6B9H4JnwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yynq4SPVFa22keJJNtHiC0/s6se+s+nyqIQYdYpdfcK5KBcYWYD
	vn5quEltt30OswsoFur1xccTZNZz8tWYssJUDTEFL6e3H8o9wU9hEB+D8AoqJAW9XrLExJEAQyU
	/6EsP2kJVNx3NkjhOZ/l4nMPbXRBjV2+RGr4U911frg==
X-Gm-Gg: Acq92OEnsUXlVmdFPL7hvCgsolo66v/l2guuE3M7i2XLf4I9267OAFUT6LmdohDH5Ci
	A7/GFiUmpLSwXrwApJnjnI8c7pwCmgPtZ8aM46H7edykFHMQoghYI42VI31/2D0d6smR3Ak6dZs
	mMWOXxrRi+FxnXEuT8TBSLyrmycp+xy966/QP/iHvGfV73IKgM4tXOethwRQtLWt7vIHSX8nZFI
	lxY9aM+P/TPbgwn2KkDlNxdptPhjc8tTV9NhKeb7SVj1L8GJi2B+6fLG4tm9KVwQHzFIQW1TFQj
	DJMGN/KvCB3ni5vsTk+b210zRWZm1ytBPhzR3Z6/NFgM7NVyD+snCdum8g==
X-Received: by 2002:a17:906:4fd1:b0:bee:a39b:ab7b with SMTP id
 a640c23a62f3a-bfc78ed6c4fmr158181366b.31.1781189144237; Thu, 11 Jun 2026
 07:45:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610142329.3836808-1-sumit.semwal@linaro.org> <aiqLJUrJ1dnKhsJn@FV6GYCPJ69>
In-Reply-To: <aiqLJUrJ1dnKhsJn@FV6GYCPJ69>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 11 Jun 2026 20:15:32 +0530
X-Gm-Features: AVVi8CeA1CWJ3Tf7y-K-ZwxKVWTsZOKhQeXrR2LoMbjQ-zl-nOkzKd4bOJvB8OA
Message-ID: <CAO_48GHEfq7wpvM_4OXcMhgdASgH9J96nhEd0QFh2Rg8aPxpfw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: move system_cc_shared heap under separate Kconfig
To: Jiri Pirko <jiri@resnulli.us>
Cc: christian.koenig@amd.com, jgg@ziepe.ca, hch@infradead.org, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org, lkp@intel.com, 
	agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com, 
	linux-s390@vger.kernel.org, djbw@kernel.org, thomas.lendacky@amd.com, 
	x86@kernel.org, arnd@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	mripard@kernel.org, afd@ti.com, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jiri@resnulli.us,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:hch@infradead.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:lkp@intel.com,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-s390@vger.kernel.org,m:djbw@kernel.org,m:thomas.lendacky@amd.com,m:x86@kernel.org,m:arnd@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:mripard@kernel.org,m:afd@ti.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:arnd@arndb.de,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64596-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sumit.semwal@linaro.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,ziepe.ca,infradead.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,lists.ozlabs.org,intel.com,vger.kernel.org,linaro.org,collabora.com,arm.com,google.com,ti.com,lists.freedesktop.org,lists.linaro.org,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.semwal@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arndb.de:email,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:from_mime,nvidia.com:email,resnulli.us:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78A43672D0E

Hi Jiri,

On Thu, 11 Jun 2026 at 15:51, Jiri Pirko <jiri@resnulli.us> wrote:
>
> Wed, Jun 10, 2026 at 04:23:29PM +0200, sumit.semwal@linaro.org wrote:
> >From: Arnd Bergmann <arnd@arndb.de>
> >
> >While system heap and system_cc_shared heap share a lot of code
> >and hence the same source file, their users have different needs.
> >
> >system heap users need it to be a loadable module, while
> >system_cc_shared heap users don't.
> >
> >Building as a loadable module breaks system_cc_shared heap on
> >powerpc and s390 due to un-exported set_memory_encrypted /
> >set_memory_decrypted functions.
> >
> >Fix these by reorganising code to put the system_cc_shared heap
> >under a new Kconfig symbol, which allows either building both
> >into the kernel, or leave encryption up to the consumers of the
> >system heap.
> >
> >Fixes: fd55edff8a0a ("dma-buf: heaps: system: Turn the heap into a module")
> >Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> >---
> > drivers/dma-buf/heaps/Kconfig       |  8 ++++++++
> > drivers/dma-buf/heaps/system_heap.c | 16 ++++++++++------
> > 2 files changed, 18 insertions(+), 6 deletions(-)
> >
> >diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> >index e273fb18feca..a39decdcf067 100644
> >--- a/drivers/dma-buf/heaps/Kconfig
> >+++ b/drivers/dma-buf/heaps/Kconfig
> >@@ -5,6 +5,14 @@ config DMABUF_HEAPS_SYSTEM
> >         Choose this option to enable the system dmabuf heap. The system heap
> >         is backed by pages from the buddy allocator. If in doubt, say Y.
> >
> >+config DMABUF_HEAPS_CC_SYSTEM
>
> Nit: "DMABUF_HEAPS_SYSTEM_CC_SHARED" to be consistent with the heap
> name?
>
> With or without it:
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
>
Thanks for catching this; I'll fix this while pushing to
drm-misc-next-fixes in a few minutes.

Best,
Sumit.

