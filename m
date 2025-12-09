Return-Path: <linux-media+bounces-48466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A747CAFCA2
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 12:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 513FD30138D2
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 11:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF0F2D238A;
	Tue,  9 Dec 2025 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMuu4qgy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1766D2D3EDF
	for <linux-media@vger.kernel.org>; Tue,  9 Dec 2025 11:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765280240; cv=none; b=BcLsnOT/arWvSBsUH59lNfmUbytE4sKFAeOv9s89tpYMf1MUdC9h4A5GsUd2sEd8cFBOZYs1Wv/G/rTTOYtVFJJqntsVx17RF8h2rV9CcK8IHHM+RFZIlu+VQoYzGS6yJcNMdg/htyoxrmD4EtgNJm9qjr7mtkl3Z1YpYptrcVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765280240; c=relaxed/simple;
	bh=ppzKX/vO5vS33dOwjUpe+y89o2YZSacLN1rLs+Hs+Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lK/OaiC/5N2aw72qchOZPcsW7949C2sRN0PcO5dXM22hsnxfadWNz0Zo1kZpfuCUXqq+cUOfUBBEyNDdy49YZE1bQPuNhs3p4B6BdNnaLbJS0bxlfzaqPppNzbyMmp0KOD5yKgWd9UIXy6WUlujtX/obCkEMyfKP3MhGxBQASqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMuu4qgy; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4eda77e2358so47038771cf.1
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 03:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765280235; x=1765885035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bV6BUSUnHPWqxSVdvnJzA7cFI5OKa6pmer3aetETyA=;
        b=eMuu4qgyEcjD7iH8ro7Vq6cdrZFb3JF+b4UFtXVSQc7ml3/KtmsXFWCjpZwLUOPeGZ
         7z8uZt7OsagNmmGXy88wHsYpycoutMxALyD1GwQv9usTysE+LwYmg6NZV7fqBh18fUFj
         EHAUMZtsFYnbk9sq6jepCGGCwnyX49k+Omg+hOuWr2W7zVuA28AuX65QdZBo7vSOi5eu
         2gAx98Zahy3rd8zfJsQsvQRBffUWUJYQyhERuGN/TKUQu8LM8OKcp2YEIIwxyiSWv4V3
         3JxOnDqAvQoyNdAuQlKrODuoldGpv+1qWFDanY1DzHZQ99nTDvEecpFO8hR0/F/yYtrX
         Tbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765280235; x=1765885035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9bV6BUSUnHPWqxSVdvnJzA7cFI5OKa6pmer3aetETyA=;
        b=TMeFNfPUlgHxg8unoemdpmIB7KNN7GAW54wEG/ZItlxOR2ftW4aA5zOJDr+eD2JwRh
         F7EP8sRxXtI7/2RvXGZVAUEaP5R9lr/0M2mZ8dKYWTlIJCuBvp+FBzkmBOThl4TBPYse
         nAXKwwjmFlDHZ8C/4tCBnQb0bI1kd5572lyIhm9GUClmE1WL9Pn+stEGrDJzF/Se+7rA
         Rn1zcYQFIB6LOaBq7ANokS1fBvuoISzBg+MH3ZvplZReGSeVNGTaMxj0z3rVMxBaGW4T
         5dk2d3VUGdJ9YO2+pMjOXNmIzoRYbOYXnxsxraWkYh4WqDq/1Ny0UgWyb0HQlGy4jxxt
         vhOg==
X-Forwarded-Encrypted: i=1; AJvYcCXuO0TNGKHeYXhdkr1yjgGrFhfiigoNOGf3MTyAXdo8PUij9uayFMt3eHMR7/KErf+9eHXcBdkTe/KQQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZlGze3dh3pJltu4RKC0rBrpiSIzY9KAXggpOrcHoN4BOQXc0c
	2HT0a438Kicu7/1qx5HcReTenm3ZX4yscnjeuTT74/ea0btezOlabXUR/RrRuK7oBC64FpE4Uhl
	dPTsHwvPCRvax3cHjmVEZSnCqOMoSLac=
X-Gm-Gg: ASbGncuB+FwzJTQOWvsZH0D2z1k8D1zcoiPBPV3NWwAsOM0PD0jiS202gJYQbCI/X8G
	QdmgQcgNqeV8PY1OKP5Yv2gTxXqfkljVKIAqVBkshWLDRI4tyTJXIpOWoGh+OGObCva8rJkYFYf
	ctlfbBfllFatsR4BE4yNvLofLuCLpoPC77yWRxD2Tq1ReKF0TKnURe6XZ/BEzu40UpPeaaScY8v
	9vokEOm7W/8FKd53d11fin+SF5/DtOeYyHfmizINk6cfMDestklEp9Gm3tApXtfyX0Dz9IqGyGQ
	qJqUAXUH
X-Google-Smtp-Source: AGHT+IEgbsVwagKy3txxv1x4OgD1iaDpms/Rm9Y2qf5oR10n0oOAuFdSPhVPEDts3ojZlS6ZhGmu+kq1Qgj4bmperDM=
X-Received: by 2002:a05:622a:5147:b0:4eb:a10c:de05 with SMTP id
 d75a77b69052e-4f03ff1d52cmr163023291cf.55.1765280234537; Tue, 09 Dec 2025
 03:37:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3da6a916cd6d489690b05d2bd64a2b3a@honor.com> <CAGsJ_4w-XtJ8zzc8H4OwW4XV21T8FWGxeoMnfAxmAgBhzrvxWQ@mail.gmail.com>
 <6f891b70-7ee9-44a3-92a1-bbeb4d2b9fee@arm.com>
In-Reply-To: <6f891b70-7ee9-44a3-92a1-bbeb4d2b9fee@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 9 Dec 2025 19:37:03 +0800
X-Gm-Features: AQt7F2oS6lqTycELkQSIDw5s74y2U5FK96sITwzfzf6-Pu3qUIktYbBDSrphSI4
Message-ID: <CAGsJ_4xb--mwsPHVFXzcpnZ29Wh8N-OTZNyNVW2CZd-U00A_ww@mail.gmail.com>
Subject: Re: [RFC] dma-buf: system_heap: add PTE_CONT for larger contiguous
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: gao xu <gaoxu2@honor.com>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "surenb@google.com" <surenb@google.com>, 
	zhouxiaolong <zhouxiaolong9@honor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 8, 2025 at 6:38=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com> =
wrote:
>
> On 08/12/2025 09:52, Barry Song wrote:
> > On Mon, Dec 8, 2025 at 5:41=E2=80=AFPM gao xu <gaoxu2@honor.com> wrote:
> >>
> >> commit 04c7adb5871a ("dma-buf: system_heap: use larger contiguous mapp=
ings
> >> instead of per-page mmap") facilitates the use of PTE_CONT. The system=
_heap
> >> allocates pages of order 4 and 8 that meet the alignment requirements =
for
> >> PTE_CONT. enabling PTE_CONT for larger contiguous mappings.
> >
> > Unfortunately, we don't have pte_cont for architectures other than
> > AArch64. On the other hand, AArch64 isn't automatically mapping
> > cont_pte for mmap. It might be better if this were done
> > automatically by the ARM code.
>
> Yes indeed; CONT_PTE_MASK and PTE_CONT are arm64-specific macros that can=
not be
> used outside of the arm64 arch code.
>
> >
> > Ryan(Cced) is the expert on automatically setting cont_pte for
> > contiguous mapping, so let's ask for some advice from Ryan.
>
> arm64 arch code will automatically and transparently apply PTE_CONT whene=
ver it
> detects suitable conditions. Those suitable conditions include:
>
>   - physically contiguous block of 64K, aligned to 64K
>   - virtually contiguous block of 64K, aligned to 64K
>   - 64K block has the same access permissions
>   - 64K block all belongs to the same folio
>   - not a special mapping
>
> The last 2 requirements are the tricky ones here: We require that every p=
age in
> the block belongs to the same folio because a contigous mapping only main=
tains a
> single access and dirty bit for the whole 64K block, so we are losing fid=
elity
> vs per-page mappings. But the kernel tracks access/dirty per folio, so th=
e extra
> fidelity we get for per-page mappings is ingored by the kernel anyway if =
the
> contiguous mapping only maps pages from a single folio. We reject special
> mappings because they are not backed by a folio at all.
>
> For your case, remap_pfn_range() will create special mappings so we will =
never
> set the PTE_CONT bit.
>
> Likely we are being a bit too conservative here and we may be able to rel=
ax this
> requirement if we know that nothing will ever consume the access/dirty
> information for special mappings? I'm not if that is the case in general =
though
> - it would need some investigation.
>
> With that issue resolved, there is still a second issue; there are 2 ways=
 the
> arm64 arch code detects suitable contiguous mappings. The primary way is =
via a
> call to set_ptes(). This part of the "PTE batching" API and explicitly te=
lls the
> implementaiton that all the conditions are met (including the memory bein=
g
> backed by a folio). This is the most efficient approach. See contpte_set_=
ptes().
>
> There is a second (hacky) approach which attempts to recognise when the l=
ast PTE
> of a contiguous block is set and automatically "fold" the mapping. See
> contpte_try_fold(). This approach has a cost because (for systems without
> BBML2_NOABORT) we have to issue a TLBI when we fold the range.
>
> For remap_pfn_range(), we would be relying on the second approach since i=
t is
> not currently batched (and could not use set_ptes() as currently spec'ed =
due to
> there being no folio). If we are going to add support for contiguous pfn-=
mapped
> PTEs, it would be preferable to add equivalent batching APIs (or relax se=
t_ptes()).
>

Thanks a lot, Ryan. It seems quite tricky to support automatic cont_pte.

> I think this would be a useful improvement, but it's not as straightforwa=
rd as
> adding PTE_CONT in system_heap_mmap().

Since it's just a driver, I'm not sure if it's acceptable to use CONFIG_ARM=
64.
However, I can find many instances of it in drivers.
drivers % git grep CONFIG_ARM64 | wc -l
     127

On the other hand, a corner case is when the dma-buf is partially unmapped.
I assume cont_pte can still be automatically unfolded, even for
special mappings?

Thanks
Barry

