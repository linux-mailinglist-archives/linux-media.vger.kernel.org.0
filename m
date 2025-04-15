Return-Path: <linux-media+bounces-30233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B228FA89CF2
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 13:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5083F3A3931
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 11:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2801EA7DE;
	Tue, 15 Apr 2025 11:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QyITPYiq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176672951B2
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 11:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718143; cv=none; b=NT1zErgI1hVHrGjGsYjDiCv7lE10vy7r5ZousLM699HYmEjCud9XI6h1EuCV7yZhcUsYMZTaBAh1abV0NuzXoHIsVkpPsxeQEQ1ngXUSSr4gnRx3cG/P8CVhoKNE7ZzKF6hpQvESRakBOnVLY4sUKFaeV3sim8o40EA84WNrv+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718143; c=relaxed/simple;
	bh=r5fb339yxUGM8CyilWTFVmbpJIlJaVu5Kcup4iKzXAY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=N8Vn0gTv1wOEAuwmVkSB2yRtmzqwzmQ/5r3NyIorpVLBPJ+xCmCAhMnnArBBpi5+2YeS4KE3UzeFdF7mx87znm3Wzxy7OBddHIMDhyhBi2KAJ6BknH04CpiK6betLfTeWDINp5X66MAyLeBauR69aYevEs/KHq/7x4k8zPb9Gv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QyITPYiq; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso4334056f8f.1
        for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 04:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744718138; x=1745322938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1//Tc9RCt/lPzgSyNM1qcOBjj4ovpY6rRfsXewF3qI=;
        b=QyITPYiqExTTVbGFAeI6xfLdHjq4y7+4yR/ckXxTFv3u3sIAKoHOEVbHonHFYmCti7
         QrK9dMtr7Te1FtP+IU9SUZMeVw0nZlL22Uqmef19TLuVuIDhYBJFGRtPQeWXlD2MtuKL
         azyioHEeacdLvXqIUoFNg4Wq84eZd4P296gvX7sYGkveOFEjPiY12//FVsfVA9dTEBAN
         7IX+XuM+UphH7+i7qhnaWinawiUiSXvE6TkmziYm0725m2GV6fJicojoqMM9iqj4zPIA
         7JgNXTGKRNMzMebKpkQggR4So2aIVd6r+ggZKH8vioVhM3XRmfDChfKi5m1HG2LcDn43
         gyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744718138; x=1745322938;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O1//Tc9RCt/lPzgSyNM1qcOBjj4ovpY6rRfsXewF3qI=;
        b=PIIOS068SGopSba8jANOHBkqAguGoEcOQe1psMn0Lre3kM6Rz4xFkwr/eQT543GZAZ
         c+LsCqb8PyiBxCBIvbEGGCAAJNV49Y1bZDp0jj4anhzVRfLMKDAM3rqzYUeYEq8SEv3N
         JgKtWz9nnU/UUQNS5aHG9S5yYg0gAwIQmebHGxtSE6PVz2Ull4rwVsngq0pEXTmcZIu8
         LAwkLK+dSTSkQ2sCZxcH4rOUlMc/+tDU9srB1NbcG2VDpc0Rg5wro+R6RY6gTZM32pRT
         0h0IQX6d/HVPF+AmTFjj/59UU5HCStc+/5aZ/TTnPCJS6wsLLMmp07Fe7ts5nZV68cMP
         tF6w==
X-Forwarded-Encrypted: i=1; AJvYcCVwZNwE3hrVOxnh5vF9RPD7lSCbPVNWJJ6Jc67xOW47KVSVsmfbYdOVAz8h5ZGs0GXlf5uD0yoBpBvurw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd+l3IJVBmAxrJOurwHPXsfXNSR+j1lBMeSmSBO1es78uOyQbJ
	8jhGLg3nlKEg3p89ugxs/nlPLPrwTOJIdHjUNQl9gMnyfXCJlT2p2PVsvBO236g=
X-Gm-Gg: ASbGncvU4e2XkctcZFLxeQ+/kQFO6MzFO62uGDpFBkI4uzbP9B51TwmFdeGkn9kYp8B
	eZ8il455vVp5zE8Htvbh8EH2+/6fOacKZiz4pyXTCN6oPoIcIH+sUI7khHsZP0fuVC7N9Y9IAaK
	OyElz2faHS1EHH2JwXZmYXY9aPQTKmRoNuHhaIQCjchHGyIJFhxxVVk736rEX0ilwdKThA4JWkQ
	vTOPrL4SR2jh3Xu0MgJYMSIdP5UMDKFRQE6POXJBxyPvqP/n+ZjuQmEumrTDo8nwY/CP4nGRGQ0
	d7Lq0PruQBCgoFeZXH0zRMUet4Ajmu78aL6vx2IlOgLoUz0fj9tD0hw2TbH1t/OcFxTtA2Jzaui
	zwq0w6UZ0uitFIzl19Q==
X-Google-Smtp-Source: AGHT+IE8VABhTEgYkra8fH8VGKihGQcR1MLPZOhdaSWZOeZ8wgaF5HURgv7CRe2sqzO4PAUbft8tug==
X-Received: by 2002:a5d:47cc:0:b0:39c:140c:308 with SMTP id ffacd0b85a97d-39edc2fdfe8mr2436300f8f.3.1744718138273;
        Tue, 15 Apr 2025 04:55:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ac71:de35:af4b:b8fb? ([2a01:e0a:3d9:2080:ac71:de35:af4b:b8fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5d57sm209107685e9.34.2025.04.15.04.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 04:55:37 -0700 (PDT)
Message-ID: <95c6e3b1-e397-49f9-b841-e91c548793d5@linaro.org>
Date: Tue, 15 Apr 2025 13:55:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v5 0/8] media: qcom: iris: re-organize catalog & add
 support for SM8650
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <2740b178-34cc-4b95-a8da-7e6862cabc92@linaro.org>
 <96953447-cff5-98d4-053e-8cc31778849c@quicinc.com>
 <eb469388-d2f9-447a-aa80-41795991a4ad@linaro.org>
 <5b50ad93-0885-d908-fd13-3a597966115c@quicinc.com>
 <0c4fcd81-8e1f-4b4b-a345-c08caeb599c8@linaro.org>
 <69b2e66c-e9c7-37b5-e395-f7e2fd639261@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <69b2e66c-e9c7-37b5-e395-f7e2fd639261@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 15/04/2025 13:26, Vikash Garodia wrote:
> 
> On 4/15/2025 1:54 PM, neil.armstrong@linaro.org wrote:
>> Hi,
>>
>> On 14/04/2025 21:48, Vikash Garodia wrote:
>>>
>>> On 4/14/2025 5:39 PM, neil.armstrong@linaro.org wrote:
>>>> Hi,
>>>>
>>>> On 14/04/2025 12:54, Vikash Garodia wrote:
>>>>> Hi Neil,
>>>>>
>>>>> On 4/14/2025 1:05 PM, Neil Armstrong wrote:
>>>>>> Hi Vikash, Dikshita,
>>>>>>
>>>>>> On 10/04/2025 18:29, Neil Armstrong wrote:
>>>>>>> Re-organize the platform support core into a gen1 catalog C file
>>>>>>> declaring common platform structure and include platform headers
>>>>>>> containing platform specific entries and iris_platform_data
>>>>>>> structure.
>>>>>>>
>>>>>>> The goal is to share most of the structure while having
>>>>>>> clear and separate per-SoC catalog files.
>>>>>>>
>>>>>>> The organization is based on the curent drm/msm dpu1 catalog
>>>>>>> entries.
>>>>>>
>>>>>> Any feedback on this patchset ?
>>>>> Myself and Dikshita went through the approach you are bringing here, let me
>>>>> update some context here:
>>>>> - sm8550, sm8650, sm8775p, qcs8300 are all irisv3, while qcs8300 is the scaled
>>>>> down variant i.e have 2 PIPE vs others having 4. Similarly there are other
>>>>> irisv3 having 1 pipe as well.
>>>>> - With above variations, firmware and instance caps would change for the
>>>>> variant
>>>>> SOCs.
>>>>> - Above these, few(less) bindings/connections specific delta would be there,
>>>>> like there is reset delta in sm8550 and sm8650.
>>>>>
>>>>> Given above, xxx_gen1.c and xxx_gen2.c can have all binding specific tables and
>>>>> SOC platform data, i.e sm8650_data (for sm8650). On top of this, individual SOC
>>>>> specific .c file can have any delta, from xxx_gen1/2.c) like reset table or
>>>>> preset register table, etc and export these delta structs in xxx_gen1.c or
>>>>> xxx_gen2.c.
>>>>>
>>>>> Going with above approach, sm8650.c would have only one reset table for now.
>>>>> Later if any delta is identified, the same can be added in it. All other common
>>>>> structs, can reside in xxx_gen2.c for now.
>>>>
>>>> Thanks for reviewing, but...
>>>> Sorry I don't understand what you and Dmitry are asking me...
>>>>
>>>> If I try really hard, you would like to have:
>>>>
>>>> iris_catalog_sm8550.c
>>>> - iris_set_sm8550_preset_registers
>>>> - sm8550_icc_table
>>>> - sm8550_clk_reset_table
>>>> - sm8550_bw_table_dec
>>>> - sm8550_pmdomain_table
>>>> - sm8550_opp_pd_table
>>>> - sm8550_clk_table
>>> Move or rename existing 8550.c as xxx_gen2.c. This is with the existing
>>> assumption that everything under 8550.c is common for all gen2 to come in future.
>>>>
>>>> iris_catalog_sm8650.c
>>>> - sm8650_clk_reset_table
>>>> - sm8650_controller_reset_table
>>> yes, since reset is the only delta.
>>>>
>>>> iris_catalog_gen2.c
>>>> - iris_hfi_gen2_command_ops_init
>>>> - iris_hfi_gen2_response_ops_init
>>>> ...
>>>> - sm8550_dec_op_int_buf_tbl
>>>>
>>>> and:
>>>> - struct iris_platform_data sm8550_data
>>>> - struct iris_platform_data sm8650_data
>>> all this goes to xxx_gen2.c as well.
>>
>> Yeah so this is exactly my current approach, except it use .h files
>> for each SoC for simplicity.
>>
>>>
>>>> using data from iris_catalog_sm8550.c & iris_catalog_sm8550.c
>>>>
>>>> So this is basically what I _already_ propose except
>>>> you move data in separate .c files for no reasons,
>>>> please explain why you absolutely want distinct .c
>>>> files per SoC. We are no more in the 1990's and we camn
>>>> defintely have big .c files.
>>> Its not about the size of file alone, it is easy to understand later what would
>>> be the delta in the SOCs and what would common. For ex, just navigating through
>>> sm8650.c, anyone can comment that reset is the delta.
>>
>> What's the problem with the current approach with .h file for each SoC ?
>>
>>>>
>>>> And we still have a big issue, how to get the:
>>>> - ARRAY_SIZE(sm8550_clk_reset_table)
>>>> - ARRAY_SIZE(sm8550_bw_table_dec)
>>>> - ARRAY_SIZE(sm8550_pmdomain_table)
>>>> ...
>>>>
>>>> since they are declared in a separate .c file and you
>>>> need a compile-time const value to fill all the _size
>>>> attribute in iris_platform_data.
>>> I have not tries this, but isn't extern-ing the soc structs (in your case reset
>>> tables) into xxx_gen2.c enough here ? Also i think the tables you are pointing
>>> here, lies in the xxx_gen2.c only, so i am sure above ones would not be an issue
>>> at all. The only delta struct is reset table, lets see if extern helps.
>>
>> No it doesn't, because I wrote C for the last 25 years, and I tried it already,
>> I also tried to export a const int with the table size, and it also doesn't work.
> Got it, i tried too, it didn't work.
>>
>> The 3 only ways are:
>> 1) add defines with sizes for each table
> This leaves manual update everytime.
> 
>> 2) add a NULL entry at the end of each table, and update all code using those
>> tables
> Does not sound right to update the code, just to get the size.
> 
>> 3) declare in the same scope, which is my current proposalThe proposal in the RFC is about moving the common structs to 8550.h, rather, it
> can be kept in xxx_gen2.c.
> 8550.h can have the delta part (i.e reset tables) and can be included in
> xxx_gen2.c. sm8650_data can reside in xxx_gen2.c, soc headers just brings the
> delta structs which can be overridden from common in xxx_gen2.c
> I am good with the header approach which contains the delta over and above
> xxx_gen2.c.

I'll try to do that, but now I don't see the point of the SoC header files if
they only contain the reset tables.

Neil

> 
> Regards,
> Vikash
>> Neil
>>
>>>
>>> Regards,
>>> Vikash
>>>>
>>>> So I recall my goal, I just want to add sm8650 support,
>>>> and I'm not the owner of this driver, and I'm really happy
>>>> to help, but giving me random ideas to solve your problem
>>>> doesn't help us at all going forward.
>>>>
>>>> Neil
>>>>
>>>>>
>>>>> Regards,
>>>>> Vikash
>>>>>>
>>>>>> Thanks,
>>>>>> Neil
>>>>>>
>>>>>>>
>>>>>>> Add support for the IRIS accelerator for the SM8650
>>>>>>> platform, which uses the iris33 hardware.
>>>>>>>
>>>>>>> The vpu33 requires a different reset & poweroff sequence
>>>>>>> in order to properly get out of runtime suspend.
>>>>>>>
>>>>>>> Follow-up of [1]:
>>>>>>> https://lore.kernel.org/all/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org/
>>>>>>>
>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>> ---
>>>>>>> Changes in v4:
>>>>>>> - Reorganized into catalog, rebased sm8650 support on top
>>>>>>> - Link to v4:
>>>>>>> https://lore.kernel.org/all/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org
>>>>>>>
>>>>>>> Changes in v4:
>>>>>>> - collected tags
>>>>>>> - un-split power_off in vpu3x
>>>>>>> - removed useless function defines
>>>>>>> - added back vpu3x disappeared rename commit
>>>>>>> - Link to v3:
>>>>>>> https://lore.kernel.org/r/20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org
>>>>>>>
>>>>>>> Changes in v3:
>>>>>>> - Collected review tags
>>>>>>> - Removed bulky reset_controller ops
>>>>>>> - Removed iris_vpu_power_off_controller split
>>>>>>> - Link to v2:
>>>>>>> https://lore.kernel.org/r/20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org
>>>>>>>
>>>>>>> Changes in v2:
>>>>>>> - Collected bindings review
>>>>>>> - Reworked rest handling by adding a secondary optional table to be used by
>>>>>>> controller poweroff
>>>>>>> - Reworked power_off_controller to be reused and extended by vpu33 support
>>>>>>> - Removed useless and unneeded vpu33 init
>>>>>>> - Moved vpu33 into vpu3x files to reuse code from vpu3
>>>>>>> - Moved sm8650 data table into sm8550
>>>>>>> - Link to v1:
>>>>>>> https://lore.kernel.org/r/20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org
>>>>>>>
>>>>>>> ---
>>>>>>> Neil Armstrong (8):
>>>>>>>           media: qcom: iris: move sm8250 to gen1 catalog
>>>>>>>           media: qcom: iris: move sm8550 to gen2 catalog
>>>>>>>           dt-bindings: media: qcom,sm8550-iris: document SM8650 IRIS
>>>>>>> accelerator
>>>>>>>           media: platform: qcom/iris: add power_off_controller to vpu_ops
>>>>>>>           media: platform: qcom/iris: introduce optional controller_rst_tbl
>>>>>>>           media: platform: qcom/iris: rename iris_vpu3 to iris_vpu3x
>>>>>>>           media: platform: qcom/iris: add support for vpu33
>>>>>>>           media: platform: qcom/iris: add sm8650 support
>>>>>>>
>>>>>>>      .../bindings/media/qcom,sm8550-iris.yaml           |  33 ++-
>>>>>>>      drivers/media/platform/qcom/iris/Makefile          |   6 +-
>>>>>>>      .../media/platform/qcom/iris/iris_catalog_gen1.c   |  83 +++++++
>>>>>>>      ...{iris_platform_sm8550.c => iris_catalog_gen2.c} |  85 +------
>>>>>>>      ...ris_platform_sm8250.c => iris_catalog_sm8250.h} |  80 +-----
>>>>>>>      .../media/platform/qcom/iris/iris_catalog_sm8550.h |  91 +++++++
>>>>>>>      .../media/platform/qcom/iris/iris_catalog_sm8650.h |  68 +++++
>>>>>>>      drivers/media/platform/qcom/iris/iris_core.h       |   1 +
>>>>>>>      .../platform/qcom/iris/iris_platform_common.h      |   3 +
>>>>>>>      drivers/media/platform/qcom/iris/iris_probe.c      |  43 +++-
>>>>>>>      drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
>>>>>>>      drivers/media/platform/qcom/iris/iris_vpu3.c       | 122 ---------
>>>>>>>      drivers/media/platform/qcom/iris/iris_vpu3x.c      | 275
>>>>>>> +++++++++++++++++++++
>>>>>>>      drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +-
>>>>>>>      drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
>>>>>>>      15 files changed, 598 insertions(+), 300 deletions(-)
>>>>>>> ---
>>>>>>> base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
>>>>>>> change-id: 20250410-topic-sm8x50-upstream-iris-catalog-3e2e4a033d6f
>>>>>>>
>>>>>>> Best regards,
>>>>>>
>>>>
>>


