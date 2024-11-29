Return-Path: <linux-media+bounces-22339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8365F9DE657
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 13:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 494732827BC
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 12:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A0019CC34;
	Fri, 29 Nov 2024 12:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bkuvstxS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DF919C54C
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 12:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732883120; cv=none; b=HVbXloybc1oLP9hrqaNrV6A/yeMBJEKUlRA3Vxr4GwFqfUoEo4/QlrDEncSV/wZczPbODYObwHMcsK0bTXMSRGbdnZ/9gB4J/1PkA9I+x6uj+iGBOlbRc31VQTwvQRlYTc+/bRlMnjnQPlNUmeh3NJjoHVtaYTjDdGgllnHeadk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732883120; c=relaxed/simple;
	bh=o8HEnOjpe2SP2Y+jogFDyN/Mo0SW8oxuVkT4x3RnrWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJv5loRn+aAOBWUbOsYTKIls1FjRtHcvhgTDC7ky4XWsv3e9henWSKftRNKjgNBi1sRbZ+GpWGLIeFHPrmcAS7FjB2VrOMfJbuqM1QJRU7L2bb2979J3gu0TKPSFy2hIahFRD0PxAuIhjla4JSy9nHRRIOyDQWFDEYm6j1y4i00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bkuvstxS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38232cebb0cso1437757f8f.1
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 04:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732883116; x=1733487916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a9PyfoxYk6cSqtAE4cwiXMDHVr0/Xlhbbabc9YAFuxI=;
        b=bkuvstxSS+qwrR9GjvQoA/59h94558eTRpCzOI0W+FkHlyNB54386VcrVUJk1F8oG1
         rARs2uJkwC2WzdrLjWzo1wxiNHibBQC/GRWVarjHgaQaB5uRddAtBY4WMp0bPHAcLBO3
         Q8l2IKSakRt1m5PxbyU4SGTs/WNqlE7KcuCJnl5K0dbpU8IgRPR2ReCkj5/1rtAnQ/Rx
         w/s5LGD/4IDzamFLXC+hmnHhGIOp3dIOa91MYmXZrNRnQ5X8uGoc8acMyWzOoUVqVzRX
         8rUliTOYJBZhYZA+8IpCYK2+fn2/J6/52uF1L/oxPgmPPt9b/Fn0gYWFYnByB6Qn1Ss+
         KcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732883116; x=1733487916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9PyfoxYk6cSqtAE4cwiXMDHVr0/Xlhbbabc9YAFuxI=;
        b=Q35SIdzAebfEIEm0ABQTTGaM+kWP6SPpT1aibk5xSOx3Bo+CLGLWidRhaT+3Ron9IF
         bG/Mu3wBGiCsHkolvJPxGh2akJOC8wDKRFHYyxaRFkisbTzoAUinK9Xrsw8d9gTqR0tc
         TF4xWSqLIzzTKhNkYgxbJrZ4zXXnWnljW7Eq5l/kVwJm/5zix6xs8CaOU+qsZQYa4+k7
         D/yT81IBFoLL6xxhCT8NTyty2IGVXA+JK02ghDYa7EXzoVTRcdeSZKGsYr+XyHAFbxyO
         VMYDPKEeWbdn0gsFM4tzw0mJsNxc/lr5mplDmeMQeWbQTUzT5OZIp5L0h026SyLXjfcs
         dyrA==
X-Forwarded-Encrypted: i=1; AJvYcCUZzXDPTPYleh4wlp4euCl78yrVdewaSIqV/dNfwN4tl9u6lGglK70TFpZSZparTdsVWCyP/TwaE2twEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjcMowLsSUwohqITI4oDBS7y1G4V8hlDA9YzqjYgNWXSPcTs5X
	H4wfqOx6RF48k1lVlhVk/9M5zX3g4BTxneZ1mh9KXP3pMp6/aRnEbUHVZS0O4Bw=
X-Gm-Gg: ASbGnctEqNdDlqAR8dYifNyStlWlGCejH5bmxaSC9UiNOB1KLtKi2NBHmdjYDBVRZIB
	iXceEpydoTGCCxor9jnXbRHdXRlTi9An9g+08xaKYakpCrw19KzMp9rtPSJssCfuYOVZPlNPGSJ
	rSRrIrVcETsmFzMUKZ//XekjKQQe3Bfk3U5CU/vyqSpyNVKVYoovywS2lB2SbJqZV4Ojr3+jrCE
	bKDcLiBz78aH7xLPrXamtj9OuzbXT3wqYc7RvZ9zw3Srd2yNMfXUvGnPDYEJoo=
X-Google-Smtp-Source: AGHT+IGmoCspL3T/lhwTwBWMmmVpK4Wfl8T0tGwPv1bmoDJfk4x0AfSr2KSu0p2y3balC3pqTji+og==
X-Received: by 2002:a05:6000:4710:b0:385:e013:73f0 with SMTP id ffacd0b85a97d-385e0137516mr1722779f8f.59.1732883116492;
        Fri, 29 Nov 2024 04:25:16 -0800 (PST)
Received: from [192.168.0.31] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dc715a74sm2353625f8f.82.2024.11.29.04.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 04:25:16 -0800 (PST)
Message-ID: <8dfd2ee1-9baf-441f-8eb9-fa11e830334a@linaro.org>
Date: Fri, 29 Nov 2024 12:25:14 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: fix VFE pm domain off
To: barnabas.czeman@mainlining.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>
References: <20241128-vfe_pm_domain_off-v2-1-0bcbbe7daaaf@mainlining.org>
 <3a5fd596-b442-4d3f-aae2-f454d0cd8e5c@linaro.org>
 <5cccec71-0cc7-492a-9fb9-903970da05c5@linaro.org>
 <d3a8d38c-9129-4fbd-8bd6-c91131d950ad@linaro.org>
 <a08e95fc03fce6cb0809a06900982c6c@mainlining.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <a08e95fc03fce6cb0809a06900982c6c@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/11/2024 11:44, barnabas.czeman@mainlining.org wrote:
>> The change does not describe how to reproduce the problem, which commit
>> base is tested, which platform is testes, there is no enough information,
>> unfortunately.
> I can reproduce the problem with megapixels-sensorprofile on msm8953 and
> it can be reproduced with megapixels on msm8996.
> The base is the last commit on next.

Can you verify if vfe_domain_on has run and if so whether or not 
genpd_link is NULL when that function exists.

That's the question.

---
bod

