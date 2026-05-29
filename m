Return-Path: <linux-media+bounces-63031-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMiEAE+UGWrVxggAu9opvQ
	(envelope-from <linux-media+bounces-63031-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 15:27:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C90602D96
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 15:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83CD630ED0CB
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 13:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7993A330B30;
	Fri, 29 May 2026 13:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E7hY3sj+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4232D063E
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 13:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780061120; cv=none; b=fzp/ekLRGogJoLA1r5f1ImjHXwaN8q0rRWnBNUxN2Nx2gupzk5xu5bpQJ5+iZ6b3o7sgzFsjGSnwmKaMQBuCWnIpyzipxJ8R9StdGys3iOroktMQEWMI/RIXSGCTxVM0OXBK5IRFZ+QqHtZhoDfu0CmxuXQeTV146NZLHHF9Dto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780061120; c=relaxed/simple;
	bh=d7KKPnzPm9xfWtX5IXoUrRCoWBpgnJA98vng90txeRY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SjGAvYccefqam22I5nPZZUh8n2m3gBBoDUK1hYwfcgXuf1kABaOsk4O5TPbr6uWUZ34WFTTwm8NVrczFDGLbPmEfUtrpR19q7B2ZXdocvKprlld8gEkmOaCIQqBFlbI/lLpERSCGxvbY28g0/VELdPvZ3/3abSpfy1ayAhqHy2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E7hY3sj+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-441209fb77eso8605994f8f.1
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 06:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780061118; x=1780665918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STNCrrC3DbEKLdF4CzHB4IbWxshAq6+6AA2N616PCJY=;
        b=E7hY3sj+jqs6ClbWNtD+IQawyebNtJUFGrm6X0mM9qWMbSN+64l/tYhF2ITn+qyGc4
         PPrppPmaKzCd+kfn3UtkOeCZufw6LlFR6u7mWq8MyXfMIwYgublz5W74y22W5aKJR+dv
         eui33oKVc5/OOuTB09N62KTGunk/jGF7h/PYD9dD/9hpTlZKa8TgejLDJO6rnDmrO9kV
         EUWK9CL0xHgb2IxnJpZOJHp0QRQ2PiwyKhb4OphAt/48BpK3Qfnodnam9ERhX2bfZIdz
         f+tV3Lhru5O25D7zNB80C3E8Ah9OrrbJNfsqnmGGSovRR/l8BCJKIKQqrtKlybTI1bFv
         8HOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780061118; x=1780665918;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STNCrrC3DbEKLdF4CzHB4IbWxshAq6+6AA2N616PCJY=;
        b=QhTiuGd9ZaDXsWFD0bgPR6oRnOc1GWjqKjbyPzV9VV2t3VTeUCi7L8VQihAfNBmyIz
         t6/GufEfLIn9zupahQk1cpJYv3HMyGJeVpOLZ1GBfVBeTub5xV2jYjxcH18muyaJqOPS
         vJmVY4pVwVYsDUj3YDkX8QBZGlOZRrPqElES2WCMbdQ1/dW55Gyg+VW9IS84Ewy3vd7t
         duPHHdN8r4bPJrXp8qUpwXOBTIe0dAwgT2O5fVRwG4xUmoP1IDCN9MGrIDJllrK+Y1Z5
         bDgaxR4DHDU5DvblOlYDxfus3fULsgSATYWqxpngEZVvn/yTruoYXxuGcSLvWWBiohWB
         tCwA==
X-Gm-Message-State: AOJu0Ywjn3nQnxFSIvpVXnjcU+ypov7GHTPjPHThcMjUx5QHAlc1mXNj
	fYfC9+RjmbKrwR4P9vv76/vrIJXrOgZCdZbjPB4aP+oJTFLLexnU9VvTYIPk7u36T9A=
X-Gm-Gg: Acq92OEYrzzeZKHyx6/f4ASIcwQbcg3KifCSWJo0vQ8ah0PTjPEZFyD5X0BC9CzHytf
	Z0za/8huyON7rxQyWW/nmgwLzeYuer9ml1yDukI5h8XZkD+e2pdLTWT415DPSK4v2cDPGf4K3Aq
	dhCRFipYGRzIESp4f4g4aDp6YIRakmAJU85DFK7P68kwZi4ckTqkQvkHz+B4UX3VlhSiEnQs+IM
	tY7vza00rCLJ4E1ecuHIRf8SMAleqVCywRAmQw6rwRyy9qOvrGfSF5U8vVmj2ZqITeJJ7Rdrh8m
	UzylDCA3PHqgER6L1MPAGWf9FMgS5LBygMlYyg0oEonwbNghNa0t+fgXVjZq7zyAdFKtg3lGPMZ
	cFQ0ci31jJUciu0noeMQr8XXsGZwMsMw3mMvQMGqbqMRpqKTMlca+j3G6mL+rSwGGZYXZsOfW33
	a9MWTQCJqtl8aeTCuHswi/DkioSrGV2a5XXTJxAlXbb6J3U7adKRIi0RgIeu9gznuhxC3MmDdXk
	XuIVq4moJrhU5tD3A==
X-Received: by 2002:a05:6000:250f:b0:45e:dc63:c7e4 with SMTP id ffacd0b85a97d-45ef138e827mr5368860f8f.25.1780061117430;
        Fri, 29 May 2026 06:25:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b6d0:a628:be51:f552? ([2a01:e0a:106d:1080:b6d0:a628:be51:f552])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a0674sm3282468f8f.8.2026.05.29.06.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 06:25:17 -0700 (PDT)
Message-ID: <0fb85345-ea8c-4294-bf4b-220617c9f089@linaro.org>
Date: Fri, 29 May 2026 15:25:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260521-topic-sm8x50-iris-10bit-decoding-v4-0-8ff8fce3f904@linaro.org>
 <fa26f61e-86b6-4612-afae-7726e3b35c4b@oss.qualcomm.com>
 <12102d68-da35-47ea-a972-28cb6d54ce1c@linaro.org>
 <feb42925-5704-4266-8c3f-aa944fdbed28@oss.qualcomm.com>
 <12da2953-fe51-4999-9656-2b42a7897f91@oss.qualcomm.com>
 <c54e7f34-b3a7-47fa-843a-9930de04599e@linaro.org>
 <9148913b-a5cd-4730-beff-6c517ac4818e@oss.qualcomm.com>
 <3baa753a-f716-45da-b1aa-7406f4092578@linaro.org>
 <88f8519f-31d8-47db-b0d1-f1d0d8c9df1f@oss.qualcomm.com>
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
In-Reply-To: <88f8519f-31d8-47db-b0d1-f1d0d8c9df1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63031-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:replyto,linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,larmoire.org:url];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 71C90602D96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/29/26 12:33, Wangao Wang wrote:
> 
> 
> On 2026/5/29 17:55, Neil Armstrong wrote:
>> Hi,
>>
>> On 5/29/26 10:21, Wangao Wang wrote:
>>>
>>>
>>> On 2026/5/28 21:26, Neil Armstrong wrote:
>>>> Hi Wangao,
>>>>
>>>> On 5/27/26 06:15, Wangao Wang wrote:
>>>>> I tested the v4 patch using the gst command you provided earlier. The decoded output still has the previous plane misalignment issue, but all frames are decoded successfully. When viewing the raw data with an image player at 1920x1080 resolution, the first frame looks correct but subsequent frames appear shifted. If viewed at 1920x1088 resolution, there are artifacts at the bottom of each frame. I've attached the images.
>>>>>
>>>>> Also, have you tested the 720p case? I can't get it to run on my end.
>>>>
>>>> Thanks for the report but I don't have access to the Purwa platform you use,
>>>> I've run test with multiple resolutions with display using P010
>>>> and QC10, and ran fluster aswell and all passed on SM8550 and SM8650.
>>>>
>>>> I'll test it on the Hamoa T14S I have which should be the closest to purwa,
>>>> but it uses the same driver setup as SM8550 so I expected it to work the same.
>>>>
>>>> Could you indicate which iris firmware you're using ?
>>>>
>>>> Could you try passing the fluster h265 main10 test suite with gstreamer ?
>>>>
>>>> fluster download -c h.265
>>>> fluster run -d GStreamer-H.265-V4L2 -ts JCT-VC-HEVC_V1 -q -s -j1
>>>>
>>>> The picture you send looks like there's a mismatch with the kernel
>>>> and firmware setup of planes offsets.
>>>> Could you check if there's a Purwa specific firmware property
>>>> to set for 10bit decoding ?
>>>>
>>>> Neil
>>>>
>>>>>
>>>
>>> Hi Neil,
>>>
>>> I also tested on hamoa, and it has the same issue as purwa. The firmware used on purwa is vpu30_p1_s7.mbn.
>>>
>>> This is the result of fluster:
>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WP_MAIN10_B_Toshiba_3       ... Success
>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_A_ericsson_MAIN10_2       ... Success
>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_A_ericsson_MAIN_2       ... Success
>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_B_ericsson_MAIN10_2       ... Success
>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_B_ericsson_MAIN_2       ... Success
>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_C_ericsson_MAIN10_2       ... Success
>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_C_ericsson_MAIN_2       ... Success
>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_D_ericsson_MAIN10_2       ... Error
>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_D_ericsson_MAIN_2       ... Error
>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_E_ericsson_MAIN10_2       ... Success
>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_E_ericsson_MAIN_2       ... Success
>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_F_ericsson_MAIN10_2       ... Success
>>> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_F_ericsson_MAIN_2       ... Success
>>>
>>
>> Ok so this works fine, so I'm really wondering if your main10 HEVC is not properly encoded.
>>
>> Could you try playing a well know HEVC main10 files ?
>>
>> For example I just tried the 1080p and 4k 10bit files on Hamoa + fluster and it just worked as expected:
>> https://larmoire.org/jellyfish/
>> https://larmoire.org/jellyfish/media/jellyfish-10-mbps-hd-hevc-10bit.mkv
>> https://larmoire.org/jellyfish/media/jellyfish-120-mbps-4k-uhd- hevc-10bit.mkv
>>
>> Neil
>>
>>
>>>
>>
> 
> Could you provide the test commands? I tried both files and the results from gst still show anomalies, but the results from iris_test_app are normal. I'm wondering if there are any additional settings needed on the client side.
> 
> Here are my test commands:
> gst-launch-1.0 -v -m filesrc location=jellyfish-10-mbps-hd-hevc-10bit.mkv ! matroskademux ! h265parse ! v4l2h265dec ! filesink location=1080P_out.yuv
> gst-launch-1.0 -v -m filesrc location=jellyfish-120-mbps-4k-uhd-hevc-10bit.mkv ! matroskademux ! h265parse ! v4l2h265dec ! filesink location=4K_out.yuv
> 

If I run those exact commands, I can correctly visualize the files with:
gst-launch-1.0 -v -m filesrc location=1080P_out.yuv ! rawvideoparse format=p010-10le width=1920 height=1080 frame-size=6266880 ! waylandsink
gst-launch-1.0 -v -m filesrc location=4K_out.yuv ! rawvideoparse format=p010-10le width=3840 height=2160 frame-size=25067520 ! waylandsink

I have to use the decoder full aligned buffer size because gst just dumps the whole v4l2 buffer into filesink and frames are not tighly packed together.

If you want to output tighly packed frames, this worked for me:
gst-launch-1.0 -v -m filesrc location=jellyfish-10-mbps-hd-hevc-10bit.mkv ! matroskademux ! h265parse ! v4l2h265dec ! rawvideoparse format=p010-10le width=1920 height=1080 frame-size=6266880 ! filesink location=1080P_out.yuv
gst-launch-1.0 -v -m filesrc location=jellyfish-120-mbps-4k-uhd-hevc-10bit.mkv.1 ! matroskademux ! h265parse ! v4l2h265dec ! rawvideoparse format=p010-10le width=3840 height=2160 frame-size=25067520 ! filesink location=4K_out.yuv

There's probably a better way I don't know, but in any case gstreamer will only use the "frame-size" portion of each frame and process it.

For example, you can convert it nv12 and dump to file, it will then dump only the nv12 data:
gst-launch-1.0 -v -m filesrc location=jellyfish-10-mbps-hd-hevc-10bit.mkv ! matroskademux ! h265parse ! v4l2h265dec ! videoconvert ! video/x-raw, format=NV12 ! filesink location=1080P_out.yuv
gst-launch-1.0 -v -m filesrc location=1080P_out.yuv ! rawvideoparse format=nv12 width=1920 height=1080 ! waylandsink

If the plane offset/alignment was wrong, the convert frames would be wrong and playback would also be wrong.

Neil

