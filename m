Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6A2E72BB96
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 11:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbjFLJDJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 05:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232647AbjFLJB7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 05:01:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 483733A89
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 01:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686560273;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KefTDABidt7cSjjh6aQ+Edj8Q7pzgQz5zImwtoABOC0=;
        b=BoWDYi1xQX5eCBUjTUIcSrPgoCnJ60kHkPLRfiDlrAUdPIg4rbjmLD7iue59An2zjXko5r
        HkKtgO8illDzSYlpaN8NOmT43YORH4ZFmm/b9pf3iWmeOweHoiNgejIfhM+0pea/wFwQHJ
        761u9q5vzUmLGQtr2x6p73vWuMA1Xrs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-y7bPXGIsPUyAhkUaPL12yw-1; Mon, 12 Jun 2023 04:57:49 -0400
X-MC-Unique: y7bPXGIsPUyAhkUaPL12yw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-514b3b99882so3341037a12.2
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 01:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686560268; x=1689152268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KefTDABidt7cSjjh6aQ+Edj8Q7pzgQz5zImwtoABOC0=;
        b=Du7JchEBap4e3RbtUHmpMPEvclMFwCB6D+A9iKBolThNetBUmvmKI2T/1JW9ehqQ+w
         gRGTvr8YGnw8Ui+/OVxeZbyfcXG84hiInDebRF36ZNf0XA3odq8VjFwDgGXyLw56I/pc
         pCd/i5xTBYm0UCZfhge4iw9UZDjiHeF4SkRrCsfRpM7amRgn5EGQzzRhyOcBY7l5ugfW
         H6owyFdgumeFEvBvXXxUDp/4hVjwK5idMJv0GFBbWmxww8hIeW3nhK5yFqhsdVWtln3a
         zqFbpPRGOLiRhLANnr6S9F3L67DqLtw0bbyHl8VucjYX4IXsu1Ih7iMaQFpe2eKHiIc2
         Ftsw==
X-Gm-Message-State: AC+VfDxuTOoPZvmAnX+IuIV/fq8Q4DHBto/HoivxGgqBkVRRuG1t56ZL
        09/u6BU7lp29iKVX6RD3K9PiR1KK1ai78lznZxmjzh4iyBg+qvUHw5Wnkz7EeMNprv0Cr6baDbE
        4cUTZDc2tUoixxw8rqVyZtsA=
X-Received: by 2002:aa7:d290:0:b0:510:e80f:fa4e with SMTP id w16-20020aa7d290000000b00510e80ffa4emr4718807edq.1.1686560268752;
        Mon, 12 Jun 2023 01:57:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ73J7+akaD8nqbmQHqhIBLcI/qoEnTbIlTJ+xbp+oSdiqXRGt70Pl4jpkISl8FDVK2TRblS2Q==
X-Received: by 2002:aa7:d290:0:b0:510:e80f:fa4e with SMTP id w16-20020aa7d290000000b00510e80ffa4emr4718794edq.1.1686560268469;
        Mon, 12 Jun 2023 01:57:48 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id m9-20020aa7c489000000b0051422f31b1bsm4742993edq.63.2023.06.12.01.57.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 01:57:47 -0700 (PDT)
Message-ID: <08ab2cea-e6f2-f782-3189-cb4b68e1c668@redhat.com>
Date:   Mon, 12 Jun 2023 10:57:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 04/28] media: ov2680: Use select VIDEO_V4L2_SUBDEV_API
Content-Language: en-US
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-5-hdegoede@redhat.com>
 <4f5bf176-da5f-ac67-b750-7e08bfdf3b50@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4f5bf176-da5f-ac67-b750-7e08bfdf3b50@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

On 6/12/23 10:20, Dan Scally wrote:
> 
> On 07/06/2023 17:46, Hans de Goede wrote:
>> Select VIDEO_V4L2_SUBDEV_API in Kconfig and drop the
>> ifdef CONFIG_VIDEO_V4L2_SUBDEV_API checks, like other callers
>> of v4l2_subdev_get_try_format() do.
>>
>> This is a preparation patch for fixing ov2680_set_fmt()
>> which == V4L2_SUBDEV_FORMAT_TRY calls not properly filling in
>> the passed in v4l2_mbus_framefmt struct.
>>
>> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
> Not sure about Fixes on this one as I don't think it was necessarily broken before, but either way 
Ah right, I should have added a note after a cut line that the Fixes tag is there because this is a pre-requisite for further fixes in the series.

> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Thank you,

Regards,

Hans



>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/media/i2c/Kconfig  |  1 +
>>   drivers/media/i2c/ov2680.c | 16 ++--------------
>>   2 files changed, 3 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 8f55155afe67..791473fcbad3 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -433,6 +433,7 @@ config VIDEO_OV2680
>>       tristate "OmniVision OV2680 sensor support"
>>       depends on VIDEO_DEV && I2C
>>       select MEDIA_CONTROLLER
>> +    select VIDEO_V4L2_SUBDEV_API
>>       select V4L2_FWNODE
>>       help
>>         This is a Video4Linux2 sensor driver for the OmniVision
>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
>> index c1b23c5b7818..d90bbca6e913 100644
>> --- a/drivers/media/i2c/ov2680.c
>> +++ b/drivers/media/i2c/ov2680.c
>> @@ -559,7 +559,6 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
>>   {
>>       struct ov2680_dev *sensor = to_ov2680_dev(sd);
>>       struct v4l2_mbus_framefmt *fmt = NULL;
>> -    int ret = 0;
>>         if (format->pad != 0)
>>           return -EINVAL;
>> @@ -567,22 +566,17 @@ static int ov2680_get_fmt(struct v4l2_subdev *sd,
>>       mutex_lock(&sensor->lock);
>>         if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>>           fmt = v4l2_subdev_get_try_format(&sensor->sd, sd_state,
>>                            format->pad);
>> -#else
>> -        ret = -EINVAL;
>> -#endif
>>       } else {
>>           fmt = &sensor->fmt;
>>       }
>>   -    if (fmt)
>> -        format->format = *fmt;
>> +    format->format = *fmt;
>>         mutex_unlock(&sensor->lock);
>>   -    return ret;
>> +    return 0;
>>   }
>>     static int ov2680_set_fmt(struct v4l2_subdev *sd,
>> @@ -591,9 +585,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>>   {
>>       struct ov2680_dev *sensor = to_ov2680_dev(sd);
>>       struct v4l2_mbus_framefmt *fmt = &format->format;
>> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>>       struct v4l2_mbus_framefmt *try_fmt;
>> -#endif
>>       const struct ov2680_mode_info *mode;
>>       int ret = 0;
>>   @@ -616,10 +608,8 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
>>       }
>>         if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>> -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>>           try_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
>>           format->format = *try_fmt;
>> -#endif
>>           goto unlock;
>>       }
>>   @@ -777,9 +767,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>>       v4l2_i2c_subdev_init(&sensor->sd, sensor->i2c_client,
>>                    &ov2680_subdev_ops);
>>   -#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
>>       sensor->sd.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
>> -#endif
>>       sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
>>       sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>>   
> 

