Return-Path: <linux-media+bounces-27981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9DCA5A5F1
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 22:16:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3D20174DA5
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 21:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6671A1E47C9;
	Mon, 10 Mar 2025 21:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZrZGVyhx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F2B1E102E
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 21:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741641350; cv=none; b=URy92HiTVrUB1OtZhTjzpMG30OjYeZLVWG9Xi/uQpZfTbwre1Z+yUwH5XVoaqLvcLl0Ln26YxmQ74HRMK/7U+JoyyDd4vdNOHFkOsw1BHflbycRex/9pn15SneA0XdxLwhJQUtD5+oO7SxwV9feIOXUDaInahwls8MXgkU0MaIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741641350; c=relaxed/simple;
	bh=PqOVgE0V/OfFJoLKbJdR0nv4yrcRKzUDgpjl/uoMMsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NnjJXPdfZnAtEWIdbsv6FI91kihpd8boYQc4uUOgH+tzLbr5XnkVJrBWPSn2cDyySyoY9ljbfn0WunvqP6NtHGPtkIOsvVEuZwZVAlnkgxaJAzQFOtG/ABVFU6wqVT/7Ud8YssTPj2HXimY6/jCalzA8e1no5KBrTk/FLwLR2Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZrZGVyhx; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30c07338b62so1020901fa.3
        for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 14:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741641345; x=1742246145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2MvLqGAPwBaueNzkaD4MfMCpUMY9L6AflqhOMx8Pn7s=;
        b=ZrZGVyhx3dJ7bjqju+OYejv/2I3EARS6JPlSyYfdZ6gOHlZIS7ImZCDRKz8vxd5tgI
         PK/BO/LwmbomvviJSN2wNOoN1cGAWzsVYN4D6QRFgrvf0hproZPVpPEtvSaD4F7Tcr+0
         l8JRe7fsdOxYlJV/0vbsJ3SUBODMtAI4NcVa5QRFVW6VoaDGsMWqeGu6nfbrdFGkdM//
         hQG9bRboklAekkN3LLCrYumETxNZwyhSlb8nCuhKasZOsxM2x40HD4BiYh0+OP9HV+JW
         J9hOmX9JWUroKAoaCpPOw4sAFGosdBvReRVhRPSrEpaGRHQNLOz6XWM4OL/07mj49TaU
         dW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741641345; x=1742246145;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2MvLqGAPwBaueNzkaD4MfMCpUMY9L6AflqhOMx8Pn7s=;
        b=i3mZny4XeCzh0UC0nhpr7rzEv/PVIbXA5Fkxt7a1z6fe+EDLcxewOZxYzwBBYIs9Xx
         4GnBX9C5sQAn+dGlkdSUmHuxGjJieFVlNVIlV2OtCBmYrDY9McjI147jfrq1w77e/rxx
         YJ3yjg5CtCY4FavlFRhsyuYkN2XKrg+fUWCw1pZoCEerlzE0LrigV9+xczYaiHgjcqQX
         Xw5b+KlVAGYEKfp6/+d/y7jj/7UHpu4aL/g0yjfEKRwL9UCRc+j+5cO1A/mhayut2doV
         IX3Htok3Kj/BlYj/nIP9deuLGbFkzIuIwkg/+mSHAg4bfIRhIdZKTvVScUrfIjt1hA3n
         84FQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3ynLe9lIHEbyldIu/LLcFWwIbjvq92Xkf6v+b7mBrpi5oL2kJas5uYO7kOXWlAg3I85XLkoU/BN1DAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf53QTqDq/cqqhzbqrvuNpwtaygFqQ0l4PSDzn9zGz3JzElpdA
	zoKpLyWP0G5dDgjCC8KhUyrz9IXwRI+Y9wQkJoelYXA9ppE1vlcB8IRf1Noe1Us=
X-Gm-Gg: ASbGnctpJi+7pWWUbSpvvcPuAksgVEs1Jz1gz1IlBCA/dCgDOuPce/ntc++stbqCFAJ
	1jjx7nGPuAayHQbT0mHP3+X9atMRQ7Kv7/jffIZ/7uRP4CSzgBu6WRBKJbDOFnPRS6HnxHGn/aQ
	sIcGU7AGBl8bTz9IsWcnKjDk3u+Sq4QD30KMdniCGvdSmtdP4asbAWeka7Hh2ThmtK5nzdx5Igo
	4gTtK4WBp9FmOQ7eIulJDkFHKvz4gT7Q4/w2Q5+ZK+e4+CioQtZoJTiG6pnihQp2n0uMMH/0CKf
	uxSGNqdCWyj9U83SKurWF4Do3X5w21ndvSqkz1yXiGVnIKknMWznhuZTUu7MADiNcwvxrVHZovA
	/Us62dLOXSxBrKnvKGq4mcdg=
X-Google-Smtp-Source: AGHT+IFEEGvRAmlkS7mP1u8TkcikCwjIGUcDohSXkLJe9GTEibzUbHy7zmjsIRAA7zWVdtf6JcAsyw==
X-Received: by 2002:a05:651c:2220:b0:30b:f23e:77f1 with SMTP id 38308e7fff4ca-30c2076a4f3mr1672051fa.11.1741641345081;
        Mon, 10 Mar 2025 14:15:45 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bf4c9c71bsm15116051fa.37.2025.03.10.14.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 14:15:43 -0700 (PDT)
Message-ID: <0a52b265-57ad-426a-b4ff-8a6bb5845636@linaro.org>
Date: Mon, 10 Mar 2025 23:15:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: x1e80100: Add CCI definitions
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
 <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-3-c2964504131c@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-3-c2964504131c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 1/19/25 02:54, Bryan O'Donoghue wrote:
> Add in two CCI busses.
> 
> One bus has two CCI bus master pinouts:
> cci_i2c_scl0 = gpio102
> cci_i2c_sda0 = gpio101
> cci_i2c_scl1 = gpio104
> cci_i2c_sda1 = gpio103
> 
> The second bus has two CCI bus master pinouts:
> cci_i2c_scl2 = gpio106
> cci_i2c_sda2 = gpio105
> aon_cci_i2c_scl3 = gpio236
> aon_cci_i2c_sda3 = gpio235

Nitpick, please consider to swap SDA/SCL everywhere above, this will convert
the list of GPIO pads into a neat alphanumerically sorted list.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

