Return-Path: <linux-media+bounces-48660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 608D5CB760F
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 00:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2C1230141F6
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 23:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3722E62D0;
	Thu, 11 Dec 2025 23:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z1fQf6qQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4858B2DCF47
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 23:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495535; cv=pass; b=dlI0ep4riWSgV3zIMQCa/0VUy8gf22DGjk4MU1Gvk6cLMCn8YOt6pJ/hfQQT52DBJ11458VsK1H4JuxsIGOU7PBpoz9B9fWQiwo5Af8GOmRJl8NB/bhlbRT6r+P6s7yTWJHWh6EBmu6RpEdrgdUUPbTbIoSgLeZTNdyPY8lXoDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495535; c=relaxed/simple;
	bh=Z5w0VPqMHIXK/BrJN3BsLyCyh2/QNuaBpA3CEz+Eaz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FdfgvOID9rTVHvftkAbc281/xyrRhtB4edo1Zs+6TQZ6PPka/ogbAHOvi5b4hXqwqeP0/xRvm04y84pr4utma6+at4615R0tFkNWLSxnIR+W1EUCgG2LmC6rzTIdbO+4zObWJrK2w0yeMbTf4v4APbxwxZQYVoS5AJd1mjwayDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z1fQf6qQ; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779e2ac121so113425e9.1
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 15:25:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765495532; cv=none;
        d=google.com; s=arc-20240605;
        b=eDN+8Ra8hf9dkO8XjBBU7/k7eNA12O02tCk7pnYLWhUWOC3AD/Mn6kYey4pCxpGXDz
         Te3Jpthx1EPqY4IctEC999rV251vUjKRJ8ePeppgNpYyLVoMYsMqSVUmQPz/1uPX1P1k
         i++zKatlWist5h0g0vC5RRPi5lHdxQXfeYQQu9RMvvBM2IUJA3qeiz6Ub7K+n9RAz1LL
         ZsUfNJVzJ2Udp9J6zHApdUBOLB3M5MjAgyHb8PdTL2rIGgai8en7fT+TXeZGdGZLeoAf
         49kDntemsLV9++voe57FT5ZcUrN0fMJqcrgVQnXJ2HUe6X3bHWffHyFSgbv1qd+kZysd
         Q+YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NgAS2i+WuabPCqxlCGTGd0RyAlQOwBDUG294JndQ1+g=;
        fh=+ATDqtvTLA8tXubVS9FR+6INwgsi3+GaQZoDg3CJ258=;
        b=h89JmWzc105dE8oJEd0rw6pxLug+kZifRYOxSjOjyVu455+5cSiia+u+LpgT/O59s5
         +HM3NYKh45W96BP20lsZUG9N3C60F4jjHeo4vZ7Y/ZdUnuNG9Pfmug1VcNSs6Hsrb+CG
         XXtxFCKqsa6as8hQBookqD2/d751HfAIoVHUtJgcjVtsTZfL/d9wSZMp8ujwl+G8N8I2
         GyOee0v+9AzvPcOeFs3FSJsAYZlrjgxP/GN9EWpIGvBuE9mP/2JgSVJZTl84I3B2iLBR
         LcrtigQDFWF2FxKjCVJ5f8qxyLZ6ry19OEocnyf7lEAfMJXSaRut596lxtwXO+BN40Zr
         7kpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765495532; x=1766100332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgAS2i+WuabPCqxlCGTGd0RyAlQOwBDUG294JndQ1+g=;
        b=Z1fQf6qQMNLz22FjwcZIL5BgwCiUiJ+cijAZMBQLovdwtaBM6VeE0JdU8YTG1saNOU
         SUCzfcrT/74lN9mRgxcsPchtV6HQvLxnKAP4fBj4XWZndG7cV1ku/xGbGDeftESDn8SF
         T1SuhXgmorBtrsV6vdCTP3O+cCHKn9UQa/b1rRP2seQGr5CB4fh+yNZlqg0ftkNwRk/L
         OlZc5TKbd0cWCqXjDPWuG8ZQlkbS8w1y2/PGWBhrsvPEklaOxHMxCsLobGZD2eCqHz4C
         HI/H2IYVp1uS8RCXLgk1xkWejRGlS3e6J1xMsQ5yeWQo83CpNqtFCJsB0xIL6lN9pEyr
         2nyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495532; x=1766100332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NgAS2i+WuabPCqxlCGTGd0RyAlQOwBDUG294JndQ1+g=;
        b=sOmn+cT0EnVxK6RlloFDt/EuwYZmVAhNIyYK6TnN6zctoUh4F0jx/mD+QyabgwPWKK
         92VntDRz8XL9mSuckmpnPIyMWZ4MZfgRmJUY93f4Y6LhB7gv7AukShUU4c5n15Oe+ENy
         hsVsPtq9dJf4rNLWsTdMhJjMvcSS5iiWyifKnhTQzwMqtoLX1YJGvcKFsM9ZqwaHqXLJ
         zkZzKCcOIOLm9f5l3+4YR09tTaG8puRhmkLWf8DjHmquGcvy0QdhBLx2OEpz4VXMALpo
         gbjBxN+0J6M6avh1tgkK9Seag63WpE2ALRIOozI0Wcw0a5ierUfZvVL2zqY/i6AEmDQI
         mVEw==
X-Forwarded-Encrypted: i=1; AJvYcCXBXMMoVQyAVFlSyzL0JjWORHwIfBNxXncnckwoLUTALmuTdJBqegGr9GZR7FKNyvWGT258M7jd+A0MnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJK2iO+8KpqRRB8mZH7jF4EJ9cQkvT74AYPegmVwGL/HX6bCT1
	y4gxfxPDlTY/nrnF/CGCkeOtxxJ0UDA7DSbLEAHiICC+8UC+j08qY7h0RENEQFWArrAok1/crXD
	6IwTiIbQ6i2speLyavRI+y0lLgyLBYzFP0cDdBMN0
X-Gm-Gg: AY/fxX4GElc6MLwOXpkm54bQGu7tjw47HW209ff7/CmUIfC8/FYxNBn3h61eMlCVTkC
	gONVMHu1LqKgMZkz6HT5DpQxBasZPBzpaqF97dKqBRCBkoiS1ttBXvMq+P8A2n8dMHJq3pGVS0O
	71ZaaXAIg7Q6OftzHNz5cRfsviqbiSL/CRUIUtf7WYzc7SKWWAH9iOoPo/Mq9fg242U5ZVuZ67A
	2n7iIONrOG4fqNr/ovW7T0V7STLQvUBJrTcfaJzI+3tMXwc74UWE15XS6yl22oJIF3A4OMdhhwo
	HkY45QxzueAqpGrswosnGru94RK3
X-Google-Smtp-Source: AGHT+IELsxBEvLr9lhxQI6U6yiPfylzFjjXDhgwGFlEHLwYN/fZlRQWWLcQMcMN3K4irAeygHhzmk1gxOJpHCOinQXk=
X-Received: by 2002:a05:600c:4f0e:b0:477:772e:9b76 with SMTP id
 5b1f17b1804b1-47a8980f35amr1528645e9.7.1765495531556; Thu, 11 Dec 2025
 15:25:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211193106.755485-2-echanude@redhat.com>
In-Reply-To: <20251211193106.755485-2-echanude@redhat.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 12 Dec 2025 08:25:19 +0900
X-Gm-Features: AQt7F2pSTNWKDsucwV-uysbrv-q3tz8hqRtbVQ0Nrt24_BZVepbEChaAJPcQzz0
Message-ID: <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
To: Eric Chanudet <echanude@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Christian Koenig <christian.koenig@amd.com>, 
	Maxime Ripard <mripard@redhat.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2025 at 4:31=E2=80=AFAM Eric Chanudet <echanude@redhat.com>=
 wrote:
>
> The system dma-buf heap lets userspace allocate buffers from the page
> allocator. However, these allocations are not accounted for in memcg,
> allowing processes to escape limits that may be configured.
>
> Pass the __GFP_ACCOUNT for our allocations to account them into memcg.

We had a discussion just last night in the MM track at LPC about how
shared memory accounted in memcg is pretty broken. Without a way to
identify (and possibly transfer) ownership of a shared buffer, this
makes the accounting of shared memory, and zombie memcg problems
worse. :\

>
> Userspace components using the system heap can be constrained with, e.g:
>   systemd-run --user --scope -p MemoryMax=3D10M ...
>
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/=
system_heap.c
> index 4c782fe33fd4..c91fcdff4b77 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -38,10 +38,10 @@ struct dma_heap_attachment {
>         bool mapped;
>  };
>
> -#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO)
> +#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO | __GFP_ACCOUNT)
>  #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
>                                 | __GFP_NORETRY) & ~__GFP_RECLAIM) \
> -                               | __GFP_COMP)
> +                               | __GFP_COMP | __GFP_ACCOUNT)
>  static gfp_t order_flags[] =3D {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDE=
R_GFP};
>  /*
>   * The selection of the orders used for allocation (1MB, 64K, 4K) is des=
igned
> --
> 2.52.0
>

