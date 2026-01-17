Return-Path: <linux-media+bounces-50963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85804D39138
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 22:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E5563009239
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 21:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3169238C1B;
	Sat, 17 Jan 2026 21:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v60wFDk1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB55C2EB878
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 21:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768686573; cv=none; b=Apx8fCRdBNF+8yl7SHn3wL6gi8lVAtENRhk7fi0FILi30UkVcgIn+K8ooY5YZ9nWXY012utoH0vx55UTHaYlVCd3ACoN9XT4dRHpcSOoajS6YAFyrZd1V9v1grKpBS9mfzj1M56NQlf5nyX/TrV55/ySuEe1eYMFM2tftW2Aipw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768686573; c=relaxed/simple;
	bh=onLbcLZRexGHMs/MuJUUOqStQQZwuoTHvstxMfq3lgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNXN9VOlRdqPtuRxOMLo8yzpTDt8iMOKplSOXxdNJnE5/DtKx9D7D8K15Cy9Bg3meP+PWTdrwTBNUSjjZhLsWFmqLFPRevGmlypaIWE5cd/tMdTGozN2nO5cXq2kEPfX117ef8jPCnR41veJf5JBEMpgl8ElRwgerM88/mXJ1Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v60wFDk1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso21161595e9.0
        for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 13:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768686569; x=1769291369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UffJIUSVYgo0B0h25c8d4mRFsK/J7Y5IFP4JKLVIwkE=;
        b=v60wFDk1Vp2tUsHqYwPCrj2cmmg0FzuYGgjLLJ3kaDEWZfrtkAKGBV+GoCvicWQXTO
         4Lvae6vO785pSpAzBhJvIck7ZRZg5kienjfEaqgRgkcH7PPLT5AV/8SVteGtBA0wfIOS
         ONVy0dDc2QuinPDNoZhy5wHVSYzI+dQdesDUevoupIFsljsLUKTdF+rCFx2200zBouNN
         wvPnkgAUntYziNyC4TbFQMJB8WuHaHG8/ZFeNHua3CtmgdQKehcLI48rbiY18gHFksR4
         MkdkEP096VIWm2vOm8DfHE0yO2YWe3WnENCESsyLwyL3Ur45aW4DgYV3F7oh98BdVgfR
         fIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768686569; x=1769291369;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UffJIUSVYgo0B0h25c8d4mRFsK/J7Y5IFP4JKLVIwkE=;
        b=NXXnBhlwE7kFNgTE4X8Zoew93pi/F2Am3+sFsndp1xdAMzMDbWRvdd7rJg+U1WhBVG
         2aSBNf+doavLbGZM1REZYCggjnYgmgJ0cywQEWz+dq47nweeQhAXe9MsJjF9I7582ZrF
         BxR8CcrJJ2g1Tx/Da5XH60cPoWUesrjoV7ekWp3oVh5q0BeNRHxbq19zTh8og2/K0i0h
         gL91rXniAagD6syqogJ27iZ6ZlntGt7f61sjuYuhFx8QlpBO+5UE3xXCf7BAxd7InOt0
         D/2irbiNpHTVbzsRST42TUgtZDt5DavGiQUZlvNIrsap+/CRSgT0yyiF+3tIs7c1w1Eu
         Wp9g==
X-Forwarded-Encrypted: i=1; AJvYcCXueNWNT5YBPHMI72CFV33EgvJaxJxMDrFHw2OGeWJpKYRJ2iW9y0++asnyyooryP0wunor+L5Hpa7iOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFx2EosADAXxVTJMvLiK8UR3BCe5TOQS9rf0yx0ojc6euhdAP7
	S+2jLh/f7+tYjhs7m19RrFrBGuZwTIu97MBylfQXEhzb8jeNOPgKoJ1aamjKYNl9Cg8=
X-Gm-Gg: AY/fxX4bNr1bgXfMsEnkcW32Hrh7tnb5Ot8Pdq8TikPmEnzXLWS0vm8I0Xiyene0d2j
	jlXYon6CNVZrp3rr9ukohwUWP61TVHQRILp/04nEvyheo8uLwWrL0sqOinE7q7yVwKZxZxixm6/
	1F1bvgZKyhGFwGyyQi1y2blKLojD6Ilhlv3exuYMoLkD/bCD9OsZBR3lazQL/fe0NrXIy4FfVNe
	RWO8/QMVJ0bgzhB0HPifE3BL0yife0QlajCgHD+zZQLXLfv/U2kCbgyitJpC/Rsil+fWQkICzVf
	s6jWSdlpewk4CmADuaEX3xZqEbQnSv19zWSmOTrVXkv5WDVJCX+pQhceC5zRKEirLV/RlvGu2R7
	H5p2fPqe5YBpm7thQQoQN72sZ8uWeZOIV1+P6hd0FQW3n9ScFzP2vS1T3sZrwecTllV6GIAes0w
	uXC7gKXxucM0tRK4IY5WmCTrj4xJ4WyiF6sfCtFcj/cR+kuDWbLt7i
X-Received: by 2002:a05:600c:3b90:b0:477:9392:8557 with SMTP id 5b1f17b1804b1-4801e33a93amr81774125e9.18.1768686568765;
        Sat, 17 Jan 2026 13:49:28 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cefdsm12904711f8f.24.2026.01.17.13.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 13:49:27 -0800 (PST)
Message-ID: <4936947b-f402-4817-acf7-299abbeeb23b@linaro.org>
Date: Sat, 17 Jan 2026 21:49:25 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 MIPI
 CSI-2 CPHY init
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260117-qcom-cphy-v3-0-8ce76a06f7db@ixit.cz>
 <20260117-qcom-cphy-v3-5-8ce76a06f7db@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260117-qcom-cphy-v3-5-8ce76a06f7db@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/2026 15:36, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Add a PHY configuration sequence for the sdm845 which uses a Qualcomm
> Gen 2 version 1.1 CSI-2 PHY.
> 
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports three-phase C-PHY mode.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 70 +++++++++++++++++++++-
>   1 file changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 9e8470358515f..f819472511823 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -146,6 +146,7 @@ csiphy_lane_regs lane_regs_sa8775p[] = {
>   };
>   
>   /* GEN2 1.0 2PH */
> +/* 5 entries: clock + 4 lanes */
>   static const struct
>   csiphy_lane_regs lane_regs_sdm845[] = {
>   	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> @@ -220,6 +221,69 @@ csiphy_lane_regs lane_regs_sdm845[] = {
>   	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>   };
>   
> +/* GEN2 1.0 3PH */
> +/* 3 entries: 3 lanes (C-PHY) */
> +static const struct
> +csiphy_lane_regs lane_regs_sdm845_3ph[] = {
> +	{0x015C, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0168, 0xA0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x016C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x010C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0114, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0150, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0118, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x011C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0120, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0124, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0128, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x012C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0144, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0160, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x01CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0164, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x01DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x035C, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0368, 0xA0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x036C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x030C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0314, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0350, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0318, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x031C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0320, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0324, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0328, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x032C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0344, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0360, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x03CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0364, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x03DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x055C, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0568, 0xA0, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x056C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x050C, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +	{0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
> +	{0x0514, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0550, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0518, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x051C, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0520, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0524, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0528, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x052C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0544, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0560, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x05CC, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0564, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x05DC, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
> +};
> +
>   /* GEN2 1.1 2PH */
>   static const struct
>   csiphy_lane_regs lane_regs_sc8280xp[] = {
> @@ -1050,7 +1114,11 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
>   
>   	switch (csiphy->camss->res->version) {
>   	case CAMSS_845:
> -		{ /* V4L2_MBUS_CSI2_DPHY */
> +		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
> +			regs->lane_regs = &lane_regs_sdm845_3ph[0];
> +			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845_3ph);
> +
> +		} else { /* V4L2_MBUS_CSI2_DPHY */

This is inconsistent commenting Ted and I'd reckon something 
checkpatch.pl spits back at you.

If checkpatch.pl doesn't complain about it, I think it probably should.

Please standardise the location of the comment and have one for the CPHY 
and one for the DPHY configs.

>   			regs->lane_regs = &lane_regs_sdm845[0];
>   			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
>   		}
> 

Once implemented.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

