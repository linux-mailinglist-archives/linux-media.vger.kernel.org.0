Return-Path: <linux-media+bounces-22702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8837D9E54B2
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 12:56:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97B801882CDC
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 11:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7355C214A76;
	Thu,  5 Dec 2024 11:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gSaokD6p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E042144D4
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 11:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733399799; cv=none; b=gyQaEJCMwYhHDUrDrqD+rfRWHBzCJPQy93UKoaXhyHXFFUcEJaQON2O+hI5ZB+Egzb3lnfrS86RvWcMaypoXRzbfv/CjSr8x9RIK2Cy0+2HYjQqkl9YEMudgUdwI+bB8y74efXtcdCrBqRNqzv/Ap5A5lTcW0zucFHlRFnte63I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733399799; c=relaxed/simple;
	bh=jsU/m7SEIIFDJmhyxSYaMTRswrSMMAnmayMJmhdd64M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0+uUhYQ8xzOWVblxiQjHCGBa1whHP0hSPTtgTlXxfsxpmKo6CJ61oJ1CeGS8GoZvqfqHlJSsM21AHvVZ7jkGAXsWt2/c2W0K+qbxSyK2cUpROHscDHk425hn0EbB1t4oSD4kEUhoQb9LIwU71I+oTwk6slqqYa7gZ+XFR9xg3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gSaokD6p; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa530a94c0eso162854966b.2
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 03:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733399795; x=1734004595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cs9RMDRe4jTFPEvDmtH/eSMnjvvfZudpLPQ72QFuTUQ=;
        b=gSaokD6plYvYPl0qYwYlXhoCs6MaskOz3po8/8lSMP0x37ixBX8teAApM4ujyuNtLr
         bmglAfIJ6ScmL03PxbSECkeog94hJKn+1z15y4Ejopom2bSdC+POUBubxF4jCcVVECkk
         zxD9DroYCHiAonPqmc0xj6AzevTjy6TEoSDtrppBmB7fjpssgiJeBwhqmb5eWPVYeb98
         V8sq9m72/LWtIIJ6BDnEgqr7fpBipOFxG9inrGdG0Bt5skiTxGkJUtmsUsqZfDjC2A8o
         VVaQVqVXkMPfM6tHGdEyArKXm4xikoL727azGr7mfe3Ni8Y0Ih2sJpPbDlJnaaDaIjyr
         2lGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733399795; x=1734004595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cs9RMDRe4jTFPEvDmtH/eSMnjvvfZudpLPQ72QFuTUQ=;
        b=T+566JgNkou4qT8poExZ5LC78zQeuHBELwFdwu4cmud+7xzoR2rRXmkDjJO+Kk+082
         3Rhng4sOgNtAYfo5egP0VzhORtcjbMJDL02NBIm6+RXjA5Wsv6T6s9OVoqN2CzLWzR91
         IW2Yqd+Xq9WBmXCOyt3myz9R9rvDeU/OBT8R8M8PGg/jOFnx397rbB3Kvgn6Ep8CzPDO
         nt0MYRahVLriStJsWdx+PAAyG/QlBy5NXB4HtY63H1HAh9t+WTC3KD6y+XAmr+o3hIpk
         GBAnMYnDQXtEk4y3DtTJzx22ewY9k2bNZImoGsoLHlEzdTmlwwUHqOMjLgLwMHJP5+nt
         qs5w==
X-Forwarded-Encrypted: i=1; AJvYcCXirN6vKEJa8xW1wIu30s/dr2V/WVJCVPOJOuC0zUnCqqqsJ4n8Bcw61rKu4CtAcnXx/73ucuQEheGFOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo48WvhDFd4JA4qUxyVqq3BlEK72cP7dMWi1wAbXhw8dKz+Qat
	/vgpUrgItXxsiUqwfNJ/Y6Y9I41wyP4ROm7eazGvoT1gD3Tjbxmm425A0TSHCkI=
X-Gm-Gg: ASbGnctO/tt976ZF2RxMLgnwOF2/00VgOShxP4IVw392ezsbgdvvbYOKrwk1wEGZPOr
	N0hZZBKWc20WlZBW9AnAI3InQOfs0faWD68qxE2xg3lhjPXvGXZ7eho3HMW+BWHp6FkIo3omUSV
	x8iAQMNMGkBvfFgJq9dLfD6hq2678gZ5+D09y4lYjQUE+ntbavEpsp5TnxhMHUTI0iTaJKlF5h8
	hhhZb9DWlFFy7RAVaGzZ+7stef/CCpdaWvMC9GayhrQ+UpDB4PJeZEC8cS19ws=
X-Google-Smtp-Source: AGHT+IEWGiuqCz5p22sJv4oUuBbuzMg9J4wgAEUTDCD4f1ma8OOcOH3epiuHrkUATGhdMfNL7flyUQ==
X-Received: by 2002:a17:906:23e1:b0:aa6:312c:5abe with SMTP id a640c23a62f3a-aa6312c5c99mr28100666b.58.1733399795552;
        Thu, 05 Dec 2024 03:56:35 -0800 (PST)
Received: from [192.168.0.62] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa626088e8fsm81659766b.139.2024.12.05.03.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 03:56:35 -0800 (PST)
Message-ID: <2cb5940b-3779-4450-a213-fa766df7f406@linaro.org>
Date: Thu, 5 Dec 2024 11:56:33 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] media: dt-bindings: Add qcom,sc7280-camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: rfoss@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-2-quic_vikramsa@quicinc.com>
 <oko5qqysmxhicqzkwhkz54wvsmt64ba3cd37zkcy55ee77owbk@5z3zetfr2ejx>
 <eaffa633-c3a4-4924-8ba7-694b18bf92ee@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <eaffa633-c3a4-4924-8ba7-694b18bf92ee@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2024 10:59, Vikram Sharma wrote:
> Hi Krzysztof,
> 
> Thanks for your "Reviewed-by"
> 
> +        camss@acb3000 {
> 
> If there is going to be resend, then node name: isp
> 
> Sure, we will change node-name from camss to isp or camera (As its a 
> part of generic names recommendation as per the shared link.)
> If there is a resend. or we will address this as a followup.
> 
> So
> 
> - camss@acb3000 {
> + camera@acb3000 {
> 
> Best Regards,
> Vikram

Please no top-posting.
https://subspace.kernel.org/etiquette.html

Shouldn't that be isp@0xaddress ?

If you are making this change, please remember to do it in both the 
example and the dts.

---
bod

