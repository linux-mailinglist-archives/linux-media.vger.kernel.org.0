Return-Path: <linux-media+bounces-51027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AABDD3A3BB
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 10:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9DA1C3004E17
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 09:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1044D337119;
	Mon, 19 Jan 2026 09:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JNyPDsjc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A038308F3B
	for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 09:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816383; cv=none; b=lql7yIorFSWcRMlFMvbA8ZYZ5O+fyCJ0fpzmQLaNWr/nnHSMU81+CaCYjfhHQBZuTP05ef1Sr4G2gWWph/vJpIu/QT6l4KljlldvSPN5K0/Zqal56gPvPCSz8JymvTGnF0rCSw5XUiOhOrkqvqIuwoMgxCd5/bsDUsTD8+ZPeZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816383; c=relaxed/simple;
	bh=H8KWZ8KVxCXiaSIhoETauk57eCO5bTYXFT1uauOZecc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=k39LfH23WcORebhQzyKpe6DYknZubu6hStqQns4+tx4Y9ozosgG0/WGwjYuUhUzkPbkyAG+xzzwM/SMwXzZmcPWFANwtpCKxQ0sWR3Qr2sVcJvcFfCIE16RYnd3dPR9vw2DChOLgoz3pB3QN9iuezvDo7K27LXkK/xswDWooAic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JNyPDsjc; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fbc305914so3381247f8f.0
        for <linux-media@vger.kernel.org>; Mon, 19 Jan 2026 01:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768816380; x=1769421180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHrLEM47rl+N5Y6sByRjJVHzaTdXJR1i9eBaS8A9Ybg=;
        b=JNyPDsjcI8Xs81zx9zrkWC3iGLl4USDBGd0LV0+3BbB7wJUPvszLU2O3tFMUYUc2J8
         HN8VT8edvX9Ld/+IcajNU/EtD8cJySusaoLXlxLLeJKFFGAPEUcJhfkpVYZlqd+7r7Dl
         kUi9N1EH7jholiyOdRjGf9Oc1EzzfDBTacxUhHkucM8xjHrI/wUclZijuG7rbfNaEdnk
         H6aolezF0tGj3ccLgr3xj8aPN0CGqGcaR+/xow6cBeJI4OOcnc0T7qqd2Jn187vctT9o
         pv4vmnMl0CIKtBcsR/HXnE5B6FbTf98HjEm2YVk294BOCx7HalT/S1tgE0jfbMH4P2sJ
         prUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768816380; x=1769421180;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHrLEM47rl+N5Y6sByRjJVHzaTdXJR1i9eBaS8A9Ybg=;
        b=qcxUGczp3y0vPBWJCB4vSOhYWPQSF4AM+LYSb4XoEizouCPpc5wdt2H6gJ9NT/i87T
         ZfbIEflexAw8S5h/VlB+y9XJXRozG5l6rKD5OEGTLe2EMXd138d9jd5X1dHcomzHf+pk
         CJOhW5JWzqdHptDplDG01Awc2O2lSTFsJFuSeOAP9x082XoriPCQRDVXwDwdzGvpA/59
         lC7LfNdNDT6UwSQZ0W0jQsEZj0P2LgczBLvb7jbFRdCZtIDOhYPBu9JQLoKUwcmyAcvE
         8A9/jLV/LkMbaltGaM/TbsKSVtQBm9ahEGtGb5Pmy2SNVZ3ySLkSDxL/mNm2GpAUz+w2
         wGJg==
X-Forwarded-Encrypted: i=1; AJvYcCVl81xZj5Z/XLCgujebHeEdXASZfbSqEggjoA+BTpHn5/qA9d5671Xoi3PHJ6kQkeOARWsWj7+1HSKrpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlwCSiABARixILhQGDy9LMA/cMTLtpx+1RAA9hpWByiMhY7E+Y
	jOp1O670oW8F25T9ZNZA7Hj7u4/0SRL6D/8VbJfNhZcR0P7qMDXDdcRbfDELaNYqMS4=
X-Gm-Gg: AY/fxX5Fwi4iXvrZeL6d4XZU6YkuU+lsZ12WQrz45XDp9VCgWPQvVP1G0jLGLpZTjz/
	kEeQfbX7VBQ/f+dSz+VCN57TWUln0ZIzqcuxbHiUAuFJyxY0fyP2tkkGi639Lk3HAJ05nQpSttm
	supyIr1JY4R08vOgvMlX+VCXXxgLpqq9W4jgRR7Cb7XGWws9/WgKS8Kl8K7qWYs2fAnDO21M6bz
	bYvtTriQw6FcauRZimFNKTfFP7KXh7SlyJ2GMMyPyh7bAvT2g3HQtGOuZj08c2r7VDYxT1LfgI8
	iRFKwg1OxL2ZL/awGBqLbaiVG+ZL7GoOANnxjjS2nfMQLNoKwU2GwsHTkPkbFFsgW9oQ1MtuRJ4
	p2Ry9p00+qZBOWZoPlF416/WNiSepIuEEu2VgEgydSyLZR6RFMQ67MI1wyOdi/t1Jfi5gEi+hoO
	LuBwYQ7Ro+PlmfT22ZqkIRdTt8CjcFhdLkgLpiRYK3lD6BX8KzhCC7Vy47OeTyFaMyDyOcywte6
	A==
X-Received: by 2002:a05:600c:8b33:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-4801e30d72bmr126816825e9.10.1768816379681;
        Mon, 19 Jan 2026 01:52:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:e47f:1b04:e631:9f20? ([2a01:e0a:3d9:2080:e47f:1b04:e631:9f20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dddsm22831999f8f.6.2026.01.19.01.52.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 01:52:59 -0800 (PST)
Message-ID: <f9df6973-ae8d-4df1-ad4d-e918f0ef0820@linaro.org>
Date: Mon, 19 Jan 2026 10:52:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/6] media: qcom: iris: encoder feature enhancements
 batch2
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
 <e92d8c53-44b0-439a-bfaa-df16ad5d4934@linaro.org>
 <258e30fe-7b23-47a4-b3c8-a38227fccdfd@oss.qualcomm.com>
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
In-Reply-To: <258e30fe-7b23-47a4-b3c8-a38227fccdfd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/13/26 07:29, Wangao Wang wrote:
> 
> 
> On 2026/1/9 23:02, Neil Armstrong wrote:
>>
>> With the following reverted:
>> 456c99da41cb ("media: iris: Add support for QC08C format for encoder")
>> causing this: https://pasteboard.co/t8HmeNaIFMDR.png
>>
>> Nevertheless, the changes are functional and output are visually coherent with the parameters, so:
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
>>
>> Thanks,
>> Neil
> 
> Thank you for helping with testing on SM8650. Did you revert commit 456c99da41cb because v4l2-ctl couldn’t run properly? There’s a change in v4l2-ctl that needs to be applied, please check.
> 
> https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u

Yes I applied the v4l2-ctl fix and it works fine. Please retain my tested-by.

Neil

> 


