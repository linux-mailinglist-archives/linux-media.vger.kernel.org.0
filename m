Return-Path: <linux-media+bounces-24981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26730A16E3F
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 15:16:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5FD81889AB7
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBB21E47C4;
	Mon, 20 Jan 2025 14:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzYBZ+vV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE291B87EE;
	Mon, 20 Jan 2025 14:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737382544; cv=none; b=GF2sdjhBPk8YeC2QgBAd5Jkvtf3hkpA8uvJwYoPslif/r/IJEqATGLJM+CqUdmyRixbjl4xsI1eFV+Y2jMV8xag9K2JbCw7CVDql7PeEUJ4L9HHdAMbsJIm5o14ntEzBZKcGmoMsobUxKL1si55hR1YGnK7xdw1ts5oekYrDQNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737382544; c=relaxed/simple;
	bh=iUhSnDtLngeJVrwMVW6AJP0houIEjWDvRww1eO4x+4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C8hNayO6dToBabSULtWhkiiGd5d7+Kh5unymPcJ71YnEQNAchjHE72Ar02pyMCC/+IkynzGDofD7Me5EhZWq4vBJggU/W8BprueLdeyQA/vdlN/r+KdvmSTipgmEUQYL3JW7JOTFjJVmGnUhtGlgkdvO+6OKOXJnrdknXGQwSiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzYBZ+vV; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so7782159a91.0;
        Mon, 20 Jan 2025 06:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737382542; x=1737987342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X93jU0Gus1VPr9hu16YyKTh9IP0ufkdiXX4SHUR48Qw=;
        b=JzYBZ+vV7bBzl1//MiI9PS45WldjX/xrxkis15+C/eGcBAeAjoa3Rrx2d2bwaV2QX7
         bWvHh/MWtxFiA1zZMg2Y7OFEGYD7lQ7OltjG0l/mXRz7sMamVb155KCAoFARPyIq9ykz
         QzVgOWbKFB/YjfZbNF2Odyiu/CfsXvqBy3gkQZBu/rvtiKXAspS4OQbRmrOSa+GCfkPf
         fOQXkv67jyOmYkxgQLFsd1CsQ0irSztsZTXxw6z29zgB8dqiWdpsC9gS8I65MZ+7wWls
         rkhN9gue57uqxRMPCk/HE/dNCEuD+tPaazmn3VWYS/oH2HWeJeSDrU/TsCdTzzbha3tL
         OkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737382542; x=1737987342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X93jU0Gus1VPr9hu16YyKTh9IP0ufkdiXX4SHUR48Qw=;
        b=A+EaBn3/Eg8ERzsiAd5X3cd0rhj+pc+WIEAkmAp/JZ5P15QsXSLXwamLMor3QKbVne
         iClYS6mNNEcBFKIyEh/R/fKuqlPHOdWTvLUosIL69pJIky40fMXmtSg6kgJAP+tI4KiA
         uyFrDBb0TOhsRbDxG5Xvnaf+8lxzSktbux1Sj8/m8xCiHehF1N4EIaJqPPLuKrWeP3XQ
         OMEzk/sA62b4IUVsJ4Y2PE/7gKl8Swlt+u+/iCVlX7OjGP2bK6V1itC5aLolFj01W6Mf
         vPGXoWDwZJgu27egihqx1ns7q3BpD2TG082+Ep2csAR8IJA9XS/ZJ3wMoV++inGQI33r
         sM6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVU9q8VSOkckWC3m3E16wi+4Mvwbm6IeNTXKPsbkr0K9ynjQef49bvsnLH83ZPJi3fpR3dd3tWlrB8qs8Y=@vger.kernel.org, AJvYcCVXdxDQ4b9/iyTda+dkQBs+2rNvEwOrQcs+DaJvPx1WzCGaX2nkcYEi7lE1rxOnVOMgorHJZRmhpT3RbEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF2wdTK2c9qSxU/dWhr4IYaQO7t8MXlg1tJEk3y6bYSSalTIM/
	E3rMGgjmkDaTS4EfVlrkmH9pkOBKXcc1/aoDTsI3KtHe17fIEE+iewNOElQLGGm+ak65ffNHI93
	RcxupuxnPE2YmyqdxN/kTJplFElp1Ug==
X-Gm-Gg: ASbGncvmDsI9pNmfEp15w1EOL+IBcyFRiNAmITdNBttbFwPv5TyVTL5YtKpWQOWmUa1
	TsVOd9qpTA91EcfGqYI0bRns2ftjJyRtfNZlBtLNkGCQ5Q0sZ4R8=
X-Google-Smtp-Source: AGHT+IGGccxNpy+IsyFFOJD23RVfyv6tsRwLchMJvYfmDefF7KiWzzOQ6xXkw2s1ydFUzT8i+8kkFcaLqQqWdLcR+ik=
X-Received: by 2002:a17:90a:da8e:b0:2ee:d024:e4fc with SMTP id
 98e67ed59e1d1-2f782d860d5mr21184053a91.33.1737382541853; Mon, 20 Jan 2025
 06:15:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120081052.63224-1-benjamin.gaignard@collabora.com>
 <cc3b22c9-ff98-4328-9e70-4d22c29a6b0d@collabora.com> <95a8e3c6d28444750bd312ff61a3f6b0daea177a.camel@collabora.com>
In-Reply-To: <95a8e3c6d28444750bd312ff61a3f6b0daea177a.camel@collabora.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 20 Jan 2025 08:15:30 -0600
X-Gm-Features: AbW1kvY7-VEwEpTS4PY_x3_ozvi2Qys0pthZsAcLvD_VFF5U4ADkbZGyMeRexZQ
Message-ID: <CAHCN7xKySGN6wnE2FmpuLms-DyThBvx9w6vdKqJvsaWpgW6FOQ@mail.gmail.com>
Subject: Re: [PATCH] media: verisilicon: HEVC: Initialize start_bit field
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, p.zabel@pengutronix.de, 
	mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 8:10=E2=80=AFAM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le lundi 20 janvier 2025 =C3=A0 11:00 +0100, Benjamin Gaignard a =C3=A9cr=
it :
> > Le 20/01/2025 =C3=A0 09:10, Benjamin Gaignard a =C3=A9crit :
> > > Always set start_bit field to 0, if not it could lead to corrupted fr=
ames
> > > specially when decoding VP9 bitstreams at the same time since VP9 dri=
ver
> > > set it for it own purpose.
>
>                its
>

Does this impact the Fluster score?

> > >
> > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >
> > I could add this tag:
> >
> > Fixes: cb5dd5a0fa518 ("media: hantro: Introduce G2/HEVC decoder")
>
> I have tested this on IMX8MQ board using the following GStreamer pipeline=
.
> Before the change, the HEVC window was entirely corrupted. The streams do=
n't
> matter as long as they use both HEVC and VP9 codec.
>
> gst-launch-1.0 \
>   filesrc location=3Dhevc.mp4 ! parsebin ! v4l2slh265dec ! fakevideosink =
\
>   filesrc location=3Dvp9.mkv ! parsebin ! v4l2slvp9dec ! fakevideosink
>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
>
> >
> > > ---
> > >   drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c =
b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> > > index 85a44143b378..0e212198dd65 100644
> > > --- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> > > +++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> > > @@ -518,6 +518,7 @@ static void set_buffers(struct hantro_ctx *ctx)
> > >     hantro_reg_write(vpu, &g2_stream_len, src_len);
> > >     hantro_reg_write(vpu, &g2_strm_buffer_len, src_buf_len);
> > >     hantro_reg_write(vpu, &g2_strm_start_offset, 0);
> > > +   hantro_reg_write(vpu, &g2_start_bit, 0);
> > >     hantro_reg_write(vpu, &g2_write_mvs_e, 1);
>
> I've also crossed against "decoder_swreg_map_g2.xlsx" documentation, if y=
ou are
> lucky to have access to that, and within swreg5 there is only g2_tempor_m=
vp_e
> that is also shared, and its already being set in both drivers.
>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
>
> > >
> > >     hantro_write_addr(vpu, G2_TILE_SIZES_ADDR, ctx->hevc_dec.tile_siz=
es.dma);
> >
>
>

