Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 547DB73FE81
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 16:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjF0OlZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 10:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbjF0OlX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 10:41:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A1B3591
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 07:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687876740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hRyqE6bNZ3x6WgzUl8EnJ1nqZ5puEW2lOSiARTsyWbQ=;
        b=ZLfyz/F1u9n5UKQMPk+kcRhX1vy9H66BSMhbi9za+tqoHoCfu1grqWphz227sk0bFk90Ky
        gLddFLavksCc7QRIPK84XdiJxyuiex/jfa/FssXCvTbj6zuRPsipNPpe3+/Mt7erDm+I/L
        nMa7c6Ej0LqzWVZq0x8IeSyNHJ1JtpA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-K8hbduQePkWj20sz-6FtQw-1; Tue, 27 Jun 2023 10:38:58 -0400
X-MC-Unique: K8hbduQePkWj20sz-6FtQw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-98e1085308eso357317966b.0
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 07:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687876731; x=1690468731;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hRyqE6bNZ3x6WgzUl8EnJ1nqZ5puEW2lOSiARTsyWbQ=;
        b=BaCH8D48EcILPJjbgo0mpEbrgRzqp0va+Y0zMOSMkrPvIrCJOZJnyj7zJ71pTTECT7
         iHetTBUxnDz4LtiwyzkuXzHkpm/G1xKKJD9caNwjmvUOSpltSNtgC4wEswLJBzzxxkwQ
         4EPnfOvJ8cOeEoyaTcVJP8oXQuSIM+x3iHX9grdo+WNVv1K/ZbNPUJ5o0tb8njU69g3o
         +SiIyh3hMWjvef7vLtKiXucuYtQpMSnjoiGqu/vCdsb0t3eKSDG8qsSw41KOZT9KCL9E
         hnqvrzb1iK0TRO9wQMTsjJ/bLxLancq6gCJ1HnsSZ5FS1WEsAdnIvtV60SMqsUm9a8h5
         m9qw==
X-Gm-Message-State: AC+VfDxLTBfQpIFi7vrXNW1luGFUeXSIyQK4VxD3vwCjPgDoNG6Fim8R
        ZcQNh1th0GfP2UB8sKwD8/LjUnsN4zok+Qdf7sQtwhiiAxaUZgjX+QAyMB0n/r8ggFG2tuY+pnt
        QG/yqTd4MnoeQisHbPe7A+jA=
X-Received: by 2002:a17:907:a428:b0:98d:470d:9341 with SMTP id sg40-20020a170907a42800b0098d470d9341mr13389505ejc.27.1687876731711;
        Tue, 27 Jun 2023 07:38:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5U9duSXL0RY3j82m0qeNEmYxjkvK5ULtWhL8SHLmHaOHzDJmXIe8Pgw3JhtLY3gy9SqdiT8Q==
X-Received: by 2002:a17:907:a428:b0:98d:470d:9341 with SMTP id sg40-20020a170907a42800b0098d470d9341mr13389486ejc.27.1687876731425;
        Tue, 27 Jun 2023 07:38:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kt19-20020a170906aad300b009894b476310sm4606624ejb.163.2023.06.27.07.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 07:38:50 -0700 (PDT)
Message-ID: <16943f0e-c00f-92c8-d29b-4fa3708e7ef8@redhat.com>
Date:   Tue, 27 Jun 2023 16:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 03/29] media: ov2680: Fix vflip / hflip set functions
Content-Language: en-US, nl
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-4-hdegoede@redhat.com>
 <swuf2k4tatjfsjjta2ul36ph7xncs3l5vq2jby4hf2zww3s4k5@6lqbvl2vkxkc>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <swuf2k4tatjfsjjta2ul36ph7xncs3l5vq2jby4hf2zww3s4k5@6lqbvl2vkxkc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 6/27/23 16:35, Jacopo Mondi wrote:
> Hi Hans
> 
> On Tue, Jun 27, 2023 at 03:18:04PM +0200, Hans de Goede wrote:
>> ov2680_vflip_disable() / ov2680_hflip_disable() pass BIT(0) instead of
>> 0 as value to ov2680_mod_reg().
>>
>> While fixing this also:
>>
>> 1. Stop having separate enable/disable functions for hflip / vflip
>> 2. Move the is_streaming check, which is unique to hflip / vflip
>>    into the ov2680_set_?flip() functions.
> 
> The patch looks good, but one little question on the controls update
> procedure.
> 
> Usually s_ctrl() handlers checks for the sensor power state, like the
> driver here is already doing by testing the is_enabled[*] flag, but they
> usually call __v4l2_ctrl_handler_setup() unconditionally at
> s_stream(1) time, not only if a new mode has been applied by calling
> s_fmt(). Controls could be updated by userspace while the sensor is
> powered off, and new values should be applied regardless if a new mode,
> has been applied or not.
> 
> Does it make sense to you ?
> 
> [*] or better, if the sensor is ported to use pm_runtime first (by
> dropping support for the deprecated .s_power(), or do you need
> s_power() on your platform ?) you can use pm_runtime_get_if_in_use()
> instead of keeping track manually of the is_enabled flag.

What you are describing above is pretty much exactly what is done
later in this patchset.

Patches 1-8 are there to fix some glaring bugs, with the possibility
of backporting the fixes which is why they are the first patches
in the set.

Then after patch 9 the real work to get this driver into shape begins :)

Regards,

Hans





>> for a nice code cleanup.
>>
>> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/i2c/ov2680.c | 50 ++++++++++----------------------------
>>  1 file changed, 13 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
>> index 2001e08253ef..c93810f84ed7 100644
>> --- a/drivers/media/i2c/ov2680.c
>> +++ b/drivers/media/i2c/ov2680.c
>> @@ -328,11 +328,15 @@ static void ov2680_set_bayer_order(struct ov2680_dev *sensor)
>>  	sensor->fmt.code = ov2680_hv_flip_bayer_order[hv_flip];
>>  }
>>
>> -static int ov2680_vflip_enable(struct ov2680_dev *sensor)
>> +static int ov2680_set_vflip(struct ov2680_dev *sensor, s32 val)
>>  {
>>  	int ret;
>>
>> -	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1, BIT(2), BIT(2));
>> +	if (sensor->is_streaming)
>> +		return -EBUSY;
>> +
>> +	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1,
>> +			     BIT(2), val ? BIT(2) : 0);
>>  	if (ret < 0)
>>  		return ret;
>>
>> @@ -340,33 +344,15 @@ static int ov2680_vflip_enable(struct ov2680_dev *sensor)
>>  	return 0;
>>  }
>>
>> -static int ov2680_vflip_disable(struct ov2680_dev *sensor)
>> +static int ov2680_set_hflip(struct ov2680_dev *sensor, s32 val)
>>  {
>>  	int ret;
>>
>> -	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1, BIT(2), BIT(0));
>> -	if (ret < 0)
>> -		return ret;
>> +	if (sensor->is_streaming)
>> +		return -EBUSY;
>>
>> -	return ov2680_bayer_order(sensor);
>> -}
>> -
>> -static int ov2680_hflip_enable(struct ov2680_dev *sensor)
>> -{
>> -	int ret;
>> -
>> -	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT2, BIT(2), BIT(2));
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	return ov2680_bayer_order(sensor);
>> -}
>> -
>> -static int ov2680_hflip_disable(struct ov2680_dev *sensor)
>> -{
>> -	int ret;
>> -
>> -	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT2, BIT(2), BIT(0));
>> +	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT2,
>> +			     BIT(2), val ? BIT(2) : 0);
>>  	if (ret < 0)
>>  		return ret;
>>
>> @@ -720,19 +706,9 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>>  	case V4L2_CID_EXPOSURE:
>>  		return ov2680_exposure_set(sensor, ctrl->val);
>>  	case V4L2_CID_VFLIP:
>> -		if (sensor->is_streaming)
>> -			return -EBUSY;
>> -		if (ctrl->val)
>> -			return ov2680_vflip_enable(sensor);
>> -		else
>> -			return ov2680_vflip_disable(sensor);
>> +		return ov2680_set_vflip(sensor, ctrl->val);
>>  	case V4L2_CID_HFLIP:
>> -		if (sensor->is_streaming)
>> -			return -EBUSY;
>> -		if (ctrl->val)
>> -			return ov2680_hflip_enable(sensor);
>> -		else
>> -			return ov2680_hflip_disable(sensor);
>> +		return ov2680_set_hflip(sensor, ctrl->val);
>>  	case V4L2_CID_TEST_PATTERN:
>>  		return ov2680_test_pattern_set(sensor, ctrl->val);
>>  	default:
>> --
>> 2.41.0
>>
> 

