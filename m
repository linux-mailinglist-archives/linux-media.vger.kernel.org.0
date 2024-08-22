Return-Path: <linux-media+bounces-16621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1EA95C05B
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 23:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B64B01C21DF5
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 21:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BC51D1752;
	Thu, 22 Aug 2024 21:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XQGIyIh5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDD212B72
	for <linux-media@vger.kernel.org>; Thu, 22 Aug 2024 21:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724362848; cv=none; b=OyfSGVBB0scVX56mFx3duWK9Ds+bqA3hvuDLxxqkAZ8HHhi0lcBgTyPy7IwTXMuIiLlfByWGWFVQMtey8hj8Que3ikaF9ZcamJat1HcVlM9p9hqB+mVP1MKVUdBR/zPqIBBWRjVZNLFTzTAFGvozGdcMNQCccEVL0SCmaMHHQT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724362848; c=relaxed/simple;
	bh=YAwTBlspylclxG2dO/RW9LGMYbdR0PNTcVaNyiKAFKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0cSNB/lAGdvsTieKz2F5L8jD0dhf03pDdcCUmP7uXxS4sJVmOVcZebUpd9Fay8QMCjIBF4TbopJZroCOljHL5nccosyK8QaTNSwA58PYgaIgySa0LGmiKjOhRdH6isMDeRTiQIH7Ta6AtWnBdS0EsGW6whPkr/LID6g7pY1IhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XQGIyIh5; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso1388989276.2
        for <linux-media@vger.kernel.org>; Thu, 22 Aug 2024 14:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724362845; x=1724967645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZT9AcM0ePvmiNGNtKdrgApHdgj0aPYzu2lD9LlnjVd8=;
        b=XQGIyIh5NbKpQi1ptLxfOZNJTEhZoIMvCAY7vF5OblF7WPwBZdTQhLB4ziU/dz7UjC
         QbLFSFPXcKurTDt4dUUifGrQncZkRdEiC1o+ITT+NFlWeCtV2aXzlmU0k3236bIAWMV+
         4gAxvGr8NERThSMBPIOxYg3B16HmrpH0oZnPDz0zR+oPqfiT8+I9KML8xIB8zznmH18J
         Upg8iM9nd8RiaV7RTDueLo9YXLTyjQDcGUpW3j3tEYcBK0PHtDHSEKl5Nc89sy54nVGb
         GwlzwKsUcS+FY02ZSfCdyYjsIzzlBjkUEBUVZBmtUnMc9RmnujB8xWnJi4n9xfeI7z3L
         0a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724362845; x=1724967645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZT9AcM0ePvmiNGNtKdrgApHdgj0aPYzu2lD9LlnjVd8=;
        b=OuP7wMjcHfoLJ7iBtvG0Ym+Rq/Uor1TvXwnwIYgq2NmtRUVmwc38sijACnqxiyov8Z
         jMOogLNpx0TWcS8E7ZNtLC+hCFEvqvCr1Vy1OYYUExpE13sK/8r6K2dMQrKWV37nW3FQ
         d4btiizw9ev2GSg+Q8GfL9XpPlMjWtV6taowBY2bLNZbFdCqX5+q4/e7sR17YlfqhU2+
         GUNop2Ajd977/kXvdGldw8gg31m0mN4t66h91NzKTcbLOADargEmk1sL67uqIkyECySb
         lWQErmCtXbfk9z5awrGfDaPlU8LSgPSC6uW7H53c8Uycq0VTGhWdvSHLw98DFeWXl+TD
         6yKA==
X-Forwarded-Encrypted: i=1; AJvYcCWA9yWAbq4J0xDGLdcHS7CIQFpG6BrCwb/3+exWHfQwjmSvqqoYJzWBRd9eQprowm50xsaiO0IQvu7VBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw56WwojAivuWpZSbNQ3tVzucg9yP89VzJxb7f49bZaISKDkWyd
	QTHpb7eIbRo+D1Mn/TVoG16XgM+FyPjb4REoJn0R6K4UtTtlNUEAr1vgudF8prHt/lzOxFX5429
	Ko4ZoycnN0MUITb0pWJiriIfaE9S4HXCA/pGdNQ==
X-Google-Smtp-Source: AGHT+IEqgdfXdOfSwd9Wk29Zs7Gg9XD8psen0pbklM2Nwowqt/bbjkVBarQRzKbRRoNz7ciwvAr9rkWW9GaQjfXbk8I=
X-Received: by 2002:a05:6902:849:b0:e13:65c9:e994 with SMTP id
 3f1490d57ef6-e17a864dc20mr317011276.41.1724362845157; Thu, 22 Aug 2024
 14:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723144610.564273-1-ulf.hansson@linaro.org>
 <20240723144610.564273-3-ulf.hansson@linaro.org> <0af670ae-8c8f-4e78-b1e0-e9ccb4fba2c9@gmail.com>
 <CAPDyKFr5xjE867rHRZxtKPr0iKh9B6_Ckyu=B4Jzn-ExDpQjVQ@mail.gmail.com> <bfb90d04-6885-4623-a846-f04b4fe4bff4@gmail.com>
In-Reply-To: <bfb90d04-6885-4623-a846-f04b4fe4bff4@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 22 Aug 2024 23:40:08 +0200
Message-ID: <CAPDyKFp5R=T1BgCHZhR=mr+z7VnF3x=DeAvjPZ3bE1Q5TWYzVQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] media: venus: Use dev_pm_domain_attach|detach_list()
 for OPP PM domain
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Aug 2024 at 20:05, Stanimir Varbanov
<stanimir.k.varbanov@gmail.com> wrote:
>
> Hi Ulf,
>
> On 21.08.24 =D0=B3. 11:56 =D1=87., Ulf Hansson wrote:
> > On Tue, 20 Aug 2024 at 22:48, Stanimir Varbanov
> > <stanimir.k.varbanov@gmail.com> wrote:
> >>
> >> Hi Ulf,
> >>
> >> Thank you for the patch!
> >>
> >> On 23.07.24 =D0=B3. 17:46 =D1=87., Ulf Hansson wrote:
> >>> Rather than hooking up the PM domains through devm_pm_opp_attach_genp=
d()
> >>> and manage the device-link, let's avoid the boilerplate-code by conve=
rting
> >>> into dev_pm_domain_attach|detach_list.
> >>>
> >>> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> >>> ---
> >>>    drivers/media/platform/qcom/venus/core.c      |  8 ++---
> >>>    drivers/media/platform/qcom/venus/core.h      |  6 +---
> >>>    .../media/platform/qcom/venus/pm_helpers.c    | 31 ++++++---------=
----
> >>>    3 files changed, 14 insertions(+), 31 deletions(-)
> >>>
> >>
> >> Acked-by: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
> >
> > Thanks!
> >
> >>
> >> I'll pick it through linux-media.
> >
> > Please don't.
> >
> > I should have stated that this depends on another series [1] - and
> > they need either to go together or we need to defer $subject patch
> > until the next release cycle.
>
> Sure, then I guess we will deffer venus patch until the preparation
> series is merged to avoid conflicts. Thank you!

Assuming the preparation series gets accepted, maybe we can give it a
try via my pmdomain tree? Or do expect to land a lot of code that
could conflict?

I also realized that I already have a different series [1] queued in
my pmdomain tree from Dikshita Agarwal (reviewed by Bryan), that moves
an existing call for dev_pm_domain_attach() to the new
devm_pm_domain_attach() helper. So far I haven't received any reports
about conflicts from linux-next, so it looks good I think.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/CAPDyKFqsHL3uatmLZaRzZ_GfkZw-+fURQNSEgvmrf-ini+=
WHng@mail.gmail.com/

