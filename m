Return-Path: <linux-media+bounces-47901-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E761AC952F9
	for <lists+linux-media@lfdr.de>; Sun, 30 Nov 2025 18:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 745703423E6
	for <lists+linux-media@lfdr.de>; Sun, 30 Nov 2025 17:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA0D28DB46;
	Sun, 30 Nov 2025 17:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XXSbX/my"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF0B15A864
	for <linux-media@vger.kernel.org>; Sun, 30 Nov 2025 17:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764524421; cv=none; b=BFObRLXhsc8Vvd7DZPtdayJfWz8YaDfs4AIyLHWVBZlIXsA60EgQo8XoZHsMej2f9s6hlZpV4LD3daKBD4/AU8+OEZThEBEjORkSXTiJ23GFOp4rj3F5JM+sN1CZYhQZtLIZlDSFJ8fK3NWNGguMwaiBgWsxR6zLpzas39D/j+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764524421; c=relaxed/simple;
	bh=s7H7bDQdAkrDddSMT4BNNKzCaSia+99fwAU3Iyrz+8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGtobMbXnXh0InNPCabNzC6EadD1eFGKEvf5eaX2pQGzQwYcBNyoEYgpQRZmGvJk67tL+sD58HrUIP0UIP9+p7v9IWTqht7naIGLmL77ETZhXGQUHW31NHatRfG5LMuuhSnAsoSNRnWYemKjkyq6BB6jgZY4B9bTgQnmVd7tVbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XXSbX/my; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779e2ac121so195335e9.1
        for <linux-media@vger.kernel.org>; Sun, 30 Nov 2025 09:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764524418; x=1765129218; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4Na1WnWt98FnIwMW2cXnPG9QEtYrpTgxkwDunJeAk8=;
        b=XXSbX/mypShNbGlVVgRCNc5aMrUEwHFb4B2YWqVaETcc9GYjQYqqSAuQqYizaqQvth
         MZ26xBRviMgujhUrOhsZFFdm5vPypptm+FD0+Ve+1HVKHfSv9k9LCGmMbR4UVRygc9/9
         iD8r6/jxa1eJb6sqfiWyumBF5aXXK8ngLBj0oxgt8je7mCuBlpeyS+40cmc1lZS7Pf+m
         DdpKVEWelModCeijiXHqasVydnObURV0Gga2BkohAIvifkAFPkdfg35q4Wib5sPbz/EJ
         Ulp0qRrUQh5U2ttrD+Qn/dAYgBG2pKj5EGHS1iZzbQTq9n/uMq/eQH2hiJpZtUdctpqQ
         eX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764524418; x=1765129218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L4Na1WnWt98FnIwMW2cXnPG9QEtYrpTgxkwDunJeAk8=;
        b=p/6kRehMHv//Y73pDSYeuQ7yk3lcjIWg/7aQM8rSvkvfV6O+kS0a8WOM3S6LKi0pyb
         5I7uCouu/zZiQHChen5Ouueonfxn2mJWXQceWHazQdclSiQO/wO0wQ5uQf/+gIRQUlWB
         UM2FhatDvqbE/A5Ok8b3y3G98L+v1yyOom5mRba7X/+VoKGxlvBG2Ca9K7yQsVDl+Qrp
         UdXHp4Pmtb/12w5W1Re8xed2h9ZPko2m1CWdnitIyEG5/3JwfeokxfNh63LQuVSXV21A
         wnJyhM8axZqLhxDZI1vfuNXrb8lX2M503WEvVsw1j8CuwyxkvAZtuZIMSg6t9B0iVUl2
         XCzw==
X-Forwarded-Encrypted: i=1; AJvYcCUXkBfkrsFDM0vc5MUtf5445OQkYBIcRHrQt3pkZE9FfginQgC3gmNz4zj+UYGQpXqXsAowjOoafILUXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKmZOuu5wivv43uVfrYTTSUyMDyDXW6I4YazvvXIM9hp63ZdRN
	l5RLmaH+rIf+imhFEK8498pQ7UDJbDuDVDM8HOf3SWiEvMTPDHK0rAWexo1x+m40ZCkdTZu/SGz
	L09WPq3iRlkeZogt/nAjJBS6zEwGzaoF7IIuGK3/U
X-Gm-Gg: ASbGncuY5wf9vKVizGDQoTV38H4EkJOMddsZ1C384CZKeyBMspAjGVtTK7CmHcUhfqP
	tmbNyXuVcccxlMKSE0bGt3IKhXQELjq0GGVUQdsfuHXqtG/uiwgT78hnYpWgdDsS4LLK+cez8Av
	tpDemzZhRpSQFEYrd6IVeIzavbq48+xbKyXKI0IFdEvQLoOcIym0KsWb2aCPAsJ14kdSU8YAtFq
	K3ZaxTsNJwcT1FZDv2pX9OhyY8+C9c2bekMGQ6W0Muci3mMK46KI9GQgfzUr3PYahljIKZPBxQL
	fJ9bAynysEXfaT8VX9Inp51bSvJH8xCBYYvBkVYntwCEpgPYZ1BARwCp8h3URw==
X-Google-Smtp-Source: AGHT+IHlTVz7wW8BG+EB/zJr/z7m4Wjnt3IV1uAh9XtpVidYWPvE2DdOvZABmgAV2wINgEeD93te3ZXLwt2sI23wYH8=
X-Received: by 2002:a05:600d:104:b0:477:86fd:fb1b with SMTP id
 5b1f17b1804b1-47910a0f7cdmr1051315e9.11.1764524417540; Sun, 30 Nov 2025
 09:40:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251130-dma-buf-heap-clear-page-v1-1-a8dcea2a88ee@linaro.org>
In-Reply-To: <20251130-dma-buf-heap-clear-page-v1-1-a8dcea2a88ee@linaro.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Sun, 30 Nov 2025 09:40:05 -0800
X-Gm-Features: AWmQ_blosOa_VWvpKHaVXV4SgNmym-5ipECN2hZ2hHZsTsjHR9HcSCxA6X756f0
Message-ID: <CABdmKX3-jP7s5CCGeHc8Gz-mHBEwob983KXMcRmrTfpZz6d=Rg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Clear CMA pages with clear_page()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 30, 2025 at 2:54=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> clear_page() translates into memset(*p, 0, PAGE_SIZE) on some
> architectures, but on the major architectures it will call
> an optimized assembly snippet so use this instead of open
> coding a memset().
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>

> ---
>  drivers/dma-buf/heaps/cma_heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index 0df007111975..9eaff80050f2 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -315,7 +315,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_h=
eap *heap,
>                 while (nr_clear_pages > 0) {
>                         void *vaddr =3D kmap_local_page(page);
>
> -                       memset(vaddr, 0, PAGE_SIZE);
> +                       clear_page(vaddr);
>                         kunmap_local(vaddr);
>                         /*
>                          * Avoid wasting time zeroing memory if the proce=
ss
>
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251129-dma-buf-heap-clear-page-248bb236e4c4
>
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
>

