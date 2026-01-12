Return-Path: <linux-media+bounces-50379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A1D102F7
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 01:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC397304D8C5
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 00:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19881E5B94;
	Mon, 12 Jan 2026 00:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mFdlI0x8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDDE156F45
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 00:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768178080; cv=none; b=XUIGbu39Tz/3Orbmcibod4tO1T61zJ1/jDDLOWTcRivMqVRqAhYhoID2MbpzXk18KOQccx9zEIeVkFN7GsZjxHAvaNbUIL7ZV26hRLT+6pX9tODp7jdPhmX7eXhZP26cZyeGzqT0/Iw0gZ0i2nREHyoDKQl2kXKaBozs1PxrPYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768178080; c=relaxed/simple;
	bh=+FgYkDoXLXwDLS89Z2WCD3x1bFk4ycg4ykdZSedctBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QR7KOmXpWpmsolSQeTzzl4ARMHTEDMlB3SeOEWEYclbKK8ogdetGnpcvKel8r9dcdWq1VGdNxPiVt+rE4YN8JR3ZjATLthZm03qmqaLiAyj9xaNvLnixWYsZWVCAPV4Lvo3+vdOMr5i/hnF2eCoVyDznOzlbw1LxRc5kFI1ALGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mFdlI0x8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso62895415e9.0
        for <linux-media@vger.kernel.org>; Sun, 11 Jan 2026 16:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768178077; x=1768782877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jFVEfSikl3v/pz3ynBdmhJW4X8roL1IZM3tSP69lPp0=;
        b=mFdlI0x8r0Wvwf9bqXA0jaETcVXpL+9MpKN8k9T0d4CNmGZ6tQtHZxuG0qqHGxzFdi
         Q6I5p/s/WiAf/JRn27b5DOrRTewsIfxqK2dHk9WIXkWzVzMmsaajr58Fk3adTGM6l0Fe
         waY+r8ucyNwySx9DP/Q43oe/4iaAXy4TZp+0xBi5j2PJW2b6Su4bUSbp1g2eT5RQuwiT
         K15GMADGuUKrQ5+qeIbT6EHmbvOJtdRydNIOD2YooYMUifZhJU5ZGM+0iDNdKKH9Cs8N
         3DlaiPnwoXS/gEkOU+Cs2vHHDHaoJUAnoOlHECTf3sxRol0kSHURFFVgpN9uviXBxZez
         ehUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768178077; x=1768782877;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jFVEfSikl3v/pz3ynBdmhJW4X8roL1IZM3tSP69lPp0=;
        b=NGSndRx12YBtYzeIKPlga3ZNbYocC5xWCJBl+dOHigzJu909ibJEgFY9Cg7Rz+GXar
         U2kMf6b8xl++0rzBUhTdbdfu4LL89UwY4WTqdoTOIj3pUppmq8US53bEAXyT3d0Guhyb
         3KHdSj4sSH3jnSXAH5l/nD7n39nSMQ6Zth56dDk7JDklqdGCh64Qzz/XHk6UsJNofBS+
         knQEM7vBdKwlhCjBnIOYD+LfskVhsJxEqQtxVEpC5YtLRnyYU+MQJTP1mBRbHmNVdyWr
         N0TxJ5gpOqiRxpGAu5Nsje1D41IfXMB9q7z37VqMCx/WW0K0lLcNrZx64FQkOcdj2LyK
         LI7A==
X-Gm-Message-State: AOJu0YxSqB+GYZTJ83wnLwwCEP0KHLvlci8CW3+/sCGfvC2d4AsV4f8H
	KqTka9Rw8uVEZbhgvibXpRY4WVfjodyvrs+ppL99tszijWhAFKhimtq2adj5InDXGTA=
X-Gm-Gg: AY/fxX6PprYbmSGUaVjlcAN0IRA5CQkHBZb7NswBIJiEwO64uFExnWWhhTaS96+2/Co
	0ourbI1eOxPwj9TcaV/g3vQpeyaT5gsqbtoNhxs/bPc39oPG5mXkSXgQ+ImLTW39tmRo0bwA8oa
	IkYCqXgrqi7uO6tSBwpzdHqu5w+hNT9Rr8XuMD8Rk7uABo393QSph3ep81Xs/WL8Wv2Gb7oy1Jk
	rd90QphYznkn+zGY2HThU0tNyEOMWCKdzYg185yrq24ByLvP4kY5FsfzNEid/kOdv6I0EWsCgXn
	XEzG5PUXfA76+MVBGWORVXzIjB4qi7tOmTXRqGeLJ6DtqITmq7LziVhoi1iyGr++IfimRo/4pDD
	yQZk0GUlPHDlnxzaGcKhOLrCWOWqUCf66LGpdswiApRs6otQ2MGf+Jp3kd3FvrbNrZYlf9EB4gl
	3HsI1v6ucrvogr1D8U/U52G0mcrhB7biT0xO1awVHX8dIfvRdbiGy8
X-Google-Smtp-Source: AGHT+IFFzw5ft4LZJe6ydEq5zg5HsTSxL9hjWAIenS++3nN0gcfVNBWLGgF42nlgVI5P7EBGrxlA6Q==
X-Received: by 2002:a05:600c:4747:b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-47d84b18a7dmr225507215e9.16.1768178076499;
        Sun, 11 Jan 2026 16:34:36 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f661a03sm341711595e9.13.2026.01.11.16.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 16:34:36 -0800 (PST)
Message-ID: <63205098-76fd-4a85-b7c7-c0ddfd974693@linaro.org>
Date: Mon, 12 Jan 2026 00:34:34 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: qcom: camss: add support for SM6150 camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
 <20251222-sm6150-camss-v2-2-df8469a8343a@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251222-sm6150-camss-v2-2-df8469a8343a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/12/2025 08:28, Wenmeng Liu wrote:
> +static const struct camss_subdev_resources csiphy_res_sm6150[] = {
> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
> +		.clock = { "csiphy0", "csiphy0_timer" },

Not compatible with your own patch...

https://lore.kernel.org/linux-arm-msm/20251114082649.4240-1-wenmeng.liu@oss.qualcomm.com/

Dropping, please rebase, on your own code ..

---
bod

