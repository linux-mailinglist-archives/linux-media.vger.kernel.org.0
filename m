Return-Path: <linux-media+bounces-25171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F92A19A62
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 22:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8298E188D5BA
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 21:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D5F1C5D68;
	Wed, 22 Jan 2025 21:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nMcMev63"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBE71C5F26
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 21:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737581401; cv=none; b=ZzD1A4lYqaLA9+K5F4oLNg/3g7diqKBrD0wNI2/661zLhs8/S+W+Z2IyLukAG406qxd0w/7nHfn+RresmYLp3Es+xV7xb2HTbZpRmuX3qU21NhyQLBMFXTcqcy4gUQ+PVsMIhbddVHrvXwf6o3ro3hzyMfhIVu6KpRF3cGF4Bho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737581401; c=relaxed/simple;
	bh=gE+jXJwC2277bMOEYFOULxBwB0PODljbVBPGa4+jL44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=im11OkuD/nh5P0gy4cbnu1XQp3G3RFMsEVECQChL1TGR5nm0l3JBw2qr/ckj4zFqPHXXZVN7KWHe7BNDkj4dim7sRvQmiyk66dHsEgNcPwOWN1nM7D9YgG1zSlyKHKja+fw3ezksaJWlGdAZbGwhTNrmld2pJKLQs02KI/ZZN6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nMcMev63; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e2ed7d951so41224e87.1
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 13:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737581397; x=1738186197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R/RXU9nh86T96RJ0rGKhWz82bWGgQ0uIJ767X+sblqM=;
        b=nMcMev63ETJFZIZKEi/ATNhB/uXlhaxs2OLRBuQ9y4/dHUMzAGbEndgBZVIPjS/JhM
         FMbvADaY3DT6qJWC/ZCdYAYEjeWYfyzk3sJgK3fmtamiGRkyQarGApjNf/ltUmJkNJK7
         JXHev3jJmpkTsbo20oDA8az0jWnPVO1z3Rg0WmY0Wts+L3DrVcuk4D2nU6e2t5GI7ymd
         T6zgocskt/Syu3l72/ba9pMeFTGm0/nU+WorpEgfLv+xLsBik3s/yDVs7smPaTOi6a5j
         d1e88Os9Md+BhVuq+rTRvVLdoKFncXx8fQBrcjaTvWhZpN61mMJVqkE/VcnjI1+XPzwT
         ZYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737581397; x=1738186197;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R/RXU9nh86T96RJ0rGKhWz82bWGgQ0uIJ767X+sblqM=;
        b=MgpElo6/W66diLT08Ab6e2ftjsbX1VRbyhPQJacNDlXsAHH2ik245Cqhq0+JglJmtn
         7Lwt4cAcnxeaSlaArr8QRCcLSMAHYOklJjwh3+bnMATxQR0nuSeehuOtStgki1vCQDzJ
         5XtwI8kCQNUBZDOiSOkmMO5/LO0ryqGjXITpMz/mguDldW+2uhbauhwLo6MG7ZKnkTQW
         1Qt75YMjp3BW9NforvNFZ+SVw3iMpa0uAP3CQGR+9f1Rd1HjLCUDhmMxdD+fUDaYzwsy
         BgEJaBBbqON83mZqLbEBNcl1vXqnRuM3VmZPWZinw8wdJVKDdbFJ9T6XvWQpfANc5c5l
         apvw==
X-Gm-Message-State: AOJu0YzyORHoPY4hljJ3zeP+hJTAmpmXk7Kc1rM7SYhvCPfUVAcf9dqb
	Gp6RQ6eh3nnhO50WUSdEKRLFwq8qBakWUNHcfN8OF0i9sgtxiVAsL5Xa+5dND3sKlhwiPGloi8z
	p
X-Gm-Gg: ASbGncsZaHLhwbwZuWb3GpaphrAa8mgoXxnf2yIz3DGiI7lhLwitLot4UJcykTg0j1z
	xM/XtrWa/yN1XBot8dcpGKlSRm7jiQgvmAYgUCZPYjBKCa9Mt0fjJURt1TnLWkD0lXXqU0VOY8K
	yQxiby/dindiyTrH5HdTwUZBg2HAFSQiUzsOl1NEv3330zCL46vkWsP6IDk/r0Ao19blq5JOhkK
	BJLM6e/Je1jp7NS/guTF5kS3oUceRmygqOmm21icSPkfxK1S3FR08xJrygMQ5n6tKLrR2OXwkWf
	NhI8gRIpIPLbmEaQdC3uCLpwTzwQTkoET44cl8essgjTDCRv
X-Google-Smtp-Source: AGHT+IH6D10EQ0qNtGjjR27sfmC+sUgfrKnKkM41OsM28JPrVWpy2x/5XpPMrKnQowWUv3mInRcYgQ==
X-Received: by 2002:a2e:b8cc:0:b0:2fb:5510:f6f7 with SMTP id 38308e7fff4ca-3072ca51db7mr29430721fa.2.1737581396635;
        Wed, 22 Jan 2025 13:29:56 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a4ed6b3sm27657371fa.85.2025.01.22.13.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 13:29:55 -0800 (PST)
Message-ID: <b2f909e3-bdee-4b00-97b9-20859c22f60c@linaro.org>
Date: Wed, 22 Jan 2025 23:29:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] media: qcom: camss: csiphy-3ph: Add 4nm CSIPHY 2ph
 5Gbps DPHY v2.1.2 init sequence
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
 <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-6-44c62a0edcd2@linaro.org>
 <00989990-85dd-46d7-a100-c986fc1fb066@linaro.org>
 <ff081020-6e6f-472e-823a-12b2cd2c9a72@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ff081020-6e6f-472e-823a-12b2cd2c9a72@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/22/25 15:41, Bryan O'Donoghue wrote:
> On 22/01/2025 00:29, Vladimir Zapolskiy wrote:
>> Hi Bryan.
>>
>> On 1/20/25 17:47, Bryan O'Donoghue wrote:
>>> For various SoC skews at 4nm CSIPHY 2.1.2 is used. Add in the init
>>> sequence
>>> with base control reg offset of 0x1000.
>>>
>>> This initial version will support X1E80100. Take the silicon verification
>>> PHY init parameters as a first/best guess pass.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>    .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 126 +++++++++++
>>> ++++++++++
>>>    1 file changed, 126 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> index b44939686e4bb..fc624a3da1c43 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
>>> @@ -55,6 +55,7 @@
>>>    #define CSIPHY_DNP_PARAMS        4
>>>    #define CSIPHY_2PH_REGS            5
>>>    #define CSIPHY_3PH_REGS            6
>>> +#define CSIPHY_SKEW_CAL            7
>>
>> This one is not needed, having CSIPHY_DNP_PARAMS only is good enough.
>>
>>>    struct csiphy_lane_regs {
>>>        s32 reg_addr;
>>> @@ -423,6 +424,130 @@ csiphy_lane_regs lane_regs_sm8550[] = {
>>>        {0x0C64, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>>    };
>>> +/* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
>>> +static const struct
>>> +csiphy_lane_regs lane_regs_x1e80100[] = {
>>> +    /* Power up lanes 2ph mode */
>>> +    {0x1014, 0xD5, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x101C, 0x7A, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x1018, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +
>>> +    {0x0094, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x00A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0090, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0098, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0094, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0000, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>> +    {0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0094, 0xD7, 0x00, CSIPHY_SKEW_CAL},
>>> +    {0x005C, 0x00, 0x00, CSIPHY_SKEW_CAL},
>>> +    {0x0060, 0xBD, 0x00, CSIPHY_SKEW_CAL},
>>> +    {0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},
>>> +    {0x0064, 0x7F, 0x00, CSIPHY_SKEW_CAL},
>>
>> Double write record, which is anyway ignored, but one should
>> be enough.
> 
> Yes except having the SKEW_CAL definition allows us to import the
> downstream init sequence unmodified.

It's not a technical benefit at all, the expectation is that the upstream
code shall be better than the downstream code.



>>> +
>>> +    {0x0E94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0EA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E28, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E00, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E0C, 0xFF, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E38, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>> +    {0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0E10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>>
>> Writing the same value to a register 4 times in a row, apparently
>> it's not needed, one time write is sufficient.
> 
> To be honest I just took the downstream sequence verbatim.
> 

I believe this could be a support to my words above, quite often
the downstream code is not good enough quality to be copied blindly.

> I'll see if the 4 x has an effect though.
> 

Thank you in advance!

>>> +
>>> +    {0x0494, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x04A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0490, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0498, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0494, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0400, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>> +    {0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0494, 0xD7, 0x00, CSIPHY_SKEW_CAL},
>>> +    {0x045C, 0x00, 0x00, CSIPHY_SKEW_CAL},
>>> +    {0x0460, 0xBD, 0x00, CSIPHY_SKEW_CAL},
>>> +    {0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},
>>> +    {0x0464, 0x7F, 0x00, CSIPHY_SKEW_CAL},
>>
>> Two equal "ignored" writes.
> 
> Again I think these init sequences "do no harm" and its at least
> possible we can improve the logic of our upstream init sequences to make
> these NOPs mean more...
> 
> At they very least they consume time in the APSS wrt the next writes..

I disagree about "do no harm" part, since it caused a severe confusion
on my reader's side, and the next reader will return with the same
currently highlighted problem, if there is a mistake or what the hidden
sense is here.

Here I ask to remove the unused code along with the confusion it brings.

>>
>>> +
>>> +    {0x0894, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x08A0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0890, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0898, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0894, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0830, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0800, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0838, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x082C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0834, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x081C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0814, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x083C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0804, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0820, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0808, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>> +    {0x0810, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0894, 0xD7, 0x00, CSIPHY_SKEW_CAL},
>>> +    {0x085C, 0x00, 0x00, CSIPHY_SKEW_CAL},
>>> +    {0x0860, 0xBD, 0x00, CSIPHY_SKEW_CAL},
>>> +    {0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},
>>> +    {0x0864, 0x7F, 0x00, CSIPHY_SKEW_CAL},
>>
>> Two equal "ignored" writes.
>>
>>> +
>>> +    {0x0C94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0CA0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0C90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0C98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0C94, 0x07, 0x01, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0C30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0C00, 0x8E, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0C38, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0C2C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0C34, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0C1C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0C14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0C3C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0C04, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0C20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0C08, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
>>> +    {0x0C10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
>>> +    {0x0C94, 0xD7, 0x00, CSIPHY_SKEW_CAL},
>>> +    {0x0C5C, 0x00, 0x00, CSIPHY_SKEW_CAL},
>>> +    {0x0C60, 0xBD, 0x00, CSIPHY_SKEW_CAL},
>>> +    {0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},
>>> +    {0x0C64, 0x7F, 0x00, CSIPHY_SKEW_CAL},
>>
>> Two equal "ignored" writes.
>>
>>> +};
>>> +
>>>    static void csiphy_hw_version_read(struct csiphy_device *csiphy,
>>>                       struct device *dev)
>>>    {
>>> @@ -594,6 +719,7 @@ static void csiphy_gen2_config_lanes(struct
>>> csiphy_device *csiphy,
>>>                val = settle_cnt & 0xff;
>>>                break;
>>>            case CSIPHY_DNP_PARAMS:
>>> +        case CSIPHY_SKEW_CAL:
>>
>> Having CSIPHY_DNP_PARAMS is good enough, no need to add another
>> "dummy" write type.
> 
> True but, I'd like to be able to bring in unmodified init sequences from
> downstream.

It might be called reluctance, it's not a good enough reason for the
upstream code, I believe.

> I think there is value in being able to setup the PHYs in the exact same
> configuration.

Removing non-writes and/or using everywhere only one of two types
CSIPHY_DNP_PARAMS/CSIPHY_SKEW_CAL does not change the given by you
point, it's still a setup of "PHYs in the exact same configuration".

> So, I think we should keep the SKEW_CAL support and I'm open to
> experiment reducing repeated DNP/SKEW downwards, perhaps defining a real
> number for the delay instead.
> 

I care a lot about making quite low quality source code of the driver more
simple and comprehensible, while optimization of time needed to copy code
from the downstream could be a movement in quite the opposite direction.

I won't object, if you replace CSIPHY_DNP_PARAMS with CSIPHY_SKEW_CAL in
the driver, but there is no technical reason to keep both types. Again,
I do recognize the non-technical reason to simplify copying from the
downstream, I just claim it as a non-technical reason, which is out of
the engineering duty.

--
Best wishes,
Vladimir

