Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398A37267C6
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 19:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbjFGRuu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 13:50:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjFGRus (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 13:50:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D6781FD6
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 10:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686160202;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bBFsJdE8Y2SYggAfzLX+DySWINifxVOFSP7HxpJSmO0=;
        b=ifeiXLJ0JoJ9vItgn9jxulAlVUC9qKyE6VsV5oeM7+xg6OzdOalGLduE2CAEsQr2Z5mYY8
        U9GL4EUCyWWjaNno/kGQ6VcGmohimTI2Ndd9fMzOp0HmzXxxWznq6C6FQwQ5nikkP0vH1L
        +Sax/IKt0LC/d6LNg3ixBmgOmO8f3aw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549--kMnLLWgNAeN-wB9BHEIFg-1; Wed, 07 Jun 2023 13:50:00 -0400
X-MC-Unique: -kMnLLWgNAeN-wB9BHEIFg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5147d242f01so1172147a12.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jun 2023 10:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686160199; x=1688752199;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBFsJdE8Y2SYggAfzLX+DySWINifxVOFSP7HxpJSmO0=;
        b=CVODOWFga6eydJYIelwJJwxbGAEeO2eZFyTWkDBloFHn0keM607ny7bjJkOWmferXq
         FLuxdJMGkNlewMsgzFBPtKkf9XNgvZMcXJse/UL5ydapuJw+cRi5VoqFb1/XWLwHNB3S
         O0lkMl6Jqe3hrYkVElbRCBoKXKIEr2gdlV0pWyMlYOGwki2q22Ht+vZM/lHFICJfBW/D
         wD6Do2kwUptLkREDj5G6WPmZ+jL3KLJaX4FjWMmS0MI7yEw9Mdd1PHRGkpAe71OnVPlI
         bmDJ2LPYob4cOt/5v7+PDJChB0hCljFHNDmojWcAyjaEtT3z4JhqiRhTTisJAtkqW8La
         bjvw==
X-Gm-Message-State: AC+VfDzC2ND5joVpRaV9wgKOSPE9l1+rJTgqcTag140gyN5IQe0MSiCi
        W6uVhGW+kAkbpuIGAsqPYgb35TynOYAd9F9G36yhHGQ6FLSkfDS3n2dJyoAL+QYsZDJcLhpGWkp
        gvvqD08HI15KmLX6XDT9FR+0=
X-Received: by 2002:aa7:d648:0:b0:514:a016:9cd1 with SMTP id v8-20020aa7d648000000b00514a0169cd1mr6999465edr.8.1686160198984;
        Wed, 07 Jun 2023 10:49:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4LQGDHOYPsdORnrvU3gOzcEVFGzKQAuhJUhlW/wjYFhcJ6sxqDt2MBGLgM5Oa/f6ZZyzLbHg==
X-Received: by 2002:aa7:d648:0:b0:514:a016:9cd1 with SMTP id v8-20020aa7d648000000b00514a0169cd1mr6999453edr.8.1686160198738;
        Wed, 07 Jun 2023 10:49:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b26-20020aa7dc1a000000b005166663b8dcsm3167931edu.16.2023.06.07.10.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 10:49:58 -0700 (PDT)
Message-ID: <3d5aeb2d-5b1c-61aa-e8e8-1c1fb121b0ea@redhat.com>
Date:   Wed, 7 Jun 2023 19:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 26/28] media: ov2680: Add g_skip_frames op support
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-27-hdegoede@redhat.com>
 <20230607170455.GA5058@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230607170455.GA5058@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 6/7/23 19:04, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Wed, Jun 07, 2023 at 06:47:10PM +0200, Hans de Goede wrote:
>> Add support for v4l2_subdev_sensor_ops.g_skip_frames.
> 
> The .g_skip_frames() subdev operation was a mistake in hindsight, and
> should probably not be used in new drivers (or existing drivers that
> don't use it yet). Why do you need it ?

I don't need it. The atomisp-ov2680.c version of the ov2680
driver had it and I thought it would be useful to preserve
that functionality.

Since you say it is deprecated this can be dropped.

Regards,

Hans






>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/i2c/ov2680.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
>> index 867df602ee53..9e4f0bcbe979 100644
>> --- a/drivers/media/i2c/ov2680.c
>> +++ b/drivers/media/i2c/ov2680.c
>> @@ -62,6 +62,8 @@
>>  
>>  #define OV2680_FRAME_RATE			30
>>  
>> +#define OV2680_SKIP_FRAMES			3
>> +
>>  #define OV2680_NATIVE_WIDTH			1616
>>  #define OV2680_NATIVE_HEIGHT			1216
>>  #define OV2680_NATIVE_START_LEFT		0
>> @@ -759,6 +761,12 @@ static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
>>  	return 0;
>>  }
>>  
>> +static int ov2680_g_skip_frames(struct v4l2_subdev *sd, u32 *frames)
>> +{
>> +	*frames = OV2680_SKIP_FRAMES;
>> +	return 0;
>> +}
>> +
>>  static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>>  {
>>  	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
>> @@ -806,6 +814,10 @@ static const struct v4l2_subdev_video_ops ov2680_video_ops = {
>>  	.s_stream		= ov2680_s_stream,
>>  };
>>  
>> +static const struct v4l2_subdev_sensor_ops ov2680_sensor_ops = {
>> +	.g_skip_frames	= ov2680_g_skip_frames,
>> +};
>> +
>>  static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
>>  	.init_cfg		= ov2680_init_cfg,
>>  	.enum_mbus_code		= ov2680_enum_mbus_code,
>> @@ -820,6 +832,7 @@ static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
>>  static const struct v4l2_subdev_ops ov2680_subdev_ops = {
>>  	.video	= &ov2680_video_ops,
>>  	.pad	= &ov2680_pad_ops,
>> +	.sensor = &ov2680_sensor_ops,
>>  };
>>  
>>  static int ov2680_mode_init(struct ov2680_dev *sensor)
> 

