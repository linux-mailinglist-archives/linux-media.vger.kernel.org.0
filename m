Return-Path: <linux-media+bounces-36518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A4DAF0D5F
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 09:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 716A2446167
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 07:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CEC1885B8;
	Wed,  2 Jul 2025 07:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XxZLmhI9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D4F230BD4
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 07:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751443176; cv=none; b=cJ5KK+z/1W0qhMLvy8CxQFQhqrE9c8xLiyYkCnNBOA5ppXqIWgoU7BodvcoU5d6xDK5MBso9zReXBOevzqP26mxaTa/77CPR5XqDQydNbV7dBbou+0iKvipX1JtAKn3eOuaFcYbtUpO/DWG4JwIckk43aaawTDLCzz0foQji0d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751443176; c=relaxed/simple;
	bh=gnDCYH3Hn3qAACj7Qo3xiFpK9GdpYBFr8S3p280REIc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qwx02A6NxAJq80SlWfpuUjyu4alAjf1usvFxpDyV+oI2cDVBemWJ+Q7d/+NMWs47o98WMRpaC7i7J/kNvt4icYnGEsTg5iW1cDU8OHKIljvVjRfMSot7gDugFX3+C0SlhEp/GIXi9Q4CxpHqxYaU8MVCdNPulT9RjLNnU/e6W+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XxZLmhI9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so3558737f8f.2
        for <linux-media@vger.kernel.org>; Wed, 02 Jul 2025 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751443172; x=1752047972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snH0sz36on/n0NeqLeMPuFfp9C4kxwCWauag8h9UTpU=;
        b=XxZLmhI9R/jPrl3mQxrvDaYg4ySzgae6iOJhOcIjdfIB9qMFPH8bOiuzjC9wwG++BE
         XNnFtGOXpVllufZEbfRJZ/VBLDUB5nWlc8Le2R+wYJq3uGUGmDmwIklU3WUK6g9qKWIK
         t0QKqVkq/cdSO6XaJzmVdqZ07nO4JMsYlD0/O2iA5+qK98FTwLKv+MyVcsqGudb0QtTZ
         9RNq+jbMmsttW9P19Vq3VFN1xXUQ0Pzbhybhn6tYDbIbcsHczU+m3NAq9zpB1kNnnmMt
         BEc+ebpw5dzVlVcKaqbDu2GlfvKwoBKIAykcWIltHSVxejg4SAm8bQRPOTXNCjtMRNno
         tTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751443172; x=1752047972;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=snH0sz36on/n0NeqLeMPuFfp9C4kxwCWauag8h9UTpU=;
        b=tEEFTIPX+5rE46ZHmrCtrYPROEUbZ66YJXNVEfxCfURa01EqD/0sBL5Nu3a2/pPx/F
         8bz6OKLZ1f61Vnqr89FfZ+Kp7Xbt6RhloyrIo3meLE4qKnN0dhNjYxoO2X3Nt3fh/oDX
         +NBczoT7VK+xJ1qlJGsKQFoWFxNqgiq4FnEBplkcCL8x3g5wSSrp9UwxeLtGcnzfMkBO
         cjjMrF3sxJ4LDxVc4NCJhKxAph27VnQEJnGFKWOGJbdWrKrX2V1TLS/a5sISqRuJB2Z8
         OJPQa10ZhcGt5hbqmgnmOExyqqIGx8saTXJSLGvkk9VMz9bNMtFuUqM0iQWrSAvdJjMQ
         veHA==
X-Gm-Message-State: AOJu0Yy6sknvdUNJ9mRIM2NUPtzmdy8SRZSr0CsbusY/2QSGQGW48dbO
	F8YPCDrnblzfAF1qrSl0Zc2a5GfZzQq/2t5PTQ4tNH6bimv+YEbt9uspPFRVlD9gl04=
X-Gm-Gg: ASbGncvKUpm9Qmv/8LSG0ffoUUX+6Zkmipyv1HceGpRj3RtOkiS45Jklyk/8CfYLBtI
	5SkDGDAYcGTzUjsHv+tFJKg7zmgCkVeS66J/04IL5Ay5ABVlO5nWeMRw4/DHfC3TaYPncgF+3si
	wBb7Op8yrZhSCXd28rcMV63vd6hGMBnZsa9zBST4fawDbbg64y0QgoYsCUqBtK1Pg1X8Neo6bY9
	cWrncczhtGXGdN2CiEzdQmYDVC/p+79dAbOXrcl05Nqe+MY3sZVXiRz7cstnYE1/wc88ohA28sV
	0JQI8iu0peUgZv3neC2px4Ny5nF6DxxmQBn4i/n+R9j0/47KYdnOm3iH33RT845EJA/qiZoqVC3
	SS04fhVYgqlcalEq5EEJNv9S0OHSi44l7wHCaWXs=
X-Google-Smtp-Source: AGHT+IH2yQ+8hxkY2wYf/wQ6ULhOeVF0K5eQQDgKTPlvcCpJ2aPI+GgAcKmU2H5JLFy9yyhKpvhtAA==
X-Received: by 2002:a05:6000:4205:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3b200e2a121mr1241407f8f.49.1751443172178;
        Wed, 02 Jul 2025 00:59:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:50c5:f782:9f70:bac0? ([2a01:e0a:3d9:2080:50c5:f782:9f70:bac0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8e1sm15152992f8f.88.2025.07.02.00.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 00:59:31 -0700 (PDT)
Message-ID: <25afe22d-5165-4f6f-95a5-09d318b07eec@linaro.org>
Date: Wed, 2 Jul 2025 09:59:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <6c5d9ff2-fa59-4151-99fe-3bddae46b507@linaro.org>
 <79342b8f-4cef-fc48-c40f-5636f868af2e@quicinc.com>
 <cf53e9c1-7d38-4458-8708-a74852cd594c@linaro.org>
 <ceeaf6ee-2ff7-5f60-2a59-9b5484f3ac5d@quicinc.com>
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
In-Reply-To: <ceeaf6ee-2ff7-5f60-2a59-9b5484f3ac5d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/07/2025 18:11, Vikash Garodia wrote:
> 
> On 7/1/2025 6:49 PM, Neil Armstrong wrote:
>> Hi,
>>
>> On 01/07/2025 12:23, Vikash Garodia wrote:
>>>
>>> On 6/30/2025 11:34 PM, neil.armstrong@linaro.org wrote:
>>>> On 27/06/2025 17:48, Vikash Garodia wrote:
>>>>> This series introduces a sub node "non-pixel" within iris video node.
>>>>> Video driver registers this sub node as a platform device and configure
>>>>> it for DMA operations. All non pixel buffers, i.e bitstream, HFI queues
>>>>> and internal buffers related to bitstream processing, would be managed
>>>>> by this non_pixel device.
>>>>>
>>>>> Purpose to add this sub-node:
>>>>> Iris device limits the IOVA to an addressable range of 4GiB, and even
>>>>> within that range, some of the space is used by IO registers, thereby
>>>>> limiting the available IOVA to even lesser. For certain video usecase,
>>>>> this limited range in not sufficient enough, hence it brings the need to
>>>>> extend the possibility of higher IOVA range.
>>>>>
>>>>> Video hardware is designed to emit different stream-ID for pixel and
>>>>> non-pixel buffers, thereby introduce a non-pixel sub node to handle
>>>>> non-pixel stream-ID into a separate platform device.
>>>>> With this, both iris and non-pixel device can have IOVA range of
>>>>> approximately 0-4GiB individually for each device, thereby doubling the
>>>>> range of addressable IOVA.
>>>>>
>>>>> Tested on SM8550 and SA8775p hardwares.
>>>>>
>>>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>>>> ---
>>>>> Changes in v3:
>>>>> - Add info about change in iommus binding (Thanks Krzysztof)
>>>>> - Link to v2:
>>>>> https://lore.kernel.org/r/20250627-video_cb-v2-0-3931c3f49361@quicinc.com
>>>>>
>>>>> Changes in v2:
>>>>> - Add ref to reserve-memory schema and drop it from redefining it in
>>>>> iris schema (Thanks Krzysztof)
>>>>> - Drop underscores and add info about non pixel buffers (Thanks Dmitry)
>>>>> - Link to v1:
>>>>> https://lore.kernel.org/r/20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com
>>>>>
>>>>> ---
>>>>> Vikash Garodia (5):
>>>>>          media: dt-bindings: add non-pixel property in iris schema
>>>>>          media: iris: register and configure non-pixel node as platform device
>>>>>          media: iris: use np_dev as preferred DMA device in HFI queue management
>>>>>          media: iris: select appropriate DMA device for internal buffers
>>>>>          media: iris: configure DMA device for vb2 queue on OUTPUT plane
>>>>>
>>>>>     .../bindings/media/qcom,sm8550-iris.yaml           | 40 ++++++++++++++++-
>>>>>     drivers/media/platform/qcom/iris/iris_buffer.c     | 15 ++++++-
>>>>>     drivers/media/platform/qcom/iris/iris_core.h       |  2 +
>>>>>     drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 20 ++++++---
>>>>>     drivers/media/platform/qcom/iris/iris_probe.c      | 50
>>>>> +++++++++++++++++++++-
>>>>>     drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
>>>>>     6 files changed, 119 insertions(+), 12 deletions(-)
>>>>> ---
>>>>> base-commit: 8d2b7fde56597ca912f5daaf3ab58915458ba1fc
>>>>> change-id: 20250619-video_cb-ea872d6e6627
>>>>>
>>>>> Best regards,
>>>>
>>>> I tried the patchset on SM8550 QRD and SM8650 QRD/HDK and the system just
>>>> reboots
>>>> a few millisecond after probing iris, no error messages nor reboot to sahara
>>>> mode.
>>>>
>>>> The DT changeset for reference:
>>>> https://git.codelinaro.org/neil.armstrong/linux/-/commit/e1b3628469c038559a60d310386f006f353e3d59
>>>
>>> I was able to repro this case, the issue was due to a incorrect node name in
>>> driver. Fixing the name as per binding, fixes the issue for me. I have made the
>>> comment in your code branch [1], which should fix it for you as well. Please
>>> share your observations.
>>
>> Indeed, with:
>> ============><========================================
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index 8da2b780395d..06657b42da49 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -3264,6 +3264,9 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>                          iommus = <&apps_smmu 0x1947 0>;
>>                          dma-coherent;
>>
>> +                       #address-cells = <2>;
>> +                       #size-cells = <2>;
>> +
>>                          /*
>>                           * IRIS firmware is signed by vendors, only
>>                           * enable in boards where the proper signed firmware
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index b53a9aa5adbf..7ada62ee411e 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -5011,6 +5011,9 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>
>>                          dma-coherent;
>>
>> +                       #address-cells = <2>;
>> +                       #size-cells = <2>;
>> +
>>                          /*
>>                           * IRIS firmware is signed by vendors, only
>>                           * enable in boards where the proper signed firmware
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c
>> b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 8fe87e30bd40..c57645a60bc4 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -136,7 +136,7 @@ static int iris_init_non_pixel_node(struct iris_core *core)
>>          struct device_node *np_node;
>>          int ret;
>>
>> -       np_node = of_get_child_by_name(core->dev->of_node, "non_pixel");
>> +       np_node = of_get_child_by_name(core->dev->of_node, "non-pixel");
>>          if (!np_node)
>>                  return 0;
>>
>> ============><========================================
>>
>> It boots again and I can run some decodes on 8550 and 8650.
> Nice. Thank you for your efforts in trying out the patches. Would that be ok
> with you if i can put the tested-by tags in next revision with the amendments ?

Sure please add:

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>

with those changes

Neil

> 
> Regards,
> Vikash
>>
>> Thanks,
>> Neil
>>
>>>
>>> Regards,
>>> Vikash
>>>
>>> [1]
>>> https://git.codelinaro.org/neil.armstrong/linux/-/commit/e1b3628469c038559a60d310386f006f353e3d59#note_23930047
>>>
>>>>
>>>> Neil
>>


