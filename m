Return-Path: <linux-media+bounces-30382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5326A90E0B
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 23:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 306BF189D235
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 21:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50F724888C;
	Wed, 16 Apr 2025 21:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y4pObPaf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4596DDDC
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 21:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744840328; cv=none; b=NlPX4GzxZu6jngWx1C7vzhjTFS1kD23lUSq4MgpbYHwyReUHFQXnNdM95uK/zp6r0hHMoZrxBkDQ7D44uyT2vFIPtw2h1lt4o+V1SXVzGKmp3MD8yhOlhmbQS4Fd6gxegDa1RduCDqm/bk+h5+sbuUL4BXRw+Bk45wezJzblJ3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744840328; c=relaxed/simple;
	bh=MJWoXU0g9QnCgNy25yiiQ9RniwDR4fpaHLBO3A30L5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dwWOedzk0QwFNjV0r8Seon/cor+7WPQ9K+uG33Vzl0TGms/o8VlApNDq6238SOEjK2K3/plai+kHuovybFIeBOa35jYU+l0zKV2QtCgjRi4rDABwH92blDoTpKJNlag4xF53QHOVLZdJd5WuNxKbgfHvs1udAeuxrp1LNQt790Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y4pObPaf; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47666573242so146111cf.0
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 14:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744840322; x=1745445122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcVDTghmW04E6h1mVPVRbo3+jKHYQBJaKcTlOvLQS3c=;
        b=y4pObPafrIr5dXNC2Rid+Wr1NPQmu6PqKM7131ddx3AHwyfcU56ocBRp8CN+QR6q+x
         4MZZxBW5txAgS2J74oOcPwt3zL1NrwKd7W/Yd64J/AQFnsg86H65a+x3yLjwdDV4uPag
         +W+WK/MQi2tvaZAaFTQiPAOqbUOZWbaGTO4bdEKPF51VcfzbV7FtU0oiptyyVT3LR1A9
         Nw5ELL7WZ9TtVNaKMnxQS/s1GVCRrBCIWwsKRmQYDmE9HCwThNRi/DcPc1n+4O6tEzGh
         lR1IcEmeZcqn/NT7nPIDaS76SlDmn6ULgDCY/xtKJS8P32iOCDTs2G0kVVLx57HFZKqO
         nG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744840322; x=1745445122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcVDTghmW04E6h1mVPVRbo3+jKHYQBJaKcTlOvLQS3c=;
        b=K+fCEAa6rTttABCsB72SCaY/wPgMumN5qkGHL0GILWhYt430anNe5U9nWWJpW1bE7D
         yVCL+JQ9fIeM4fith8iLwTUml8dnpe/7sNjEIFzqBjhQLm/PBPYjzNqCyonZ1cmBUkMB
         r9TgXE73oNjtw4i/Z/Vi68X3Xj/qslN7PySQDSu7uFxHgEkMgx8bSYhrEM+8vDSKZe0U
         R5T8Hv2PbX+QIsl0Ich7d0QG6iPFFHrvlHAqhg5sExA1EwK1DSYipVNwTHQKePO480HR
         2foFkLIJYtC/snBOyM1i2zXvzPhjqStqOK+PY6TZcLbL1OOt4Zsmn8/fxdJW1OfEmixA
         avaA==
X-Forwarded-Encrypted: i=1; AJvYcCXSeo7J60zcdMXztSTZqP4Nqwdck+a773vZBF5ykwkEv5smrEgyJaPDZwhYrGXEqQtQZyOvPPA+MiYB2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGugOizNeUb5uGmxp9nHHd3pHlk7Nn82g1LPFVupPxFgeLC7+/
	cQB9Of4oUO+3g5IiZ1fHRSdgdIS16mwcf+umuAvYvOK5UcVKpDXet82u2lDHjhUL2AGPY+NSW2W
	nyb0eD9WNjcxTo36x6IIy2uxJ0FVyOypGR7PS
X-Gm-Gg: ASbGncuXbGoWEKpX5BTirkWx2uignzwsodxAZ5PxK3whNBlT7Yj0sVlngRhaNW5w8Bm
	Ubl4hCuTWh0lutdQnVx9cpaK2fega7qhmx+8GXURzaUiLqls5WRehKt+wIoSPG5mCBbGdz4lStF
	YYzZ3Uy4qXfQpGcYU1opiUA4neUDw6y29xLmId+KKrCSBIOApuDPtU
X-Google-Smtp-Source: AGHT+IHUQzspiUQJB+h7jm1wn/s441E3wihWsN9WRc0OUtNm8hJrE+FZspPEgeONpMrV/FAEudR5KbsUS/x37qcmMAY=
X-Received: by 2002:a05:622a:1889:b0:477:1f86:178c with SMTP id
 d75a77b69052e-47ade69b055mr1113711cf.26.1744840322252; Wed, 16 Apr 2025
 14:52:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415171954.3970818-1-jyescas@google.com> <536596bf-8f5b-462b-add7-a203b6cd1e46@amd.com>
In-Reply-To: <536596bf-8f5b-462b-add7-a203b6cd1e46@amd.com>
From: Juan Yescas <jyescas@google.com>
Date: Wed, 16 Apr 2025 14:51:50 -0700
X-Gm-Features: ATxdqUE4qcI7Wp5CpFV-fRsQMsGVa_XUUphYkpYa0zt1M4zmiCfXplv8_xdchy8
Message-ID: <CAJDx_rjrAgJiyOV2KcTYp574w=9mjNQ5jY3VYdG12mMuroVQ9Q@mail.gmail.com>
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

On Wed, Apr 16, 2025 at 4:34=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> Am 15.04.25 um 19:19 schrieb Juan Yescas:
> > This change sets the allocation orders for the different page sizes
> > (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
> > for large page sizes were calculated incorrectly, this caused system
> > heap to allocate from 2% to 4% more memory on 16KiB page size kernels.
> >
> > This change was tested on 4k/16k page size kernels.
> >
> > Signed-off-by: Juan Yescas <jyescas@google.com>
> > ---
> >  drivers/dma-buf/heaps/system_heap.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heap=
s/system_heap.c
> > index 26d5dc89ea16..54674c02dcb4 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -50,8 +50,15 @@ static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH=
_ORDER_GFP, LOW_ORDER_GFP};
> >   * to match with the sizes often found in IOMMUs. Using order 4 pages =
instead
> >   * of order 0 pages can significantly improve the performance of many =
IOMMUs
> >   * by reducing TLB pressure and time spent updating page tables.
> > + *
> > + * Note: When the order is 0, the minimum allocation is PAGE_SIZE. The=
 possible
> > + * page sizes for ARM devices could be 4K, 16K and 64K.
> >   */
> > -static const unsigned int orders[] =3D {8, 4, 0};
> > +#define ORDER_1M (20 - PAGE_SHIFT)
> > +#define ORDER_64K (16 - PAGE_SHIFT)
> > +#define ORDER_FOR_PAGE_SIZE (0)
> > +static const unsigned int orders[] =3D {ORDER_1M, ORDER_64K, ORDER_FOR=
_PAGE_SIZE};
> > +#
>
> Good catch, but I think the defines are just overkill.
>
> What you should do instead is to subtract page shift when using the array=
.
>

There are several occurrences of orders in the file and I think it is
better to do the calculations up front in the array. Would you be ok
if we get rid of the defines as per your suggestion and make the
calculations during the definition of the array. Something like this:

static const unsigned int orders[] =3D {20 - PAGE_SHIFT, 16 - PAGE_SHIFT, 0=
};

> Apart from that using 1M, 64K and then falling back to 4K just sounds ran=
dom to me. We have especially pushed back on 64K more than once because it =
is actually not beneficial in almost all cases.
>

In the hardware where the driver is used, the 64K is beneficial for:

Arm SMMUv3 (4KB granule size):
           64KB (contiguous bit groups 16 4KB pages)

SysMMU benefits from 64KB (=E2=80=9Clarge=E2=80=9D page) on 4k/16k page siz=
es.

> I suggest to fix the code in system_heap_allocate to not over allocate in=
stead and just try the available orders like TTM does. This has proven to b=
e working architecture independent.
>

Do you mean to have an implementation similar to __ttm_pool_alloc()?

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/drm/ttm/ttm_pool.c?h=3Dv6.15-rc2#n728

If that is the case, we can try the change, run some benchmarks and
submit the patch if we see positive results.

Thanks
Juan

> Regards,
> Christian.
>
> >  #define NUM_ORDERS ARRAY_SIZE(orders)
> >
> >  static struct sg_table *dup_sg_table(struct sg_table *table)
>

