Return-Path: <linux-media+bounces-24231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A00A7A003CD
	for <lists+linux-media@lfdr.de>; Fri,  3 Jan 2025 06:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 822B23A10AA
	for <lists+linux-media@lfdr.de>; Fri,  3 Jan 2025 05:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAFA01B0430;
	Fri,  3 Jan 2025 05:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b7OXM25s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339E5256E
	for <linux-media@vger.kernel.org>; Fri,  3 Jan 2025 05:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735883625; cv=none; b=E/YWnP2OZW/5211RzxLq6tQqfR2/W+GcThZy0FTngSrG7OolFQTH583701B73uY67e46BskrtA5swyJEHccB0v1n1QumPgbiCrru76dRuyl9eBufCKvG/UdmOCR/YQ1GE9aQCBIWg7vUjm4vEL/JEE9bgTVc/I3OtA9HjoVx24c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735883625; c=relaxed/simple;
	bh=9t2As+jtUq0IPZelx4vsIQTfC86ba7b6Xn4wrXrpTmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awKef9y/80PBVHRjvCD/HO6vuTsaUH2kr+GfAR+aNed/dOasPODQa1Qd094Ecr8gGt3diCjpzzxV2TH3b/owyDAo2lGXHOXvS6adof/qGPIIEs4H0KGc15AaIfMiewBRuxFjoQ0CDpqU5na8lW0/CTl+fCSdmj2AP0tO2QefRcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b7OXM25s; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53f22fd6887so11456514e87.2
        for <linux-media@vger.kernel.org>; Thu, 02 Jan 2025 21:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735883621; x=1736488421; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qkNJoCoRxwm8ZQeZPnRrEVk8C3xCcSASIfrl093JjTY=;
        b=b7OXM25s53waMPAb85ni1Q5xt14kDxb8qrXbPm9/k3oOfkHE4MOiUH1mjobftWQdJ3
         BwzGbHiBppQrC411ngVZysm2cZH6Djg8dYM+9GhwLGOPcfTpqBIdeCgu1B7vCQSaNgf5
         yTjEQtRb4NtAj9kdIeUVdAWyrR0hJtEQB6ysPs3TumvGdzR04PHD13CJXOMZZ62MR14J
         jwGxSYiYmMB3AsW8JsIYbF/ush02rvIuLT1c+l0WP0qvNdQ63bxufgz8DYBId7btMpG/
         GudBBykGdExp5VxltilE18N3DpBtuHOfzqafmm/KIMZ8I5lz3jci9md2XuwJeEjKfbhc
         wOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735883621; x=1736488421;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkNJoCoRxwm8ZQeZPnRrEVk8C3xCcSASIfrl093JjTY=;
        b=HXPkN2kZemZMY/o5FmWRBhPsHbxRfZ5wcMEFUlfuwxt7MKND3iUEVC4ulXkoMi0lGI
         YjaSf+kC+AKKufdotmyrQMZRduLV9Q1x6FWpuL0rbcO+9DFpPfDwDmNRXwutT4UuOQ5/
         XgAaRlxs4V3Rgn5eHovEGHNfn2a9F+er/rmIAb0UXVQDNrXWh5e2l0hcLMvpV0iqW7dX
         7x9BZDeErJ/aPKDGDUzF148RN0f1HeSlbHWiRMzzqa7LQr5XkSpYCikAlbrjM+5lDycm
         IAt6SHe3SDV3mlKlGs+Kwzu8lJvTH+xGGe0gLq1X5KVq8CFWHb7aVWzmGmms7y6nyNF4
         1lpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR4SheCgEhGvaUsFAAwXqFS1zbd8o90G3BrkMGsvvo7gVAREgjwaEu14eIlYUuow/JYA8vIlrpsIoB6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW/qqGMkX3/DB+MQw64ERebfE8UU9QqKLbTwVeEalFkX+YB6YK
	DxsvzBSNhJWKlE7p8Hqx25G+wFblEEL0eqdF9DuCFhZ0wWI+OC4qoJnZv5iGBWw=
X-Gm-Gg: ASbGnctOT3Jq9O6OuUKKW7Y6snSnIi9rbW3mZVMrriP2yvwNGrD+FVnrnawLhuCioDj
	r0vVDh9owiyzoCrq77husXWxvy1+wsVjUsA3UrCx18Slt8smgTrm323gfEMqN6R2JnbC0812vi3
	YRDlzS9O9cANcf9PQcQeXaD3iMGJFNwNJLd1i0+Z/kHmYLlxLCqcdeg+a1AJnVH9bmohSZyjZqk
	nFM1HWgbkvPl5nGkhjIvSZbJXrCh7YK6pheFW3vifSBDx40l4DzXSPYjLnIYUxNvV8fl8MpY3aT
	Y16jJK/BF55vK0G1ijB2l+wxpB8JyqbXTTU9
X-Google-Smtp-Source: AGHT+IG9b0alQREkaEiHqtBXd0kh8iROWWQMPrCvlmWxXFXPKbF6MPDMv5RJZi4ZRl74MddqmbgBpA==
X-Received: by 2002:a05:6512:159d:b0:540:3594:aa3a with SMTP id 2adb3069b0e04-5422952553dmr12674147e87.5.1735883621351;
        Thu, 02 Jan 2025 21:53:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832a45sm4131895e87.255.2025.01.02.21.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:53:40 -0800 (PST)
Date: Fri, 3 Jan 2025 07:53:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 2/2] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode on V4
Message-ID: <y62rarxwakcyd7vhrjvr4ufcp2idq6yec7ot3s3o2nbjflzlji@w7u5lvlcv2qh>
References: <20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com>
 <20241223-switch_gdsc_mode-v2-2-eb5c96aee662@quicinc.com>
 <5dexy2uc34b3kv532r45p6oaqn7v6bjohfdpwy42folvsdv6nd@skj7o35dflj2>
 <4d3a2d5a-3791-4bc8-a43d-6087e8c35619@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d3a2d5a-3791-4bc8-a43d-6087e8c35619@quicinc.com>

On Thu, Jan 02, 2025 at 11:47:22AM +0800, Renjiang Han wrote:
> 
> On 12/23/2024 7:41 PM, Dmitry Baryshkov wrote:
> > > diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> > > index 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..a2062b366d4aedba3eb5e4be456a005847eaec0b 100644
> > > --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> > > +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> > > @@ -412,7 +412,7 @@ static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
> > >   	u32 val;
> > >   	int ret;
> > > -	if (IS_V6(core))
> > > +	if (IS_V6(core) || IS_V4(core))
> > >   		return dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);
> > It is being called only for v4 and v6 targets. Drop the rest of the
> > function and inline the result. I'd suggest keeping it as two patches
> > though: this one which adds IS_V4() all over the place and the next one
> > which performs cleanup of the dead code.
>  Thanks for your comment. poweron_coreid(), poweroff_coreid() and
>  vcodec_control_v4() are called only for v4 and v6. I will clean up
>  the dead code with another patch.
> > 
> > >   	else if (coreid == VIDC_CORE_ID_1) {
> > >   		ctrl = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
> > > @@ -450,7 +450,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
> > >   		vcodec_clks_disable(core, core->vcodec0_clks);
> > > -		if (!IS_V6(core)) {
> > > +		if (!IS_V6(core) && !IS_V4(core)) {
> > >   			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
> > >   			if (ret)
> > >   				return ret;
> > > @@ -468,7 +468,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
> > >   		vcodec_clks_disable(core, core->vcodec1_clks);
> > > -		if (!IS_V6(core)) {
> > > +		if (!IS_V6(core) && !IS_V4(core)) {
> > >   			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);
> > The poweron_coreid() and poweroff_coreid() functions are called only for
> > v4 and v6. The v6 case was masked out earlier. Now you've removed the v4
> > case too. Can we drop such vcodec_control_v4() calls completely?
> 
>  I cleaned up the code, and finally vcodec_control_v4() looks like this.
> 
> static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool
> enable)
> {
>     return dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid],
> !enable);
> 
> }
> 
>  Functionally, we can drop vcodec_control_v4(), but architecturally, I
>  don’t recommend removing this function, because I think it’s easier to
>  read the code with this function.

One-line wrappers don't make the code easier to read. Please inline it.

-- 
With best wishes
Dmitry

