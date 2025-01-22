Return-Path: <linux-media+bounces-25132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DA7A19286
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 14:31:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5C86188282E
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 13:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222352135CF;
	Wed, 22 Jan 2025 13:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KvrQYSiZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19A91805B
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 13:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737552644; cv=none; b=S9qTObv13vG410bAEhMFDnSuh5S2D2JZq36Us+6vE4s7y/SkSATsS+Xo9Se+uv3Bka2KITFcm4+kftk4PScmMLNnZkThoDnng90KwIQcUpdV8JaOdl0OrxxMokDdlK5w+YTaqeGdiKa8TliJCKSCoh/6wdGsP7NJIOZ8sAf6WMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737552644; c=relaxed/simple;
	bh=nQ+EfzcRSwtzPf/2Sjx6eJs4I6cX9R80znntCwpy21c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uc9UErL10yOuqVPbdnZZlKGMDQzU/Od0hgViA34Uh/aCReIhYGrHPCDpWn2Qzy32gKWd2f+gLlkMwo9vYu3BVgGBtdJfLVkYbSeXXYJFN+nzAjpWaemAnbCCIeow3zVg4eIpMVjHiEY/huFjqkEoztVf+sfQBuLAAQN6BuBSMbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KvrQYSiZ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385e3621518so3188471f8f.1
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 05:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737552640; x=1738157440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PsT5ZgwViolUdUf4pKeCqLICO/10Zy8qj04pN0k9tFs=;
        b=KvrQYSiZU1WBLdFJNaulz8Fe3RapypBt1FULEDR3KSK5FPL5qDwJV202UGKKsxSjsM
         +NZYU0CQjkOt6Q5xD3YJJ/TgsoH/khuA6OO09upybgG0HU2t0M3Svs0rQ/eyV4I8QDA1
         houhd4bP004ExDUkGSqnYgiEE82f4fuu1+OBv0FC7/AiFnfgxAjhgNkY4AAh45piBOKi
         9wdXn92P4gcCUcpaSUWJPcdbL1JogQGfLgNOWO7Huou5+i8FUCtFbgizQiBQc5YOg4V0
         0r1+O+fOMbWX7viitlHfQGboVK0pd5CcWdweHCS/RxcvODLmfX7BtughD3XE4ONGqf1c
         P3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737552640; x=1738157440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PsT5ZgwViolUdUf4pKeCqLICO/10Zy8qj04pN0k9tFs=;
        b=kaHtGmXXTgmdd2ak0rLDsyKTAfQAUUOYV4h0NgZLeK3tsK5ncfxpdYZkvUz8dipLGO
         eRX6Q9wGVf41A2JDD2VP+rVhwmg695fvXHv3SXCeMFX2nnVpca5vk1MvtNybQD5aqxVv
         X+T+av4jxY9Tb42FyY7vhxzYCfdoierdLU6JSJTnxht5DGxGEfiCxUGKHTi9Ic/L3ZsD
         NMeKMHzUpYS3u0LQvUfUT7gxhVsffJTFd+Cr3PSWHjvHPtFSW7uhvazE/c/WoUhvTYB4
         P1aWyGVbSvojU4VUvj9NbDgwp4ieDmarC+UhxkHUDhlcVtrs1VG0rn8m3FB2JCU4FeHv
         jC6A==
X-Forwarded-Encrypted: i=1; AJvYcCW60D9nlqwkJiW8Dxms5ercY83jPgjCMv0nZi6+zcfSvdP0wLrqCcbesA0M7m1Ooe5jqEbufDP4OD+bOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+3EwL2Q+f3ch872PZHujf7+TV5rgh+Y58HJOVbqns/jgf4lu+
	KUDJR1Lb8/CTZMCgEp6apZeCzLt2tInihNNbdD4l6K+ioRTgx16Ucm0Rnb69azQ=
X-Gm-Gg: ASbGncsv2tMprmIPISZ8Ug4BidKoWvSmqwxMMGS6rWvbNeUYMCi4Mgwq3kYLDkbopF6
	rCmqB1sn5xcqeaxDb2urPA2WePyMtFvRgUtBSYZMo+LbT9usFS7OKceXH9OA3ZSNxoZiDUK7zPN
	uDfuXpZ7upPKPaFFUwCdhzX92kp0qXy3fw2GmyAFC9fK2N8Q+mR1bD/gszrCbWDLYsNnEJfozfU
	htfhLgyGTBmj7EpY8GfllRvDVuUPR84/zZwvCMbn8YXtGUXpFqhjEzfbIpb6GWvZnx6IjaaaxpE
	qP/4rMA=
X-Google-Smtp-Source: AGHT+IHGz3oZZDXrd7dn+W7Dx6QiFyDmlY7D2ck63M0pEtyL+pVpGkX33GNbY2T81rXpW5skMbhNiw==
X-Received: by 2002:a05:6000:1f88:b0:386:459e:e138 with SMTP id ffacd0b85a97d-38bf57a604amr16210415f8f.36.1737552639966;
        Wed, 22 Jan 2025 05:30:39 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322a838sm16081440f8f.48.2025.01.22.05.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 05:30:39 -0800 (PST)
Message-ID: <93be5858-6c1e-4a09-bfe3-ac89d458a892@linaro.org>
Date: Wed, 22 Jan 2025 13:30:38 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: qcom: camss: update clock names for sc7280
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250121180746.1989996-1-quic_vikramsa@quicinc.com>
 <20250121180746.1989996-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250121180746.1989996-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/01/2025 18:07, Vikram Sharma wrote:
> Update clock names to make them consistent with existing platform i.e
> sc8280xp. Rename gcc_cam_hf_axi to gcc_axi_hf and add gcc_axi_sf.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index a85e9df0f301..b1358457c66e 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1443,12 +1443,13 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>   		.regulators = {},
>   
>   		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe0",
> -			   "vfe0_axi", "gcc_cam_hf_axi" },
> +			   "vfe0_axi", "gcc_axi_hf", "gcc_axi_sf" },
>   		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
>   				{ 80000000 },
>   				{ 0 },
>   				{ 380000000, 510000000, 637000000, 760000000 },
>   				{ 0 },
> +				{ 0 },
>   				{ 0 } },
>   
>   		.reg = { "vfe0" },
> @@ -1468,12 +1469,13 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>   		.regulators = {},
>   
>   		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe1",
> -			   "vfe1_axi", "gcc_cam_hf_axi" },
> +			   "vfe1_axi", "gcc_axi_hf", "gcc_axi_sf" },
>   		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
>   				{ 80000000 },
>   				{ 0 },
>   				{ 380000000, 510000000, 637000000, 760000000 },
>   				{ 0 },
> +				{ 0 },
>   				{ 0 } },
>   
>   		.reg = { "vfe1" },
> @@ -1493,12 +1495,13 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>   		.regulators = {},
>   
>   		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe2",
> -			   "vfe2_axi", "gcc_cam_hf_axi" },
> +			   "vfe2_axi", "gcc_axi_hf", "gcc_axi_sf" },
>   		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
>   				{ 80000000 },
>   				{ 0 },
>   				{ 380000000, 510000000, 637000000, 760000000 },
>   				{ 0 },
> +				{ 0 },
>   				{ 0 } },
>   
>   		.reg = { "vfe2" },
> @@ -1516,11 +1519,12 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>   	/* VFE3 (lite) */
>   	{
>   		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb",
> -			   "vfe_lite0", "gcc_cam_hf_axi" },
> +			   "vfe_lite0", "gcc_axi_hf", "gcc_axi_sf" },
>   		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
>   				{ 80000000 },
>   				{ 0 },
>   				{ 320000000, 400000000, 480000000, 600000000 },
> +				{ 0 },
>   				{ 0 } },
>   
>   		.regulators = {},
> @@ -1537,11 +1541,12 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>   	/* VFE4 (lite) */
>   	{
>   		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb",
> -			   "vfe_lite1", "gcc_cam_hf_axi" },
> +			   "vfe_lite1", "gcc_axi_hf", "gcc_axi_sf" },
>   		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
>   				{ 80000000 },
>   				{ 0 },
>   				{ 320000000, 400000000, 480000000, 600000000 },
> +				{ 0 },
>   				{ 0 } },
>   
>   		.regulators = {},
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

