Return-Path: <linux-media+bounces-29111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BBAA77680
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 10:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBC03169F0F
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 08:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDF41EB5CA;
	Tue,  1 Apr 2025 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mJM9Db3N"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6681E1EB19E
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496399; cv=none; b=C5P5KAvBLd4M3vNwnbXne/5cfSG51rQRRslPQCYd3ypcPJeJrdQLHKA9rA0DA1tQip1qYCAeEjZXpd+MEbLM6iT7iCGhSqZ0w/goJO9zBEJ5AKp8+h8lrtSLGgIwmYRxtVKEdAx76QEbUZTot7p56aBhefYaaEWCQlQObl5ry7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496399; c=relaxed/simple;
	bh=JzfIVhXtNLBrllzd82BMkqO/jFC8JCvh+Wx0t5e1bfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbUrOymsjO9ZTVre6UjlSe7fuX97ZDz+ky7N2VTJFp1GBtUywzJiTT8HiAWKmEn9HNKdybitsxH6ohfV9In78ZBQCzO63lF/Ibt87fJ+ClcBKA9vQaDb9rmeoEt83vHPP1M1JHVkuQohzzlieewIP+Z2e6aQvA5RqmEWDiJYkm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mJM9Db3N; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2c76a1b574cso1634431fac.2
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 01:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743496396; x=1744101196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CPeJtNEQsuzyZj1LWzpLz2qGETWIvRqRfnm4VRDQlo=;
        b=mJM9Db3N38DN1o5vQBAtSjiqDgtGdIT9dRNL2RBvOR2HLhUYxM6Ikji/m1+XXp3VcG
         m6K29tPguvhKNSONgZdkxI+/g7YMbjoIijlhqvtU6qJAcal9S8O5u/YwJQVIISVX5gWw
         EkWDx4zqprKKhG4FHYXL0vq88PCLlnis3CDK22DOXk64Rdz6UTMuszJeKu/9XwwoMTKE
         ZTlqoX24my/IlNF6K9CP2mhxmHTtlG812T32HdKm/ajZ23Hzw1UfWYg9TTKjFVP/HWam
         tygxpKiDuHs7qEYUkxFLq9LljB4TKC8+tCKOg2JzOkGEm8LrpFUlO1pzbyPjuoTf0lXT
         XvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496396; x=1744101196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CPeJtNEQsuzyZj1LWzpLz2qGETWIvRqRfnm4VRDQlo=;
        b=waOVHJtV4plPMFC0ZfgpYfdvyg3i9SbHe+4EdYBpJ/ntIVoKkWlpGOk2X8NITjs6Xp
         a2FfJFGekt7UzTwFq/uxGGWZKRdYavB1paCJWLqj9wXszqHhsyI4o5rwLX8VJI8g4HRg
         0BYofRnHJXqT+8hesv9h0cQiTYUGTMQrk8cS9lQXTHA29vf4n9r9UTAHilVfK03O5tTR
         aq8SlHUsuJojAQwC2jai388l9E3QoKIkEDgNKwv3Hw2cNBzjPdrD0iWdB7RKLjtpoGLl
         df2zQntMj3+83ikgKBRsSBVPSBlG5whWOJgFefTtynudzWJ6502l0I8NqrvRRefbQ/7l
         Y7cw==
X-Forwarded-Encrypted: i=1; AJvYcCVpm6GEbdTHlpVyWF7hdrmYhMc8DwilRtaGMNGRKxgsHS84D+cJQ7aFzE06DAJ/I+2qI8LEZUIoj5g7eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeJCKNXDdaiEC2TV4Jafm+2X3cpnMyO2AmOvPSp7ScpyJCqbvO
	Z8Rjt0TapWQvjCqI4SHDREwJh9+o579JgB/2AscnMS5Q0JlN9EGLhss7y2ePkPexqz5bBR1DBJ+
	3+ZLQIHGHu0CEU0ApXgDGDk2ycVqBjnMmBIFpAw==
X-Gm-Gg: ASbGncs1ZLavdqn810vcvaX35+szb95QdZYCkDh1SoJNek3eJNOf87KMu2fjF1uR/2x
	3G6QHJDm8O6r7xC2sUdN+Vvrm8Kcf3wKynPMv18jtSaNZDJSzkXIFI1J3gz6BXh72C6c14nTxpH
	zNIt0/REmA3MdgmzaiicxKiqEHUog=
X-Google-Smtp-Source: AGHT+IH9KoU4vUjjPFFl/HpklAnLrv8QnpnI/vnq7QrGKUOSlwBJn74UzBQjYlMDiU71pl/whujtfshDhL1bJanCT0o=
X-Received: by 2002:a05:6870:7815:b0:2c1:9a53:83c4 with SMTP id
 586e51a60fabf-2cbcf755a40mr7187474fac.26.1743496396402; Tue, 01 Apr 2025
 01:33:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org> <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com> <Z-ucuPzwz4IqVTgb@sumit-X1>
In-Reply-To: <Z-ucuPzwz4IqVTgb@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 1 Apr 2025 10:33:04 +0200
X-Gm-Features: AQ5f1JrwSW9AJKXv4JPdCzTC-p9MDUHywS1_JUmGEaiaPvfsks0gIEo3VJPjUog
Message-ID: <CAHUa44FpsCVrbwj1=nsJVJFVJSF1kzKdWAkAMXRu6EdLrLvh8g@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] tee: implement restricted DMA-heap
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 9:58=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> w=
rote:
>
> On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> > Hi Sumit,
> >
>
> <snip>
>
> >
> > >
> > > > +
> > > > +#include "tee_private.h"
> > > > +
> > > > +struct tee_dma_heap {
> > > > +     struct dma_heap *heap;
> > > > +     enum tee_dma_heap_id id;
> > > > +     struct tee_rstmem_pool *pool;
> > > > +     struct tee_device *teedev;
> > > > +     /* Protects pool and teedev above */
> > > > +     struct mutex mu;
> > > > +};
> > > > +
> > > > +struct tee_heap_buffer {
> > > > +     struct tee_rstmem_pool *pool;
> > > > +     struct tee_device *teedev;
> > > > +     size_t size;
> > > > +     size_t offs;
> > > > +     struct sg_table table;
> > > > +};
> > > > +
> > > > +struct tee_heap_attachment {
> > > > +     struct sg_table table;
> > > > +     struct device *dev;
> > > > +};
> > > > +
> > > > +struct tee_rstmem_static_pool {
> > > > +     struct tee_rstmem_pool pool;
> > > > +     struct gen_pool *gen_pool;
> > > > +     phys_addr_t pa_base;
> > > > +};
> > > > +
> > > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEAPS)
> > >
> > > Can this dependency rather be better managed via Kconfig?
> >
> > This was the easiest yet somewhat flexible solution I could find. If
> > you have something better, let's use that instead.
> >
>
> --- a/drivers/tee/optee/Kconfig
> +++ b/drivers/tee/optee/Kconfig
> @@ -5,6 +5,7 @@ config OPTEE
>         depends on HAVE_ARM_SMCCC
>         depends on MMU
>         depends on RPMB || !RPMB
> +       select DMABUF_HEAPS
>         help
>           This implements the OP-TEE Trusted Execution Environment (TEE)
>           driver.

I wanted to avoid that since there are plenty of use cases where
DMABUF_HEAPS aren't needed. This seems to do the job:
+config TEE_DMABUF_HEAP
+ bool
+ depends on TEE =3D y && DMABUF_HEAPS

We can only use DMABUF_HEAPS if the TEE subsystem is compiled into the kern=
el.

Cheers,
Jens

