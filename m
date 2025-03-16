Return-Path: <linux-media+bounces-28318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A95BDA6366D
	for <lists+linux-media@lfdr.de>; Sun, 16 Mar 2025 17:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C7231888A51
	for <lists+linux-media@lfdr.de>; Sun, 16 Mar 2025 16:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6891D1C84DE;
	Sun, 16 Mar 2025 16:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OFwye/vT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17549187FFA
	for <linux-media@vger.kernel.org>; Sun, 16 Mar 2025 16:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742143276; cv=none; b=MYrHZSbP1zt9Q60u8KsWQRd0nZpd4phXnNKKyTeYtug1ZH/0+m0b+VhWvmlXFSSUnTt1uU7zjYtQu1aHJO4m7cP/eUUKT3EN6TsyACAZoWYoLOYYC+tFp7rU+5rYIkIDFdI3etszM98ZNsWWn2dDxSIPS20Z/XHda7yiM/hHgyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742143276; c=relaxed/simple;
	bh=OgYdSXr9I5BAjxiCmHbr5Zrj7rZOIE4makhbhwf+UPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ECdZsLALOh/8aUOOlRxj2KBobo4pKt8EAETVhf7EBjQ33t3k+EeCUtY2YmprsGhNqgzqqsYyyh2bKo4nLR1EHjxzvH/eGloJCKHKgx1M1BnnNHJi/JLkz1LFUtyKlXeuPxjAT5rgFAXoqd5JmgUmlU3hxB0dw0OAy4LU2vsVW8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OFwye/vT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4393ee912e1so45035e9.1
        for <linux-media@vger.kernel.org>; Sun, 16 Mar 2025 09:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742143273; x=1742748073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GBF4hrYNg5S2oageJXSHFRedLtcB0fhaX79E6KBaak=;
        b=OFwye/vTV3X0qbZBoK+4o1xOBH6Ln/IfnKp7KVKCOtgS73rPZBUQUb+XE/DRcnLApe
         CT6+jXXY0t9wUA9zYWwyVx1rIyHG1bXl8mHOgapgbo2HUD9QL0H9lNSj3F/zOvW/+kWF
         HOAawFvpElsca5tJs/3Vnkztg3W+hHVZOpspuuZHOPFIkTfyrgSX9AzmlCOX+XOkCR1b
         ENlnmzKw4aeNSMj/ZvyUN6GcRxfopAmibuqsFhcJx9S2N7BGHwMDokLguCGZK2fnVQJr
         rBGneefn+umB3oXse5qC7wjB+7mqb6YezdZWU1F905p2akCEli8H2IJwdp3B9J4fFpBJ
         DaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742143273; x=1742748073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GBF4hrYNg5S2oageJXSHFRedLtcB0fhaX79E6KBaak=;
        b=hiaUfIWiRfzWshRMqARCW9v5NUDbkaY0k0wZ2Kmm4UDYs93my98sOd94t7sZjhtbf+
         JM72fYs4xd0F8Bi/vjL8JC8CabN2ptyxpE+ydMb+Gtdy5i8bNrMWXUQFLHJ7aNQK3/8L
         Qxn8jcUBS8/e1Vu4qJK6FS43AS/hm5mlC4QJ0FJ+uyUbs7xFF/ep/lSsotEhyRySe0ZU
         PqQkL3kht3x12hoF9QQHZuV2DeCIa1ZYTIitvnJupkA84h+xtrZdYBFOTdtUjw1B1iik
         3O9YyehTINLcJfS/tibQfyHRS4pp6ev/1+gxpbDUCqNH8qi8ZMaNjqy3QtyRJIptOQkZ
         VuuA==
X-Forwarded-Encrypted: i=1; AJvYcCUBme60E2/B2dS/yNstGh6c6i0qoLyViEX80bE9X7DfdZ8zo34/MJh/ZJRjirh9DR7S9juahXiMXISv8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZggStiRZX2z91vEZ9X+RqYLUauPsVnb4QT72haqEogytP+Ohk
	YQO0zsbSdIA39Jl49KBvl5OgVNVvWeeows4YjJUL6uotsOrdekwCyXv3D6GY+jPmukGPNqSJQH0
	Odqw7e3dBEwLV1uDvCsUDgj4BA1D1qzYyG9HT
X-Gm-Gg: ASbGncuk7oGgDMfw/uJ2j8PaxjvgW1MdmON2oi3yaiJlHp9wQRn/QtanvPQI8WzGxP7
	1Od5kHtw8q/EqBsFJw16wTRD66ryT/vVhNunhWtV+xgQv+uLBwI98Zol1w7+PQ5k6kgxV4NjOt2
	7vdLHDhkYbi3oF0K6nvFxOvlBY
X-Google-Smtp-Source: AGHT+IF01D4Ob7pcCq8yAjLqxY9BCY5mwz1iWe7tPkMuZuzOjPrqhF7cEGLklDlZvCaLJveOXlkJJNWEbV8nPmuKJPg=
X-Received: by 2002:a05:600d:14:b0:43b:df25:8c4 with SMTP id
 5b1f17b1804b1-43d251f360emr1754805e9.4.1742143273244; Sun, 16 Mar 2025
 09:41:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315130201758KxKWj6Mb7bgN6SqVrzu94@zte.com.cn>
In-Reply-To: <20250315130201758KxKWj6Mb7bgN6SqVrzu94@zte.com.cn>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Sun, 16 Mar 2025 09:41:01 -0700
X-Gm-Features: AQ5f1JouN29fy-ISQChV-CR0419-uR30-ym4OBM0CsdHXmZK3sOodPrtzjtePzw
Message-ID: <CABdmKX02xw+bDiW9ruXO+nLtDdidQsfKOp-N7NgvACHKyYq8xw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Replace nested max() with single max3()
To: feng.wei8@zte.com.cn
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
	brian.starkey@arm.com, jstultz@google.com, christian.koenig@amd.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2025 at 10:02=E2=80=AFPM <feng.wei8@zte.com.cn> wrote:
>
> From: FengWei <feng.wei8@zte.com.cn>
>
> Use max3() macro instead of nesting max() to simplify the return
> statement.
>
> Signed-off-by: FengWei <feng.wei8@zte.com.cn>

The commit subject should include "dma-buf: heaps:" as a prefix.

With that:
Reviewed-by: T.J. Mercier <tjmercier@google.com>

> ---
>  drivers/dma-buf/dma-heap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 3cbe87d4a464..96cb9ab5731a 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -147,7 +147,7 @@ static long dma_heap_ioctl(struct file *file, unsigne=
d int ucmd,
>                 in_size =3D 0;
>         if ((ucmd & kcmd & IOC_OUT) =3D=3D 0)
>                 out_size =3D 0;
> -       ksize =3D max(max(in_size, out_size), drv_size);
> +       ksize =3D max3(in_size, out_size, drv_size);
>
>         /* If necessary, allocate buffer for ioctl argument */
>         if (ksize > sizeof(stack_kdata)) {
> --
> 2.25.1

