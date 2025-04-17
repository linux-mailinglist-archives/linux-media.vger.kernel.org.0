Return-Path: <linux-media+bounces-30501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A54EDA92C4D
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 22:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 122DF7AD3C8
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 20:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461912066D4;
	Thu, 17 Apr 2025 20:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dcj5R6bk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58592189915
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 20:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744921819; cv=none; b=VoW/3oTZJYO69KgPHCsWOTAqQNhNB8rrJhgyNhrcfP70TrSnCxr6+d0s/xo4eGq5nLGiNQMAccw0Uc7mh88a1MARCap+5dknKx9NdeD3EHqwVKP+oUhubN+aTgBWOZ6iFjx0pd3oZVM8PkUtOislwiAwWU/t+EOqKION8Rj30tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744921819; c=relaxed/simple;
	bh=8jvzjrzeUI+f//PctZuZkUbQH5+8B60A4PubCW3hXS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bmMImCNTjEH+GD0LQyvmYULZYdfnKCan9uqCBqYIEiBPuINmGgO+VvVoEQcD+8ll3Dn5BKKY2ZMO+dXZ3DjDEl2heo2KtBknA2W++vPq2W23WgPVbIb4UK8J6DxMf0kKtcD6erPFTGL8xKBgr0gnW/CHn9V4m9PUjk97D3vxDN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dcj5R6bk; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47681dba807so71721cf.1
        for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 13:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744921816; x=1745526616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSYCQlCdJRvaCsoVa8PuzWUQ/r1Df/jdHAjvC1U2+0s=;
        b=dcj5R6bkuO/QhPK2CmWhfY7Z+Smn9SaWL6updtA7/8vbxUZH0U16XvSLSpkgLXGU98
         r3pQm1EfS+a6tiVt/7q6dCquonLW8zoJCJzRsJBHBQcntc6kNjshXMqCZlkd+m1cBNJk
         nQDvV7w2kusAUIyDiy3sYLX5HBKl73CF+UWjLZaxq4yfCNbb3SxN57nuAhBRNpkOneF3
         mgK6Rurl2kDOG295gtU2BLMRmUPZbvua+Y6BJCFX9DFUd3J2fqSfCaEpoDAYpQQl0z3C
         OXlgxfvvqIwTGVgoLTIS20DlzB8oH0aYjBCAr3bDKhSX6vMLZ4iftjwZs+Nvk3iwrYTR
         jTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744921816; x=1745526616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSYCQlCdJRvaCsoVa8PuzWUQ/r1Df/jdHAjvC1U2+0s=;
        b=cvij+HECu6SVpVSo84FwAalN1EGt6SUKzg8k/BwbMYHtCaY/HXNOUkxWcjYx8CCI+q
         sD+fYpGDjU5C4vLfKEE108EI1AGoX7C7VWoVcnwFcNs/FTsDhQQO34YZAdQwB3nkdqMM
         Vtvtk99dG4SF3XIxXniEWQ9mHM2qNk7BiPILqlaagD2qEQp//df/ejQDMz514a9zSGuo
         9YfMjy1AYaHgKtHJqJnv2wFTvJ2eRhGVcGC7n8eYqD7+8pfe2TSlic3Pk9rhUn+ANv2b
         YGEKUgNLVa0jhMdGcvn7JmBwN437KXIgZZ+xx/3L0nKjc8STOPywjiG//F3Hdt5Y1J4p
         0O9w==
X-Forwarded-Encrypted: i=1; AJvYcCVsDxxd0/kF6PVPa90FEYdSoYh5mJaEioQaelkc5k3xOcKRokXrey9ylvwvnmnSy3j2ji3FUlBu6yG1OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHOHsBSfv85JtzRBJ/ialfIjkd+fa+J03sLMvVI9MmyFvCsWUJ
	7NRLOA+C0sdWEc4NYZSvGrLLwhX95GMOpWGF45Yvev7PxLznTKYd0oU5MU+KIOhEg4ncysfSiDX
	q7Xnbt6ca5UGqapHVWWDzFnC8OGRafFFjoJEg
X-Gm-Gg: ASbGncvvXO1BqDwoHYeBh/5KnSuPwy4OVO3IOCRl2i6qQp6Ikh7+IiH1+vMp6+kiCjI
	+O2l4t5dVdUWUy9wumUiAdJs9kpW/OtdrJrh7wI2g8RSMoWwKEVtLo+PltcRYHkhLFE+kmn42AC
	H4MmK5nrY8ubMhaHozITqX+Vs+BUhGx7yE1VlgWCFNssCZGi7wMO6w
X-Google-Smtp-Source: AGHT+IEX2UtNOppZD3tHg7Ft0MDhrbQphb7UixP6vmBL/AgRj7UjnQUm4ayBLDq7gljiyyLvRT6k/CWMaevWIuA7DlE=
X-Received: by 2002:a05:622a:1a18:b0:477:1f86:178c with SMTP id
 d75a77b69052e-47aeb26fddbmr899271cf.26.1744921815900; Thu, 17 Apr 2025
 13:30:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415171954.3970818-1-jyescas@google.com> <536596bf-8f5b-462b-add7-a203b6cd1e46@amd.com>
 <CAJDx_rjrAgJiyOV2KcTYp574w=9mjNQ5jY3VYdG12mMuroVQ9Q@mail.gmail.com> <21cbda3a-1997-4ac0-ad5d-6e6d447fc11c@amd.com>
In-Reply-To: <21cbda3a-1997-4ac0-ad5d-6e6d447fc11c@amd.com>
From: Juan Yescas <jyescas@google.com>
Date: Thu, 17 Apr 2025 13:30:04 -0700
X-Gm-Features: ATxdqUFqpr3SUaYyrcoHC1l0zJVY8cIEh8mxRUqzXl69R4ekay5l-uDxnSIYlUw
Message-ID: <CAJDx_rjY_myNpTm0XzA0sPn54GKzN1W_qZ8HEOhCBy9An-3ZkA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation orders for larger page sizes
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, baohua@kernel.org, 
	dmitry.osipenko@collabora.com, jaewon31.kim@samsung.com, 
	Guangming.Cao@mediatek.com, surenb@google.com, kaleshsingh@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 1:06=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 16.04.25 um 23:51 schrieb Juan Yescas:
>
> On Wed, Apr 16, 2025 at 4:34=E2=80=AFAM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
>
>
> Am 15.04.25 um 19:19 schrieb Juan Yescas:
>
> This change sets the allocation orders for the different page sizes
> (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
> for large page sizes were calculated incorrectly, this caused system
> heap to allocate from 2% to 4% more memory on 16KiB page size kernels.
>
> This change was tested on 4k/16k page size kernels.
>
> Signed-off-by: Juan Yescas <jyescas@google.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> index 26d5dc89ea16..54674c02dcb4 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -50,8 +50,15 @@ static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_O=
RDER_GFP, LOW_ORDER_GFP};
>   * to match with the sizes often found in IOMMUs. Using order 4 pages in=
stead
>   * of order 0 pages can significantly improve the performance of many IO=
MMUs
>   * by reducing TLB pressure and time spent updating page tables.
> + *
> + * Note: When the order is 0, the minimum allocation is PAGE_SIZE. The p=
ossible
> + * page sizes for ARM devices could be 4K, 16K and 64K.
>   */
> -static const unsigned int orders[] =3D {8, 4, 0};
> +#define ORDER_1M (20 - PAGE_SHIFT)
> +#define ORDER_64K (16 - PAGE_SHIFT)
> +#define ORDER_FOR_PAGE_SIZE (0)
> +static const unsigned int orders[] =3D {ORDER_1M, ORDER_64K, ORDER_FOR_P=
AGE_SIZE};
> +#
>
> Good catch, but I think the defines are just overkill.
>
> What you should do instead is to subtract page shift when using the array=
.
>
> There are several occurrences of orders in the file and I think it is
> better to do the calculations up front in the array. Would you be ok
> if we get rid of the defines as per your suggestion and make the
> calculations during the definition of the array. Something like this:
>
> static const unsigned int orders[] =3D {20 - PAGE_SHIFT, 16 - PAGE_SHIFT,=
 0};
>
>
> Yeah that totally works for me as well. Just make sure that a code commen=
t nearby explains why 20, 16 and 0.
>

Thanks, the changes were added in the [PATCH v3].

> Apart from that using 1M, 64K and then falling back to 4K just sounds ran=
dom to me. We have especially pushed back on 64K more than once because it =
is actually not beneficial in almost all cases.
>
> In the hardware where the driver is used, the 64K is beneficial for:
>
> Arm SMMUv3 (4KB granule size):
>            64KB (contiguous bit groups 16 4KB pages)
>
> SysMMU benefits from 64KB (=E2=80=9Clarge=E2=80=9D page) on 4k/16k page s=
izes.
>
>
> Question could this HW also work with pages larger than 64K? (I strongly =
expect yes).
>

Yes, if the page sizes in the SMMUv3 are:
      - 4k, we can have 2MiB pages
     - 16k, we can have 32MiB pages

> I suggest to fix the code in system_heap_allocate to not over allocate in=
stead and just try the available orders like TTM does. This has proven to b=
e working architecture independent.
>
> Do you mean to have an implementation similar to __ttm_pool_alloc()?
>
>
> Yeah something like that.
>
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/gpu/drm/ttm/ttm_pool.c?h=3Dv6.15-rc2#n728
>
> If that is the case, we can try the change, run some benchmarks and
> submit the patch if we see positive results.
>
>
> Could be that this doesn't matter for your platform, but it's minimal ext=
ra overhead asking for larger chunks first and it just avoids fragmenting e=
verything into 64K chunks.
>
> That is kind of important since the code in DMA-heaps should be platform =
neutral if possible.

I agree, I'll make the change in another patch.

Thanks
Juan

>
> Regards,
> Christian.
>
>
> Thanks
> Juan
>
> Regards,
> Christian.
>
>  #define NUM_ORDERS ARRAY_SIZE(orders)
>
>  static struct sg_table *dup_sg_table(struct sg_table *table)
>
>

