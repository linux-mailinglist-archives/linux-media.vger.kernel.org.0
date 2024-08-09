Return-Path: <linux-media+bounces-16037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B72D94CBDB
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 10:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 291A6286154
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 08:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B3D18C93E;
	Fri,  9 Aug 2024 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aIFfG/9C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA19C8D1
	for <linux-media@vger.kernel.org>; Fri,  9 Aug 2024 08:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723190909; cv=none; b=O+D/rBNklG0jMA1ZWVTSowRPxpH+Qnd+MbABaMQ2TdH+X1DT2E5qGEgocZj1tKDCY6cKHr9v6r7As2pYEqmKY1PpZreev4EPEXxv6ImnS44qZJmR+XQKwbnuC0UK6PIqfdv6frbdexWmP+sajXctMgMFo1hnOBJ6OqR0eOL1ISw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723190909; c=relaxed/simple;
	bh=MiupinPYtVFVoULAp4AM0FSVF1A0l2X2WcE1JaT1WzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vlj3DW83VYxVAMLK+MfYSNnlJWlc/JK3Yu24OJanwB9mGsiH1Kh5yr4G7LpnI4iWcE6RMjvlY5W92y4lBy90akoZhPxmQVeix/HwR9Dg5Mb4dNOKUS6WAAl65axq0NMRDNO9h7t8/7FfGOuQTa9dXlhm6hTldjppnxnjAdsnw8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aIFfG/9C; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5b01af9b0c9so1910729a12.3
        for <linux-media@vger.kernel.org>; Fri, 09 Aug 2024 01:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723190906; x=1723795706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UOjCAID+UZ2tEQeZhluoBp+qMsVXiycrhYlTzLnVcU=;
        b=aIFfG/9Cx5qSo9T/0HMkqIYU/vAj68niZlg9ObWct8scvMSI/8WJuZG1Ms+A+nN1qG
         IENFdjz5v5CK1z1fr4PDZYMREsTgpTy0V1TXyjjPvMd1iHX1tscnC/MOhnVQRYuTgKdB
         2HiHmsc/JZW6elZZGHpXW4SVLYr9CeoVagRz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723190906; x=1723795706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UOjCAID+UZ2tEQeZhluoBp+qMsVXiycrhYlTzLnVcU=;
        b=K0f0GufhnPuSrcGW88vDZRBLCnZoOVW0ZrHrENBh99FUGsxySE0iRmXsWqW2Ix1TUd
         J8TA5Syr1doZ9pgmUyMQfLe1Jw4k/a0Sz5fR9+tLHPm6GdivgRqGCKhXwRP2RkT5v+G2
         u5dTTX+Hnz+NDya62QEJojzm5yadHv6YPBW8ZgQqQ44Kn0Z0G6R9uU5nJSD/+KdZmRQx
         9bjn+crFiwCK85E+6US2L1ISN0BH5Mx6xy09p9tr/DTwE8iUmKy57MdsG7r448REq1VH
         +uOoJeHAVmZbcWiMZjrwy604xAnw+RQIGkHs5XJkNvTkFafCsdnrSkB2aZ3U37it1vCF
         s3fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrJ4CPAV122hodSahqo418BrTX0dhx/EJlQafFsUtcJJzuggEAq1o2Wwl3lS9sTXodQLp0bkasRQkws0Jze+6gKELgYN4MoVYlsCQ=
X-Gm-Message-State: AOJu0Yxla3LkY0xGKDzs8kn3tjLc7D1rWsDGG1fZq95cgCChDAI3U9Ec
	7I4tDW2QtStgQf58H4W0Z+d28bKQsDlOIUP57DfQ1HaZf7bn4M2J1EWEVEacaimhNls0FDUv0Jy
	LP/hU
X-Google-Smtp-Source: AGHT+IG4Ssn/jpx0kgtr5FXJoDHsha2AFO1MiOXJL15qp5ynZtvRQ8lege6gasjr9ZxWCOdkZiK8pg==
X-Received: by 2002:a17:907:f78e:b0:a77:bfca:da53 with SMTP id a640c23a62f3a-a80aa5e9301mr70106866b.30.1723190905760;
        Fri, 09 Aug 2024 01:08:25 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d42615sm818953766b.99.2024.08.09.01.08.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 01:08:25 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7ad02501c3so229355066b.2
        for <linux-media@vger.kernel.org>; Fri, 09 Aug 2024 01:08:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6R5oI4BUROK6GPra/F1CRisYCU7aVqjfSiUWhqefWBLpjF1iz08G5Nr3uqBLOOXTCDvrLqzvpx0mFu4IXlUrZiiB9RnDiHpP+Cmw=
X-Received: by 2002:a05:6512:3e1c:b0:530:adfe:8607 with SMTP id
 2adb3069b0e04-530ee9f3594mr770871e87.51.1723190567467; Fri, 09 Aug 2024
 01:02:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org> <20240503112758.763d8d31@sal.lan>
 <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain> <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
 <fe95e3c3a89de4566a4eb53ca8b26c25@manjaro.org> <CANiDSCswvsTh+0oJmHkYC=-qE8g09bHr44amBsUXkK6j1eCMWA@mail.gmail.com>
 <CAOcJUbwJkbEG6+u==de7CzXDUPGj6J3-p-7E3o+iAzjgSgybSg@mail.gmail.com>
In-Reply-To: <CAOcJUbwJkbEG6+u==de7CzXDUPGj6J3-p-7E3o+iAzjgSgybSg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 9 Aug 2024 10:02:35 +0200
X-Gmail-Original-Message-ID: <CANiDSCt=HOKwAT2zBg1tTbGbD-U-2K8+hi5WbdCM9ULWJvZ_Lw@mail.gmail.com>
Message-ID: <CANiDSCt=HOKwAT2zBg1tTbGbD-U-2K8+hi5WbdCM9ULWJvZ_Lw@mail.gmail.com>
Subject: Re: [PATCH v3 26/26] media: dvb-frontends: tda10048: Make the range
 of z explicit.
To: Michael Ira Krufky <mkrufky@linuxtv.org>
Cc: Dragan Simic <dsimic@manjaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martin Tuma <martin.tuma@digiteqautomotive.com>, 
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
Content-Transfer-Encoding: quoted-printable

Hi

It does not seem that we will find the datasheet.

Any objection to land the patch as it? It is as incorrect as the
original code ;)

Regards!

On Mon, 13 May 2024 at 16:26, Michael Ira Krufky <mkrufky@linuxtv.org> wrot=
e:
>
> On Mon, May 13, 2024 at 9:38=E2=80=AFAM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
> >
> > On Fri, 3 May 2024 at 16:08, Dragan Simic <dsimic@manjaro.org> wrote:
> > >
> > > Hello Ricardo,
> > >
> > > On 2024-05-03 13:56, Ricardo Ribalda wrote:
> > > > I am trying to get the DS, but
> > > > https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf i=
s a
> > > > dead links now.
> > > >
> > > > Anyone have access to the datasheet?
> > >
> > > It's kind of available on the link below, but for some strange reason
> > > the download fails after downloading the first 128 KB or so.
> > >
> > > https://web.archive.org/web/20080907185532/https://www.nxp.com/acroba=
t_download/literature/9397/75015931.pdf\
> >
> > Mike, by any chance do you have a copy of the DS?
> >
> >
> > >
> > >
> > > > On Fri, 3 May 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.or=
g>
> > > > wrote:
> > > >>
> > > >> On Fri, May 03, 2024 at 11:27:58AM +0100, Mauro Carvalho Chehab wr=
ote:
> > > >> > Em Mon, 29 Apr 2024 15:05:05 +0000
> > > >> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> > > >> >
> > > >> > > We do not expect the sample_freq to be over 613MHz.
> > > >> > >
> > > >> > > Found by cocci:
> > > >> > > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_di=
v() does a 64-by-32 division, please consider using div64_u64 instead.
> > > >> > >
> > > >> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > >> > > ---
> > > >> > >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
> > > >> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >> > >
> > > >> > > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/=
media/dvb-frontends/tda10048.c
> > > >> > > index 3e725cdcc66b..1886f733dbbf 100644
> > > >> > > --- a/drivers/media/dvb-frontends/tda10048.c
> > > >> > > +++ b/drivers/media/dvb-frontends/tda10048.c
> > > >> > > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_fr=
ontend *fe, u32 sample_freq_hz,
> > > >> > >                          u32 bw)
> > > >> > >  {
> > > >> > >     struct tda10048_state *state =3D fe->demodulator_priv;
> > > >> > > -   u64 t, z;
> > > >> > > +   u32 z;
> > > >> > > +   u64 t;
> > > >> > >
> > > >> > >     dprintk(1, "%s()\n", __func__);
> > > >> > >
> > > >> > > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_fr=
ontend *fe, u32 sample_freq_hz,
> > > >> > >     /* t *=3D 2147483648 on 32bit platforms */
> > > >> > >     t *=3D (2048 * 1024);
> > > >> > >     t *=3D 1024;
> > > >> > > +   /* Sample frequency is under 613MHz */
> > > >> >
> > > >> > Are you sure about that? Some DVB devices have very high frequen=
cy
> > > >> > clocks, specially if they're also used for satellite, so I can't
> > > >> > be sure by just looking at the driver's code.
> > > >> >
> > > >> > Also, we had already a bunch of regressions with "fixes" like th=
is
> > > >> > that actually broke frontend drivers.
> > > >>
> > > >> This patch preserves the existing behavior. The sample_freq_hz
> > > >> variable
> > > >> is a u32 so, in the original code, z couldn't have been more than
> > > >> U32_MAX even though it was declared as a u64.
> >
> >
> > I agree with Dan, we keep the existing behaviour. So it wont hurt to
> > merge the code...
> >
> > All  that said, if someone has access to the DS, I do not mind reviewin=
g it.
> >
> >
> > > >>
> > > >> It's possible that the original code was wrong.  We have seen that=
 in
> > > >> other places in this patchset.  Adding a note about the datasheet =
is
> > > >> also a good idea.
> > > >>
> > > >> regards,
> > > >> dan carpenter
> > > >>
> >
> >
> >
> > --
> > Ricardo Ribalda
> >
>
> Nice to hear from you!  :-)
>
> I believe that I may have a copy of it on an old "spinny" hard drive
> somewhere in one of the ancient desktop computers I have lining my
> basement walls, lol.  It will take me some time to locate it.  I hope
> this isn't urgent o:-)
>
> ...It so happens that the dev box I used when I worked on that driver
> is up right now, but the datasheet isn't in my home directory.  There
> are two other drives in the chassis but not connected / powered - I'll
> give these a look and let you know if I find anything.
>
> Best,
> Michael Krufky



--=20
Ricardo Ribalda

