Return-Path: <linux-media+bounces-17661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C0896D58D
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 12:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EDEB288707
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 10:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DA51474CF;
	Thu,  5 Sep 2024 10:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GU8y23pd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244E7198827;
	Thu,  5 Sep 2024 10:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725531122; cv=none; b=Ks8ZX/Urw75T97QQyMMWkeMOU9Mvn1taL9a3rAj0Lvh3cpRNXWe+lfklUMqzFM74gg7aHJf2McVd6UU4ULl3wW/NO1I6evsGNt8Uhf6MOsZoQHKn9qQAHht2itwcJUGwDnc4/H5M937PFOHyxpCttSHM8UDLPTaQx6hwGRvEY3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725531122; c=relaxed/simple;
	bh=NpgfnBUDDDIHIJ+5rvxER+luCoAGATy95tqNs1ggz1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxF1QO3SwDsLUHViDag3uZB/ZXc9nCyeG5U53WRw2PBFNk8U8SLkrM87AaH8mT+iL13Jc3yWLMPjNcRUhPLzQx43cWTVsC7LspL7amOX3a8WoZIR+rhfbfCkobCbpMHb4fEvitaMm2nGDNBQ9dqQlQNMfG2bpm1iXP5G/fAGQtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GU8y23pd; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso979844e87.0;
        Thu, 05 Sep 2024 03:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725531119; x=1726135919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pzrURegSMUDDYerdE+30Uf6YpbtaSiHaZehj0uPry7E=;
        b=GU8y23pdHbFqklGZlaI9FN0IsBiXvTj7N+3arL/dIXJD1ThqlMgWwtjrlFOno/Dgmd
         O1JIEr+T5B8oYGRn9SAH1y53y3dEZCF8kBLfOrP72ZZdrSIRpMfM8ttUGCOz5Myq0ZDb
         DHqkciqAHhq5e+h3S7h+hITfS0HkFt0pv920Y0FOmmq8xQMCXGcS1B7nABw3HljQLSny
         ihk3vtHnn0jDqzeoYmFW+5Ld7d9rcbGnGqz2xIch1u04THykO1Nij02uSx3DDv3KqG0I
         ovyJ/kThBHp44KsRD3htJdnqeRYkfhVY5tev9Gp9+cn1sxnSxrObMIBPmi9Qdqhvq2ma
         ZkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725531119; x=1726135919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzrURegSMUDDYerdE+30Uf6YpbtaSiHaZehj0uPry7E=;
        b=bJ8mSS7Cc6BCidILdpSFEik+sOW1L7qm3WJFLn+EbhAIJWva3ok4HnqO8QJXt4LDhW
         9L2jxI50Sq2FqEhvjalrqG2g/ffxvzvjAIegLEeJXGJRgomfmBwkB3A3BpgWCqEVJhss
         8jSYaHji22z/G/SUtG19Xs4F9kCI3omisx9LEywq0HGNboEcBZEZDMnso28mcuxc6Bbl
         4kVYOgOlH5KhS1BNqk1MZ4+e3/wrzOnAHkKrFVRLjgSYIYGDKntNEvmcmVbjiE69ZmwK
         hUtbAoQ2Wsu4I4BMDhwx3eNdXC0i6y/wyWigFaSFydUqwgMlJj9L0YpvP7UDx+VTCTx+
         a4Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUwgyHOvKqrUcYGJGNtmNGDClOOsQewmj6s6qgi5D8u1/qcqVlvWua3pYrAFokeqeo1O3sB+t3wf8BQLQk=@vger.kernel.org, AJvYcCWLVsrODw9LYzYyBoSxnodezdg2FRdqI+mnk36c9WnlOaaHu05LLEfyCkXFtiCCUpVcUArh/09N5D7TGHu1@vger.kernel.org, AJvYcCWzho8D2rUUshBBAz5i3DgZAsimbdu3+gQ/0E56nywtPAAzIjmbQ7+ZwSVG+tyEJK3o+/7oxshsBNtl@vger.kernel.org, AJvYcCXJBr5P19yO7sNXxEdgeZg5Kaq8QzWFVt5L0ZTF36PnovdWYxHXstyqh7AlFR6Vky4p2kK2T3IjDdmrqzAyNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ZKky4VH4/CBh2dfAS3LPCoc4378gCnnqhBYeOMD4jr5OWhMF
	VI0SUlOGD5UFVGkZPwFAAZZncuUP9Edv+7xkPjAwV6WO/VUPKS8/
X-Google-Smtp-Source: AGHT+IF4+CfYhaSNDTCoF8WR7KvHhLY8mDHHI6agOH9EqSh0FYR5WXYowVijtgaLMH4pyzRQuTq16g==
X-Received: by 2002:a05:6512:1244:b0:52f:d15f:d46b with SMTP id 2adb3069b0e04-53546b05cd2mr14947909e87.14.1725531118288;
        Thu, 05 Sep 2024 03:11:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536544c40cdsm62422e87.114.2024.09.05.03.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 03:11:57 -0700 (PDT)
Date: Thu, 5 Sep 2024 13:11:56 +0300
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/29] media: iris: add platform driver for iris video
 device
Message-ID: <ydah7lm6ov26fy5odqc6u6vlfu2w5gzqxquplimhbdamw3gdpj@dmgdr52pvm5g>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-3-c5fdbbe65e70@quicinc.com>
 <74126160-57f9-4abf-a26c-3491c8f3dd78@linaro.org>
 <zfltcl5x4hol2foftyvr4oigxus4hnequd74zi7bdd7tsdv56q@3nphukr4zgmm>
 <fa674301-9c4e-c4de-361a-1d1abf413ffc@quicinc.com>
 <adb2eed8-8d5e-a052-81b3-cde705c3503b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adb2eed8-8d5e-a052-81b3-cde705c3503b@quicinc.com>

On Thu, Sep 05, 2024 at 11:45:25AM GMT, Dikshita Agarwal wrote:
> 
> 
> On 9/5/2024 11:42 AM, Dikshita Agarwal wrote:
> > 
> > 
> > On 8/29/2024 2:43 PM, Dmitry Baryshkov wrote:
> >> On Tue, Aug 27, 2024 at 03:08:03PM GMT, Bryan O'Donoghue wrote:
> >>> On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
> >>>> +static const struct of_device_id iris_dt_match[] = {
> >>>> +	{ .compatible = "qcom,sm8550-iris", },
> >>>> +	{ .compatible = "qcom,sm8250-venus", },
> >>>> +	{ },
> >>>> +};
> >>>> +MODULE_DEVICE_TABLE(of, iris_dt_match);
> >>>
> >>> The enabling patch for the compat strings should come last - if its first
> >>> then the time between the compat add and the last patch is a dead zone where
> >>> things are bound to break on a booting board.
> >>
> >> But then it's impossible to test the driver in the interim state.
> >> Moreover enabling it at the end only makes it hard to follow platform
> >> data changes. What about adding sm8550 at this point and adding sm8250
> >> at the end? Or enabling qcom,sm8550-iris and the fake qcom,sm8250-iris
> >> now (and clearly documenting it as fake) and as the last patch change it
> >> to qcom,sm8250-venus.
> > 
> > Sure, we will add qcom,sm8250-iris at this point so that it enables the
> > testing of the driver, and will add one patch at the last to add
> > qcom,sm8250-venus.
> Sorry fixing the typos. what I meant was,
> we will add qcom,sm8550-iris at this point so that it enables the
> testing of the driver, and will add one patch at the last to add
> qcom,sm8250-venus.

I hope you meant 'to change qcom,sm8250-iris to qcom,sm8250-venus'. Also
please clearly document that qcom,sm8250-iris is a temporary thing just
to facilitate documentation and testing of the driver to be removed as a
last patch.

> > 
> > Thanks,
> > Dikshita
> >>
> > 

-- 
With best wishes
Dmitry

