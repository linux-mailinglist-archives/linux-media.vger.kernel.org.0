Return-Path: <linux-media+bounces-23239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9949EDD27
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 02:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9528E2831FD
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 01:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89557558BA;
	Thu, 12 Dec 2024 01:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d3QJR6qX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332015464B
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 01:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733967358; cv=none; b=hjPrE5xzj3kWvFKhPzuULxycZdxPinDG7MyquXfYoxs5GB+E9DeLB31Etspd7s1DiW3XIpkGyGOzZ2xc9jl/U5GOajvc3juLodq7KI9e/GwNz8pnzHadLpml41hIAYPcQl6meDN2E9gCOywyDB7+m5F3ceN+5l10+GASMbqpYSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733967358; c=relaxed/simple;
	bh=4I8gLbH5PN0mP0QVrcUYvhMHECsTPhYZMcXQ+WQ+Uc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXB9DPFMt9hrI2xoISyy+HMnC6datMSkOkM630vCO5767NgQ+/uzoKPNekk4tQP6FtffmN4NO9tN9w+Jow0jsklhLt/cNAOg7m7Blfh2nKq0rVYKXKLumUiyKp03vvUTww6Ec5nzaYUrlrC20aZwTh2HOMAt9FyZdO35sxVp4lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d3QJR6qX; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa1e6ecd353so6981066b.1
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 17:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733967355; x=1734572155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OWBYwTpQeje3+MoafQaLkq72MrcYW1QRecg5ZQdtiMY=;
        b=d3QJR6qX7NaDtFxjD2HaVKM15ka+CL4FmycuhGVcvU193ham67OVEVHWRAvdL2fFBn
         L4rSuM0QIPx8kSGKJFJ27wquoivXydzsaSyB62RKamesCymLF0gK6XQU1aANvA8SA84g
         opWuJ4oJm0ucRyVOW8VikUm9noo4wqT2V25PVDKt9hDX4hfX7DZ4FMznSKDauPaPqhJj
         vvQMW8mpB7R+5i0cvS80QfhgYOAPq7Y+fspXovMgKgWeF4m4fAgpXg0uYWh/WtRIl16D
         Foq2n10Sylra61fI0HnKQTmFgt5v7qEcorZD/KyaWj8XiNk/K/Yc87tXLWUvb3kcKquR
         DKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733967355; x=1734572155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWBYwTpQeje3+MoafQaLkq72MrcYW1QRecg5ZQdtiMY=;
        b=eTtZHmja6qF6/FB22ig6H+pOhhS4ycP3hVdr8rR88fQus4QvjQ4JI0gH5D/2slnMmI
         gvI2jPltVRgNTUsNTqZc1aPAQLO1w2TqOWioTDB7gtrevWycmrAmjrxQnpaRmKJoxWOV
         oJxaFhRvFcWiOyHJTGqbOeC5CFJWHpvMGpjY56NFOWbbs2yxM72jgLkqk7xBh2cYUqyY
         wQUfgEjSrS42n/3fqY2708M+f2/r4I8CLysyqhTsbKj0so1vwyWo24OrmsyF6+IoJw2o
         0RTV3sbXn9IkIRQhQtcZeX7EV4nM5u+L+Iho4p1yrQEgSN39FSRUSqYZNpDX3aFNMZN/
         7hvg==
X-Forwarded-Encrypted: i=1; AJvYcCXJDZYUtnk1ddr06XpJtxiS+jK28qyniT2ER+hPEnayGqD1PUYz4AGGiQd5Y/eTRfpYzU4MS/B3CFYGDA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6q00yVnFeGrHtGebo5KhOojQikCg9q3NA5CpWc2HtJmOuSAN7
	9j3svcqTgnAXf7RJJ74YlVmFJ7h8v/OABGSpw30B9/1XgOQXjVWkxFcL8MNGMnw=
X-Gm-Gg: ASbGnctqYCQYx2zK8n9ca27Tu6eSGCj8263Jd4AeZfDa8xylSG/+A3HR1h9zohzTjA3
	f7h4iU5VXdW6Dz3WYtkRxnStSG8zU2F4g02NqR2PPRHESXWKwWwpyF/dTZRkdi+JPjj3gLetxQv
	wxNalSTBKm5C/jC6DePucqLxjveHha2lwb3dxchsALG/j9+9pmWBaaYKWxU5QCOJ28pKocFE9SH
	L0XyFBW23xptNusBaFC8Hf4ZW+85IfzTU85ECV9goOqhvBTINw+CysHzdzI88Xrdee1cg==
X-Google-Smtp-Source: AGHT+IHgvSzHuYw/GrNRNjwFCk9Xmc3on0B3OZiRwksob+JXvyPD2txPuKabUXJltPHhBbSxp616fA==
X-Received: by 2002:a05:6402:360b:b0:5d0:81f5:a398 with SMTP id 4fb4d7f45d1cf-5d4330356bbmr10824470a12.1.1733967355629;
        Wed, 11 Dec 2024 17:35:55 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69c3512f4sm398006366b.2.2024.12.11.17.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 17:35:54 -0800 (PST)
Message-ID: <ef9a65a6-339e-4428-8487-ead242b3b2d4@linaro.org>
Date: Thu, 12 Dec 2024 01:35:52 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] media: qcom: camss: vfe: Move common code into vfe
 core
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-9-quic_depengs@quicinc.com>
 <79fc669d-999f-42f3-948a-ee5f3a91ddfe@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <79fc669d-999f-42f3-948a-ee5f3a91ddfe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2024 01:06, Vladimir Zapolskiy wrote:
> 
> This is a massive and a functional change

It shouldn't be a _functional_ change at all, just a refactoring and a 
reduction.

I'll take a look too, see if I can spot a regression on rb3-gen1 and 
replicate the breakage on rb5.

@Depeng we can probably get you remote access to an RB5 if you need it.

---
bod

