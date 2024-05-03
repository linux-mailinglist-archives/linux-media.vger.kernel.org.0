Return-Path: <linux-media+bounces-10684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC728BABFC
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 13:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56CC71F22CD3
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 11:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41662153560;
	Fri,  3 May 2024 11:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HeHNpZ3M"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DA4152DF0
	for <linux-media@vger.kernel.org>; Fri,  3 May 2024 11:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714737440; cv=none; b=p6l55nPPEqxSslGW/QNGuo0XNiuj5KTraczkqjAHN78IFTyAypfZ8i1bG32FindOyVeOIhzy/2uS5n8ind+sg6FZZw4XOOF6JVBNt51UupHbw1l869QM/fkiX6kqSa9WaBYf3AHRlK3NqIDvm0jnK5t8+tLTwgfxmMxJWu1pZQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714737440; c=relaxed/simple;
	bh=CmcuBbTVhho6EBimKTWKrm1lTdbe7FzUQrr9f+yUs1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSjCQT7vBBvU/E1Gn6NuABL7WfdWIgZy1Alo+SflLSxZHddCXUq8olOM9wAzMJEHa7N5TiJ3YKeNwB9NPI9dM1Qo4FZmz5rzHj+CzobjqTrp2JJcOKPkuGJ3xsarxD6Wj/nG3/YTTMAq6vriVX9cCh0qt53omsmbFV6P6e1IP0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HeHNpZ3M; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1ec4dc64c6cso31689765ad.0
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 04:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714737438; x=1715342238; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K7hPKV3HF7+4pxzh8EgR7k2JkSmFNYuW+tKLwH6I0Lg=;
        b=HeHNpZ3Mxz/0KjMkyHUSEaZJ7u4rUHjM1q2hZItrDVcutLS/xJbAWsrG2MGYikIFzW
         kXXIqdJ1/knXlkU3hu4GR4SFRozNw+vJUdwGiwN31V3gtw/016nJOjAdefNvq4Ls2L9N
         plk/3C/saZJWXCkFwb+ww4R0qsEApZfsB9COs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714737438; x=1715342238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7hPKV3HF7+4pxzh8EgR7k2JkSmFNYuW+tKLwH6I0Lg=;
        b=gYu8B693SIr415cx5tYjta6PjOfAbW/VHS7NWQdu/o+kTpIQcgIdiTFq5aqHTTWIZh
         KuLxlWivDCjKu+eGlq4qFpVh+C8qqBTrT2Udw/qDn65m2h7LxXg5bwjj4vQp/lmfXYH6
         LQs6jIlduBsegToFTGyjaV4ONMLP5aS3b7RhXkiwJt8YfxGuie5zlaBz55oV7ocb/z1F
         23nZfa5cNtjHgJhzSR+ud2WE7xx97Xjbc1ngaq5WOU2hiYFLruaLMtB2lV6JIr/41Seq
         YPC24RrVp9AUqnHHvzVyQotDpfZg4LdD//whbYqRBIJzjo2fnxEoJHfJatzYyx44Hnee
         Rvyg==
X-Forwarded-Encrypted: i=1; AJvYcCVKezb8NOkdUskQNtKrqU3A2S1I6iZFyvJfNdXlHZ2AXGKOQ/a2xD41LDiDVwtepNJr5oQaYUiiLBx8M6QyMQaibyxgB8BRxRoMiJk=
X-Gm-Message-State: AOJu0YztvmSAQSRiS9bF4iTKj0p28mY6oYP9qu5PB99wjt7faPRInLut
	pr4b6+QHm8Tz6I6vNnoLqFdshV3s4seEFqD5fP7C0JDKRP5d2DCCE6gLK7PZ/hKAiR3KfsoAzZs
	/MQ==
X-Google-Smtp-Source: AGHT+IHs4Uv3e7U6ciNhIu8cH+kToHxkJD1N/QDaBSWIrvgPusJr5A80kySTyBH3jkHjPj6GW/b74g==
X-Received: by 2002:a17:902:64c2:b0:1e5:c06b:3330 with SMTP id y2-20020a17090264c200b001e5c06b3330mr2236175pli.24.1714737438381;
        Fri, 03 May 2024 04:57:18 -0700 (PDT)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com. [209.85.210.175])
        by smtp.gmail.com with ESMTPSA id j10-20020a170902f24a00b001e420abf8c1sm3071880plc.165.2024.05.03.04.57.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 04:57:17 -0700 (PDT)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ed627829e6so10343532b3a.1
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 04:57:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQI/xnBbp/oF+KcFkJ0gNbYAaIDbwwCq1/zT5F7dCbSzefXNDm4sOVo1s+1P8JmrE5Xhik3rTzh7fwZJzaZLMfYD8Hy2qzXjU96n0=
X-Received: by 2002:a05:6102:2329:b0:47b:d717:b689 with SMTP id
 b9-20020a056102232900b0047bd717b689mr2266975vsa.4.1714737415965; Fri, 03 May
 2024 04:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org> <20240503112758.763d8d31@sal.lan>
 <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain>
In-Reply-To: <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 3 May 2024 13:56:44 +0200
X-Gmail-Original-Message-ID: <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
Message-ID: <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
Subject: Re: [PATCH v3 26/26] media: dvb-frontends: tda10048: Make the range
 of z explicit.
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Martin Tuma <martin.tuma@digiteqautomotive.com>, 
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

I am trying to get the DS, but
https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf is a
dead links now.

Anyone have access to the datasheet?

Thanks!

On Fri, 3 May 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Fri, May 03, 2024 at 11:27:58AM +0100, Mauro Carvalho Chehab wrote:
> > Em Mon, 29 Apr 2024 15:05:05 +0000
> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> >
> > > We do not expect the sample_freq to be over 613MHz.
> > >
> > > Found by cocci:
> > > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
> > > index 3e725cdcc66b..1886f733dbbf 100644
> > > --- a/drivers/media/dvb-frontends/tda10048.c
> > > +++ b/drivers/media/dvb-frontends/tda10048.c
> > > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> > >                          u32 bw)
> > >  {
> > >     struct tda10048_state *state = fe->demodulator_priv;
> > > -   u64 t, z;
> > > +   u32 z;
> > > +   u64 t;
> > >
> > >     dprintk(1, "%s()\n", __func__);
> > >
> > > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> > >     /* t *= 2147483648 on 32bit platforms */
> > >     t *= (2048 * 1024);
> > >     t *= 1024;
> > > +   /* Sample frequency is under 613MHz */
> >
> > Are you sure about that? Some DVB devices have very high frequency
> > clocks, specially if they're also used for satellite, so I can't
> > be sure by just looking at the driver's code.
> >
> > Also, we had already a bunch of regressions with "fixes" like this
> > that actually broke frontend drivers.
>
> This patch preserves the existing behavior. The sample_freq_hz variable
> is a u32 so, in the original code, z couldn't have been more than
> U32_MAX even though it was declared as a u64.
>
> It's possible that the original code was wrong.  We have seen that in
> other places in this patchset.  Adding a note about the datasheet is
> also a good idea.
>
> regards,
> dan carpenter
>


-- 
Ricardo Ribalda

