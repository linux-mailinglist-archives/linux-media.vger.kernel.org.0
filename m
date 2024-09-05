Return-Path: <linux-media+bounces-17670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EE096D6BD
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 13:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D85B1C22DBC
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 11:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470EE199247;
	Thu,  5 Sep 2024 11:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rWy8oBaC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B031991D4
	for <linux-media@vger.kernel.org>; Thu,  5 Sep 2024 11:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725534489; cv=none; b=P7uXh5GlS+EWShZ3k5kuUGlduc3WhmhcirS7O/6Wt8imHk/oqDOejkAX8QVln/YM/aqyb1uFS6S3eC+KSvhKQiMW+T4I6QxZ2i41ApGJXt4CH/+47lKy0npBv1gqFTqKJrzARwOgSDFrqq+9Yg1a/ug7HoZ/x0x+6U/yaXjFTTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725534489; c=relaxed/simple;
	bh=LjNVW2t4fx6M3KhMjZkbWuFnRp1gmQfRp9GsPw5jOlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FJnNrXpwKgItm8l6v2qgkSaNHw2Klr5Svani0C0Z+FZE7tKLXTWiKJ8jERTfikMIylHLhY8eDORwVwbb37Dh7hY0s+00kxBLvMWBs0MrUvxHBGGJamk8uRUV3SbHIJI2chJkIATF/UqdpFM9D2FVkZG6oY7i87P6TPambvZorI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rWy8oBaC; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6d5a4615a56so5955127b3.0
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2024 04:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725534487; x=1726139287; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HLrWheA/uzPL842yXk9I+vlIRzYAG2p0JR2tMx/QCJY=;
        b=rWy8oBaCGoslJjxlJLT4XP07WqJPGsg0IWSSPMiGl9CZj0tz6OPS4UcBCQoboYQdyS
         QGiTWleIE2EpK67WDIl3XntWZop0njTpWhpBni6ULXp6L8+Bk6LEFpfydNln5d/fhiy9
         1DWKAMVxv12r1cMVdAa6GoP9QayTOFpgSgIEcTK7mlyPQ45wEW4aj3lpcBZQEOggE5C/
         jxVYRx1/lwYBJMla9vZp4Vk/dbfI1x7pAs6D3aNFuTZCk7R3dS0mLHCh6zNfAgO6fV85
         vVSomh1GqNfBRvMWcNM5Z33IlNeCXwnEuLjfeVQo/Z0v/MqlXA8ts1R9OD4JwHWJ3r2l
         F1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725534487; x=1726139287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLrWheA/uzPL842yXk9I+vlIRzYAG2p0JR2tMx/QCJY=;
        b=qadcdaUQAPiGFo7rc+3adXs1eYxOQU1vZJGuVvkVyE6MoOWX17U3EfvvZ8NNvoAy1B
         AanInX0/aBiIeVBmxpRCpOtB74wTm26QffHGE3yFoV7Uj63TEH440IAANllUDjLgjYaq
         9Nw7LjOB9gLjd5nAFhTycnl4dLxiiIN+M9idNeN525j4HtTVlh+X4UI8HByudaqQVd8/
         nEeFkvSmP+6PButlRZZpEjq7WNYwcd7oGcwvI/3tiUUmUEP/tgRUbpspXv4wFATCw6Mk
         DE1XZxBS53iB63S2Q/FqCkGD3m+bCs/zQxTu4hudXlwMp7eGeipOanPQ4E4I4SCa6dGZ
         aNAg==
X-Forwarded-Encrypted: i=1; AJvYcCUHTpUZsS2cpjPQWdOrorUbjLegrlHMLJ1OR2hYX7VULHAad17jCjpzRcHAH5dPAt1ww5GbdLVOJbyNRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRiGqAACdooJEu4RsuM1ZjLaNI/phfFVD5FiFIPHuKx8Nfec4E
	wRur9SNpl0x/9Mg5z+PVzDZNHuQ/a3X23vXC/NsmZf84N68g0niWIM5MLoxFhaStz6stCvGuoGf
	+41cPWrzKaSS8qP8RBnRyp+w0H+kVZgi131XJIw==
X-Google-Smtp-Source: AGHT+IGljMR2FuGqpIquRAyHFIE5n6Dy1ErNi4U6Mj6X5eeEczgYFADvJ6drwPqPMiVgjZwm2fm1F1g0Y+MriMT7lOE=
X-Received: by 2002:a05:690c:16:b0:6bd:8b0a:98e8 with SMTP id
 00721157ae682-6db236c8840mr77162967b3.24.1725534486926; Thu, 05 Sep 2024
 04:08:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-3-c5fdbbe65e70@quicinc.com> <74126160-57f9-4abf-a26c-3491c8f3dd78@linaro.org>
 <zfltcl5x4hol2foftyvr4oigxus4hnequd74zi7bdd7tsdv56q@3nphukr4zgmm>
 <fa674301-9c4e-c4de-361a-1d1abf413ffc@quicinc.com> <adb2eed8-8d5e-a052-81b3-cde705c3503b@quicinc.com>
 <ydah7lm6ov26fy5odqc6u6vlfu2w5gzqxquplimhbdamw3gdpj@dmgdr52pvm5g> <bcfdeaf6-58c7-1c53-035b-07ae4bfa37f0@quicinc.com>
In-Reply-To: <bcfdeaf6-58c7-1c53-035b-07ae4bfa37f0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 Sep 2024 14:07:54 +0300
Message-ID: <CAA8EJpp75N0OHZZ+dLnKXXDk7AksJjYkKP0uwJ+da3zA+60KgA@mail.gmail.com>
Subject: Re: [PATCH v3 03/29] media: iris: add platform driver for iris video device
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Sept 2024 at 13:59, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
>
>
> On 9/5/2024 3:41 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 05, 2024 at 11:45:25AM GMT, Dikshita Agarwal wrote:
> >>
> >>
> >> On 9/5/2024 11:42 AM, Dikshita Agarwal wrote:
> >>>
> >>>
> >>> On 8/29/2024 2:43 PM, Dmitry Baryshkov wrote:
> >>>> On Tue, Aug 27, 2024 at 03:08:03PM GMT, Bryan O'Donoghue wrote:
> >>>>> On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
> >>>>>> +static const struct of_device_id iris_dt_match[] = {
> >>>>>> +        { .compatible = "qcom,sm8550-iris", },
> >>>>>> +        { .compatible = "qcom,sm8250-venus", },
> >>>>>> +        { },
> >>>>>> +};
> >>>>>> +MODULE_DEVICE_TABLE(of, iris_dt_match);
> >>>>>
> >>>>> The enabling patch for the compat strings should come last - if its first
> >>>>> then the time between the compat add and the last patch is a dead zone where
> >>>>> things are bound to break on a booting board.
> >>>>
> >>>> But then it's impossible to test the driver in the interim state.
> >>>> Moreover enabling it at the end only makes it hard to follow platform
> >>>> data changes. What about adding sm8550 at this point and adding sm8250
> >>>> at the end? Or enabling qcom,sm8550-iris and the fake qcom,sm8250-iris
> >>>> now (and clearly documenting it as fake) and as the last patch change it
> >>>> to qcom,sm8250-venus.
> >>>
> >>> Sure, we will add qcom,sm8250-iris at this point so that it enables the
> >>> testing of the driver, and will add one patch at the last to add
> >>> qcom,sm8250-venus.
> >> Sorry fixing the typos. what I meant was,
> >> we will add qcom,sm8550-iris at this point so that it enables the
> >> testing of the driver, and will add one patch at the last to add
> >> qcom,sm8250-venus.
> >
> > I hope you meant 'to change qcom,sm8250-iris to qcom,sm8250-venus'. Also
> > please clearly document that qcom,sm8250-iris is a temporary thing just
> > to facilitate documentation and testing of the driver to be removed as a
> > last patch.
> >
> I was agreeing to follow this suggestion of yours
> "What about adding sm8550 at this point and adding sm8250
> at the end?"
> Where we will add sm8550(qcom,sm8550-iris) first so driver can be tested on
> sm8550 and add sm8250(qcom,sm8250-venus) in the last patch.
> I think Bryan also agreed to the same.

To point out, qcom,sm8250-iris can not stay.

> >>>
> >>> Thanks,
> >>> Dikshita
> >>>>
> >>>
> >



-- 
With best wishes
Dmitry

