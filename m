Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2717176AB14
	for <lists+linux-media@lfdr.de>; Tue,  1 Aug 2023 10:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbjHAI3r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Aug 2023 04:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjHAI3q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 04:29:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3AF3E0
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 01:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690878545;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mqWBmmKf1I8CPQN0p+I6P6zrWS8xA9XS5r9ohDN+QXE=;
        b=DzhLygrt3g2zrjYfL+RJvBuci7h6DOBhFrons9AgPCvNaqWH/RlYFUJKomWd0/pOw6B3mr
        7oV5z/ZJmrkg+Z2fJcNDIAaueX+JQXAffwHDCwWuBEfMgSJPeHZEkLVR5bTLn38muUfU55
        YeIaJ+6KVyCpmcsuVy7d1IqnXOxuxdI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67--Eg18cKVOy-UOSARKos78A-1; Tue, 01 Aug 2023 04:29:03 -0400
X-MC-Unique: -Eg18cKVOy-UOSARKos78A-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5218b9647a8so3230835a12.1
        for <linux-media@vger.kernel.org>; Tue, 01 Aug 2023 01:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690878542; x=1691483342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqWBmmKf1I8CPQN0p+I6P6zrWS8xA9XS5r9ohDN+QXE=;
        b=P5xbdVdBFqmfYI4YWIdXwowmXPLX5MbzHiUnbycHd2pM5ky1QtOhyx52qH0mVJw/Kf
         /ly8KD6BWgpMq9Iw6/9f7FmteU7BlBTZAXOCjR+eceedKa64q0Pl8J/Hsw5Soa+ANX2X
         NkVMRpqr07decliu7J3vNOYlbdYn+cck6JJyTScySzWS+ec2hRd1PzVfK9ziHbwbk9nt
         R46WH6v10gnBMlro95Pv6KFqVpbf9Q5EK4Za7j541o2ULQciVbQu6db9POZBjxgtB/FX
         d3JdmzzLpVG/qfJU2+M5XQi/Tiib2ep49DvV+1PLE40+4dIQ7U5FIttz6OLsX7uz6oYs
         9jeQ==
X-Gm-Message-State: ABy/qLaDLjk7BVr3Sq8/aVtWhrHAL2D19yli5zVWbaGgc9qBYp/1RoYP
        bI3dO/kKbZFt+sNafzCLNBVgM0HOjfTVfI46w++W2vMAju74seBCbTYPWbT2kPDEGnweH40vpDm
        mxgGNoYKrDt9hjqFeI17ZbxM=
X-Received: by 2002:aa7:c69a:0:b0:522:b112:6254 with SMTP id n26-20020aa7c69a000000b00522b1126254mr1872889edq.4.1690878542499;
        Tue, 01 Aug 2023 01:29:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGe2MhAeXFLejWQiU6imK8UYcjqLcSfavkLJklSeIt+VFAMWk9yM3E/G13mzDDq8bbYjxuLdw==
X-Received: by 2002:aa7:c69a:0:b0:522:b112:6254 with SMTP id n26-20020aa7c69a000000b00522b1126254mr1872875edq.4.1690878542153;
        Tue, 01 Aug 2023 01:29:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y23-20020aa7c257000000b005226f281bc5sm6513774edo.25.2023.08.01.01.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 01:29:00 -0700 (PDT)
Message-ID: <660854e4-4771-53fe-2531-797388084d8f@redhat.com>
Date:   Tue, 1 Aug 2023 10:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 18/29] media: ov2680: Fix ov2680_enum_frame_interval()
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-19-hdegoede@redhat.com>
 <f76a4dff-0507-5236-20ed-0ae464e6d359@ideasonboard.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f76a4dff-0507-5236-20ed-0ae464e6d359@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/3/23 09:26, Dan Scally wrote:
> 
> On 27/06/2023 15:18, Hans de Goede wrote:
>> Fix and simplify ov2680_enum_frame_interval(), the index is not
>> an index into ov2680_mode_data[], so using OV2680_MODE_MAX is wrong.
>>
>> Instead it is an index indexing the different framerates for
>> the resolution specified in fie->width, fie->height.
>>
>> Since the ov2680 code only supports a single fixed framerate,
>> index must always be 0 and we don't need to check the other
>> fie input values.
> 
> 
> But in this case the user could ask which single frame interval is supported for a frame size that is _not_ supported, and be told that the driver can give them 30fps. I think we still need to check the validity of the other inputs and return -EINVAL when they're invalid.

Ok for v4 I'll re-add the fie->which check and also add a check
that the passed in width + height are a valid combination from
ov2680_mode_data[].

Regards,

Hans

> 
>>
>> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/media/i2c/ov2680.c | 12 ++++--------
>>   1 file changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
>> index b011dadbb98a..7ca70877abf1 100644
>> --- a/drivers/media/i2c/ov2680.c
>> +++ b/drivers/media/i2c/ov2680.c
>> @@ -532,17 +532,13 @@ static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
>>                     struct v4l2_subdev_state *sd_state,
>>                     struct v4l2_subdev_frame_interval_enum *fie)
>>   {
>> -    struct v4l2_fract tpf;
>> +    struct ov2680_dev *sensor = to_ov2680_dev(sd);
>>   -    if (fie->index >= OV2680_MODE_MAX || fie->width > OV2680_WIDTH_MAX ||
>> -        fie->height > OV2680_HEIGHT_MAX ||
>> -        fie->which > V4L2_SUBDEV_FORMAT_ACTIVE)
>> +    /* Only 1 framerate */
>> +    if (fie->index)
>>           return -EINVAL;
>>   -    tpf.denominator = OV2680_FRAME_RATE;
>> -    tpf.numerator = 1;
>> -
>> -    fie->interval = tpf;
>> +    fie->interval = sensor->frame_interval;
>>         return 0;
>>   }
> 

