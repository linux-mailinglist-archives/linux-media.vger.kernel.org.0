Return-Path: <linux-media+bounces-8014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA74988F2A9
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 00:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E7BC1F28743
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 23:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46F3154455;
	Wed, 27 Mar 2024 23:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IjSowuaV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920F2153BD5
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 23:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581332; cv=none; b=ZrGWuFMgz4opiEvBR9ycsjuzgonSRvYtwYf8LEQERNIVaF+D2x+SAXAJGNjSOy1BHoiw264J3aIoh0EWjsF6ypf9k50VdNWNnWXTjfzgiO8qCCFXu4DETTdyroplpsZPcMQfFgIZPWNscxCHiv3srrgXhEabshU4wbFegTTVHjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581332; c=relaxed/simple;
	bh=PVsIBbS/rVjbM+PQ2VfYAeNu95/w0E+U1IrDu2iuKSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQZM1qwbgHKYlcMYJAX7DjI9FKc7tv/OKkZpDUtgbcPlXmmKZlTAGKA/DIv2Hhrbl2UOcbgn+gBmMRLrXljnRNjM0/5DTwvVdHH/gO9a9SMKHAAqJlFn/KktXKyWnbrjERpVWsgUVtonHR8MlG9aqITggW0MESUFOH/AAzsFH68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IjSowuaV; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-430d3fcc511so66801cf.1
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 16:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711581329; x=1712186129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zL0pxl1ZeYttqRQTvgIv4r0vTY3Iq9/o2liSDPlmKoQ=;
        b=IjSowuaVEsbEjVP8/gJiAbWGaEJvUZt4tSKtZBJMgdOGVnAqDyqCXwweKueYV/2DfP
         F4jWUQhwLrYYyC3cHQX4XixEY8ursYq2X9YmLzaLcCOqePj7lxCgmr/yg+KoagknmPM2
         bBHW57eedlwBPMM8n07AaM38qe6VuvbNSNVefUk8uUiPlRTc3bf259zhDjA92B5pjIgM
         89thU0HWeIact2dBE3SHoMZxkkvMvBHf9HjvKwHebTkEvPiOfSfwRy1UX9nHLUHf8uH+
         bhaSsuTlc0rkfzbATzoq7IuOp9j/k1WGbNJx4igfDCKRX8AIWgu5Y/WFj3luziWUoxCI
         t7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711581329; x=1712186129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zL0pxl1ZeYttqRQTvgIv4r0vTY3Iq9/o2liSDPlmKoQ=;
        b=v2IBNA726jFxxij1ym1dSTkgxFJ+floJNUQlqHGrCLoVPGRIp9kaKv0MTEioA/0bQl
         eE+8hReEAS98OD6q5S9vZojOfmc+HpD62bZXl5Wvd0hpG6XWAAN1utaIYiNFCNbfA4/m
         rJZSRusZqJiu581vOYY2qemwx9uq7kAznBTC82nSjBg75CQlDZyBp3M6uHeKXtNooAB1
         52w1+CDz2RSphIep8R6PK/jQsBBS+3qkpkYpym3IJHqjfR1eRiN3kuk3pGvTCVXX44i9
         8TCwxmSeAxUqmFwJlaCfLqjaJ/m+rknf/T3MBoZulgI6JRxm+szbmIirFWlCACFWSBXd
         LCxg==
X-Forwarded-Encrypted: i=1; AJvYcCW1MMN+OAKJN3G0SlzUxpJW30QPMm3xMBEuAAeZ0VnpM1dBAsOR6phYQR7/Yfa+u+scgiZ+QbLYKCaHbZobak14/gOWNQ40MIFgMiI=
X-Gm-Message-State: AOJu0YwmobbVHI32Y2OjqLxGum7EG5D1shlKgILgGgLdansQJLedsj2B
	20yCMYa5U817DcMk+/W4uKfUqpnk4G35UR8Qk1yIt4VSvOPga5/lYpcySRJe45VRhySuQWj3h49
	nmPznRrDbRnWvgWK4UEzWOC45oxl+0odfmF3r
X-Google-Smtp-Source: AGHT+IEHULaSt2yDU1vRh+RDTO5EMUamnNYAAYP3E+spcC25hRmXtBGbEZWqmHKqDhaq8Z06M7w2aIPsiKX2nepTBV0=
X-Received: by 2002:a05:622a:608d:b0:431:ffb2:eb7c with SMTP id
 hf13-20020a05622a608d00b00431ffb2eb7cmr101515qtb.14.1711581329361; Wed, 27
 Mar 2024 16:15:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322214801.319975-1-robdclark@gmail.com> <CABUrSUAykXUoX0y6jzCw1s=E=E08Z54Ygo1TvBm49_iT88oDFg@mail.gmail.com>
 <CAF6AEGvK7fBhh36rQyqiHf_qVvsCJhHZjoyOqGqxRPcMZ3dzjw@mail.gmail.com>
In-Reply-To: <CAF6AEGvK7fBhh36rQyqiHf_qVvsCJhHZjoyOqGqxRPcMZ3dzjw@mail.gmail.com>
From: Dominik Behr <dbehr@google.com>
Date: Wed, 27 Mar 2024 16:15:16 -0700
Message-ID: <CABUrSUAykWDFKjLdiL4KrLmY3ztKnZdNNaP7g4U1ZmSs0d1haA@mail.gmail.com>
Subject: Re: [PATCH] drm/prime: Unbreak virtgpu dma-buf export
To: Rob Clark <robdclark@gmail.com>
Cc: Dominik Behr <dbehr@chromium.org>, dri-devel@lists.freedesktop.org, 
	Rob Clark <robdclark@chromium.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Simon Ser <contact@emersion.fr>, open list <linux-kernel@vger.kernel.org>, 
	"open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linux-media@vger.kernel.org>, 
	"moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It is mapped, via iommu interface (vfio-iommu) when map_dma is called.
--
Dominik

On Mon, Mar 25, 2024 at 7:38=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> This is actually a bit concerning.. importing a host page backed
> buffer without guest mapping into a passthru device probably doesn't
> work and should be rejected earlier.
>
> I do think we should relax the restriction (either taking my patch or
> reverting the commit it fixes) until we work this out properly
> (because the original patch is a regression), but importing a buffer
> without guest pages into a passthru device can't possibly work
> properly.  Maybe it works by chance if the host buffer is mapped to
> the guest, but that is not guaranteed.
>
> BR,
> -R
>
> On Mon, Mar 25, 2024 at 3:35=E2=80=AFPM Dominik Behr <dbehr@chromium.org>=
 wrote:
> >
> > It also fixes importing virtgpu blobs into real hardware, for instance =
amdgpu for DRI_PRIME rendering.
> >
> > On Fri, Mar 22, 2024 at 2:48=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> >>
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> virtgpu "vram" GEM objects do not implement obj->get_sg_table().  But
> >> they also don't use drm_gem_map_dma_buf().  In fact they may not even
> >> have guest visible pages.  But it is perfectly fine to export and shar=
e
> >> with other virtual devices.
> >>
> >> Reported-by: Dominik Behr <dbehr@chromium.org>
> >> Fixes: 207395da5a97 ("drm/prime: reject DMA-BUF attach when get_sg_tab=
le is missing")
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >> ---
> >>  drivers/gpu/drm/drm_prime.c | 7 ++++++-
> >>  1 file changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> >> index 7352bde299d5..64dd6276e828 100644
> >> --- a/drivers/gpu/drm/drm_prime.c
> >> +++ b/drivers/gpu/drm/drm_prime.c
> >> @@ -582,7 +582,12 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,
> >>  {
> >>         struct drm_gem_object *obj =3D dma_buf->priv;
> >>
> >> -       if (!obj->funcs->get_sg_table)
> >> +       /*
> >> +        * drm_gem_map_dma_buf() requires obj->get_sg_table(), but dri=
vers
> >> +        * that implement their own ->map_dma_buf() do not.
> >> +        */
> >> +       if ((dma_buf->ops->map_dma_buf =3D=3D drm_gem_map_dma_buf) &&
> >> +           !obj->funcs->get_sg_table)
> >>                 return -ENOSYS;
> >>
> >>         return drm_gem_pin(obj);
> >> --
> >> 2.44.0
> >>

