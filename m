Return-Path: <linux-media+bounces-41998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A16B48DCA
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 14:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D3FC203591
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 12:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9329A2FFDE6;
	Mon,  8 Sep 2025 12:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d5CszTA7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2615D3002C3
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 12:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757335127; cv=none; b=QZx87S2lH8drlDrCM5DrDc6d6akkqdqajiPa5Nx+h1fRZ3yv5sByKHjN8UTU1bNcIlr5P+GjwvR+mrXHOGmIQlUavxGyySsFkc4qrnxQ4G7tQwBVWVuvA0wjmgFgVf21rO7gTDohYdsXsevc6m4OeiCMTyXBWP6h4vYh9c+gWI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757335127; c=relaxed/simple;
	bh=SGPY8M2Qd3kuoLDKFRoDhwJ0VxrlXDznpzVLSQgYxNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkoChhJlgut1/a8KjkHSSYC4+34JzMPU5MFytq8XH0iIwLeNzxMgKkrTzL35050tXgxuSasRdJui09N/7t5NNNdwQlR4/5Rw1yEe7rm0tn5nDD4Er+08ecWTVwGRwGBdgLM/LIZmRhwAIDFs3YP4TMjBSxGGRak3K0hhykPfSko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d5CszTA7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3dae49b1293so2252681f8f.1
        for <linux-media@vger.kernel.org>; Mon, 08 Sep 2025 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757335123; x=1757939923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+wBkxa/yGQ7mP70MIUjvPeodJiXweeDDEtqNWsYtFII=;
        b=d5CszTA7xJRtXNWef+1wbbv37BZr2y0B81NaHDnMCQgmvqvswMAQ2Zwo1E8ysIuIbL
         W915IESn239L7536C8ADvADkeIoxV4Wa4y6Vbe1IH468MGIo0XDKGDc9f6/lXAGF/jMI
         4aP51aEqSSHxqSEDbBjJopZAo8LLmpKRQjlcLQh/ppUdsy+M0iENM7JJ1FbMeKH7zuGw
         KNvPe/tpzrzEf++JfgOF9KM/GyVVq6lWOYLdpSH4bMqIRpZ9/g6n9VBr/d046UjZx1N2
         AXz54aRqquEeDkTu+qRkXUs6fKgCOXF1dEa5bT1ImLt8ULglIhp0/vf/EcWMH6BMACQC
         p0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757335123; x=1757939923;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+wBkxa/yGQ7mP70MIUjvPeodJiXweeDDEtqNWsYtFII=;
        b=GytJhwWPzY+3poLCMf5CgkSDiQcZvwfB2PEHfwLs3Ub8ji+bDSfL44uKjPzg8e4yDJ
         D/MiftVkQPhXob9H4buE308sslX6geYnhqH3BkYwzAviPItbfBVO6ZayOHBDn5mJ4rMx
         4ilG+nlt2Butio2FRoUmquZiAJmRfwqOE/fcJbu7fm1QqP/scqXB1gDJQ/zdMjUV1LDg
         hPuxsJDCatc8oP7z+NA0dDgeJLV8oWhPWQnn0NjMU8mJjV7USFyHiCuQid7no9WtoHJo
         GsJpuT7+MgsM0kaWSpF+SdG20xU+equafWhz7DvlnQfIHtE9GnLP3OCctsUGQphxWi9F
         7hlg==
X-Forwarded-Encrypted: i=1; AJvYcCXkE6bz3bWSY6vBPFOYUpdl+Q84kelVodPqfFoX+EQBaBuS26anLcGN6YTi8d4C7s/pTtaUTLMIIXyvvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNMpgjdEup/qrQDMWXRTN1LZ+8X9LET33SgtLYvujIaR9Faj6U
	vEoLFcvy6q20x0MZKMbyyeqCGkwU5i70n6qaUwhbHGAKZdVNE13aauJCUk6VtqlXcgI=
X-Gm-Gg: ASbGnctCDwvie1ODjtjUOzpbpKrtY7wXHQ3f4IcMrkxA500VfwTqVnKMDICZsvUYA6g
	kwt/NYlyqBAHII+SDEh1rsZbphEwpmwRRXrCOT6od4FDklxPTgObxiTMuD1uoPiKy8Zzb71Gi66
	A3neR8fXEGhn0EO2E2HXbM/IL65WvCOFwX6SY5cqCZzisBO2Tv8KBlDobpcLbHezXXPh3+GViAF
	IX371+3EVoa/tpRK6zKGQkcsN5kTFXpC4TKyck3qYyzS2DZfFQ0cyfUeiOiDhxZf/5TCpQu2WK3
	rpb2vkMNaK+aFG2RLtUtYArLT6Bo/s1y5d6mnpI33vK/WlcFpx7Ix99kCzIUDeK05pvnIjpYwyQ
	V7VwEnTVBZjlbRQPRNnJsMBmF2O6p997o1L2iKebagKHM/OjnvQrj/OiUZyo9GsDbuRaYjYtfnF
	0GT3bZCv0A0RNSIu2MefmKkj/3ASSsIg==
X-Google-Smtp-Source: AGHT+IEhnBeD2VT2hd/mBiSwfbFr8jrq1cYimX0QHes+yKVAo+vJbOIIBqAhykAh6gs4D05hHSw0Fg==
X-Received: by 2002:a05:6000:24c1:b0:3e2:ac0:8c55 with SMTP id ffacd0b85a97d-3e643c1a48cmr6364184f8f.55.1757335123380;
        Mon, 08 Sep 2025 05:38:43 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e898b99sm437799005e9.19.2025.09.08.05.38.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 05:38:42 -0700 (PDT)
Message-ID: <1d72c06a-1a44-4364-bde1-afc4514520a1@linaro.org>
Date: Mon, 8 Sep 2025 13:38:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] media: qcom: camss: change internals of endpoint
 parsing to fwnode handling
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
 <20250903002255.346026-5-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250903002255.346026-5-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2025 01:22, Vladimir Zapolskiy wrote:
> Since a few called V4L2 functions operate with fwnode arguments the change
> from OF device nodes to fwnodes brings a simplification to the code.
> 
> The camss_parse_endpoint_node() function is called once by camss_probe(),
> and there is no use of knowing a number of asynchronously registered
> remote devices, so it makes sense to remove the related computation from
> the function.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
I think we should keep the code as is here until after merging csiphy 
changes.

https://gitlab.com/Linaro/arm64-laptops/linux

---
bod

