Return-Path: <linux-media+bounces-11749-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1368CC661
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 20:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B9491C2142D
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 18:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335BB14600F;
	Wed, 22 May 2024 18:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iAQURosu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B851422A1
	for <linux-media@vger.kernel.org>; Wed, 22 May 2024 18:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716402834; cv=none; b=POibo6vAcVXJrr0Us+uKcX+2hDf/0IxmAASoKJnTOmEBE5Z/gAeIaVq7WEDsrRbaA5li9UhH7i0wfpb/DTOuEiGVgz1PKaq0N8hk9i5wYHmp331PXp/OTffk9b55mI0M08GxpBeVhhozf4/yh7O/9SxPcguHttcqG4yD36gY0UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716402834; c=relaxed/simple;
	bh=jnEBtkTj6abvY8mxMmaxe+8NYxHaAdanWXFKxYwaKy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ix9oFQ6MPwYfKKiV7/Vb1SfqkwGE+0qwo4uAs5xOc4qjwBOFXUpETMvif9abJGiB9DiqbVsJQipn/27Vz4DyV6UVMSKqW7MGxVzsMOYUlBjQbV1tWWvi4te7/9bSq1AKmSEIMF9XZBN/4z9mGqiep7T6sYW580sXjgAXQvmaKiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iAQURosu; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-df457d734abso1275796276.0
        for <linux-media@vger.kernel.org>; Wed, 22 May 2024 11:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716402831; x=1717007631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EbhQWdOoh78Q/g/fDhY/dpoBbFrko5oWqLo7rk8/U0=;
        b=iAQURosuJKIEGwWLqugJ/0GW5yZsg9VxKsQhWA7Qqc6+rFSFLDbtWEo8q7xiItLTJM
         XUHgmeYz5TJu4SvfIMhmil5K8APXmbv6Rps1zGMTLMOsG/rf9VYotCuZPF3k8+Pop2o3
         DTQDy6bJRzBV/QGKkGpkGmnRjO4Aki0E+bVL/JyRPPzDtmfXWphXnw0Fvxe/mWXPps+S
         GT9mYrB/cg9cGeEpXs4GZEmttMMczSg4edIYQz8ES6x44RG7+tRLgJRfl1yxr/O7DwkJ
         vu3pRO5r8vyT7rEzFqfcS7iIQG0KyaAsCc13F4T8rbsgiihS0qzuGHxerq7/BYNUSD5E
         yp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716402831; x=1717007631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7EbhQWdOoh78Q/g/fDhY/dpoBbFrko5oWqLo7rk8/U0=;
        b=Y1hhFdu7mZGh953QHG/DQqF1iwhIHPyQwoe+YBwNJsU4axPilXMVD6mUgQ/zebrRQs
         Jv/YU8KwVFyesXMJYeSzH1HVb1srPjwneQu5kJ5ZBu7lxaiunxyKHyZLwzGXdSO4MnAX
         PlM1Xb1cvJQJ/afgz8E10DlRq6jgLQ72hbNzZlUUd6Exz9RK7JHJQByEJq8SK37depc0
         nwcC/OtEQnDTbTcUCjI2LVkYzPHvH5+ca4syWqT8YhJh7hKhoDTfTvOFzFIurFSvr56L
         WDxY/SOxvhF/1abzEp9TraWIxDAP3FfOzfSy2sgpPhuN4d64zYdElNtoT8UsQ3oK4Nyz
         /jMg==
X-Forwarded-Encrypted: i=1; AJvYcCU5JkGEKpn7MU5ICgncivrb8VwKC1Uc2ICMP4jmixB9ehm3TZXRw+QbtTgLvRVAKLO5nizUcqffRlprT8FW+/Y2El9gIyu8jR5GCxE=
X-Gm-Message-State: AOJu0Yz/fuWr3KdBNSi9phdhrjNKPSgcOFyCIHFJZDGurqpnGvjqtS+X
	KoSDdiIhrPZpmzUMY0phpCo4KibO8L1cb5tu/luIYidzT3nG789HJtpcuS1C97zYemloolDRmKK
	E8qUP/n2OdnWbflyXWlPWanh1mJAJ4p6BSA4m
X-Google-Smtp-Source: AGHT+IGN47Nmo4f4RGiZUu/PPp/jTEE3uqbIMeUgnJAorz3ApRFTFuY2uRHKB4JKQhH3PzXLlW1bM1uS2dJXihd38dY=
X-Received: by 2002:a25:a2c4:0:b0:de5:51a1:d47a with SMTP id
 3f1490d57ef6-df4e0c1d0dbmr2686142276.28.1716402830630; Wed, 22 May 2024
 11:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522181308.841686-1-pchelkin@ispras.ru>
In-Reply-To: <20240522181308.841686-1-pchelkin@ispras.ru>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 22 May 2024 11:33:38 -0700
Message-ID: <CABdmKX2qdT0HvkX0B6kcxALwxZsLFOtgPsOP_rY0AXM1eAtAtA@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: handle testing kthreads creation failure
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Chris Wilson <chris@chris-wilson.co.uk>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, 
	lvc-project@linuxtesting.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 11:14=E2=80=AFAM Fedor Pchelkin <pchelkin@ispras.ru=
> wrote:
>
> kthread creation may possibly fail inside race_signal_callback(). In
> such a case stop the already started threads, put the already taken
> references to them and return with error code.
>
> Found by Linux Verification Center (linuxtesting.org).
>
> Fixes: 2989f6451084 ("dma-buf: Add selftests for dma-fence")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
Reviewed-by: T.J. Mercier <tjmercier@google.com>
> ---
> v2: use kthread_stop_put() to actually put the last reference as
>     T.J. Mercier noticed;
>     link to v1: https://lore.kernel.org/lkml/20240522122326.696928-1-pche=
lkin@ispras.ru/
>
>  drivers/dma-buf/st-dma-fence.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fenc=
e.c
> index b7c6f7ea9e0c..6a1bfcd0cc21 100644
> --- a/drivers/dma-buf/st-dma-fence.c
> +++ b/drivers/dma-buf/st-dma-fence.c
> @@ -540,6 +540,12 @@ static int race_signal_callback(void *arg)
>                         t[i].before =3D pass;
>                         t[i].task =3D kthread_run(thread_signal_callback,=
 &t[i],
>                                                 "dma-fence:%d", i);
> +                       if (IS_ERR(t[i].task)) {
> +                               ret =3D PTR_ERR(t[i].task);
> +                               while (--i >=3D 0)
> +                                       kthread_stop_put(t[i].task);
> +                               return ret;
> +                       }
>                         get_task_struct(t[i].task);
>                 }
>
> --
> 2.39.2
>

