Return-Path: <linux-media+bounces-24086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 633C19FC7E6
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 04:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B9D01882400
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 03:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCD814A619;
	Thu, 26 Dec 2024 03:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXrv7b3d"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838EE13D896;
	Thu, 26 Dec 2024 03:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735185268; cv=none; b=aXiLya+NUiUv8VwlBrQ5cU52jtDmbS4W2OabKGf4LFqwc3ArzdlEDLpEdUTgakzjdYoCXCRgjp9PTm3+UvUrVyw+9OFp9e+yaJI++neiS8RWWSe2tzv/ExFNUoRnNr+4o7VcpLPSEgP/nuBdwxmbYCDwUPFf2+YiSQzEzkR/Co0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735185268; c=relaxed/simple;
	bh=S8MQFY2ym3JGguJE1nOcmWTczp/bjj+9ZoRxXjmudzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4bucJgGM6Fup+iTCIx+MT1BkTxd2wlDHi7K5UagJKd8laI570w9X3bhJx5vtEPuJDHIXQLDIo+XmU8BGO80HDslrsNITpVrEgWmTgq1OjizT/N/RBRVzIx+oIu8Xlz9ViVZF69/aKbSRz2mwkvkBYQnKmrlEFRx1yS/ACMq1uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXrv7b3d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1399EC4CED1;
	Thu, 26 Dec 2024 03:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735185267;
	bh=S8MQFY2ym3JGguJE1nOcmWTczp/bjj+9ZoRxXjmudzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CXrv7b3dghjssMO3ZOztGxyV4xdZ4ytaGjUVOrPIcGkzoq0wgG/HCF3rAyy2V/L+g
	 TWviPNFURrGuibKypxrebNlYGNTydnq1Y/4GH+5VMF5qMA4FlL7ou78VoMudkgNsRz
	 YksrJA2NOmy3mra8YozTGCZl/G/X4Rn607ttIjy24qLN4vpm9/iH8hMHMA9D1vGigw
	 ag2BtTH6VnWrcj+LrYu+XozPPoLpNCZ5hCEw4mEFF8V1x3qwkLOpCraCJ01zWmj7Bh
	 GikzCT7Ms8euq3DBj1Vr9TlsmaMQZB2fu1rtzUFm++GboGKk8uI/8DffwW/lA7tnWM
	 Bio0SjJLsRIcw==
Date: Wed, 25 Dec 2024 21:54:24 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH v2 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
Message-ID: <szj4urqpxoek3y65ov6bavxqjsgs5nnu5o32e73z47mudelq4v@6fjbmm2h7pen>
References: <20241223-switch_gdsc_mode-v2-0-eb5c96aee662@quicinc.com>
 <20241223-switch_gdsc_mode-v2-1-eb5c96aee662@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223-switch_gdsc_mode-v2-1-eb5c96aee662@quicinc.com>

On Mon, Dec 23, 2024 at 02:32:41PM +0530, Renjiang Han wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> The video driver will be using the newly introduced
> dev_pm_genpd_set_hwmode() API to switch the video GDSC to HW and SW
> control modes at runtime.

"Will be using", does that imply then that if this patch is merged
before (or without the venus patch) something unexpected will happen?

Please clarify how you expect this to be merged, or clarify in the
commit message that ordering is not of any concern.

Regards,
Bjorn

> Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for video GDSC's for
> Qualcomm SoC SC7180, SDM845, SM7150, SM8150 and SM8450.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  drivers/clk/qcom/videocc-sc7180.c | 2 +-
>  drivers/clk/qcom/videocc-sdm845.c | 4 ++--
>  drivers/clk/qcom/videocc-sm7150.c | 4 ++--
>  drivers/clk/qcom/videocc-sm8150.c | 4 ++--
>  drivers/clk/qcom/videocc-sm8450.c | 4 ++--
>  5 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
> index d7f84548039699ce6fdd7c0f6675c168d5eaf4c1..dd2441d6aa83bd7cff17deeb42f5d011c1e9b134 100644
> --- a/drivers/clk/qcom/videocc-sc7180.c
> +++ b/drivers/clk/qcom/videocc-sc7180.c
> @@ -166,7 +166,7 @@ static struct gdsc vcodec0_gdsc = {
>  	.pd = {
>  		.name = "vcodec0_gdsc",
>  	},
> -	.flags = HW_CTRL,
> +	.flags = HW_CTRL_TRIGGER,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  
> diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
> index f77a0777947773dc8902c92098acff71b9b8f10f..6dedc80a8b3e18eca82c08a5bcd7e1fdc374d4b5 100644
> --- a/drivers/clk/qcom/videocc-sdm845.c
> +++ b/drivers/clk/qcom/videocc-sdm845.c
> @@ -260,7 +260,7 @@ static struct gdsc vcodec0_gdsc = {
>  	},
>  	.cxcs = (unsigned int []){ 0x890, 0x930 },
>  	.cxc_count = 2,
> -	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  
> @@ -271,7 +271,7 @@ static struct gdsc vcodec1_gdsc = {
>  	},
>  	.cxcs = (unsigned int []){ 0x8d0, 0x950 },
>  	.cxc_count = 2,
> -	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  
> diff --git a/drivers/clk/qcom/videocc-sm7150.c b/drivers/clk/qcom/videocc-sm7150.c
> index 14ef7f5617537363673662adc3910ddba8ea6a4f..b6912560ef9b7a84e7fd1d9924f5aac6967da780 100644
> --- a/drivers/clk/qcom/videocc-sm7150.c
> +++ b/drivers/clk/qcom/videocc-sm7150.c
> @@ -271,7 +271,7 @@ static struct gdsc vcodec0_gdsc = {
>  	},
>  	.cxcs = (unsigned int []){ 0x890, 0x9ec },
>  	.cxc_count = 2,
> -	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  
> @@ -282,7 +282,7 @@ static struct gdsc vcodec1_gdsc = {
>  	},
>  	.cxcs = (unsigned int []){ 0x8d0, 0xa0c },
>  	.cxc_count = 2,
> -	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  
> diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
> index daab3237eec19b727d34512d3a2ba1d7bd2743d6..3024f6fc89c8b374f2ef13debc283998cb136f6b 100644
> --- a/drivers/clk/qcom/videocc-sm8150.c
> +++ b/drivers/clk/qcom/videocc-sm8150.c
> @@ -179,7 +179,7 @@ static struct gdsc vcodec0_gdsc = {
>  	.pd = {
>  		.name = "vcodec0_gdsc",
>  	},
> -	.flags = HW_CTRL,
> +	.flags = HW_CTRL_TRIGGER,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  
> @@ -188,7 +188,7 @@ static struct gdsc vcodec1_gdsc = {
>  	.pd = {
>  		.name = "vcodec1_gdsc",
>  	},
> -	.flags = HW_CTRL,
> +	.flags = HW_CTRL_TRIGGER,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  static struct clk_regmap *video_cc_sm8150_clocks[] = {
> diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
> index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..4cefcbbc020f201f19c75c20229415e0bdea2963 100644
> --- a/drivers/clk/qcom/videocc-sm8450.c
> +++ b/drivers/clk/qcom/videocc-sm8450.c
> @@ -347,7 +347,7 @@ static struct gdsc video_cc_mvs0_gdsc = {
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
>  	.parent = &video_cc_mvs0c_gdsc.pd,
> -	.flags = RETAIN_FF_ENABLE | HW_CTRL,
> +	.flags = HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
>  };
>  
>  static struct gdsc video_cc_mvs1c_gdsc = {
> @@ -372,7 +372,7 @@ static struct gdsc video_cc_mvs1_gdsc = {
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
>  	.parent = &video_cc_mvs1c_gdsc.pd,
> -	.flags = RETAIN_FF_ENABLE | HW_CTRL,
> +	.flags = HW_CTRL_TRIGGER | RETAIN_FF_ENABLE,
>  };
>  
>  static struct clk_regmap *video_cc_sm8450_clocks[] = {
> 
> -- 
> 2.34.1
> 

