Return-Path: <linux-media+bounces-10323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EDF8B56EE
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 13:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51AA51F2620D
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 11:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11F246453;
	Mon, 29 Apr 2024 11:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MPVTwJat"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC753D961
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714390783; cv=none; b=Ik1fgBWiXpCwi1GQwghPMn4WiaozpjCfdYvEcD8asFSEV9bTV6OkZr4b2t8NXfO7KONiDAjnHX0+hwmKan24MzJ3CSCuPPzj83cnUxwMGYzXSmk5m55ZA0hJu0W0Rf5nl/AsLNaRebY4i3wwKco9KsEETH+9bu3dVwnbIi4qQmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714390783; c=relaxed/simple;
	bh=I96nVD/pvl/HbzA+JSRfMVYooN/S/Dzke1463qRCo+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DR9o7F8k8attMW/Ed8EYyZp5XA0xRkRdIePXql0dhX/7XPtJIEH1d4/gAzIGNf9ND8drtu3BfPKQiuVK+Y9JEeGKPpmk6Ho3zI36dj8s7jdo7MwmNwm7UEYoxHhB3ocy/juiGidLAH6UAuNedzCAIeT2YRnaemd9/vTJxwwednE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MPVTwJat; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5af03aa8814so3162689eaf.2
        for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 04:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714390781; x=1714995581; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=05L08pI3kBTDsTqcTJqQ2PruWVHcpez2K/eYqwLWDm0=;
        b=MPVTwJatyDLYP3g1H06sNv8qi68dfxAH6k6GgKzb3blmsttWHzYsqCR5UZJddUB4lo
         CH3SBkcRyH7prIbaWdUVf3eJwrtF/cEiNn2OoApeIrNL6n45VAUZ6yjnmbrwoiPT4X80
         js/cfLMc/1AkccLURcui0twXbRMJT2uxTfDrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714390781; x=1714995581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05L08pI3kBTDsTqcTJqQ2PruWVHcpez2K/eYqwLWDm0=;
        b=A6oLaPjxnQ+ULfwnLarua9CjEbTjF+BbihXR/Q7KuzUU6ndSYY0SQTiidno01kGJrC
         0BZFgnZCj2LbTZsBZFeqXKja4dLENpdlCcfRppeCOPH6bwCbWCQwHa92pzlnLXmgW7rz
         IU6SH1wGqDEPMwOQB4rQGfqwine59xfTfoVWZJRL8UFEL7NQkIaTYJtMlVAp0DFgICkn
         CowfjCs0JHg0GlWV39Hb12u/SPxqr99rpLUMvwtrgwmGKmYoD+25p4SjhUyeg9lacmnc
         kTg+66uCGMBy/F2usz1rpqLl3LQu94FDuYaIRO48t45+HSf44Sj/4g9N4dQizykR4h4n
         +6+A==
X-Forwarded-Encrypted: i=1; AJvYcCVWwh6/ug2VhAsLycKnt8BksV3xToD/ibauqoZdjk7CItGWBDvE+jxk+4os74/MmjL4qySMHt2VVSdBPtcawUHxAM6+SR/3sKN9eXM=
X-Gm-Message-State: AOJu0Ywf00Af2FvaSkXUkQiLi5cBImCqa8WhaIATDzP/6R1Vb0nzvyms
	6cV7LlIjik861myf3r5i59qaQQ659rR5URcE42xWoGoKo8Y2zJ215EpDOPZEz3ZMRW94u/capPw
	=
X-Google-Smtp-Source: AGHT+IFgNag6gu+iuqu7z37DKFAHbshe+i6zyAURqn/51Etw5yYwn1hJVg3/iJjUBsEeTb+UmqQ35w==
X-Received: by 2002:a05:6358:5394:b0:186:4ada:4256 with SMTP id z20-20020a056358539400b001864ada4256mr6906837rwe.22.1714390780661;
        Mon, 29 Apr 2024 04:39:40 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id mz11-20020a0562142d0b00b006a0cd9856b7sm921134qvb.32.2024.04.29.04.39.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 04:39:40 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78efd533a00so322871185a.0
        for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 04:39:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX2aiFyvVIkX69S1V0KrDKbnJ8AgUS1nrIa+OnaH4vRpsbA+hJMPut2n0tILH9Tajxw6sC+mUqDv0sl81RpGrFe1wEGgmf35QMSkXA=
X-Received: by 2002:aca:f1a:0:b0:3c8:39b2:bd8b with SMTP id
 26-20020aca0f1a000000b003c839b2bd8bmr7165395oip.55.1714390759097; Mon, 29 Apr
 2024 04:39:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-23-477afb23728b@chromium.org> <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
 <7a8d403b-8baf-4eff-8f9c-69cdcb8b2180@moroto.mountain> <9ba7f4e6-2b8b-44a3-9cac-9ed6e50f1700@moroto.mountain>
In-Reply-To: <9ba7f4e6-2b8b-44a3-9cac-9ed6e50f1700@moroto.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 13:39:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCsCpE55_huYq1BchDCR88O3FWRYBGYwA00o01ZdZeL3NA@mail.gmail.com>
Message-ID: <CANiDSCsCpE55_huYq1BchDCR88O3FWRYBGYwA00o01ZdZeL3NA@mail.gmail.com>
Subject: Re: [PATCH 23/35] media: dvb-frontends: tda10048: Use the right div
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

On Tue, 23 Apr 2024 at 11:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Btw, here is the output from my check (based on linux next from a few
> days ago).  There are some false positives because Smatch parses
> __pow10() incorrectly etc but it's mostly correct.

This looks pretty cool :)

Are you planning to add this to smatch soon?

Thanks!

