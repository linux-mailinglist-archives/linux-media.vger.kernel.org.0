Return-Path: <linux-media+bounces-16558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D03A8959846
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 12:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 873121F214A7
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 10:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CE11E0953;
	Wed, 21 Aug 2024 08:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UzmlSjTz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186891E093A
	for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 08:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724230635; cv=none; b=TGPudBPGS0UwAgasP2q0U7OJrg0W2YGTlkA8hM+nqDjy3M6yyKsqFs1fTjiAysX0hjWSXqtcpvXgrB6mcNCo5sVIvijYGtHN15ZGSOQy66gbVUwBIrHwBoxtSFIB07a7HdafVJ+si+UMnnIpbqG8sy9KNzXbqHdCyuy+EuoVi1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724230635; c=relaxed/simple;
	bh=XiTaGykEXlOK7qo6DqiaH9pBLD9MfNMnNE4nZEAE5fE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALeg3ujckd5+i//DY3I7NGL9SFfJtnjVcIfwX6ceiwILeWe7/hvZauhNUrtsPeNzmrty1qthoSHkgZYKNnRp58SGp/qbGteCyDXgfW1Oc/JNdG8CqZUeob5TP18f/on/vGcBDzWMuTp2+SjVysI5bCZWDrbYfndyPxTdJwlwi6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UzmlSjTz; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e0e76380433so6689259276.2
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 01:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724230632; x=1724835432; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0V60v0KwinrqIcf0dcsmelQeeG3cYskrSTMxoS0mUlI=;
        b=UzmlSjTzRoI+ZXUyFOCczgXrn3EEMLaShDofpdmgO2fTP9pQLLrEoyqImXh02WhnvL
         wUB1XG0dkmTZw2XqLFDdKDBhJTfK6E7DNtyjKzBrJRqqZc4U8G2NqY20W3ChHYVShzNo
         EqVDD5F3PM+zMsQ4pnTPfUcQniY09NjnHrOOtIfpri+FoMgrc86BcEyVGgw1K61M+EUJ
         RGFCWkneMtBLYgyug3nrKVAs5X8KDO0AySJ0tvljkDKVPzjQTfArCf5UcC0yOqSrEGQK
         YbrsIWZcire6Tp4L12rRT4au+Owmi/jQ0DekcnhbnHrS0Hs42jI6nyyn14WjLuRzyTwU
         1irw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724230632; x=1724835432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0V60v0KwinrqIcf0dcsmelQeeG3cYskrSTMxoS0mUlI=;
        b=sEthvgq7UfYAvoBZPg48ek70KDkUz6B/LdMmhKbElEEAtUdMOz1HIZGS75TR8pRpNA
         7xdvvWZjXa+Le60Ad7f/Nyg7S6QEVp4p1XzTTx754IfECweUWVbrZvX3hVDcK05yArHT
         hTODv7AlW9+roGNCbnG19hKFwIgBccJ5KevKKSBOnoMYDfXAvBDp+6Y4BtjZ1B9Nudtz
         bb0wpQBr9lUteAehrxIDtHn/q5dug4Yhp2ynw5Db+aWfRWo/rxgYYM+/2WHUt2Ofme+Z
         /Nql1bTK+yXeNTUcmK9B6sYc6yLVA94TIyxjn/NAIwzINBT5gVJgND5Var8Sbrf/bbPJ
         9zow==
X-Forwarded-Encrypted: i=1; AJvYcCUmytF4p7VDqRoJWzG81xOFRkXJdo9/UplBUeTakUasaoBjemktncCw5c6LCgWoQJbd2Dry4A/EAsCp0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmOrEM3VDFC4n1ykdBM0gBsUmJTtIGlpwA7oPJXCCBDUn6asFl
	r8YnENi92COuU9bDQTLVhsYO/2HGZxyMOdYBn1ZTIsXlFUY2ydOMxcyIFADe/l7gXfMxqLaac1J
	8zkzmvyoITiEfw5eAZ6GvIiw1Wiecu97irslvCQ==
X-Google-Smtp-Source: AGHT+IFe0QsIxtrjTu7cTIqZJ9lIeMtuZRcq9T15jB59XMlSfHcZtdLW6S/QNRL9WZwdcPfaFab4taXyswDraMCQ1Ac=
X-Received: by 2002:a05:6902:1ac6:b0:e16:6feb:e615 with SMTP id
 3f1490d57ef6-e166febe73cmr418747276.48.1724230631986; Wed, 21 Aug 2024
 01:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723144610.564273-1-ulf.hansson@linaro.org>
 <20240723144610.564273-3-ulf.hansson@linaro.org> <0af670ae-8c8f-4e78-b1e0-e9ccb4fba2c9@gmail.com>
In-Reply-To: <0af670ae-8c8f-4e78-b1e0-e9ccb4fba2c9@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 21 Aug 2024 10:56:35 +0200
Message-ID: <CAPDyKFr5xjE867rHRZxtKPr0iKh9B6_Ckyu=B4Jzn-ExDpQjVQ@mail.gmail.com>
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

On Tue, 20 Aug 2024 at 22:48, Stanimir Varbanov
<stanimir.k.varbanov@gmail.com> wrote:
>
> Hi Ulf,
>
> Thank you for the patch!
>
> On 23.07.24 =D0=B3. 17:46 =D1=87., Ulf Hansson wrote:
> > Rather than hooking up the PM domains through devm_pm_opp_attach_genpd(=
)
> > and manage the device-link, let's avoid the boilerplate-code by convert=
ing
> > into dev_pm_domain_attach|detach_list.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >   drivers/media/platform/qcom/venus/core.c      |  8 ++---
> >   drivers/media/platform/qcom/venus/core.h      |  6 +---
> >   .../media/platform/qcom/venus/pm_helpers.c    | 31 ++++++------------=
-
> >   3 files changed, 14 insertions(+), 31 deletions(-)
> >
>
> Acked-by: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>

Thanks!

>
> I'll pick it through linux-media.

Please don't.

I should have stated that this depends on another series [1] - and
they need either to go together or we need to defer $subject patch
until the next release cycle.

Kind regards
Uffe

