Return-Path: <linux-media+bounces-53411-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LYOH9tOn2n+ZwQAu9opvQ
	(envelope-from <linux-media+bounces-53411-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:34:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F2F19CBEC
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 20:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D10613073A63
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 19:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFED3EF0AA;
	Wed, 25 Feb 2026 19:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VgvfpsI3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9206A3EDACF
	for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 19:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772048068; cv=pass; b=rhqnAZOXFCysZpR0xA8id6KZXKzrkM+VxdllWSa4rbk+2NsRQiBbBTmlYxxfMKGEvcflE+wHIHAB1GHyRsqe1BrVWgOV/NVfQ245VaSMJdUQD2cLrDydUZbA/+qGfS8U7Huew/Ayo8DM1CWv9jHqPTCdivXBUfudHCOfvA/hw5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772048068; c=relaxed/simple;
	bh=7Si8z437tvGEJio1pwGBHAqSsYapkryN7R/ntn+VLWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j5zE922ne5REnZX0fqEBHypyjrJ53Dy+LHMOhygytG1WJBNECjugSOj5XPWxVCvkKSEap8h6HtnzROjw0qZu+AH97n3IdzYKP6rsul+1DQiWMdsHcnvDcWV4JH0jxRjBD5PHVPsw0uC+lXv6YIOUi1DJogmv2pr2zsLwdRg32Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VgvfpsI3; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48371d2f661so10465e9.1
        for <linux-media@vger.kernel.org>; Wed, 25 Feb 2026 11:34:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772048066; cv=none;
        d=google.com; s=arc-20240605;
        b=LUTr49Se3OXJ4bvga4nGsnC0MTTJGXEElo+dcFwryp4AoNowJ3nQghxX+LwpM9p16S
         y+Tcx6HPuosHok+nB7RvfrnDO/bmIcrXCVcA61r60aGTp5m+qGfSWy598/s4RRyJoPcT
         IFx/PpNtxupVWr5aWakcuDAieCdVgxb3ARMDE9Ehj/+9Pva/ep6stjZ0BIo3DDP4j1oL
         78cnqPLKYsLuVDzaP021kr5qctZZDZmq/W28UYrLHmHl2ZEsFY2cyRAVITf99twmVOVU
         nPmMtuYR5cvKVCCf1C0GYWYy9TVC4qF8hcsl6xfCJL+ZUwOZi9JrygWgrz7Z9Tu0XEYS
         qqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Si8z437tvGEJio1pwGBHAqSsYapkryN7R/ntn+VLWw=;
        fh=QLbvPhNN2lJQRwbMR3WDdBzqIsa4T6cVWwSs9ANd1Cs=;
        b=GW4tkQm900gLU2nWgWGrPrDjSxeeE/jRgRO5vWP7knknhkRYtOOn1yg4C39YwoIhOb
         qeZEtO2Q3XBpkw0KRZcHjZowtYyH9r7d+9H32HIk6lMXTnFV9g/d80BSOvNIz/aw8HCH
         faBsExhgN9NahMgt94eBlNcF942VeANTT9j7sDsovkToBxTDF/c9ThPdfZmxu14IjfP0
         ILSd+fxNso5VOPodZ/ueMMGMc43nbfZjy1Ciou2TW6U/YIzR1bF7545GfkmTnYGCwoae
         bW45y0bbZB0f+vpwCh8RkMWxukpwlnpzfBHwgLszWSwhW+dkAgEmVAaoJph6qQgY/P1A
         8qPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772048066; x=1772652866; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Si8z437tvGEJio1pwGBHAqSsYapkryN7R/ntn+VLWw=;
        b=VgvfpsI3YA82GWltXb8Q27snQKoSdr2KXh8Ev3WKlg1GxNimmA7b33ng6E2/CMjTXA
         Jiw/KaBi8pPZqYiSAnVjRPOTiiT8bVMsL3QhbDQUPlBRCvzfxCVmUsRV9iO+cDiMfpVl
         zhV2zp8sH0z9gRgh/bINBIQurIEhlcBcko0/c9uAtjg7GPsYf4YfQYbYMDa0MotyO2DR
         bUwa5FktvJYOpoiETM65fAo/iQBhwglhDpwI+z7Ff4Was9LXFDFPJ44AZizAgcnuqNrv
         OiN3mtw09NuMfcR+Z+dY7V2apWyFsjw17XxfejY6wEnH2umUbPLA5VKh0rUSJH9X/1Vr
         jclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772048066; x=1772652866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Si8z437tvGEJio1pwGBHAqSsYapkryN7R/ntn+VLWw=;
        b=MZwS0VlliDmOd3q5ZRSThy6ATXmLkOTkjeA6nDA54DFjDj8/kB6Y8slzmmzVA5s2WM
         /iDjxZqtnAQYFUndK041/fh8r8BlHD9PULwhn5kMhsL2uaef2qCtCopjFOOUtia/4qKJ
         63kUkLTzInPdvvmjGtDvniwp0Qvo3h18FHWwWNf+dkhHZX+6ap3fPhmKDgSTR+OcDLZF
         jPhWDE2hiZJl2gLO01J8lxgwYaIzl3l1t6Zxhnp8mBLNlIc4f3ymPGd21Cgh1NMMdY//
         eESlvgADgJDcNZFLYOZh98on1vCpjKmNNkNxUGt3uHsrO2ThyHhBBWKixXyItJf9E8qc
         +ivQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUnIVOvSdFtpmjqAOTDxIYGVU5isGfT5DQIFB40sShBot+de4aJKjrpOKtwWB1azv+otUwcts9yZShqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO/ELpVXSndu4Prl4oMgKbBhy8thAGIXOz8WqA+MODpp9s9r+0
	KuDNMXGDoPx11+yVMAH3OUhggrwFEkpVVdQt2MAfAAAx4IdN5YYuX+avdDSzx+bll6eM53/qmwl
	7ktX+2HAdr+Bitu6v8J0CTHPptXC/lo1djTgQ/tBu
X-Gm-Gg: ATEYQzyOq6xIZ73iED+d/20cHXk3iYqvVf/UKEL8xlyLOLcTPYUMHV1gQC9VxY9qo6I
	raMIKtBP9PoBGVEgTzpxM6VP6a1rQFklTPgUqSosa1BJg0RQwEkPPjFdlnWfeiVkZ4uiq63C0vK
	9bjQLOTfpVidyJPtN2fA/hKLmR2rCOLPh5dYNbiv5NbdUSvzhgIJ2QeWgqxvtydpBBLDl4IIz5h
	T0rB/WevzwOJvwh29Y0qyw+vge7JelU4tSQqskkw8aOgWBeJKaYsSd/XEoKWedShY1AxBYXePcb
	i1LpF6aCF/MiI5BwBduS6H/gcgjh/hNFfb9fSPJC8bOcD+yjTXdvuYg33Y1mZSD07HfHpw==
X-Received: by 2002:a7b:c059:0:b0:480:4a7b:228 with SMTP id
 5b1f17b1804b1-483c3195488mr93045e9.1.1772048065599; Wed, 25 Feb 2026 11:34:25
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org> <20260225-dma-buf-heaps-as-modules-v1-2-2109225a090d@kernel.org>
In-Reply-To: <20260225-dma-buf-heaps-as-modules-v1-2-2109225a090d@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 Feb 2026 11:34:13 -0800
X-Gm-Features: AaiRm51mS0fj4CpzrUrBMi_FPuw0tp6YT-qMjNhlthEAQ04zl32goABU8oOB09E
Message-ID: <CABdmKX06VsekPpwairaWC6JuH6BHMj-NqJj1cYgR=-rd6iY9ZA@mail.gmail.com>
Subject: Re: [PATCH 2/7] mm: cma: Export cma_alloc and cma_release
To: Maxime Ripard <mripard@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53411-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D3F2F19CBEC
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The CMA dma-buf heap uses cma_alloc() and cma_release() to allocate and
> free, respectively, its CMA buffers.
>
> However, these functions are not exported. Since we want to turn the CMA
> heap into a module, let's export them both.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

