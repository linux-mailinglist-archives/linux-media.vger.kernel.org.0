Return-Path: <linux-media+bounces-6493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5740F8725E3
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 18:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A2151C21A7F
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 17:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69AE175A5;
	Tue,  5 Mar 2024 17:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2woS2lS0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD59917565
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 17:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709660767; cv=none; b=jfgvCyXS/l15wYCyf8JCfMsgJCJUFUoUeM+5jJctWg/eh9524bdF2Y4h6Tfe23SOhDRXsQLC3OHXIDl00B7r9d7EmMiRppBOBoYUMcVXOfsKSrtItIs6OTDq5z6Rvv0oGaTpbPzh6UxRDSuTY4ha2LWXw/qEZVWGuY19lcbEwHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709660767; c=relaxed/simple;
	bh=9MRLYZX4HE1Pc/fYNDu9fI5JTAIW4+zdyj8ssC8V+gI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbUvDvjwjFEX50zhyIUHA0zKuWJksDk6Ujlpk4QEJp3KUbgQmJD3kGgglTMRBylbtGtIkyMLedNCQISmHnq98XjlBnrXsgsM2zJiVNnsB/1cvU9J3e13dBbyyLQ4zVo67dkGlf93UbqWh4XYkhk2SoJvt/oHXGCDfJwtvxKllWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2woS2lS0; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-608ccac1899so761257b3.1
        for <linux-media@vger.kernel.org>; Tue, 05 Mar 2024 09:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709660765; x=1710265565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGRt8RiRcM7HoBToJhGy2IhtOk9BsPJwbK84po2hCcM=;
        b=2woS2lS04OVB+822pbXhRI7/VMjRhK7cDgpkIM5/DOgl6MV6hKWK8Ex8lwfsONi8Xs
         1+nqIoS61QyjJOWfvIubapg8yTnyz9gN/FaF2ZAGtFq6RoeZq8nMqP2aGd3dWP5QvUvH
         50lbv6M/Je28zW/2Xy5MtFjnkWtz3FHue0PS0lPmGmXEliAUpxt3VKz18JXwYgQ4Bf9L
         ckdW/ZLN9La3b0JxC3do9ASkqImKypYisntOjFMb+//FEgPxI+X8mr8NgNxgDMjHKIQD
         uIiYgW2BC5gifNan6/ziN+Niju7c6K2UKajJNTVuJGH5HfbmfRIP5U3TdN+aRWoM9YHh
         Kqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709660765; x=1710265565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGRt8RiRcM7HoBToJhGy2IhtOk9BsPJwbK84po2hCcM=;
        b=GBKxQpgE4iDVvJ7G/kkRyYTyRyAwlW9iL9r4MUS/l7C9ld6/4clhhvMtfP44UW8aiG
         3dJCgbO5w9iYPn6MlVESAoLrk+1ZZT88PCQ5yUBmKFokO1TBoVH3B2TR9naWVJ4WglsZ
         +CRJSSUswzQbrmyovGOzAps9durAzCE0wCNZCM3zvpyfh7tDxt/fTM4esiWkOLx3FeTn
         yEEcBONMuJwNtVBmZ/nUNp+tVnYDnYOfZGaxJQWg9nvNsqmS6k4QmoTWLN0sKmkAWA30
         2YWxao2XXC1juJk8lwiHU02foJgJRrLGajnHiWnnJPgO63u16tMC4i+hvlpbK8bCgPfQ
         2DNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt3JbI/JLKYrd//CKaju+pg9RGEsIRRwqFExdestAtZPZRFBEpPbyu1RTXc7QQIEB3tbg0h3pDVR7Tiofn6VeUkCns8VgzUi62trg=
X-Gm-Message-State: AOJu0Yxw+B8fewHpqAQBrKr8ymCXoPOpDOW/aCWB61D/++9M02dQbMsr
	8z85gmWYqsS5WgY7IAvrhdpAD1TbGHviWnlYP8W0Es8b1JcF24Ra9eX/QxG0psVniTDWZjKrqhR
	bwWuoU6qWqX9UaRcRFEVS8kSVbSNS3m5I2onu
X-Google-Smtp-Source: AGHT+IEH4w81wtDgQ7qxtxm4j8GNKlHjLhmHdUhbPcgEgL2YwGAU2Z1QETpZifRDvMKeW4+uwUhNXQh+A2JI1zKU2JU=
X-Received: by 2002:a81:85c5:0:b0:609:9171:130d with SMTP id
 v188-20020a8185c5000000b006099171130dmr8371354ywf.19.1709660764517; Tue, 05
 Mar 2024 09:46:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240119033126.1802711-1-ototot@chromium.org>
In-Reply-To: <20240119033126.1802711-1-ototot@chromium.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 5 Mar 2024 09:45:53 -0800
Message-ID: <CABdmKX3azAE9HPLBY3sEFm5YYM=AUp=-RArDjG+ksecx0O+6Gw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Add syntax highlighting to code listings in the document
To: Tommy Chiang <ototot@chromium.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 7:33=E2=80=AFPM Tommy Chiang <ototot@chromium.org> =
wrote:
>
> This patch tries to improve the display of the code listing
> on The Linux Kernel documentation website for dma-buf [1] .
>
> Originally, it appears that it was attempting to escape
> the '*' character, but looks like it's not necessary (now),
> so we are seeing something like '\*' on the webite.
>
> This patch removes these unnecessary backslashes and adds syntax
> highlighting to improve the readability of the code listing.
>
> [1] https://docs.kernel.org/driver-api/dma-buf.html
>
> Signed-off-by: Tommy Chiang <ototot@chromium.org>
> ---
>  drivers/dma-buf/dma-buf.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 8fe5aa67b167..e083a0ab06d7 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1282,10 +1282,12 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF=
);
>   *   vmap interface is introduced. Note that on very old 32-bit architec=
tures
>   *   vmalloc space might be limited and result in vmap calls failing.
>   *
> - *   Interfaces::
> + *   Interfaces:
>   *
> - *      void \*dma_buf_vmap(struct dma_buf \*dmabuf, struct iosys_map \*=
map)
> - *      void dma_buf_vunmap(struct dma_buf \*dmabuf, struct iosys_map \*=
map)
> + *   .. code-block:: c
> + *
> + *     void *dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
> + *     void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map=
)
>   *
>   *   The vmap call can fail if there is no vmap support in the exporter,=
 or if
>   *   it runs out of vmalloc space. Note that the dma-buf layer keeps a r=
eference
> @@ -1342,10 +1344,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF=
);
>   *   enough, since adding interfaces to intercept pagefaults and allow p=
te
>   *   shootdowns would increase the complexity quite a bit.
>   *
> - *   Interface::
> + *   Interface:
> + *
> + *   .. code-block:: c
>   *
> - *      int dma_buf_mmap(struct dma_buf \*, struct vm_area_struct \*,
> - *                    unsigned long);
> + *     int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *, unsig=
ned long);
>   *
>   *   If the importing subsystem simply provides a special-purpose mmap c=
all to
>   *   set up a mapping in userspace, calling do_mmap with &dma_buf.file w=
ill
> --
> 2.43.0.381.gb435a96ce8-goog

Reviewed-by: T.J. Mercier <tjmercier@google.com>

The code block highlighting is nice.

