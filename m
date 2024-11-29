Return-Path: <linux-media+bounces-22323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2629DC27D
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 12:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23042283455
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 11:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194051990DC;
	Fri, 29 Nov 2024 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xJMUOLM9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B179C184524
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 11:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732878365; cv=none; b=VCBw1YIUGCRogP9eEdlHJRYchcCBMaY/3cyr113jNj3o7lbfEZSDOoreK5bYIly4aYCJG7YuP48qmzv3LjUTZCygyjTx0xJwYB5Gc10Fe/bF3/vzlqoLDNpkW7+j6wjn4GDjoad3FgxUkG6nsTDkdCH7IsRnbhhUQfsuz4pGPGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732878365; c=relaxed/simple;
	bh=glSMSM2xYee+n9jszNd5bA6nKVpvDqA90VqpPm4oGGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pfn66gny0RuD20Xzi2GPStoUr64fRPT0CbS0dSbjrQa6u4VFNu1ISidYC3SI8Zu2GN03ndZFzUqgXEeW2SYRozzAEG6Y3c6vE0RZu3iEhpO0jQ76O8txcnk842dfCNZ7nuF76VTXyzLmjPLRRMHe57AhkAQByOKhegY1UEWiPn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xJMUOLM9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43494a20379so15884915e9.0
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 03:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732878362; x=1733483162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0PXwgZUh/eJ1uLgDi0tZo2YOu7czg38JF36KJWk2ihI=;
        b=xJMUOLM96edtd5IOFDlaqZalf7TnCm1LqSx/i2mmOwty0VC1dloGbdEp7gU5R/zwqD
         0cH+BCu6FoBuS26bVl0WxrqT/RsawIGs61hWkSFWEo8DvcgXzSNrj4JKgS4nt1E70FNA
         xTtWYpPF7iD9elNnsfZu+tz7P0k7fmF8mqWQd6qDxBktZijA+4CeW3H0c9pxTkIjVzCP
         Dhh8gm3a/ONKGQ+Q4BGDurZB/d5mBUWW+0C0WdjevZH6QP3TcNOyVyT8m4cZddK+JqYs
         hC+pAPNRPNKWH2T6DS/P/V59gf0JTw6uMjUw9q4PaP5c1v2kXSluMQ4/2atea7iQ70YR
         S+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732878362; x=1733483162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0PXwgZUh/eJ1uLgDi0tZo2YOu7czg38JF36KJWk2ihI=;
        b=P9i9wA65pKQeFpPkaTQsBG5av6K+gCSxMCViFXI9MsK+XUVTuddc1pJvc4B3zVI3FV
         4AfeEF7jP5RZ+WHmBU7RRn/O1Qo47q6Ah96nthmAFUjvyB8ttB8G//XzCMZVlBNHubXN
         ODpEQtDvWSX+tDUz401KeYp2M90JY8q6fX3ks3Zqe/nAwjslA6/bX2x5KoGDU/Ca3pvA
         fqxPyVfTae3gVeoNtdzVR6DYQ3dEr9o/HLmdqoEXRa2cOzcOZcFnmQH6aqj+yGIn0Jyk
         1d8tzLrw3pB0MmLqzuEiwLGK+RscBDP5yGKnxktusWhYz3rveczmyqmI6nQyEhNClduU
         PkNQ==
X-Gm-Message-State: AOJu0YzphwGWv/9J2nePT8IF5al4rOYrA6ky+HijWsD1mcbZqlb2beLj
	+ZdzE7z76SeGMNDynvuj+G+7YtaTKlVL2Iql3PoaLXfyzKoxISJbo3aknAseSbg=
X-Gm-Gg: ASbGncsA1aTUJta+sYYNcJGPXRgoOC5XtYiFSknUNdcKZohfNOTJNmT0+qudcUmJfXc
	yCuTcbVgc3bkFQOKtxN9wH9BQWbunk6q3HN3QEWaaLhc/vNvzf12Y3phNt7ScYJakwShXxHk5Cg
	OpAHXrWHGNvKNcG4zEY/NEHi38lovW2T4KpZjAJnv/cQTkLXsp9DhvGY1kZjH8/98mN0UhpwTjT
	fd/lrJwfjp8CoNy3P4kPB0z7WVykMG2oEcRNwAN8Wc1nB59fksOk/Rjtq4+wPw=
X-Google-Smtp-Source: AGHT+IH2rM8XDzBu9P2eB2Nv+FOlZ4MP17Y6QoZHdCbihA580XT4gslkuMijgMdy3lOM6ASqNrMP/w==
X-Received: by 2002:a05:600c:458b:b0:434:a924:44e9 with SMTP id 5b1f17b1804b1-434a9dcfedfmr108489465e9.15.1732878362085;
        Fri, 29 Nov 2024 03:06:02 -0800 (PST)
Received: from [192.168.0.31] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dc63f7sm49163485e9.23.2024.11.29.03.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 03:06:01 -0800 (PST)
Message-ID: <5cccec71-0cc7-492a-9fb9-903970da05c5@linaro.org>
Date: Fri, 29 Nov 2024 11:06:02 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: fix VFE pm domain off
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>
References: <20241128-vfe_pm_domain_off-v2-1-0bcbbe7daaaf@mainlining.org>
 <3a5fd596-b442-4d3f-aae2-f454d0cd8e5c@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3a5fd596-b442-4d3f-aae2-f454d0cd8e5c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/11/2024 08:48, Vladimir Zapolskiy wrote:
> On 11/28/24 21:39, Barnabás Czémán wrote:
>> Fix NULL pointer check before device_link_del
>> is called.
>>
>> Unable to handle kernel NULL pointer dereference at virtual address 
>> 000000000000032c
>> Call trace:
>>   device_link_put_kref+0xc/0xb8
>>   device_link_del+0x30/0x48
>>   vfe_pm_domain_off+0x24/0x38 [qcom_camss]
>>   vfe_put+0x9c/0xd0 [qcom_camss]
>>   vfe_set_power+0x48/0x58 [qcom_camss]
>>   pipeline_pm_power_one+0x154/0x158 [videodev]
>>   pipeline_pm_power+0x74/0xfc [videodev]
>>   v4l2_pipeline_pm_use+0x54/0x90 [videodev]
>>   v4l2_pipeline_pm_put+0x14/0x34 [videodev]
>>   video_release+0x2c/0x44 [qcom_camss]
>>   v4l2_release+0xe4/0xec [videodev]
>>
>> Fixes: eb73facec2c2 ("media: qcom: camss: Use common VFE pm_domain_on/ 
>> pm_domain_off where applicable")
>> Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>> Changes in v2:
>> - Add backtrace to the commit message.
>> - Link to v1: https://lore.kernel.org/r/20241122-vfe_pm_domain_off- 
>> v1-1-81d18f56563d@mainlining.org
>> ---
>>   drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/ 
>> media/platform/qcom/camss/camss-vfe.c
>> index 
>> 80a62ba11295042802cbaec617fb87c492ea6a55..1bf1473331f63b9ab106d21ea263c84d851c8a31 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -595,7 +595,7 @@ void vfe_isr_reset_ack(struct vfe_device *vfe)
>>    */
>>   void vfe_pm_domain_off(struct vfe_device *vfe)
>>   {
>> -    if (!vfe->genpd)
>> +    if (!vfe->genpd_link)
>>           return;
>>       device_link_del(vfe->genpd_link);
>>
> 
> I object to this change, there might be a problem in the code, however it
> is not yet identified.
> 
> vfe->genpd is not NULL, if vfe_pm_domain_on()/vfe_pm_domain_off() are
> called appropriately, the "fix" does not fix the real problem, it veils it.
> 
> -- 
> Best wishes,
> Vladimir
> 
> 

Let's walk through the logic.

vfe->genpd =

Can happen in vfe_subdev_init();

vfe_pm_domain_on() can fail @ vfe->genpd_link =

If it fails then I _suppose_ we are still calling vfe_pm_domain_off() at 
least that's the only logically way I see this error can manifest.

@Barnabás can you confirm that this is the case ?

If not, can you please provide more detail ?

---
bod

