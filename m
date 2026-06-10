Return-Path: <linux-media+bounces-64471-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OYiVB/mDKWqwYQMAu9opvQ
	(envelope-from <linux-media+bounces-64471-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 17:34:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B0666AD66
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 17:34:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=knmeKcd7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64471-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64471-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4117D31FB212
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BFB285CB6;
	Wed, 10 Jun 2026 15:23:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F87633A9D6
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 15:23:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105021; cv=pass; b=eO8514O5FVuxFgT7+dr3Xoea/JF5/d5MDrvMNl7LaxNrnYjqNgwe4YuEKH2ZdTweDrmS0cH1Km27wz0EdVJyuZbRnW9RzuiqthNRcBW4uPXLSXBrlOKexG190FTCqIObEFqDJIbhcnVCfC3GCFZeTbsyjG/RYxm1PjFS7fm7Sdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105021; c=relaxed/simple;
	bh=HLSNIkxH7X+mkcTC4TNft77b6jFG+UTH6aJ4cVsmWLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9kBjsQjpePbsKnq74Vlro9XXQaK+j7DPW8jkc1DFBv2Dora1N1N1lyLHOVsK4/y3AGvRCB7c7NuvygKYGbVzcuWFhuT68i0NQN8hOgUaFCXoPbQK7pt3dlo+lFeqy6w6Mjdq1jMpYJjRpXHm12jZryJbOaA2UjWN7nEn1hflzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=knmeKcd7; arc=pass smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891b4934ffso71585e9.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 08:23:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781105019; cv=none;
        d=google.com; s=arc-20240605;
        b=RnwFluD8SpasiYsmayLFcNf6F2JIBU32u9YrgRe/WC/OmaW+cyuxINxgRUzdOX8xwH
         u0YGHrAfgWk3ImcGkyFtXCZWljL0vVMZWfU/3nYfimxwkP1wT1k2vUwQsdff2nqPmr2w
         WA3pfZPEPfzOv+IF0pKGjmNayudqwr23HGl8v8TGVW29poXxe5TAGDadw0B0vT5Rxxt0
         ryUfoDeyO0Xy9urszJwd6u3ICz9cYPHuTGsxZ6e03SHgW73JFuRLqtL0KF/Qj/P2PBCQ
         Rk31uotqXYuVGf6e6W5k8pHSFYUJzYp1n5X9RVzC+430YAnv0WhIhm7dKzfzhP5yGAYk
         Kpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HLSNIkxH7X+mkcTC4TNft77b6jFG+UTH6aJ4cVsmWLs=;
        fh=E7/jxnThAA1XSTrNaKbvc+zf0uiNfYYuA6tNtR7xxUg=;
        b=MR50eoPqy3rzjyu7DSjrtt67hDOaJ/jzBOEnczzkNKFGYDAYT9hcIVaIfziGoDci66
         Kg+FeR/0dvjibOBrpbylopbxctkGOPLTZQkZ+LfYGBFcl9Dg11f9XFJxm0qx6EjfQ5KG
         Lzk8tT5F6H05h1kQ6MomhGs3oopGpxZzN3eo8dSIeD/WcAzdzmuKFw+1pbpUAkuU2MS9
         dj7qkOsRXVq3DKKj0eNrJpBx9gHpF/tYr780JQEiCRK84T72Ruf9Y2h58cq3J0TRou5i
         wyHFIQlkd8zJdA6okYN+fLVAMh5S/R0iXrntyJaVG/eQ0dVIwmDLYCTmcxhvMk14116O
         CAAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781105019; x=1781709819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLSNIkxH7X+mkcTC4TNft77b6jFG+UTH6aJ4cVsmWLs=;
        b=knmeKcd7axdf8Yj6YP1j722vqNKTazQOkcluQXH8VllnvXalQ/uLCj9lsnTvV1f2pQ
         RlMGbLm12TmFmcLMkuqTBT1Wb76e3HC+/kOXkahS8Cy+p2uXhgp7YVz1jCtuQRIjhOX1
         FNqTFBiEZcwATw7OkC/jU3YfVR/TJftCAymf9RQ4pTwbxgDpwFfAeF1pz+l1tuDyrn0G
         KOUNAmLPOHBFXm87LW7ZAPPzTUdI6d/mStrs98zbUKrOcGdaM5243xJaTH/wqxyZAu0b
         W89f9AD/ZhUpvxXWUIbORnHDT03TXJAMR1/eZYCIpfSQJFNp+9beeYD6aGA+UQcXVaeJ
         HaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781105019; x=1781709819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HLSNIkxH7X+mkcTC4TNft77b6jFG+UTH6aJ4cVsmWLs=;
        b=jGivgz5rOTUSKEKrZbTnjSamSe/eoglUU4I9tsqn0wWLzLPUpsxAK/iBY+RH6BlPxz
         DwrlHrGtHaq0rHkkMdmy0UdbEWFCHQ6Z/aPjCswRCqYxRxNXLTms82wjn39I+Exw1N9n
         Y7c1xbYyYt20z5c0fxVXcvGzJLhYJ8rxFUhzjzaFZLXA43IMfvPJKf3BNoHxR9NAC/Hb
         Z7WkbWcuwOEMl4KutsdrXFatk4w/NkDxJozZOvfn68ScJJ9Kx/7N1NFhFOlx2hKcfNsu
         2y3siE5CqAIqixdJknUZJ9WUgwREfwjOpU981n1a3aVCr3S1E47P/lE1FaIOLHgdZEXW
         MHwA==
X-Forwarded-Encrypted: i=1; AFNElJ+1grwkJPYcUWLIT9PQi/KVibAuIm1wvX62ltxYqIxG0q/xWaa1Dp89u3xHYNjM/Fcv/fo/vepHkJrz+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2CtIpbeKfMtg2ueiSZG/3yqGg9/kMUuBOxdyTPjRLilYWo/W8
	JuUHPz/X7XuFusOh1v7xkC6AVqX+NSv7MJNylTEoaJj/95KguR3mZ1IzMM70sLby+86JPtZaqv1
	sqoMCinoJO5zQUkeTSDvDm20yNR4pAsii2+Abbdx3
X-Gm-Gg: Acq92OHVKVcDoy7iRxjW5bGFojgy9z5qQ+E4VDrTvWjdSjgOwSIqseUmI6uVpz35N5x
	RDsRd9E7QrmW0JGZfAa6PiwIIzBvX4azbJHiqDzamxFzibif1Pw4mOEmf7X1fh9qUrrmBbDJ+fC
	KxeVHGJ32uiXLbegP1+Hv2KGXplLE3tQbE2YyfzqPdoZboUFTWAuSYJ7sk7vMRVWWsQds59Kf2q
	xHpNF0ALCVouD78LWpMVi+QbW/L270obzqC0OMM2IO0eFURY13O7VH9cXCeoVoSQbOwGxro6rnQ
	ANgtAFZ80Z1nD8E4bIID0ktqEGT4lHREn05Li/qWxYHrAV2tCANq5VE6Y+ySczuWi8orlD1SVto
	7xzOm
X-Received: by 2002:a7b:c055:0:b0:48a:5aa3:ac1e with SMTP id
 5b1f17b1804b1-490e250419dmr39465e9.3.1781105018413; Wed, 10 Jun 2026 08:23:38
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610142329.3836808-1-sumit.semwal@linaro.org>
In-Reply-To: <20260610142329.3836808-1-sumit.semwal@linaro.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 10 Jun 2026 08:23:24 -0700
X-Gm-Features: AVVi8CeKPjOw-ulqerfXTIRQXgt0wS2BLRdaHk4b32zpbgZavKZyW6IeEygncls
Message-ID: <CABdmKX0K22aaPTrk7Xs_8859ePYQsPNuqcG3v4oMZHK3T0xqKQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: move system_cc_shared heap under separate Kconfig
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: christian.koenig@amd.com, jgg@ziepe.ca, jiri@resnulli.us, 
	hch@infradead.org, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org, lkp@intel.com, 
	agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com, 
	linux-s390@vger.kernel.org, djbw@kernel.org, thomas.lendacky@amd.com, 
	x86@kernel.org, arnd@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, jstultz@google.com, mripard@kernel.org, afd@ti.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:jiri@resnulli.us,m:hch@infradead.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:lkp@intel.com,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-s390@vger.kernel.org,m:djbw@kernel.org,m:thomas.lendacky@amd.com,m:x86@kernel.org,m:arnd@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:mripard@kernel.org,m:afd@ti.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:arnd@arndb.de,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64471-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,ziepe.ca,resnulli.us,infradead.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,lists.ozlabs.org,intel.com,vger.kernel.org,linaro.org,collabora.com,arm.com,google.com,ti.com,lists.freedesktop.org,lists.linaro.org,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,arndb.de:email,linaro.org:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80B0666AD66

On Wed, Jun 10, 2026 at 7:23=E2=80=AFAM Sumit Semwal <sumit.semwal@linaro.o=
rg> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> While system heap and system_cc_shared heap share a lot of code
> and hence the same source file, their users have different needs.
>
> system heap users need it to be a loadable module, while
> system_cc_shared heap users don't.
>
> Building as a loadable module breaks system_cc_shared heap on
> powerpc and s390 due to un-exported set_memory_encrypted /
> set_memory_decrypted functions.
>
> Fix these by reorganising code to put the system_cc_shared heap
> under a new Kconfig symbol, which allows either building both
> into the kernel, or leave encryption up to the consumers of the
> system heap.
>
> Fixes: fd55edff8a0a ("dma-buf: heaps: system: Turn the heap into a module=
")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

