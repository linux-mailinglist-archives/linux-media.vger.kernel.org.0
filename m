Return-Path: <linux-media+bounces-36054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFD1AEAC22
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 03:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0247D4A367F
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 01:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3154EB38;
	Fri, 27 Jun 2025 01:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mCWxXp0E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5605288A2
	for <linux-media@vger.kernel.org>; Fri, 27 Jun 2025 01:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750986348; cv=none; b=ktNHyzYGIr7KFAe+ffmx63RNoZGB/9QVY+LoyDGzlFdwcsXrgk4TbxJ4YmQ0SdgKu44H4oAzA1yO7G/Lp0OeZpYYxVcY08bedJ1yLbcnl0pJnlP0MdccEK6fhBbd9JH6GeskNg+rEAzwN0quqfOvHpkn5hzUiY2LInJbsbXNUYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750986348; c=relaxed/simple;
	bh=5pMT3+eEro9ox0pu/3gJoCitkuT60qFDYmpBxmejqZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPTCD46jXMd3FkgOsw5t3rctsvXvUS/VamOhn8nkWcI4hOZhucLmRpccRBu6DQTmM5vgDS46LsHXHinnQ4vvVLZ3pphSfSFX9wMYHNGpzz/8TudfYwdrGyCVZQoUxz+bnrqdsHcZWWCFmOzJVLRipbvFOxkIf0D/fGS2Q0ap4xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mCWxXp0E; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so1446523f8f.2
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 18:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750986345; x=1751591145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zCEH4/nYFQC/5D2TWQLQCIAUawTphbfim/GsSeVhbPY=;
        b=mCWxXp0Edg++D7XPrK91D4EXpGANa4cc3wqKnU7lbaLyHmbh1u1oi4QQwgHQzME2Ob
         GFTe43xf4cAnAqB9SLIpTNf+xBglj3OTc3yl2Y00yz5fKgqnMDqFYJEO/9ySK9GmG7Ja
         Ni5Uvw105ixK9RVs3WtrDAUxmBROT8MlrdSasyAZdmKaeMfhy168vGnCVvthIfSckGeV
         7p7bcP8HpSa/PVezEMrggjSpdfn+wNZQ2zSHfIv3DcxnjfktFjXEb4sqaJ2RtaZTmLtd
         xfd4xnQqddM/Q2ByLssfG5VewSOzvsp/SniHYe8zXDXN+S67cXpSa+yEGrT2jbCVSqDL
         Y6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750986345; x=1751591145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zCEH4/nYFQC/5D2TWQLQCIAUawTphbfim/GsSeVhbPY=;
        b=UFaPJbYJWB/XUkYj9yy/DMMioRpC0s1T8KxBkHYhkcUdlmhogMGUM328ppAdPg9aR9
         0QFUHUrNOpxdZSlhg7simcvFCdyroPO0PR3/OoY0fxPNRS7S6pQgW3MS/YzTS5g4l+ir
         f6b0GZu7580SNzcYbdxLPcIUxRT6Rz6HNVf1vr6wz5Bci13aDSOgU1QxpgQSCYCP3Bg5
         FZzzd1JfY+RFIw1HCncoq06NZ+nuQy9BT6SMgEo1t0JEU2K3V9k7KLNh/e9pHPQh8ib3
         W4E7FWhkJinNV9QyM+KQqmShnwNRUuQ2CSGxF7Dqw7UZY53KxTxfWpwcmYINXKm8XUgo
         eNVg==
X-Forwarded-Encrypted: i=1; AJvYcCVNarvGUNoQ/2y3nvBV2VumG/BxpV4zPrHsVd9pNiDC/f6qfHF20qFnM6jShGeZaNfn8SJH2w/P0lcYmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBvaufK0NQaQ6aWc4DJM1JlCezOvcPQ4kE5Za2You6IjLLVcYy
	xRcEhMaVLbqoFAeb5GiKk91KBdsf8evgZlSOhh5Zqsd5ZxiY/ONdYkTSqdD6cnTjFtA=
X-Gm-Gg: ASbGnctwb52s8wi4QCWHRUc7YBBphfSnju/b0vsokw+sizy1Ns7Utn8tg907bIYd1FP
	cg6tN29plDWbEhsCqiP2l+ml9knxUubpQ/a5pP1DFPzgftXqPj/fJEJiad6WslppQIcNb3+2NJb
	NQLSmq5Fgbz3dFygJp+qeJLoloLZhSMjM2Wwem0BhGro0lYExN1a4VAlbhFB3nLqyR73vFAWAF5
	fv3h6N4ESoLJQy/TCG+YcuMyhlXEg1lJ74qLMfTd+0NEaA9xzEWov56VGqw5pU7S24eWshtwwis
	bDn6YlXa+b43EY9PIwylRSNlLrHp3rXbh2FSlD/rdcMFWVFIiCnXcIR+YMMtWQAaw9dTYx3KH9A
	JKadQgb1V8Q+gD8Sn/TLUHrOfT1AHZP9uDF5/fw==
X-Google-Smtp-Source: AGHT+IFey/mVIRKk3UWUu/tEfrImgRAEJgM0T9pJubxRsrTOR9on5HnEM0Ys6a04nuCT6wlQIXOdGQ==
X-Received: by 2002:a05:6000:21c3:b0:3a4:fb7e:5fa6 with SMTP id ffacd0b85a97d-3a8f435e29cmr997757f8f.1.1750986345232;
        Thu, 26 Jun 2025 18:05:45 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45380d0f15esm59111445e9.1.2025.06.26.18.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 18:05:44 -0700 (PDT)
Message-ID: <9153b2cb-b123-4799-939f-cc8b7e3f1330@linaro.org>
Date: Fri, 27 Jun 2025 02:05:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Remove extraneous -supply postfix on
 supply names
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 vladimir.zapolskiy@linaro.org
References: <20250626012433.261328-1-bryan.odonoghue@linaro.org>
 <0975cd75-2363-44b9-8ae8-b2430799ab78@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0975cd75-2363-44b9-8ae8-b2430799ab78@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2025 01:43, Konrad Dybcio wrote:
> On 6/26/25 3:24 AM, Bryan O'Donoghue wrote:
>> The -supply postfix is wrong but wasn't noticed on the CRD devices or
>> indeed the Dell devices, however on Lenovo devices the error comes up.
> 
> Please give the commit message another shot, perhaps with "PM" in the
> commit date above ;)


On 27/06/2025 01:43, Konrad Dybcio wrote:

lol

> 
> For the code:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

thx for RB

I'll translate my commit log to English after my suspend/resume cycle.

---
bod

