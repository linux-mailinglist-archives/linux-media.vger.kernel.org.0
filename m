Return-Path: <linux-media+bounces-21381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 143799C7098
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 14:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C869D283848
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 13:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789F81E1310;
	Wed, 13 Nov 2024 13:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q7TZpykM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27B81E009F
	for <linux-media@vger.kernel.org>; Wed, 13 Nov 2024 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504509; cv=none; b=oYGGE6QpdZm+rni1APMg2yFjOSWcdiQLXupPHo15Xg7/YTAPRF4MeAyi71l4YITxEYmRnAakZei4/e9z8G7KItSKpKxsjf87fuZHR7xaMz5fI5/yqJi/Y3sCk+VEwMjQDgvUi4p7UzzUlIUeuNr/4hY2Mcj+45wMJrNbfel//I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504509; c=relaxed/simple;
	bh=uGPj9aEicdVXT8tu/M8vFamyjquMApQvA4vaA/reoy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fr5hlx7+rqBDSyvTRFzj/cyhbKzOSOOtYiPHaE/60eKppgPZX44u2QShTrdhkLs8yNa6x5NspJwXltafnCxxpsaihBftKLLVBAAfBMpIFA1gg/Bh6q83AdAW87kVkXoYniwpyU+NsKcLjFshBMZM9sV/szl2QTJtlHz+xZ6r/yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q7TZpykM; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e83daa12so552735e87.1
        for <linux-media@vger.kernel.org>; Wed, 13 Nov 2024 05:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731504506; x=1732109306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gujxsBm0hPvgo0zAbEy6LJkn5rKu5X7iUH7Ce5yiRMc=;
        b=Q7TZpykM55oPi1IeQ7rrU63FPd9zIfs2ZiqS+Z+v9NPI+mGZeXnTtzg/1nM+IBwZGx
         kiHMdre0uLV8EaHKYB5eYJkcqC+KHaADSn3Njzgyl+qzlJCdQVgsN8gC15WZmWmVQ1Gp
         VyO4tAlPPjou4b1PbGuXk7m1SbmoiPa1Wylr60cnyRs9ekGzcY0e2vKPEuCM9Y7S3qVa
         aR787OBrBnyfoNjfFqaVx72JhCkZ15lvfITcV94c92dahf8Pg4oExqAgvGb0kBo7NvV3
         SrSM34CvLhf+dky1/MWJrsACVybd9rtb6GlhHvLYPvqCEy+J75+0dVW5/OqmNeVYs5W8
         YSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504506; x=1732109306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gujxsBm0hPvgo0zAbEy6LJkn5rKu5X7iUH7Ce5yiRMc=;
        b=FwZuSM34f9aVbOWLyI/DnPUnN9qHq49V2D/sekoW/kimqsxl7boC9+27t7p9jUMcrp
         22CJ5sbiIM4b+b7lPkzuWMWL/H5E2/tQJgjjmQ1KHxPxT+bek56XXPz+FYjyNw0RU2zT
         aNav82zLb4pzDN8hGRD++XbvwBW/Fb2oubbdhGzF3RS6+2IDqskcplR3184uGY7X3J/4
         mWVjZ2ajOJ/Z/mzMZJIA3u0W9gCoqhd2tGR4xTXrBSaS6hiW2x1owcIV4+x2nrcVwhdt
         DeBCqEXfv5DMu/I0DIMMGBHjRCt6pXioEhk+BrGKx3xVp23l36Op3qDphlZ/nloZwyWe
         xBzw==
X-Forwarded-Encrypted: i=1; AJvYcCWmODzugYAzm0JOjt2BDn2pLKrRGz/XCRbfc82slNFmmvCEDBuPoOScvdAh42/7qGPSnEt3o2c/gapquQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB9XqDNA/lgvNZ10BPV5R0XB+8LMeessbRq7saAU20ZUiQJI6H
	HSmdO26KKdrajqOgd2F4dK+lHfbw0/FzFGMR2i4zkUYo0Tz5fIHk8d6sZBe8sD4=
X-Google-Smtp-Source: AGHT+IHJUkMS22GQz5fD9HC0PYZqDTgtZvt06iRBwB0LUhMrX3CY9BWl6mEkd1eWHizwfI0HcxtGgQ==
X-Received: by 2002:a2e:a592:0:b0:2fa:d1f9:9fb9 with SMTP id 38308e7fff4ca-2ff201af203mr26234791fa.2.1731504505923;
        Wed, 13 Nov 2024 05:28:25 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff17991abdsm24036101fa.76.2024.11.13.05.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 05:28:25 -0800 (PST)
Message-ID: <67d014f1-9424-4b88-b031-096a5596c5c8@linaro.org>
Date: Wed, 13 Nov 2024 15:28:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add MSM8953 resources
Content-Language: en-US
To: barnabas.czeman@mainlining.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>
References: <20241103-camss-msm8953-v4-0-48d0ec75958d@mainlining.org>
 <20241103-camss-msm8953-v4-3-48d0ec75958d@mainlining.org>
 <6833ebc6-9210-471a-8ca6-5f3605155f33@linaro.org>
 <412b3252f1ca795fbcfaf5e466e94642@mainlining.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <412b3252f1ca795fbcfaf5e466e94642@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Barnabás, Bryan.

On 11/13/24 10:01, barnabas.czeman@mainlining.org wrote:
> On 2024-11-13 05:58, Vladimir Zapolskiy wrote:
>> On 11/3/24 11:45, Barnabás Czémán wrote:
>>> From: Vladimir Lypak <vladimir.lypak@gmail.com>
>>>
>>> This commit describes the hardware layout for the MSM8953
>>> for the following hardware blocks:
>>>
>>> - 2 x VFE, 3 RDI per VFE
>>> - 3 x CSID
>>> - 3 x CSI PHY
>>>
>>> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
>>> Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>>    drivers/media/platform/qcom/camss/camss-csiphy.c |   1 +
>>>    drivers/media/platform/qcom/camss/camss-ispif.c  |   5 +
>>>    drivers/media/platform/qcom/camss/camss-vfe.c    |   1 +
>>>    drivers/media/platform/qcom/camss/camss.c        | 170
>>> +++++++++++++++++++++++
>>>    drivers/media/platform/qcom/camss/camss.h        |   1 +
>>>    5 files changed, 178 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c
>>> b/drivers/media/platform/qcom/camss/camss-csiphy.c
>>> index
>>> 68a3ea1ba2a5299cf28289dfdb958cfdff3c91e0..5af2b382a843c2b8857339ba28930fe1682c9412
>>> 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
>>> @@ -596,6 +596,7 @@ int msm_csiphy_subdev_init(struct camss *camss,
>>>    		return PTR_ERR(csiphy->base);
>>>      	if (camss->res->version == CAMSS_8x16 ||
>>> +	    camss->res->version == CAMSS_8x53 ||
>>>    	    camss->res->version == CAMSS_8x96) {
>>>    		csiphy->base_clk_mux =
>>>    			devm_platform_ioremap_resource_byname(pdev, res->reg[1]);
>>> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c
>>> b/drivers/media/platform/qcom/camss/camss-ispif.c
>>> index
>>> a12dcc7ff438c55167bc2981fd399dbf178181df..2dc585c6123dd248a5bacd9c7a88cb5375644311
>>> 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
>>> @@ -830,6 +830,7 @@ static int ispif_set_stream(struct v4l2_subdev
>>> *sd, int enable)
>>>    		ispif_select_cid(ispif, intf, cid, vfe, 1);
>>>    		ispif_config_irq(ispif, intf, vfe, 1);
>>>    		if (camss->res->version == CAMSS_8x96 ||
>>> +		    camss->res->version == CAMSS_8x53 ||
>>>    		    camss->res->version == CAMSS_660)
>>>    			ispif_config_pack(ispif,
>>>    					  line->fmt[MSM_ISPIF_PAD_SINK].code,
>>> @@ -848,6 +849,7 @@ static int ispif_set_stream(struct v4l2_subdev
>>> *sd, int enable)
>>>      		mutex_lock(&ispif->config_lock);
>>>    		if (camss->res->version == CAMSS_8x96 ||
>>> +		    camss->res->version == CAMSS_8x53 ||
>>>    		    camss->res->version == CAMSS_660)
>>>    			ispif_config_pack(ispif,
>>>    					  line->fmt[MSM_ISPIF_PAD_SINK].code,
>>> @@ -1111,6 +1113,7 @@ int msm_ispif_subdev_init(struct camss *camss,
>>>    	if (camss->res->version == CAMSS_8x16)
>>>    		ispif->line_num = 2;
>>>    	else if (camss->res->version == CAMSS_8x96 ||
>>> +		 camss->res->version == CAMSS_8x53 ||
>>>    		 camss->res->version == CAMSS_660)
>>>    		ispif->line_num = 4;
>>>    	else
>>> @@ -1130,6 +1133,7 @@ int msm_ispif_subdev_init(struct camss *camss,
>>>    			ispif->line[i].nformats =
>>>    					ARRAY_SIZE(ispif_formats_8x16);
>>>    		} else if (camss->res->version == CAMSS_8x96 ||
>>> +			   camss->res->version == CAMSS_8x53 ||
>>>    			   camss->res->version == CAMSS_660) {
>>>    			ispif->line[i].formats = ispif_formats_8x96;
>>>    			ispif->line[i].nformats =
>>> @@ -1162,6 +1166,7 @@ int msm_ispif_subdev_init(struct camss *camss,
>>>    		ret = devm_request_irq(dev, ispif->irq, ispif_isr_8x16,
>>>    			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
>>>    	else if (camss->res->version == CAMSS_8x96 ||
>>> +		 camss->res->version == CAMSS_8x53 ||
>>>    		 camss->res->version == CAMSS_660)
>>>    		ret = devm_request_irq(dev, ispif->irq, ispif_isr_8x96,
>>>    			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
>>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c
>>> b/drivers/media/platform/qcom/camss/camss-vfe.c
>>> index
>>> 83c5a36d071fcc32c4b8a89e4e429dc1820df139..80a62ba11295042802cbaec617fb87c492ea6a55
>>> 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>>> @@ -285,6 +285,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line,
>>> u32 sink_code,
>>>      	switch (vfe->camss->res->version) {
>>>    	case CAMSS_8x16:
>>> +	case CAMSS_8x53:
>>>    		switch (sink_code) {
>>>    		case MEDIA_BUS_FMT_YUYV8_1X16:
>>>    		{
>>> diff --git a/drivers/media/platform/qcom/camss/camss.c
>>> b/drivers/media/platform/qcom/camss/camss.c
>>> index
>>> fabe034081ed0a7c0e0fcd8bc76c4eb396cb0067..9fb31f4c18adee886cd0bcf84438a8f27635e07f
>>> 100644
>>> --- a/drivers/media/platform/qcom/camss/camss.c
>>> +++ b/drivers/media/platform/qcom/camss/camss.c
>>> @@ -152,6 +152,160 @@ static const struct camss_subdev_resources
>>> vfe_res_8x16[] = {
>>>    	}
>>>    };
>>>    +static const struct camss_subdev_resources csid_res_8x53[] = {
>>> +	/* CSID0 */
>>> +	{
>>> +		.regulators = { "vdda" },
>>
>> I see that you do reuse csiphy_res_8x16 for this platform support, in
>> this case let me ask you to double check/test that the "vdda" regulator
>> is actually a CSIPHY regulator, and if so, please move the registration
>> of the regulators to csiphy_res_8x16 as a preceding change.
> It is placed in CSID at downstream and this is the documentation of
> the downstream property:
> - qcom,mipi-csi-vdd-supply : should contain regulator to be used for
>       this csid core
> so it should be a csid regulator as i understand.
> It is also placed at CSIDs in msm8953-camera.dtsi

I've opened DB410C board schematics, and CAMSS IP is supplied over
VREG_L2_1P2 power lane entering VDDA_MIPI_CSI pad on the APQ8016 SoC.

The same voltage regulator also supplies display and SDRAM memory, most
probably the latter implies that CAMSS IP and driver cannot be tested
at least on this reference board, when the regulator is disabled.

So, we have to rely on the documentation here. Bryan, can you please
check, if VDDA_MIPI_CSI pad on MSM8916 and/or MSM8953 is related to
CSIPHY or CSID power supply? Thank you in advance.

--
Best wishes,
Vladimir

