Return-Path: <linux-media+bounces-19609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7664A99CC64
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 16:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0FE3B20F04
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 14:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751741AAE33;
	Mon, 14 Oct 2024 14:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T8G5airz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4E51A76AC
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728914944; cv=none; b=gwjCHVlC++aMlnh5mRawgJMYrY6pS2gha/D7FYo75yFVPQ4eH4O8cHt2+I+kwmHrj6q/eDyPFi4EgVEis8pRq57J3qxmEFLkpubW3OZAIhWnvpjMrQrEDHxmQBCzsylfZNh9suRNRYGVyn2GmZxpX/4ccl6R0f4GMKTrxFJDM8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728914944; c=relaxed/simple;
	bh=096XcezsKIhNQbiuhcWjPx2NJjm/QlTds+fuC3x2q2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPVAe2aCFlgeVKNAUCKhJBQEOSKPYPmyTDMk12KHitR34f2G3Rt4WPZua05zYnhGbx29RqmEPb0fPJ7tGcpRYDDE7XuC0UYhLorFH28cSs2S1WHI8B8/gQQ8cxyNFNZ65DlEltqAmVeBozmQblfl9CBSQSKcLNZ7PdLPJqDm1+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T8G5airz; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5398ec2f3c3so5070588e87.1
        for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 07:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728914941; x=1729519741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nkTfeSKVH/igcH5ZriHsNKyR0CJ+YrUmZw3kxQGcYG4=;
        b=T8G5airzS0rKPMefGc+R0ND3wCAHsXcDorqxHIQrXpy06LpDqut4KlpBvbk+wFHNKG
         QwfoEigZkfRj19CoffnDheZyG5npPWv7uxFSmkfYg49MwmdxJfmzclQ852SOn49d/fBe
         +8rhCqUMdMkZXHig7g3yDLbso4LQbncxiZe5+MnEa0qYwj1UHvN2pmZASt5ajb+ClwTP
         RXGRhGXAM4x4e0ttN+yZvEZcY/UWJ+fmhtw4s+HPidRPR1Fucvxw/oRqWjsdV9d87xED
         tZfyZgA7CNOeXfm+Zh3iSxr2/Qlg6HYnMdQrO60Lesw1lmBgcEHYgeBUQGMjalur854J
         GSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728914941; x=1729519741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkTfeSKVH/igcH5ZriHsNKyR0CJ+YrUmZw3kxQGcYG4=;
        b=DfwP8oJEqgLW8EB/fjTniWDKU9PvVeg4QlAzqH4Fuehtef917GZDuL7Fm3EtGuX4wZ
         +O5DhOU7R14GrXPs0cLOpftlmqjEijCOf8nk1myVEjLisXAoB+bLCzoj+JUmkxyDAV4H
         ltKt175KCcQre/aVKQG5ZRE9n/TZxbPZ17bC4I+63PqwqP4rHUJY7m4e8zlf8pQmFyz8
         QJqBFlCoM0fYnBNVIVcvgVcR+dqaIxb1Le8PlcD3RUxgeozVn0QW6nGwpc1hJYUBfxxR
         3I6ZIRyJYEVOmyJD2IgD28iJZiAok118T3il1o0B9lshBmb+5jHy5XXb8GkhiUnwgDHh
         3BaA==
X-Forwarded-Encrypted: i=1; AJvYcCWxXglckPnWQZ7h8SqARbTB/5HryWbujdRFQRn1APUMt04jndlfzrefPGysDySLN2fKmuITMi/rvFmUng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzgqX3jCqmR/me572A8MxzfC5QRIsLagcy1r7vbma70zUNp/ao
	49q9cNc4t5Gk3U3d2loD5bzR/m9cWDDqe38JEnj4TPCSkWZPXTnC7szd4LtVsL8=
X-Google-Smtp-Source: AGHT+IFaNV+gPEt3QJTDCvRINUz+1tvBKw2CJneHcD66w+NG/nUTfSgQyfrwPGJ3FNaKyTTlJR6Ucg==
X-Received: by 2002:a05:6512:1048:b0:536:a50a:3c25 with SMTP id 2adb3069b0e04-539e54d7979mr2852605e87.12.1728914941171;
        Mon, 14 Oct 2024 07:09:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e3c3e0d6sm1089090e87.161.2024.10.14.07.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 07:09:00 -0700 (PDT)
Date: Mon, 14 Oct 2024 17:08:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 27/28] media: iris: enable video driver probe of
 SM8250 SoC
Message-ID: <7vmxx5qtbvhyfcdeariqiult27j5rmykxrefl2qmkhqnrw5wi5@6ugxtx643bmq>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
 <20241014-qcom-video-iris-v4-v4-27-c5eaa4e9ab9e@quicinc.com>
 <Zw0j9UeJmC1MZ3Xt@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw0j9UeJmC1MZ3Xt@localhost.localdomain>

On Mon, Oct 14, 2024 at 10:00:21PM +0800, Jianhua Lu wrote:
> On Mon, Oct 14, 2024 at 02:37:48PM +0530, Dikshita Agarwal wrote:
> > Initialize the platform data and enable video driver
> > probe of SM8250 SoC.
> > 
> > Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > ---
> [..] 
> > diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> > index 86ef2e5c488e..a2aadd48926f 100644
> > --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > @@ -325,6 +325,10 @@ static const struct of_device_id iris_dt_match[] = {
> >  		.compatible = "qcom,sm8550-iris",
> >  		.data = &sm8550_data,
> >  	},
> > +	{
> > +		.compatible = "qcom,sm8250-venus",
> > +		.data = &sm8250_data,
> > +	},
> >  	{ },
> >  };
> >  MODULE_DEVICE_TABLE(of, iris_dt_match);
> 
> qcom-venus driver has already supported sm8250 soc, I think you should add
> an extra patch to drop sm8250 releated code from qcom-venus driver if you
> tend to add support for sm8250 in qcom-iris driver.

Iris driver did not feature parity with the venus driver, so it is
expected that two drivers will exist side by side for some time.
Nevertheless ideally we should have a way to specify which driver should
be used for sm8250 (and other platforms being migrated).

-- 
With best wishes
Dmitry

