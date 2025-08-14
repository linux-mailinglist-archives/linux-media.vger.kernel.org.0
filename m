Return-Path: <linux-media+bounces-39894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD75FB2617D
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 11:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D3D7620CDE
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 09:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08582ED165;
	Thu, 14 Aug 2025 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iFMK5efK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8662ED169
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 09:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755164869; cv=none; b=ralBji48Pr09TB0cXdO6dNGQwycxBfbaRMIUzhHegq4wRJcDxE8HGFMUiqrBfrHdPalrxiRLU/gQZGCzlO0NQ/e/+0CDjzdl1qr2UGWw8i3jyIe3LLzYyB2M2fAewLIJkC0M9eUSiHOaBY+x8ZvVkH1RUPjV39+2H2OHakBM0dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755164869; c=relaxed/simple;
	bh=v9C2ecqKzEtjQd1RNjsgQNhdCAyuEymNZb/w43UXQ4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2j1QvpRbIHiFi7f1viy4lxmLVdgRbn5E9FcOM9kDC3RZOjX389u7uZMhR8WVx7RtuLUtVth5hcd4OHTfhOKV4hKmecTPYKhTFZeRlTZAipAUvz0FrOGdcmiM/XgwvgdXQgAsWfNYyBZFpLGt6+fGQ01X93z1e8rlEoRYv4B+UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iFMK5efK; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-53b1738e8e3so605405e0c.1
        for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 02:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755164866; x=1755769666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiDCfbM3bTCVcLsZuPU1JDs4qEWT1BpZ2ztHAIDrKGI=;
        b=iFMK5efKcF7HfhKZzhJKkPEVMGqEHMnNIqTAacT2L1KJWCN/fKWqRCoA0VPPKq3uh1
         aqwQLjxUGlMiM3g85Kof//j5Xloxeq9Se+s+VoKGSOBBX+b8cAWml4b0TeBGSZU+TIEe
         nfB/NOoc4O+rhO5WLJC726DqKhuh7hMtaFFns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755164866; x=1755769666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiDCfbM3bTCVcLsZuPU1JDs4qEWT1BpZ2ztHAIDrKGI=;
        b=PVH8SvYZ3WbY7ievliY1jJRkzV2+GDVcjTSqgF8BfV+5frE0RYkt2SYM91caisONM4
         l+1eM+VvKGWwXiwSo4EhIgrbvGeUDYmwH6HprHPfeVxDYK9EQNG47YWqjH9Q/Gr6oYs+
         htVK27zHvmAm0tvp0rFZyoSmSEzlXWv2wogNBknit0VP8phSKIHnX1YZbMHQNx6WNBh9
         1wc/RDaNCuTE3lYzDY4G6MwJBb9ipveJSHIfZLrsop1nj5Nnf3+XVsdV/TE1iUIU1eLe
         sdrFhr4bs22DqlX29ACKg1FZ5iwb9jX3bGmA9AAYkBFRHHltiSDOz3j3btkPQ201RT1d
         1Etw==
X-Forwarded-Encrypted: i=1; AJvYcCUau3bDOcjlNOlCKScsXQJcr5XrBi/wczwBnHc6VZleVjERKNSQSnaP7ZBrmIkZU6diSL8AuggrH30iSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4huwEKbhq0HfOSzp0ft44klE+vKydc7KgD/pl1lj873c3tRhm
	w8/r5L5Isvw3aW0Faw2aBuwkBXwtmLb2C6OgpOkAN+Pt5chSiAFNcOUJkOHPlx1b4JBqgqsdhaG
	7wws=
X-Gm-Gg: ASbGncuY0Gu9Q0/nZgLo03S8co3BOAPPB4d/bxpvzJ/opOfTZIi2l4e3jdW2ihjLyVI
	uJGJ9B+U/pNl8BAurU/McwMVU6YPUBYb3KU1R6EFbHaj6dXQzEKV/AtJJdlSNdhew8Za1GHHTqi
	/89OuZ+Zy+5QEgkQZp3+xNw5B75Jln6JDnMiyfAU454DChd09AbYffOiZBubkzBSVhxNpqLUmvE
	+uEReXoD0DYqkYrR+k2pRsRDAIVANNUhpk4w5kPNySqkojur5dvQ17fCkQkwmMKoVu9fhzNYx3X
	AgVtVa7vpMK1+NqJTSYxz/GNOE5r7hJVVe5NZwmo56GSBfGxvvRcvBxJQCvvlkP+xvqOF0q6sHD
	ezj+Xq4CVxixgOupNTNKUazCkuXxGHSPyN2aurCG8lWlHGhSlebq7LLxTg/mxPqV5YZY1qTo9
X-Google-Smtp-Source: AGHT+IFH1L0eQfKk6UUm1l7pP1EO5zD9tGC7cE60xA47TBxJ+AOF0tp7AiqkoXV8a3s8q9yKqIEytg==
X-Received: by 2002:a05:6122:3102:b0:539:1dd1:1d17 with SMTP id 71dfb90a1353d-53b189a746amr837838e0c.3.1755164865656;
        Thu, 14 Aug 2025 02:47:45 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b02a575bsm4423798e0c.29.2025.08.14.02.47.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 02:47:45 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-53b1719b717so679653e0c.0
        for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 02:47:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeZqwzMPzig/cBdx+4Fl0yTjWkn1gqwlxOaSLU5Omxtuuo9JajXwOKe1uahp1bHN7XFacMontXKp8lVA==@vger.kernel.org
X-Received: by 2002:a05:6122:82a3:b0:538:dbc9:17a6 with SMTP id
 71dfb90a1353d-53b189eb471mr820629e0c.4.1755164864462; Thu, 14 Aug 2025
 02:47:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814083144.191554-1-wenst@chromium.org> <CAC=S1nhz_ESY4VrgWs=dVinLtdOamh6to3EgD1w1Kx=4YBOD9A@mail.gmail.com>
 <CAGXv+5Hke6aEYdyc096_aeS9KHiOzcNqirB-rFT2odepaYhayQ@mail.gmail.com>
In-Reply-To: <CAGXv+5Hke6aEYdyc096_aeS9KHiOzcNqirB-rFT2odepaYhayQ@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 14 Aug 2025 17:47:08 +0800
X-Gmail-Original-Message-ID: <CAC=S1nheT46K+jkmtq4EJxOVO=nwasan0LCJwv-HTEK6P6DgxA@mail.gmail.com>
X-Gm-Features: Ac12FXzvFfMabP6kQ3r7qgde36ENXvfds4n3oOTocQXTQlh5-zck0_vwf1VSQ1c
Message-ID: <CAC=S1nheT46K+jkmtq4EJxOVO=nwasan0LCJwv-HTEK6P6DgxA@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Use spinlock for context list
 protection lock
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 5:06=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Thu, Aug 14, 2025 at 4:59=E2=80=AFPM Fei Shao <fshao@chromium.org> wro=
te:
> >
> > On Thu, Aug 14, 2025 at 4:38=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> > >
> > > Previously a mutex was added to protect the encoder and decoder conte=
xt
> > > lists from unexpected changes originating from the SCP IP block, caus=
ing
> > > the context pointer to go invalid, resulting in a NULL pointer
> > > dereference in the IPI handler.
> > >
> > > Turns out on the MT8173, the VPU IPI handler is called from hard IRQ
> > > context. This causes a big warning from the scheduler. This was first
> > > reported downstream on the ChromeOS kernels, but is also reproducible
> > > on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even thou=
gh
> > > the actual capture format is not supported, the affected code paths
> > > are triggered.
> > >
> > > Since this lock just protects the context list and operations on it a=
re
> > > very fast, it should be OK to switch to a spinlock.
> > >
> > > Fixes: 6467cda18c9f ("media: mediatek: vcodec: adding lock to protect=
 decoder context list")
> > > Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to protect=
 encoder context list")
> > > Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > >  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++----
> > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++---=
--
> > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
> > >  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  4 ++--
> > >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++---=
--
> > >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
> > >  .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  4 ++--
> > >  7 files changed, 26 insertions(+), 20 deletions(-)
> > >
> >
> > [...]
> >
> > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_=
if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > index 145958206e38..e9b5cac9c63b 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > @@ -77,14 +77,14 @@ static bool vpu_dec_check_ap_inst(struct mtk_vcod=
ec_dec_dev *dec_dev, struct vde
> > >         struct mtk_vcodec_dec_ctx *ctx;
> > >         int ret =3D false;
> > >
> > > -       mutex_lock(&dec_dev->dev_ctx_lock);
> > > +       spin_lock(&dec_dev->dev_ctx_lock);
> >
> > Do you mean spin_lock_irqsave()?
>
> This function is only called from the handler below (outside the diff
> context), which itself is called from hard IRQ context. This is mentioned
> in the comment above the handler.

I see. I only searched here but didn't check the full source.
Leaving a comment would be clearer if a revision is made, but it's not
worth resending just for that alone.

Reviewed-by: Fei Shao <fshao@chromium.org>


On Thu, Aug 14, 2025 at 5:06=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Thu, Aug 14, 2025 at 4:59=E2=80=AFPM Fei Shao <fshao@chromium.org> wro=
te:
> >
> > On Thu, Aug 14, 2025 at 4:38=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> > >
> > > Previously a mutex was added to protect the encoder and decoder conte=
xt
> > > lists from unexpected changes originating from the SCP IP block, caus=
ing
> > > the context pointer to go invalid, resulting in a NULL pointer
> > > dereference in the IPI handler.
> > >
> > > Turns out on the MT8173, the VPU IPI handler is called from hard IRQ
> > > context. This causes a big warning from the scheduler. This was first
> > > reported downstream on the ChromeOS kernels, but is also reproducible
> > > on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even thou=
gh
> > > the actual capture format is not supported, the affected code paths
> > > are triggered.
> > >
> > > Since this lock just protects the context list and operations on it a=
re
> > > very fast, it should be OK to switch to a spinlock.
> > >
> > > Fixes: 6467cda18c9f ("media: mediatek: vcodec: adding lock to protect=
 decoder context list")
> > > Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to protect=
 encoder context list")
> > > Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > >  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++----
> > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++---=
--
> > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
> > >  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  4 ++--
> > >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++---=
--
> > >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
> > >  .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  4 ++--
> > >  7 files changed, 26 insertions(+), 20 deletions(-)
> > >
> >
> > [...]
> >
> > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_=
if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > index 145958206e38..e9b5cac9c63b 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > @@ -77,14 +77,14 @@ static bool vpu_dec_check_ap_inst(struct mtk_vcod=
ec_dec_dev *dec_dev, struct vde
> > >         struct mtk_vcodec_dec_ctx *ctx;
> > >         int ret =3D false;
> > >
> > > -       mutex_lock(&dec_dev->dev_ctx_lock);
> > > +       spin_lock(&dec_dev->dev_ctx_lock);
> >
> > Do you mean spin_lock_irqsave()?
>
> This function is only called from the handler below (outside the diff
> context), which itself is called from hard IRQ context. This is mentioned
> in the comment above the handler.
>
> > >         list_for_each_entry(ctx, &dec_dev->ctx_list, list) {
> > >                 if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst =3D=3D vpu)=
 {
> > >                         ret =3D true;
> > >                         break;
> > >                 }
> > >         }
> > > -       mutex_unlock(&dec_dev->dev_ctx_lock);
> > > +       spin_unlock(&dec_dev->dev_ctx_lock);
> > >
> > >         return ret;
> > >  }
> >
> > [...]
> >
> > > diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_=
if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > > index 51bb7ee141b9..79a91283da78 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > > +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > > @@ -47,14 +47,14 @@ static bool vpu_enc_check_ap_inst(struct mtk_vcod=
ec_enc_dev *enc_dev, struct ven
> > >         struct mtk_vcodec_enc_ctx *ctx;
> > >         int ret =3D false;
> > >
> > > -       mutex_lock(&enc_dev->dev_ctx_lock);
> > > +       spin_lock(&enc_dev->dev_ctx_lock);
> >
> > Also here.
>
> Same reasoning applies here as well.
>
> ChenYu
>
> > Regards,
> > Fei
> >
> > >         list_for_each_entry(ctx, &enc_dev->ctx_list, list) {
> > >                 if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst =3D=3D vpu)=
 {
> > >                         ret =3D true;
> > >                         break;
> > >                 }
> > >         }
> > > -       mutex_unlock(&enc_dev->dev_ctx_lock);
> > > +       spin_unlock(&enc_dev->dev_ctx_lock);
> > >
> > >         return ret;
> > >  }
> > > --
> > > 2.51.0.rc1.163.g2494970778-goog
> > >
> > >

