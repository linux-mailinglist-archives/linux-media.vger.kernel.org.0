Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBD1390919
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 20:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbhEYSlV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 14:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhEYSlU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 14:41:20 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF851C061756
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 11:39:48 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id c10so23828230qtx.10
        for <linux-media@vger.kernel.org>; Tue, 25 May 2021 11:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uA5NkUKXM0NWHdAHxp1SODLexJ5Ziie+gDyKfXP7raY=;
        b=LYluVxIBkI8U+Xe05mqgEsvQ0Z4D5b/Wgzt7o556utVtLdH+xmKVabulxtB8DCOStR
         P2aqV6AunQzLtd8v8Di65NcqNFbNvhsgkvMq2cb9Jgwhv0D/Djr5BMttMsLbAUB4L8ps
         KM1zUM0LEWFBRLU+kQD3ZFS973QpfuEwXKkZrsqqrplqqCXoZSO9tz/6fgAMyLt1H393
         obsQUvVvPwWjM/wD4RfvoFKqOiV7pflSMqsHFUG5LiWDND0G83IaK1UyvtHN3EVveu8Y
         FtRXa6/g5sFVGpn+DzU2z2qYA+vVL8TM+ErVLVQx3NmoEZPuU+COqKHVyvtEsEPFefBh
         RW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uA5NkUKXM0NWHdAHxp1SODLexJ5Ziie+gDyKfXP7raY=;
        b=UKZULOT4DQzmh4MKOiDA64xP+xBk9LIv2HMLzPwYtZhasyOoGXrWP6fn/qS7BLZ1D8
         LewHeuU3e5YRolx2FJKthLZYOTGStSEygHsc3PH9x09v1nwqQFeEY5ewnAXMBetpElhX
         Ml7VddyNGNetyQxEnHyxeHZ0Y9n0j4Iz1gApXpojOARI+xVexnnQ+0C4++fZvX0MQdbq
         EpVLfGxkGwxvaSyppjUPLQOw05zSaKE2BKowl1eGGoBzfvC1LCOeSu3uKArP84Q7x4pt
         /8NUCMoA8UMYaHOaijz9H/DuWl8Tyu8R3/8+4pQNFHDH1MGxJkPsIS2oRd49mUDyL5e6
         YVog==
X-Gm-Message-State: AOAM533ojXNqymNxLZ1YpvGXGyTBw+7n3TDRKUmn6MJVZ9CwWXE0drGD
        Pe0+MhHm5NbzzDczuOK8LAk3gA==
X-Google-Smtp-Source: ABdhPJy2cqucvHZVgUQx2H2EoZIrjTSOXPj3OEVGVSqsQbfGROm3HmkyF6w430olHXCXCKDoFwL95w==
X-Received: by 2002:ac8:5981:: with SMTP id e1mr33246270qte.310.1621967987988;
        Tue, 25 May 2021 11:39:47 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id j28sm13570276qkl.35.2021.05.25.11.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 11:39:47 -0700 (PDT)
Subject: Re: [PATCH 04/17] media: camss: csid-170: fix non-10bit formats
To:     Andrey Konovalov <andrey.konovalov@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210511180728.23781-1-jonathan@marek.ca>
 <20210511180728.23781-5-jonathan@marek.ca>
 <fd72befe-f39c-ecb0-1130-50aa8452a90e@linaro.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <99f482de-78f8-82da-e52b-7f76da67ff39@marek.ca>
Date:   Tue, 25 May 2021 14:38:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <fd72befe-f39c-ecb0-1130-50aa8452a90e@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/25/21 2:15 PM, Andrey Konovalov wrote:
> Hi Jonathan,
> 
> Thank you for your patch!
> 
> On 11.05.2021 21:07, Jonathan Marek wrote:
>> Use the decode_format/data_type from the "format" struct instead of a
>> hardcoded 10-bit format.
>>
>> Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware 
>> version Titan 170")
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/media/platform/qcom/camss/camss-csid-170.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c 
>> b/drivers/media/platform/qcom/camss/camss-csid-170.c
>> index ac22ff29d2a9..a81cc94c075f 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-170.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
>> @@ -366,7 +366,7 @@ static void csid_configure_stream(struct 
>> csid_device *csid, u8 enable)
>>               val |= input_format->width & 0x1fff << 
>> TPG_DT_n_CFG_0_FRAME_WIDTH;
>>               writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_0(0));
>> -            val = DATA_TYPE_RAW_10BIT << TPG_DT_n_CFG_1_DATA_TYPE;
>> +            val = format->data_type << TPG_DT_n_CFG_1_DATA_TYPE;
>>               writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_1(0));
>>               val = tg->mode << TPG_DT_n_CFG_2_PAYLOAD_MODE;
>> @@ -382,8 +382,8 @@ static void csid_configure_stream(struct 
>> csid_device *csid, u8 enable)
>>           val = 1 << RDI_CFG0_BYTE_CNTR_EN;
>>           val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
>>           val |= 1 << RDI_CFG0_TIMESTAMP_EN;
>> -        val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
>> -        val |= DATA_TYPE_RAW_10BIT << RDI_CFG0_DATA_TYPE;
>> +        val |= format->decode_format << RDI_CFG0_DECODE_FORMAT;
>> +        val |= format->data_type << RDI_CFG0_DATA_TYPE;
> 
> I've given it a try on RB3 board (aka db845c plus the navigation 
> mezzanine), which uses ov8856 camera
> sensor (its output format is SGRBG10_1X10).
> 
> The above change doesn't work for me because format->decode_format has 
> the value of 0x02 (which is
> DECODE_FORMAT_UNCOMPRESSED_10_BIT). format->data_type has the expected 
> value of 0x2b (DATA_TYPE_RAW_10BIT).
> 

I will change it back to using DECODE_FORMAT_PAYLOAD_ONLY for the v2, 
since it does seem like this is the correct value for the RDI path.

(but IIRC, using DECODE_FORMAT_UNCOMPRESSED_10_BIT worked on RB3 with 
the ov8856 camera last year when I brought it up. maybe the VFE or 
another register is configured differently)

> Thanks,
> Andrey
> 
>>           val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
>>           val |= dt_id << RDI_CFG0_DT_ID;
>>           writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
>>
