Return-Path: <linux-media+bounces-31819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC0DAABCC2
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 10:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27AB2507211
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 08:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C001F22D7A8;
	Tue,  6 May 2025 08:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NrdODHxa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245A320B813
	for <linux-media@vger.kernel.org>; Tue,  6 May 2025 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746519149; cv=none; b=XyUT3vcf5M+Tm0fecIXmB2H80hlgezWLeoIddl5FknP5Qg7vbwzWDAC6BISA7gnQRzBo7uLvTrGKyzsTuZl/tVsb5WMFEqTbWE68qe7VGPmeHmlstGYX6oZUSmP7oHts5aGgFRTVUVvOCLIVIIUDS9Uj8yE7Ea4hnPTGfX29vl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746519149; c=relaxed/simple;
	bh=gxvShTntgtd1ROWzULpMcg7qontjSpPC+vJYBzG+jqg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SQae1JcRn9ahTWDTMDTcCiTTH4cnQr+RgFJJH/llRrmzoZPhmebe+xrsaXqzpXuPFAC4CPuWDA0C1nmcUfaS6UscdnfZg1LqBhLKZtuoxFGcz61x0M0qq8w0uU1ARkq9Zu2BuylcaCTTbrPMXLD6FnwZFDuRFYfwHRMAfLdUzXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NrdODHxa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso35233295e9.2
        for <linux-media@vger.kernel.org>; Tue, 06 May 2025 01:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746519144; x=1747123944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1NfPFzMGGWANKR2FIDDvyij7GJ60icSzlYqfQo89ZQ=;
        b=NrdODHxaPK5OlfCb0zDLwPVhZmTvSn6Gkl59/Lz5F2umNOd3W8+tsl00jqOrjIN4wV
         G1gzUDimFJtuJAnUYXSNf1fpfRWjbpWWEgv0+NEnxzvYsx8nUTeyfPW8keSVjsXIqd8O
         LhQeLkZ4Ef1einQvom9IPHFsm46Rek9dhuYjmlaS7bvkxlQvERtFDhFD7hXKvfh0lGZE
         6HZQgsDywJzUwbRok/LuX+YTyjZFxz/VBE+ODqIEOIukEBv93zhKK/ZJgQRH0heAievO
         xf9XYwjIlB617u8VaPrm4Js5sIc5LkIglOtx9v+EfBbjolcrW1zcV9GPcoNxqXl+SY1Q
         jeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746519144; x=1747123944;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p1NfPFzMGGWANKR2FIDDvyij7GJ60icSzlYqfQo89ZQ=;
        b=adkcF8YFy0IfxoTi3xfDSgadj7ldEZJIaerlWj+oxjf90DxJ6pOMRR5YwEVK0zsBL/
         7xQjM5DiwUw3Gb2D7MzYZiWN34+6KSbIGjaE5aWRmqCmCV+b57b812k8chDBcn7p8Lek
         vK6w8cADNvHj+kBKifcNtzx2ERDTgEqmnhwnOULM2REvfw8i1W49wXUYZsJT+pkInbUg
         Q814L5ZdbS6vtSuCd/ttK/LA6Xk1ssM4NGVDryEEXb4o7utJlYvuPfI0Y8GoO/LhlEVa
         TgxVrC7nWM/976ODDKgq6F2VmRjZlxgDK5qU//2NfrQridFELeDLVBDLA+3Gw1b2wZRX
         yFog==
X-Forwarded-Encrypted: i=1; AJvYcCVzWP9w0cYr4io7bEpGCizCYUj11KwY9IZnNAY+HDH6dqu43ikScL4dLGukQI4watIMo+aGnLRtNZS49A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd350M/Fz6iJtAgwCsUgDJvR0UpjdQI1Nd/zaKgnxHqkZSwQMt
	xqLcsTnomTNMq0ZVEzCIJKccQoXyUA8WF1dTPi+g4RBpDzRaGwJvSt8LEig+Swk=
X-Gm-Gg: ASbGncvvTb3cUJiOtjKaksRFBM9vA38rTfys2XwXYHNEU+VMOXJBgALsvMMNI+m0tcx
	QWFgJgR6wXeIRaX8Repd2OTydcDoWrSyYgDGu9QzZOARIUuv4KPpo6R1pUhhDj6jflQnhDtLdp7
	IMzY3UO1f9Os17DpGNciMPb1Wp9nDdoypcgvyPcdZwsvsq3AMy7F6cYOULdCCCtJ5JpIEbk14UV
	Sd0p9TDd/QwV7CZgT4QzcFGmdYNK1T5VDr59M9ru5gwEp1HqJx3FWIpZ96qcEza2a/ahCJNJAR8
	mJ5TnoZ8wrJMoSENjLBTSmem6KLfDZmfEJyExntPw9sU2669huObQu4bOUy3sROpMUa8TLReA4t
	gmYXhu0YsUxGsav3z+48bBJGGmWXx
X-Google-Smtp-Source: AGHT+IHgAIkuRQ9gfDJ8rmMWZjqJoR7TrRoMkh0txh19+PRVuE7mPK9FVTCfJDlDWsz8PKx6/MAAqg==
X-Received: by 2002:a05:600c:5246:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-441bbec23e8mr154922425e9.10.1746519144277;
        Tue, 06 May 2025 01:12:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:127a:7a9e:6ba7:152f? ([2a01:e0a:3d9:2080:127a:7a9e:6ba7:152f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2aecb54sm203836545e9.10.2025.05.06.01.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 01:12:23 -0700 (PDT)
Message-ID: <66f52fdc-ec64-4631-b4ad-1573fee08dd2@linaro.org>
Date: Tue, 6 May 2025 10:12:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 00/23] Add support for HEVC and VP9 codecs in decoder
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com, stable@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <a8de4886-4a18-46a2-9130-9c48d7eb1f83@linaro.org>
 <f519fc86-3a38-9a32-722e-9672746ff81a@quicinc.com>
 <ccf7f0db-2495-48d5-8780-f1122a24e22e@linaro.org>
 <a1053beb-c2b8-54de-75fa-3dca1896e30f@quicinc.com>
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
In-Reply-To: <a1053beb-c2b8-54de-75fa-3dca1896e30f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/05/2025 10:06, Dikshita Agarwal wrote:
> 
> 
> On 5/5/2025 10:10 PM, neil.armstrong@linaro.org wrote:
>> On 02/05/2025 09:34, Dikshita Agarwal wrote:
>>>
>>>
>>> On 5/2/2025 12:55 PM, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> On 01/05/2025 21:13, Dikshita Agarwal wrote:
>>>>> Hi All,
>>>>>
>>>>> This patch series adds initial support for the HEVC(H.265) and VP9
>>>>> codecs in iris decoder. The objective of this work is to extend the
>>>>> decoder's capabilities to handle HEVC and VP9 codec streams,
>>>>> including necessary format handling and buffer management.
>>>>> In addition, the series also includes a set of fixes to address issues
>>>>> identified during testing of these additional codecs.
>>>>>
>>>>> These patches also address the comments and feedback received from the
>>>>> RFC patches previously sent. I have made the necessary improvements
>>>>> based on the community's suggestions.
>>>>>
>>>>> Changes in v3:
>>>>> - Introduced two wrappers with explicit names to handle destroy internal
>>>>> buffers (Nicolas)
>>>>> - Used sub state check instead of introducing new boolean (Vikash)
>>>>> - Addressed other comments (Vikash)
>>>>> - Reorderd patches to have all fixes patches first (Dmitry)
>>>>> - Link to v2:
>>>>> https://lore.kernel.org/r/20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com
>>>>>
>>>>> Changes in v2:
>>>>> - Added Changes to make sure all buffers are released in session close
>>>>> (bryna)
>>>>> - Added tracking for flush responses to fix a timing issue.
>>>>> - Added a handling to fix timing issue in reconfig
>>>>> - Splitted patch 06/20 in two patches (Bryan)
>>>>> - Added missing fixes tag (bryan)
>>>>> - Updated fluster report (Nicolas)
>>>>> - Link to v1:
>>>>> https://lore.kernel.org/r/20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com
>>>>>
>>>>> Changes sinces RFC:
>>>>> - Added additional fixes to address issues identified during further
>>>>> testing.
>>>>> - Moved typo fix to a seperate patch [Neil]
>>>>> - Reordered the patches for better logical flow and clarity [Neil,
>>>>> Dmitry]
>>>>> - Added fixes tag wherever applicable [Neil, Dmitry]
>>>>> - Removed the default case in the switch statement for codecs [Bryan]
>>>>> - Replaced if-else statements with switch-case [Bryan]
>>>>> - Added comments for mbpf [Bryan]
>>>>> - RFC:
>>>>> https://lore.kernel.org/linux-media/20250305104335.3629945-1-quic_dikshita@quicinc.com/
>>>>>
>>>>> This patch series depends on [1] & [2]
>>>>> [1]
>>>>> https://lore.kernel.org/linux-media/20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org/
>>>>> [2]
>>>>> https://lore.kernel.org/linux-media/20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com/
>>>>>
>>>>> These patches are tested on SM8250 and SM8550 with v4l2-ctl and
>>>>> Gstreamer for HEVC and VP9 decoders, at the same time ensured that
>>>>> the existing H264 decoder functionality remains uneffected.
>>>>>
>>>>> Note: 1 of the fluster compliance test is fixed with firmware [3]
>>>>> [3]:
>>>>> https://lore.kernel.org/linux-firmware/1a511921-446d-cdc4-0203-084c88a5dc1e@quicinc.com/T/#u
>>>>>
>>>>> The result of fluster test on SM8550:
>>>>>     131/147 testcases passed while testing JCT-VC-HEVC_V1 with
>>>>>     GStreamer-H.265-V4L2-Gst1.0.
>>>>>     The failing test case:
>>>>>     - 10 testcases failed due to unsupported 10 bit format.
>>>>>       - DBLK_A_MAIN10_VIXS_4
>>>>>       - INITQP_B_Main10_Sony_1
>>>>>       - TSUNEQBD_A_MAIN10_Technicolor_2
>>>>>       - WP_A_MAIN10_Toshiba_3
>>>>>       - WP_MAIN10_B_Toshiba_3
>>>>>       - WPP_A_ericsson_MAIN10_2
>>>>>       - WPP_B_ericsson_MAIN10_2
>>>>>       - WPP_C_ericsson_MAIN10_2
>>>>>       - WPP_E_ericsson_MAIN10_2
>>>>>       - WPP_F_ericsson_MAIN10_2
>>>>>     - 4 testcase failed due to unsupported resolution
>>>>>       - PICSIZE_A_Bossen_1
>>>>>       - PICSIZE_B_Bossen_1
>>>>>       - WPP_D_ericsson_MAIN10_2
>>>>>       - WPP_D_ericsson_MAIN_2
>>>>>     - 2 testcase failed due to CRC mismatch
>>>>>       - RAP_A_docomo_6
>>>>>       - RAP_B_Bossen_2
>>>>>       - BUG reported:
>>>>> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4392
>>>>>         Analysis - First few frames in this discarded by firmware and are
>>>>>         sent to driver with 0 filled length. Driver send such buffers to
>>>>>         client with timestamp 0 and payload set to 0 and
>>>>>         make buf state to VB2_BUF_STATE_ERROR. Such buffers should be
>>>>>         dropped by GST. But instead, the first frame displayed as green
>>>>>         frame and when a valid buffer is sent to client later with same 0
>>>>>         timestamp, its dropped, leading to CRC mismatch for first frame.
>>>>>
>>>>>     235/305 testcases passed while testing VP9-TEST-VECTORS with
>>>>>     GStreamer-VP9-V4L2-Gst1.0.
>>>>>     The failing test case:
>>>>>     - 64 testcases failed due to unsupported resolution
>>>>>       - vp90-2-02-size-08x08.webm
>>>>>       - vp90-2-02-size-08x10.webm
>>>>>       - vp90-2-02-size-08x16.webm
>>>>>       - vp90-2-02-size-08x18.webm
>>>>>       - vp90-2-02-size-08x32.webm
>>>>>       - vp90-2-02-size-08x34.webm
>>>>>       - vp90-2-02-size-08x64.webm
>>>>>       - vp90-2-02-size-08x66.webm
>>>>>       - vp90-2-02-size-10x08.webm
>>>>>       - vp90-2-02-size-10x10.webm
>>>>>       - vp90-2-02-size-10x16.webm
>>>>>       - vp90-2-02-size-10x18.webm
>>>>>       - vp90-2-02-size-10x32.webm
>>>>>       - vp90-2-02-size-10x34.webm
>>>>>       - vp90-2-02-size-10x64.webm
>>>>>       - vp90-2-02-size-10x66.webm
>>>>>       - vp90-2-02-size-16x08.webm
>>>>>       - vp90-2-02-size-16x10.webm
>>>>>       - vp90-2-02-size-16x16.webm
>>>>>       - vp90-2-02-size-16x18.webm
>>>>>       - vp90-2-02-size-16x32.webm
>>>>>       - vp90-2-02-size-16x34.webm
>>>>>       - vp90-2-02-size-16x64.webm
>>>>>       - vp90-2-02-size-16x66.webm
>>>>>       - vp90-2-02-size-18x08.webm
>>>>>       - vp90-2-02-size-18x10.webm
>>>>>       - vp90-2-02-size-18x16.webm
>>>>>       - vp90-2-02-size-18x18.webm
>>>>>       - vp90-2-02-size-18x32.webm
>>>>>       - vp90-2-02-size-18x34.webm
>>>>>       - vp90-2-02-size-18x64.webm
>>>>>       - vp90-2-02-size-18x66.webm
>>>>>       - vp90-2-02-size-32x08.webm
>>>>>       - vp90-2-02-size-32x10.webm
>>>>>       - vp90-2-02-size-32x16.webm
>>>>>       - vp90-2-02-size-32x18.webm
>>>>>       - vp90-2-02-size-32x32.webm
>>>>>       - vp90-2-02-size-32x34.webm
>>>>>       - vp90-2-02-size-32x64.webm
>>>>>       - vp90-2-02-size-32x66.webm
>>>>>       - vp90-2-02-size-34x08.webm
>>>>>       - vp90-2-02-size-34x10.webm
>>>>>       - vp90-2-02-size-34x16.webm
>>>>>       - vp90-2-02-size-34x18.webm
>>>>>       - vp90-2-02-size-34x32.webm
>>>>>       - vp90-2-02-size-34x34.webm
>>>>>       - vp90-2-02-size-34x64.webm
>>>>>       - vp90-2-02-size-34x66.webm
>>>>>       - vp90-2-02-size-64x08.webm
>>>>>       - vp90-2-02-size-64x10.webm
>>>>>       - vp90-2-02-size-64x16.webm
>>>>>       - vp90-2-02-size-64x18.webm
>>>>>       - vp90-2-02-size-64x32.webm
>>>>>       - vp90-2-02-size-64x34.webm
>>>>>       - vp90-2-02-size-64x64.webm
>>>>>       - vp90-2-02-size-64x66.webm
>>>>>       - vp90-2-02-size-66x08.webm
>>>>>       - vp90-2-02-size-66x10.webm
>>>>>       - vp90-2-02-size-66x16.webm
>>>>>       - vp90-2-02-size-66x18.webm
>>>>>       - vp90-2-02-size-66x32.webm
>>>>>       - vp90-2-02-size-66x34.webm
>>>>>       - vp90-2-02-size-66x64.webm
>>>>>       - vp90-2-02-size-66x66.webm
>>>>>     - 2 testcases failed due to unsupported format
>>>>>       - vp91-2-04-yuv422.webm
>>>>>       - vp91-2-04-yuv444.webm
>>>>>     - 1 testcase failed with CRC mismatch
>>>>>       - vp90-2-22-svc_1280x720_3.ivf
>>>>>       - Bug reported:
>>>>> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4371
>>>>>     - 2 testcase failed due to unsupported resolution after sequence change
>>>>>       - vp90-2-21-resize_inter_320x180_5_1-2.webm
>>>>>       - vp90-2-21-resize_inter_320x180_7_1-2.webm
>>>>>     - 1 testcase failed due to unsupported stream
>>>>>       - vp90-2-16-intra-only.webm
>>>>>
>>>>> The result of fluster test on SM8250:
>>>>>     133/147 testcases passed while testing JCT-VC-HEVC_V1 with
>>>>>     GStreamer-H.265-V4L2-Gst1.0.
>>>>>     The failing test case:
>>>>>     - 10 testcases failed due to unsupported 10 bit format.
>>>>>       - DBLK_A_MAIN10_VIXS_4
>>>>>       - INITQP_B_Main10_Sony_1
>>>>>       - TSUNEQBD_A_MAIN10_Technicolor_2
>>>>>       - WP_A_MAIN10_Toshiba_3
>>>>>       - WP_MAIN10_B_Toshiba_3
>>>>>       - WPP_A_ericsson_MAIN10_2
>>>>>       - WPP_B_ericsson_MAIN10_2
>>>>>       - WPP_C_ericsson_MAIN10_2
>>>>>       - WPP_E_ericsson_MAIN10_2
>>>>>       - WPP_F_ericsson_MAIN10_2
>>>>>     - 4 testcase failed due to unsupported resolution
>>>>>       - PICSIZE_A_Bossen_1
>>>>>       - PICSIZE_B_Bossen_1
>>>>>       - WPP_D_ericsson_MAIN10_2
>>>>>       - WPP_D_ericsson_MAIN_2
>>>>>
>>>>>     232/305 testcases passed while testing VP9-TEST-VECTORS with
>>>>>     GStreamer-VP9-V4L2-Gst1.0.
>>>>>     The failing test case:
>>>>>     - 64 testcases failed due to unsupported resolution
>>>>>       - vp90-2-02-size-08x08.webm
>>>>>       - vp90-2-02-size-08x10.webm
>>>>>       - vp90-2-02-size-08x16.webm
>>>>>       - vp90-2-02-size-08x18.webm
>>>>>       - vp90-2-02-size-08x32.webm
>>>>>       - vp90-2-02-size-08x34.webm
>>>>>       - vp90-2-02-size-08x64.webm
>>>>>       - vp90-2-02-size-08x66.webm
>>>>>       - vp90-2-02-size-10x08.webm
>>>>>       - vp90-2-02-size-10x10.webm
>>>>>       - vp90-2-02-size-10x16.webm
>>>>>       - vp90-2-02-size-10x18.webm
>>>>>       - vp90-2-02-size-10x32.webm
>>>>>       - vp90-2-02-size-10x34.webm
>>>>>       - vp90-2-02-size-10x64.webm
>>>>>       - vp90-2-02-size-10x66.webm
>>>>>       - vp90-2-02-size-16x08.webm
>>>>>       - vp90-2-02-size-16x10.webm
>>>>>       - vp90-2-02-size-16x16.webm
>>>>>       - vp90-2-02-size-16x18.webm
>>>>>       - vp90-2-02-size-16x32.webm
>>>>>       - vp90-2-02-size-16x34.webm
>>>>>       - vp90-2-02-size-16x64.webm
>>>>>       - vp90-2-02-size-16x66.webm
>>>>>       - vp90-2-02-size-18x08.webm
>>>>>       - vp90-2-02-size-18x10.webm
>>>>>       - vp90-2-02-size-18x16.webm
>>>>>       - vp90-2-02-size-18x18.webm
>>>>>       - vp90-2-02-size-18x32.webm
>>>>>       - vp90-2-02-size-18x34.webm
>>>>>       - vp90-2-02-size-18x64.webm
>>>>>       - vp90-2-02-size-18x66.webm
>>>>>       - vp90-2-02-size-32x08.webm
>>>>>       - vp90-2-02-size-32x10.webm
>>>>>       - vp90-2-02-size-32x16.webm
>>>>>       - vp90-2-02-size-32x18.webm
>>>>>       - vp90-2-02-size-32x32.webm
>>>>>       - vp90-2-02-size-32x34.webm
>>>>>       - vp90-2-02-size-32x64.webm
>>>>>       - vp90-2-02-size-32x66.webm
>>>>>       - vp90-2-02-size-34x08.webm
>>>>>       - vp90-2-02-size-34x10.webm
>>>>>       - vp90-2-02-size-34x16.webm
>>>>>       - vp90-2-02-size-34x18.webm
>>>>>       - vp90-2-02-size-34x32.webm
>>>>>       - vp90-2-02-size-34x34.webm
>>>>>       - vp90-2-02-size-34x64.webm
>>>>>       - vp90-2-02-size-34x66.webm
>>>>>       - vp90-2-02-size-64x08.webm
>>>>>       - vp90-2-02-size-64x10.webm
>>>>>       - vp90-2-02-size-64x16.webm
>>>>>       - vp90-2-02-size-64x18.webm
>>>>>       - vp90-2-02-size-64x32.webm
>>>>>       - vp90-2-02-size-64x34.webm
>>>>>       - vp90-2-02-size-64x64.webm
>>>>>       - vp90-2-02-size-64x66.webm
>>>>>       - vp90-2-02-size-66x08.webm
>>>>>       - vp90-2-02-size-66x10.webm
>>>>>       - vp90-2-02-size-66x16.webm
>>>>>       - vp90-2-02-size-66x18.webm
>>>>>       - vp90-2-02-size-66x32.webm
>>>>>       - vp90-2-02-size-66x34.webm
>>>>>       - vp90-2-02-size-66x64.webm
>>>>>       - vp90-2-02-size-66x66.webm
>>>>>     - 2 testcases failed due to unsupported format
>>>>>       - vp91-2-04-yuv422.webm
>>>>>       - vp91-2-04-yuv444.webm
>>>>>     - 1 testcase failed with CRC mismatch
>>>>>       - vp90-2-22-svc_1280x720_3.ivf
>>>>>       - Bug raised:
>>>>> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4371
>>>>>     - 5 testcase failed due to unsupported resolution after sequence change
>>>>>       - vp90-2-21-resize_inter_320x180_5_1-2.webm
>>>>>       - vp90-2-21-resize_inter_320x180_7_1-2.webm
>>>>>       - vp90-2-21-resize_inter_320x240_5_1-2.webm
>>>>>       - vp90-2-21-resize_inter_320x240_7_1-2.webm
>>>>>       - vp90-2-18-resize.ivf
>>>>>     - 1 testcase failed with CRC mismatch
>>>>>       - vp90-2-16-intra-only.webm
>>>>>       Analysis: First few frames are marked by firmware as NO_SHOW frame.
>>>>>       Driver make buf state to VB2_BUF_STATE_ERROR for such frames.
>>>>>       Such buffers should be dropped by GST. But instead, the first frame
>>>>>       is being displayed and when a valid buffer is sent to client later
>>>>>       with same timestamp, its dropped, leading to CRC mismatch for first
>>>>>       frame.
>>>>>
>>>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>>> ---
>>>>> Dikshita Agarwal (23):
>>>>>          media: iris: Skip destroying internal buffer if not dequeued
>>>>>          media: iris: Update CAPTURE format info based on OUTPUT format
>>>>>          media: iris: Avoid updating frame size to firmware during reconfig
>>>>>          media: iris: Drop port check for session property response
>>>>>          media: iris: Prevent HFI queue writes when core is in deinit state
>>>>>          media: iris: Remove deprecated property setting to firmware
>>>>>          media: iris: Fix missing function pointer initialization
>>>>>          media: iris: Fix NULL pointer dereference
>>>>>          media: iris: Fix typo in depth variable
>>>>>          media: iris: Track flush responses to prevent premature completion
>>>>>          media: iris: Fix buffer preparation failure during resolution
>>>>> change
>>>>>          media: iris: Add handling for corrupt and drop frames
>>>>>          media: iris: Send V4L2_BUF_FLAG_ERROR for buffers with 0 filled
>>>>> length
>>>>>          media: iris: Add handling for no show frames
>>>>>          media: iris: Improve last flag handling
>>>>>          media: iris: Skip flush on first sequence change
>>>>>          media: iris: Remove redundant buffer count check in stream off
>>>>>          media: iris: Add a comment to explain usage of MBPS
>>>>>          media: iris: Add HEVC and VP9 formats for decoder
>>>>>          media: iris: Add platform capabilities for HEVC and VP9 decoders
>>>>>          media: iris: Set mandatory properties for HEVC and VP9 decoders.
>>>>>          media: iris: Add internal buffer calculation for HEVC and VP9
>>>>> decoders
>>>>>          media: iris: Add codec specific check for VP9 decoder drain
>>>>> handling
>>>>>
>>>>>     drivers/media/platform/qcom/iris/iris_buffer.c     |  35 +-
>>>>>     drivers/media/platform/qcom/iris/iris_buffer.h     |   3 +-
>>>>>     drivers/media/platform/qcom/iris/iris_ctrls.c      |  35 +-
>>>>>     drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
>>>>>     .../platform/qcom/iris/iris_hfi_gen1_command.c     |  48 ++-
>>>>>     .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   5 +-
>>>>>     .../platform/qcom/iris/iris_hfi_gen1_response.c    |  37 +-
>>>>>     .../platform/qcom/iris/iris_hfi_gen2_command.c     | 143 +++++++-
>>>>>     .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   5 +
>>>>>     .../platform/qcom/iris/iris_hfi_gen2_response.c    |  57 ++-
>>>>>     drivers/media/platform/qcom/iris/iris_hfi_queue.c  |   2 +-
>>>>>     drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
>>>>>     .../platform/qcom/iris/iris_platform_common.h      |  28 +-
>>>>>     .../media/platform/qcom/iris/iris_platform_gen2.c  | 198 ++++++++--
>>>>>     .../platform/qcom/iris/iris_platform_qcs8300.h     | 126 +++++--
>>>>>     .../platform/qcom/iris/iris_platform_sm8250.c      |  15 +-
>>>>>     drivers/media/platform/qcom/iris/iris_state.c      |   2 +-
>>>>>     drivers/media/platform/qcom/iris/iris_state.h      |   1 +
>>>>>     drivers/media/platform/qcom/iris/iris_vb2.c        |  18 +-
>>>>>     drivers/media/platform/qcom/iris/iris_vdec.c       | 116 +++---
>>>>>     drivers/media/platform/qcom/iris/iris_vdec.h       |  11 +
>>>>>     drivers/media/platform/qcom/iris/iris_vidc.c       |  36 +-
>>>>>     drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397
>>>>> ++++++++++++++++++++-
>>>>>     drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  46 ++-
>>>>>     24 files changed, 1160 insertions(+), 211 deletions(-)
>>>>> ---
>>>>> base-commit: 398a1b33f1479af35ca915c5efc9b00d6204f8fa
>>>>> change-id: 20250428-qcom-iris-hevc-vp9-eb31f30c3390
>>>>> prerequisite-message-id:
>>>>> <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
>>>>> prerequisite-patch-id: 35f8dae1416977e88c2db7c767800c01822e266e
>>>>> prerequisite-patch-id: 2bba98151ca103aa62a513a0fbd0df7ae64d9868
>>>>> prerequisite-patch-id: 0e43a6d758b5fa5ab921c6aa3c19859e312b47d0
>>>>> prerequisite-patch-id: b7b50aa1657be59fd51c3e53d73382a1ee75a08e
>>>>> prerequisite-patch-id: 30960743105a36f20b3ec4a9ff19e7bca04d6add
>>>>> prerequisite-patch-id: b93c37dc7e09d1631b75387dc1ca90e3066dce17
>>>>> prerequisite-patch-id: afffe7096c8e110a8da08c987983bc4441d39578
>>>>> prerequisite-message-id:
>>>>> <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
>>>>> prerequisite-patch-id: 2e72fe4d11d264db3d42fa450427d30171303c6f
>>>>> prerequisite-patch-id: 3398937a7fabb45934bb98a530eef73252231132
>>>>> prerequisite-patch-id: feda620f147ca14a958c92afdc85a1dc507701ac
>>>>> prerequisite-patch-id: 07ba0745c7d72796567e0a57f5c8e5355a8d2046
>>>>> prerequisite-patch-id: e35b05c527217206ae871aef0d7b0261af0319ea
>>>>>
>>>>> Best regards,
>>>>
>>>> HEVC & VP9 works fine on HDK8550.
>>>>
>>>> But on SM8650-QRD & SM8650-HDK while decoding HEVC, I get:
>>>> [   44.741670] qcom-iris aa00000.video-codec: session error received
>>>> 0x1000005: unknown
>>>> [   44.755724] qcom-iris aa00000.video-codec: session error received
>>>> 0x4000005: insufficient resources
>>>> [   44.776462] qcom-iris aa00000.video-codec: session error received
>>>> 0x4000005: insufficient resources
>>>> [   44.797179] qcom-iris aa00000.video-codec: session error received
>>>> 0x1000005: unknown
>>>> [   44.816630] qcom-iris aa00000.video-codec: session error received
>>>> 0x4000005: insufficient resources
>>>> [   44.837387] qcom-iris aa00000.video-codec: session error received
>>>> 0x1000005: unknown
>>>> [   44.856812] qcom-iris aa00000.video-codec: session error received
>>>> 0x4000005: insufficient resources
>>>> [   44.877576] qcom-iris aa00000.video-codec: session error received
>>>> 0x1000005: unknown
>>>> [   44.897000] qcom-iris aa00000.video-codec: session error received
>>>> 0x4000005: insufficient resources
>>>> [   44.917801] qcom-iris aa00000.video-codec: session error received
>>>> 0x1000009: unknown
>>>> [   44.937254] qcom-iris aa00000.video-codec: session error received
>>>> 0x4000004: invalid operation for current state
>>>> [   44.959128] qcom-iris aa00000.video-codec: session error received
>>>> 0x4000004: invalid operation for current state
>>>> [   44.981025] qcom-iris aa00000.video-codec: session error received
>>>> 0x1000009: unknown
>>>> [   45.000459] qcom-iris aa00000.video-codec: session error received
>>>> 0x4000004: invalid operation for current state
>>>> [   45.022376] qcom-iris aa00000.video-codec: session error received
>>>> 0x1000009: unknown
>>>> [   45.041816] qcom-iris aa00000.video-codec: session error received
>>>> 0x4000004: invalid operation for current state
>>>> [   45.063736] qcom-iris aa00000.video-codec: session error received
>>>> 0x1000009: unknown
>>>> [   45.083167] qcom-iris aa00000.video-codec: session error received
>>>> 0x4000004: invalid operation for current state
>>>> [   45.105459] ------------[ cut here ]------------
>>>> [   45.121152] WARNING: CPU: 6 PID: 573 at
>>>> drivers/media/common/videobuf2/videobuf2-core.c:1827
>>>> vb2_start_streaming+0x100/0x178 [videobuf2_common]
>>>> while VP9 works fine.
>>>>
>>>> Is it a firmware issue ?
>>>>
>>> Looks like resources set to firmware are not sufficient.
>>> I suspect, internal buffers set to firmware are less than what it requires,
>>> this can change for different VPUs. Pls check if there is any difference in
>>> internal buffer calculations between vpu3 and vpu33.
>>
>> I found the fix, it was a difference in buffer calculation, but not for vpu33,
>> but a typo since v2 was right:
>>
>> ========================================><======================================
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> index 2272f0c21683..ee95fd20b794 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> @@ -33,7 +33,7 @@ struct iris_inst;
>>   #define H264_DISPLAY_BUF_SIZE          3328
>>   #define H264_NUM_FRM_INFO              66
>>   #define H265_NUM_TILE_COL 32
>> -#define H265_NUM_TILE_ROW 12
>> +#define H265_NUM_TILE_ROW 128
>>   #define H265_NUM_TILE (H265_NUM_TILE_ROW * H265_NUM_TILE_COL + 1)
>>   #define SIZE_H265D_BSE_CMD_PER_BUF (16 * sizeof(u32))
>> ========================================><======================================
>>
>> This fixes HEVC on SM8650, so with this change VP9 and HEVC works fine, I'm
>> suprised
>> this still works on SM8550 !
>>
> Thanks for checking this.
> but this value has been the same since v1
> https://lore.kernel.org/linux-media/20250408-iris-dec-hevc-vp9-v1-19-acd258778bd6@quicinc.com/\

Yeah indeed I found that in v2 of iris patchset patch 20 the value is right:
https://lore.kernel.org/all/1702899149-21321-21-git-send-email-quic_dikshita@quicinc.com/

Seems the typo appeared on the vp9 & hevc patchset.

> And yes, it works on SM8550, I believe you also tested v3 and confirmed the
> same.
> But anyways, the correct value should be 128 and I confirmed that SM8550
> works with the fix as well.

Good !

> 
>> So please keep VP9 and HEVC enabled on v4.
> Ok


Thanks!
Neil
> 
> Thanks,
> Dikshita
>>
>> Thanks,
>> Neil
>>>
>>> Thanks,
>>> Dikshita
>>>> I've added:
>>>> ========================================><======================================
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>> b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>> index d3026b2bcb70..8c0ab00ab435 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>>> @@ -400,7 +400,7 @@ struct iris_platform_data sm8650_data = {
>>>>           .init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>>>           .init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>>>>           .vpu_ops = &iris_vpu33_ops,
>>>> -       .set_preset_registers = iris_set_sm8550_preset_registers,
>>>> +       .set_preset_registers = iris_set_sm8650_preset_registers,
>>>>           .icc_tbl = sm8550_icc_table,
>>>>           .icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>>>>           .clk_rst_tbl = sm8650_clk_reset_table,
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
>>>> b/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
>>>> index 75e9d572e788..9e2d23f12f75 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
>>>> @@ -10,4 +10,20 @@ static const char * const sm8650_clk_reset_table[] = {
>>>> "bus", "core" };
>>>>
>>>>    static const char * const sm8650_controller_reset_table[] = { "xo" };
>>>>
>>>> +static void iris_set_sm8650_preset_registers(struct iris_core *core)
>>>> +{
>>>> +       writel(0x0, core->reg_base + 0xB0088);
>>>> +       writel(0x33332222, core->reg_base + 0x13030);
>>>> +       writel(0x44444444, core->reg_base + 0x13034);
>>>> +       writel(0x1022, core->reg_base + 0x13038);
>>>> +       writel(0x0, core->reg_base + 0x13040);
>>>> +       writel(0xFFFF, core->reg_base + 0x13048);
>>>> +       writel(0x33332222, core->reg_base + 0x13430);
>>>> +       writel(0x44444444, core->reg_base + 0x13434);
>>>> +       writel(0x1022, core->reg_base + 0x13438);
>>>> +       writel(0x0, core->reg_base + 0x13440);
>>>> +       writel(0xFFFF, core->reg_base + 0x13448);
>>>> +       writel(0x99, core->reg_base + 0xA013C);
>>>> +}
>>>> +
>>>>    #endif
>>>> ========================================><======================================
>>>> and no change, error still occurs with HEVC decoding.
>>>>
>>>> Thanks,
>>>> Neil
>>


