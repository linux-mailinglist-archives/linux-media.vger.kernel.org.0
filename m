Return-Path: <linux-media+bounces-17249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BECD5966BFB
	for <lists+linux-media@lfdr.de>; Sat, 31 Aug 2024 00:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 633611F23AA9
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 22:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB5A1B29D2;
	Fri, 30 Aug 2024 22:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="trKEe8d+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7A616E875
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 22:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725055251; cv=none; b=qvEbYANLIRTizTJDbO7nbzoRqbzmuVvvqApdJoas4/3Bn30tIzQjd46xwwGqBG+pWyuq0FbVvXvbWETe9vxAhU7nnEqsl7377tE+K5pBspX8lc/Y89xi8Eu/4KqnY0c/SHunGLkXid8XE0RMqznBSAQ7y30CP8wcMoin5EbORlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725055251; c=relaxed/simple;
	bh=v0xeIN8ym88vwomiW5NfpJrxB02SBhHfO16FSfOdFis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHpFGXN6IQ+oDFmVoZq0/c7v0jaUy1IuVEpAJcKs8W7YYAb6prXljEqhokfZFitHbJpccO/q4YCk7F64Z/1V3vXKS1/lUAEX3QP8RKOrOtBp+tDNouZKHJyP43C2osO/wQvXWMZBTOIqsA9oSgpCXadvVCaVgjSzBLTs3n3JTgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=trKEe8d+; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5343eeb4973so3535053e87.2
        for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 15:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725055247; x=1725660047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzW45B/KJymSGOyNF+ZzLXt4iw3UbCWPr9vwljHJip4=;
        b=trKEe8d+FfYEJJR5ZIaWxxhtuvd/JaQ64Rv92HIfhh+Zd96n1Xaj0JutzssL2g1BSc
         2Eb31AJtBMrDDblluWatzKrXiHMEl7H5UBnGzTcjsKgIE5DiOhk/GX9/m0RgQGknLEfJ
         k1JmYiE1bVOY5HGEzYH0w8bCp3IPgIbIq9x618Gt4h7bPLrurV2hRGcSlxKKw8ZE9R/c
         jcSnRcYbAAcNpjdB1cjCyL8eaTZFqGErLy/9hu4pdRfcIF/9l6wy3PZgy+44NgxT9d0V
         OipPSFQNhe5OiP/qSCERiiYzdApTV2DEfcltQddvn5BQ6e1iRYeOG7fCs5zwGnErjpOn
         pjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725055247; x=1725660047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzW45B/KJymSGOyNF+ZzLXt4iw3UbCWPr9vwljHJip4=;
        b=fkQWBaV6p/yuhj/DN8aaciTPMyYl+za8FImXqTUlgVnuNt4RFWRKIx0JmjajQNXqD3
         sMDkYJE+KMkDszErKvPJ2COBfuPyxqzFqSoCbP7768M0liIJPe0ISHqjZBlxDvOqmke4
         mfBOi9eROGaxoucyb3FCRNddm2RXoQD+rmMtAgpDvu3rMRhXcks9Y+tjLn1sf0mnIttH
         /l5TuD+2NNqMgG7qD5S69KvjBbN7DLG5e5x5n23gyFF6ype4x49lUockglaOAZvIdTJO
         hp1xQrj7xJEVmAJRrbIwSLLN64eTZ0Z5khS2PMWYg8vMTvIKE+579CvALhuE4Hedqj04
         PlPA==
X-Forwarded-Encrypted: i=1; AJvYcCVqkZ2URKxvUfICqRbBLJnTu8M3cW21SpH73do2llaHJEbWRiJx52ENnOtx11WAdTmaBMlMZ8GyIZZO5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzL+6OUP+S4A94hKNd/wgcNp6tJ48WLxCz8hJf2bMumAPBFTUv
	LbYaRzM2o5qxrC6+XKFsKpvI6ikRctb1tYndlqbSb353WJ/48abiFgWMUWQ6M3mgV/812YRIHvK
	+GS0RZvMV/+DiT5v46NcIn06i+hKQm3AlDiI=
X-Google-Smtp-Source: AGHT+IFPQQvsxqmDS/76PwNqhHFuc4KN0lIvnnjTU83UXe1lfbOh5Vc0i6eo2lSA9HeuZxs7QXpK5BZptK0ZhUnEM6c=
X-Received: by 2002:a05:6512:acb:b0:533:4505:5b2a with SMTP id
 2adb3069b0e04-53546b4a8c9mr3000597e87.28.1725055246756; Fri, 30 Aug 2024
 15:00:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830192627.2546033-1-tjmercier@google.com>
In-Reply-To: <20240830192627.2546033-1-tjmercier@google.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 30 Aug 2024 15:00:34 -0700
Message-ID: <CANDhNCryrqD08fv+Q2kRHya1Z_w_eL6cbAzGaZT8cAsUSG1iLA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Fix off-by-one in CMA heap fault handler
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	android-mm@google.com, Xingyu Jin <xingyuj@google.com>, stable@vger.kernel.org, 
	John Stultz <john.stultz@linaro.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 12:26=E2=80=AFPM T.J. Mercier <tjmercier@google.com=
> wrote:
>
> Until VM_DONTEXPAND was added in commit 1c1914d6e8c6 ("dma-buf: heaps:
> Don't track CMA dma-buf pages under RssFile") it was possible to obtain
> a mapping larger than the buffer size via mremap and bypass the overflow
> check in dma_buf_mmap_internal. When using such a mapping to attempt to
> fault past the end of the buffer, the CMA heap fault handler also checks
> the fault offset against the buffer size, but gets the boundary wrong by
> 1. Fix the boundary check so that we don't read off the end of the pages
> array and insert an arbitrary page in the mapping.
>
> Reported-by: Xingyu Jin <xingyuj@google.com>
> Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma=
_heap implementation")
> Cc: stable@vger.kernel.org # Applicable >=3D 5.10. Needs adjustments only=
 for 5.10.
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> ---
>  drivers/dma-buf/heaps/cma_heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index c384004b918e..93be88b805fe 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -165,7 +165,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *=
vmf)
>         struct vm_area_struct *vma =3D vmf->vma;
>         struct cma_heap_buffer *buffer =3D vma->vm_private_data;
>
> -       if (vmf->pgoff > buffer->pagecount)
> +       if (vmf->pgoff >=3D buffer->pagecount)
>                 return VM_FAULT_SIGBUS;


Thanks for fixing this! (And thanks to Xingyu Jin for catching it!)

Acked-by: John Stultz <jstultz@google.com>

thanks
-john

