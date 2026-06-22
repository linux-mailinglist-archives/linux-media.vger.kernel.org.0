Return-Path: <linux-media+bounces-65419-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6hRtG5OoOWpJwAcAu9opvQ
	(envelope-from <linux-media+bounces-65419-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 23:26:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDEF6B27C3
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 23:26:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=QEbmW7J6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65419-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65419-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D264C30418B9
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 21:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54435374731;
	Mon, 22 Jun 2026 21:26:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEE8372052
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 21:26:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782163590; cv=pass; b=aqBzhGOK18sAcN7KerMK+gqNH506GJ2VqorJcmlBqPfWTUGNwPtClFzXX8sHVfw1c1Fs0ww/WpObKGsou871yEwEF4wfYMDSl1buDxb4CAgxeAqts7a2qkJqNKQ/aKHYsSW5kUuK8msvneei8GXVy7YHLaT9TOwR16ek/17nxJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782163590; c=relaxed/simple;
	bh=NflH0Gfezb1XneHPVcE4Mia9bSbDbmEspl/+r5JrR50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqgbDOXBcae3HwePqdk9RQWoKoWE841Xa+SZU2QJGnuq8jh43gy37SPanBR71T1qD+lLmoQ5DJmRRTFWBTNZ4Dhq5/TZuOYKHiFkz4iQpB4Y+rPbnoHFzZa4vgHzdgSjRKY02+vX1XxSI5jYDoMsKEWu67iwfr/jUaeSmSI069M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QEbmW7J6; arc=pass smtp.client-ip=209.85.167.44
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ad4ee260b0so2010e87.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 14:26:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782163584; cv=none;
        d=google.com; s=arc-20260327;
        b=iJi+B7qSaufkRuSPHh6Od2DJ/kS4CgLVZQjT+zxdgPPVjPe221OZ5m/7Sgs2HCWm0i
         BRUSFxT5tOn7Um5qM6dHKzNS+l/LM5W9kSxGgErmAoKv/3BhbszOXNmH5cP6388qqACC
         ASbYP7di4hAmV8P88dxyaptRQi8kUxKSiHfl8cE5V6PS2SP5cfWSjWcmmBP3nbhXQPpF
         sVhA5Nt/dpD82bCl4xLND4B2lp5MhRE5tbNCnek0K/SyL89s7lsUjVI3LBT8v8MPkrOV
         CwGktN6hw7V6wt7LPYh59k9wsU+/T9k4TibAM3wsPu1fV8Erhqy/EE0tqIQpyml2fBJu
         Gh3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ssE3TLUG/7J9ufeN9q/DrGgYY9Z2q4mT+HtG/803YCc=;
        fh=vjWyoFx1kgAC6Y3k+Ph2Spp18EMco8JhQFXk363R8lM=;
        b=qN7j35ogjOAJINKfHts8UWfV1iPdiYt3kY1tDTBs0i8iHmCLWgr/NxLpNPPUj/zgg1
         tu+8AxKhJu5dqnBZnpCagmg8v+SFzvKBKRBwo7DBV9OlkOkexFQjmV1oQ4f4NcCJ9aNw
         aFRU0nCWPQQsi+hpNQhC3kycjJK65/z+A99sxSt2yVOs400T8JJJHEkq9UN8gj5oWPWP
         UlwcpOesuGs+nCnvsEZs2HHlOcg5JrMvqvslYEkJmI+XcKXiqr11zSyCMm7I5iiHPjzA
         DqOWGYiF684sa7IPZs2fz5lMXO4L1FG51S9UHBJBHjNx/9w+FlFDpyDbwnYlIGzxtuef
         HwxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782163584; x=1782768384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ssE3TLUG/7J9ufeN9q/DrGgYY9Z2q4mT+HtG/803YCc=;
        b=QEbmW7J6VqWb0VWbxpiT5WWeXJnmex/IKF43rVscjY7n6uPCabJqx7PiN3F6FiIytu
         uTxIX5zPXgx+EVcWSnf7J3a9hYWdKtEMi+ElZocEyqpmLWUS80w3qBGZmCikbwRLfMXD
         50ovAvDSr5JYGmBCx9f7tD4UX+Nb4dYwVhW4oh8zU8SztHkflRJhj78h4UvSeMFuznuB
         hdAB9tDwpYMkYSkWeATuG56s4fOk1IMRDKtQOUX6nrk3D7t15HjMzmeOn6YdZ9sHB21h
         AiFh05bLIWmQWgGsHFWbDkA+7OkdEIexoAB2QzPnD75gDC0RQ5ITGhfn/D6adKtaBa8H
         HaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782163584; x=1782768384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssE3TLUG/7J9ufeN9q/DrGgYY9Z2q4mT+HtG/803YCc=;
        b=mq9DbsfY9qXOsXaQfpDrpJ+A/lzTWtYf5OOEFxnXr3vE7oq0jTS9x1EuwDjd5hZj9R
         jg9lTcGtEWj08Luas3/dNfhoKF9CduEcGyLqqcc+w72agDfcPM3+qbi82eQ/3O6sc/GZ
         wgP9VRt6Hi1tp3ap9Dl+1zevFb5wIcjHEa4GZbluN1dzguVpU59QYaYpHN4rcChEUznK
         bt+c7MjTokVN+zarSv0jc2LafgbM7Xr2koFEvoo3jNlpBXUMg1n7eADQsotuyZogLQjh
         1lOsC59IpwYwy26wpt5xttmLItn7dsPn0hpOa9E+Rg1D4LZyF03ojD+e3mPn6cOGXMtT
         mKLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fAuG03xbbg/nDkJDrMKjeQsczjJCf+2ZkdFwHpzvpNqHLm3KzQJF/hY8Fr+1XmrQ2xYTJI31rk07e+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJnWdm0edqFINvTgshYFG82ut9yW/U3gBpCNyWR0zlD/N9t17h
	pYzN0VcefUTA/z7VKUmNtt2ZRtOkDTLTvG7Ve18hj1BqFxpjq3qPmCNVZvnON8xsaytzAEzBaEs
	enVKmzONHYKS9iLaiA7vOg0fmnb+enoy7f5yKZhk=
X-Gm-Gg: AfdE7ckpVG+npGl7T3uRyl55dh5woFfvj1gzDQUVcMAUJwile7mKcHXQyJPjY0l3Jg5
	7bPnBNoEKWrZJHGENJkqmFYR7XODyVzkaA6hAuHXZmfX3v3SciPJ1TPU0BB7+89wS0mGxZJOz1n
	rhwEwE97pP6cbtgwHV4Y84hwuOzxBXi/z1zwUqR+W2uv0gZcN4Xs6gHkolkCfYh5HgxK8p5Zge4
	dfU/+wsmf+qlobj9PBdF4ac/5CFtX0pCLDCND4dKpuVjxTkYxMLIrEMrn0QT42esVTi7F9VCmw/
	7Ww=
X-Received: by 2002:a05:6512:2302:b0:5aa:883f:5da4 with SMTP id
 2adb3069b0e04-5ada9edb8famr21097e87.11.1782163583717; Mon, 22 Jun 2026
 14:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621222130.1667453-1-xuehaohu@google.com> <20260622091344.794e0d74@pumpkin>
In-Reply-To: <20260622091344.794e0d74@pumpkin>
From: David Hu <xuehaohu@google.com>
Date: Mon, 22 Jun 2026 17:26:10 -0400
X-Gm-Features: AVVi8CfJIbyQ0LZKF2B9vVNXYGGvbzr3GZ2ukEdWP929fB_vPszHbNiUlAHw-3A
Message-ID: <CAPd9Lg9+d=Rw4230FdcMFd0VYfyhXhD=eju53iURR8c61iXsWw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Split sgl by largest page-aligned chunk
To: David Laight <david.laight.linux@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, 
	Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, jmoroni@google.com, 
	praan@google.com, kpberry@google.com, sashiko-bot <sashiko-bot@kernel.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:nicolinc@nvidia.com,m:leon@kernel.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:praan@google.com,m:kpberry@google.com,m:sashiko-bot@kernel.org,m:stable@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65419-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEDEF6B27C3

On Mon, Jun 22, 2026 at 4:13=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>

Hi David,

Thank you for your review. You raised many good points regarding
optimizations here. I'll switch to using 2G as the max entry size
(`SZ_2G` from `linux/sizes.h`), and remove divisions and
multiplications. I'll also replace the `for()` loop with `while
(length)`, and drop `min_t()` in favor of `min()` by casting `SZ_2G`
to `size_t`. I'll send out a v2 with these changes shortly.

Thanks,
David

> > Currently, `fill_sg_entry()` splits the scatterlist using `UINT_MAX`.
> > This creates a non-page-aligned DMA length (`0xFFFFFFFF`) for the
> > first entry, resulting in non-page-aligned DMA addresses for all
> > subsequent entries.
>
> How did you find this?
> It requires a single buffer over 4GB - seems highly unlikely.

It was observed during experiments with buffers over 8GB on an accelerator.

> >
> > While the underlying IOMMU mapping may be contiguous, hardware
> > DMA engines often require explicit address alignment (e.g., page,
> > cacheline, or storage sector boundaries). Passing unaligned
> > addresses and lengths can cause explicit failures in DMA descriptor
> > creation or silent data corruption if lower unaligned bits are
> > truncated.
> >
> > Fix this by splitting the scatterlist by the largest possible page
> > aligned chunk within `UINT_MAX` (`ALIGN_DOWN(UINT_MAX, PAGE_SIZE)`).
> > This ensures all scatterlist DMA addresses and lengths remain page
> > aligned and satisfy hardware constraints.
>
> It would almost certainly better to spilt into 2G chunks.
> That removes any need for any divisions.

I agree. 2G naturally aligns with most hardware boundaries, while also
allowing compiler optimizations with simple bit shifts.

>
> > Page-aligned entries allow the system to cleanly chunk payloads into
> > PCIe MaxPayloadSize (MPS) (e.g., 128 bytes, 256 bytes, 512 bytes).
> > As a result, this may help reduce TLP fragmentation in P2P transfers
> > and alleviate potential congestion within a logical PCIe switch
> > partition, especially when Relaxed Ordering is not possible due to
> > hardware constraints.
> >
> > Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> > Closes: https://lore.kernel.org/all/20260609165431.778061F00893@smtp.ke=
rnel.org/
> > Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mappi=
ng routine")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: David Hu <xuehaohu@google.com>
> > ---
> >  drivers/dma-buf/dma-buf-mapping.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-bu=
f-mapping.c
> > index 794acff2546a..f2bde38fdb1f 100644
> > --- a/drivers/dma-buf/dma-buf-mapping.c
> > +++ b/drivers/dma-buf/dma-buf-mapping.c
> > @@ -5,6 +5,9 @@
> >   */
> >  #include <linux/dma-buf-mapping.h>
> >  #include <linux/dma-resv.h>
> > +#include <linux/align.h>
> > +
> > +#define MAX_ENT_SZ ALIGN_DOWN(UINT_MAX, PAGE_SIZE)
>
> >
> >  static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size=
_t length,
> >                                        dma_addr_t addr)
> > @@ -12,9 +15,9 @@ static struct scatterlist *fill_sg_entry(struct scatt=
erlist *sgl, size_t length,
> >       unsigned int len, nents;
> >       int i;
> >
> > -     nents =3D DIV_ROUND_UP(length, UINT_MAX);
> > +     nents =3D DIV_ROUND_UP(length, MAX_ENT_SZ);
> >       for (i =3D 0; i < nents; i++) {
>
> Why not change that to 'while (length) {' to avoid the division above.

Sounds good, will do.

>
> > -             len =3D min_t(size_t, length, UINT_MAX);
> > +             len =3D min_t(size_t, length, MAX_ENT_SZ);
>
> I bet that doesn't need to be min_t()

Agreed.


>
> >               length -=3D len;
> >               /*
> >                * DMABUF abuses scatterlist to create a scatterlist
> > @@ -24,7 +27,7 @@ static struct scatterlist *fill_sg_entry(struct scatt=
erlist *sgl, size_t length,
> >                * does not require the CPU list for mapping or unmapping=
.
> >                */
> >               sg_set_page(sgl, NULL, 0, 0);
> > -             sg_dma_address(sgl) =3D addr + (dma_addr_t)i * UINT_MAX;
> > +             sg_dma_address(sgl) =3D addr + (dma_addr_t)i * MAX_ENT_SZ=
;
> >               sg_dma_len(sgl) =3D len;
>
> Replace the multiply with 'addr +=3D len'.

Will update this as well.

>
> -- David
>
> >               sgl =3D sg_next(sgl);
> >       }
> > @@ -41,14 +44,14 @@ static unsigned int calc_sg_nents(struct dma_iova_s=
tate *state,
> >
> >       if (!state || !dma_use_iova(state)) {
> >               for (i =3D 0; i < nr_ranges; i++)
> > -                     nents +=3D DIV_ROUND_UP(phys_vec[i].len, UINT_MAX=
);
> > +                     nents +=3D DIV_ROUND_UP(phys_vec[i].len, MAX_ENT_=
SZ);
> >       } else {
> >               /*
> >                * In IOVA case, there is only one SG entry which spans
> >                * for whole IOVA address space, but we need to make sure
> >                * that it fits sg->length, maybe we need more.
> >                */
> > -             nents =3D DIV_ROUND_UP(size, UINT_MAX);
> > +             nents =3D DIV_ROUND_UP(size, MAX_ENT_SZ);
> >       }
> >
> >       return nents;
>

