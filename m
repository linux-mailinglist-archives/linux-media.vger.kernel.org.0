Return-Path: <linux-media+bounces-25083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C8BA18870
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 00:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19A967A3D7F
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 23:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD6F1F8AEF;
	Tue, 21 Jan 2025 23:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mCwquUhQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E9626ACB
	for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 23:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737502735; cv=none; b=KSlEbiosMey2TKWT/rlXsCTkC6RAZmtrPfF5uEy1HDuxFsu+xZnOzewYDceZLqYqYiKRjkYcfVzsOU+1JS0+8UyDNqea/jn7M9yIWMEmqyxYLTmF6IEbRe69dhOpME6SwnuCpYk5rIiU3mxjALCqQP672u3oCqhQjDAiY6ZwOwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737502735; c=relaxed/simple;
	bh=uP0BswBeoqMFT39VgZoZVsIFI11gL2q+m7G5kecEjiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBOucBqahsyEYXTU7zLBSJ/3t2lM+IL7hf8hAp8y3Ec691QmsUhKi/XBcRmQHdXFgHfaL2cY/ppNYg/xYN1ujdxhMW2GBAYG4x2HvahcBVWthROTPCmXD0f0Tv/QQylXCpMp1RwP2ihziZ+eoofPHuieIyKZ1GbDf/9rEMzp7tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mCwquUhQ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3023fcface6so2290871fa.3
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2025 15:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737502732; x=1738107532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=auGaFGS45UkLAlxjJAKbb2IZBDBtcKd32rJyiapnu9c=;
        b=mCwquUhQEZdDBYmNUYZAFFz86wkwnwDtAS3ND+u4UYun8rac7eAhyacMM4MHeIauHg
         1LnF8esly5MeqpvRHjlFr3Hjly6U9xQsNDn+FkVfIxhf3Vzrh1l9F9yY/EB/ltKdrYDF
         XSgKktx1P1mioZiMg3vRc6itG8rx0f/nJSbBBfIcPCA+nu9csL8CudkYxxRXZTVmO+O4
         oo8E5RlTwO4D863n9SoWOLMswkFHc967vGduWgt8sO21Wy/wVNtqNRVs2uzKVYcgXknK
         F5FuvdG2ZgSRCBzBg7EYANp3B/VHF/Abr3TBSMUvM3nKYKryl5dip5C0PEUjgICchGX2
         9Hrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737502732; x=1738107532;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=auGaFGS45UkLAlxjJAKbb2IZBDBtcKd32rJyiapnu9c=;
        b=g5lxxJ6bMkQcC35Ki4l4ll0iY7dA8ueu011wLBe9iIXVeGzfzeKai68ZMmv3p9EPf9
         OR/BJuWOh/TVKRVT4ZYG2gl1rLqNS3pu13H1xrNLRbFe/f1HD6Vgx2oKKuZzc3dtSFx8
         iL2wi8uTDbYQkBKJc2MduuCsQkZDjtpz3YNN44XnI5Pvn++cnKziSUIaxTCmdtFQn0wz
         T/rYSHbsULLeCCcOjiyq0XLp6w2iYFRM95aXyu/ZS0gG5gGizVx+ZfGlRK7eCmSoGpNx
         Kz6UuX63uP8/ok+rrSKCSNonKGCfLht2AeJUIUc4IU6UsBkwbsKHnPoXxDgopzYYu3U+
         6tIA==
X-Gm-Message-State: AOJu0YwHnNb6FtIJILf1wviPoaSQolPizN5SmU22jJ1isZbq0/aQpQb8
	Ce8tJCQMqXmuUDk6rXKOjbO72YHeRH1VLgmK+OvNwU+VjOY9Wl3wVpsY6VthWQBPIoZdR2JxxpS
	+
X-Gm-Gg: ASbGncsv2AhWjjL5y1FOj5woI+4loZ3SSMlQAsx2qoIGdw49ZtSTi/1TQDBU9zZI7j3
	YLJ7ox3r5/QNvX2OYtv8X4uL4jt707snwD01YVUR+C39VRpvfhbWyheegZvCe6lA9bwovS7MxYB
	a4JQRFPvZWTPuS+Rxjlr+Ec8M1BwUTPHDZvHDgHB3/aeBCINIreyyRYTjVAFdmMsHa4j4fez3j/
	q3yVonrsyu5K9vH4lKvVtWFGiTf+J8+5eZVklEgOeTlJ3U7zYYhwYBQw5JzmLUQtQhzngNX2PQ6
	58EjOcff8L3XBHpVdn/Vsm6KVfa+lxEDF2y+oVLRZHfYVWJ0
X-Google-Smtp-Source: AGHT+IFMHChgrg3sylYfBZUTmtf52BjnEer874RN5zESRym28B6F1z+CFKsgNj+PMogdISz3Y3pp5A==
X-Received: by 2002:a05:6512:691:b0:53e:349c:45b3 with SMTP id 2adb3069b0e04-5439c246d95mr2071030e87.5.1737502732073;
        Tue, 21 Jan 2025 15:38:52 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af07390sm2058674e87.22.2025.01.21.15.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 15:38:50 -0800 (PST)
Message-ID: <c6087d61-325d-4080-a63d-e735ad6640d3@linaro.org>
Date: Wed, 22 Jan 2025 01:38:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] media: qcom: camss: Add an id property to struct
 resources
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
 <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-1-44c62a0edcd2@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-1-44c62a0edcd2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/20/25 17:46, Bryan O'Donoghue wrote:
> In various places in CAMSS we assume a linear set of declared devices
> {csiphy0, csiphy1, csiphy2} which currently works for upstream SoCs but for
> upcoming SoCs some of the SoC resources will result in a set such as
> {csiphy0, csiphy2} which will break the naive for() loops we have.
> 
> Introduce an identity property which resource declarations can populate
> hence facilitating non-linear resource naming.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

