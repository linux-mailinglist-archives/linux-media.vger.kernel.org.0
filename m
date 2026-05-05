Return-Path: <linux-media+bounces-60445-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP52Ed0C+ml1HAMAu9opvQ
	(envelope-from <linux-media+bounces-60445-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:46:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7F54CFAEA
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E858C3015E0C
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C117F43CED3;
	Tue,  5 May 2026 14:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J4ju9Jj8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B9B24677B
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 14:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992260; cv=pass; b=i5OVyC2eRMgC5NskzWJVpp5yg2qTXJz3sulfscO9PtPqnYPfbnnVCb9e/huH2N+RaOaOmhv3CzQwv2zeXHjw9GSKm+Haa+wmr7ZiFKCsDwjvS/tUlMSDy1vGQCd5SP5RVSxNFQsC5MDTnGg/5zPp2U2zS8PY3L2PqwdoS/eXdbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992260; c=relaxed/simple;
	bh=QTwdeXWt3ptb32NCdI5XCl+KM/0lGfsIOy4C/KdIodE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dITBlShyVSPUGqra0LwffKPawtauXQS7Fp2fsVJ5vLJaQWO5yaMz3uqDSDWpRqIJuEGVgENdultA+Nqg24QKwfdW7t9uTXzIaqjWGch7iY7yvk2GiyhhmtTP+bACLqBzQ/nt8NvZgxpMXsbWgGMTTybHAW5ZWU13w+2x4t+qwa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J4ju9Jj8; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so96755e9.1
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 07:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777992257; cv=none;
        d=google.com; s=arc-20240605;
        b=d35/thFyLfOUKRwK/EoJNu3zNewYvm2uA5o7ggfzNWPdzAkArq6LxbykghcehL6a7o
         Kk9DrFvqdhq4a3T1IbR08o/ME6xFzHwieHEXtsobayucVSDaffVhOBiMKXi2kboEpum0
         MJMVqyqCI8Nn+Yx//R+HYd4uIIZ1+UGbyXNGfKX+2f87cOmeAl0BdWa2OXFadwTd8DVE
         BCjnfnaV+nKItmUjqp0oK9E9OtUDpuCRov3/nFm1D7RmpnLuCG3XwQI/3YbFiYfvtiEz
         gc63iRdvf6ZyiYMfnqOCK2U2N5SZ/LJ8MDnwYitnQngyJHMjJjoURHIBEJN8rY0x0DfD
         08bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xImKjLpphistWNUhM/BMGUgvs4K16/nDs7wCf3O5gxg=;
        fh=tq0NvDRmXY8IlaoSUx8EMf9dyQ09T4NczLJy7Fv6/oc=;
        b=H6xBNKwhOL6FzHzEBfnxjH3g7TYNQ0YUHGwfYW/1IphfDapoF89MFfZv5uZMV0czvH
         sbQYfYl2Hd3yhnI81uNo7jZEO0em+dU8sn87GH6ICDmrvECTb5WagsnFPzGaJG7y+M0Z
         KrDckl1JY51ajTv6Ly5v5STH9+wCGhRoQuRMgHOVcbypb5xQ9S9Q2O+7VdN8iKnMPuxz
         dUFSmQw0PP5rsx50yTkNlW5lH3zdjdnq8vhaLum5Aykj4Wf/JncF4VwrBkItLLj55i/i
         UMTApb6VYaRyZBLxUapFNyLdD4YzUR4zJTYDPGLzAJvt0xrSO9hiclC2gnA2ZDF7MXwt
         jCGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777992257; x=1778597057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xImKjLpphistWNUhM/BMGUgvs4K16/nDs7wCf3O5gxg=;
        b=J4ju9Jj8YtPE7F0X0aJCMFx0cHofKdqOYQsSWZ0MN2NCNBJ6DeXVcfr4HEYc8Fv3Vs
         vkil0/b1H2BkzScmq+m4yndlq+JlWnXsi58WJvbSaJy+vk9+/z218axaStnAWYPymM59
         oM7dt2mJfbk7FQjKN4xjw61MXhaxaA/Ts8WNaIyLZDNu0dU8zn6yDE6Of7pKZ89+XOAE
         XsuaoS9gW52gQt8/r/nFCJjw7LU56WFA/j/Friu191PyR4WBLCUF7lYC18Am52+/o5e5
         8Wlye/d3r/xE9Mys3pKEWg5JR5Vro7PP3OMBxwFd3QUpp1UPK4QAJA2cX4pie5Fy7dPU
         7Jnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777992257; x=1778597057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xImKjLpphistWNUhM/BMGUgvs4K16/nDs7wCf3O5gxg=;
        b=Mj5srPYh7CE+Ck71UTLFKL8deUK26VS5KzBnaDKfY5pD2CL3fWPxW6iQsWuULoffMj
         On2c+Beiw/Tqk5EVAj0nm4sJmUC3RjwPPNJfUTb7QoP65aULXhBqvJAL0kgJSW1TqN3M
         KZgZBWjJDmwKNxY1ymJCDvVsgSQHmSuP3FYM1cKeYVMgBNVhAhE8yaknMJadfWff4/Bc
         /rbCrifCqfm9BaTgNQtA+jpbcQpU6WcZqiqLbd1wrOiA7zv+vIKEX6pRrqkVrhAWO9al
         TjSUUPagx99xc08pZQqVkOszhpYN40IFud+WBZLqhwZi4AsP8yIfIfpKhQ2TX+T1WI8P
         cOAw==
X-Forwarded-Encrypted: i=1; AFNElJ/czuSSinRAOmV6ElYN4UgbN3SJzCrkJSXy3QI6y2Cn3qikpjc5AECJbQEjgOb50BWyxZ10w6BAJGi1fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMYcGbIInme7D2ZYZS5S2gNlPsNE+TroJNBTAjMz3AzYCdkE3n
	D/86EzlBStWn9xvaqDImCNURUZS5MnNrbGueqrJfoM23NMLwhzaxm74tXjHLbZ5/Z0Aqcrnhlyp
	UmNtuJOR2kRnMuweABxoUlPW/KgEz29UhxmNh7jUl
X-Gm-Gg: AeBDievzz2+Bzo3faP6EfUVdK0BMwq7NiTenjKh8cbnTeAY7QZakQyVI4O5XzfFNzK4
	siY46IL2r0LNT3VVZJBwsNCt2+sFMGpOQ72LJafu6sInJxwfURsvgJySzkiNzPfecjH9ZXeui/B
	688rViuaov+dGIGLuLJJarPLSLgOb0yGkDafYZ8t03GIfNpWCErdUBy3evbtbIBzFraWrH1Bs4o
	45+MMBwxP5oMfUNnuKPbLfXa2Pc6EqJ2T68UWre/zTkao0KDyPxdxd9/aMoHEZa07AqW8gF1Gh9
	4IsRKx6of/7gqJ4HbvN4tDrgLvOIAkx2wT1GSvXXvebH2jpD4msaDa09CSsH
X-Received: by 2002:a05:600c:4fd3:b0:485:1a54:9407 with SMTP id
 5b1f17b1804b1-48d14696188mr1306875e9.0.1777992256465; Tue, 05 May 2026
 07:44:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406214938.24142-1-baohua@kernel.org> <a6d1c89a-3c71-4e06-adcb-56595071dcc2@amd.com>
 <CAGsJ_4xquCzQLbvpkC8arAN=9KhrAkdPdxnB=v85GvvQu23Xyg@mail.gmail.com>
 <9034246e-3971-4fad-94b7-80f4ad0e29db@amd.com> <CAGsJ_4z5EZoNMBVnu6sCkThyi9VTCeCH29buVecuySuv_Ry8fw@mail.gmail.com>
 <CABdmKX3baqmBkZxMB6PTG6Sj5S9qi+RwVvwpmkLqKkqvfeZAUw@mail.gmail.com> <bc74694b-9cbc-4cbb-9dcd-9e25960d3b97@amd.com>
In-Reply-To: <bc74694b-9cbc-4cbb-9dcd-9e25960d3b97@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 5 May 2026 07:44:03 -0700
X-Gm-Features: AVHnY4KKm8ChPu7Yq7OfV6LJFs9X7Wuvyr_qOd_TfzJJJ5G91zdYSk83n0ma0pE
Message-ID: <CABdmKX39gWcPy2PWxZ-bJBgXEQrk8Y7JWdFhkcS=LkOmU2v4zA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: Optimize sg_table-to-pages
 conversion in vmap
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Barry Song <baohua@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, Xueyuan Chen <Xueyuan.chen21@gmail.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8C7F54CFAEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,gmail.com,linaro.org,collabora.com,arm.com,google.com];
	TAGGED_FROM(0.00)[bounces-60445-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Mon, May 4, 2026 at 12:49=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/1/26 17:54, T.J. Mercier wrote:
> > On Thu, Apr 30, 2026 at 9:15=E2=80=AFPM Barry Song <baohua@kernel.org> =
wrote:
> >>
> >> On Wed, Apr 22, 2026 at 3:10=E2=80=AFPM Christian K=C3=B6nig
> >> <christian.koenig@amd.com> wrote:
> >>>
> >>> On 4/7/26 13:29, Barry Song wrote:
> >>>> On Tue, Apr 7, 2026 at 3:58=E2=80=AFPM Christian K=C3=B6nig <christi=
an.koenig@amd.com> wrote:
> >>>>>
> >>>>> On 4/6/26 23:49, Barry Song (Xiaomi) wrote:
> >>>>>> From: Xueyuan Chen <Xueyuan.chen21@gmail.com>
> >>>>>>
> >>>>>> Replace the heavy for_each_sgtable_page() iterator in system_heap_=
do_vmap()
> >>>>>> with a more efficient nested loop approach.
> >>>>>>
> >>>>>> Instead of iterating page by page, we now iterate through the scat=
terlist
> >>>>>> entries via for_each_sgtable_sg(). Because pages within a single s=
g entry
> >>>>>> are physically contiguous, we can populate the page array with a i=
n an
> >>>>>> inner loop using simple pointer math. This save a lot of time.
> >>>>>>
> >>>>>> The WARN_ON check is also pulled out of the loop to save branch
> >>>>>> instructions.
> >>>>>>
> >>>>>> Performance results mapping a 2GB buffer on Radxa O6:
> >>>>>> - Before: ~1440000 ns
> >>>>>> - After:  ~232000 ns
> >>>>>> (~84% reduction in iteration time, or ~6.2x faster)
> >>>>>
> >>>>> Well real question is why do you care about the vmap performance?
> >>>>>
> >>>>> That should basically only be used for fbdev emulation (except for =
VMGFX) and we absolutely don't care about performance there.
> >>>>
> >>>> I agree that in mainline, dma_buf_vmap is not used very often.
> >>>> Here=E2=80=99s what I was able to find:
> >>>>
> >>>>   1   1638  drivers/dma-buf/dma-buf.c <<dma_buf_vmap_unlocked>>
> >>>>              ret =3D dma_buf_vmap(dmabuf, map);
> >>>>    2    376  drivers/gpu/drm/drm_gem_shmem_helper.c
> >>>> <<drm_gem_shmem_vmap_locked>>
> >>>>              ret =3D dma_buf_vmap(obj->import_attach->dmabuf, map);
> >>>>    3     85  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> >>>> <<etnaviv_gem_prime_vmap_impl>>
> >>>>              ret =3D dma_buf_vmap(etnaviv_obj->base.import_attach->d=
mabuf, &map);
> >>>>    4    433  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c <<map_external>>
> >>>>              ret =3D dma_buf_vmap(bo->tbo.base.dma_buf, map);
> >>>>    5     88  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c <<vmw_gem_vmap>>
> >>>>              ret =3D dma_buf_vmap(obj->import_attach->dmabuf, map);
> >>>>
> >>>> However, in the Android ecosystem, system_heap and similar heaps
> >>>> are widely used across camera, NPU, and media drivers. Many of these
> >>>> drivers are not in mainline but do use vmap() in real code paths.
> >>>
> >>> Well out of tree drivers are not a justification to make an upstream =
changes.
> >>>
> >>> Apart from a handful of workarounds which need to CPU access as fallb=
ack DMA-buf vmap is only used to provide fb dev emulation.
> >>>
> >>> The vmap interface has already given us quite a headache in the first=
 place and there are a couple of unresolved problems regarding synchronizat=
ion and coherency.
> >>>
> >>> When a driver would be pushed upstream which makes so frequent use of=
 the dma_buf_vmap function that it matters for the performance I think ther=
e would be push back on that and the driver developer would require a very =
good explanation why that is necessary.
> >>>
> >>> So for now I have to reject that patch.
> >>
> >> Well, it doesn=E2=80=99t seem to increase complexity, and the code is =
quite easy
> >> to understand.
> >
> > I agree with this. This change introduces basically no downsides for
> > upstream, even if it primarily benefits a rare use case. Since
> > dma_buf_vmap is exported for driver use, why not enhance the
> > performance for all callers?
>
> Because we essentially want to restrict the vmap interface to only the fb=
 dev emulation use case and not promote or even expand it.
>
> When this matters performance wise the caller is clearly doing something =
wrong and by improving the performance we just paper over the issue instead=
 of fixing it.

Ack, I understand your position.

> Regards,
> Christian.
>
> >
> > -T.J.
> >
> >> It would be great if the community could be more welcoming
> >> to developers who are just getting involved, rather than discouraging =
them.
> >>
> >> Apparently, no one can control whether the source code of those kernel
> >> modules will be upstreamed except the vendors themselves, but products
> >> can still benefit from the common kernel.
> >>
> >> Best Regards
> >> Barry
>

