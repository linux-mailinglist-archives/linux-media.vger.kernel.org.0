Return-Path: <linux-media+bounces-27638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D95A501D0
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 15:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08C7C3A557C
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D204724C093;
	Wed,  5 Mar 2025 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="beXjxic7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BCE24BC0B
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741184568; cv=none; b=kRVZvId7NFgxaSp1mPUGe7pFuZfSyXKpOUry6fKlqy6XqXziGaC9SDmhe8YDsHEAq6RReGTDI1Md2rgcagz/XwAwm5hrp0LG25qDtdiylyhBw+U97bmdTC5vdenrU+sEVWgVb+7EjiG1cPutl9Hyao0lsRmyxoJNxFBHNB0rSh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741184568; c=relaxed/simple;
	bh=AALPqvcYdPu/fCVh5D4pZZdU0PPcB5iUhjNbx3HZ620=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=olASiCp1opZJ9R+Crv77BfkLdF7HH3nYxAXtn40N1hInGDdzGRH6s4zNDfFBMHFsvQ+NlqD9s1cOK3ZWqr9k8dwAqiVHei/2i6/Lg0gc9I3uD2Z+chYTDav8Guna6IltlbIsLdQBp2Xg2e6GQeJksQUTMwKEeVfkLMyzL5RT1LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=beXjxic7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-438a39e659cso46815695e9.2
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 06:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741184564; x=1741789364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lSyv7n07CeQN6+Dte2tX+sn3X8BMnYtDKpvbKeDUuO8=;
        b=beXjxic7ijorklMY2vS9QAfyD0PO88EenyjCpr8siL119joxL/npEIgh8UgQ484xT9
         12HgcXcIFyGFju4mbhDdT0nPRlkZbqYLrwKBmU+X5gm01n8K49nvIA8n4U2l7C9fFf6m
         m7V025ox7qIML9YmVHwLlz+cS1nazOYwW92MFyTpautwUp+CSbT+JcT8GZYjTi6ETQXo
         mNUZZsbPKjb0gEZB4j0w3QYsLysXmcVue/hU3R8ZEp1TFQPhrj6pBVT3II/M/ugtaHHB
         yhsc4C4wrku5CGusLNaK7oifODyUht2RVaJ55baxunmLeguzAIHFpyNLpxc9A5hUF8fA
         tAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741184564; x=1741789364;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lSyv7n07CeQN6+Dte2tX+sn3X8BMnYtDKpvbKeDUuO8=;
        b=Ek+o/8qCprMeq7IIAVa8N5qusjInjE/4LWgFpz8Ym3/4SjxA/2/qJsVDIuPCEmDLW1
         NcXGD78YLs1Qfukw17JrOdvNidDU+nocFnYvxP8CUxARiD/nuoIqacW8iNgA+dtoV4OK
         YrsxndBzget4DA/yH5IzYORyi0aZrdsjy7Xri6wWg5zU2FbiHRH3lQ7qLa21q1eT4Bf2
         3vJEbQW8SmSpxYcSt/OcM5YjQFb2QPUExzFIvFVzbGOFSiwvJ8zUNgit5kaapVSwMEhZ
         rWKvX3dS3LOCdIWgO+PEr1z3i4Ud5kCE962f7H7hF3d9iwViqI3k+TdJdjPw6DlM+xK3
         UFCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+qG4LlYkEuBaPTkRCdEn4HE63tsvfbdcvK7EOUpjfRyBWjzS4LwOYxlErU4D0ve4V33ThacaYJtw+uQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9tE77WkiGdXzqi3dKHcN3Q6ZOOjF+3XjilGtFTMVLcRyIN0Bh
	8Ul4ywSgl7dnGZw/2sa9AjA/RXQcME6kEnHjodTCfSxfIk4I4PI3oS93FmxXcoA=
X-Gm-Gg: ASbGnctso3+0wmCERevkv0OUW464BzlsQQ66LNwX7YkhJidJz6FGo2iXPs/COkQ9Tqi
	MdoJczj/kI50/xdFChuqbGf8npEYCJ5NHwm1uQ903HIFfhybL+BTUeZvUyVtX3srVOqCHtCALhE
	EdaimdtqWBdk4nKGdYZhlO+2u1OjK6KNKyCqUfjkxKf74KzHsohhsN1SJIRT5QyWJ+GUTy0ROB/
	HgA6Yoi7Aq5QX2bSirJbTuKqWpeMJqk8ClwDBFqvTwuYtv5ESy/7LFV/dtxN7oOp2HdE+wVwlPY
	vypGucYbraRhj2Y3JyXrnYsCHgHTac4yfnmYuahEncisD9S64VOWGs2kbmvTvL6mBh0BYsdv7sL
	CUqJKX4S/C4wnPnWhcHlUGQ==
X-Google-Smtp-Source: AGHT+IFB474KXfR5EAvEooEwHvPvIfuEC3OzGNc/14oi/JyC0//Cf/vNiQaW0zY3Obiz1lHAh1K7zg==
X-Received: by 2002:a05:600c:190a:b0:43b:cbe2:ec0c with SMTP id 5b1f17b1804b1-43bd29c9377mr25131845e9.27.1741184564283;
        Wed, 05 Mar 2025 06:22:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d001:4ab2:d11a:658b? ([2a01:e0a:982:cbb0:d001:4ab2:d11a:658b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4292f0bsm18746375e9.15.2025.03.05.06.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 06:22:43 -0800 (PST)
Message-ID: <6d88effc-2aed-4f92-89a7-17d48f43ccd3@linaro.org>
Date: Wed, 5 Mar 2025 15:22:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [RFC PATCH 00/12] Add support for HEVC and VP9 codecs in decoder
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, quic_vgarodia@quicinc.com,
 quic_abhinavk@quicinc.com, mchehab@kernel.org
Cc: hverkuil@xs4all.nl, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
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
In-Reply-To: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/03/2025 11:43, Dikshita Agarwal wrote:
> Hi all,
> 
> This patch series adds initial support for the HEVC(H.265) and VP9
> codecs in iris decoder. The objective of this work is to extend the
> decoder's capabilities to handle HEVC and VP9 codec streams,
> including necessary format handling and buffer management.
> In addition, the series also includes a set of fixes to address issues
> identified during testing of these additional codecs.
> 
> I'm sharing this series as an RFC because compliance and conformance
> testing are still in progress.
> While initial functional tests show positive results, I would
> appreciate early feedback on the design, implementation, and fixes
> before moving to a formal submission.
> 
> I plan to submit a formal patch series after completing all compliance
> checks. Meanwhile, any feedback or suggestion to improve this work are
> very welcome.
> 
> Thanks,
> Dikshita
> 
> Dikshita Agarwal (12):
>    media: iris: Add HEVC and VP9 formats for decoder
>    media: iris: Add platform capabilities for HEVC and VP9 decoders
>    media: iris: Set mandatory properties for HEVC and VP9 decoders.
>    media: iris: Add internal buffer calculation for HEVC and VP9 decoders
>    media: iris: Skip destroying internal buffer if not dequeued
>    media: iris: Update CAPTURE format info based on OUTPUT format
>    media: iris: Add handling for corrupt and drop frames
>    media: iris: Avoid updating frame size to firmware during reconfig
>    media: iris: Avoid sending LAST flag multiple times
>    media: iris: Send V4L2_BUF_FLAG_ERROR for buffers with 0 filled length
>    media: iris: Fix handling of eos buffer during drain
>    media: iris: Add handling for no show frames

I should be better to move patches 1, 2 & 3 at the end, after the patches
adding support for specific hecv & h265 features, and please check that
none of the patches breaks h264 at any time to keep bisectability.

Neil

Neil

> 
>   .../media/platform/qcom/iris/iris_buffer.c    |  22 +-
>   drivers/media/platform/qcom/iris/iris_ctrls.c |  28 +-
>   .../platform/qcom/iris/iris_hfi_common.h      |   1 +
>   .../qcom/iris/iris_hfi_gen1_command.c         |  38 +-
>   .../qcom/iris/iris_hfi_gen1_defines.h         |   4 +
>   .../qcom/iris/iris_hfi_gen1_response.c        |  11 +
>   .../qcom/iris/iris_hfi_gen2_command.c         | 129 +++++-
>   .../qcom/iris/iris_hfi_gen2_defines.h         |   5 +
>   .../qcom/iris/iris_hfi_gen2_response.c        |  56 ++-
>   .../media/platform/qcom/iris/iris_instance.h  |   6 +
>   .../platform/qcom/iris/iris_platform_common.h |  25 +-
>   .../platform/qcom/iris/iris_platform_sm8250.c |   4 +-
>   .../platform/qcom/iris/iris_platform_sm8550.c | 141 ++++++-
>   drivers/media/platform/qcom/iris/iris_vb2.c   |   3 +-
>   drivers/media/platform/qcom/iris/iris_vdec.c  |  80 +++-
>   drivers/media/platform/qcom/iris/iris_vdec.h  |  11 +
>   drivers/media/platform/qcom/iris/iris_vidc.c  |   3 -
>   .../platform/qcom/iris/iris_vpu_buffer.c      | 397 +++++++++++++++++-
>   .../platform/qcom/iris/iris_vpu_buffer.h      |  46 +-
>   19 files changed, 931 insertions(+), 79 deletions(-)
> 


