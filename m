Return-Path: <linux-media+bounces-31938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E90ADAADA70
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 10:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E2491885153
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 08:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2E41DE2C9;
	Wed,  7 May 2025 08:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cmu70jpL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116E786348
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746607618; cv=none; b=XsxwgCpXYg/HJ7zQmUmo2lF3Iji4VGqpqF+LZSsPeqwt1TU5+BDC1XkSvESdji6vmbRdpoXy/XS5XLTBXscCQj7kAQGkayb0aG5mo+qfSvxqddo29qFBb3K9oAPfbHmxqD8G5yPKOReGe9BmVinpFGUESxl+LuKvQFLC7uHU0Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746607618; c=relaxed/simple;
	bh=x5CLRqI0jW0I92c0Vpg378VvexkrMaJ752fhOilSstA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RCJbf4+mNKhvAFvQY2I9SDA1Y4Bk9pcpcedZ+WmWLe+3JxhIPqpJ7h1AVLNxcu6l7cwjkoGw4hpOmvX4d+EZAeP/K/X2OsGqEs+HIbSK4a65/6xKzQR//bPN/wdYdsNJ8xAxNfHYXpUpn5mWGmPAxVJgBtCpTblwH9ND9ggGHjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cmu70jpL; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso5945851f8f.0
        for <linux-media@vger.kernel.org>; Wed, 07 May 2025 01:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746607613; x=1747212413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=saHiFQG6lMw7yZN7y9qT5OLWqnhQk0+KYsA3LhaFBfM=;
        b=Cmu70jpLEnqsHV1CJxwYRnwy/rWHx+SGuKAaCzeHTZ9ad53+H5+W2coPCPn8/JwktN
         RxVJGTMcITPg9+LSmYCDx9aVGGfheoUg3S5KDtTYCuD5cn+gPnLWytVkzPaZ44fpv81Z
         8z6WwF85KYtzKcIZUpj+18mmV5POMAn9knriX8fZzcX1Zf7PzJht5CO5Cr2LWqh5TAKe
         eq2k1OpWOUk6WJpj447yyywadN8/kYvrAMoZ4GAHRr0pjEgrvhBVlc7Ijn5el0z/EQ00
         VwkcrYiz3fLStLcj97RS2OiOfzb/QkNtPtdl8IDv/FGax5g5pzjXGtb5kMUyeZEgDkZ2
         aakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746607613; x=1747212413;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=saHiFQG6lMw7yZN7y9qT5OLWqnhQk0+KYsA3LhaFBfM=;
        b=RsJttCKCqH8cuMZW542xTnyP8OeZiirWrxGCzol5T0e1W+1KSJ5bJ+ni1hbFwSyTtc
         2F1G2NeYsYeiL/8uPWNfoN9yeL4Ih7qfx2m+/WzgpDF7zHm8ZDbR8AN5gknhlbIg/g7p
         Q/o365Dd6SY5lSHoStXNRuGVEX4eA2h46z+uHgIqE7CdIGnfsu9F98GQwdScU9rje3Bx
         bl7FkfmK/R2VUZ472jPgd3e1KsO44TtaqMbYYg7kZ9sf5WPcfE/P3E0pPSKTikS8iwwB
         AomPjD7l8J73QzGyJzSYVFa4uibJRjaKyFXbsvhNuNvcwJWjuLxGDjUPNj/LwC3o5L5C
         aSbg==
X-Gm-Message-State: AOJu0YzjWDbOvCTzNnXtLlVYk4dNK7eXm3AY37VDEG9YZA8KMN+ZupRO
	ZklNRjKvwlOj8qeja+BUsqMIcbMsEMYtZwFkivrqrikYxwGgI4U6T45pxH+MlS8=
X-Gm-Gg: ASbGncuyfCC3FDw17KRWrFFDWixrS5VDdi0nwoqYw9+6z06nOd5D+joKncr8NWh2NkV
	FJ2UxmaLRNmL5gm8GkS48lqskulUnXwjhkjIDy0w2IjBoBOQkaotdMKN8wJ8lzdSqmgPRTYkL9J
	PpUe1dvjNMrN+BX/IpW/TjGJqbarvC52WRZ9LwPxb9awI45dlIblze4n+Z0XJELYdv6+rmavAdR
	l+q2/jSgPvDZXrwEC7Uhr+/YCJfyzuaTZro2Zd9h0r/8CUoyQahVftl0+Y/zNlMnCSEyuhyxgBQ
	ZM9nGymIug0vhuq+PH8hfi4WDc7PIWNHpQ3h3DbkKLZunG4i2HZ8yHNjuL8Weuq7nyq2cohjesS
	D5bzhUJ9Iz46ZKIsmIA==
X-Google-Smtp-Source: AGHT+IE89Y8dFKHoZfzuClZrsZkTl063WIIVBIGFxCm/RclfwpVx/Vjki0iJYIaOuVBX3BgFjbRNYw==
X-Received: by 2002:a5d:5f96:0:b0:3a0:a123:eaf6 with SMTP id ffacd0b85a97d-3a0b49f1780mr2024267f8f.38.1746607613272;
        Wed, 07 May 2025 01:46:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:784f:3312:6406:12a9? ([2a01:e0a:3d9:2080:784f:3312:6406:12a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae831esm16496776f8f.57.2025.05.07.01.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 01:46:52 -0700 (PDT)
Message-ID: <71b45a94-3ef6-4706-9d78-803372f87b96@linaro.org>
Date: Wed, 7 May 2025 10:46:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 00/25] Add support for HEVC and VP9 codecs in decoder
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org
References: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
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
In-Reply-To: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2025 09:39, Dikshita Agarwal wrote:
> Hi All,
> 
> This patch series adds initial support for the HEVC(H.265) and VP9
> codecs in iris decoder. The objective of this work is to extend the
> decoder's capabilities to handle HEVC and VP9 codec streams,
> including necessary format handling and buffer management.
> In addition, the series also includes a set of fixes to address issues
> identified during testing of these additional codecs.
> 
> These patches also address the comments and feedback received from the
> RFC patches previously sent. I have made the necessary improvements
> based on the community's suggestions.
> 
> Changes in v4:
> - Splitted patch patch 06/23 in two patches (Bryan)
> - Simplified the conditional logic in patch 13/23 (Bryan)
> - Improved commit description for patch patch 13/23 (Nicolas)
> - Fix the value of H265_NUM_TILE_ROW macro (Neil)
> - Link to v3: https://lore.kernel.org/r/20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com
> 
> Changes in v3:
> - Introduced two wrappers with explicit names to handle destroy internal
> buffers (Nicolas)
> - Used sub state check instead of introducing new boolean (Vikash)
> - Addressed other comments (Vikash)
> - Reorderd patches to have all fixes patches first (Dmitry)
> - Link to v2:
> https://lore.kernel.org/r/20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com
> 
> Changes in v2:
> - Added Changes to make sure all buffers are released in session close
> (bryna)
> - Added tracking for flush responses to fix a timing issue.
> - Added a handling to fix timing issue in reconfig
> - Splitted patch 06/20 in two patches (Bryan)
> - Added missing fixes tag (bryan)
> - Updated fluster report (Nicolas)
> - Link to v1:
> https://lore.kernel.org/r/20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com
> 
> Changes sinces RFC:
> - Added additional fixes to address issues identified during further
> testing.
> - Moved typo fix to a seperate patch [Neil]
> - Reordered the patches for better logical flow and clarity [Neil,
> Dmitry]
> - Added fixes tag wherever applicable [Neil, Dmitry]
> - Removed the default case in the switch statement for codecs [Bryan]
> - Replaced if-else statements with switch-case [Bryan]
> - Added comments for mbpf [Bryan]
> - RFC:
> https://lore.kernel.org/linux-media/20250305104335.3629945-1-quic_dikshita@quicinc.com/
> 
> This patch series depends on [1] & [2]
> [1]
> https://lore.kernel.org/linux-media/20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org/
> [2]
> https://lore.kernel.org/linux-media/20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com/
> 
> These patches are tested on SM8250 and SM8550 with v4l2-ctl and
> Gstreamer for HEVC and VP9 decoders, at the same time ensured that
> the existing H264 decoder functionality remains uneffected.
> 
> Note: 1 of the fluster compliance test is fixed with firmware [3]
> [3]:
> https://lore.kernel.org/linux-firmware/1a511921-446d-cdc4-0203-084c88a5dc1e@quicinc.com/T/#u
> 
> The result of fluster test on SM8550:
>   131/147 testcases passed while testing JCT-VC-HEVC_V1 with
>   GStreamer-H.265-V4L2-Gst1.0.
>   The failing test case:
>   - 10 testcases failed due to unsupported 10 bit format.
>     - DBLK_A_MAIN10_VIXS_4
>     - INITQP_B_Main10_Sony_1
>     - TSUNEQBD_A_MAIN10_Technicolor_2
>     - WP_A_MAIN10_Toshiba_3
>     - WP_MAIN10_B_Toshiba_3
>     - WPP_A_ericsson_MAIN10_2
>     - WPP_B_ericsson_MAIN10_2
>     - WPP_C_ericsson_MAIN10_2
>     - WPP_E_ericsson_MAIN10_2
>     - WPP_F_ericsson_MAIN10_2
>   - 4 testcase failed due to unsupported resolution
>     - PICSIZE_A_Bossen_1
>     - PICSIZE_B_Bossen_1
>     - WPP_D_ericsson_MAIN10_2
>     - WPP_D_ericsson_MAIN_2
>   - 2 testcase failed due to CRC mismatch
>     - RAP_A_docomo_6
>     - RAP_B_Bossen_2
>     - BUG reported:
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4392
>       Analysis - First few frames in this discarded by firmware and are
>       sent to driver with 0 filled length. Driver send such buffers to
>       client with timestamp 0 and payload set to 0 and
>       make buf state to VB2_BUF_STATE_ERROR. Such buffers should be
>       dropped by GST. But instead, the first frame displayed as green
>       frame and when a valid buffer is sent to client later with same 0
>       timestamp, its dropped, leading to CRC mismatch for first frame.
> 
>   235/305 testcases passed while testing VP9-TEST-VECTORS with
>   GStreamer-VP9-V4L2-Gst1.0.
>   The failing test case:
>   - 64 testcases failed due to unsupported resolution
>     - vp90-2-02-size-08x08.webm
>     - vp90-2-02-size-08x10.webm
>     - vp90-2-02-size-08x16.webm
>     - vp90-2-02-size-08x18.webm
>     - vp90-2-02-size-08x32.webm
>     - vp90-2-02-size-08x34.webm
>     - vp90-2-02-size-08x64.webm
>     - vp90-2-02-size-08x66.webm
>     - vp90-2-02-size-10x08.webm
>     - vp90-2-02-size-10x10.webm
>     - vp90-2-02-size-10x16.webm
>     - vp90-2-02-size-10x18.webm
>     - vp90-2-02-size-10x32.webm
>     - vp90-2-02-size-10x34.webm
>     - vp90-2-02-size-10x64.webm
>     - vp90-2-02-size-10x66.webm
>     - vp90-2-02-size-16x08.webm
>     - vp90-2-02-size-16x10.webm
>     - vp90-2-02-size-16x16.webm
>     - vp90-2-02-size-16x18.webm
>     - vp90-2-02-size-16x32.webm
>     - vp90-2-02-size-16x34.webm
>     - vp90-2-02-size-16x64.webm
>     - vp90-2-02-size-16x66.webm
>     - vp90-2-02-size-18x08.webm
>     - vp90-2-02-size-18x10.webm
>     - vp90-2-02-size-18x16.webm
>     - vp90-2-02-size-18x18.webm
>     - vp90-2-02-size-18x32.webm
>     - vp90-2-02-size-18x34.webm
>     - vp90-2-02-size-18x64.webm
>     - vp90-2-02-size-18x66.webm
>     - vp90-2-02-size-32x08.webm
>     - vp90-2-02-size-32x10.webm
>     - vp90-2-02-size-32x16.webm
>     - vp90-2-02-size-32x18.webm
>     - vp90-2-02-size-32x32.webm
>     - vp90-2-02-size-32x34.webm
>     - vp90-2-02-size-32x64.webm
>     - vp90-2-02-size-32x66.webm
>     - vp90-2-02-size-34x08.webm
>     - vp90-2-02-size-34x10.webm
>     - vp90-2-02-size-34x16.webm
>     - vp90-2-02-size-34x18.webm
>     - vp90-2-02-size-34x32.webm
>     - vp90-2-02-size-34x34.webm
>     - vp90-2-02-size-34x64.webm
>     - vp90-2-02-size-34x66.webm
>     - vp90-2-02-size-64x08.webm
>     - vp90-2-02-size-64x10.webm
>     - vp90-2-02-size-64x16.webm
>     - vp90-2-02-size-64x18.webm
>     - vp90-2-02-size-64x32.webm
>     - vp90-2-02-size-64x34.webm
>     - vp90-2-02-size-64x64.webm
>     - vp90-2-02-size-64x66.webm
>     - vp90-2-02-size-66x08.webm
>     - vp90-2-02-size-66x10.webm
>     - vp90-2-02-size-66x16.webm
>     - vp90-2-02-size-66x18.webm
>     - vp90-2-02-size-66x32.webm
>     - vp90-2-02-size-66x34.webm
>     - vp90-2-02-size-66x64.webm
>     - vp90-2-02-size-66x66.webm
>   - 2 testcases failed due to unsupported format
>     - vp91-2-04-yuv422.webm
>     - vp91-2-04-yuv444.webm
>   - 1 testcase failed with CRC mismatch
>     - vp90-2-22-svc_1280x720_3.ivf
>     - Bug reported:
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4371
>   - 2 testcase failed due to unsupported resolution after sequence change
>     - vp90-2-21-resize_inter_320x180_5_1-2.webm
>     - vp90-2-21-resize_inter_320x180_7_1-2.webm
>   - 1 testcase failed due to unsupported stream
>     - vp90-2-16-intra-only.webm
> 
> The result of fluster test on SM8250:
>   133/147 testcases passed while testing JCT-VC-HEVC_V1 with
>   GStreamer-H.265-V4L2-Gst1.0.
>   The failing test case:
>   - 10 testcases failed due to unsupported 10 bit format.
>     - DBLK_A_MAIN10_VIXS_4
>     - INITQP_B_Main10_Sony_1
>     - TSUNEQBD_A_MAIN10_Technicolor_2
>     - WP_A_MAIN10_Toshiba_3
>     - WP_MAIN10_B_Toshiba_3
>     - WPP_A_ericsson_MAIN10_2
>     - WPP_B_ericsson_MAIN10_2
>     - WPP_C_ericsson_MAIN10_2
>     - WPP_E_ericsson_MAIN10_2
>     - WPP_F_ericsson_MAIN10_2
>   - 4 testcase failed due to unsupported resolution
>     - PICSIZE_A_Bossen_1
>     - PICSIZE_B_Bossen_1
>     - WPP_D_ericsson_MAIN10_2
>     - WPP_D_ericsson_MAIN_2
> 
>   232/305 testcases passed while testing VP9-TEST-VECTORS with
>   GStreamer-VP9-V4L2-Gst1.0.
>   The failing test case:
>   - 64 testcases failed due to unsupported resolution
>     - vp90-2-02-size-08x08.webm
>     - vp90-2-02-size-08x10.webm
>     - vp90-2-02-size-08x16.webm
>     - vp90-2-02-size-08x18.webm
>     - vp90-2-02-size-08x32.webm
>     - vp90-2-02-size-08x34.webm
>     - vp90-2-02-size-08x64.webm
>     - vp90-2-02-size-08x66.webm
>     - vp90-2-02-size-10x08.webm
>     - vp90-2-02-size-10x10.webm
>     - vp90-2-02-size-10x16.webm
>     - vp90-2-02-size-10x18.webm
>     - vp90-2-02-size-10x32.webm
>     - vp90-2-02-size-10x34.webm
>     - vp90-2-02-size-10x64.webm
>     - vp90-2-02-size-10x66.webm
>     - vp90-2-02-size-16x08.webm
>     - vp90-2-02-size-16x10.webm
>     - vp90-2-02-size-16x16.webm
>     - vp90-2-02-size-16x18.webm
>     - vp90-2-02-size-16x32.webm
>     - vp90-2-02-size-16x34.webm
>     - vp90-2-02-size-16x64.webm
>     - vp90-2-02-size-16x66.webm
>     - vp90-2-02-size-18x08.webm
>     - vp90-2-02-size-18x10.webm
>     - vp90-2-02-size-18x16.webm
>     - vp90-2-02-size-18x18.webm
>     - vp90-2-02-size-18x32.webm
>     - vp90-2-02-size-18x34.webm
>     - vp90-2-02-size-18x64.webm
>     - vp90-2-02-size-18x66.webm
>     - vp90-2-02-size-32x08.webm
>     - vp90-2-02-size-32x10.webm
>     - vp90-2-02-size-32x16.webm
>     - vp90-2-02-size-32x18.webm
>     - vp90-2-02-size-32x32.webm
>     - vp90-2-02-size-32x34.webm
>     - vp90-2-02-size-32x64.webm
>     - vp90-2-02-size-32x66.webm
>     - vp90-2-02-size-34x08.webm
>     - vp90-2-02-size-34x10.webm
>     - vp90-2-02-size-34x16.webm
>     - vp90-2-02-size-34x18.webm
>     - vp90-2-02-size-34x32.webm
>     - vp90-2-02-size-34x34.webm
>     - vp90-2-02-size-34x64.webm
>     - vp90-2-02-size-34x66.webm
>     - vp90-2-02-size-64x08.webm
>     - vp90-2-02-size-64x10.webm
>     - vp90-2-02-size-64x16.webm
>     - vp90-2-02-size-64x18.webm
>     - vp90-2-02-size-64x32.webm
>     - vp90-2-02-size-64x34.webm
>     - vp90-2-02-size-64x64.webm
>     - vp90-2-02-size-64x66.webm
>     - vp90-2-02-size-66x08.webm
>     - vp90-2-02-size-66x10.webm
>     - vp90-2-02-size-66x16.webm
>     - vp90-2-02-size-66x18.webm
>     - vp90-2-02-size-66x32.webm
>     - vp90-2-02-size-66x34.webm
>     - vp90-2-02-size-66x64.webm
>     - vp90-2-02-size-66x66.webm
>   - 2 testcases failed due to unsupported format
>     - vp91-2-04-yuv422.webm
>     - vp91-2-04-yuv444.webm
>   - 1 testcase failed with CRC mismatch
>     - vp90-2-22-svc_1280x720_3.ivf
>     - Bug raised:
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4371
>   - 5 testcase failed due to unsupported resolution after sequence change
>     - vp90-2-21-resize_inter_320x180_5_1-2.webm
>     - vp90-2-21-resize_inter_320x180_7_1-2.webm
>     - vp90-2-21-resize_inter_320x240_5_1-2.webm
>     - vp90-2-21-resize_inter_320x240_7_1-2.webm
>     - vp90-2-18-resize.ivf
>   - 1 testcase failed with CRC mismatch
>     - vp90-2-16-intra-only.webm
>     Analysis: First few frames are marked by firmware as NO_SHOW frame.
>     Driver make buf state to VB2_BUF_STATE_ERROR for such frames.
>     Such buffers should be dropped by GST. But instead, the first frame
>     is being displayed and when a valid buffer is sent to client later
>     with same timestamp, its dropped, leading to CRC mismatch for first
>     frame.
> 
> To: Vikash Garodia <quic_vgarodia@quicinc.com>
> To: Abhinav Kumar <quic_abhinavk@quicinc.com>
> To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Hans Verkuil <hverkuil@xs4all.nl>
> To: Stefan Schmidt <stefan.schmidt@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
> Dikshita Agarwal (25):
>        media: iris: Skip destroying internal buffer if not dequeued
>        media: iris: Update CAPTURE format info based on OUTPUT format
>        media: iris: Avoid updating frame size to firmware during reconfig
>        media: iris: Drop port check for session property response
>        media: iris: Prevent HFI queue writes when core is in deinit state
>        media: iris: Remove error check for non-zero v4l2 controls
>        media: iris: Remove deprecated property setting to firmware
>        media: iris: Fix missing function pointer initialization
>        media: iris: Fix NULL pointer dereference
>        media: iris: Fix typo in depth variable
>        media: iris: Track flush responses to prevent premature completion
>        media: iris: Fix buffer preparation failure during resolution change
>        media: iris: Send V4L2_BUF_FLAG_ERROR for capture buffers with 0 filled length
>        media: iris: Skip flush on first sequence change
>        media: iris: Remove unnecessary re-initialization of flush completion
>        media: iris: Add handling for corrupt and drop frames
>        media: iris: Add handling for no show frames
>        media: iris: Improve last flag handling
>        media: iris: Remove redundant buffer count check in stream off
>        media: iris: Add a comment to explain usage of MBPS
>        media: iris: Add HEVC and VP9 formats for decoder
>        media: iris: Add platform capabilities for HEVC and VP9 decoders
>        media: iris: Set mandatory properties for HEVC and VP9 decoders.
>        media: iris: Add internal buffer calculation for HEVC and VP9 decoders
>        media: iris: Add codec specific check for VP9 decoder drain handling
> 
>   drivers/media/platform/qcom/iris/iris_buffer.c     |  35 +-
>   drivers/media/platform/qcom/iris/iris_buffer.h     |   3 +-
>   drivers/media/platform/qcom/iris/iris_ctrls.c      |  35 +-
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |  48 ++-
>   .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   5 +-
>   .../platform/qcom/iris/iris_hfi_gen1_response.c    |  37 +-
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 143 +++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   5 +
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  56 ++-
>   drivers/media/platform/qcom/iris/iris_hfi_queue.c  |   2 +-
>   drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
>   .../platform/qcom/iris/iris_platform_common.h      |  28 +-
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 198 ++++++++--
>   .../platform/qcom/iris/iris_platform_qcs8300.h     | 126 +++++--
>   .../platform/qcom/iris/iris_platform_sm8250.c      |  15 +-
>   drivers/media/platform/qcom/iris/iris_state.c      |   2 +-
>   drivers/media/platform/qcom/iris/iris_state.h      |   1 +
>   drivers/media/platform/qcom/iris/iris_vb2.c        |  18 +-
>   drivers/media/platform/qcom/iris/iris_vdec.c       | 116 +++---
>   drivers/media/platform/qcom/iris/iris_vdec.h       |  11 +
>   drivers/media/platform/qcom/iris/iris_vidc.c       |  36 +-
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397 ++++++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  46 ++-
>   24 files changed, 1159 insertions(+), 211 deletions(-)
> ---
> base-commit: 398a1b33f1479af35ca915c5efc9b00d6204f8fa
> change-id: 20250507-video-iris-hevc-vp9-59096b189050
> prerequisite-message-id: <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>
> prerequisite-patch-id: afffe7096c8e110a8da08c987983bc4441d39578
> prerequisite-patch-id: b93c37dc7e09d1631b75387dc1ca90e3066dce17
> prerequisite-patch-id: b7b50aa1657be59fd51c3e53d73382a1ee75a08e
> prerequisite-patch-id: 30960743105a36f20b3ec4a9ff19e7bca04d6add
> prerequisite-patch-id: 2bba98151ca103aa62a513a0fbd0df7ae64d9868
> prerequisite-patch-id: 0e43a6d758b5fa5ab921c6aa3c19859e312b47d0
> prerequisite-patch-id: 35f8dae1416977e88c2db7c767800c01822e266e
> prerequisite-message-id: <20250501-qcs8300_iris-v7-0-b229d5347990@quicinc.com>
> prerequisite-patch-id: e35b05c527217206ae871aef0d7b0261af0319ea
> prerequisite-patch-id: 07ba0745c7d72796567e0a57f5c8e5355a8d2046
> prerequisite-patch-id: 3398937a7fabb45934bb98a530eef73252231132
> prerequisite-patch-id: 500bc3b8391940d3ebca222d2098b737414b2af4
> prerequisite-patch-id: 2e72fe4d11d264db3d42fa450427d30171303c6f
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

Thanks,
Neil

