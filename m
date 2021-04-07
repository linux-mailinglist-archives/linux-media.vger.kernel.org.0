Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6DB0356E5F
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 16:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348317AbhDGOTa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 10:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352902AbhDGOTX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 10:19:23 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D91C061756;
        Wed,  7 Apr 2021 07:19:13 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id a4so1244237wrr.2;
        Wed, 07 Apr 2021 07:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=hk6O1+YsLCe8qBF6gMN+3M1D1gXE0oXAs3ZDrHvZOkc=;
        b=qbwAVGrCFye6M/nU4HSaDpQmhzHWShlbTv2YMAlwPD73fUgpT8QLzXMRb1A97RvM9x
         WnfAc9NtdVTS5rvXaxatLWLe4o6xVlG8C69A0LWuLO0jU/sHVA+kaucL7n7VajWnOGF7
         4D8pK3J38YC23K2O6umsL3CYV0fnqbTYdayfjgYc5ShPqereBe8sliGCg1cNsWauhR9x
         TebZrnwOPnDU0sCESFvlee45TRgSt4as7rpEjPKo+LJKIdIwePcnCxsjYEyxje1Yn9P5
         smBX17QZFgvqsGuQ8DsqYZT12B/AbficNYOlM+xcyyXaKyctpuzwTcEy5wmRaCApLENj
         D1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=hk6O1+YsLCe8qBF6gMN+3M1D1gXE0oXAs3ZDrHvZOkc=;
        b=U9rEshPT9tErVv51ncUSV5THmvvDRlKg7WdY9f6yY4xQKDRAYXiWoQUKhdTZGb259t
         odjHdyClhlJp00UtClo+20uZBa1muOHnBPjRP5lxm42pwdvJuCPMeVZFoiyyO/62Aaa8
         gNDHOuDKNtUdonchW3+E2LxKLSQhnfIuUljgz64tNf4zMyWb2Cl1IXn294IkSGZlEBHu
         cdEQD2qGRaw8hDBFAfMmTMXqlmQr7Fl2uTuMC2YlOnZsTb/rCexvwemF7ZxpnDVkGerv
         PNQkWh5X6HsHOyS+TYhNqzOGRgh6Z2o8n4GIXtDXOXawXCA6nJLGwAatNNMyjD3CT1q1
         l8mg==
X-Gm-Message-State: AOAM533PIudfHo5gRuW3oPEvUB5bX4IXuw6y1AcLNr8l2uo3+UrC12UO
        lpvdqJwI/hvFSrnBqdI5+qA=
X-Google-Smtp-Source: ABdhPJwUcwSJAIHk2OCtR+24DQShpSo3zGo/9gzczxTU1Ct2vayQA6uI0NS42UkEL7Nyzxbv3sIGcA==
X-Received: by 2002:a5d:424c:: with SMTP id s12mr4803031wrr.174.1617805152679;
        Wed, 07 Apr 2021 07:19:12 -0700 (PDT)
Received: from ?IPv6:2001:818:de85:7e00:ef5c:3f2a:a646:d6ec? ([2001:818:de85:7e00:ef5c:3f2a:a646:d6ec])
        by smtp.gmail.com with ESMTPSA id 61sm29613174wrn.25.2021.04.07.07.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 07:19:11 -0700 (PDT)
Subject: Re: [PATCH 1/2] staging: media: omap4iss: Ending line with argument
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com
References: <cover.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
 <441d27060ff6477d0ad418f41e194b96373c1f7f.1617287509.git.martinsdecarvalhobeatriz@gmail.com>
 <e1b25826-1359-24dd-47ad-41fbd3a406b9@xs4all.nl>
From:   Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Message-ID: <1df312a9-6216-1926-ff42-012654b81f3b@gmail.com>
Date:   Wed, 7 Apr 2021 15:19:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e1b25826-1359-24dd-47ad-41fbd3a406b9@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Em 07/04/21 14:46, Hans Verkuil escreveu:
> Hi Beatriz,
Hi,
>
> I'm now reviewing staging/media patches instead of Greg KH. See Vaishali's
> email from today: "Sending patches for the drivers/staging/media".
Yes, I saw the email! Thanks for helping us!
>
> On 01/04/2021 17:07, Beatriz Martins de Carvalho wrote:
>> Remove checkpatch check "CHECK: Lines should not end with a '('" with
>> argument present in next line and reorganize characters so the lines
>> are under 100 columns
>>
>> Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
>> ---
>>   drivers/staging/media/omap4iss/iss.c | 46 +++++++++++++---------------
>>   1 file changed, 22 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
>> index dae9073e7d3c..e8f724dbf810 100644
>> --- a/drivers/staging/media/omap4iss/iss.c
>> +++ b/drivers/staging/media/omap4iss/iss.c
>> @@ -559,9 +559,10 @@ static int iss_reset(struct iss_device *iss)
>>   	iss_reg_set(iss, OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG,
>>   		    ISS_HL_SYSCONFIG_SOFTRESET);
>>   
>> -	timeout = iss_poll_condition_timeout(
>> -		!(iss_reg_read(iss, OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG) &
>> -		ISS_HL_SYSCONFIG_SOFTRESET), 1000, 10, 100);
>> +	timeout = iss_poll_condition_timeout(!(iss_reg_read(iss,
>> +							    OMAP4_ISS_MEM_TOP, ISS_HL_SYSCONFIG)
>> +							    & ISS_HL_SYSCONFIG_SOFTRESET),
>> +							    1000, 10, 100);
>>   	if (timeout) {
>>   		dev_err(iss->dev, "ISS reset timeout\n");
>>   		return -ETIMEDOUT;
>> @@ -583,9 +584,10 @@ static int iss_isp_reset(struct iss_device *iss)
>>   
>>   	iss_reg_set(iss, OMAP4_ISS_MEM_ISP_SYS1, ISP5_CTRL, ISP5_CTRL_MSTANDBY);
>>   
>> -	timeout = iss_poll_condition_timeout(
>> -		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_SYS1, ISP5_CTRL) &
>> -		ISP5_CTRL_MSTANDBY_WAIT, 1000000, 1000, 1500);
>> +	timeout = iss_poll_condition_timeout(iss_reg_read(iss,
>> +							  OMAP4_ISS_MEM_ISP_SYS1, ISP5_CTRL)
>> +							  & ISP5_CTRL_MSTANDBY_WAIT, 1000000,
>> +							  1000, 1500);
>>   	if (timeout) {
>>   		dev_err(iss->dev, "ISP5 standby timeout\n");
>>   		return -ETIMEDOUT;
>> @@ -595,9 +597,10 @@ static int iss_isp_reset(struct iss_device *iss)
>>   	iss_reg_set(iss, OMAP4_ISS_MEM_ISP_SYS1, ISP5_SYSCONFIG,
>>   		    ISP5_SYSCONFIG_SOFTRESET);
>>   
>> -	timeout = iss_poll_condition_timeout(
>> -		!(iss_reg_read(iss, OMAP4_ISS_MEM_ISP_SYS1, ISP5_SYSCONFIG) &
>> -		ISP5_SYSCONFIG_SOFTRESET), 1000000, 1000, 1500);
>> +	timeout = iss_poll_condition_timeout(!(iss_reg_read(iss, OMAP4_ISS_MEM_ISP_SYS1,
>> +							    ISP5_SYSCONFIG) &
>> +							    ISP5_SYSCONFIG_SOFTRESET), 1000000,
>> +							    1000, 1500);
> As several other people already commented, these changes do not improve readability.
> Just leave this code alone, it's good enough. Even splitting up the condition into
> a separate function would degrade readability since that would make it harder to
> discover the exact condition that will be polled for.
>
> Not everything that checkpatch.pl flags is necessarily bad code :-)

Yes, I learning about this. And I will using this for the next patches.
>
>>   	if (timeout) {
>>   		dev_err(iss->dev, "ISP5 reset timeout\n");
>>   		return -ETIMEDOUT;
>> @@ -1104,33 +1107,28 @@ static int iss_create_links(struct iss_device *iss)
>>   	}
>>   
>>   	/* Connect the submodules. */
>> -	ret = media_create_pad_link(
>> -			&iss->csi2a.subdev.entity, CSI2_PAD_SOURCE,
>> -			&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SINK, 0);
>> +	ret = media_create_pad_link(&iss->csi2a.subdev.entity, CSI2_PAD_SOURCE,
>> +				    &iss->ipipeif.subdev.entity, IPIPEIF_PAD_SINK, 0);
>>   	if (ret < 0)
>>   		return ret;
>>   
>> -	ret = media_create_pad_link(
>> -			&iss->csi2b.subdev.entity, CSI2_PAD_SOURCE,
>> -			&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SINK, 0);
>> +	ret = media_create_pad_link(&iss->csi2b.subdev.entity, CSI2_PAD_SOURCE,
>> +				    &iss->ipipeif.subdev.entity, IPIPEIF_PAD_SINK, 0);
>>   	if (ret < 0)
>>   		return ret;
>>   
>> -	ret = media_create_pad_link(
>> -			&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SOURCE_VP,
>> -			&iss->resizer.subdev.entity, RESIZER_PAD_SINK, 0);
>> +	ret = media_create_pad_link(&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SOURCE_VP,
>> +				    &iss->resizer.subdev.entity, RESIZER_PAD_SINK, 0);
>>   	if (ret < 0)
>>   		return ret;
>>   
>> -	ret = media_create_pad_link(
>> -			&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SOURCE_VP,
>> -			&iss->ipipe.subdev.entity, IPIPE_PAD_SINK, 0);
>> +	ret = media_create_pad_link(&iss->ipipeif.subdev.entity, IPIPEIF_PAD_SOURCE_VP,
>> +				    &iss->ipipe.subdev.entity, IPIPE_PAD_SINK, 0);
>>   	if (ret < 0)
>>   		return ret;
>>   
>> -	ret = media_create_pad_link(
>> -			&iss->ipipe.subdev.entity, IPIPE_PAD_SOURCE_VP,
>> -			&iss->resizer.subdev.entity, RESIZER_PAD_SINK, 0);
>> +	ret = media_create_pad_link(&iss->ipipe.subdev.entity, IPIPE_PAD_SOURCE_VP,
>> +				    &iss->resizer.subdev.entity, RESIZER_PAD_SINK, 0);
>>   	if (ret < 0)
>>   		return ret;
>>   
>>
> These, however, are readability improvements, so I'm happy with that.
Thank!
>
> Regards,
>
> 	Hans
Best wishes,
Beatriz Carvalho

