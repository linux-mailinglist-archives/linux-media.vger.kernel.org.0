Return-Path: <linux-media+bounces-3186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F9B822A5A
	for <lists+linux-media@lfdr.de>; Wed,  3 Jan 2024 10:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F64E285535
	for <lists+linux-media@lfdr.de>; Wed,  3 Jan 2024 09:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC5E18632;
	Wed,  3 Jan 2024 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="lqpyHhX/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC3E182BE
	for <linux-media@vger.kernel.org>; Wed,  3 Jan 2024 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3373a30af67so2646789f8f.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jan 2024 01:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1704274804; x=1704879604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v8kV6bmv9AGmb8cbNFglMHaYDajh0jeItl9QUctLrzk=;
        b=lqpyHhX/g/THJKmc/fspcmIf/KkDCrbr+z9EDfMcbwbeKFdDJkjKHNowT5t5TYBikI
         vVGz0NLb5lsjHaPzgT8FSSKAVHVomR2Hs/OjkREhwN+WwbHsMjQvldvn3KzotYNCKyNp
         IBzig/TTzK3JAAuF2L6/YoxaIp5OK5eypsN/8YRRKVawYghbfJzta6Sgr8ijD/W0V4m4
         ExSHM7GJFj3bKS3ToFlBJ9zuJcjeCSshzqzJE81R13KeweALDE9e2f6o6qgAJao8ja3H
         ITbVYJh1MazjVc2pak/QPgQdLcVXFaoN8tHBR1su4mRJ3/CW4lEZ280KNZfA5vERnPCR
         sxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704274804; x=1704879604;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v8kV6bmv9AGmb8cbNFglMHaYDajh0jeItl9QUctLrzk=;
        b=HvhJ0z9GzEp3om3ByKV7/eE/dnDCUAMpM/S2DDIgcRXFlHY/nB+bmcm9TocGyG6BMg
         QhtoTRRMIBbWplmGaM1FfYX57LM50ndM0dRW1WBioDI0LZudpNf2L6MigPOep3SwJAjL
         gAgpufLCWO+hz1YeX1EC1cpmoLpchtgNYwJM972WFOU0FcOf8cvwPXQzl9Qcn46ft7tj
         jk0TNpZJ5ZQJcplDJjBmIFHdbltjPDU0IFqpWW5k4ltx9oGLmnV8tlMVN0v1e2tnLAqu
         t69s6zwHWRIgcfCH8MiDyWwUqgXsidalX47sf34ZmqhJtvMtgusJspAZuLhNdOXe9BKk
         EwIQ==
X-Gm-Message-State: AOJu0Yxs4wetne9hWVwLQ2VkiyV/roF8HwbchZHzu/bJ3ooEqQtnzGVE
	zRk5MpODWWo4PUlCs6Rv65CsTEmFRgeCnA==
X-Google-Smtp-Source: AGHT+IFHNK2lB2OFIK/xyIhVP8vFFvnAEjuMr5JigM5mzJOMR0g/F1kIMG2j2fzjAepYxSuahtNonQ==
X-Received: by 2002:a05:600c:4f54:b0:40d:8580:4f1a with SMTP id m20-20020a05600c4f5400b0040d85804f1amr1878780wmq.171.1704274804374;
        Wed, 03 Jan 2024 01:40:04 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id g15-20020a5d488f000000b00336e43e8e57sm18973025wrq.58.2024.01.03.01.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 01:40:03 -0800 (PST)
Message-ID: <62995a12-e835-40ff-966f-8522f2ab53dc@nexus-software.ie>
Date: Wed, 3 Jan 2024 09:40:02 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: dt-bindings: media: camss: Add
 qcom,sc8280xp-camss binding
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240103-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v1-0-abacaa63a961@linaro.org>
 <20240103-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v1-1-abacaa63a961@linaro.org>
 <87bcff40-b5ff-41c9-a33f-95f5e80a2f22@linaro.org>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <87bcff40-b5ff-41c9-a33f-95f5e80a2f22@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2024 07:40, Krzysztof Kozlowski wrote:
> On 03/01/2024 03:18, Bryan O'Donoghue wrote:
>> Add bindings for qcom,sc8280xp-camss in order to support the camera
>> subsystem for sc8280xp as found in the Lenovo x13s Laptop.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   .../bindings/media/qcom,sc8280xp-camss.yaml        | 512 +++++++++++++++++++++
>>   1 file changed, 512 insertions(+)
>>
> 
> This patch fails, as pointed out by Robot.
> 
> Best regards,
> Krzysztof
> 
> 

Ah its in Bjorn's 6.8 clock pull tree.

I will repost when it hits -next

---
bod

