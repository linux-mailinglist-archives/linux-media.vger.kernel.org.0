Return-Path: <linux-media+bounces-36427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FA7AEFA18
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 15:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59D687A2EBF
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34855274B29;
	Tue,  1 Jul 2025 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wS+QoWaW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B32B264A73
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751375982; cv=none; b=Pig2HJuZfqtS11v11Gaix4TxNF3R+UN7gckf3falHReE/IfPfnuAnuX+jSJ7t9u60crP1kCNrm4vkHP1lqeZTJJJYsnv46sLH4TKMBHcVT7J+ltOvXYGHiqy068vDCzBU5rxfst+ReBVQ1cQmHZv3Wq0PA27HbK8AXrjk9u8H3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751375982; c=relaxed/simple;
	bh=UzT2uInmqyg2RtroVrCYijALhzllqgCfdOFLoK2TCSs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YankbZX3+5ZFnpdZ+7fOH+pNkd/fzEeKKEoOgW5DnrDtx6SZ5TdH+wd0hyyOrLZTQn+E7zAmjQ1grUHgLfl6rkGX7zgl/WyJDlGsal0T0EUJcFdBkhQo0MNS5YFnOska7xCKSnKqu1FXmFHyNV4NJIDEeTXMllgM8T4uP8EblKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wS+QoWaW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso31517635e9.0
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 06:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751375979; x=1751980779; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aj6b3sQtidaOqLPrzQWg9ZM2jLrBucjJMYudkhoSb1g=;
        b=wS+QoWaWHe0p08UjZMvgmisoUljPYrIyFcwU9GmYVJ+6ikKPFb9WdlmN1DgrrJjPH5
         lEHiZ4DCMlRD3IZmIINj5slf+FEOXxmwkAmDQKn9/nXc/sOloCStRi2MRyLnqw7MCX/T
         +fQBDB87/sk7kPk2YjVhdXNq+gy7vOFC9WB2P3kJgUTeWdw9/GCIH3tJ8XCL/rGvKbrd
         8rTQKI/XMgrDRcH8cyIB/YIrkyNEU6Xm45h8UgjIxmUcFD9aOEvKkxpHMzT4aazDVm2I
         fW85mbV/PWyLPj8GJKsE6rUW0OQlHAXFjnx48ZnsSxccoZ2nTD8ui6L55z8wHu6xh4TA
         xqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751375979; x=1751980779;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Aj6b3sQtidaOqLPrzQWg9ZM2jLrBucjJMYudkhoSb1g=;
        b=jE8UPO67shiU+9gkAH6f9CmyormoEUNDZ1g0TR7Q40O/te8PRvHZ9Pzg8jkt6E0H1/
         31m0mL30mbrVqSMoeQdQEFn2aDN4389k705dXW1DxUtqsQmJeycGwtIqolel+yYsDmoZ
         ZUFMZtzowcniIliXVJGLoC3N20kkFst5X1c2UVClLMLGI5t5CBuJmacNj7fsLUnV3D/O
         JgEJ0NMg+HD90xr31g2ZSvWXO9uipTCqtYZk9xcANunkAuAYDLhIQfOp8EoNWwb6yej1
         fkprg+T2VlCvdD3bxdbetdOCAj3Jlhvojiv4ZFFW/iK5eROTpBiXzP5gdaekxVFZ4ABY
         yxbg==
X-Gm-Message-State: AOJu0YylhaDqW9iVlIlQG8SnpHGGuoXdodmyJEVWKUy0EswtBFUuknen
	1L4h0uBtF7TMyNbJUcD8pxHv9tk4DVnZG85CTlrQUDL8lKtMqx3SHY8MDDOrIc32EWY=
X-Gm-Gg: ASbGnctXUY67SkSJxqibY3/f2IpPYDuom9jtroUJp5Tp6toW54NtlVkG6rp3OaCZ66Q
	OIyMMrVcCup75x+8WbTOCwcZgY0nVENB5xGLllQHD13+PuZFPS/wMNoRd9X+fIq7rnsnDikGZBC
	yHM+bTpThdd2lMJ3Y3nba+eTPEVgfCLgcNK3KPFztP/fNJ0xEPk4F1odAlNfCU4TmaTl1K/mNHn
	X/uZcNpILi3+f2FSBsF+7Q5MF7bo6gkEaLrM1aYfx3W//OXLS2hWciT1DwbnvZAUfcLjR6JsNO4
	bYEJZlg2JXFl1wyg5hicST+mXIF+tBn821VVOzCdFn2VYMOVr59ORTLDRpG25TcgMLEyW174R9u
	vPrBAW8dqf0h61AaEnLsk6QkzsObizUlj+GHasdg=
X-Google-Smtp-Source: AGHT+IHbOrLG7ZTlgC1fQj8MjLSN6N7+UwdKWvv+JS57ZhHInruUexjc1h0UnTdlmqAMpCV1dSFYcw==
X-Received: by 2002:a05:6000:4104:b0:3a4:ebc4:45a9 with SMTP id ffacd0b85a97d-3a8f482c07cmr13998087f8f.19.1751375978623;
        Tue, 01 Jul 2025 06:19:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:64d3:1697:3b4d:755c? ([2a01:e0a:3d9:2080:64d3:1697:3b4d:755c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa8fasm13169357f8f.28.2025.07.01.06.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 06:19:38 -0700 (PDT)
Message-ID: <cf53e9c1-7d38-4458-8708-a74852cd594c@linaro.org>
Date: Tue, 1 Jul 2025 15:19:37 +0200
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
In-Reply-To: <79342b8f-4cef-fc48-c40f-5636f868af2e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 01/07/2025 12:23, Vikash Garodia wrote:
> 
> On 6/30/2025 11:34 PM, neil.armstrong@linaro.org wrote:
>> On 27/06/2025 17:48, Vikash Garodia wrote:
>>> This series introduces a sub node "non-pixel" within iris video node.
>>> Video driver registers this sub node as a platform device and configure
>>> it for DMA operations. All non pixel buffers, i.e bitstream, HFI queues
>>> and internal buffers related to bitstream processing, would be managed
>>> by this non_pixel device.
>>>
>>> Purpose to add this sub-node:
>>> Iris device limits the IOVA to an addressable range of 4GiB, and even
>>> within that range, some of the space is used by IO registers, thereby
>>> limiting the available IOVA to even lesser. For certain video usecase,
>>> this limited range in not sufficient enough, hence it brings the need to
>>> extend the possibility of higher IOVA range.
>>>
>>> Video hardware is designed to emit different stream-ID for pixel and
>>> non-pixel buffers, thereby introduce a non-pixel sub node to handle
>>> non-pixel stream-ID into a separate platform device.
>>> With this, both iris and non-pixel device can have IOVA range of
>>> approximately 0-4GiB individually for each device, thereby doubling the
>>> range of addressable IOVA.
>>>
>>> Tested on SM8550 and SA8775p hardwares.
>>>
>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>> ---
>>> Changes in v3:
>>> - Add info about change in iommus binding (Thanks Krzysztof)
>>> - Link to v2:
>>> https://lore.kernel.org/r/20250627-video_cb-v2-0-3931c3f49361@quicinc.com
>>>
>>> Changes in v2:
>>> - Add ref to reserve-memory schema and drop it from redefining it in
>>> iris schema (Thanks Krzysztof)
>>> - Drop underscores and add info about non pixel buffers (Thanks Dmitry)
>>> - Link to v1:
>>> https://lore.kernel.org/r/20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com
>>>
>>> ---
>>> Vikash Garodia (5):
>>>         media: dt-bindings: add non-pixel property in iris schema
>>>         media: iris: register and configure non-pixel node as platform device
>>>         media: iris: use np_dev as preferred DMA device in HFI queue management
>>>         media: iris: select appropriate DMA device for internal buffers
>>>         media: iris: configure DMA device for vb2 queue on OUTPUT plane
>>>
>>>    .../bindings/media/qcom,sm8550-iris.yaml           | 40 ++++++++++++++++-
>>>    drivers/media/platform/qcom/iris/iris_buffer.c     | 15 ++++++-
>>>    drivers/media/platform/qcom/iris/iris_core.h       |  2 +
>>>    drivers/media/platform/qcom/iris/iris_hfi_queue.c  | 20 ++++++---
>>>    drivers/media/platform/qcom/iris/iris_probe.c      | 50 +++++++++++++++++++++-
>>>    drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
>>>    6 files changed, 119 insertions(+), 12 deletions(-)
>>> ---
>>> base-commit: 8d2b7fde56597ca912f5daaf3ab58915458ba1fc
>>> change-id: 20250619-video_cb-ea872d6e6627
>>>
>>> Best regards,
>>
>> I tried the patchset on SM8550 QRD and SM8650 QRD/HDK and the system just reboots
>> a few millisecond after probing iris, no error messages nor reboot to sahara mode.
>>
>> The DT changeset for reference:
>> https://git.codelinaro.org/neil.armstrong/linux/-/commit/e1b3628469c038559a60d310386f006f353e3d59
> 
> I was able to repro this case, the issue was due to a incorrect node name in
> driver. Fixing the name as per binding, fixes the issue for me. I have made the
> comment in your code branch [1], which should fix it for you as well. Please
> share your observations.

Indeed, with:
============><========================================
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 8da2b780395d..06657b42da49 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3264,6 +3264,9 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
                         iommus = <&apps_smmu 0x1947 0>;
                         dma-coherent;

+                       #address-cells = <2>;
+                       #size-cells = <2>;
+
                         /*
                          * IRIS firmware is signed by vendors, only
                          * enable in boards where the proper signed firmware
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b53a9aa5adbf..7ada62ee411e 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5011,6 +5011,9 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,

                         dma-coherent;

+                       #address-cells = <2>;
+                       #size-cells = <2>;
+
                         /*
                          * IRIS firmware is signed by vendors, only
                          * enable in boards where the proper signed firmware
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 8fe87e30bd40..c57645a60bc4 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -136,7 +136,7 @@ static int iris_init_non_pixel_node(struct iris_core *core)
         struct device_node *np_node;
         int ret;

-       np_node = of_get_child_by_name(core->dev->of_node, "non_pixel");
+       np_node = of_get_child_by_name(core->dev->of_node, "non-pixel");
         if (!np_node)
                 return 0;

============><========================================

It boots again and I can run some decodes on 8550 and 8650.

Thanks,
Neil

> 
> Regards,
> Vikash
> 
> [1]
> https://git.codelinaro.org/neil.armstrong/linux/-/commit/e1b3628469c038559a60d310386f006f353e3d59#note_23930047
> 
>>
>> Neil


