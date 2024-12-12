Return-Path: <linux-media+bounces-23321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4179EE6E7
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 13:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9D18165945
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 12:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7802135B4;
	Thu, 12 Dec 2024 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KwHOg104"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64162213237
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 12:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734007273; cv=none; b=DUsXGRT5OJC1kY6OVOnji+cZ3nQ/4lgzL6v4n7LCr7gyExjvCGVAD5QaOcSE5OPMAS/xfCY3qKPzZfrv+s1dzPG0LXKVNAMNOpMNHpAATHG8gnRVKqbDlu1as8fkgFO7OqilGxldlCtQLBj+8fDoaeFUDlrKikibLx0U23aMlXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734007273; c=relaxed/simple;
	bh=Tu/dFKzeet27GmDqbtWEt4iGTBlq3wEZqSveNunZQyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pCMULXyeEMLa80+gH7UiiM0nnAUnmXs53fRdPSMTaPjvr+q6jJsahFIZmcrqio3J5ZqW7Qm8SIRZr44+YQsATgyn7NbtoKOEjodTnRhBtx6IOvZNIcq1mP1hEHOF9d0lac0OYGF6qfiVIigBo6qOReM4tgX0/r7fMZOtrXDcZXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KwHOg104; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso876211a12.0
        for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 04:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734007270; x=1734612070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8bkw8aLWhg4IdC3Iyd2UGPgLYgTX4eLLSzr6WZhm6c4=;
        b=KwHOg104tECUeLCic1AROAit2IBxU/WGSotQgXtsXdvytz1q/epPlaZQVKNnQCIheK
         FsfkCXS6s6trGXfAChurRlz7DDJcbKH6yemZgn8f8kIFq9+DvnsAHNT4ZuZhlTFy+GG/
         jJcxoIXrphCH1gr+fiUDjbT9aQaVHqdw3Ldf97Am+c99blwgiZCJjT5aDkuJ6tXY6XUe
         ChMMrimbnQcMTBxkOazSjqS3dvkS/fpLFzlPbloC7LdnutPsmP033JNyqtoKUj//UZLs
         2MGqAdkEMMoAx6txP4aon8iGMdpbv+THKqc6Al9RJcEzZNXN1R4427ZNXoTPJxieFEjj
         mMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734007270; x=1734612070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8bkw8aLWhg4IdC3Iyd2UGPgLYgTX4eLLSzr6WZhm6c4=;
        b=csuk0c69E3EkuwYe153xw6PColamTQNvDEXssbWuLW9FqkotcHYBXVB4bMpSNxfiW7
         hB/yeTuEUxrGu2r1d3Cbe9XKe9mf6jyDRV/iivZfu74sRBVwLAbpF19cGRm7o7J/r0a9
         ihsLM8Dbvtvpkms+NGhqrbbQbyGE0n0dGsUTyqk8AzU2R830k70ut/PdJ5Wt4YAGDwb8
         dWTRQW5h3oG8h+CE7oSMHPVb4flnhC/9NkfT08qWHeTP7Oa+SsHGaL8aZUPhwTFXm7h4
         3nl799+OF1fSDjsHuWlAFt+ow8k+7UUC+byahUE12qp9wfRjU/LVJ05nr1LBLmhSbEhc
         8+Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVEkgax1dnsUlYm+yqYWyJXEzZvammCQxsGuJR/zd6HfmP+jnGBOI+ub/0POkcYHpbhii+w+zh2X4PUVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2nXEEP8KtludHgxp1PipfDVPnwyHhfg6GxAi0wX5yWufWVDwt
	5dBY/EOjTyNk5EubUbWn28+HiXQFdIynO2waQQb6IyyNPNvmxxJPYY0OykWSoQk=
X-Gm-Gg: ASbGnct1DpnTc2ynFo95p14DE4U3ITjrffgR6HYkI4QznSBPeHUnK3bXRmCUoUbk8BE
	bdNE6xcHIuxFkNJ9Sha7i4q0EhZas+uromBnZ3K9hSH30d75TcpxFMc3dw2tcrnI06gxpoOddfs
	+cY5AcrYomjJ1mqcWqzfCb+kiNQ/JiOQmkzF6eWc23EXyb0zSvscNa6Yb9ZTZ6liHMALfelR7cC
	iHUoQtQyIB8ddcT0htrY72qBWe7Y+17g/jov4Vz/pa9C/wOJgUnJK8ZpyrTvqa8BOy/Zg==
X-Google-Smtp-Source: AGHT+IFur+anvIPrRfunzJYLh6wEtqp7DK5VjkUBpxyuQDBjTbkTiH5jVNJtu8OGD0/LBKO7AI5Oow==
X-Received: by 2002:a05:6402:2396:b0:5d3:e766:6140 with SMTP id 4fb4d7f45d1cf-5d6337e00a8mr76871a12.24.1734007269761;
        Thu, 12 Dec 2024 04:41:09 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d42a754cb0sm3172232a12.88.2024.12.12.04.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 04:41:09 -0800 (PST)
Message-ID: <b4afb2ea-eb5e-404b-9df8-3e11d08a6bff@linaro.org>
Date: Thu, 12 Dec 2024 12:41:08 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/16] media: qcom: camss: Add CSID 780 support
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-16-quic_depengs@quicinc.com>
 <138cc2e5-6b31-49d9-b70e-400a3f3c3bfa@linaro.org>
 <28b1c828-f338-4d57-bcb7-b0a8652c82fb@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <28b1c828-f338-4d57-bcb7-b0a8652c82fb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2024 11:28, Depeng Shao wrote:
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Vladimir suggested to add a dummy "return 0" function [1] for the 
> unsupported interface. So, I added this empty callback, will keep the 
> empty callback if no other concern. Thanks.
> 
> [1] https://lore.kernel.org/all/b1e1ff88-5bba-4424- 
> bc85-38caa85b831f@linaro.org/

Go ahead.

---
bod

