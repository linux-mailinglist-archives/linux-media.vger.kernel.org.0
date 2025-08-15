Return-Path: <linux-media+bounces-39988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05335B27FC4
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 14:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B48444E2F5A
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 12:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF263009C8;
	Fri, 15 Aug 2025 12:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GybUxoni"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E51B2FD7B5
	for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 12:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755259960; cv=none; b=pMr9+R3VDzbuqTaPK3KO0incrGRgZztX8P83X+g6oIrg5bOHYeJJVF+vn/QTkZGtKzaTN3alxnMnQ4ZjJBSNLGGJnPZYejrR8pUfSGkNAWnjj818MQBKyq4xOEg85NODHbsSKAa7tAS5KTi4jl2r6CROWhm7AkFEKtQKkrMLiCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755259960; c=relaxed/simple;
	bh=i+iR6E/PZw2zvYS+1CSb3nvFYNeJhf1t0/Iolj8tVBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rG57THboIrUqFKmhpPySoJUBBOygrvC0G2ZLD3VlwUTqXUylBECclIpMneRqc4z5AJsBa0GEYgwXkfkShwW+SMbahS/VoU2WO5bOylsh8EM33QL7VXt7LRZMufLdUeMe4fDIyAX4j+3NQfVSjZncza3aMCWLWzFRZClJhEMRfg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GybUxoni; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b9e41669d6so1527200f8f.2
        for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 05:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755259957; x=1755864757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Ilh/SLkuCJQN9VcNatiV3+rgy9qynKADomWo9vAL5U=;
        b=GybUxoniXi3G1h5L6Te7EoAKJ8Jdw7g+Uf0w4n8MTy/xPN1DhQVREEZwSyt0VtapRE
         qsDGKwXumwtRMkwEaYHc4wBMnHkqruycCRksuHyTNO/mhG3UU6u4peKHL5BLeQMxcSAT
         rj6MCjOv70RMm/t+8e9LNpYINk3f1zUI2iIYUZP6HbIyPu5LndUP+lQRx1qCt59qhChk
         YwymPxOOJfZry8YE0CB1yUK6nFa3yP/+PmsAXwGIS2UfOn2q6NcRjR6x88H4UxKONvNc
         PfV3rRXZoa3ItwVyYP+yfSXLITeVE/d8yjSBq+9qBNdPQ6hCsUvY4Sylv/Sb6Aq3QL3+
         2phA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755259957; x=1755864757;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ilh/SLkuCJQN9VcNatiV3+rgy9qynKADomWo9vAL5U=;
        b=ONgbY76PpfZNCFkp5Pwvh084X1LM9kfnVeHWEFoUs8TjmgX2HJySAAjYR4pivfLodJ
         We8tImZKYoLnWUcpvHOSJebcZ7pQDJp4X3GMcmoAj17sfVOdVwwRQrn5Qdz5zm1DEEgd
         XEloEC1SyIN2HbcrBHWzsuJ+gOQVvpM13BusVRPYzSCgy+zfpo1PON9h69pSRcDkD/4Y
         rIuFje6AyVkxm9EP2RdeldZkGJKA2RYB07VcpDhDd7bWrt/nIyTGvTHOq/rBoVyehpsl
         o0kZ5lJ6BM8CR4Cln5KRnXklHzelCNWYzQDtEC8ZNwGBBfFBYtUmvYzfjyDEuZ5dRNdX
         HHtA==
X-Forwarded-Encrypted: i=1; AJvYcCVV241DVn2Lg+crgdwzVhVOeiKh09Mc7Ezcalh2B9euSTEqI4eqyH7B5Hu36Nl8/1kl/GwiGVLZnnSnIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz91rJuXCm855gdktS+/8KsEYqg2qrdoUT6L9Lzwjp2vCJq0Eur
	6dbKeg1y4EfYQk1RH9yDyYzh0Jfp2QcyAxtNoGboWLptdL6TfL6o8Yz8fN+HCuTu1d0=
X-Gm-Gg: ASbGncvhGU8Q4AZc6HsohvJv1puHWLwxwrJYwy+6OKeXnJbJ/8Vz+XeVXlCltyPfyvC
	BSCfjGtwlG8fP0ySIYYFRzuj8bqC1avgQzIG6o2VzpBdipHEbppib5rEVEeybjppmzaulR8WTP4
	1002bzXXg4eBIZTvtsdORbNgVp4CVWZOUL9mFq0y7amQHKEfeJhgjxQv5B2s2/WfTwMwVUOH56z
	GTl3l+lEp9qZAlev9eLbhrIyMqB8vZwdvhxp1nFhZlmYPdyq1cA5340bXvZdjD5+ipf9NstD/wU
	l9bRem0pJjPM1MvbnkZ8lKemynE0FeY+nkCMFQjrXG26pYVcGaTMr+Dp55zi8s33xoB05ovfNp7
	fKugq2CkU/P0uynvArd1ZaA85dWckhL2BFcH0T+W2Tn8jvV5H5grl8ST+z0m73jU=
X-Google-Smtp-Source: AGHT+IGvp69pAPLytTZe7iuFR7JcPjlyWCX1GBiJgy4L0feBQoh8l6iIIeoFPH1e79guh8V80eaUNQ==
X-Received: by 2002:a05:6000:2306:b0:3b7:9b3f:1e1d with SMTP id ffacd0b85a97d-3bb68a179c8mr1159936f8f.33.1755259957519;
        Fri, 15 Aug 2025 05:12:37 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1cc22739sm59518835e9.27.2025.08.15.05.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 05:12:36 -0700 (PDT)
Message-ID: <168788f0-4377-4b32-9730-23b2c4eca2a0@linaro.org>
Date: Fri, 15 Aug 2025 13:12:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: qcom: camss: Add support for TPG common
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250717-lemans_tpg-v2-0-a2538659349c@quicinc.com>
 <20250717-lemans_tpg-v2-1-a2538659349c@quicinc.com>
 <6d43915b-756f-4ab3-accf-e0a5422db479@linaro.org>
 <d4c0736b-5c17-4bce-86cf-6c0c48645667@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <d4c0736b-5c17-4bce-86cf-6c0c48645667@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/08/2025 09:52, Wenmeng Liu wrote:
>>
>> Which clock is it we are setting here i.e. do we really need to care 
>> about the rate at all ?
> 
> TPG generally uses the clocks from CSIPHY/CSID/AON. If we can ensure 
> that the clocks required by TPG are enabled in CSID/VFE, then there's no 
> need to configure them in the TPG node.
> 
> On Lemans (SA8775P), there's a special case where TPG requires the 
> CAMNOC_AXI to be set to 400 MHz to function properly, while the sensor 
> does not.

No that's fine.

The TPG should list the clocks _it_ depends on without assuming CSID or 
VFE is running at all.

---
bod

