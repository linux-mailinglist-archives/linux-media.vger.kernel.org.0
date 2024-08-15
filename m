Return-Path: <linux-media+bounces-16354-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA223953817
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 18:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DD7AB209D8
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 16:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB831B3F2C;
	Thu, 15 Aug 2024 16:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tzdLRCpf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8063C1714DC
	for <linux-media@vger.kernel.org>; Thu, 15 Aug 2024 16:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723738620; cv=none; b=p1IBgPhX04FLWh+JtWGklEWZI7zGwOTDkCbOz8+24lQebZ2UEkxEdkilpDJnA6dYlHlByrmB9d85wB/hogQuTcXB/6KwbG4e19w0Xvo+jwW/ZHC2LXvsadpbPmHBqM616p8TsJtqb3SxEiqkL7fLoGkjv5c78Xaxk85iE2budwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723738620; c=relaxed/simple;
	bh=sBwws+LY61nNor1YA9MG+DIegEePlRJSmnXHrQUIyB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JM9SO6cq5x1aarDhn+oQE+1YKRHaH+rLWONDF3t33e4JUKmEkNOJEKlI7OBPpF6WYKBlUFQ7JoPh+3SaB5JbJvV2nKCuTLtqXioSnibSvhry/Ob+pr0mhgGEYLoNmozMr+l4qRQFyLzwoK18ji2JV2rvwkqcSHChXieQHlzRw48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tzdLRCpf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4280bca3960so7940165e9.3
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2024 09:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723738617; x=1724343417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7iSVRsyD2HSmbbmHuq4IK1YmKComw1usx+Fslixenyg=;
        b=tzdLRCpfmWoZQd3Dp1w+D6iA5D6ek0roTYsSKMzsJ+LAc4qmu1q3M4gkBxrTZFTX7u
         WP6k+pLfxSxoTCPP7Mbz29bKV3fG3I/e5fwpg0D7DYvD/esAJL+AhEBR1xzNSfw+yS1K
         Dq20bvrpBE6X2H2lDyjlpnWHM28N1VyzfwFo2CfYRYhazb/ixQ16jT59DflbYWfg2ccg
         QfWFMT+YXaIeayGBF9SnEm5biRmVCMSqKEjLlAsaoPk4lh91748qbmVSqq62xfwKenLB
         OVbklb2TrT2d0JraxUvzU/tAsuMZySlColGV/KSIay2KtLp2wuKdrCLHy1we4XLPIOit
         HLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723738617; x=1724343417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7iSVRsyD2HSmbbmHuq4IK1YmKComw1usx+Fslixenyg=;
        b=deuq4CM2FE1lLUGDtfrFmsAYpI97LERNjY7uHHqY1YaYykZrO3ULPxIxTUsceRASfK
         wgj30qJsKu/evmz48yd6I57KXc97vNrlU6ofG5u51McjmQZqb5Di7z+E+m764GjYG6Vh
         MmQmhlY4m8JRHrqKHmmDgidV2iq9YV6E4YRI+yV5/a+apu+sRTXUdXrNpm+Q4L90OohV
         2VVUzgsgeM904H42WsvIYJ9jppJj3uaL3AFJYzacS/D+9wxziXfFqhdP691UrMPMi1a7
         a3zMt9tKp9o9h+TkEJveJlc1e/Hux2QT1cuYjuraSEPM4L45FOTVeI7TXCsBnmCXOeoK
         NDEA==
X-Forwarded-Encrypted: i=1; AJvYcCXJLwXFAJI62pXl47fhp+izvInkXXFE1HvsW87EKbiVPzJqCTMOUORmV8De3zr48L5O92fjTffeMqQYzYe3WwAA1jibzxtpRMNeTX8=
X-Gm-Message-State: AOJu0Yz9UVDeZuC/EioXVvwO+PiAxJb0V4wR+e2wl37BF5ngNhd5DsoX
	EypkKn7brj+VdJnEQpumKYWC26Z/rH8gOIRt+tNWCz2uG2M4oUwEaOeVAfxmzuk=
X-Google-Smtp-Source: AGHT+IG8NyoAKzvdrXrSeebEfcJ4bLuiO1FJx8L+7oCyM+GdMTKzcJZZYpSpDK22H7YPVISRip1zLg==
X-Received: by 2002:a05:600c:511b:b0:426:66a2:b200 with SMTP id 5b1f17b1804b1-429dd1eedf4mr47166045e9.0.1723738616499;
        Thu, 15 Aug 2024 09:16:56 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429e7c04255sm24109495e9.16.2024.08.15.09.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 09:16:55 -0700 (PDT)
Message-ID: <a748e4b2-70f6-4bc4-b48a-21816848fee2@linaro.org>
Date: Thu, 15 Aug 2024 17:16:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
 <b78f23ca-eb6e-45cf-9e42-86c906ff901f@linaro.org>
 <8e38308a-4198-420e-ac4d-718299033eb5@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <8e38308a-4198-420e-ac4d-718299033eb5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/08/2024 14:33, Depeng Shao wrote:
> Hi Bryan,
> 
> On 8/15/2024 12:23 AM, Bryan O'Donoghue wrote:
> 
>>> @@ -674,15 +675,17 @@ int vfe_reset(struct vfe_device *vfe)
>>>   {
>>>       unsigned long time;
>>> -    reinit_completion(&vfe->reset_complete);
>>> +    if (vfe->res->hw_ops->global_reset) {
>>> +        reinit_completion(&vfe->reset_complete);
>>> -    vfe->res->hw_ops->global_reset(vfe);
>>> +        vfe->res->hw_ops->global_reset(vfe);
>>> -    time = wait_for_completion_timeout(&vfe->reset_complete,
>>> -        msecs_to_jiffies(VFE_RESET_TIMEOUT_MS));
>>> -    if (!time) {
>>> -        dev_err(vfe->camss->dev, "VFE reset timeout\n");
>>> -        return -EIO;
>>> +        time = wait_for_completion_timeout(&vfe->reset_complete,
>>> +            msecs_to_jiffies(VFE_RESET_TIMEOUT_MS));
>>> +        if (!time) {
>>> +            dev_err(vfe->camss->dev, "VFE reset timeout\n");
>>> +            return -EIO;
>>> +        }
>>
>> Per my comment on the CSID - this feels like a fix you are introducing 
>> here in the guise of a silicon add.
>>
>> Please break it up.
>>
>> If you have a number of fixes to core functionality they need to be
>>
>> 1. Granular and individual
>> 2. Indivdually scrutable with their own patch and descritption
>> 3. git cherry-pickable
>> 4. Have a Fixes tag
>> 5. And be cc'd to stable@vger.kernel.org
>>
>> Can't accept either the fixes or the silicon add if the two live mixed 
>> up in one patch.
>>
> 
> This isn't a bug fix, adding a null pointer checking just because vfe780 
> doesn't have enable_irq/global_reset/isr/vfe_halt hw_ops, so adding the 
> null checking for these hw_ops in this patch and adding them in one patch.
> The original code doesn't have any bug.

Right but you could just have

static void vfe_global_reset(struct vfe_device *vfe)
{
         /* VFE780 has no global reset, simply report a completion */
         complete(&vfe->reset_complete);
}

const struct vfe_hw_ops vfe_ops_780 = {
	.global_reset = vfe_global_reset,
}

Instead of having a bunch of special cases in the top level code.

> 
>>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/ 
>>> media/platform/qcom/camss/camss-vfe.h
>>> index fcbf4f609129..9dec5bc0d1b1 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
>>> @@ -243,6 +243,7 @@ extern const struct vfe_hw_ops vfe_ops_4_7;
>>>   extern const struct vfe_hw_ops vfe_ops_4_8;
>>>   extern const struct vfe_hw_ops vfe_ops_170;
>>>   extern const struct vfe_hw_ops vfe_ops_480;
>>> +extern const struct vfe_hw_ops vfe_ops_780;
>>>   int vfe_get(struct vfe_device *vfe);
>>>   void vfe_put(struct vfe_device *vfe);
>>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/ 
>>> media/platform/qcom/camss/camss.c
>>> index 7ee102948dc4..92a0fa02e415 100644
>>> --- a/drivers/media/platform/qcom/camss/camss.c
>>> +++ b/drivers/media/platform/qcom/camss/camss.c
>>> @@ -1666,6 +1666,125 @@ static const struct camss_subdev_resources 
>>> csid_res_8550[] = {
>>>       }
>>>   };
>>> +static const struct camss_subdev_resources vfe_res_8550[] = {
>>> +    /* VFE0 */
>>> +    {
>>> +        .regulators = {},
>>> +        .clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", 
>>> "vfe0_fast_ahb",
>>> +               "vfe0", "cpas_vfe0", "camnoc_axi" },
>>
>> Should the camnoc AXI clock go here or in the CSID ?
>>
> 
> camnoc is responsible for ddr writing, so it is needed for the WM in vfe.

Right, I don't recall if you specified the clock for CSID and VFE but 
just for the record it should appear in only the one block.. VFE sounds 
good to me.

> 
> 
>>> +    /* VFE4 lite */
>>> +    {
>>> +        .regulators = {},
>>> +        .clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", 
>>> "vfe_lite_ahb",
>>> +               "vfe_lite", "cpas_ife_lite", "camnoc_axi" },
>>> +        .clock_rate = {    { 0, 0, 0, 0, 0 },
>>> +                { 0, 0, 0, 0, 80000000 },
>>> +                { 300000000, 300000000, 400000000, 400000000, 
>>> 400000000 },
>>> +                { 300000000, 300000000, 400000000, 400000000, 
>>> 400000000 },
>>
>> I realise you're specifying all of the operating points here but the 
>> clock only needs to appear once i.e.
>>
>> 1 x 300 MHz
>> 1 x 400 MHz
>> 1 x 480 MHz
>>
>> etc.
>>
> 
> Sure, will update in next series.
> 
>>> +                { 400000000, 480000000, 480000000, 480000000, 
>>> 480000000 },
>>> +                { 300000000, 300000000, 400000000, 400000000, 
>>> 400000000 },
>>> +                { 300000000, 300000000, 400000000, 400000000, 
>>> 400000000 } },
>>> +        .reg = { "vfe_lite1" },
>>> +        .interrupt = { "vfe_lite1" },
>>> +        .vfe = {
>>> +            .line_num = 4,
>>> +            .is_lite = true,
>>> +            .hw_ops = &vfe_ops_780,
>>> +            .formats_rdi = &vfe_formats_rdi_845,
>>> +            .formats_pix = &vfe_formats_pix_845
>>> +        }
>>> +    },
>>> +};
> 
>>> +void camss_reg_update(struct camss *camss, int hw_id, int port_id, 
>>> bool is_clear)
>>> +{
>>> +    struct csid_device *csid;
>>> +
>>> +    if (hw_id < camss->res->csid_num) {
>>
>> Does this cause do anything ? Is it just defensive programming ? Can 
>> the hw_id index exceed the number of CSIDs defined and if so why ?
>>
>> Smells wrong.
>>
> 
> It is just a defensive programming, just like some null pointer checking.

Right so, please drop then. We require the indexes to be in range in 
order to merge, our job is to make sure this is so.

Lets just reason about the code and make sure the indexes are right.

---
bod


