Return-Path: <linux-media+bounces-42717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A162DB849FC
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 14:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0DF81C28675
	for <lists+linux-media@lfdr.de>; Thu, 18 Sep 2025 12:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D191305E28;
	Thu, 18 Sep 2025 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/u5FJVA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C946A305955;
	Thu, 18 Sep 2025 12:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758199257; cv=none; b=eOle2vYqxVrrWGnYV29xWe2bilpcRi18qjnWpb+k+V2M6kRXDEd536Ud6hbobH0QYz9u8qItktZRK1YmOat5fFzj6YfaYxxrV0a/oW1fC7rx21lU5Lh8wi6FJaYmEOI56Fp7/4LjBmBj+izaTT72eY/S/KqSYyWJ9avzyqQOEIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758199257; c=relaxed/simple;
	bh=Fy67Bpcow+sbYd0zQkbkLDZGjk5OCr6LRtTAvqhuUkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XViP4Nc8/WfkKAYa4G4z55AQAXo8p79zr0446HZXyhtgZXm7fs4BMoAS774h+L9pNsk8bYPlKKTtslFbs7CzEGflu2x2PyFTq6STKNdtLvFB69FE6IUjzlJ7JIMBffc726HdN4bNxiizFWaUcushWy03qvZOb+z9Qtwm6X8Ay/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/u5FJVA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD314C4CEEB;
	Thu, 18 Sep 2025 12:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758199257;
	bh=Fy67Bpcow+sbYd0zQkbkLDZGjk5OCr6LRtTAvqhuUkk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b/u5FJVACgsU1gswmX10Je7N/J0TCysvxQCe14j1mTmDCmkdVPYWTlFZRCmce944z
	 H8kJQqf9jxps7CAEFyMQVmnTCSoOAyzWlzQwHDp+ckZC9U9Pt0ZJO4igAgrxeBdynz
	 rY1Sl6zlo5GtVnfkuW6tO91yOuq/gshnxqQyXd22QTuIhjuKquD7HnrT12eY1NpIuE
	 kv2Exgs1X4Yb/fnXU1a/jfhZM9HMiHusfEEFY0GHQV+I0d5wZ7mvAPiLrSB+9WP5Al
	 0nMF9ZJy6FQ/gP/LvDVsXXQ1HONtqI0ZxYMZ6uv8/Dy0qUGFj6S5ClTchnh8cijIqn
	 Sf3FNh1eZQkwQ==
Message-ID: <b2c0a1e4-c268-48bc-95bd-636947e0dc0c@kernel.org>
Date: Thu, 18 Sep 2025 13:40:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: venus: pm_helpers: add fallback for the
 opp-table
To: Renjiang Han <quic_renjiang@quicinc.com>, quic_qiweil@quicinc.com,
 quic_wangaow@quicinc.com, Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <5di_SowJW4SgXVZrLssf1fNjAdBwNmlvzRQGcUEgDCgDfjybvxYFiqW_mrukqvEhO2hM9oFv30ftniWamd-ELQ==@protonmail.internalid>
 <20250918-fallback_of_opp_table-v3-1-f07b34eb7b3a@quicinc.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250918-fallback_of_opp_table-v3-1-f07b34eb7b3a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/09/2025 13:01, Renjiang Han wrote:
> Since the device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX
> do not include an opp-table and have not configured opp-pmdomain, they
> still need to use the frequencies defined in the driver's freq_tbl.
> 
> Both core_power_v1 and core_power_v4 functions require core_clks_enable
> function during POWER_ON. Therefore, in the core_clks_enable function,
> if calling dev_pm_opp_find_freq_ceil to obtain the frequency fails,
> it needs to fall back to the freq_tbl to retrieve the frequency.
> 
> Fixes: b179234b5e59 ("media: venus: pm_helpers: use opp-table for the frequency")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Closes: https://lore.kernel.org/linux-media/CA+G9fYu5=3n84VY+vTbCAcfFKOq7Us5vgBZgpypY4MveM=eVwg@mail.gmail.com
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
> Since device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX do not
> contain an opp-table and have not configured opp-pmdomain, they still
> need to use the frequencies defined in the driver's freq_tbl.
> 
> Therefore, if calling dev_pm_opp_find_freq_ceil to obtain the frequency
> fails in the core_clks_enable, it needs to fall back to the freq_tbl to
> retrieve the frequency.
> 
> Validated this series on QCS615 and msm8916.
> ---
> Changes in v3:
> - 1. Fix patch conflict issue.
> - Link to v2: https://lore.kernel.org/r/20250724-fallback_of_opp_table-v2-1-2fc61f2407dc@quicinc.com
> 
> Changes in v2:
> - 1. Update the returned error value as per the feedback.
> - Link to v1: https://lore.kernel.org/r/20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com
> ---
>   drivers/media/platform/qcom/venus/pm_helpers.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 88618378129a086274b61be5b23410783b92ca26..f0269524ac70eb72384a06aa6a215e2046abf5c2 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -40,6 +40,8 @@ static int core_clks_get(struct venus_core *core)
> 
>   static int core_clks_enable(struct venus_core *core)
>   {
> +	const struct freq_tbl *freq_tbl = core->res->freq_tbl;
> +	unsigned int freq_tbl_size = core->res->freq_tbl_size;
>   	const struct venus_resources *res = core->res;
>   	struct device *dev = core->dev;
>   	unsigned long freq = 0;
> @@ -48,8 +50,13 @@ static int core_clks_enable(struct venus_core *core)
>   	int ret;
> 
>   	opp = dev_pm_opp_find_freq_ceil(dev, &freq);
> -	if (!IS_ERR(opp))
> +	if (IS_ERR(opp)) {
> +		if (!freq_tbl)
> +			return -ENODEV;
> +		freq = freq_tbl[freq_tbl_size - 1].freq;
> +	} else {
>   		dev_pm_opp_put(opp);
> +	}
> 
>   	for (i = 0; i < res->clks_num; i++) {
>   		if (IS_V6(core) || (IS_V4(core) && is_lite(core))) {
> 
> ---
> base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
> change-id: 20250918-fallback_of_opp_table-bfae64cca1a0
> 
> Best regards,
> --
> Renjiang Han <quic_renjiang@quicinc.com>
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

