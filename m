Return-Path: <linux-media+bounces-11409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D1E8C4206
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 15:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E97C81F22B67
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 13:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2078C15350D;
	Mon, 13 May 2024 13:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QwgPWrXj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0523C1534EC
	for <linux-media@vger.kernel.org>; Mon, 13 May 2024 13:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715607389; cv=none; b=GvwA3/Jl5y5QTWTq65kdrj3G3ShgMAgiJ8N9KLl1uAiarphErV5+SvepRa9zjlpoT3lbtsF1XWZQOUwR4GRor0O4yaOlfkxOufoI9ONVnanXn061NtDXn40czSvwS4PZbtbIvH9zVwx4J8QRDvmRhYMZvp4nO2bXVvsJfQF38L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715607389; c=relaxed/simple;
	bh=7xu5WctdtZR/wOb4blrphPM3O51kqNl976gHYaCXAtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=so93zfmk7q6bdKgktlMKafp9gv32ucCWYrsqC87CvigOI8DXlklyoQtio1FIeNXFu+wFQDpQf2uHl/uABE4JxsddY1gZ0cPkY4A527xYsMAdRR9SfaXwLyc2sI0aRiFnw777N/xlGSdZCAmNrZfQGNKBSqIKCAManUGJXuAbxzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QwgPWrXj; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a59b81d087aso1094355466b.3
        for <linux-media@vger.kernel.org>; Mon, 13 May 2024 06:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715607385; x=1716212185; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ABNtOh/Z3AIwsdePLSWkzeYb78xrA+zqTZ4Vj4WEmaE=;
        b=QwgPWrXjlcCRjZgI5QtkUOtDZX43h4mKVAovULt/UX6v60LhlI+GFJe+/KFh8ay1Pu
         tes/S52KPw/2T0/82v2VX8ZRjCZKUz2zaSwADt6brXxTWu2S/MLiQ6qFZDoAw5UXbgMc
         A57WnfyuVdSXFKm3oMIDETgsvJqgOwPIWRDv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715607385; x=1716212185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABNtOh/Z3AIwsdePLSWkzeYb78xrA+zqTZ4Vj4WEmaE=;
        b=h0QXN9gvbYVS7BNhoXxXr5Pknf9JCAgC9bkfWD8VCwtN3kT38RGA9yFa7x6XhwJGAq
         53nqQPvVbPJB+zjjVvXJIvlaiiDfgzT6RvmZrlCE7yPLjoccdrCLLkKJxVCARN/s8LG4
         JQkqGyFhEWB8jwYpzTAJ7uONJ9YskSKKokO+ONrJpH4st0Cu0RMqrpfLH7fpsBqLW+Ml
         +e/MLPhSvkD3dKfruiZboT9sYiPbqFJ0Nn1TzgPEShHs9MOZRW5YNRA0kg7tOWbr3s5K
         Gbs0niw1RspHIFkqKrWriSFFVzSE/J/MDt8l2gxUHbndAZnJ/tMvJZhhXBjo4hMYxYTW
         f17w==
X-Forwarded-Encrypted: i=1; AJvYcCVyFnu0EHBSv4SUHtdC9K0usYsmp7LfLJdwRgSPZ1YnmwHGhIyf/XU7XVZGlROE3Gb6diXOS07JV8RXa9ai0u3fHhKf0x25D1QYgpw=
X-Gm-Message-State: AOJu0YwMQ5U7lhxvakkLLfDhvuluP0CdPvY95gPzyIG1ocMKK4HPD5yS
	8jqFeoEMmeq3I6mS3NrR6st2lTCaPN7gIv24OLbT5jTeb3hX6um8ybTJmN//PaA7qZSAF7TCBhO
	KJ8NUXPg=
X-Google-Smtp-Source: AGHT+IHwMroTTB+4hHDPS2CUpUppMOOxDWbMn/vtJhjbjlysaBeXROsw1Nc3QHitOnCh+U3ZMiD/oA==
X-Received: by 2002:a17:906:4882:b0:a59:a727:1e81 with SMTP id a640c23a62f3a-a5a2d57a381mr958738066b.20.1715607385390;
        Mon, 13 May 2024 06:36:25 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1789247csm594573766b.82.2024.05.13.06.36.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 06:36:25 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a59b81d087aso1094349466b.3
        for <linux-media@vger.kernel.org>; Mon, 13 May 2024 06:36:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMqsgBh58ERLsEZZqzvaDFzw+ij8EkPkEHfrkYT4k1zgjRmYG4keixA50xk1eFNb30hD+oHLOzgRAQnwRvp8R0vNuXqNH6besUCDw=
X-Received: by 2002:adf:f8c4:0:b0:34f:5d07:ebda with SMTP id
 ffacd0b85a97d-3504a63111fmr10276952f8f.23.1715607363511; Mon, 13 May 2024
 06:36:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org> <20240503112758.763d8d31@sal.lan>
 <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain> <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
 <fe95e3c3a89de4566a4eb53ca8b26c25@manjaro.org>
In-Reply-To: <fe95e3c3a89de4566a4eb53ca8b26c25@manjaro.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 May 2024 15:35:49 +0200
X-Gmail-Original-Message-ID: <CANiDSCswvsTh+0oJmHkYC=-qE8g09bHr44amBsUXkK6j1eCMWA@mail.gmail.com>
Message-ID: <CANiDSCswvsTh+0oJmHkYC=-qE8g09bHr44amBsUXkK6j1eCMWA@mail.gmail.com>
Subject: Re: [PATCH v3 26/26] media: dvb-frontends: tda10048: Make the range
 of z explicit.
To: Dragan Simic <dsimic@manjaro.org>, Michael Krufky <mkrufky@linuxtv.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 May 2024 at 16:08, Dragan Simic <dsimic@manjaro.org> wrote:
>
> Hello Ricardo,
>
> On 2024-05-03 13:56, Ricardo Ribalda wrote:
> > I am trying to get the DS, but
> > https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf is a
> > dead links now.
> >
> > Anyone have access to the datasheet?
>
> It's kind of available on the link below, but for some strange reason
> the download fails after downloading the first 128 KB or so.
>
> https://web.archive.org/web/20080907185532/https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf\

Mike, by any chance do you have a copy of the DS?


>
>
> > On Fri, 3 May 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org>
> > wrote:
> >>
> >> On Fri, May 03, 2024 at 11:27:58AM +0100, Mauro Carvalho Chehab wrote:
> >> > Em Mon, 29 Apr 2024 15:05:05 +0000
> >> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> >> >
> >> > > We do not expect the sample_freq to be over 613MHz.
> >> > >
> >> > > Found by cocci:
> >> > > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> >> > >
> >> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >> > > ---
> >> > >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
> >> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> >> > >
> >> > > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
> >> > > index 3e725cdcc66b..1886f733dbbf 100644
> >> > > --- a/drivers/media/dvb-frontends/tda10048.c
> >> > > +++ b/drivers/media/dvb-frontends/tda10048.c
> >> > > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> >> > >                          u32 bw)
> >> > >  {
> >> > >     struct tda10048_state *state = fe->demodulator_priv;
> >> > > -   u64 t, z;
> >> > > +   u32 z;
> >> > > +   u64 t;
> >> > >
> >> > >     dprintk(1, "%s()\n", __func__);
> >> > >
> >> > > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> >> > >     /* t *= 2147483648 on 32bit platforms */
> >> > >     t *= (2048 * 1024);
> >> > >     t *= 1024;
> >> > > +   /* Sample frequency is under 613MHz */
> >> >
> >> > Are you sure about that? Some DVB devices have very high frequency
> >> > clocks, specially if they're also used for satellite, so I can't
> >> > be sure by just looking at the driver's code.
> >> >
> >> > Also, we had already a bunch of regressions with "fixes" like this
> >> > that actually broke frontend drivers.
> >>
> >> This patch preserves the existing behavior. The sample_freq_hz
> >> variable
> >> is a u32 so, in the original code, z couldn't have been more than
> >> U32_MAX even though it was declared as a u64.


I agree with Dan, we keep the existing behaviour. So it wont hurt to
merge the code...

All  that said, if someone has access to the DS, I do not mind reviewing it.


> >>
> >> It's possible that the original code was wrong.  We have seen that in
> >> other places in this patchset.  Adding a note about the datasheet is
> >> also a good idea.
> >>
> >> regards,
> >> dan carpenter
> >>



-- 
Ricardo Ribalda

