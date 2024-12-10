Return-Path: <linux-media+bounces-23117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E2B9EBE8C
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 23:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E4C0284E88
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 22:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B3723EA8D;
	Tue, 10 Dec 2024 22:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="P0HPupCZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFB423EA66
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 22:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733871104; cv=none; b=RSCFOXx9p8vKX+Y9e7RtmRHRmVlbA8KArjQTY56iQK20mQIQDqBfjKt9xbMIjLGLR0iJ0RJlbTqvXBrbr7opfmkdslrAnQQ05KlDvVnVNghCtGnP1HNDSMID3XjRaphFmyHyzgV2lux64bzd6Raug7fFKR5f1LW7QmP7933Y96g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733871104; c=relaxed/simple;
	bh=z4+6bpseOOTD/WiP4VJ9xEYcKjeCBnFNzmYMq42PIxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YE3w0cT8HlePHP588/4YwAytVdWq4iMJTxf+SJsjHIy29mJ7CoOMbT9U6JN8rOsGYL2SbOQCX72+KmLTltEoPMVFPFwIrqGTClhM0tg11TeomY6/5JDijTjagTf2c4fgOQuo4NHZJRKiclTKk7kehSZM8EhfdYIprAMOQnDkczk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=P0HPupCZ; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e3989d27ba3so4770369276.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 14:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1733871100; x=1734475900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Of5DDpOleFOvOX8j9iWLw9UYEkdTXgB6XMX5OY79lzQ=;
        b=P0HPupCZkL5D1YjvZwGVtDoPiECjiMLZFGtiOYKcHuICyqfBvkqO8Cj+JEGMRzMIrP
         5OMwVCxbFlq6DYM6sAMtUzzOLRRjWWEdaYhjB0aWHAfj+qlsJ9LY3uTa2+pJ86Y6UohI
         kYKNbG8ry7WqQeIUqtC3Q7epg2Egdn0INPNOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733871100; x=1734475900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Of5DDpOleFOvOX8j9iWLw9UYEkdTXgB6XMX5OY79lzQ=;
        b=h6JKEWO9cQkBxJJuDymF7ADWP5vGUVOdxTAsQDOrmDP4IVaf+2+3j1Wy79q+pAtKIQ
         DKkWwo2Hx5/NFQbMrBcPeehxZzA0gSsHMSb90g23Wf/uhnzO9mUbQe7EtPXwCLz7qg86
         dNoF+OkQt/EiA8uwLeVm5iJeVXAYcBeEwH8QqKz/N/FZMIziGdwJBoqRHlXXcL0WUyMe
         XeVzi16XUNOrRYHcjojIraA4JZz4hjQBJUAEPnnRLgG2yhLHk0hHt7b8m0/qjSOF81f2
         G/oACG2FyCtT9IyBuaraQEGjjpUsPKpwaF9vmTksfk8Ljcac/NbxI2xyhxT+qYlImQld
         XWmw==
X-Forwarded-Encrypted: i=1; AJvYcCXrwpqXNbw4aCoMhVojYtJJSMX+H5c9hVs5KmZbAmP0e380TXEnZor64ISgk1RHpm27jAaXqvKPDqy/tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBUPftm3W1zndoq+pnujTW7WYNHrr8hXO8JIJG47YQt34myyil
	W4MYwk4akl1lM8or6BAGA/+fvHdKzhjeR04gRaXVU10IaqGSuOuBLGbD3QkBIPEHHpcMOVbfbAc
	sDBf1cI8FPv9kLc9zcdY90sTwsbuD2rrLg0CfFQ==
X-Gm-Gg: ASbGncuYCaGsaddFSdiAaWSCG157QnLaFoC6W5n82RVVE+pmofkVcpj57SHL99JeOtT
	zFIdoZMoo2eTghKZVy075gGvJXJCdoVEKvQzT
X-Google-Smtp-Source: AGHT+IGbV0oeq+nxJsXu16SzSxYPduPX1VVqzU+lMF3Y51q8XM3CkxJyeEHqg7wjGvxVi7LtqKCG8kkaYpwciZTvMTk=
X-Received: by 2002:a05:6902:2206:b0:e3a:235a:4da3 with SMTP id
 3f1490d57ef6-e3c8e48b8e6mr1094296276.24.1733871100343; Tue, 10 Dec 2024
 14:51:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com> <20241204-udmabuf-fixes-v2-1-23887289de1c@google.com>
In-Reply-To: <20241204-udmabuf-fixes-v2-1-23887289de1c@google.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Tue, 10 Dec 2024 17:51:29 -0500
Message-ID: <CAEXW_YRb4PsFgEvHW2QBDY5dxJ+aoMTn3qtj5v9eboxO3SxPLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] udmabuf: fix racy memfd sealing check
To: Jann Horn <jannh@google.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, John Stultz <jstultz@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, Julian Orth <ju.orth@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 11:27=E2=80=AFAM Jann Horn <jannh@google.com> wrote:
>
> The current check_memfd_seals() is racy: Since we first do
> check_memfd_seals() and then udmabuf_pin_folios() without holding any
> relevant lock across both, F_SEAL_WRITE can be set in between.
> This is problematic because we can end up holding pins to pages in a
> write-sealed memfd.
>
> Fix it using the inode lock, that's probably the easiest way.
> In the future, we might want to consider moving this logic into memfd,
> especially if anyone else wants to use memfd_pin_folios().

I am curious, why is it not possible to have a reproducer for this
issue, is it not reproducible and is theoretical?

thanks,

 - Joel

>
> Reported-by: Julian Orth <ju.orth@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D219106
> Closes: https://lore.kernel.org/r/CAG48ez0w8HrFEZtJkfmkVKFDhE5aP7nz=3Dobr=
imeTgpD+StkV9w@mail.gmail.com
> Fixes: fbb0de795078 ("Add udmabuf misc device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  drivers/dma-buf/udmabuf.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 8ce1f074c2d32a0a9f59ff7184359e37d56548c6..c1d8c2766d6d36fc5fe1b3d73=
057f6e01ec6678f 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -436,14 +436,19 @@ static long udmabuf_create(struct miscdevice *devic=
e,
>                         goto err;
>                 }
>
> +               /*
> +                * Take the inode lock to protect against concurrent
> +                * memfd_add_seals(), which takes this lock in write mode=
.
> +                */
> +               inode_lock_shared(file_inode(memfd));
>                 ret =3D check_memfd_seals(memfd);
> -               if (ret < 0) {
> -                       fput(memfd);
> -                       goto err;
> -               }
> +               if (ret)
> +                       goto out_unlock;
>
>                 ret =3D udmabuf_pin_folios(ubuf, memfd, list[i].offset,
>                                          list[i].size, folios);
> +out_unlock:
> +               inode_unlock_shared(file_inode(memfd));
>                 fput(memfd);
>                 if (ret)
>                         goto err;
>
> --
> 2.47.0.338.g60cca15819-goog
>

