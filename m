Return-Path: <linux-media+bounces-13493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B8D90C35E
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 08:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EDCD1C21523
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 06:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1211C2A8;
	Tue, 18 Jun 2024 06:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m6jC+gJn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABAD22EF2
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 06:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718691386; cv=none; b=CkJ8uiemBnvtNGBy1leN4BUQgXOqca+11EvND1wWaujwsBrJsv4LHh9RWPYuuIR+lp+2BS5lztqEZP/MSFTg5mU4bNXT0zWn4ELzd3gz0ctmu8Ibx5CIZw7/AQWpwNw69f7P5T0MRyElH6umfcXWBscxxckuXFZL/B3p3F2ezUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718691386; c=relaxed/simple;
	bh=2tor0G6tR02Z4WGDmLQgk+hSeJ3VZNIqJmoLtdWqUak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=js++8lvMgyZ8SIHy52Ysw9A9bAhy5qzN0yOB/2jIbiPDBoozIqOar841q3lgtfcjyS02tGHZ1bjIDFZ9ll4ICTPeGX3YzqBbr5I6wt2s++w8/DsAM9a2D75Nr4S59J9zEgLtVLiMAQkaiuHXeM01XTVEtasD6PTLmKAr4fm9Yvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m6jC+gJn; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57c7ec8f1fcso5937265a12.0
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 23:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718691383; x=1719296183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJr9JzMYPoHUkzMHoCiTq0VIt4qu1sC4HEHrc5vqagc=;
        b=m6jC+gJnAtp4qT9eqlzxUCdCOiBNRvXZ0SIyqstqgaWJgGzAxMc6KIJdJlbyU3o6Vz
         15F+C0GJyrY4Goy2DwucixA2XaIZr0O/Wiz26teBneVQrMKmFAWZ/oR3Dza/cLESitEL
         gt1Cvyws4BxR4cvHsCdAdHKvuGJ/Rx4uCJwNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718691383; x=1719296183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJr9JzMYPoHUkzMHoCiTq0VIt4qu1sC4HEHrc5vqagc=;
        b=hZKdpzozatia1Q9PxXp2NZcIHRpK2XdDXa5T4SFUAgikMaW8xC+RYJPPRsmtMdVVRy
         Q9zfnF1t4YPTJ1uodMYWdQish5/YjQALfILq5n7VYc5foY7W8E+Vq/+nSIccsZdN+giH
         rOCo7qIgVLrzM6LfXV6VT4AZrVMRZG/8BrOv2KNKKnQp8cQZL6Sn/e51u/CwoAZ1ZrFr
         tacI4VeMJ9eS5Q9ZubPJXZ0o6S/CLJ4+ycGBoc3ODR+WvWxuoqPgcJv7sE+LlkyZdoFQ
         sB7aqid5gwOp1mmJilmeY30OIDWchS1on6LbeVONpGGxb81qsKzdlGG01qzG7P6HVO+2
         yfgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3CBuskGn2PFTGLBKm9kMComzZIr0R3h8z8WJp4x4e6mWAD0kjTvuKDS9sN4U47ek6AVxOoOJZLQmZOa372/aTZZyKL3xb8HQ9nhE=
X-Gm-Message-State: AOJu0YykTxL4gVxhZVpHMgk2svLLGrBmyuL172jf2+tgomvpUEm8a24u
	6giAIPeQ2zRZTGtOgyngwKD9iEUtqQumgeh0qO/a+8eIwLhJLmy+X9e46eXFi6efJNXeIIcQs/+
	PgA==
X-Google-Smtp-Source: AGHT+IHbwYCc33T6TqB7tyA696MuEH1Ohuq6G7AiYMW9fzJ7D0qVIjkuVZNQK6HO4U2EZGKXCfhLEw==
X-Received: by 2002:a17:906:261b:b0:a6f:493d:5ba2 with SMTP id a640c23a62f3a-a6f60d42fd2mr758994766b.41.1718691383312;
        Mon, 17 Jun 2024 23:16:23 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56da40f6sm585175466b.43.2024.06.17.23.16.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 23:16:23 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6e349c0f2bso649370466b.2
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2024 23:16:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYm9fnLU7CvZZnKDhu9Rbqqz6dYlucMdgqmfaJKPHAsNFFMhSTFycHaqBosyL8ci3t10wMJMr7KlTVwYij9yBO/+Ve0wOA4HuFKAE=
X-Received: by 2002:a17:906:b2c8:b0:a6f:5723:fb11 with SMTP id
 a640c23a62f3a-a6f60dc50bcmr730791166b.58.1718691382366; Mon, 17 Jun 2024
 23:16:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-13-yunfei.dong@mediatek.com> <4a5tf2cl744xzqslox4ddzmdpuvwksr54g3qk2jl4soatdts45@e6xmmm2ijmv6>
 <20fec212d49cc3f0479be7a855d9816f5739ce93.camel@mediatek.com>
In-Reply-To: <20fec212d49cc3f0479be7a855d9816f5739ce93.camel@mediatek.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 18 Jun 2024 15:16:01 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BgELHBm6zOckbOv6cg1OD8Ghwry-EG3EnETTh9hF7EzA@mail.gmail.com>
Message-ID: <CAAFQd5BgELHBm6zOckbOv6cg1OD8Ghwry-EG3EnETTh9hF7EzA@mail.gmail.com>
Subject: Re: [PATCH v6,12/24] media: mediatek: vcodec: add interface to
 allocate/free secure memory
To: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
Cc: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>, 
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org" <stevecho@chromium.org>, 
	"wenst@chromium.org" <wenst@chromium.org>, "nhebert@chromium.org" <nhebert@chromium.org>, 
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "jstultz@google.com" <jstultz@google.com>, 
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"jkardatzke@google.com" <jkardatzke@google.com>, "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>, 
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>, 
	"tjmercier@google.com" <tjmercier@google.com>, 
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "hsinyi@chromium.org" <hsinyi@chromium.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"nfraprado@collabora.com" <nfraprado@collabora.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 3:53=E2=80=AFPM Yong Wu (=E5=90=B4=E5=8B=87) <Yong.=
Wu@mediatek.com> wrote:
>
> On Wed, 2024-06-12 at 14:22 +0900, Tomasz Figa wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Thu, May 16, 2024 at 08:20:50PM +0800, Yunfei Dong wrote:
> > > Need to call dma heap interface to allocate/free secure memory when
> > playing
> > > secure video.
> > >
> > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > ---
> > >  .../media/platform/mediatek/vcodec/Kconfig    |   1 +
> > >  .../mediatek/vcodec/common/mtk_vcodec_util.c  | 122
> > +++++++++++++++++-
> > >  .../mediatek/vcodec/common/mtk_vcodec_util.h  |   3 +
> > >  3 files changed, 123 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig
> > b/drivers/media/platform/mediatek/vcodec/Kconfig
> > > index bc8292232530..707865703e61 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/Kconfig
> > > +++ b/drivers/media/platform/mediatek/vcodec/Kconfig
> > > @@ -17,6 +17,7 @@ config VIDEO_MEDIATEK_VCODEC
>
> [snip]
>
> > > -void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
> > > +static int mtk_vcodec_mem_alloc_sec(struct mtk_vcodec_dec_ctx
> > *ctx, struct mtk_vcodec_mem *mem)
> > > +{
> > > +struct device *dev =3D &ctx->dev->plat_dev->dev;
> > > +struct dma_buf *dma_buffer;
> > > +struct dma_heap *vdec_heap;
> > > +struct dma_buf_attachment *attach;
> > > +struct sg_table *sgt;
> > > +unsigned long size =3D mem->size;
> > > +int ret =3D 0;
> > > +
> > > +if (!size)
> > > +return -EINVAL;
> > > +
> > > +vdec_heap =3D dma_heap_find("restricted_mtk_cma");
> > > +if (!vdec_heap) {
> > > +mtk_v4l2_vdec_err(ctx, "dma heap find failed!");
> > > +return -EPERM;
> > > +}
> >
> > How is the heap name determined here? My recollection is that the
> > heap
> > name comes from the heap node in the DT, so it may vary depending on
> > the
> > board.
> >
> > Is the heap name documented anywhere in the DT bindings?
> >
> > Shouldn't we rather query DT for a phandle to the right heap?
> >
>
> Hi Tomasz,
>
> This heap name does not come from dt-binding. It is hard-coded in the
> driver[1]. Because the heap driver is a pure SW driver, there is no
> corresponding HW unit, and there is no way to add a dtsi node.
>
> [1]
> https://lore.kernel.org/linux-mediatek/20240515112308.10171-10-yong.wu@me=
diatek.com/

Okay, I see. Thanks for clarifying.

Best regards,
Tomasz

