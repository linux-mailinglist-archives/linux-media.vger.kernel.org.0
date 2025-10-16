Return-Path: <linux-media+bounces-44744-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CEEBE3CDE
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 15:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 843911884104
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 13:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CC7326D70;
	Thu, 16 Oct 2025 13:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rv2Y+nfj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C662E2EE5
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 13:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760622615; cv=none; b=l2qu/EIsHPgnmEs++mlA/AZs8f+rW9ZEafiM67oHADVfIdn0n6w0fpFskLfiMQvdMeaXgGJZublG4zeDC4XEA2yQ0Dh4FPbMwCF5pAYnZFQHx7n52sg/MetMR9mLh6G3nYO5mVQ5MkgQ8u3cCfQ+k1PF8jY+PDCpTSwblFqmMX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760622615; c=relaxed/simple;
	bh=bP4alRLMp8v1Hpu3LoBwktpDq8eSdwqK4/h9cUUAB7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WvC/r8hvnypbL+iciIWckiwEgZCZ9LpoN1RKBKpg2jkRQyXdMHc5lQda0U7kh0wmuGpwU+FPAzx8Uj2mi3vzKZg7ENSQ0hBNjXd4m04V59CI/ODj3kFtAIDhQJ4ijkTI+4+f8Tri2E6N1S9y4JDYuGLHiROXskJ9W9E/7pUDRJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rv2Y+nfj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e6a6a5e42so3970165e9.0
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 06:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760622611; x=1761227411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hK+c3Sqr7ykcDCQVa18MzhpkbqW6FL16pH0MglrB61g=;
        b=Rv2Y+nfjNBNk5mveSdWcHNW0rzXPFKBacSRTnrmZd3hGe7nU8udyqY9MD5kc4U8RrC
         TOXgYkcXdWBOopUabtYsaf5lDEXL9RqKD/6hP//zYSCFWqGt7kgvcILK819HTd7AgJCg
         mKwXlV9RphlhW21tmkojRkk3JuHfmeIcSTYs6j/fzFzw13uEL84PnyMylS8PKBDYfrG7
         qBs0NncKh4kqRR2b8Dpha/z5HlQebyzDkwcn7dfY+VxmljP9NFObbz6XtEbm8yRbMYiP
         oQIE3ZQBnaa6BO4RmHlVktHJ7txjUx+vZiEfLnn4AelGM9bEkU2PJhySESfy2YN3LsxA
         1gtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760622611; x=1761227411;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hK+c3Sqr7ykcDCQVa18MzhpkbqW6FL16pH0MglrB61g=;
        b=Ve7I37Jf3AI4fY+YNjLfMtfOYIYvCdodyguc3O5hj29LhBNI4fu346ugYC5bSKHDsa
         2BstXDdiPysDHfZuKEd/54NiGUYHlbCXOS1E7y9k9T+kZKpRBeMSyEYLie7Bi32S58j7
         Eg2ryQBC+9Q+F/oyyimCdS/uCZE74De/Q8IryCxCJ4quU7aIa35LvDBGTwDM1Af5SB28
         DP0tcexAwJJWFg43jpASaPCy1gJRnEtphtjYYpltsHMM5O1Gmi8ktgWIxynSE3AEiFrs
         33Z8nT5JIFdprWCF0x4sbXp6uWdAxvIfnf0HV4K8SxKTlPsfIZQ6I0DrXp1lUXISrmrE
         3znw==
X-Forwarded-Encrypted: i=1; AJvYcCW8xHhY38Ec+D7+pWO8qQQtUGnvviSC0MM7hgHIdXpSA8GO589rJZrpxJtR/fD+jMPLrdgVYQDz0VyHoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwMy1DgQHW2Z1OJkNYxNHsk8PZj0hfVjqjNHmP3jK34eK1vFU+
	xlzCr0u004W8SRkam2pP+JQqg8ilg0/RAcqlyd76FypKx6kid3qTesz+V35e6DozKeY=
X-Gm-Gg: ASbGncux3i6Uv7qTikjgPvbvbbJroaTXg3Ss6H6wUccHgtnIJYmxRxhamnVQnV7ZldV
	DRTOG5thlWmnk5+ybFg+6C2jOtzuDZT6ZaMUhNP7vD6pcIqfq3o3IJTvUXL6wVmmev+dosM9sGR
	TSa+/7F2NOKd39IYu6dSprbTayx1qlHmlYDKa8EjchlJn4PcaaAJDJoJEe4AUdFYYiwKYYB3vJA
	SATJXBGLruCIBD0hwckTIcvpHlOfS/uGeqUktVRfxUhUpEysjrWWp9KWLxeKTcya7e3pzXn3PlL
	LNREsM2MwTBEB64wYPMRxXauWudugpgSL9sl13t3FGTnr1zOnk2om9oiUfQY9HSuHukZFwCrw7h
	+hjqCCSNN/R+uRruVINMnA3OSzNKcz12+H0r1OIY90bcG3hXglHEwiDnQ1XIDzZRjww9iQTinGV
	73TEFxZYCu0l24uW5eE6XrhYMPZfqqphozQhmS/GC/P+csyg==
X-Google-Smtp-Source: AGHT+IF9O9+CY3yIGfpHSEcpC2cDiM18bV3XDDECDyPk3t/QicECJpvFVoKsQOEP0AiZOjlLD65hPA==
X-Received: by 2002:a05:600c:37c7:b0:46d:3a07:73cd with SMTP id 5b1f17b1804b1-4711790c31emr154255e9.23.1760622610858;
        Thu, 16 Oct 2025 06:50:10 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42704141cdfsm1629287f8f.4.2025.10.16.06.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 06:50:10 -0700 (PDT)
Message-ID: <f1cc3212-f1b0-497a-9990-8d523a0f9c61@linaro.org>
Date: Thu, 16 Oct 2025 14:50:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ravi Shankar <quic_rshankar@quicinc.com>,
 Vishal Verma <quic_vishverm@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-4-quic_vikramsa@quicinc.com>
 <ec23a3b2-fb50-4da7-8912-512b0a741ecf@linaro.org>
 <564165ba-38ae-4c86-a980-b2342aa20695@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <564165ba-38ae-4c86-a980-b2342aa20695@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/10/2025 13:53, Nihal Kumar Gupta wrote:
>> I'd suggest to add a description of pins with MCLK function in a separate
>> change to the SoC specific .dtsi file. It will cover gpio67, gpio68, gpio74
>> and gpio69, so here it's a MCLK1 pin for instance.
> We are currently enabling sensor only on CCI1.  Pins gpio67–gpio69 are used by mclk for cam0–cam2, and gpio74 enables the regulator.
> Since mclk is sensor-specific, it's added in the sensor dtso.
> 
> Would it be appropriate to extend mclk support to all CCI instances, even if some are not actively used?
> 
> @Konrad, @Bryan, Could you please share your thoughts on the above?
> 
> If valid, then cam0_default, cam1_default, cam2_default should be added in SoC dtsi, with references used in sensor dtso.

Anything not muxed should go into the SoC description anything board 
specific - mezzanine specific in this case - should go into your dtso.

A few of the camera pins are non-muxed as I recall.

As regards splitting it up.

There's no use-case for non-muxed pins without the dependent change.

It's almost never the wrong thing to do, to have small, individually 
independent patches though.

---
bod

