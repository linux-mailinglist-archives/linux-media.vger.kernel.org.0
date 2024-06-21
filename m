Return-Path: <linux-media+bounces-13952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBCC9128F9
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 17:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB85DB2E22D
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 15:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9FD4DA13;
	Fri, 21 Jun 2024 15:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hzWVJbG2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2094375804
	for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 15:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982344; cv=none; b=azDRnVpglbT3Kqs7mwAe9aDsY5Nlyw5WqUAyYoXMxMDr4I2AL3/AFPioNgFnafRsQYvesYSvQe8W5cf3eMNnWGlJSVMHayGJxvRQbfrSRQM3M4mwcav9vFbZBRk8Zz5+iy4iOrWikh/Dt5b4Gqi6bq18xdCpUPsNf4jIokd7sUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982344; c=relaxed/simple;
	bh=oROB6zkcPhJijM51Kx/Lm2MCDheAQ/kBtiXmUMODOno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DpjxsFuqqTyjkG/UbkuiUajvV/wQmhLwVd3bNOWRYVpWIfob+tbYuLA4Gw4Y3AqTqXffKgnqFXMyrGOGj65IqaMiRHjUd049QrywfOZH0w8xZlBrXwmW9DRUDcd0SB5heBvS7oHrA/+0wVBydWw/f9luzobjV5T30+xdhb709Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hzWVJbG2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-424798859dfso18591025e9.0
        for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 08:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718982341; x=1719587141; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g6wyzpDaEYz1jZ7XZEHNfhUtT2QhwGAX+r5GgVFHn58=;
        b=hzWVJbG2tKxiXISPlH63UmqKhG3dqUo4igOnUkX6BPCm3kRCS425pozD5mnj4wuKdy
         3qb8M/3zRiR3ssUSLMN0tHkOLjiHVdrqyrUS8zYVDEx/ZeePfH/lpBivjq3PG9aWItaw
         x6l7kfhih0Gxd5rEykW0aPUT8/p/9YmR3Jp23Nh4nW+jnkIBToHU8FmszqL4FEbTHsLp
         CxOpU9LiH+29us0BwzC/ih6YjoES1hHA4yyCkqcwTskra7P4KI84s+VKDCcqSEyvdWdB
         kEakP1heNRauRlvZ2oSruOsyXCgtBk4zfWl/ZSEbUebm9T1iCDnnDQRELjs0c0XqJhQl
         2+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982341; x=1719587141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6wyzpDaEYz1jZ7XZEHNfhUtT2QhwGAX+r5GgVFHn58=;
        b=GOAqTjKUswiSn7JCmDeYkjF4DIiej6AF8hN+ZQAznof5i0OYII50KKnXaX1uASpgSf
         zEzolRv83qPIVKZpCjmiOyDRs4P6LMDanRg/NXO3dWDWMwO27WFSleUmmchbuUGFmpFM
         +z/0I3ciwPJbMhygRHcp6i6QbP/ujsLUGIU9uNf2BcCHsgaYPxE+fBrRNDFwQVKxv8M8
         9QVjJaWRRg2NbfhEZP4Ao2LqncI33gRBYjIGrkIgTdI4iLIiFjqoug9gP+3lblwfkmHV
         oBJFFSMGsHSKUVBesqfFBHL2BEiDdQb//ZcjTdiwL4e6/AaAVMtam0ZFTa85cgwxrPD7
         794g==
X-Gm-Message-State: AOJu0Yy5IJczLJY4M3T7k/IFWDhJ3BQLZQrjY5mJvvwFWWz8zeCxtQbI
	nK8HCAJAHJpP7bU2ghJHMtSJYNjLxnxCazNwHyfmst9aZ+gPL59h/UISNXn8vg8=
X-Google-Smtp-Source: AGHT+IG/1Gew9+9g1SLRIZ/dhTycYZR03ouif9cQRx4UB9lHaJnlqUWPqL1xFvvDVGblIQTz5IpmXw==
X-Received: by 2002:a05:600c:2299:b0:424:78dd:60a2 with SMTP id 5b1f17b1804b1-42478dd621fmr61592865e9.0.1718982341404;
        Fri, 21 Jun 2024 08:05:41 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0bea05sm68063735e9.18.2024.06.21.08.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 08:05:40 -0700 (PDT)
Message-ID: <b487dc35-ab43-406d-9026-639b2b92aa5b@linaro.org>
Date: Fri, 21 Jun 2024 16:05:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] media: qcom: camss: Split testgen, RDI and RX for
 CSID 170
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, quic_hariramp@quicinc.com
References: <20240522154659.510-1-quic_grosikop@quicinc.com>
 <20240522154659.510-7-quic_grosikop@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240522154659.510-7-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2024 16:46, Gjorgji Rosikopulos wrote:
> From: Milen Mitkov <quic_mmitkov@quicinc.com>
> 
> Split the RAW interface (RDI), the CSID receiver (RX)
> and test pattern generator (testgen), configurations
> for CSID on Titan 170
> 
> Signed-off-by: Milen Mitkov <quic_mmitkov@quicinc.com>
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sc8280xp/sm8250/sdm845/apq8016
> ---

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


