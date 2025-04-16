Return-Path: <linux-media+bounces-30337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E97E9A8B912
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 731203A759C
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18106FBF;
	Wed, 16 Apr 2025 12:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rbVhYiyh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825405258
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 12:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744806634; cv=none; b=WoNMdQ86w/SnUPQarGnowB6+zmxwk3Ov6wH/rJQzGBhEWrN6yPJvt+5uBjV9qGxiA/L8yQTDdTpbYuKTxF2Fur2lpuWC1Wm4uf097r/rW5KYdaRlQgvQyjSH4QeJ/+v/XCUpY2RmXKXYLuReVN6G3HRyRV2SUoC0BSbZ2iIYr38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744806634; c=relaxed/simple;
	bh=7Gy1XVsPqVy3jE8rob90X3GhP46KcENk/TqZx1KA2ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWPQHjD8If0IQ1+kxI9nAl0stlyAMfPPXAVZ+FDU7ljvnSbNF1j5+pvoQ/qxM12waOrcMDUws8uaKAU27/IHkkPe9Wul6pTCIp+ErDh3q3jgGDkBsLPlwlFvBgcBDvBpq2gjbF5Mz+uhuep/aWgXP2xti50IiVMhXR+Gaew9nvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rbVhYiyh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso52141635e9.2
        for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 05:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744806631; x=1745411431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=thGiGMIGVkipYVBXzz8o4Lh3YcuPkNg0CxEG2aMR7f0=;
        b=rbVhYiyh5mrD6Iw0iz1g/9OiDFoXhg5jm5Z4399iuP6IMg5Tujq/Ce9g4xY3bIaVBb
         gcEZOCBrvx5FxxUI/Gh8lqzAIvHf9FItHZZ6TgpAT9D4/guzuJYiJ6LFMobgmYAA5CUT
         9c1wJoqWX6dJr4y1CQ41KC51lF79xhNAZz+vsi3DxDUzUWZVwpUdTbN1L/N/RyIbJvnS
         GmSm6F2uYxW27lpbyUASYi8UnsNvkEYi8v7i0OIqkjzHnLvkwJZWQe+tRXpjVFuc1cFG
         Xtnbyts4AgxYjGmqOFmPBxwuB4yedZbSROHFfcqQ3T49o8cr6KzbrbFvEuuuxoAiNH9D
         dFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744806631; x=1745411431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=thGiGMIGVkipYVBXzz8o4Lh3YcuPkNg0CxEG2aMR7f0=;
        b=IuClv2If9ckqFm0lMcuqWTutjodTSZg7NrZXctv5U055Dgx+7DOxCLsfkXTBlEsNV6
         3/O83GolQHAp+vA/PY+9wTah/+0crUDqvw8kTiYsKS3aKuxeE0ob94ePCZgmOEKdM2Bn
         i0CbkK6KWF4H9K00f+iB21m0UwY+3LCFbCE+VZ+jYJ2fk8ktB+Adc4zC4yWLibK9qmP/
         z+6O09BvM3DSgmHNFjUKebLboy3zmCZ3HGOPLSFTwnoVBQ4K+r2dA1n9h/WvCoXItU91
         cvHJHaQReZjlhMe22iB1Egr/A+1xRz9jwA021D8BqoUwISX13m4019Z/ToBTtpR+rBis
         Bo2g==
X-Forwarded-Encrypted: i=1; AJvYcCVmAQD1DYD+D/PBTat62KUsHmhg7ETFAAbUp66k3hz86LT8rJs5cyThbl4OaUR8CKV5UeMcJuQ0NM7VpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl2FtLRgeSdLrwxfHOAMcRCD43sy/rqFpeDbepsbOk/06TdClD
	Qw96rRk3XR8MhvyJQ+E3J21v0wo/klHhVmfIFTV2Jbbq3rRSMjxdk16Wxzj8xME=
X-Gm-Gg: ASbGncurDMX0BWcz2kqz+SkhyAF8taNMdY6yd/mbrExlNqCAwctBovPTwDEj3OM1KQv
	wyJMtDljHtU0OMXD3t1VShCusTt6OX4adeNjRPUByqcRWDlhxxiZW5HPYxzdsOvoXVsbete/uNj
	PbgoUypkc5xvnjYqKb9oGNikS/aZpyRNfa6uvf/TL8uablVYMPjVMD4cMPv7pzvp3ugucdegKV1
	8tRWOrz9FKCrycA9JkkKh173BFpEH4Zk/0QnxVJm6h3p7b8UqS2z9aYWNBc4nFYEujYRwnqzImS
	aAJ3MTl9mdLSlqRGB0rJ1tsWDjQQoNPt7cM60V9WetynjA7miRdgAFE+kmgJbNmpAecW9NDbkg3
	ikdkRNQ==
X-Google-Smtp-Source: AGHT+IFV0ZUT9ojBwHgcXFzd6sA+i/GEKN9pAQWxVGmSBZdhA5mXH0KdaL62ftj/T9v6Ry/7NbUk5Q==
X-Received: by 2002:a05:600c:350f:b0:43d:7588:66a5 with SMTP id 5b1f17b1804b1-4405d6cc4damr18163555e9.31.1744806630866;
        Wed, 16 Apr 2025 05:30:30 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c8188sm20161775e9.5.2025.04.16.05.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 05:30:30 -0700 (PDT)
Message-ID: <3483e6d2-23f7-40e8-a56d-d7419b808290@linaro.org>
Date: Wed, 16 Apr 2025 13:30:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: qcom: camss: Add support for TFE (Spectra 340)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
 rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <yD7X4MYItg2wLMb5iPs1JXadfzhFB7wSFqo_hFbs6K72VbLmTtoOrnwcLJrP4WBvndDUd2eklJl3R4GRWLbl6Q==@protonmail.internalid>
 <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/2025 13:09, Loic Poulain wrote:
> Add support for TFE (Thin Front End) found in QCM2290.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Maybe I didn't receive but missing cover-letter for me.

In v2 could you please give an example of how you have tested in your 
cover letter, if not already done so.

---
bod

