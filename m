Return-Path: <linux-media+bounces-32867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1855DABD0D3
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 09:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28D171BA125A
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 07:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F1A212FBF;
	Tue, 20 May 2025 07:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rWvvsCTI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C0525CC46
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 07:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727222; cv=none; b=YmqwO7Yp5ctZPhYs9wBEq/GzKcWpD83c5wGrrJZMIvFhrCFdwdrND9wYXhNVEpTAm2HSJ9vsj8MQFmvXVsNaHaA79gCn5SV05RdR6lnpcGmxsqjcQUc/Qks2MMFZrwXN/8gcASGNN+jVfyxvnLSqwE4OWxTv7iUzr2kzMz2zbP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727222; c=relaxed/simple;
	bh=i8gDA2gMRw4S4BbwdWmfOqUCoQ+NU71nDQjUlO8Hl4c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=Ze9GnpvNBzR31GLiziDeEH/7dJystVB2TCUokKsH/+9scEgY6Xdn7ahWZRVxjPUmUIsy/RKhRbyCFUitCcMTRKWKIB86G9r6tXGHVb1MQkeZr7HA0PK5F9/zQAR39oJ1SA28RR/Av4aRno6vGRqaq6pAiNi5c64yRn9oUIL2WSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rWvvsCTI; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a366843fa6so1751918f8f.1
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 00:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747727219; x=1748332019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlB+dE65G2Ur0seqsAhMBP6CXpePgtrf4hmB7DQXorI=;
        b=rWvvsCTIKQ9b9XWUkSG6fRUow7PUpwBfXE3h+hrbjCvjgjsjPh+rHyd40F4Pf6ZbTE
         hc44YGpC2TUSG44HpdlakCYW7CErpx5fPP2h8V5O/FKrksNen0IntBbrpOEbORxh7zsi
         x7CSWHe1MTchqaJ6OP2MT8JjX596m5zfTN+vGhJUfOaVeSGyc5XuNpxXRBVvWa4r23fz
         SO9UDXOTyhMAtgGhTrgUhQQEr3nr4+QczPKuQPHKBdb3U1fSMqLoBAncdmz4FN3nbA7o
         WwoG3ec0m5+wWSh1bfCUuJqOsIHYcDbeax5wpujqpiEo+7mBfnKS5/gXBhybk4u0WLBF
         iNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727219; x=1748332019;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JlB+dE65G2Ur0seqsAhMBP6CXpePgtrf4hmB7DQXorI=;
        b=HodBUvFm+bHSyWNZcRUWsPUUnQ5nvVnnmCetNEsvDX3lrel3SXzqO7pv56O1CPWNkh
         r+XMpLvXfokp/xhs87DBsEyXi10ZfdeqC9LYE96vdRzm3MI9jr+K3dDReGB7AAcbAggP
         biJGt6iqQIYGI7bOMQ/oLkgmAkTb14r6LZDYOZe/5ETA4tcgv1KBPIOhD+c1NWYyiKvA
         HsSnhdi35BNvz15tEfFAJu6Gbm3uHTgpgTECHqywY+KGYj6Cx5/GVSYRCNTB6Q82APNa
         pvQodE51Iy7Bki1wPl2idcq9CIkW/UfAiM4egbq8nkVDFDXSP9OJz/GKkLLUde9CLXmn
         G6WA==
X-Forwarded-Encrypted: i=1; AJvYcCVvMjyxrEE7OmekKm53z/IYIcY2stOAA52uaOSKgJDCchhJPZj9oa2vcI3+rfh1HQNI24HetmYwrZ1bug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6s6sdneJrkevODSqCAEyt7mNhfzfOoPxV1v5Dd+bepkhFkVws
	P/QNLCjfiKBTubJCKV7rzCddsNk/Oq0/GWX5PAUNj6qdhFW+aNBirA4L3xLYSyaxN5U=
X-Gm-Gg: ASbGncuSYB/w3qvuLBX48dVI8F3WDknY2kfC13qjDGyfjj4DKZhEhvnhUYwx6IiMXpx
	uYeedhY324ZIGeXBthdF784p6aAOLJ3gViRRJ3tfmyVE8YTtg6FyA1hpYtKB/F/twi8qvA5Rb7F
	NBt4Fak/LZPd3iO4kH/xzsQxvsWmQUad4FxcLw365m9PwOXy+tgxEnQ8lRHxhFzfQ2k61XotRiZ
	hT+ScCy1vuP8xzI+0JnxD5nn78wJBc7dlrOJHwO9BvUyRmxZf+51PhF3PwZLxAAh0fVVhORdgz4
	y59NOzi0pMBoZn+nbwakjPxMqY018svxAl7HXa8Ijhb2LmiMeNpj2KLD+/P45lTwuSU2ka71ht+
	0MWOeI+HhpryvGnltyBR2Ow49i3hZ
X-Google-Smtp-Source: AGHT+IGK7f2w42ottfrsYDyLmGZa4jgdXicFht/tKBlXTsPAPrA9w+hQ5JYufY7Zgoo+dCFadCjcDg==
X-Received: by 2002:a05:6000:4284:b0:3a3:2aa5:11bc with SMTP id ffacd0b85a97d-3a3600db421mr11262183f8f.54.1747727219024;
        Tue, 20 May 2025 00:46:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca889e6sm15464333f8f.71.2025.05.20.00.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:46:58 -0700 (PDT)
Message-ID: <f3bf5a4a-f32a-46bf-8429-5c1de37cf993@linaro.org>
Date: Tue, 20 May 2025 09:46:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/3] media: qcom: camss: csiphy: Stop spamming logs
 with version
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250520060310.7543-4-krzysztof.kozlowski@linaro.org>
 <20250520060310.7543-6-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250520060310.7543-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 08:03, Krzysztof Kozlowski wrote:
> Camss drivers spam kernel dmesg with 64 useless messages during boot:
> 
>    qcom-camss acb7000.isp: VFE:1 HW Version = 3.0.2
>    qcom-camss acb7000.isp: VFE:2 HW Version = 2.4.0
> 
> All of these messages are the same, so it makes no sense to print same
> information 32 times.
> 
> The driver does not use read version at all, so if it was needed for any
> real debugging purpose it would be provided via debugfs interface.
> However even then printing this is pointless, because version of
> hardware block is deducible from the compatible.  Fix the code to adhere
> to Linux kernel coding style: being silent on success.  For the same
> reasons this should not be even dbg message (see driver development
> debug guide: "In almost all cases the debug statements shouldn't be
> upstreamed").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

