Return-Path: <linux-media+bounces-44874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0526BE830F
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 12:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4457A5811EC
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 10:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06791329C51;
	Fri, 17 Oct 2025 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tRBDPW4E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5736E328635
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 10:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698559; cv=none; b=UkDYKRxRw70iJu6NkFY/txc4xmnLbmTj8ve01C4fkIi9pWEt6zXYnW0Cf/vZB7cnD4Y83LnbX+slvnmBuVWhOeSeELPRzSGqM6eP0MqiLgwkO8p7YX3f7jOLqdScV+SSUmFWpsJWc3jXw46KzV014E4dsaiwPjIxJFTEJc0lvqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698559; c=relaxed/simple;
	bh=QhbR/JjQWPtQ/x1b2TheNvaNWi3shmk+1FrIu7SH6pQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OdPhFsXwFYaoD2fuRJZZil3H8H14SYaaoTm/4dpN8LByVzJTp51bfLApVcd08ZpwpH6d3qwbxT5ZPvl/SlCI1fRUV1S1QyA0VnYa8+vW8nxyZLcbuXwIsv1zTES54WoWi6VuraCvXO8pjBt3UXVffRhQ7ZkwbX8/8qlB5jRj/Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tRBDPW4E; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47109187c32so9181155e9.2
        for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 03:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760698556; x=1761303356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zm39IA4ufngTEzNdFDfCyY58vQQ04XFQ+LhrxSHjP0I=;
        b=tRBDPW4EERC3ojOuyQ5T8K/1L45lexggVloFbUqgO06yZ401Xs06SpJMqixS3LRM4i
         gphbPrhJ+9zVz4EgwfEVpqybJA9/cHXvvzqNyyFsCguSX8UHoqZB17fQAYPLfpJJNVmL
         UaBl3Clpq7TjAKZMsjBEZ7Vrgz6I4jDSDHg8uyIIgpoaI1zK1ZhyVAQ/vy8PMveQgKJi
         oYKIdtAScOaIfg5oJl6ZNkbQEWWWBfWd3TWyeYjMb8xLbwIank8aZTlfTTxlHiBA2+/c
         HOMDKTfarZ8GA2wi3oBv3Y3AO6lFWUAF1od4DrhyKE08SITcm40ZG75LewmzMRxxHYux
         SnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698556; x=1761303356;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zm39IA4ufngTEzNdFDfCyY58vQQ04XFQ+LhrxSHjP0I=;
        b=EcVN5YxYiNG+zsA5z53ktj8b05jFNx/S8ZyYTOeaSxfUaZtM6WRxG8TaZTzstYutUe
         8d/tLSZm2MGSgpxWUMsuSEhYB2J6V+6W/8qBLe5rSE88T+O5Dl/QiY1q/1jd3YL2kRIv
         1bDMFhIPpPqsdCwLgYZicIVIeqXMzAXlxkZikDFC6cOE2zKTUvjDjbuiyJ8r4oWEzJ+P
         7Ksx4PKM/85AevLfRyWExTBRQWBvvhW+12mVwHKCiw/73qBJ1C31hHCZg4zSTatRcXr9
         cHauwpjc/VlUuPDOmkKBTLL6Yc0AjaN8nHJNQVpFz7PoM46vkQ/J6k1rMGyNV3ASBn5X
         keVA==
X-Forwarded-Encrypted: i=1; AJvYcCXq427Xyy9Ni0+n62t3sH49VY0boFypJIA6dUHrZVDEJE2cDc+SMTb1ii/h8N2qxR8/In+PrwK7LtsxSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmOGgZFcTfVZFcGDzIanFUJg1TdW8vitcn8VmljL1M7EjWQDpy
	aCfmmfShAFsYwHlaXuiwFeEe0d1qvPL5UAgy9Sm8eEqoIWUFWg18Rgm72h8H0VLDQLE=
X-Gm-Gg: ASbGncuo7gEjzxGxJM2kVTV8A9RRjdRw7IKopsrs08+g0OQwqis16Oy6d7LuWK7yz4v
	xAjYE1ssD4iCTUcz2TAuwf5ip5KNfzEwJ05cXJmUyuhLHmawmbYGS2r7vdimBuL87JsP/b24IJw
	lMGGMGrTP00OOSUeiY1IFPA4YSfNe+HAJyYGE/C3alZTGd6/pyC0Nhc/183GUhZF2Rww0Rhrn+0
	LlFl7zLgXRycdKpblsGRaPokw/juKHQmKkKYo06u5MR2PWh+drJRxIcnJ5jU42dw8u+sJ4s4+fz
	kLOgwcdOAn5kuG95zX2LWLrMueZIpzEdtFIJ1tdire6RjbfNjwon+dWPumJqko3/GxOYcM57i9C
	30Hc6I2TFOM3mvwQiNqZa0tLOU6to5gOWRfaF3uqRwInW2/yjGVxdBmARhP86kT4Ft896mn2NZB
	z/dAuoKIZ69VkICT6tlGKpqRMl5b0IY2V/dfaxWS/xUtQyc/Lj5BwB
X-Google-Smtp-Source: AGHT+IF8gPde+0trw5hh+B8v1QbyRWDt3jn/AE9oBYuoF3drrlJJjQtos2JhgYi0PkWXHZD9B2bx/g==
X-Received: by 2002:a05:600c:6290:b0:46e:2cfe:971c with SMTP id 5b1f17b1804b1-471177c0f91mr24694175e9.0.1760698555593;
        Fri, 17 Oct 2025 03:55:55 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47114429679sm73229585e9.8.2025.10.17.03.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 03:55:55 -0700 (PDT)
Message-ID: <19a59be0-9b5f-4a93-bdd6-0592f291dca7@linaro.org>
Date: Fri, 17 Oct 2025 11:55:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] media: qcom: camss: csiphy: Add support for v2.4.0
 two-phase CSIPHY
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-4-f5745ba2dff9@oss.qualcomm.com>
 <059a2e7b-f399-44d9-9f32-cd01e573d954@linaro.org>
 <eb7992e4-f0a8-4266-ac4a-3de7694ac582@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <eb7992e4-f0a8-4266-ac4a-3de7694ac582@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/10/2025 00:10, Vijay Kumar Tumati wrote:
> 
> There are three offsets in the picture here wrt the CSIPHY instance base 
> address
> 
> 1. First offset to the common registers of the PHY, 'regs->offset' (that 
> follows the lane registers)
> 
> 2. Second offset to the status registers within the common registers . 
> This has been historically the same and hard coded 
> in 'CSIPHY_3PH_CMN_CSI_COMMON_STATUSn' to 0xb0 but this is now changing 
> on Kaanapali.
> 
> 3. Third set of offsets (12, 13, 14 and 15) are to the version registers 
> within the status registers.
> 
> This change merely generalizes the CSIPHY_3PH_CMN_CSI_COMMON_STATUSn 
> macro for chip sets with different second offset using "regs- 
>  >common_status_offset". There should not be any impact to the other 
> chip sets, for which it is set to the same 0xb0 in csiphy_init().
> 
> Please advise if you still think it requires a patch series for itself 
> and we can do that. Thanks.

This should be a separate patch yes.

---
bod

