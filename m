Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1D674012C
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 18:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbjF0QaR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 12:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbjF0Q3X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 12:29:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E475635AD
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 09:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687883181;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TPwd6LVPcSJwU3KxUyiSmwHEPo8aol4SenanrVGRmGM=;
        b=bhgP0YBTqMpMxkNOCq9c1LCH6m0LnF3T8KnKUhf+UZB8w69i7/MFkCarbAXs30NMxjJGw/
        QqPNbeS/XGIzP2VFcNx32480Um1+XdzfAQpcpV6PUl+8oZ2QuexdUe82dL1dnsimFKxnHK
        YHjfB8yHq7mDjVQiSS5DMxrL5IQ7t2g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-jaCRwmsPMCSXBe4C8bKDcw-1; Tue, 27 Jun 2023 12:26:17 -0400
X-MC-Unique: jaCRwmsPMCSXBe4C8bKDcw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-987a0365f77so263090766b.1
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 09:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687883170; x=1690475170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPwd6LVPcSJwU3KxUyiSmwHEPo8aol4SenanrVGRmGM=;
        b=ehHJaGBSqQWHXVQcYJCs3/FjrmnZPVrZFzsOam/NI2g1cVJVrSVL/dRNyZrRc7w1tc
         b1kkNlQEm8Yoi9+6KVVJbPRrRO8P5jRCjE0rHTgVsPaw0sNrI1VDQxlMg79oTsajJSco
         S9c9hQJTk9X+BKf6g/DuLCPm9p23nczWhSRKh8dTRc0HiJPCVdW+3uTjcHj+UMjulAUN
         LmC5IPq6xiMHK7mdVBO+TDVYyDg7gFjd+njsaHORqJy2KiMfe1GRT1BuhcysZAKBkaSK
         V8SnM+Q8mcDL8wHk47h4QxuBxrWT6lJ6T1EZZTait4Ie/Z/PGDYRcmoY/2HcgqOaFubf
         FnlQ==
X-Gm-Message-State: AC+VfDxKtymX0QKD1qKjv2XzmOuSPDgzsukoOePy6j2uJvyh8gAOzE8e
        KQM6oG2K1MgLF58RxZvxcDDqfxLrN5PDzOpQ9AyhPVkoiF37mB5VeXYPICW3ImSrjxATjV/uZAH
        qWM/aOSA8282eLLVE5AaXlR8=
X-Received: by 2002:a17:906:411b:b0:992:5135:4106 with SMTP id j27-20020a170906411b00b0099251354106mr473932ejk.29.1687883170007;
        Tue, 27 Jun 2023 09:26:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4b2AV6vBs7TEP7T2bwgMJhFwr4BfhGSuj4Qo8OPVRz2+R7wovMQNoJeowarnwTDYdrkX11ow==
X-Received: by 2002:a17:906:411b:b0:992:5135:4106 with SMTP id j27-20020a170906411b00b0099251354106mr473915ejk.29.1687883169678;
        Tue, 27 Jun 2023 09:26:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id rl25-20020a170907217900b0098d80adcc23sm4679641ejb.113.2023.06.27.09.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 09:26:09 -0700 (PDT)
Message-ID: <b0152c64-6e1a-41ae-c497-7b552f2be6d4@redhat.com>
Date:   Tue, 27 Jun 2023 18:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 24/29] media: ov2680: Fix exposure and gain ctrls range
 and default value
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
 <20230627131830.54601-25-hdegoede@redhat.com>
 <ufoycurk666obqqn4yljfkumhjsql7syqxcuu2m52k5adty7qd@w5sprhel4noq>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ufoycurk666obqqn4yljfkumhjsql7syqxcuu2m52k5adty7qd@w5sprhel4noq>
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

On 6/27/23 17:16, Jacopo Mondi wrote:
> Hi Hans
>   another drive-by question
> 
> On Tue, Jun 27, 2023 at 03:18:25PM +0200, Hans de Goede wrote:
>> The exposure control's max effective value is VTS - 8, set the control
>> range to match this. Thas means that if/when a future commit makes VTS
>> configurable as a control itself the exposure range needs to be
>> updated dynamically to match the VTS value.
>>
>> The gain control goes from 0 - 1023, higher values wrap around to
>> the lowest gain setting.
>>
>> Also stop setting 0 as default for both controls this leads to
>> a totally black picture which is no good. This is esp. important
>> for tests of the sensor driver without (userspace driven)
>> auto exposure / gain.
> 
> I see the driver uses V4L2_CID_GAIN. Is this intentional or should
> this be V4L2_CID_ANALOGUE_GAIN? As you're plumbing libcamera support
> in, this is the control libcamera expects to use to control analogue
> gain.

That is a good question. I've not changed this for worries about
existing users. Although given the previous state of the existing
code I wonder if there are any existing users?

So what is the policy on this ?

Also I still need to figure out what the actual range
(as in amplification at lowest + highest setting) of the gain
control is, because AFAIk libcamera wants to know this.

Any hints on how to do this ? Also are there any docs on
how a driver should implement V4L2_CID_ANALOGUE_GAIN wrt range?

E.g. is the driver expected do to some conversion of values
to make the control always set a specific amplification for
a specific value?

Regards,

Hans



> 
>>
>> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/media/i2c/ov2680.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
>> index 6591ce3b9244..e26a6487d421 100644
>> --- a/drivers/media/i2c/ov2680.c
>> +++ b/drivers/media/i2c/ov2680.c
>> @@ -81,6 +81,9 @@
>>  /* If possible send 16 extra rows / lines to the ISP as padding */
>>  #define OV2680_END_MARGIN			16
>>
>> +/* Max exposure time is VTS - 8 */
>> +#define OV2680_INTEGRATION_TIME_MARGIN		8
>> +
>>  #define OV2680_DEFAULT_WIDTH			800
>>  #define OV2680_DEFAULT_HEIGHT			600
>>
>> @@ -823,6 +826,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>>  	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
>>  	struct ov2680_ctrls *ctrls = &sensor->ctrls;
>>  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
>> +	int exp_max = OV2680_LINES_PER_FRAME - OV2680_INTEGRATION_TIME_MARGIN;
>>  	int ret = 0;
>>
>>  	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_subdev_ops);
>> @@ -849,9 +853,10 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>>  					0, 0, test_pattern_menu);
>>
>>  	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
>> -					    0, 32767, 1, 0);
>> +					    0, exp_max, 1, exp_max);
>>
>> -	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 2047, 1, 0);
>> +	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN,
>> +					0, 1023, 1, 250);
>>
>>  	if (hdl->error) {
>>  		ret = hdl->error;
>> --
>> 2.41.0
>>
> 

