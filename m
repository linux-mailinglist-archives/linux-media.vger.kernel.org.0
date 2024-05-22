Return-Path: <linux-media+bounces-11747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 942F68CC5BE
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 19:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C53CB1C21300
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 17:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C22E145A19;
	Wed, 22 May 2024 17:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Va+DFblz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D69E76048
	for <linux-media@vger.kernel.org>; Wed, 22 May 2024 17:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716399655; cv=none; b=oQ9rAO8ZYzGcTxCzmv8yQi7fj0M+PoBg8x603PKnuS533zG3pid96CNBTRTWpoy1tlf/x8ajbxa1iRmVYcNO9AruMbO0FPJ+qm7WCcUrg0zLDceX4P8bX7HXG7PJWs8ugqQvYgpp2MnnEhb2TRarGs/5TLAxhf7IDrAjjy99u1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716399655; c=relaxed/simple;
	bh=9Sf2fhKuvu8tkTp39Symjm4BKM51pxxuc1V5R+6KeU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=afdA8jInTG7CU+BPuZ10dW/M8/dyZy/YUvXGb6HiTeU52oJg2bvcFq91QJVJmTWT2qxNn8rM8Ij/SJm0vOCrDvnrPZa26N7tcm/VHgOFkRRjlM0shdH86KEXoyWP70Zi1yPfWCTdt56YHKWgDkk7ARTzJtEMTDGPO6hh89b0Ue8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Va+DFblz; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-df4e40a3cb6so997329276.0
        for <linux-media@vger.kernel.org>; Wed, 22 May 2024 10:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716399652; x=1717004452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+KExuXY6x2RNXAGihFUdQFtzxyzRd1UAydMgLYyZeM=;
        b=Va+DFblzR94AUco0PnOXQeIFm052mEU6OAf0V6XRaBsIhEp7Apsmt3WCtZi3hkyoSz
         CBvSGAU4iL2P/Raf4ex7hjqEz0/nf+4gzlI3WIRZ2REfbGsZ+Akc/pPK4DxJOQH+77pe
         iUeFdronwjetQ3leoyFqrH76tJBP51RjNcmZZ5lx77EFli2PBcGgAVWX7NTe2CLcoJeN
         oMVM2OJ9eAB4Utv7eH7YO2GCWx0fxW8wi9idWOjvpQYHJgOAGVo60aeUrxtBE87wtCFF
         v9edRbQLiAluaRL+8RdKE5rBUQw4uuqTF+p1dcxsZST/OeYJKLvZ2kA0HmrTQ6SHxo8U
         wkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716399652; x=1717004452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+KExuXY6x2RNXAGihFUdQFtzxyzRd1UAydMgLYyZeM=;
        b=eR3aO6mXdcftnqfXDUNmgUgKjK+jo8pblcfyuUg3wx1likvRStCnK56q/4FhwqdybA
         pelA327LL32+dhG3x3/HU5GzxJCLUYzQrcXnYkvePNaYMr76mkZfjy+WcnYzms+dR4IB
         q0+Wezjgaa891DRISoRAXsomSBMWSohwhCDAxeEqx1CU9VefOnPTAeiUT2Jr/ow1ETrB
         Cyii543iRTZeRXnCN2qQzjOIBqndj0th66rBkW2EhymNxLCPHxqS80+ScxpzJkkYoX1c
         F1EnvbcQ4Bp+E7aiq3dehAIdtz5b4qJUMD2X4ZRMr0CXBK14KbK4xtvtPVTGciNk4I3O
         sDBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf9yfKOuhpEzvF7quuZbGlAaBjz23zASktL52xTg1o25w5FdzYh1gnoLZGLp0wofgF7Vnv8I+0e7oP2SnVC8Tt1bAXBlft1zutMKE=
X-Gm-Message-State: AOJu0YwzKbeuCqFobxS15d9D/0rRGMWPl4bFrTrxvtzB01wHzDBGcLiU
	K2Phm4N90oPxlKxNYpTP/exfesIee9dS4/Vbh+/OE+WnSmIWIBh0NP571ZurLSDfL1r2d2UT1/B
	pNWKUGiJNwdwvjOQHzXmIvA78z/03Va94cDE7
X-Google-Smtp-Source: AGHT+IFEar4omGEdEg7p1pIeJHpqJdxEZysSMoFwL4CvUt49f3bponvnO1J/Gp3qNrH1hFjfFb/lUdHwXQMMQUkAlvw=
X-Received: by 2002:a25:e08c:0:b0:de4:5d85:6928 with SMTP id
 3f1490d57ef6-df4e0bc6db1mr3041714276.31.1716399651838; Wed, 22 May 2024
 10:40:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522122326.696928-1-pchelkin@ispras.ru>
In-Reply-To: <20240522122326.696928-1-pchelkin@ispras.ru>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 22 May 2024 10:40:39 -0700
Message-ID: <CABdmKX2tb_Vn8sF_hXVOMZ7HV9cU9KMwu_WyKrJuoeNjWF85bQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: handle testing kthreads creation failure
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Chris Wilson <chris@chris-wilson.co.uk>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, 
	lvc-project@linuxtesting.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 5:24=E2=80=AFAM Fedor Pchelkin <pchelkin@ispras.ru>=
 wrote:
>
> kthread creation may possibly fail inside race_signal_callback(). In
> such case stop the already started threads and return with error code.
>
> Found by Linux Verification Center (linuxtesting.org).
>
> Fixes: 2989f6451084 ("dma-buf: Add selftests for dma-fence")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> ---
>  drivers/dma-buf/st-dma-fence.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fenc=
e.c
> index b7c6f7ea9e0c..ab1ec4631578 100644
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
> +                                       kthread_stop(t[i].task);

This looks like it needs to be kthread_stop_put since get_task_struct
was called for previous successful kthread_run calls.

> +                               return ret;
> +                       }
>                         get_task_struct(t[i].task);
>                 }
>
> --
> 2.39.2
>

