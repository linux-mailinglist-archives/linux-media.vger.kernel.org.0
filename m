Return-Path: <linux-media+bounces-50736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE36D218C4
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 23:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 002DB3022AB0
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 22:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033D33AEF29;
	Wed, 14 Jan 2026 22:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMQlqUu4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15055361DA9;
	Wed, 14 Jan 2026 22:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768429350; cv=none; b=HGEFzAB5zzl1TJ+FxwcK7x7Dp0RxWBZeE/lMmUzIv3ft7HHyb79ZiSXVfDBXMr+I2+q36n6m2CfoSh4WRRxnAtwEmlA4aKMTi4Uok42Kg3jb34BLxGfMr8lceiKn/flLpsXqH9VflgZTmbw5+/JSkG6wwRIuRFHy09y0lZWWRn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768429350; c=relaxed/simple;
	bh=FLjZ9d7KjwznNpJ4HtoTA/YwqA6KeSgqUBGicTb3lpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azXjuEdilJiGqdBA76nMfZPwcMlV8F4f1z+l1besXEKHCOZXeAuCBvbegeUCU4nMAGXLaD/FCURmW+M/jsHizxxBQCMAfgb2XveXi+SNfBttLrhZ58xfGKlyUj7VN5wHMZtTFaruuDRhRpP54xh2A/r3SBsWSP42eFqjvVgsYZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMQlqUu4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20BCC4CEF7;
	Wed, 14 Jan 2026 22:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768429349;
	bh=FLjZ9d7KjwznNpJ4HtoTA/YwqA6KeSgqUBGicTb3lpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tMQlqUu4uEqjQhNVGL6qPfXEL6fdpvr4RXsfW/EQfq40xkeFLPskIGmfQqmgnNRJn
	 EWIvfbxoVzdcchLxXgPhrTAa9tiTCs360Obchy2JtXv00LkXciNWPRPiX1qQopJCKi
	 XWgKQ8e1oI12b6ae/0zYbMPTfqoFjMr+oxYR2hdV3UkMhMiSguUC//4ezc+KApHA4r
	 /c/+QOtAGEVqPrURCT6iOvnU6tIjvzWNCaUBuyCRGGADzcKCgXRyJ+8rX5tWe8oqXM
	 CzZbOiuAgsrUcdA0wYk4PeN1DgTdqPX91Y3q+ulpBI5qH/4irONrLgRYBS7Hx1mpL1
	 I1MWnsPEwjdsQ==
Date: Wed, 14 Jan 2026 16:22:25 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Bryan O'Donoghue <bod@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
Message-ID: <3or4j2louj6uldvwcxb4hokr57zkowi4rkc3sjw3z7s5d6rkin@l6vngrgdyzou>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>

On Sat, Jan 10, 2026 at 09:37:54PM +0200, Dmitry Baryshkov wrote:
> MDSS and GPU drivers use different approaches to get min_acc length.
> Add helper function that can be used by all the drivers.
> 

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/ubwc.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index f052e241736c..50d891493ac8 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
>  	return ret;
>  }
>  
> +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
> +{
> +	return cfg->ubwc_enc_version == UBWC_1_0 &&
> +		(cfg->ubwc_dec_version == UBWC_2_0 ||
> +		 cfg->ubwc_dec_version == UBWC_3_0);
> +}
> +
>  #endif /* __QCOM_UBWC_H__ */
> 
> -- 
> 2.47.3
> 

