Return-Path: <linux-media+bounces-24001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BAD9FADD1
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 12:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C304B163A7C
	for <lists+linux-media@lfdr.de>; Mon, 23 Dec 2024 11:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DBA19F40E;
	Mon, 23 Dec 2024 11:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lDhGgrMB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B533019AA5A
	for <linux-media@vger.kernel.org>; Mon, 23 Dec 2024 11:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734954099; cv=none; b=cdbPDcwZ7iVxLhfwFtgeFJkKXGJv+0yEF5Bt7M8/Am59TMBG8l1B5tIek2PPaPFdkjFn2K9yNEu5hnL7xu0YOLPEQf30ksxMbBxCrpf+l2F/7IEhV0vOBpWIGG+T1umOyUXsaLSVwowbFOFa4WrBnNP4orZJBcnzghg4eIkUi8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734954099; c=relaxed/simple;
	bh=/dNT7Z8TLd3TNSIjuRf0myU4bsBCG5sadZmG8QxGRUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pV0rKD2aor3Q3ExeJUCEBbnaDmU4dO1/inwjnk2ojEIPBfA0urpUdKlx6681Lmpzk2BVQlZFG8rZ1Ri9OGppDRbmCHPM2ag2qlwRdbkUcT5G6v3S9VS6VOkdZOFiD8b51z5uT35OgYO53vh8tUIklAfn2Cb2Tv+arDvAJrBSQUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lDhGgrMB; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3c47434eso4494651e87.3
        for <linux-media@vger.kernel.org>; Mon, 23 Dec 2024 03:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734954096; x=1735558896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uf08w7WXgohHhU+70NDC/g42V643KfJa3j55i27XM5Q=;
        b=lDhGgrMBE3GE2VZaG94Qh4AsFg1Zo0M5CR00dXBxD2QnHLdr47l82FVhKrOO2bjpAA
         McaRK0XQ9YQOIR2Ih+/26vu527mk9WZR4uql+0JD5q1sewFZ73/QfuOEYi8u+xn7I0+B
         yfF+PSL03dzQ4skHQVJ3eKKYoZnRWrHo/EOfJtYZDE8IMcXDXFrLy0EK3fORntXehsmv
         9ST7maNUZ4/oc2iOYv32rV++BlN2mhEzqrDtUs//sBqZLcWMSb0K84/9o08QUGIRI/0M
         +ACnl35NztWbNc44eJOJwgQuJZE45xA6aJ17v2e8KlPVKG/WUCQ/f8TGVSEaLbviRDW7
         Aunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734954096; x=1735558896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uf08w7WXgohHhU+70NDC/g42V643KfJa3j55i27XM5Q=;
        b=Ex6opmvC/c8f9nE+oiyiZST6bYwhkFRxLLqVpA4K/o+9I68jBEMFzMoEASHJuFEej2
         c6aDHgPNzlb9yVmodV6INqtU69+CHvsq7b1yMHJSpHIAfzIQ6LDMEJfa8ANEEdSNpASt
         a8+LshbF1MfTyIYjnFxrU7h5g/Aoq6qNm6r1ixZt1P0UJWgfNRUzYnZJbMLR5FwqA3EA
         Zy0LKdjRpd22NMgM/GXT15onyi+K6jfgBy31/iTQSdly8jYDvIxu8IOH13KyEK9C+j1X
         JqdFjjr4u6JeD4bbfpsimtuALho/hIv1TPIIaxRQl6uEXwR6AG66SUxI693ZZ+Wmp07i
         3/ag==
X-Forwarded-Encrypted: i=1; AJvYcCWTUUvfZSQbNK1vBOBZ3bgo9RmrZfqQ5HjOPZLJF6l8mo3BLfSULPOk/iycHurQ9XEbckv6M3HmPzX5tA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJbW+iSgCETLvEWFIgbseHkhVorDVGECs5tbp1sUAs6LODoebo
	9HXr+mWIHwC9BSYD3xZpWRl27/YMxhBApqRjR2R8I9xghBZCAHJKU/y35NBQIco=
X-Gm-Gg: ASbGnctgwANIvi7lx3e5S+j+91QjZBlw3n1TbK6hBVbnreJwFoOzE5WpdTQMilv4KzB
	1f+9qH76Z1Bjddy2B4VLqxKT4M702S4s+LIrySSAsf9bZzzD0Cb0eSkhU1vVxKP9WfdqgUa3UFQ
	SO/ut3T26ZgTS4p4l+dVSg/55gCcBHP6e8FBg7nopZVLjDCl9v6SSpJkCPMn8XCLePGBJN8sCXp
	tZd/tRcAenHcLm6UtokJNDO3sAk7lvdvCVJSaVF0vwRW5NjOe2KIY8i9H+JajM4WJ7aF0sPXg85
	+wymmWUpeX8UzSUJD12FS0B0k9uofKT88S6C
X-Google-Smtp-Source: AGHT+IHkGSR0n573lmoCfdSByUIBamlJdbqTtC1YtbeUpon8t76oIKkkN/FuZHbbP5wDWOc3HW9rMQ==
X-Received: by 2002:a05:6512:114f:b0:540:1d37:e6e with SMTP id 2adb3069b0e04-542295434f9mr4349383e87.33.1734954095868;
        Mon, 23 Dec 2024 03:41:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238301e0sm1278636e87.248.2024.12.23.03.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 03:41:34 -0800 (PST)
Date: Mon, 23 Dec 2024 13:41:32 +0200
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
Message-ID: <5dexy2uc34b3kv532r45p6oaqn7v6bjohfdpwy42folvsdv6nd@skj7o35dflj2>
References: <20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com>
 <20241223-switch_gdsc_mode-v2-2-eb5c96aee662@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223-switch_gdsc_mode-v2-2-eb5c96aee662@quicinc.com>

On Mon, Dec 23, 2024 at 02:32:42PM +0530, Renjiang Han wrote:
> The POWER_CONTROL register addresses are not constant and can vary across
> the variants. Also as per the HW recommendation, the GDSC mode switching
> needs to be controlled from respective GDSC register and this is a uniform
> approach across all the targets. Hence use dev_pm_genpd_set_hwmode() API
> which controls GDSC mode switching using its respective GDSC register.
> 
> In venus v4 variants, the vcodec gdsc gets enabled in SW mode by default
> with new HW_CTRL_TRIGGER flag and there is no need to switch it to SW mode
> again after enable, hence add check to avoid switching gdsc to SW mode
> again after gdsc enable. Similarly add check to avoid switching GDSC to HW
> mode before disabling the GDSC, so GDSC gets enabled in SW mode in the
> next enable.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/pm_helpers.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..a2062b366d4aedba3eb5e4be456a005847eaec0b 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -412,7 +412,7 @@ static int vcodec_control_v4(struct venus_core *core, u32 coreid, bool enable)
>  	u32 val;
>  	int ret;
>  
> -	if (IS_V6(core))
> +	if (IS_V6(core) || IS_V4(core))
>  		return dev_pm_genpd_set_hwmode(core->pmdomains->pd_devs[coreid], !enable);

It is being called only for v4 and v6 targets. Drop the rest of the
function and inline the result. I'd suggest keeping it as two patches
though: this one which adds IS_V4() all over the place and the next one
which performs cleanup of the dead code.

>  	else if (coreid == VIDC_CORE_ID_1) {
>  		ctrl = core->wrapper_base + WRAPPER_VCODEC0_MMCC_POWER_CONTROL;
> @@ -450,7 +450,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
>  
>  		vcodec_clks_disable(core, core->vcodec0_clks);
>  
> -		if (!IS_V6(core)) {
> +		if (!IS_V6(core) && !IS_V4(core)) {
>  			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, false);
>  			if (ret)
>  				return ret;
> @@ -468,7 +468,7 @@ static int poweroff_coreid(struct venus_core *core, unsigned int coreid_mask)
>  
>  		vcodec_clks_disable(core, core->vcodec1_clks);
>  
> -		if (!IS_V6(core)) {
> +		if (!IS_V6(core) && !IS_V4(core)) {
>  			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, false);

The poweron_coreid() and poweroff_coreid() functions are called only for
v4 and v6. The v6 case was masked out earlier. Now you've removed the v4
case too. Can we drop such vcodec_control_v4() calls completely?

>  			if (ret)
>  				return ret;
> @@ -491,7 +491,7 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
>  		if (ret < 0)
>  			return ret;
>  
> -		if (!IS_V6(core)) {
> +		if (!IS_V6(core) && !IS_V4(core)) {
>  			ret = vcodec_control_v4(core, VIDC_CORE_ID_1, true);
>  			if (ret)
>  				return ret;
> @@ -511,7 +511,7 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
>  		if (ret < 0)
>  			return ret;
>  
> -		if (!IS_V6(core)) {
> +		if (!IS_V6(core) && !IS_V4(core)) {
>  			ret = vcodec_control_v4(core, VIDC_CORE_ID_2, true);
>  			if (ret)
>  				return ret;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

