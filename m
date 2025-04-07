Return-Path: <linux-media+bounces-29538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4982CA7E4D1
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 17:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBAA07A3324
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3665202973;
	Mon,  7 Apr 2025 15:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBxrsI2W"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0117F200BB3;
	Mon,  7 Apr 2025 15:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040372; cv=none; b=ruFPVXY2idlpM8ZSu6GWuaAjA5OLBqYhOncQHGzkNbjrB0ID7DWhYlKQeiB8mLiX5Cs084p8NNOqc3xxPqBHUjNzemPfvXAXo+MdNNlQs2ZnD10cctD3a7FCDCWIaEz2xuY0qACeAhWx1WiFFCtE1ydzVSuXpmrq4y3xzto2Q0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040372; c=relaxed/simple;
	bh=M3y8hJh48p4El0IfUM4vjOfPCS0bV3egS3RqF+kA6FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1ZxwabH3npwJKr/2nzN0lJQWmbB4qSNTmXLSy07+MQXRCvmrBfQePnwoADO2xXNSfHh9mNQ7N86ibHP28xn/nE17zAII0KojcaV5JFroirjEIYyqldo3knBYY8WM/oAB76OZCo1dpCFM4PQEbrK79rxVeZKFxv+YRN/X/3ZmgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBxrsI2W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A8FC4CEDD;
	Mon,  7 Apr 2025 15:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744040371;
	bh=M3y8hJh48p4El0IfUM4vjOfPCS0bV3egS3RqF+kA6FE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aBxrsI2W50l74Pn58A5m09CxNRjYDxThYlA4abxzg1FuCkQLDYCef4ag7qNVKeB2q
	 n+/KNjBJIssz7yA7e0Ieog2KN+tRSmsFZIfWa8Mj2c8yuTgw7E6hz75Nw/R+4tAOZi
	 W435MIUXI+JJrfusrjiVxUvWoSCFUzlrNKpA1yEarvidLHwyPmuclXz/kc75tYBkFi
	 jgxMLeI7Zj7fNBoDSdJGiskOBrYUwFV7Ccv7lJ6I2Nz0OmXsq34Gdoacw668icvxy4
	 3H5sAdM69wef4rmbPYWGJFWf9aCf9Yf1qory0BOxvQmA96BnHPwZ+iTTfkd2xqoiha
	 UL9F3Sg0MeyWA==
Message-ID: <6f11921a-4ee8-4f40-9131-529f548f681a@kernel.org>
Date: Mon, 7 Apr 2025 16:39:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] media: venus: pm_helpers: use opp-table for the
 frequency
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Renjiang Han <quic_renjiang@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241219-add-venus-for-qcs615-v6-0-e9a74d3b003d@quicinc.com>
 <20241219-add-venus-for-qcs615-v6-2-e9a74d3b003d@quicinc.com>
 <fde279ad-27ed-4947-a408-23139bcd270a@oss.qualcomm.com>
 <351a9654-ffa1-4727-b772-95d4ed113c81@quicinc.com>
 <ac145c57-1db3-4747-88e2-02825f958d5a@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <ac145c57-1db3-4747-88e2-02825f958d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/01/2025 13:05, Konrad Dybcio wrote:
> On 2.01.2025 6:38 AM, Renjiang Han wrote:
>>
>> On 12/23/2024 10:17 PM, Konrad Dybcio wrote:
>>> On 19.12.2024 6:41 AM, Renjiang Han wrote:
>>>> The frequency value in the opp-table in the device tree and the freq_tbl
>>>> in the driver are the same.
>>>>
>>>> Therefore, update pm_helpers.c to use the opp-table for frequency values
>>>> for the v4 core.
>>>> If getting data from the opp table fails, fall back to using the frequency
>>>> table.
>>>>
>>>> Signed-off-by: Renjiang Han<quic_renjiang@quicinc.com>
>>>> ---
>>>>    drivers/media/platform/qcom/venus/pm_helpers.c | 53 +++++++++++++++++++-------
>>>>    1 file changed, 39 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>>>> index 33a5a659c0ada0ca97eebb5522c5f349f95c49c7..b61c0ad152878870b7223efa274e137d3636433b 100644
>>>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>>>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>>>> @@ -43,14 +43,20 @@ static int core_clks_enable(struct venus_core *core)
>>>>        const struct venus_resources *res = core->res;
>>>>        const struct freq_tbl *freq_tbl = core->res->freq_tbl;
>>>>        unsigned int freq_tbl_size = core->res->freq_tbl_size;
>>>> +    struct device *dev = core->dev;
>>>> +    struct dev_pm_opp *opp;
>>>>        unsigned long freq;
>>>>        unsigned int i;
>>>>        int ret;
>>>>    -    if (!freq_tbl)
>>>> -        return -EINVAL;
>>>> -
>>>> -    freq = freq_tbl[freq_tbl_size - 1].freq;
>>>> +    opp = dev_pm_opp_find_freq_ceil(dev, &freq);
>>>> +    if (IS_ERR(opp)) {
>>>> +        if (!freq_tbl)
>>>> +            return -EINVAL;
>>>> +        freq = freq_tbl[freq_tbl_size - 1].freq;
>>>> +    } else {
>>>> +        dev_pm_opp_put(opp);
>>>> +    }
>>> I'm not super convinced how this could have ever worked without
>>> scaling voltage levels, by the way. Perhaps this will squash some
>>> random bugs :|
>>>
>>> Konrad
>>   Thanks for your comment.
>>   The default value of freq is 0, and then dev_pm_opp_find_freq_ceil is
>>   used to match freq to the maximum value in opp-table that is close to
>>   0. The frequency values ​​in opp-table and freq_tbl are the same, and
>>   dev_pm_opp_find_freq_ceil is used to assign the minimum value in
>>   opp-table to freq. So the logic is the same as before. I'm not sure if
>>   I've answered your concern.
> 
> We talked offline, but for the record: my concern here was about
> clk_set_rate() not scaling RPM/h voltage corners, which this patch
> fixes
> 
> Konrad

Konrad is this an RB from you, do you have any other concerns with this 
code ?

Dikshita, Vikash ?

I'll give it a test myself ASAP but any other comments or R/B would be 
helpful.

---
bod

