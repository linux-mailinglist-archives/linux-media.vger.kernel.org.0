Return-Path: <linux-media+bounces-18463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBD297E88D
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 11:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81B9FB21A74
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 09:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C712719538A;
	Mon, 23 Sep 2024 09:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DvZCSDeQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A22C194AD7
	for <linux-media@vger.kernel.org>; Mon, 23 Sep 2024 09:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727083373; cv=none; b=E543HEV6dnF2qicuotDQV9DJiaJ6EWsTND5bc4afOkYFwzFn8l7uOyg3n1Pxn+QRIUzX5rCClPbOPLTA+r78Cqj0ubFWiOeuCvk0K3m5flLtEwy/uYjy8lCz3xgRz3HYk/an2t2wP4/eo6+KZK7FlpzxWVJ73H1bFbnfr627eyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727083373; c=relaxed/simple;
	bh=2BVCBoPYKtdH5pnaJe5Pgh3XzeoZZjI+jxhPstYa3aQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DluBjECfnza6mIpTleske41tYW3Gv35SGle1ZYslxRPR0SiMs3UlSKTX3dMKraLiA0OV0nEpSAKKEYmxWUKF6LhR5/rppNM6+omFoLlp/WKd80AAgCLcZLhhXcx41GJ9mmfIbt/ttA2Wbi6q8C0Zdsp54UwdAvKlXEixiN5zWUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DvZCSDeQ; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-7a9af813f6cso407955785a.3
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2024 02:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727083370; x=1727688170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHR5/PqnEGvG2nKOK2RFe26k4BMP9Pm6Oaseg0KD65Q=;
        b=DvZCSDeQn3voUX7M0SSu9VR8G81zyL8PIDWsiYM+gxcv17URVvgiYXdCZ/gW8gs3D3
         YmbIKLOm3qlWBYDSnjkJ/yZtOjluRx++TvW++N0s38tCRA4fokXnd9JZRW259NIBSWDO
         deozdSOWA9Fict9kFWj8iGCIOGCM4ztgLzk/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727083370; x=1727688170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHR5/PqnEGvG2nKOK2RFe26k4BMP9Pm6Oaseg0KD65Q=;
        b=n3EX6R0F+eKspKv0PiudDbxIanwMI8BrK7uKkFZOdm700T7wAC9hM3jo2wsE85de4J
         acWqcR56+3/Fp+c6/SSakTTjmn4S09byPktdioRsFgT7F5QXN0gBHLIhR3T84SW6e40J
         Zq0H9aNduz9+JoF7BsmjJ7lR5yYlmMMNY4qQevIqxt7sjmge/xePp5HCF2cMuEnsnMiJ
         N2N/+3/u0F0biemJD+crFfpAab6APoE7e4tRlDSQXPmKjbpJ9sEx6ScksjYGF8sdy0zF
         4fhjfvHvVb8Yd7We+g9mGn12QuS+2+OB68RsnU0yL5CD1cCRtL/ZDRijXwwK3f4Kc3Dh
         AGEA==
X-Gm-Message-State: AOJu0Yyyw4oRw49ymy0PpeprpTf1GGg95wgzUd3Q1GsqQY2i91fJbv9p
	E8KY0xgu72pXaJJLc04RjYAIQiPgYQYGkh6BrIUqHvvawj00nsYjgLmHt6qW1LT0700hegx52Ri
	3tyWJRqjzukLQtSs7bGy6p4ulGkl0NaVU6rMD
X-Google-Smtp-Source: AGHT+IH2U8WBLfUNtvF0U7zgHJJecXFoNGuBJBPDQ5KlvHw1m5rB5qtsUrYjwY20aN5I76g0MS7qCKmMVYbcFU6lHf8=
X-Received: by 2002:a05:622a:1893:b0:458:3233:8eea with SMTP id
 d75a77b69052e-45b22694420mr173373311cf.12.1727083370617; Mon, 23 Sep 2024
 02:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240119033126.1802711-1-ototot@chromium.org> <CAH2knV03g8_z8326yd=pQV11X3N1VFc_DqXzVjMgM4Q0C+8awg@mail.gmail.com>
In-Reply-To: <CAH2knV03g8_z8326yd=pQV11X3N1VFc_DqXzVjMgM4Q0C+8awg@mail.gmail.com>
From: Tommy Chiang <ototot@chromium.org>
Date: Mon, 23 Sep 2024 09:22:39 +0000
Message-ID: <CAH2knV3RZdnu36+dDQGU834G+82dOqtyHY4RhRow5tb0VXWpqg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Add syntax highlighting to code listings in the document
To: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping.
Please let me know if I'm doing something wrong.

On Mon, Feb 19, 2024 at 11:00=E2=80=AFAM Tommy Chiang <ototot@chromium.org>=
 wrote:
>
> Kindly ping :)
>
> On Fri, Jan 19, 2024 at 11:33=E2=80=AFAM Tommy Chiang <ototot@chromium.or=
g> wrote:
> >
> > This patch tries to improve the display of the code listing
> > on The Linux Kernel documentation website for dma-buf [1] .
> >
> > Originally, it appears that it was attempting to escape
> > the '*' character, but looks like it's not necessary (now),
> > so we are seeing something like '\*' on the webite.
> >
> > This patch removes these unnecessary backslashes and adds syntax
> > highlighting to improve the readability of the code listing.
> >
> > [1] https://docs.kernel.org/driver-api/dma-buf.html
> >
> > Signed-off-by: Tommy Chiang <ototot@chromium.org>
> > ---
> >  drivers/dma-buf/dma-buf.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 8fe5aa67b167..e083a0ab06d7 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -1282,10 +1282,12 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_B=
UF);
> >   *   vmap interface is introduced. Note that on very old 32-bit archit=
ectures
> >   *   vmalloc space might be limited and result in vmap calls failing.
> >   *
> > - *   Interfaces::
> > + *   Interfaces:
> >   *
> > - *      void \*dma_buf_vmap(struct dma_buf \*dmabuf, struct iosys_map =
\*map)
> > - *      void dma_buf_vunmap(struct dma_buf \*dmabuf, struct iosys_map =
\*map)
> > + *   .. code-block:: c
> > + *
> > + *     void *dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *ma=
p)
> > + *     void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *m=
ap)
> >   *
> >   *   The vmap call can fail if there is no vmap support in the exporte=
r, or if
> >   *   it runs out of vmalloc space. Note that the dma-buf layer keeps a=
 reference
> > @@ -1342,10 +1344,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_B=
UF);
> >   *   enough, since adding interfaces to intercept pagefaults and allow=
 pte
> >   *   shootdowns would increase the complexity quite a bit.
> >   *
> > - *   Interface::
> > + *   Interface:
> > + *
> > + *   .. code-block:: c
> >   *
> > - *      int dma_buf_mmap(struct dma_buf \*, struct vm_area_struct \*,
> > - *                    unsigned long);
> > + *     int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *, uns=
igned long);
> >   *
> >   *   If the importing subsystem simply provides a special-purpose mmap=
 call to
> >   *   set up a mapping in userspace, calling do_mmap with &dma_buf.file=
 will
> > --
> > 2.43.0.381.gb435a96ce8-goog
> >

