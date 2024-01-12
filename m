Return-Path: <linux-media+bounces-3657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D3382C777
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 23:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E136D1C2277E
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 22:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18CF518C3F;
	Fri, 12 Jan 2024 22:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c5qcLjF5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2875014F6D
	for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 22:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5534180f0e9so1419a12.1
        for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 14:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705099969; x=1705704769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zEBqjbWZbZ/3Uylirb4GeOi3RLFiwNvDX78phkZWD8=;
        b=c5qcLjF5G6rsdOJSEN+5jNUHtaJnz6bg7DZd4TSYSqQlU69Btav9OyEpNvGvhq3rab
         FNQJK0of7qznSdVcvCFVRGru+BYD31/qz7NC6AHp44IrONbUvE6bDEa1Q0YGVlyXtvUU
         KQPO89/QEm3MTb8C7uGUMGqB51qIP6pO5LVG2SuKQf3RCLFrbBAUGbT90GN6uzcJO+tD
         xVaMuzulaP5Qxw4Pe7+wtK3mi58rzoEhlnynwPY40AnT9adIRqN/7Bn0BE5sVpgzYr7N
         cxA2l4/xBs0dSf0qvDZkj4mLoE9R2j3uXyx8vYjWlDJCZIgBtkPxl3LwNDHwOdJyaece
         683A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705099969; x=1705704769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zEBqjbWZbZ/3Uylirb4GeOi3RLFiwNvDX78phkZWD8=;
        b=BU/m2E9in2fB8AIMah4xDjWbejAB//6rtyaDC6r1mXkF9CiVaah9RctxFzIHI/SBCj
         nAvxycBc9B/m1kAu6ZaJzNbcdpo5FVLDvMxl+v99EtVHMHdPa5mgEdOJkQygTwuilXOJ
         phvavWmNGjc0n6C+e8IWh0mqomZl5uDaXb7YjXUo85suzCT6VkqmfzmIwcEC0k1MUXVQ
         xAjOK5A97XoJVLGkKEERZtzsTPzqCapzwLIRBbOA3ZjXJS7aKNVsXwbd28Fok4GsWTAa
         qo269fU6aAZy0LCHnU4orbrvReVlRpV/cKx5GrodWn5lXOlKLWc3PNmj6osKI6ySzUBb
         NuVQ==
X-Gm-Message-State: AOJu0YxTuNO0iihI0CrFdcYs0fYMaXszn/S1PtB16mUDXc5o6JiqGfZV
	wvVjCRGL470/zhUEvvcSFnDpvV4QDVD9dSEJO4cn+wgu0Kc=
X-Google-Smtp-Source: AGHT+IHkgMN1yQJBbcRo0BFB3B8pFJiDvEWeO3tE0O3jDrHXiN3BUhVwpu15ZRDxRy6MkjLufhC9Rmys7MiCAQ75PZg=
X-Received: by 2002:aa7:c98b:0:b0:554:2501:cc8e with SMTP id
 c11-20020aa7c98b000000b005542501cc8emr18281edt.6.1705099969244; Fri, 12 Jan
 2024 14:52:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240112092014.23999-1-yong.wu@mediatek.com> <20240112092014.23999-4-yong.wu@mediatek.com>
In-Reply-To: <20240112092014.23999-4-yong.wu@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 12 Jan 2024 14:52:37 -0800
Message-ID: <CANDhNCrxpeqEhJD0xJzu3vm8a4jMXD2v+_dbDNvaKhLsLB5-4g@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] dma-buf: heaps: restricted_heap: Add private heap ops
To: Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, christian.koenig@amd.com, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	tjmercier@google.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Robin Murphy <robin.murphy@arm.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>, 
	Joakim Bech <joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, 
	Pavel Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>, 
	jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com, 
	youlin.pei@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 1:21=E2=80=AFAM Yong Wu <yong.wu@mediatek.com> wrot=
e:
>
> Add "struct restricted_heap_ops". For the restricted memory, totally ther=
e
> are two steps:
> a) memory_alloc: Allocate the buffer in kernel;
> b) memory_restrict: Restrict/Protect/Secure that buffer.
> The memory_alloc is mandatory while memory_restrict is optinal since it m=
ay
> be part of memory_alloc.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/restricted_heap.c | 41 ++++++++++++++++++++++++-
>  drivers/dma-buf/heaps/restricted_heap.h | 12 ++++++++
>  2 files changed, 52 insertions(+), 1 deletion(-)
>

Thanks for sending this out! A thought below.

> diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/he=
aps/restricted_heap.h
> index 443028f6ba3b..ddeaf9805708 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.h
> +++ b/drivers/dma-buf/heaps/restricted_heap.h
> @@ -15,6 +15,18 @@ struct restricted_buffer {
>
>  struct restricted_heap {
>         const char              *name;
> +
> +       const struct restricted_heap_ops *ops;
> +};
> +
> +struct restricted_heap_ops {
> +       int     (*heap_init)(struct restricted_heap *heap);
> +
> +       int     (*memory_alloc)(struct restricted_heap *heap, struct rest=
ricted_buffer *buf);
> +       void    (*memory_free)(struct restricted_heap *heap, struct restr=
icted_buffer *buf);
> +
> +       int     (*memory_restrict)(struct restricted_heap *heap, struct r=
estricted_buffer *buf);
> +       void    (*memory_unrestrict)(struct restricted_heap *heap, struct=
 restricted_buffer *buf);
>  };
>
>  int restricted_heap_add(struct restricted_heap *rstrd_heap);

So, I'm a little worried here, because you're basically turning the
restricted_heap dma-buf heap driver into a framework itself.
Where this patch is creating a subdriver framework.

Part of my hesitancy, is you're introducing this under the dma-buf
heaps. For things like CMA, that's more of a core subsystem that has
multiple users, and exporting cma buffers via dmabuf heaps is just an
additional interface.  What I like about that is the core kernel has
to define the semantics for the memory type and then the dmabuf heap
is just exporting that well understood type of buffer.

But with these restricted buffers, I'm not sure there's yet a well
understood set of semantics nor a central abstraction for that which
other drivers use directly.

I know part of this effort here is to start to centralize all these
vendor specific restricted buffer implementations, which I think is
great, but I just worry that in doing it in the dmabuf heap interface,
it is a bit too user-facing. The likelihood of encoding a particular
semantic to the singular "restricted_heap" name seems high.

Similarly we might run into systems with multiple types of restricted
buffers (imagine a discrete gpu having one type along with TEE
protected buffers also being used on the same system).

So the one question I have: Why not just have a mediatek specific
restricted_heap dmabuf heap driver?  Since there's already been some
talk of slight semantic differences in various restricted buffer
implementations, should we just start with separately named dmabuf
heaps for each? Maybe consolidating to a common name as more drivers
arrive and we gain a better understanding of the variations of
semantics folks are using?

thanks
-john

