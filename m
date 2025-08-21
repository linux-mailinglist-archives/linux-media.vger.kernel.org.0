Return-Path: <linux-media+bounces-40539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6F8B2F297
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 10:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 660C47AB8E6
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 08:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352912BE048;
	Thu, 21 Aug 2025 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tMK3oWE7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB702D77EF
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755765903; cv=none; b=run7OcXL4Mj4rpgDM2k5csd6MvuoUkQsV3f9mLqIwODjBC+BU8rkXGhuopqyNc9IUSPilLcziDvKTUr/0xOWhqpp2x3imxj4/W5Mht7jkTdWgy1R5Uq5iCvxxBqqVn0rGmMH/f9FWzoaC6oV7cwenw8szUUpUj5O3NPfBTNq/tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755765903; c=relaxed/simple;
	bh=eZGewZmE1n2kwXrwTz+zU0vLkHuK/OFSPIP5fs6SVpY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Cu5y/yTJo/GRAyKqJMzlHje5psdfNW+TwezaBBSp+y6iCb3cxU6ztlGyUM43oYnk7yACJDWW153YCc0BgZDc5CN1I6cBQpZS3GzjutNeu974GICScC3z6ko08Rz9DP2RNNXbiTMmD2gveQqu6D7r3sWqJOrXZ9FbVgxAWtp1FRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tMK3oWE7; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b9e411c820so450697f8f.1
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 01:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755765900; x=1756370700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e35TXGgqyRI8INBP5t0V1q1As4RTM7PmDPjdZXWomKk=;
        b=tMK3oWE7YGGeycBHoS1Ynb0qfyGc0zyxjoOd7z/7yeHulZZELI7jzlJuhrwymv5lEC
         xctRV/9ATsvHJb/X8Ldub+g9M3GOCtW7jMuLBKWrztFQWeMN52jx8fvmZ5tLJ+yCJRvU
         e6W9Da4oj1QMQXx1BXdd9OExPzCnROcA9e33Z9TwwC9ajMNFsdQkV4DkJniDJ4AC0Uw3
         bhzvd5M+qY9KttxWd7+yrdeyYomzn2RPQBR2pdplfmKfHKATTRbPSO/gvQlu7KUeuiUI
         wPGt0L7oS5GYGnI/Ejey7cogFevrmHY4pL/C9i7UNgfY3GOCXyFO7L1Q2/25Ny9H8rji
         kb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755765900; x=1756370700;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e35TXGgqyRI8INBP5t0V1q1As4RTM7PmDPjdZXWomKk=;
        b=Epv8z/NixwQxUOdF0s2e+Qsde8sbJeh5J+LcCbeska2D9NdYaD1+xwHKlWBHg+kuFV
         mrVuSMyCKR9uWwf3dNoK7d0txCu9C3hQuDc+9g5FUEtp8XhuFoatfBFMY2JKV8W+kRMy
         KFH2OiCn/Hepqh2TOVd2gBGRfw2V/+2rUTLwd14KAe1grpFWG6O6xTlGzuIQaFOx/H5J
         Yvk3/CqHdTCy3B1F3ZJubwt8hWC2HCY3tEtigGAVN8+3y2swB9l7U3tUCD16eM82M0FA
         f52OrHTamczZirNWVZ3BACpdBaUaVRTV+cO7+nrsnTO4nYEIxI3cIjf2qQ+RQLBDWZSQ
         ghPA==
X-Gm-Message-State: AOJu0YzUr+OfUaWh8NJWx4cRFzhjP3wdHtxojcxG7mvsKAQzVLs0I3Ym
	nZccRAXO3kk3N7TA8E62Hlm5dkxTD8n1e/HOn4Aosxq3SiBntKRF4aAFzLGZ5CUjSNk=
X-Gm-Gg: ASbGnctheJfVXvOzWn0yjbnDd6PsmaskrxJKTL1GeMlXBNIjfx8aOM7xOcq6mSHLpjX
	YeURovlk7+ksy1A9c8G9Veky7cYS0zb4Ycih9tG2PTyI8qOEngmIge88811zqPV2e/iJHWRxW3D
	JSOMjidOzduHvnO2EgI5A017m/GPsoBHlEJUR3iERTQ4p6j7xc88CWVoW9O4Qk7DIbQBIrQNW7u
	V/9z0sgeO3m0sFGbAZA3jqCBhU1OXZ9DiNfjvVrtU9gQwqWiYv2JHeQQ+YjykTioxHT6wTiLPtg
	IU7YUIXytFnLUwA+91lR45XfhCWfIqotpwB2Nvu7IeOpf3jFkfSQ8i3rFXpJcsps0odNDPTpykm
	yKwaIfEF7JCPG/uwNOqO6Z9GgdpJOA479qtxh2WfwQnwbsTi7C7czhlfnm2aUsR+60JDlE68ROC
	k=
X-Google-Smtp-Source: AGHT+IHCmDvlrpMtyQJ+Qx5FBKwm9zvncJZoqNXzaFRrl4GVWwygtQAi0Zs4Firt+PF0PJBLS03WeQ==
X-Received: by 2002:a05:6000:2385:b0:3b8:d893:5230 with SMTP id ffacd0b85a97d-3c4972741e6mr1057551f8f.47.1755765899892;
        Thu, 21 Aug 2025 01:44:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:443c:3616:7f17:f26d? ([2a01:e0a:3d9:2080:443c:3616:7f17:f26d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0771c19fbsm10830353f8f.41.2025.08.21.01.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 01:44:59 -0700 (PDT)
Message-ID: <086d3bce-b8fa-40fd-8efd-9e457bb01650@linaro.org>
Date: Thu, 21 Aug 2025 10:44:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 00/26] Enable H.264/H.265 encoder support and fixes in
 iris driver common code
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250820-iris-video-encoder-v3-0-80ab0ba58b3d@quicinc.com>
 <9584a286-7d8a-48b0-a65c-7a37ced78ac6@linaro.org>
 <38d56655-cfea-ef3d-46ff-a77d81e35297@quicinc.com>
 <f104c9d8-16ae-64c6-4494-49981ef950ea@quicinc.com>
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
In-Reply-To: <f104c9d8-16ae-64c6-4494-49981ef950ea@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 21/08/2025 09:56, Vikash Garodia wrote:
> 
> On 8/21/2025 12:51 PM, Dikshita Agarwal wrote:
>>> The change occurs around Aug 14 2024, So I checked the downstream driver
>>> and I found that fixes the encoding:
>>> ===========================><=================================================
>>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>>> @@ -863,9 +863,18 @@ static inline
>>>   u32 size_vpss_line_buf(u32 num_vpp_pipes_enc, u32 frame_height_coded,
>>>                         u32 frame_width_coded)
>>>   {
>>> -       return ALIGN(((((((8192) >> 2) << 5) * (num_vpp_pipes_enc)) + 64) +
>>> -                     (((((max_t(u32, (frame_width_coded),
>>> -                                (frame_height_coded)) + 3) >> 2) << 5) +
>>> 256) * 16)), 256);
>>> +       u32 vpss_4tap_top = 0, vpss_4tap_left = 0, vpss_div2_top = 0,
>>> vpss_div2_left = 0, vpss_top_lb = 0, vpss_left_lb = 0, size_left = 0,
>>> size_top = 0;
>>> +
>>> +       vpss_4tap_top = ((((max_t(u32, frame_width_coded,
>>> frame_height_coded) * 2) + 3) >> 2) << 4) + 256;
>>> +       vpss_4tap_left = (((8192 + 3) >> 2) << 5) + 64;
>>> +       vpss_div2_top = (((max_t(u32,frame_width_coded, frame_height_coded)
>>> + 3) >> 2) << 4) + 256;
>>> +       vpss_div2_left = ((((max_t(u32, frame_width_coded,
>>> frame_height_coded)* 2) + 3) >> 2) << 5) + 64;
>>> +       vpss_top_lb = (frame_width_coded + 1) << 3;
>>> +       vpss_left_lb = (frame_height_coded << 3) * num_vpp_pipes_enc;
>>> +       size_left = (vpss_4tap_left + vpss_div2_left) * 2 * num_vpp_pipes_enc;
>>> +       size_top = (vpss_4tap_top + vpss_div2_top) * 2;
>>> +
>>> +       return ALIGN(size_left + size_top + vpss_top_lb + vpss_left_lb,
>>> DMA_ALIGNMENT);
>>>   }
>> Seems this calculation is different for iris3 and iris33, hence you see
>> this issue on SM8650.
>>
>> Updating this calculation in common code will increase the buffer size with
>> from ~400KB to ~2.2 MBs (for 640x480) and even more for higher resolution.
>>
>> @vikash, pls comment if we should update in common code or have this
>> implemented specific for iris33 separately using some ops.
> 
> increasing 1.8 MBs for VGA and assuming it grows further for higher resolution,
> i would recommend to separate it out for line buffer alone.
> 
> Neil,
> We are doing something similar as a preparation for enabling an upcoming SOC,
> maybe let me share the pseudo code offline with you. When you add encode support
> for SM8650, you can raise that change to extend the line buffer calculation for
> iris33.

I don't understand your point, encoding is already enabled with this patchset and
works fine with _old_ firmwares, it just completely fail to encode anything with
the firmware sent on linux-firmware yesterday.

But yes I can provide a fixup patch for vpu33 on top of this serie to be merged in the same
time based on your pseudo code.

Neil

> 
> Regards,
> Vikash


