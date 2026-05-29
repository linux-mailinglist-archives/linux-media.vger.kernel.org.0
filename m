Return-Path: <linux-media+bounces-63022-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBdPKL9iGWrDvwgAu9opvQ
	(envelope-from <linux-media+bounces-63022-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 11:56:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A84066004F8
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 11:56:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 97C39301426E
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 09:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058643C4579;
	Fri, 29 May 2026 09:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XsHwlxh0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1585A329396
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 09:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048550; cv=none; b=cu+FBvJW6oU4LYvw40X1WMDSBRygdB9BtaYMOcPq/8fJTpNMrRzQZ9809rHo8wZoh2p1VCpB7pvceA5m5vK8fzBLJ7OhJnauUokRhZ892W3o3RpKpkvgSFuj23YwRH62WQXBfMYJtcqDneQAPVBiJR3n9ViDtCCBds7wQHyK6g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048550; c=relaxed/simple;
	bh=d3Z4Z1iJBfrEqHD0Kpt8W1NR0WSMZYbfR2eL2irTvY4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=l93hxZQb9naUfAv3eMWnSFu7wY0/Hq92wKxpIVdRVTvOEqoxKlpxxXqXy+JywiZgdlVz13qlQazjvZCBO4hgAMo3jWF0GkldZsxfmCP1GFPdvxD7GOC+JI6bXtDV7efX2uoyBNoPCgVMARE8OTfsZSNs6umqnQJHu5JlmkYdpEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XsHwlxh0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso63007995e9.2
        for <linux-media@vger.kernel.org>; Fri, 29 May 2026 02:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780048547; x=1780653347; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7yi/3JR1gKrin2QFBbQQL2NOWimtIfwQZrg/mmS3vs=;
        b=XsHwlxh0bfAcSxP6kVwcZEWUEnVF5tki3+XGiukD6yA6m5Bqs+C0XEAC3DC7T9ccUz
         lNKLSVTPaeThgTlGw8T8bM+V3gDOkM0erVttObs63KUC5RyqCJvwlHxpsDy7u/W6kYRB
         IAh7F8YHbtK95D3Njzuj73hZe1GAc/P6otYQCOiWCDM9EUpo9Owhtk6kd9pqX85+F6li
         TFWsxpWGZNbeafXFi1AG0+gZB2Gkn8poEJvgIv5253dd1qiZgRSWwNEdcTGtPdqNnNlc
         3wy6gxYb5OZGUWQiR5tRAeYjsFoAQlVyuH5/yOFslzsazqLjwc8gQXM54WMwNp2fICsA
         yXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780048547; x=1780653347;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7yi/3JR1gKrin2QFBbQQL2NOWimtIfwQZrg/mmS3vs=;
        b=kYuQNVMiMJ+38HZB/QdTUvBIjH3pZ6kkN9yOaYys9CFe1n7fMjxL47Ivc0tHWk5wHc
         7wXdD+c2mFtBYJnZtclEBTNqekhAhpNLMXPjBO1N3aibjmQ4az4c47BQIkhb+4sZ3nU9
         jUcFPI3KMbDE15QH7D6CRDA2KbdNQdlvwQ3oCJf+16Z10nqfOyznkzpP+mf+sMlz7xow
         NeTEzb27r6T/e7axKJtn3lArmH3DPnTVcM6SIwo5M6EOmZ+YXreWnxoONBLKtzLEqQEB
         OOMLkjDfV+NBuppGVnrBEfJsvGX8FWDJ3Va1vVVYtOFSB2l7MWqCVR6IMx3VsJP1nrnv
         qOmw==
X-Gm-Message-State: AOJu0YzHaZ+MJL0vd/+ORIsuYErnoQY687mG+R/4m4hc4Uabrvo1VmEG
	YL0gbKum4V4BcX4GJbglLX8fAfFxeqPVYtZYPVNwjb+cB1J9bmAne/IA/M7QjSdlvOc=
X-Gm-Gg: Acq92OFxlNQvSe5OsQ+uJz9D3m5vSnDm4Zfi0Xc3meOWC+QNH88KSww1egxQ3B8Tsyn
	kKbb8WFe+eIB9A/gUjjV8AtfSGDrPC7GPqWdzoFSTyLLyZLpqWB7vmqQRUzOyh8MuVi1umiLEv6
	3K7o/uBeGABiVFwqtBt3QrecxjZLKAyP9GFa2iEkRkQDV5qgbxXsUTXJr96OYQjGugVIzkWqaGa
	T70kfjwdf0HM+dv+b1nrtPu0pec6Wf/xWjWVFEW0dHrTvl86bvOQp0FBvjWKbe/9h06asoq7U4y
	6rzeE3w6N1Pw8smucY6jNSDtORPHW5/KBjkIsoA5fTaAz3cr6tguygwao+OtYkIBEXMgvc41nrn
	aKnFo+L2srorBT5hW1X2EEDXragn0wwPAGhOWOHfhdfwBskItqKpgS53FDCucwvhfdLIP4v9dNv
	A+oKjoStsCb6/3Pfm9MW/VUZxEtcFmfDZRJtVh5Be9DA==
X-Received: by 2002:a05:600c:4815:b0:488:b187:3c with SMTP id 5b1f17b1804b1-4909c088fd9mr21674855e9.14.1780048546862;
        Fri, 29 May 2026 02:55:46 -0700 (PDT)
Received: from [172.20.10.3] ([37.167.96.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0c39b0sm17345645e9.2.2026.05.29.02.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:55:46 -0700 (PDT)
Message-ID: <3baa753a-f716-45da-b1aa-7406f4092578@linaro.org>
Date: Fri, 29 May 2026 11:55:44 +0200
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
In-Reply-To: <9148913b-a5cd-4730-beff-6c517ac4818e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63022-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,larmoire.org:url,linaro.org:replyto,linaro.org:mid,linaro.org:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: A84066004F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 5/29/26 10:21, Wangao Wang wrote:
> 
> 
> On 2026/5/28 21:26, Neil Armstrong wrote:
>> Hi Wangao,
>>
>> On 5/27/26 06:15, Wangao Wang wrote:
>>> I tested the v4 patch using the gst command you provided earlier. The decoded output still has the previous plane misalignment issue, but all frames are decoded successfully. When viewing the raw data with an image player at 1920x1080 resolution, the first frame looks correct but subsequent frames appear shifted. If viewed at 1920x1088 resolution, there are artifacts at the bottom of each frame. I've attached the images.
>>>
>>> Also, have you tested the 720p case? I can't get it to run on my end.
>>
>> Thanks for the report but I don't have access to the Purwa platform you use,
>> I've run test with multiple resolutions with display using P010
>> and QC10, and ran fluster aswell and all passed on SM8550 and SM8650.
>>
>> I'll test it on the Hamoa T14S I have which should be the closest to purwa,
>> but it uses the same driver setup as SM8550 so I expected it to work the same.
>>
>> Could you indicate which iris firmware you're using ?
>>
>> Could you try passing the fluster h265 main10 test suite with gstreamer ?
>>
>> fluster download -c h.265
>> fluster run -d GStreamer-H.265-V4L2 -ts JCT-VC-HEVC_V1 -q -s -j1
>>
>> The picture you send looks like there's a mismatch with the kernel
>> and firmware setup of planes offsets.
>> Could you check if there's a Purwa specific firmware property
>> to set for 10bit decoding ?
>>
>> Neil
>>
>>>
> 
> Hi Neil,
> 
> I also tested on hamoa, and it has the same issue as purwa. The firmware used on purwa is vpu30_p1_s7.mbn.
> 
> This is the result of fluster:
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WP_MAIN10_B_Toshiba_3       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_A_ericsson_MAIN10_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_A_ericsson_MAIN_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_B_ericsson_MAIN10_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_B_ericsson_MAIN_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_C_ericsson_MAIN10_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_C_ericsson_MAIN_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_D_ericsson_MAIN10_2       ... Error
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_D_ericsson_MAIN_2       ... Error
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_E_ericsson_MAIN10_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_E_ericsson_MAIN_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_F_ericsson_MAIN10_2       ... Success
> [JCT-VC-HEVC_V1] (GStreamer-H.265-V4L2-Gst1.0) WPP_F_ericsson_MAIN_2       ... Success
> 

Ok so this works fine, so I'm really wondering if your main10 HEVC is not properly encoded.

Could you try playing a well know HEVC main10 files ?

For example I just tried the 1080p and 4k 10bit files on Hamoa + fluster and it just worked as expected:
https://larmoire.org/jellyfish/
https://larmoire.org/jellyfish/media/jellyfish-10-mbps-hd-hevc-10bit.mkv
https://larmoire.org/jellyfish/media/jellyfish-120-mbps-4k-uhd-hevc-10bit.mkv

Neil


> 


