Return-Path: <linux-media+bounces-16694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D7895DDF1
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 14:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C0ABB219AB
	for <lists+linux-media@lfdr.de>; Sat, 24 Aug 2024 12:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D211714D8;
	Sat, 24 Aug 2024 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EUMyh9g6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5871C3B78D
	for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 12:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724503839; cv=none; b=ByCPffS6h8U4vTjtxHV5taAdmuYqz2O/Hb+tNEms7sis7cWDZHNS+sfaKUeSlGx/lr7RQCSCqQU0SGe6WOVqrpQpWNCO6/ayj1pTbrBy98m5gdMury1mxBnx0qnCncTt1CqnfEyuI0O8mLW3i0YVBSd2pNc1Qrf9UbIJKoMWc+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724503839; c=relaxed/simple;
	bh=E8TYBpfFLP4hAVycXKcaqkK87rp8JiyuXNzfHvDlO5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a5KY6iH7pWYaYRmG2NWIZ4eVDjqmBug8z1tJIFoIKQbuZw3IKrHgwDt+BlUpkmRNkka+74fuT9Oa7tfGJ7EFjS2LOYI2g42n4GggSJP50iYMQlmDo2BkvpBquGH5PbKZJQNcdLVA3mR6wrRnvol89fIBTudbAmcdFZOG7qKQI2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EUMyh9g6; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5334eec7485so496551e87.3
        for <linux-media@vger.kernel.org>; Sat, 24 Aug 2024 05:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724503835; x=1725108635; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LT9GFZ7HSpNy1by6KLI55IcT80T9H1H1g1kVEASpksM=;
        b=EUMyh9g6HQQIgLjbmMDcnbY+OT1Pqgtu4HjOjkfo3SJyyOfwkmdQX3vJU5COGF0Snn
         1hTXyp+uIXw2NCsRbB6oLa0CbtRJOwSC+ZfzXZKSUeC7Wqrm2htJfmkcExtX4HaD/Iv4
         uPE8bgy9w5SbiKkypNHlI4SOmDIsJdKwRjhGdvjMvrP46aLTkK9ALh6n0M0MdwKbcwMZ
         4A4r/e0KAmgF6YFzIt57OSojjEE3pbHeU+gGb7/1LzQopaeufvvAlSbTXjK4+3FNHiKl
         jCN/SQxA1QgVcQ0/KtvEjIr3xVnQOtfLZmoFetgc7b/yOQHdAOKlz5oIVKus8GyUGg1o
         V8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724503835; x=1725108635;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LT9GFZ7HSpNy1by6KLI55IcT80T9H1H1g1kVEASpksM=;
        b=dqVfVRU4q7Ko+Nn21q31L/fTCgHKoIynw2tou2/nDzsnS+hRB8xz7by45qdyLR03uC
         bteJ4URR3MgJMf3JKGRNQzmWARMdmgadixfg48Iy7tNM+r4Eqnl46L5qtOdPsJLZb8Oi
         ATaaBQa+vFBW2eUBAPBlJLNCsrKevyIN3b5nfkUGCwOxlNyGfBg+au1y4ylWFtGKTsjc
         yEFRhyqG+yum9aziDQ60p3NKqObPel+zf+zG4JTimG9yNLreDsH+oBvTyTi+unchqJXC
         O8dYLgFIBpn5qgwT32UIgnxJV4judbU3FF5YnFt9TF0tFzrO57+dF0+ou9Uu5kAPXV7m
         BmXw==
X-Forwarded-Encrypted: i=1; AJvYcCVwNIaIsmVJvHJER0C7kXGj/UAFEErngIeqqd8czXj/7nhmkH37Ntk6UwlhvKmGrKthW7joAsbZqaIA8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOSQHAZsoKaq3djuDemrhZ2iM428ljZfKV821GtpyNd9Z6+7WT
	XfkZV2nCMLnHpDq5LulcCNTdcuhsSNPleZiKUMesZy0SeILiRNxSzR92HsnwL88=
X-Google-Smtp-Source: AGHT+IHH4Pz0CVj+PG9hrisw/wra4r2P7BVbHcrd8baAA+MiHX/Hm2bDqZrm9ycpro4/prVibhModQ==
X-Received: by 2002:a05:6512:3c91:b0:530:e0fd:4a85 with SMTP id 2adb3069b0e04-534387bf0b6mr1995507e87.4.1724503835202;
        Sat, 24 Aug 2024 05:50:35 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea5956dsm834102e87.143.2024.08.24.05.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 05:50:34 -0700 (PDT)
Message-ID: <61ad7d65-cd51-4fef-8da7-b809615ccd96@linaro.org>
Date: Sat, 24 Aug 2024 15:50:34 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] media: qcom: camss: csid: Move common code into
 csid core
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-9-quic_depengs@quicinc.com>
 <8c504081-b0e4-4a64-9e21-e7d040a0aa6c@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <8c504081-b0e4-4a64-9e21-e7d040a0aa6c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/15/24 02:53, Bryan O'Donoghue wrote:
> On 12/08/2024 15:41, Depeng Shao wrote:
>> The get hw version and src pad code functions can be common code in csid
>> core file, then the csid driver of different hw version can reuse them,
>> rather than adding duplicate code in csid driver for each version.
>>
>> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>> ---
>>    .../platform/qcom/camss/camss-csid-4-1.c      | 19 -----
>>    .../platform/qcom/camss/camss-csid-4-7.c      | 42 ----------
>>    .../platform/qcom/camss/camss-csid-gen2.c     | 60 ---------------
>>    .../media/platform/qcom/camss/camss-csid.c    | 77 +++++++++++++++++++
>>    .../media/platform/qcom/camss/camss-csid.h    | 21 +++++
>>    5 files changed, 98 insertions(+), 121 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-1.c b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
>> index c95861420502..6998e1c52895 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-4-1.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
>> @@ -17,7 +17,6 @@
>>    #include "camss-csid-gen1.h"
>>    #include "camss.h"
>>    
>> -#define CAMSS_CSID_HW_VERSION		0x0
>>    #define CAMSS_CSID_CORE_CTRL_0		0x004
>>    #define CAMSS_CSID_CORE_CTRL_1		0x008
>>    #define CAMSS_CSID_RST_CMD		0x00c
>> @@ -139,15 +138,6 @@ static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
>>    	return 0;
>>    }
>>    
>> -static u32 csid_hw_version(struct csid_device *csid)
>> -{
>> -	u32 hw_version = readl_relaxed(csid->base + CAMSS_CSID_HW_VERSION);
>> -
>> -	dev_dbg(csid->camss->dev, "CSID HW Version = 0x%08x\n", hw_version);
>> -
>> -	return hw_version;
>> -}
>>    
>> -static u32 csid_hw_version(struct csid_device *csid)
>> -{
>> -	u32 hw_version = readl_relaxed(csid->base + CAMSS_CSID_HW_VERSION);
>> -
>> -	dev_dbg(csid->camss->dev, "CSID HW Version = 0x%08x\n", hw_version);
>> -
>> -	return hw_version;
>> -}
> 
> Is it also the case with csid-4-1 and csid-47 that the HW version is in
> the format x.x.x - because you're removing this printout which just
> prints the register in favour of a later function that decodes that
> register into three parts.
> 
> Suggest having a csid_hw_version_gen1() for these two and a
> csid_hw_version_gen2() which does the x.x.x print instead.
> 
> => camss-csid-4-1.c and camss-csid-4-7.c will have hw_version =
> csid_hw_version_gen1()
> 
> => camss-csid-gen2, camss-csid-790 will have hw_version = hw_version_gen2()
> 

I believe here two different output formats is unnecessary, let's just stick
to one or another version (not important which one) for all platforms.

In any case for sake of simplicity there should be just one generic function,
and, if for whatever reason it is necessary to print out different formats,
this shall be selected in runtime within a single shared function.

FWIW, I'm quite happy with the current version.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

