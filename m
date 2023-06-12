Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0C0B72B9CA
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 10:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232607AbjFLIID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 04:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbjFLIHm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 04:07:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2558A2681
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 01:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686557174;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eE4P+LB3rJSCVuheKf/PDzJMsmkrZVDl1dhDEou1emE=;
        b=CjSumGar0h+x/G/dv/3euVVyWXOzqtB+cKQo26SGNeA7z09LpKHF49e3yHWqD4xh57WrI+
        Mzqj+Ip1PxJuTw2rPVjS4WN8nb2OW243KqmSz07e4fEjz3R4wtva+Ot8qcz6RlzlZ9hyVH
        tFTsXCbTXDIGt78E4buUz9xeqfmdri8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-eW_5dRk9OpuZUtuNRlG5iQ-1; Mon, 12 Jun 2023 04:06:12 -0400
X-MC-Unique: eW_5dRk9OpuZUtuNRlG5iQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-977e6c94186so367130866b.1
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 01:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686557171; x=1689149171;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eE4P+LB3rJSCVuheKf/PDzJMsmkrZVDl1dhDEou1emE=;
        b=F7Ip2B5/WvtLtn7S2GMl/9Ri6kabEdusUQWXRYu/e6hoLiNyLHrpJgJWJg2Mgs+mTN
         I0mEm13Nx30f+jSopfyo9p3J8b7xnJiV1X4mP735G976CXPmDf71dwfbtHuEp+Zh/tSj
         BzkM7/mDyHUcfexquMLeRObTRnsiV1/g0yxpl+wglArSSdZ3uFmAjCESzGwOLWxWqQOC
         SLEtn/1lWoGmbScTvfycpXtDZ1PcOFDUG1lAhoCmllAxMnTUdqiMjTRahkUcnuiT3RA2
         zhOiLnNMegahrGQrkQb8oBl4dk4qZ9gYwAdYNDEXZ6gsR9c3iVdV34unwy1zBRey9hDm
         w9Tg==
X-Gm-Message-State: AC+VfDxDGxuH893yp/bPs+XJQR+uy6pZiU/zHhDAl1mHw3kPn3icXhot
        li8adwrQmiYmCYUo5e+Ba8imBCkND8kaASLfTaYmN31fhmw9tZF6osd9Z2cuCVd0iI99fONq30/
        rGDR/pYyEYme1aPNa8sm1QPk=
X-Received: by 2002:a17:907:a4e:b0:96f:d345:d0f7 with SMTP id be14-20020a1709070a4e00b0096fd345d0f7mr7597255ejc.62.1686557170966;
        Mon, 12 Jun 2023 01:06:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4h9eA9RPizbNsKnshnBiiST6WkKOMvsvgokrgfOjf9bB5oNtBwd2kwyp+7agPolCzCKZtjhQ==
X-Received: by 2002:a17:907:a4e:b0:96f:d345:d0f7 with SMTP id be14-20020a1709070a4e00b0096fd345d0f7mr7597239ejc.62.1686557170567;
        Mon, 12 Jun 2023 01:06:10 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id gz18-20020a170906f2d200b009659ad1072fsm4836228ejb.113.2023.06.12.01.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 01:06:10 -0700 (PDT)
Message-ID: <ea37f7cf-499a-3514-dd5b-cc8c69992875@redhat.com>
Date:   Mon, 12 Jun 2023 10:06:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 03/28] media: ov2680: Fix vflip / hflip set functions
Content-Language: en-US
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-4-hdegoede@redhat.com>
 <a128069f-bd3c-5170-68aa-0f196d48205f@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a128069f-bd3c-5170-68aa-0f196d48205f@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/12/23 09:32, Dan Scally wrote:
> Hello Hans (and everybody else)
> 
> On 07/06/2023 17:46, Hans de Goede wrote:
>> ov2680_vflip_disable() / ov2680_hflip_disable() pass BIT(0) instead of
>> 0 as value to ov2680_mod_reg().
>>
>> While fixing this also:
>>
>> 1. Stop having separate enable/disable functions for hflip / vflip
>> 2. Move the is_streaming check, which is unique to hflip / vflip
>>     into the ov2680_set_?flip() functions.
> 
> 
> I think the code in the patch is good, but I wonder about the right way to deal with the changed pixel ordering following a flip/mirror. None of the other Omnivision sensor drivers I've looked at disallow a flip/mirror whilst streaming, but of course doing so wrecks the colours. I don't think that there's any reason we couldn't make the equivalent calculation to ov2680_set_bayer_order() within libcamera though and configure the ipu3-imgu appropriately, and so properly support a flip-whilst-streaming...but quite possibly I'm missing something. So I'm leaning towards "let's just drop the is_streaming check", but I'm interested in what everyone else thinks.

So the story wrt flipping on the ov2680 is complicated. I have done quite a bit
of testing wrt the flipping with the atomisp-ov2680.c version of the code and
I have made the following observations:

1. By default the ISP window is set to auto which means the ISP will set it so that
the bayer order does NOT change when flipping. Except when trying to use the full
native sensor resolution because then the ISP has no "room" to adjust the window to
fixup the bayer order. So the whole ov2680_set_bayer_order() helper is only relevant
when either using manual ISP settings or when using the full native resolution.
Note the ISP here is the sensor's internal ISP (which has very little functionality
on the ov2680).

2. Independent of auto vs manual ISP window settings changing flipping during mid
stream does not work. Instead of the colors getting messed up the sensor simply just
stops streaming when changing the flipping mid stream.

Because of 2. I have decided to keep ov2680_set_bayer_order() and add support
for manually setting the ISP window so that the full native size can be used.

Having the full native size available is important for the atomisp ISP since
that expects the resolution outputted by the sensor to have some padding
(minimum 12 / 14 pixels depending on bayer order) vs the resolution being
output to userspace.

Manually setting the ISP window makes things actually work as the code
expected before doing this (the manually setting the ISP window is also done
in the commit adding the mode-dependent registers calculation).

2. Also means we need to keep the is_streaming checks. Changing flipping
while streaming simply does not work on this sensor (or at least I don't know
how to make it work).

As Sakari already mentioned it seems that the current mainline driver has
not seen much testing of things like the flip controls.

Regards,

Hans



> 
>> for a nice code cleanup.
>>
>> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/media/i2c/ov2680.c | 48 +++++++++-----------------------------
>>   1 file changed, 11 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
>> index 9a9c90c8a949..c1b23c5b7818 100644
>> --- a/drivers/media/i2c/ov2680.c
>> +++ b/drivers/media/i2c/ov2680.c
>> @@ -328,11 +328,14 @@ static void ov2680_set_bayer_order(struct ov2680_dev *sensor)
>>       sensor->fmt.code = ov2680_hv_flip_bayer_order[hv_flip];
>>   }
>>   -static int ov2680_vflip_enable(struct ov2680_dev *sensor)
>> +static int ov2680_set_vflip(struct ov2680_dev *sensor, s32 val)
>>   {
>>       int ret;
>>   -    ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1, BIT(2), BIT(2));
>> +    if (sensor->is_streaming)
>> +        return -EBUSY;
>> +
>> +    ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1, BIT(2), val ? BIT(2) : 0);
>>       if (ret < 0)
>>           return ret;
>>   @@ -340,33 +343,14 @@ static int ov2680_vflip_enable(struct ov2680_dev *sensor)
>>       return 0;
>>   }
>>   -static int ov2680_vflip_disable(struct ov2680_dev *sensor)
>> +static int ov2680_set_hflip(struct ov2680_dev *sensor, s32 val)
>>   {
>>       int ret;
>>   -    ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1, BIT(2), BIT(0));
>> -    if (ret < 0)
>> -        return ret;
>> +    if (sensor->is_streaming)
>> +        return -EBUSY;
>>   -    return ov2680_bayer_order(sensor);
>> -}
>> -
>> -static int ov2680_hflip_enable(struct ov2680_dev *sensor)
>> -{
>> -    int ret;
>> -
>> -    ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT2, BIT(2), BIT(2));
>> -    if (ret < 0)
>> -        return ret;
>> -
>> -    return ov2680_bayer_order(sensor);
>> -}
>> -
>> -static int ov2680_hflip_disable(struct ov2680_dev *sensor)
>> -{
>> -    int ret;
>> -
>> -    ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT2, BIT(2), BIT(0));
>> +    ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT2, BIT(2), val ? BIT(2) : 0);
>>       if (ret < 0)
>>           return ret;
>>   @@ -719,19 +703,9 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>>       case V4L2_CID_EXPOSURE:
>>           return ov2680_exposure_set(sensor, ctrl->val);
>>       case V4L2_CID_VFLIP:
>> -        if (sensor->is_streaming)
>> -            return -EBUSY;
>> -        if (ctrl->val)
>> -            return ov2680_vflip_enable(sensor);
>> -        else
>> -            return ov2680_vflip_disable(sensor);
>> +        return ov2680_set_vflip(sensor, ctrl->val);
>>       case V4L2_CID_HFLIP:
>> -        if (sensor->is_streaming)
>> -            return -EBUSY;
>> -        if (ctrl->val)
>> -            return ov2680_hflip_enable(sensor);
>> -        else
>> -            return ov2680_hflip_disable(sensor);
>> +        return ov2680_set_hflip(sensor, ctrl->val);
>>       case V4L2_CID_TEST_PATTERN:
>>           return ov2680_test_pattern_set(sensor, ctrl->val);
>>       default:
> 

