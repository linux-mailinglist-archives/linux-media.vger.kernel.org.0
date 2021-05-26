Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA8A391966
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 16:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233747AbhEZOBb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 10:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233298AbhEZOBb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 10:01:31 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714D8C061756
        for <linux-media@vger.kernel.org>; Wed, 26 May 2021 06:59:58 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id j6so2661043lfr.11
        for <linux-media@vger.kernel.org>; Wed, 26 May 2021 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EFzbhVu6bM6oWlXhaR3zxfrfJHwO7BkLYCWZCGzNBX8=;
        b=ck6ScM5tpxHXLIOvFo4SoQVlW3wceQ3Z8bP1mIl51sIKlqZq9a3Dv1rrszOEHKcwuw
         cfFN+AZxMowNTXbRhJCHb1xGWwN1m81jGuDCv5vpL1SxGtJvvfquIMUR5Qi1KzybK8F5
         d/9+cRydPO+OeySDLYNp9VFYH+7iKI2u9niwkpwv7EEV6gjgBN6KRP1TsgQ9322sT1ts
         gi56gNtGIJ1kdmp7Y/irO3MklJ/XqyX8+/+PDQED+IiKGEtWngSenEl//6feyN2r/P0H
         xRDYTAqhLL2II6glmPIk4oVYM1FIE8vRFyY23EPYjDxisn2OEAsKHpmruhK6FIpjOv2O
         /Rvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EFzbhVu6bM6oWlXhaR3zxfrfJHwO7BkLYCWZCGzNBX8=;
        b=la+k8J9i+H7y10HjneKvFjTcdasSmEsUqdx1xa6N65MtkvmjkqizuEv1QjwgFbkywu
         6QWk/Fgb9o26MCYdtTRXv81apaG1aUkHd1drWkbDK7N1udqyFZXXaOdbTJG4zAKYbGcc
         7Lr2Vt1qR7/CJrAU8PewLMmSp2kcYSyUuMuiNxt20J7/K31ytxYkZ8lDaCpSBPcYksyw
         YTyerq9OGQd4AJOK0GTMZaGnzNkB+iAIRXcVUChZGlhFNcJjIesmYOO5lWUUNpg4Pd85
         XwTa8J2/QuqEC+X9jS47obrCPVuRZ5auLMzOgBj5Nb38HhVzJZ3Q2zpipwaMWLB3nwmo
         yuXg==
X-Gm-Message-State: AOAM532hgdelZ2S+XcBrVxkalepORh42jSJUOknqgTt08+rZXtYR4Dss
        ryOyx28zw3BLayKX0Wh8Syc+Ug==
X-Google-Smtp-Source: ABdhPJxzFIrtQR/OWj+vCXJXdAgBU3v8J52f5YvPe7f1DD3L3qhEomov7ffod+aE4z79rHDRW4JcTg==
X-Received: by 2002:ac2:5a47:: with SMTP id r7mr2366705lfn.138.1622037596750;
        Wed, 26 May 2021 06:59:56 -0700 (PDT)
Received: from [192.168.88.254] ([85.249.41.56])
        by smtp.gmail.com with ESMTPSA id p1sm2044585lfr.78.2021.05.26.06.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 06:59:56 -0700 (PDT)
Subject: Re: [PATCH 04/17] media: camss: csid-170: fix non-10bit formats
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
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
 <99f482de-78f8-82da-e52b-7f76da67ff39@marek.ca>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <8e8b4ae8-d4af-2b8d-9ed0-6a4b82d575e6@linaro.org>
Date:   Wed, 26 May 2021 16:59:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <99f482de-78f8-82da-e52b-7f76da67ff39@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonathan,

On 25.05.2021 21:38, Jonathan Marek wrote:
> On 5/25/21 2:15 PM, Andrey Konovalov wrote:
>> Hi Jonathan,
>>
>> Thank you for your patch!
>>
>> On 11.05.2021 21:07, Jonathan Marek wrote:
>>> Use the decode_format/data_type from the "format" struct instead of a
>>> hardcoded 10-bit format.
>>>
>>> Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>>> ---
>>>   drivers/media/platform/qcom/camss/camss-csid-170.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
>>> index ac22ff29d2a9..a81cc94c075f 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csid-170.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
>>> @@ -366,7 +366,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>>               val |= input_format->width & 0x1fff << TPG_DT_n_CFG_0_FRAME_WIDTH;
>>>               writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_0(0));
>>> -            val = DATA_TYPE_RAW_10BIT << TPG_DT_n_CFG_1_DATA_TYPE;
>>> +            val = format->data_type << TPG_DT_n_CFG_1_DATA_TYPE;
>>>               writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_1(0));
>>>               val = tg->mode << TPG_DT_n_CFG_2_PAYLOAD_MODE;
>>> @@ -382,8 +382,8 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>>           val = 1 << RDI_CFG0_BYTE_CNTR_EN;
>>>           val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
>>>           val |= 1 << RDI_CFG0_TIMESTAMP_EN;
>>> -        val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
>>> -        val |= DATA_TYPE_RAW_10BIT << RDI_CFG0_DATA_TYPE;
>>> +        val |= format->decode_format << RDI_CFG0_DECODE_FORMAT;
>>> +        val |= format->data_type << RDI_CFG0_DATA_TYPE;
>>
>> I've given it a try on RB3 board (aka db845c plus the navigation mezzanine), which uses ov8856 camera
>> sensor (its output format is SGRBG10_1X10).
>>
>> The above change doesn't work for me because format->decode_format has the value of 0x02 (which is
>> DECODE_FORMAT_UNCOMPRESSED_10_BIT). format->data_type has the expected value of 0x2b (DATA_TYPE_RAW_10BIT).
>>
> 
> I will change it back to using DECODE_FORMAT_PAYLOAD_ONLY for the v2, since it does seem like this is the correct value for the 
> RDI path.

Sounds good. Just in case, I've tried

--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -390,7 +390,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
                 val = 1 << RDI_CFG0_BYTE_CNTR_EN;
                 val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
                 val |= 1 << RDI_CFG0_TIMESTAMP_EN;
-               val |= format->decode_format << RDI_CFG0_DECODE_FORMAT;
+               val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
                 val |= format->data_type << RDI_CFG0_DATA_TYPE;
                 val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
                 val |= dt_id << RDI_CFG0_DT_ID;

on top of v1 patchset, and it worked OK on RB3 with the ov8856 camera.

I planned to check the other RB3's camera too - the "tracking" ov7251 one, but it turned out that I don't
have the information on which particular SOC's MIPI lanes are connected to this camera. I've tried a few
clock-lanes/data-lanes combinations, but none worked (ov7251 is controlled OK via the i2c bus, but no
data are captured).

> (but IIRC, using DECODE_FORMAT_UNCOMPRESSED_10_BIT worked on RB3 with the ov8856 camera last year when I brought it up. maybe 
> the VFE or another register is configured differently)

OK. I only used the current upstream camss driver, so have nothing to compare it against.

I also noticed that with ov8856 camera, only 3264x2448 and 1632x1224 modes work correctly on RB3
(used the current media_tree). But with the below change all the other modes (3280x2464 and 1640x1232)
start working OK too:

--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1575,7 +1575,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
                 }

                 video_out->ops = &vfe->video_ops;
-               video_out->bpl_alignment = 8;
+               video_out->bpl_alignment = 16;
                 video_out->line_based = 0;
                 if (i == VFE_LINE_PIX) {
                         video_out->bpl_alignment = 16;

And (with the increased size of the capture buffer) I did see that the data captured from camss were padded
to the next 16-byte boundary with the data from the previous 16-byte chunk. E.g. in the 3280x2464 case 12
padding bytes were added.
Personally I don't have access to the datasheet, but I've been told that as per the docs, 16-byte alignment
should not be needed in this case (RAW10P camera connected through rdi).
Does it ring any bell for you?

Thanks,
Andrey

>> Thanks,
>> Andrey
>>
>>>           val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
>>>           val |= dt_id << RDI_CFG0_DT_ID;
>>>           writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
>>>
