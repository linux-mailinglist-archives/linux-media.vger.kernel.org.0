Return-Path: <linux-media+bounces-29019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A88A3A75EFB
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 08:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6D4F188921F
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 06:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D008519D080;
	Mon, 31 Mar 2025 06:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c4njhH0I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA05933EA
	for <linux-media@vger.kernel.org>; Mon, 31 Mar 2025 06:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743403583; cv=none; b=JT18DEl1S2QB27E8QI6OBGIhTrR4p0XIt/DIn9LAaYOaf/jKq/lzt2IO8RlbHPDRc3j9HnbpN2gE5w9D7mYbVzX6kkEmBIyx3Ol0R+h3ReJNpzgF2bM3JXwmR1oQYO+NbRNIf1MUBX6DAqy/g2B6QnyXNJnH3q509ieSQ5Q9duQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743403583; c=relaxed/simple;
	bh=jlSvjAFn3alQ4Yt+kDwAuBIfr3O8/1uPwl29MTTzlVA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=Sbzl9dhp4Mgvh8UwIe+gjgLf1MI69dvhkh0F3aLBW07SFHCma3Hii8PbnfodWnnMvZS0aIPr6apcsIH/dXr/GZvbCiJRjdoOU4vsaKOZqWt2GTTyNNPISVjqr75afYUFLyRmpAYq4Hk6I2hNBPThJBXEz3EB8djd46F9dTb+l9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c4njhH0I; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso42600795e9.0
        for <linux-media@vger.kernel.org>; Sun, 30 Mar 2025 23:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743403579; x=1744008379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AA4sDqP4J8juhu+e1eHgJ4HsEPfRns6pCAnRWR1sqHg=;
        b=c4njhH0IefARTcXjurUd2qOH2+9usm5m+9t4MJq7+BnHv0326GpENb0jN7/BvKmmOh
         sFrp7slesm5vPOdsjxnfDzykXTom1jPET4hSpr8MVAdjROWwEN29FMkxByEWbWoNa9MX
         wtHkGXBDP80sJqmwvJiEeiiqzcrl7DUCSd3FR7RJ+bJZJcyp1wudHulxpQr12xpgKuHN
         D5borkN+abmfMm+rxC9s4Rl2Jft9YCrwHBGYWp869MgEnsA9wf2kosHcBOX2iXYmqwaz
         c5Kv9N3ZA58MiWrwF1oLtHwI/BZi0r5UADwQyJkMnxWO5JNHsoKjAi9r1yJzGLdBlGau
         nLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743403579; x=1744008379;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AA4sDqP4J8juhu+e1eHgJ4HsEPfRns6pCAnRWR1sqHg=;
        b=NaBxBTd3kOzozBFfzPPQ2jvzRIrf4cDv0JuY9GkUaFeDJgjfLuQ9H2EeE95euxSOC/
         EndDXxD0XDDEynVFAQCfFyhgT3r4rYeZPvaoTMvildpvFGxsVzz+YemjHytXrhkJ8iAv
         vFCnOokKLrMZyVCqrj0o+tR3fmIuf5xPAZL7VhxjQIz5cc140cUb29u0S6JYqFDPQFiC
         kHH0PW2jaJfYlGnyh1hI2dHX1u3YsFARgeWBdbPYIjl7rGsPtcscVUFnEDS8SKL1k4wt
         pYnReKRQXXhn+3P4CHfJAhEQTLpUGecXe6CJ0EzOH8ygRv57MdWpnvUnHxPRvUspQ+lf
         3ssw==
X-Forwarded-Encrypted: i=1; AJvYcCVKLGxb63qwLXPIqeqWG3WzC2h0Nkh68AYeHVFXdqsEGU0e6jhErPE8tfdMnZ+4ly+vu9HM8qvmuEwzGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YysF/fHUU+qN7QOgCOVRCsN5FW4uEdQ+dFmplQeUSnnz2cc/BK3
	ee9mLoURgzZrYPCA0UU6YJJ6AXpUsNj2cD9ydLdX524xVgFhP0+VHGWH7WZ4kdo=
X-Gm-Gg: ASbGncvPUZEFnTB9DpMIBncy6eLglmFqTVcZdlTmwDTKyZIRMoJf6T+8y9dKWTBLD/A
	gHVI9aT91IEyCGMn4oZ9DKP1X5Iy5he9b7tvjvvOhh0K/LNvDptt69gFMXkv7Bt0yFXktV0xC1a
	JbeZnYyxNRh/4x2znBr9k0owAGgq9PcR639i6H6Zg0j52gM3U+kqh1R6+d6TJKLIUokPVsWkb+f
	EchgrzRrLqMZ+ojSmuw6814AfsiulvAPIqZAsYc/v7d9vB7IPkVYnqV4C/fBk+9wSGOGTecP+ZC
	g+UW2j8eWvT1ijxSbRFUhlOme59uCw9jqUtrWMAD4Ze96aE8W5Fn+IdQlYraqYRk7TQw3CUlLZh
	0yBPDVuRvqgRrDz58
X-Google-Smtp-Source: AGHT+IGx1f4vC8GTeK58NiotvPS6asWIcIisQro1qkimwNxZktvh2jq9DwcElB67LzcJE4nqjvtuyg==
X-Received: by 2002:a05:600c:5108:b0:43c:f629:66f3 with SMTP id 5b1f17b1804b1-43db624be12mr58276565e9.18.1743403579170;
        Sun, 30 Mar 2025 23:46:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:143:2e3d:45f1:fd2? ([2a01:e0a:3d9:2080:143:2e3d:45f1:fd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8314b6dbsm157837065e9.36.2025.03.30.23.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 23:46:18 -0700 (PDT)
Message-ID: <82674b8f-4fc3-4fd2-bc7d-f573d2d11b58@linaro.org>
Date: Mon, 31 Mar 2025 08:46:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/2] media: MAINTAINERS: Add myself into venus/iris to
 maintain/review
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
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
In-Reply-To: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/03/2025 02:26, Bryan O'Donoghue wrote:
> I'd like to help out getting patches reviewed and merged for both of these
> drivers.
> 
> +M for venus
> +R for iris
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> Bryan O'Donoghue (2):
>        media: MAINTAINERS: Switch from venus Reviewer to Maintainer
>        media: MAINTAINERS: Add myself to iris Reviewers
> 
>   MAINTAINERS | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> ---
> base-commit: f2151613e040973c868d28c8b00885dfab69eb75
> change-id: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b
> 
> Best regards,

I have no power here, but get my:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

