Return-Path: <linux-media+bounces-17967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 802AA971265
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 10:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AA7D283A97
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 08:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2471B1D60;
	Mon,  9 Sep 2024 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="qNNuh/NS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC15B1B1D7A;
	Mon,  9 Sep 2024 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725871503; cv=none; b=GY7fuCnIYY3tULP+I0yVKuhRhsirEtuAwAlty0cqg1G8GPFqi1Omf02iJe0DogSB4dHfDHfHvmGeDy/KWB6FFvnA7knZ21A/2l643Imb2iaT4Ub5L1345YMTODQ/crgUoZg1FsaDjSNIsh+2OWXd2Xl2WK84vsM/02k1CetBB1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725871503; c=relaxed/simple;
	bh=s+xlewCctMaDsFweMYj/4diRQjW82za84FW+swoCSDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h2GFQcDbrVcqZh4CGALTrTWVen5aZtJwjZaQuTXfWmIsHoCCtDpXKDPSINbtI1RvrSFD/YT7BTdb3h5Dod2zvF5BdItcSucFglv1DYsRFe06IOetD2RtTdyYfYHvoCc+oioqE/byb3dO1NlwKcL1xYxrHixoBjOPWaM4qEjhS54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=qNNuh/NS; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48986X8W022718;
	Mon, 9 Sep 2024 10:44:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	IOm4ThO68sZ/MvSmIYIo32o7N2x0/3KIu3jjeSGhrfw=; b=qNNuh/NSwbUHYh/2
	sAmk4jT3EuhQ+Qprw8LdvXJHKc4Zm1iShImlwC7kHV8TDPsrzIWcsRdwAWV+tiVA
	J7WPCfFx2LjeuFKOKRl0u1822YLjnNtpmTHWeBc8ifXnHKN+ory/ZnuDFUChfsHi
	/AOlfM+I3M+QPrGCN/9UhEIICYner1UKOvTRE7eoMetsE23MZsphw91WBaWNWmeE
	hu693aUCUHX+TGavdnVBKuNRvrBs8WBGHwOqLEt6wOd9HipL1R6vSCq5H1OGnHSy
	o6JzTzg/P4bxMRYQhAo0b9C+zRfFpTmAzamptvKrMiwFZxcT0/PLL+zeizsMG9ll
	mr5kmg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41gyaum1s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 10:44:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3544340048;
	Mon,  9 Sep 2024 10:43:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0916A24F388;
	Mon,  9 Sep 2024 10:42:18 +0200 (CEST)
Received: from [10.131.140.24] (10.131.140.24) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 9 Sep
 2024 10:42:17 +0200
Message-ID: <4b37dccd-bfc6-4355-847f-f613a4a87263@foss.st.com>
Date: Mon, 9 Sep 2024 10:42:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: Add driver for ST VD56G3 camera sensor
To: Sakari Ailus <sakari.ailus@iki.fi>
CC: <benjamin.mugnier@foss.st.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240521162950.6987-1-sylvain.petinot@foss.st.com>
 <20240521162950.6987-3-sylvain.petinot@foss.st.com>
 <ZlXEvR3yKe0W8X_q@valkosipuli.retiisi.eu>
 <ecccf332-66e5-43c0-8a48-d49b0aa1e5a9@foss.st.com>
 <Zt6ei2-orFC4Jq1g@valkosipuli.retiisi.eu>
From: Sylvain Petinot <sylvain.petinot@foss.st.com>
Content-Language: en-US
In-Reply-To: <Zt6ei2-orFC4Jq1g@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hello Sakari,

Thanks for your feedback, no worries about the delay ...

On 9/9/2024 9:06 AM, Sakari Ailus wrote:
> Hi Sylwain,
> 
> Apologies for the delay...
> 
> On Mon, Jun 03, 2024 at 11:59:29AM +0200, Sylvain Petinot wrote:
>>>> +/*
>>>> + * The VD56G3 pixel array is organized as follows:
>>>> + *
>>>> + * +--------------------------------+
>>>> + * |                                | \
>>>> + * |   +------------------------+   |  |
>>>> + * |   |                        |   |  |
>>>> + * |   |                        |   |  |
>>>> + * |   |                        |   |  |
>>>> + * |   |                        |   |  |
>>>> + * |   |                        |   |  |
>>>> + * |   |   Default resolution   |   |  | Native height (1364)
>>>
>>> What's outside the default resolution? It doesn't appear the driver would
>>> allow capturing pixels out side this area.
>>
>> Well both native and default resolutions are supported in the
>> 'vd56g3_supported_modes' below.
>> However this quite exotic resolution (1364 x 1124) isn't well supported
>> by csi receivers, ISPs. That's why the default resolution of the driver
>> is 1120 x 1360 (multiple of 16).
> 
> Ack.
> 
> I'd still keep the native resolution as the default and allow configuring
> something else if the user space wants to.
> 
> The desired resolution really depends on the use case (as well as the ISP).

Sure, I can change the default to the native... The choice I made was
more a way to simplify (my) life (several times we went into debugging
before realizing that it was the exotic resolution causing the unwanted
behavior).
But, that's probably better, I'll change it for V4.

> 
>>>> +		break;
>>>> +	case V4L2_CID_EXPOSURE_AUTO:
>>>> +		is_auto = (ctrl->val == V4L2_EXPOSURE_AUTO);
>>>> +		__v4l2_ctrl_grab(sensor->ae_lock_ctrl, !is_auto);
>>>> +		__v4l2_ctrl_grab(sensor->ae_bias_ctrl, !is_auto);
>>>> +		break;
>>>> +	default:
>>>> +		break;
>>>
>>> You could omit default here.
>>
>> I don't really like switch case without default. For sure I can omit,
>> but I prefer making it explicit.
> 
> I'm ok with that.
> 
> ...
> 
>>>> +static int vd56g3_power_off(struct vd56g3 *sensor)
>>>> +{
>>>> +	clk_disable_unprepare(sensor->xclk);
>>>> +	gpiod_set_value_cansleep(sensor->reset_gpio, 1);
>>>> +	regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supplies);
>>>> +	return 0;
>>>
>>> You can make the return type void.
>>>
>>> Do you need two pairs of functions doing the same, or could you call
>>> vd56g3_runtime_resume and vd56g3_runtime_suspend from driver's probe and
>>> remove functions, too?
>>
>> "Well, in fact, I tested both options before submitting V2 (I mean the
>> unification of vd56g3_runtime_resume/suspend functions with
>> vd56g3_power_on/off).
>>
>> The unification option has the advantage of simplifying the code and
>> removing two "useless" functions. The only drawback is that I had to
>> call v4l2_i2c_subdev_init() earlier in the probe() function, whereas
>> it's currently called in vd56g3_subdev_init() (currently at the end of
>> the probe()). OK, it's not a big deal, but I find that the resulting
>> code is not as well structured/divided (thus readable).
>>
>> I'm interested to get your feedback to decide wich option to push for V3.
> 
> I'd prefer calling v4l2_i2c_subdev_init() earlier, in order to set the
> device context. These are usually among those things that should be done as
> early as possible, in order to avoid invalid pointers where much of the
> driver code expects something else.

Yes, the V3 I pushed include this modification.

> 
> Btw. if you're not in too much hurry (I guess so?), we're just about to
> rework the sensor API, to include internal pads and embedded data, for
> better sensor configurability. It'll take a while before we're there
> though, but when this driver is merged, the existing API must continue to
> work.
> 

I have a few branches with stream API (notably for the support of status
lines), but I need a to test a bit more before pushing.


--
Sylvain

