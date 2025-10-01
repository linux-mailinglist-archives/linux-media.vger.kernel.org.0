Return-Path: <linux-media+bounces-43455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA96BAFB30
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 10:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C1FF194163F
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 08:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BAC284B29;
	Wed,  1 Oct 2025 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eHmDvwlh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AB627D771
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 08:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307953; cv=none; b=jgNizrPtjHuOahmegDYvMn2LR0JegmpzT/HQX2Zac13bBP0W2mSKPleCyXFbIbfKqGq/9QKSceAt9+Lz5x9I71gCc2md5DpvyPucGsaP/84Hp5KZDosZ5Wjbmr58BnABz2FAgwNc9GIDCAXjpC94wSVyUvqXQO2NtxzeCIG3vBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307953; c=relaxed/simple;
	bh=34z8TKBxNNfyGXYlesOl8gVHHvcdvVpRaMlcgy9wB3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=acTxbB26nF7wZry/vZGAr/+bc3bHxzVDuv8uTyjKPUcQKneXI6Sf6OV07Xt9uZPa6PfFdVTBgu0Lif/csDpnEwDxVdxrra8sDuoVm5/VO2NJR9jskbOh8Z7uHP+ueQhmQ6q//AeZNS9d+lVBcusTO6FcILxoQ1EwLMaze1tvllY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eHmDvwlh; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso363671f8f.1
        for <linux-media@vger.kernel.org>; Wed, 01 Oct 2025 01:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759307949; x=1759912749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCTgTfue23R4yaOrFb9ybWje80AchWn0YqIMIdLz6FE=;
        b=eHmDvwlhw2vzDQPZ+12heWy6ZXU8p9l60vfCBnxDw5mJO12AprOwF6zcMyniQD8wTk
         z2RxXM3r6Hqg64FC0CypxAPA4m4dJmKCLqaUGD142/qxk/Nj87CslTT5V432ckxG/y48
         MjM8VwLezHujPsilUszZbNJtjjvex1oh25KTPc3xCPdK2rNVXTwuQU41GIu1LcNIVlvw
         fLExXiY+8Bqa2FLYk7it2qNcTDGTsFp9zgkZxjaVO10ECb5VSsFs9cfSn9nKPhNHRscc
         p7caW2FmF7oPqI6iOMnhbDmiqL7USTyrewVoHKtDkUeXHgLz8H3o8QXaDh3K9yg9RCU6
         +rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307949; x=1759912749;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zCTgTfue23R4yaOrFb9ybWje80AchWn0YqIMIdLz6FE=;
        b=JbEnLyBfAf6W61EuD9n2IV+CNNOjSL7cqiELxEHb8ronMMIiCsd0MGAzkrY4T0fJaL
         twRGuPWBOPcAH9Xqk4IsVouxgB/gsFRzKM+4srIs90Do//74fMHRGoeu4vYSvpQiJdX4
         PMpFwyBFTkm2p+LVANgLoLmmc0r2q93T1iFERk5VyPPbnLmn5CocREUvAZ5BClfwYz/U
         Jkij/4bdWW7JbFBi7Q0IFgSzcETuvixz849zBT52zNCux0gPKDt/J4J8i7cbVqOV+Mb1
         agISkoqmWPPf1GiNGFgYzhlcCTs3aN6uTEgi4knMJzjJwC85+lKhC6gtTJs8aH8GKKeJ
         Endw==
X-Gm-Message-State: AOJu0YyBoVb7vBh+lIdxmWMTj/0s7zBMt73sD+Eawx7pP0IInstR982a
	vLO2KnWn6Y+1nqNuiiAF0nVD6egbnxJ4u9WtOHaAn6DeHRCJb4S9S1i2Wte9dgr+EIW2V537reM
	qxzB5
X-Gm-Gg: ASbGncvjrlbMhpyppJPvKTuOx2um89JViCOE8MU1GCTDQI1LsWDvaPMRcF+9cYjgDHX
	4/HAszI1jq1EYrNBmLMGtrjxjOy1cBibe6ya+dTyY0e6rDB5FiZYOy5hdwUSFPrOfy8DKyr+gbT
	+RzfpKwpdwciXEJ3JzDQvwnwvFGWjDWw3wXYVSIEpTuGRLdOqW9H+GcEwgT7vtq/HIFfUedZnBP
	CVgYCUT6pURsQ64PC9vTNS+5C5WO89zC03+9JZDaMkbHw/HRnPnMecsv03UT0wRwbD5N8sGLWxL
	+pK2NEMZrCqtxL6/Ecaox0uuj2gi65OAQPNjwCEKD+zlhp0BqAjAr9zT7zvecjK7jo5i38jztK2
	ZQGdvjPUKV9Mbjx6sTJ/VI/vTffX9p9CUtsSdvxENUNL88HWOGLHw2JUeiCS7+QlE/GdVXVfhG2
	QtmuXf9/rvhDx6oqtzqtFL9J8=
X-Google-Smtp-Source: AGHT+IGm/mLJsRK7kBe5ekjqKSsxSCM8B9iiIVyHDmsGInuaLbxLzmbW+1QwwhIPIWQgKg9zYJRPzg==
X-Received: by 2002:a05:6000:4013:b0:3fc:cbfc:fbee with SMTP id ffacd0b85a97d-4241111f7demr5393668f8f.19.1759307949119;
        Wed, 01 Oct 2025 01:39:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f45f:c590:9006:d394? ([2a01:e0a:3d9:2080:f45f:c590:9006:d394])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc6de90desm26516197f8f.47.2025.10.01.01.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:39:08 -0700 (PDT)
Message-ID: <b2538934-bda7-45e1-b368-8dc4d2c6f71b@linaro.org>
Date: Wed, 1 Oct 2025 10:39:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] Add support for QC08C format in iris driver
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 9/19/25 17:47, Dikshita Agarwal wrote:
> Add support for the QC08C color format in both the encoder and decoder
> paths of the iris driver. The changes include:
> 
> - Adding QC08C format handling in the driver for both encoding and
> decoding.
> - Updating format enumeration to properly return supported formats.
> - Ensuring the correct HFI format is set for firmware communication.
> -Making all related changes required for seamless integration of QC08C
> support.
> 
> The changes have been validated using v4l2-ctl, compliance, and GStreamer (GST) tests.
> Both GST and v4l2-ctl tests were performed using the NV12 format, as
> these clients do not support the QCOM-specific QC08C format, and all
> tests passed successfully.

Sorry but this means you didn't test the full decoding and encoding with GST and v4l2-ctl using QC08C ?
So how did you test ?

Thanks,
Neil

> 
> During v4l2-ctl testing, a regression was observed when using the NV12
> color format after adding QC08C support. A fix for this regression has
> also been posted [1].
> 
> [1]: https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
> Dikshita Agarwal (2):
>        media: iris: Add support for QC08C format for decoder
>        media: iris: Add support for QC08C format for encoder
> 
>   drivers/media/platform/qcom/iris/iris_buffer.c     | 17 ++++--
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     | 15 ++++--
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 21 +++++++-
>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>   drivers/media/platform/qcom/iris/iris_instance.h   |  7 ++-
>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  1 +
>   drivers/media/platform/qcom/iris/iris_utils.c      |  3 +-
>   drivers/media/platform/qcom/iris/iris_vdec.c       | 61 ++++++++++++++++++----
>   drivers/media/platform/qcom/iris/iris_venc.c       | 59 +++++++++++++++++----
>   9 files changed, 152 insertions(+), 33 deletions(-)
> ---
> base-commit: 40b7a19f321e65789612ebaca966472055dab48c
> change-id: 20250918-video-iris-ubwc-enable-87eac6f41fa4
> 
> Best regards,


