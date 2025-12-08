Return-Path: <linux-media+bounces-48383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99695CACC8B
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 11:03:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A594302770B
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 10:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197872F6929;
	Mon,  8 Dec 2025 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="im90Neea"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0814A25A34F
	for <linux-media@vger.kernel.org>; Mon,  8 Dec 2025 09:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765187589; cv=none; b=BgsuMy43D4PKPqT5/o6DoU54Stj6unCczHGQbYzUsKYpqQffvhRyx+hVVN/vulSJ+SyKG+jN5rI/s/msSst4kvk04KCM4gZXb6SB06E+ynrwOnAFqNmW74hmyQYY37sac9u5QI+olvhvTzZehMZHqwDsCiCX6Y4swkBCGuIu6oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765187589; c=relaxed/simple;
	bh=1sM32WeH2jVyY64qANlJiXgkX22XEyx8ykYLFAD02P0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3WIjfFKth5S4GHF0MjsHxYcDLzxOj9Wmk/HZli+1BhB9nAH3t+u68LecfzfOjGcWM24e3L4yCCyk4/p7cZipqdsY5PmQSPsgj3EGRFuLzsxM538mB2d4/pcoUwVXeI52CG0SO0iKO0plBi6dFkTcbc0bQrKsyrzWkw+3N7ClK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=im90Neea; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b2e530a748so360420685a.0
        for <linux-media@vger.kernel.org>; Mon, 08 Dec 2025 01:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765187584; x=1765792384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sM32WeH2jVyY64qANlJiXgkX22XEyx8ykYLFAD02P0=;
        b=im90NeeaimiPwh4aQtUFX19nPv4h2n17YLdHjNgMscvnHRu2pFCKC615mOSM8oVMLI
         AeDtBhRJvYG2Z0Nd80MtpWeaJiPHXXwPHzjD1EO0969gu3dWkzgLmSlNAyHL/j8Q9rKq
         zLh5uUMYwPPlxMEOuhFODgKF7crr0fuUXWZf1ieWSU3awE+Cd6eBYO/YVl4LhU5yj/EG
         v5ZNNgzBNxebMvZ/eWtUU+PuDcUU6Yv4SF1JJ7Nn4XjbfVdJM/jdqibWoAFUWT7OyGDh
         pVcEW14uO2QroDXnrzwVL/oyvhi8ATxjencFylH1xJ1YY1RmYxzHTWOmeLPKaDHo4ITd
         drwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765187584; x=1765792384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1sM32WeH2jVyY64qANlJiXgkX22XEyx8ykYLFAD02P0=;
        b=fa7ZH0vSVNb3eU1QtN27pnqbw9R2nxXMgC5oZ03qV/QNMt2TVhypnAd8P7Pq/IGpfF
         moIRVKi+ZdmFsZSvGAhwXjifwX+zFlJfzSUnIvfDx5mGReNQ3ZpPrUCGqje1QPMpopef
         PjkM3Fwl5hMIKoSV4KDYMWZm7+wm7rFQ8Fh9OQ7nV+bLjGTi3ThXW5Z0Z0n1A6w3dFMg
         7q6opcRiQfoTa4CUpjThA+vYcyIOyoMAdwQ5JinEqvP2S0kpO3JaGiEE+sQ3fzyp9/xk
         OZTMuZ0YIG27nBwobuF+JgDFPst01l9hQgItFq5q0nSsQsctLpXa6e0UC2M38iurblgJ
         8Ntw==
X-Forwarded-Encrypted: i=1; AJvYcCWPRA6rwjAInBxaaVCaGPlSU0mF3Fihy2LjfzwzRy47Q0oU+Ds7lnlxMJ5lxzVUWThWHOqyeeYaG07SpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKMUnDuV5w46WyJ2XAxECaB2f/ypQgEmFsp+FCEnfauUt/kU5O
	QZU5YYGMgQZsRmRCCbNNahj1kVk8K3rHrdkpBf0X/BJDh1l8zkQp78NAHMG6UadDvyxjtpq+EM+
	nJR9WJ+ySK+PrPj6tos1PGSxQpnMxphc=
X-Gm-Gg: ASbGncumdaoINZFUzvqG3cMr0PEuNrEOD+8gHDF0glYu3TfAWj07Xa8U+Rbv4qWXnnT
	dslptHGmgjhvinpEEp1JnkH6XJEZNCz1EjXYNZuaAbrc4vk/piQdbzkE5pF3lMwO/BEO1wwcbjI
	+x1YJMzI1y1ybZzpvFFmq4NQw8lvbSeKmHHZRzEVtpTHpT3zAz185Bt6zmyNPGdv7eSITXMFgMo
	aOM9zKF5OjU03iAVB6QE/SFAW94VH5b9XW7XgVNmrgYALAmQIjAWME9zHSEzluAg4e0TImc4A==
X-Google-Smtp-Source: AGHT+IEj0uEs1F+oCvQ5shQtijjpsWvsSqk9ZVjqw/l++cRkIyOaTUZ12XYt+1ixgyp6ULVPgxQ401UwCx6PPQGEOzY=
X-Received: by 2002:a05:622a:c6:b0:4ef:bd1a:501f with SMTP id
 d75a77b69052e-4f03fe048dbmr114802141cf.23.1765187583850; Mon, 08 Dec 2025
 01:53:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3da6a916cd6d489690b05d2bd64a2b3a@honor.com>
In-Reply-To: <3da6a916cd6d489690b05d2bd64a2b3a@honor.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 8 Dec 2025 17:52:52 +0800
X-Gm-Features: AQt7F2owj7J_9alWp6aSKrVUcQg6W4ytaT9Dh3VtedFYj__73ne_kDrRjgoOen8
Message-ID: <CAGsJ_4w-XtJ8zzc8H4OwW4XV21T8FWGxeoMnfAxmAgBhzrvxWQ@mail.gmail.com>
Subject: Re: [RFC] dma-buf: system_heap: add PTE_CONT for larger contiguous
To: gao xu <gaoxu2@honor.com>
Cc: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "surenb@google.com" <surenb@google.com>, 
	zhouxiaolong <zhouxiaolong9@honor.com>, Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 8, 2025 at 5:41=E2=80=AFPM gao xu <gaoxu2@honor.com> wrote:
>
> commit 04c7adb5871a ("dma-buf: system_heap: use larger contiguous mapping=
s
> instead of per-page mmap") facilitates the use of PTE_CONT. The system_he=
ap
> allocates pages of order 4 and 8 that meet the alignment requirements for
> PTE_CONT. enabling PTE_CONT for larger contiguous mappings.

Unfortunately, we don't have pte_cont for architectures other than
AArch64. On the other hand, AArch64 isn't automatically mapping
cont_pte for mmap. It might be better if this were done
automatically by the ARM code.

Ryan(Cced) is the expert on automatically setting cont_pte for
contiguous mapping, so let's ask for some advice from Ryan.

>
> After applying this patch, TLB misses are reduced by approximately 5% whe=
n
> opening the camera on Android systems.
>
> Signed-off-by: gao xu <gaoxu2@honor.com>
> ---

Thanks
Barry

