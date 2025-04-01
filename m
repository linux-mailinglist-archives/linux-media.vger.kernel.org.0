Return-Path: <linux-media+bounces-29142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1F8A77AB9
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 14:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DCB51890FD4
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 12:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF032036F0;
	Tue,  1 Apr 2025 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WMU708Eu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1A3202F65
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510014; cv=none; b=tyTk9fEJfIjp3K1Ni0G7B6dpVQwR0VLmb3FsbQv1s89VcveoyiUXOudOtuQb7/RrI8OUX0QwLJLEuJH5Xlc6fXCLjmTqltnwn6EilsIpPmULqJTBLiixnQDmd28UA+xbsnACI8OVNetjef6uggaupW4GB2T+lJnjnTA8kFhbMu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510014; c=relaxed/simple;
	bh=dKjPgmKmqyPFfrKL/o1FVi2WVQPuBqkf3y1a5UJuMSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Qfl32CBFZeSnwFUYdNgQhD/qDmG6GFXbuqy3RuagpL0Utq/1YKMOkiZ3G4V4tRr/6geKY+9Cvbd7rOKiXOeE/Vdcy/4FuT1GYlZ6R49RJ2bAx0NOMtB7P98S5Gb8ufXcigISC2lgoNVD/Kam/OYE3Ui4+WfNG3aZYV8yIctcaDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WMU708Eu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso36670985e9.0
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 05:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743510010; x=1744114810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u40FSTwz9ltEwkPBj8DAGOUl61JmubNoHLrIbWFFZgk=;
        b=WMU708Euich1hVr/7hx9u1Y7ICDoar0kZv0vgPZsKMr6WmYbXceu+4lK1aiwVsm++S
         ZsPnVcv+FGASTfD06NoEci3eM/l3ypsy1xmYGI/jDg40TEmwHU+vYwuTuk6stJWFN+Jl
         Vx+tLqzNjAS9mg5I1MN4rDcEfY28fNjYjao/uBdjyeB96iOccGipI02nxaIlCvbzZ2s7
         JQSxOhdGIJgfQwG+Dsn2kUNqIsiHSANFvPYcZWBQYBMN6P7N4lFuBW+XAPVx17Klh2P0
         nnvrVOhE3nRW2hqdxccxkYCnfsQEM4ropBWwmv8xoIus7bB/luTqRkx/Tx46esPAWfHA
         XvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743510010; x=1744114810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u40FSTwz9ltEwkPBj8DAGOUl61JmubNoHLrIbWFFZgk=;
        b=ODlTEad7RFEQjsDkVXHae2zwITyjqW+FRfJCiVU6RxjeeLtTc5oLfgfqsyar771tsJ
         XgR5Snc1dw8cD93pQ1Jp2N5HGjZsPED3C8SpuIPTkDcNzgHxDQVBfLhTovyo4OrvzR+B
         jg58qZ/ghiFP+zHO0gtUFTvlzYwzvb86+ZBe2seOdXIZHAd5A5uiQLDYFONI0/F8YiNf
         R6Q2Obpn/rsDO0Bz6Tq5blEeYHTxOdvUlwxMNDKT2FrXuE69HJ6Piq5mlbN3mTOFHoh8
         WX+Yduv7zxXGD2kxIMH19uGE7EbZPlf3GKe+k8Tjct5/zUjlOC9PxsDT7g2nOOEF73QK
         Cw+A==
X-Forwarded-Encrypted: i=1; AJvYcCXHmdEaFcLxl/aiyYAlPNYTuNA8cXdTSACPxP6/vAILCD7j4UtITdYDlPfhB+oJJ7i0u21nHCXGeiYPRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfTKh0D0DnEnhXG8EnIcHRCvaC2kTfAsKNobmlLs7lSpGdddds
	pxKpqiqjM9qd5YRl6P1kFQIYCIDtctODq0a8ceWVCM2yiwbjRjfNICgKjdQZHMk=
X-Gm-Gg: ASbGncv3jO2myT0d+6z4MKCVQdSL4tMT//70otyYPEha20auEQcTN63eSM6WwgryWin
	BqJt4sTwn6aM5n5WTEC+VW2apFMfrFwiktfbygXTK42RaxEBCssdnUxtlUeELN1qVXrCykVA+9Q
	xj9htEpzB6hTiZo4H03IgG4+/QYyT5b9Dp7naZN+O57SSRis9Yw0Z0HIvlMiYwi6EfaqYRYdjNV
	OqCYHgJiY+Z+/hVSaBh31BVypWubavonv6OCnba2TGrHm1snAQLN8vUbdqJrh12DSXrCzw+hD5U
	bpb4ehf+recG+5FOdMrn7BbcQEn8aqQoh4RiszQjqGA6GksGKuGKfmu3JyOsPcdzKVdQk9mgtl3
	RsgQB7sbzJQ==
X-Google-Smtp-Source: AGHT+IEAyjNnqhQdjxN+s3yUvwDysJt9fO4zS10+QJm5P6u0nZ2k22vHjJEOSoho7ee0nVvgqa8ssw==
X-Received: by 2002:a05:6000:250f:b0:39c:1f04:a367 with SMTP id ffacd0b85a97d-39c1f04a399mr4181408f8f.4.1743510010130;
        Tue, 01 Apr 2025 05:20:10 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6589efsm14281053f8f.16.2025.04.01.05.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 05:20:09 -0700 (PDT)
Message-ID: <be89aad7-130b-4542-84e0-ffa252dff6cf@linaro.org>
Date: Tue, 1 Apr 2025 13:20:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: MAINTAINERS: Switch from venus Reviewer to
 Maintainer
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Trilok Soni <quic_tsoni@quicinc.com>,
 stanimir.k.varbanov@gmail.com, quic_dikshita@quicinc.com,
 mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
 <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-1-0ec1007fde3c@linaro.org>
 <93ca218a-71a2-4751-860c-025ec29b9180@quicinc.com>
 <f1d4d88f-1ca0-4be8-84cd-3ef0d224feb4@xs4all.nl>
 <2539ae48-d75f-bb52-3873-de0b6d9a8180@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2539ae48-d75f-bb52-3873-de0b6d9a8180@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 06:28, Vikash Garodia wrote:
> Hi Hans,
> 
> On 3/31/2025 12:56 PM, Hans Verkuil wrote:
>> On 29/03/2025 02:38, Trilok Soni wrote:
>>> On 3/28/2025 6:26 PM, Bryan O'Donoghue wrote:
>>>> I'd like to volunteer my help in keeping venus maintained upstream.
>>>>
>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> ---
>>>>   MAINTAINERS | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 29b4471574982bf3f8d03158cd5edcb94bc9fab9..5ccddd2030efd96324e53fcee8048120990a85d5 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -19592,7 +19592,7 @@ F:	drivers/usb/typec/tcpm/qcom/
>>>>   QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
>>>>   M:	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
>>>
>>> Is Stanimir still an active maintainer here?
>>
>> He's no longer maintaining venus.
>>
>> Bryan, can you post a v2 removing Stan as maintainer? Stan, can you Ack
>> that v2?
> I would propose to have Dikshita in the list instead. That way we can have same
> folks managing patches for both iris and venus, given that Stan is no more
> sending PRs.
Yes, I think Dikshita makes sense here.

I'll V3 this to this effect.

---
bod

