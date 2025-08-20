Return-Path: <linux-media+bounces-40335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74333B2D34E
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 07:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24F5416921D
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 05:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7360283FD8;
	Wed, 20 Aug 2025 05:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U08laOQx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84471179A3
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 05:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755666960; cv=none; b=eCZ+EwGYBURsP6KDqo5hcoaAKybPRD94I44fMlutzHlYbrg7PgMa0RHNypi25anXsF5H+NGP0cfopaXV5u528zIllfvIH6zv3hRoFE5Q5zW/EPYXYsQz7Gh9C6miElDqju/hvQD6YPOxOCXmwjumO6EzWIt5PTXP1ujwVXcAXB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755666960; c=relaxed/simple;
	bh=gmB0hK4PnEhQzKkPj/vuuOgut+a03Fj//iRvNLatQEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pUy9Q3J4x9+Lt4g88gRWbwcnkt+UDGpzsTZeR35v3S6mxRsjw/pvopUtWkZTucE1enj7RoY5udVhI6yjWIMOOGrfIGlum/JRp7o+KcEfo5h+ayiud4y8YrnGNGXBKJvxnrHwqhsls5RcGBLwgKzH5EK6vupeOCPqz8BNG7ahZ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U08laOQx; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e87031323aso635502185a.0
        for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 22:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755666957; x=1756271757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMOc0zAG5IHElycDwN0z3G1Bp9v6la9CFRr7DqTKuhw=;
        b=U08laOQxUbjeRCfSYAtVlFAhWWh+SukPX2g+KU3DIomX1kQxEyiMUo57djxsVC3ymk
         +gvPoRkp5TN4clHtGEGCnLGMWYCN/HjRKZUCiYmb5t1fKTZ+c9HWduoWQB0OAzlHTP5O
         5MfbD8AsPw6lgs8Ba/jlN2hLGG7LoZrVnVpGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755666957; x=1756271757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMOc0zAG5IHElycDwN0z3G1Bp9v6la9CFRr7DqTKuhw=;
        b=p6b844OOX22BtvyoGH0OOXUmPLWLFCURySgo64gPnOh3S1mprM7k9FbFj5/1OXFvkp
         lJFmWq/NzeEb4gAUfuBzGBV1En9MvcOXzGA2LSliETBe8Yv/wGpt/dg0TMgl970OQ/hG
         XCm0fUJsNkdY8Ca0k3t4gkxQeqHQySGH946NqAuZv+evC+teQbRQS0UyoaQeYahmp3Jr
         UhXvz9c6hbSxEZqCDsx3+vWG5xmc517oZ0OvZTVyHd1wMZB20lVzo9t7SHPApGGCKaQp
         11GLY8ijrt7vwhUv925zeoz/jDv82L/iUln0ZzAL7aIbbo0ieLoD1yyJHviUhjrPFynu
         3Z7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvC8zN9spTGkY4NcQnOfDTCJP82c0jV0LVstRLZ/+ckqYuFVbjYovlHqVI0NB/1EADsUaH/eQwa1RA1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgEBa2yZDLMfDQXQAVI9wRc6kKXTbxbj8OLuQq3gyc82X+sXk7
	p0WhTCsoANDDd+PuhZ7CQByKp70CkdNlHQhL7XQ/xVSEpaCNNjxT8Q6O6A1JzOecdf3H53dVkUZ
	Tw5Mc9A==
X-Gm-Gg: ASbGncsS60jqumQQXOL4xnNIVLeRMt2pOWzImyBmxcDeuJolXmj6DsyiLxYpVnvXYcm
	XNwhF7jt2b/JpcMZ6/qkSDrLkLqYz3cbWfUj+4qD5XLNLRmxePhVXtFCkn+0oYYI7mF3RJtLjz7
	HzouZIIAySAe7+ehHT/uux2A0WttdqOpQDI8MgnYDHm1vS0ZnDiq2IEitBl6aAun5WccJGqBfE7
	aaQNYhs2WHV3MB3rO2tPi+ZkaiXvM+qEJ4XyGH/spZvmAIcisLGgL/7sTO0LTNN55+RGKGLt1+h
	byCkRr+lAaE5R6zW7Nz/1IKYCb7C47e5EOv6LoavxRQe3nh93DklcVyNR2SddhrPOV3Pz8/k9lB
	7oD4O0U3ONi9iwKuvin9bUAaE4B/VIGsZRVXHngR0wsZZb0fLbdeCr0nT+Ow+A5ZgD4Yhl9DJ
X-Google-Smtp-Source: AGHT+IGdAEprVnuq/sBDGi4gXcG+r/Esj2KGwSYzkD+tGd1XrZAB6wd+bkhHZQ9AlU5wSZc0lQNKUg==
X-Received: by 2002:a05:620a:46a7:b0:7e7:fa33:b5a5 with SMTP id af79cd13be357-7e9fca76198mr169321285a.7.1755666956954;
        Tue, 19 Aug 2025 22:15:56 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e192fc9sm898192185a.45.2025.08.19.22.15.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 22:15:54 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b0bd88ab8fso156031cf.0
        for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 22:15:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnw7a0RbjyjIBvtH8iceCwQCCAtJ/0fKS3kOiLgaDwVBGInyg2niR8Sva2szw55OKx0QmjGsXWEIKqAA==@vger.kernel.org
X-Received: by 2002:ac8:7d0c:0:b0:4a6:f525:e35a with SMTP id
 d75a77b69052e-4b292f95907mr2439661cf.9.1755666954079; Tue, 19 Aug 2025
 22:15:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814083144.191554-1-wenst@chromium.org> <CAC=S1nhz_ESY4VrgWs=dVinLtdOamh6to3EgD1w1Kx=4YBOD9A@mail.gmail.com>
 <CAGXv+5Hke6aEYdyc096_aeS9KHiOzcNqirB-rFT2odepaYhayQ@mail.gmail.com> <CAC=S1nheT46K+jkmtq4EJxOVO=nwasan0LCJwv-HTEK6P6DgxA@mail.gmail.com>
In-Reply-To: <CAC=S1nheT46K+jkmtq4EJxOVO=nwasan0LCJwv-HTEK6P6DgxA@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 20 Aug 2025 14:15:35 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CRZaCvaw5fQxgWBgBjnK6Y05p6kHJ2hrHGtLY47Ymsog@mail.gmail.com>
X-Gm-Features: Ac12FXy8CAi4s4o72NAJVVqc3RW7R9QsaD5heHRhqLT1YoNyBEvsC2eFaSQEZVc
Message-ID: <CAAFQd5CRZaCvaw5fQxgWBgBjnK6Y05p6kHJ2hrHGtLY47Ymsog@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Use spinlock for context list
 protection lock
To: Fei Shao <fshao@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 6:52=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> On Thu, Aug 14, 2025 at 5:06=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > On Thu, Aug 14, 2025 at 4:59=E2=80=AFPM Fei Shao <fshao@chromium.org> w=
rote:
> > >
> > > On Thu, Aug 14, 2025 at 4:38=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.=
org> wrote:
> > > >
> > > > Previously a mutex was added to protect the encoder and decoder con=
text
> > > > lists from unexpected changes originating from the SCP IP block, ca=
using
> > > > the context pointer to go invalid, resulting in a NULL pointer
> > > > dereference in the IPI handler.
> > > >
> > > > Turns out on the MT8173, the VPU IPI handler is called from hard IR=
Q
> > > > context. This causes a big warning from the scheduler. This was fir=
st
> > > > reported downstream on the ChromeOS kernels, but is also reproducib=
le
> > > > on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even th=
ough
> > > > the actual capture format is not supported, the affected code paths
> > > > are triggered.
> > > >
> > > > Since this lock just protects the context list and operations on it=
 are
> > > > very fast, it should be OK to switch to a spinlock.
> > > >
> > > > Fixes: 6467cda18c9f ("media: mediatek: vcodec: adding lock to prote=
ct decoder context list")
> > > > Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to prote=
ct encoder context list")
> > > > Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> > > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > ---
> > > >  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++--=
--
> > > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++-=
----
> > > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
> > > >  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  4 ++--
> > > >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++-=
----
> > > >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
> > > >  .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  4 ++--
> > > >  7 files changed, 26 insertions(+), 20 deletions(-)
> > > >
> > >
> > > [...]
> > >
> > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vp=
u_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > > index 145958206e38..e9b5cac9c63b 100644
> > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > > @@ -77,14 +77,14 @@ static bool vpu_dec_check_ap_inst(struct mtk_vc=
odec_dec_dev *dec_dev, struct vde
> > > >         struct mtk_vcodec_dec_ctx *ctx;
> > > >         int ret =3D false;
> > > >
> > > > -       mutex_lock(&dec_dev->dev_ctx_lock);
> > > > +       spin_lock(&dec_dev->dev_ctx_lock);
> > >
> > > Do you mean spin_lock_irqsave()?
> >
> > This function is only called from the handler below (outside the diff
> > context), which itself is called from hard IRQ context. This is mention=
ed
> > in the comment above the handler.
>
> I see. I only searched here but didn't check the full source.
> Leaving a comment would be clearer if a revision is made, but it's not
> worth resending just for that alone.

Hmm, I feel like this could make it easy to introduce further locking
bugs in the future, because someone may just decide to call this
function from a different context. Also having the _irqsave variants
consistently used for the lock make it clear that it's used to
synchronize with an IRQ handler regardless of which place in the code
one looks at.

My recommendation would be to still amend the patch to do that.

>
> Reviewed-by: Fei Shao <fshao@chromium.org>
>
>
> On Thu, Aug 14, 2025 at 5:06=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > On Thu, Aug 14, 2025 at 4:59=E2=80=AFPM Fei Shao <fshao@chromium.org> w=
rote:
> > >
> > > On Thu, Aug 14, 2025 at 4:38=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.=
org> wrote:
> > > >
> > > > Previously a mutex was added to protect the encoder and decoder con=
text
> > > > lists from unexpected changes originating from the SCP IP block, ca=
using
> > > > the context pointer to go invalid, resulting in a NULL pointer
> > > > dereference in the IPI handler.
> > > >
> > > > Turns out on the MT8173, the VPU IPI handler is called from hard IR=
Q
> > > > context. This causes a big warning from the scheduler. This was fir=
st
> > > > reported downstream on the ChromeOS kernels, but is also reproducib=
le
> > > > on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even th=
ough
> > > > the actual capture format is not supported, the affected code paths
> > > > are triggered.
> > > >
> > > > Since this lock just protects the context list and operations on it=
 are
> > > > very fast, it should be OK to switch to a spinlock.
> > > >
> > > > Fixes: 6467cda18c9f ("media: mediatek: vcodec: adding lock to prote=
ct decoder context list")
> > > > Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to prote=
ct encoder context list")
> > > > Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> > > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > ---
> > > >  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++--=
--
> > > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++-=
----
> > > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
> > > >  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  4 ++--
> > > >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++-=
----
> > > >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
> > > >  .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  4 ++--
> > > >  7 files changed, 26 insertions(+), 20 deletions(-)
> > > >
> > >
> > > [...]
> > >
> > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vp=
u_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > > index 145958206e38..e9b5cac9c63b 100644
> > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > > @@ -77,14 +77,14 @@ static bool vpu_dec_check_ap_inst(struct mtk_vc=
odec_dec_dev *dec_dev, struct vde
> > > >         struct mtk_vcodec_dec_ctx *ctx;
> > > >         int ret =3D false;
> > > >
> > > > -       mutex_lock(&dec_dev->dev_ctx_lock);
> > > > +       spin_lock(&dec_dev->dev_ctx_lock);
> > >
> > > Do you mean spin_lock_irqsave()?
> >
> > This function is only called from the handler below (outside the diff
> > context), which itself is called from hard IRQ context. This is mention=
ed
> > in the comment above the handler.
> >
> > > >         list_for_each_entry(ctx, &dec_dev->ctx_list, list) {
> > > >                 if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst =3D=3D vp=
u) {
> > > >                         ret =3D true;
> > > >                         break;
> > > >                 }
> > > >         }
> > > > -       mutex_unlock(&dec_dev->dev_ctx_lock);
> > > > +       spin_unlock(&dec_dev->dev_ctx_lock);
> > > >
> > > >         return ret;
> > > >  }
> > >
> > > [...]
> > >
> > > > diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vp=
u_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > > > index 51bb7ee141b9..79a91283da78 100644
> > > > --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > > > +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > > > @@ -47,14 +47,14 @@ static bool vpu_enc_check_ap_inst(struct mtk_vc=
odec_enc_dev *enc_dev, struct ven
> > > >         struct mtk_vcodec_enc_ctx *ctx;
> > > >         int ret =3D false;
> > > >
> > > > -       mutex_lock(&enc_dev->dev_ctx_lock);
> > > > +       spin_lock(&enc_dev->dev_ctx_lock);
> > >
> > > Also here.
> >
> > Same reasoning applies here as well.
> >
> > ChenYu
> >
> > > Regards,
> > > Fei
> > >
> > > >         list_for_each_entry(ctx, &enc_dev->ctx_list, list) {
> > > >                 if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst =3D=3D vp=
u) {
> > > >                         ret =3D true;
> > > >                         break;
> > > >                 }
> > > >         }
> > > > -       mutex_unlock(&enc_dev->dev_ctx_lock);
> > > > +       spin_unlock(&enc_dev->dev_ctx_lock);
> > > >
> > > >         return ret;
> > > >  }
> > > > --
> > > > 2.51.0.rc1.163.g2494970778-goog
> > > >
> > > >
>

