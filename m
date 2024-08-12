Return-Path: <linux-media+bounces-16134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5346994EBDA
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 13:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75DB01C21423
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 11:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D8C175D4D;
	Mon, 12 Aug 2024 11:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dS781GUs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921B0175D29
	for <linux-media@vger.kernel.org>; Mon, 12 Aug 2024 11:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723462336; cv=none; b=LYmJ9K5bEhlQqqti1vdn0U1vqKusrR9wDWbF3TOQ0baH7KQoqHwYszWO4do+ODx2OjlCSsLaxuF/FZj+L83ctz1jrI6E7bYMr1KOtxyiAV7gwKKaGKG4vLesuPxj06NjQ8nEcyWlLTX/Y9QAYQSMjPsKGcc9kIbjmcjryA2mDhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723462336; c=relaxed/simple;
	bh=Sn9icOhMEkpoF0A6tI3yE7WA9lul1v5onDCX2r2+Qrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vd3x7fv1owoI222U++tvaU2YZuMgk2nl8FbVviOUtxQhoywoRZEAujN/8rGTjLM+H5SWyWNLMVMXcu9WW/uWIySFQ1F4VRKFLNJufObVXdGHnUVMNh2r5wParehX+pNytgKDvRfu9vpXLDTYelP1U4w5je7hsxeu6JicAm2VzbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dS781GUs; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3687f91af40so2555211f8f.0
        for <linux-media@vger.kernel.org>; Mon, 12 Aug 2024 04:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723462333; x=1724067133; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pcyTK/oFMaR/LKJwL+lhFRbctKc9N7kd/DA0SliDqNw=;
        b=dS781GUsOJpq/5SPqVVB60Ti90hTdYQZEfWn90Ul/xJzZp0drpkmPJf30f5VEKKphU
         aSle2ZnKdc9DLiP3XgICnWzzh2u/9ceeRvR4pHs05A9Tk7uigBhn9cVjMza+fgNGHcZb
         wNy+yY9uIheV/5u0It4vqdzx+zVBCwYIXWdj32wvTs02MMxkpXB0VB/8jNhpmm9wnkOX
         q9roSdAkYntSq7X9JZhupgJiZmS4ol8fSX1d1PoXY3PkwkdRLIafH2eHFOsvKkkY7sGv
         DoOZVkSEX9lJHtzMDIinS1ukDLu+jcgmig5z1K43om4tENRPcU7pS+PpAUcfZ634yCvG
         umVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723462333; x=1724067133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pcyTK/oFMaR/LKJwL+lhFRbctKc9N7kd/DA0SliDqNw=;
        b=OvO+sS/AvidObPREcQl/wsFTEBqXI4v7nwK5XI3ibl7N4uneUoEspJ+b+JoDPSSFZT
         Gl8QGjkVOJgRzdt7KB/n/+9FHj/7k2fVQSpWB8CwQXQPQV12DFCQ08PperxOtO+KW1Y4
         8OHntHFBw9KIjkFTZeuCfS/py57QFTrz1yKo2IATqpnLdRMgKoyw/jy2yyvah9HPGOcD
         be5sMl2x/YuODRVdDXmwcaZG0OS2FgQRdS1w5kTimHrkPi8rgZblkEjlhFAiAmjxgx9a
         b9rsKDrRqbDZut9OGPW4vwuFiv+ZgI3a/Uki70w8UcIHnzEc9Hkk50XdO8FBVl7R9o6W
         NYyg==
X-Forwarded-Encrypted: i=1; AJvYcCW9LQGf/w1D30NgtCnT/4NAZ/uibTD/VTAwH3DF4v1RBY35gDBU4J5W3gdCldtNt7ejhJwDNoQjoz3ZWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEeX1iPbuBIXfM6RZZyLDL5cCTkw8gxdcukmri16yQvgQfdnKv
	4DNhqV+U1Z47gZ2edJPGu4hkFdfxj+39WiV2xJi+U9A9AuM1AQr4lgLdcOGSXcY=
X-Google-Smtp-Source: AGHT+IFKMt3nGJr3TmBQHVfbwLzP7ID+7QLqJpZ8Bb1C7l06gp6nyMd4PGALNfePozuyllzfm0jwZg==
X-Received: by 2002:a5d:4ad1:0:b0:362:8ec2:53d6 with SMTP id ffacd0b85a97d-36d61cd3550mr8292553f8f.61.1723462332792;
        Mon, 12 Aug 2024 04:32:12 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c937b6esm7261016f8f.32.2024.08.12.04.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 04:32:12 -0700 (PDT)
Message-ID: <e7476a09-4e11-4171-89ed-61b41c9f5cc9@linaro.org>
Date: Mon, 12 Aug 2024 12:32:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] media: qcom: camss: csiphy: Add an init callback to
 CSI PHY devices
To: Depeng Shao <quic_depengs@quicinc.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-5-quic_depengs@quicinc.com>
 <6dfc2c79-fc6d-4eed-bf3f-94396130cb4f@linaro.org>
 <fafda7d5-3853-428a-b0eb-9993fc2d4f56@linaro.org>
 <4426c0e0-f877-409c-b2d2-a5aac5e8c645@linaro.org>
 <1226d080-d1fc-4e06-ac81-84e93cb314e0@quicinc.com>
 <8f935a7d-87b5-479c-a98e-c95671dbe259@linaro.org>
 <7c03280f-908d-435d-acef-b6bf4f865029@quicinc.com>
 <ff12ce12-41d6-4aa5-ab97-222b07146e36@linaro.org>
 <3241cc15-c920-4c88-ac53-005903baf9e7@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3241cc15-c920-4c88-ac53-005903baf9e7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2024 15:02, Depeng Shao wrote:
> I'm updating the code based on above comments, but I meet crash issue if 
> I move the offset assignment to csiphy_gen2_config_lanes, since the 
> csiphy->res->hw_ops->reset(csiphy) is called earlier than 
> csiphy_gen2_config_lanes, so if we don't have the .init interface, we 
> only can move this offset value to `struct csiphy_subdev_resources`, but 
> if we add the offset to `struct csiphy_subdev_resources`, then below two 
> patches are also can be dropped.
> 
> 
> [PATCH 05/13] media: qcom: camss: csiphy-3ph: Move CSIPHY variables to 
> data field inside csiphy struct
> [PATCH 06/13] media: qcom: camss: csiphy-3ph: Use an offset variable to 
> find common control regs
> 
> 
> Could you please comment on if I need to add the CSI_COMMON_CTR offset 
> to res directly?
> Or add back the .init interface?

Ah, I hadn't recalled why the .init was added -> because sequencing.

Lets retain the patch but expand the commit log to explain why the init 
is being added, instead of jumping through hoops to restructure to get 
rid of it.

---
bod

