Return-Path: <linux-media+bounces-30278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 924C4A8A9AC
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 22:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9750117FF18
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 20:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59222550B7;
	Tue, 15 Apr 2025 20:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NhAXugaI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFA421CC74
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 20:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744750639; cv=none; b=VDQSvWGzpIecxlX5NU0VWkMIxPAzFgVcVIFm70vtig5AE4zqXV/e3H+QAN2r86KtRjJt+FmgGLQ3YRxqh4dOviYJADrQ2NXUJAkQMmXSHk5QhcIdrEXL++xw9fYMrYSu8kNFv+upTmm2ftDWNKNtnIUfZ96v8ueGv/wG+8eIW28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744750639; c=relaxed/simple;
	bh=Rigphh5nMgvo+Y6TLM+7fpUEnpEJucdeei2X7fHzbEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bCVfqrT90FFEECNUf1VkGH2oQbNAyG4dEXBQM6hMuMWz1zDQmc09N2/5FJ7/nTqN46+zBgAgqavcZ90uhuMEARN5+46VYI2o06KPg7Vt0lmrEa1D0TGxZefhUEFljQqGJGIKL7UdZgQGHlLmviOZPN63f1XgbZ4Nk6X5fopNT4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NhAXugaI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe808908so21175e9.0
        for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 13:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744750636; x=1745355436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uztEYCXIvwAqBo9EVY+2Bc2ZaaRmX1aT5eydd4qFLW0=;
        b=NhAXugaIiJJsKoWldWRgPmsLN3idWggw92w4W7Z6+kMVAq+6ZChlLmT3rUvJGZe4fD
         BJYDJK80FLViVzwFykawFgSzjIqoDPVGnlBXuYr5a4Rl+TNZt6FpCcTPks+syMVlEPrG
         50hwxkplSNLeRMfaECMc+CpaK3z+9Lc6Xtp2Xz82lHnQPY/gKb2VkZyOXJBDvNvoQ2XB
         2KlKCinBa3S795I4fgvZskdqUqa2mef9TEJ8XxE5s2Yv3kDd5huln7MU1H40JhGYu7m8
         UfNSmsimvx3AvGsHoPGi2iaf3uXBJePOzTRZxj6z2uNRsfgs1O8OF7lK96eEISkqnG1D
         NRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744750636; x=1745355436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uztEYCXIvwAqBo9EVY+2Bc2ZaaRmX1aT5eydd4qFLW0=;
        b=rWHDD255LrYBKqTuDJjjkmF/Vd9zXbj8KHH3BeTZH8tyERPIlNf0GVFjMlIKjTXeJu
         cw5NGYOgp30w9KnDGv5cfQivbvdcHBsiaEh+mpRkNFzhVKESGSm0EajNtOsisX9FYKXR
         x1h2Fxx7yLBsiEd27koP2aiWymishqCVTkSp4UD/fbUKQlziWEOmBEYI8FX2jaxgB3sC
         Wpnllwe+vI4/QE2VwcqdcJjYca1doQ/MZK0Xgsg8cqcweFIv4aR1kb8Si0IUVmoX3vKW
         FqyLVb+eorpSiESqV2oIUvUjZwm5R3qD/ywSQSoXTIDUg1bXDKZLUew/V1q+M2YSSjTR
         6nPA==
X-Forwarded-Encrypted: i=1; AJvYcCWKakl3UUCW4qgbSMqtm22YzMlBuwOEBLAfcFpgUONkgjLtbqxDWmjryLA8nJifMcj8dAT4AZ40+erIwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd+dc5J+Kca/W2Ay4LPnLSBA0lvNPjmmE+IGOfOfG8sARTqest
	xuJx0qe2P/NUME91VwweR8ctFnS8cd6gfyIFyQhCbtvGFVpeQSMOt2dL4vJSv7mLoH+KeJDtp+H
	n1YUz/ocL+9uw1aqzb/ou98EW3Jr45r3hLDTy
X-Gm-Gg: ASbGncutpnWUN2qW9zAILvQYDY50+CQGJjs5Ob6Dwy8wHZlJhtP4oUU9Eu/wqMwilMZ
	W5YQTSA++NLYdhVF8zY/x74HlGyeFKlP8WWH8R89rF3aerOxJX5txa+tSCOE+PWToGWpxphfM6i
	fPZ+uJ/iu1I45QtbrvIi8bJ1hRt/p3m+K/yjfYaY5K79+y/Ug6XbT5
X-Google-Smtp-Source: AGHT+IGXD1VxTGyGvWZV4CehXI+QLZxEMIErZViq4RxE7yiw+R8JJCPy5nW28NNv/NwEDI4yCJEpKavgYMSn7I/9ZYo=
X-Received: by 2002:a05:600c:12c8:b0:439:8f59:2c56 with SMTP id
 5b1f17b1804b1-4405a159a48mr207845e9.2.1744750635333; Tue, 15 Apr 2025
 13:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415171954.3970818-1-jyescas@google.com>
In-Reply-To: <20250415171954.3970818-1-jyescas@google.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 15 Apr 2025 13:57:03 -0700
X-Gm-Features: ATxdqUEYkJHID5PFTCgbNHb3ti1GO56rHU_cmcbEsJdS2z-qA1eNXNoty6ETrDs
Message-ID: <CABdmKX3Ht=bCcPFxK5mGX2qD4riXQ7Ucw6H_-+1PupXy-1ABGQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation orders for larger page sizes
To: Juan Yescas <jyescas@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	baohua@kernel.org, dmitry.osipenko@collabora.com, jaewon31.kim@samsung.com, 
	Guangming.Cao@mediatek.com, surenb@google.com, kaleshsingh@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 10:20=E2=80=AFAM Juan Yescas <jyescas@google.com> w=
rote:
>
> This change sets the allocation orders for the different page sizes
> (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
> for large page sizes were calculated incorrectly, this caused system
> heap to allocate from 2% to 4% more memory on 16KiB page size kernels.
>
> This change was tested on 4k/16k page size kernels.
>
> Signed-off-by: Juan Yescas <jyescas@google.com>

I think "dma-buf: system_heap:" would be better for the subject since
this is specific to the system heap.

Would you mind cleaning up the extra space on line 321 too?
@@ -318,7 +318,7 @@ static struct page
*alloc_largest_available(unsigned long size,
        int i;

        for (i =3D 0; i < NUM_ORDERS; i++) {
-               if (size <  (PAGE_SIZE << orders[i]))
+               if (size < (PAGE_SIZE << orders[i]))

With that,
Reviewed-by: T.J. Mercier <tjmercier@google.com>

Fixes: d963ab0f15fb ("dma-buf: system_heap: Allocate higher order
pages if available") is also probably a good idea.

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
> +
>  #define NUM_ORDERS ARRAY_SIZE(orders)
>
>  static struct sg_table *dup_sg_table(struct sg_table *table)
> --
> 2.49.0.604.gff1f9ca942-goog
>

