Return-Path: <linux-media+bounces-16560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 766B1959852
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 12:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A94971C218E7
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 10:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21B61BAED7;
	Wed, 21 Aug 2024 08:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fDBI58+B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3C51A4B7E
	for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 08:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724230781; cv=none; b=KrwF3ntI0EyklePIadn6PO5q/1VCCiWwCc/lFAVYuSXwnWd3WVWXUu49DdESmirey3m+rBSCZ73OTLyzmul1P3l6WdOX++eXZofXMp0hjH+3Q2bXACtijFmg2Mvva7tM12Up1LhzUrf/7bKLK8BMiHkcSGUwU0S54RdMAKe2OnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724230781; c=relaxed/simple;
	bh=s9ykuWWKcIzYSLhEcZ+7Y4Hgz3fhKuaaWdhkvIE3Vr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6A4y8BB+EXBFiX4Al7VRGZ+ldDoYJrMjLa/8WFmGT8A2pZ4fft4EKgx06feHgd2gkKbujepCWe3gSD1slOrUzLW8jSKlLWwDY0UpHgnoeBYtMkHBs3MDmOUBruf8Tkr25VT50d9kq/t6Ff8fY0WKIDEyaziOs/bHfDx9XKSnWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fDBI58+B; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e0885b4f1d5so6728221276.1
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 01:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724230777; x=1724835577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZLdwMEs9e97Ffbpr5sQWKeFKLgx/5QLihyfu1wCHdE=;
        b=fDBI58+BHQuhvC7WpH8a6BCGrEs/cHEl1EU6xLeOda9YpanIuZi5MrcIysmii4liNF
         hfV9YMwgU+4snAdT0nCHnwGm5X+am1i0p0jI0uHdZwwPf9XtvRxeqHN0MC0++wllnsQd
         drnfhVUX8cNiLvo4e7GeaNy6XSyM0nF5Fvuylajrd+BR3EUg3HBFTrDzEKOeBzcLac7D
         dvUTHkk+fX8rSPyzmOD+TOGKLm+AfLPzFRqHYfRElTEeFFHoFTFlUdmw5EOjZJ0OnYqB
         YJz185qyp0cgo95SvlLuvIDLM5Oi+1QhJ6s4CLm/QZA83K+QO5tVmz9mJ7BDLUiweWe8
         v8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724230777; x=1724835577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZLdwMEs9e97Ffbpr5sQWKeFKLgx/5QLihyfu1wCHdE=;
        b=iCeOEpl3pmlrpMpRC2tELb0KnOjt5+Jdv8qvaV4tlBLmoEbFhPqevsG8o11NDLEaTF
         I2H0+vVTTmmbwiDsaMOnfFtogWzX9cTsd3GIzPFhWkWRk6ByqyUjOeUtTKozN0QdmBkj
         FkDkvklrRXMB7NBlsJqLypFjTUhNjfoqLLkU5b1akmIANhIxQKpacqm19KaIK4+UoC7D
         ofCRuTglKBfcmzjw9S998tgSJS6IB5i2zpe2qHOHAfLoOAEbOMYzIuidWWMxGwn/MvRk
         zevfu1d0FrzRNihfbceTv6eotOME/q677hAaNN1S+njqpLHS/JUZbHAJG410obc1upMh
         5wrA==
X-Forwarded-Encrypted: i=1; AJvYcCX/a3ADZX64OnfJDNv5hr5jwpFN9Rcv1zHwwc6qhijhyyTCz8lpJ8mTNvLp/pAD3asYGOHctlGmWsICiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyfLnJ0ALMFmzTD/Xg5FUvZubS7q7HeasQFhJdJq0yBh7VlBRq
	0TYlaPjm7c2/iTYwT0w8Nz3n6KzRHdkvwaN6SPnAR4p++tQyX7DZKsDSEvh433JPjVeDdueaEVV
	EJzzMgcrjtHQdalI5hJTz8+kY/ub7XaPAYhnnPQ==
X-Google-Smtp-Source: AGHT+IHCal/De+SEUKvHz6W9y7R33FpC1amVSgjxjWHDOYJi7w75J2qZuI5FPiGbNGA5CdRLRwf6TZKiBh3F5efpwPY=
X-Received: by 2002:a05:6902:e0f:b0:e11:7f99:f76a with SMTP id
 3f1490d57ef6-e16655627f8mr1731952276.50.1724230777443; Wed, 21 Aug 2024
 01:59:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723144610.564273-1-ulf.hansson@linaro.org>
 <20240723144610.564273-3-ulf.hansson@linaro.org> <0af670ae-8c8f-4e78-b1e0-e9ccb4fba2c9@gmail.com>
 <CAPDyKFr5xjE867rHRZxtKPr0iKh9B6_Ckyu=B4Jzn-ExDpQjVQ@mail.gmail.com>
In-Reply-To: <CAPDyKFr5xjE867rHRZxtKPr0iKh9B6_Ckyu=B4Jzn-ExDpQjVQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 21 Aug 2024 10:58:59 +0200
Message-ID: <CAPDyKFrhFHn0Z4PV1hG7ZtthzqFzdekO0vd39KXAPiD_0jR4zw@mail.gmail.com>
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

On Wed, 21 Aug 2024 at 10:56, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Tue, 20 Aug 2024 at 22:48, Stanimir Varbanov
> <stanimir.k.varbanov@gmail.com> wrote:
> >
> > Hi Ulf,
> >
> > Thank you for the patch!
> >
> > On 23.07.24 =D0=B3. 17:46 =D1=87., Ulf Hansson wrote:
> > > Rather than hooking up the PM domains through devm_pm_opp_attach_genp=
d()
> > > and manage the device-link, let's avoid the boilerplate-code by conve=
rting
> > > into dev_pm_domain_attach|detach_list.
> > >
> > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > ---
> > >   drivers/media/platform/qcom/venus/core.c      |  8 ++---
> > >   drivers/media/platform/qcom/venus/core.h      |  6 +---
> > >   .../media/platform/qcom/venus/pm_helpers.c    | 31 ++++++----------=
---
> > >   3 files changed, 14 insertions(+), 31 deletions(-)
> > >
> >
> > Acked-by: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
>
> Thanks!
>
> >
> > I'll pick it through linux-media.
>
> Please don't.
>
> I should have stated that this depends on another series [1] - and
> they need either to go together or we need to defer $subject patch
> until the next release cycle.
>
> Kind regards
> Uffe

Forgot the link, here it is:
[1]
https://lore.kernel.org/all/20240718234319.356451-1-ulf.hansson@linaro.org/

