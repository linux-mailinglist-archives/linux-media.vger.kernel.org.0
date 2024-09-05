Return-Path: <linux-media+bounces-17679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3417B96D813
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 14:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B02BB258AD
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 12:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3CD19B5A9;
	Thu,  5 Sep 2024 12:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGU1lkB8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB3E19B3E2;
	Thu,  5 Sep 2024 12:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725538409; cv=none; b=uKut0nHkYDtqnGKhQg95q442Li0cDksGMw3WfZmGrTQuExe/xEyxn7+Dvnwn7SaGSsLuW/PPuyul0BmfRbsprDvBKp4WZFlpHoo4Um1jLAbbt/8cFwHDcGKwPe8Jed90hmflm5wEQoyT3QHvr6eVGWMmlMQTA2quQIlYyUyNzSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725538409; c=relaxed/simple;
	bh=xmP/wJyeYT7M4VQxSWmO3MapekYf8Jd7YMh+Yp8oi9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uStXeU1d1XX2lb1wJV54S9GOpNX522Th+CAQEQPvdCTLwgOBIDL2NERW4gvgMpV8Pvnm+muFP65omAat99eZi8sfSImolc4/+TWdQ8xddOAWBuFHD5fS1wX5hmIxOq98OHORBFrc1XaUX4LabaxihgO66dvh46EnuCNaKdqpND4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGU1lkB8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250B5C4CEC3;
	Thu,  5 Sep 2024 12:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725538408;
	bh=xmP/wJyeYT7M4VQxSWmO3MapekYf8Jd7YMh+Yp8oi9Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HGU1lkB8L/fBqhoxiNHHuN2Yw6FzeKDCo3zUwJynw7j8LRqn+FIjU+TO0L+SgjBcX
	 +Xk0vPjb3EEQ9WP33thlPq1DNEu99bdIcBzSe44WE6arNQBvRHX1LyUX9QoZ9yBYs6
	 23Ce7qXQlPiIo0xmf7ls2lVZ8cVYK1GLmLtc0O0wey9GBVgfJmsdwWmjoYAYc01YIC
	 nStZLcM1N1jaQnXLcMsllBtyJcqyKV1VO8v5CaarS9Vihf2Ccz2rYKI9VDtYj4+24Z
	 lAxQ+ZLUfa9eYmsSvvVlSt/iXH9A3Q6l7qrpxL4MrZT4qLGrepYwjJPjOd+XtRNkKb
	 VAoaSytYBwqqw==
Message-ID: <d23a9447-4bef-476a-9f90-3ac2ba968dbd@kernel.org>
Date: Thu, 5 Sep 2024 14:13:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] media: qcom: camss: Fix potential crash if domain
 attach fails
To: Vikram Sharma <quic_vikramsa@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 cros-qcom-dts-watchers@chromium.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-0-b18ddcd7d9df@quicinc.com>
 <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-3-b18ddcd7d9df@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240904-camss_on_sc7280_rb3gen2_vision_v2_patches-v1-3-b18ddcd7d9df@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4.09.2024 1:10 PM, Vikram Sharma wrote:
> Fix a potential crash in camss by ensuring detach is skipped if attach
> is unsuccessful.
> 
> Fixes: d89751c61279 ("media: qcom: camss: Add support for named power-domains")
> CC: stable@vger.kernel.org
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index d64985ca6e88..447b89d07e8a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2132,7 +2132,7 @@ static int camss_configure_pd(struct camss *camss)
>  							    camss->res->pd_name);
>  		if (IS_ERR(camss->genpd)) {
>  			ret = PTR_ERR(camss->genpd);
> -			goto fail_pm;
> +			goto fail_pm_attach;
>  		}
>  	}
>  
> @@ -2149,7 +2149,7 @@ static int camss_configure_pd(struct camss *camss)
>  			ret = -ENODEV;
>  		else
>  			ret = PTR_ERR(camss->genpd);
> -		goto fail_pm;
> +		goto fail_pm_attach;
>  	}
>  	camss->genpd_link = device_link_add(camss->dev, camss->genpd,
>  					    DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
> @@ -2164,6 +2164,7 @@ static int camss_configure_pd(struct camss *camss)
>  fail_pm:
>  	dev_pm_domain_detach(camss->genpd, true);
>  
> +fail_pm_attach:
>  	return ret;

What's the point, just call return directly where you added the goto

Konrad

