Return-Path: <linux-media+bounces-24875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8A0A14D9C
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 11:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 599FD166C0E
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 10:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AF51FC7F4;
	Fri, 17 Jan 2025 10:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SPWNYRnG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C393D1F9EA0
	for <linux-media@vger.kernel.org>; Fri, 17 Jan 2025 10:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737109942; cv=none; b=cWfhVMQutYXnwjPLPO0uxp4stOQoolSRu62RMXz2WE1AEgLoLAL/68JDl/+5Tt9v4NHvnwoJ6AJtgLz8uV+lUIbDNTzUI9ha82DarZOL+ZPCcBmngqsiIktUct9ExC4Wh43I9xIEzz3tomPCUKmq8IFxCbEFcbXroQrPU5APr7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737109942; c=relaxed/simple;
	bh=usxKX/bq+qqlj5S9Kv1IxI4efxTMwXfcJQVp97tlIL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LrGqIJ+4UWoh4cptm57WS+JOMR+sYXAgejAxx67q/HRpd8bFXmB9nNjkaDR85GDAmHVBlk96K/2oAvzuuAYPINNEZfQ47TYs3phAHJ2kA+g8w9kNOJbCL7I5Bn8pV+cvc//y/91XNfNY0x3PRuH5zWBN5kn2XyyEIVlN9iNEFF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SPWNYRnG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43634b570c1so12691815e9.0
        for <linux-media@vger.kernel.org>; Fri, 17 Jan 2025 02:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737109939; x=1737714739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HksGXKs+oXl9+VmDEVOiawBWVGC/PHhWQk+TriN1KVo=;
        b=SPWNYRnGeR83yO40FNqkDIDHQANAeZhA3YdcNJcx2Xx97rpzs53+OUqiRaFwckdOUC
         P/RnqDTNt+raumEqSs4swSlntOQiBEQXPvN+nI0lNtyQTLSeuIDzZFOpPieqnm90nzLS
         WyfQWOT6I7rzPjVKpwiCITIUiyNHvebVCRM8rrSghF9Yk1VqWaWeWQ4eLwq/nIWMP+kf
         iEshZa7xBzDVPAHHdCI1ce2nxeqG3Oc1pBGtgAJQnvDQ3RPE9B1XJfpxa1Y0jI6xFCU7
         EdWtuFnQnCeT6DcBj6kG00BU7Aq3F4fncOK/2HZ92MM9E5FvFKx22DIDKsqHHqHvk7/D
         t4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737109939; x=1737714739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HksGXKs+oXl9+VmDEVOiawBWVGC/PHhWQk+TriN1KVo=;
        b=QjdIivWM3ECUhPaIkARp5Vd3wFSHaUgY325Dad8yesY/Qay9ulYkjG5OiTR6bV8kUN
         kueNK3CRPOTDeSassSwZ9OGCdmBbPMExV5y3DB8BRuOBLxiWx7WVfOwkM6e4ozkuhLS9
         /+AmYtxja5dWwpu6/4lMz9m91tia3JZ4EpY9EQN8eDk88HDnM2efF0WPhac5BI23l9WC
         GaDgPGxBoT4dFinErsKCXlMLZI5PTerJOwPPRKsK6o5jcBh+8WqHwlzTdPOnaHJQzmxf
         waAUJMyb9wZFG51c4AcV4JausFYg1MqSDcFnP/FFHTQm4WKTEKBEZtLzkpTO0NlXydMd
         VIEw==
X-Gm-Message-State: AOJu0YzrwMhLA6awkmfspo/pl5uiRH+OIlN0eWE7yo1Z92qMGSr8PpcH
	wHagiDpQ89a6jT294JDELoV0eo/IAzdaoj4rH1qO5TnaJjkbCiD/ajxTcey8oDA=
X-Gm-Gg: ASbGncv3/BMCaNS7Ata1t0JQaGwLW7GJKOKpf3OT1hDxAu8dnhNwsaSO0kpVZMtn9nM
	qrMrvq1u8GRUtlRqtqClsuK/uGRCCqH/KAA8gcyMq0LquOaSxBQmFPeZwoNcui5sfB3xbsNJvpJ
	3SFZW1S8Aeos2z39uoQDoVmBXDYEW1oe26VhKAVSUrAQRbq/kmm7S2MqYyCPaA7kgrka16Uw+eP
	y1QlcVR7urSReePxZgmbL+a0DdujFTpddjQpT2ydXW4DK05Bum55Lv0ML70fX9+ukLybQ==
X-Google-Smtp-Source: AGHT+IG7Rquzi6WwJgROhsE/JHaxo92uKlPy8ctz5KPUZeEVLYQDkbB3Dqa5Mk08B3VGfm3jM2JWmg==
X-Received: by 2002:a5d:4845:0:b0:385:f573:1f78 with SMTP id ffacd0b85a97d-38bf566e2b2mr1467481f8f.24.1737109939033;
        Fri, 17 Jan 2025 02:32:19 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3275562sm2191384f8f.66.2025.01.17.02.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 02:32:18 -0800 (PST)
Message-ID: <0eab7323-ce86-40c7-9737-06eedcdf492d@linaro.org>
Date: Fri, 17 Jan 2025 10:32:17 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: venus: fix OOB access issue while reading
 sequence changed events
To: Vedang Nagar <quic_vnagar@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250104-venus-security-fixes-v1-0-9d0dd4594cb4@quicinc.com>
 <20250104-venus-security-fixes-v1-2-9d0dd4594cb4@quicinc.com>
 <2b0528f5-f9fa-4cfd-abda-a0e95ba4a2f1@linaro.org>
 <7a782ea9-f227-4f46-a757-b4b69f5c287f@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <7a782ea9-f227-4f46-a757-b4b69f5c287f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/01/2025 08:39, Vedang Nagar wrote:
> Hi Bryan,
> 
> On 1/6/2025 5:36 AM, Bryan O'Donoghue wrote:
>> On 04/01/2025 05:41, Vedang Nagar wrote:
>>> num_properties_changed is being read from the message queue but is
>>> not validated. Value can be corrupted from the firmware leading to
>>> OOB read access issues. Add fix to read the size of the packets as
>>> well and crosscheck before reading from the packet.
>>>
>>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> Please see Vikash's series on this.
>>
>> https://lore.kernel.org/linux-arm-msm/20241128-venus_oob_2-v2-2-483ae0a464b8@quicinc.com/
>>
>> it seems to have exactly the same patch title ?
>>
>> Is this patch supposed to be a follow-up to that patch ?
>>
>> https://lore.kernel.org/linux-arm-msm/20241128-venus_oob_2-v2-0-483ae0a464b8@quicinc.com/
>>
>> Expecting to see a V3 of the above. If the intention is to supersede that patch or some of those patches you should make clear here.
> No, this is a different series having OOB fixes similar to ones posted by Vikash.

OK, please use a different patch title.

I understand the motive to repeat the patch title but, its confusing. If 
you added some text to make the OOB more specific then it would be 
possible to differentiate between.

"fix OOB access issue while reading sequence changed events 'in some 
location' || 'on some path'"


>>
>> On the switch statement I'd have two comments.
>>
>> #1 is everything really a " -= sizeof(u32)" ?
> Yes, it's everytime " -= sizeof(u32) " since the first the first word read is ptype of size u32
>> #2 if so then this ought to be factored out into a function
>>     => functional decomposition
> Sure, will fix this with decomposition into functions.

Is firmware sending a change event or updating a packet already in memory ?

What is the nature of the change event and how do you guarantee the 
second read is valid when the first read can be considered invalid ?

i.e.

- Read - derive read value X.
- Do some stuff.
- Read - again to make sure length value is still X.
- Do all sorts of other processing.

At which point is the sequence considered complete and the data 
considered "locked" and valid ?

What happens if you get a subsequent change event once this procedure 
has completed ?

---
bod

