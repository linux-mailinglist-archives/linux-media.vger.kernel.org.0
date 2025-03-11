Return-Path: <linux-media+bounces-28040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A24A5C7A6
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 16:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D90416192C
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 15:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BED25F99D;
	Tue, 11 Mar 2025 15:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0NgHzIh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0239314BF89;
	Tue, 11 Mar 2025 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707147; cv=none; b=dn/IiDHps0J/4XGbWjXqRIevg7gF0PO2HORM5xxfmFMg/3iPzgvfN/GQDeAkujNY44C5/BUxFkVw8MUtyRrekPL09RVRwMJtJAhoPXRpTP6nUhEVHzsRSobtNb2taw1VQNIItB6xufE6BciKrwOVEEVRoUuprcs2lonhPTPQgbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707147; c=relaxed/simple;
	bh=kSGitwPYJ+KY5vOStc4FnbTJlBpFDOIIed4t2krKKfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2G95pp/vGHbkEIylYhVrr20ybQk5stQjoFJgkIgBdYDDylrzslGL5STNRcjH/OSaRqGOD8tS79X66aAcoe2SNbovpC6L2biLfOeNWfG60sIVALTvpCr3BdYzpN4iRZAuSSlBTZ/Tf75N0uBUuCGqV+0Cd47xyrT3pir9eKPsfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0NgHzIh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E53C4CEEC;
	Tue, 11 Mar 2025 15:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741707146;
	bh=kSGitwPYJ+KY5vOStc4FnbTJlBpFDOIIed4t2krKKfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0NgHzIhTyIQt9H/i5oslgxlPfUEOMWTqxjVFrZ/yCOyyZzcLlhoU8FPI4oLAa1jM
	 u8ZfFmcrNpSRDDIW/kThhmdes9j/JAzqqBr7XS9PIbIv6OI0Y4DyRZof4FS/4hnCld
	 UUKvNQOU902ANiIeWPrOZDkoRE2iiWi9TAU6DI/UFGp2LWG15aOBVBPIbiHgH00+71
	 HOMOQM0vSH6stjbWFXPz/HMBL9miUTdoT6bQnEyDEHw6aYmKVTosjNOf1UQo9bcSU+
	 I9qn8YHjxaOPsI60+V80n+5KAQpXOa2UKFC56hY9njlqi0rCOlJNMX8YInjkRalBSq
	 JGe9CMFMdnRGQ==
Date: Tue, 11 Mar 2025 17:32:21 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] media: iris: add compatible string for sa8775p
Message-ID: <ci52x2f3rael6zyimkoorn42bkoomiyakvqgvukodwlpczeofi@ivwl773psavo>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-4-5c807d33f7ae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-dtbinding-v1-4-5c807d33f7ae@quicinc.com>

On Tue, Mar 11, 2025 at 05:33:56PM +0530, Vikash Garodia wrote:
> Add required compatible string to enable video hardware
> acceleration on sa8775p.

No, use fallback compatibles instead.

> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_probe.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index aca442dcc153830e6252d1dca87afb38c0b9eb8f..23c9e76a68013399b0fc1d68c1ccf0f8b0ddb037 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -324,6 +324,10 @@ static const struct of_device_id iris_dt_match[] = {
>  		.compatible = "qcom,sm8550-iris",
>  		.data = &sm8550_data,
>  	},
> +	{
> +		.compatible = "qcom,sa8775p-iris",
> +		.data = &sm8550_data,
> +	},
>  #if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
>  		{
>  			.compatible = "qcom,sm8250-venus",
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

