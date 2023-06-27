Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC1173FDD9
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 16:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbjF0Obr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 10:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbjF0Obl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 10:31:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECB4273C
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 07:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687876256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JMAciQWQSGVvhBLYJTKf38V7L6EBdAsdWyv4IwbHtvA=;
        b=LicUPyPuoj6nzxKAoShaowESkKD809p4FMUuyCYgsK8ix08vLFRR5xni5zwB9MQedf3UCm
        c8yOrIBh60hO6OGqrUdECScuAbRhun8sU3Zgjgxk0cIcFwyIfeWf4JkmHQhE/AdvCrWksL
        jl2C68ac3IpKNfXzEnWF1xZ8No5yNJU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-4YaIGqPaPYmNLTUe7UsK0w-1; Tue, 27 Jun 2023 10:30:48 -0400
X-MC-Unique: 4YaIGqPaPYmNLTUe7UsK0w-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9715654ab36so252780266b.0
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 07:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687876246; x=1690468246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JMAciQWQSGVvhBLYJTKf38V7L6EBdAsdWyv4IwbHtvA=;
        b=lFhBTqKzTU49rye3XSMSAWzAxBe/pPjAljQB+YZSjQZUQ1PhLd3HHmaAS8LDjV5rS/
         2NulZQf6Hgtruy1uxdZasyEJP9reNcUWeN6Zrd/0nm5NN0yW/tL8fYBOjYFZ3dYuzLoA
         xVB9IbOofRwFiGWNTY+QQ9LdRDqZ2yyDuEZR1D59i+QXnLCj3D60evgtTUrErbtRMRaf
         dfWN6mdK9PskqcKQAKGysS9h5m9CdEYtDOTyTrns82Vx3CHF9BzUpKJ7BJ+qVhNd75CL
         RK33RxzCJREWeqEf/KReF6AK080wqFr5BY/Qf9gYbF8phbXGNWdVJ0zJ9USdsQ1n2Nhr
         fdzA==
X-Gm-Message-State: AC+VfDzHzyM7ZHj10Pya7Pt3W3OZe3gXO5bGvUlON2CO2b0TH5mjmGaN
        o9bngYG/2fNdNTis1GpsdlqMLysKn5f3Lug1UamDd7lvdnQF1UDF1mZUKBdi99ORXgn28/YoXwl
        1/p9gwMHTGASPBAb+QOCTzDk=
X-Received: by 2002:a17:907:75ed:b0:992:47d7:35d7 with SMTP id jz13-20020a17090775ed00b0099247d735d7mr442371ejc.14.1687876245779;
        Tue, 27 Jun 2023 07:30:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ45EhwnMLly5lp6ut4HLKlbHsQqa+8aLbZ7jvXaPIC8Jql7IA9f9bix3h9eu8OeOVCSWjR1/Q==
X-Received: by 2002:a17:907:75ed:b0:992:47d7:35d7 with SMTP id jz13-20020a17090775ed00b0099247d735d7mr442353ejc.14.1687876245483;
        Tue, 27 Jun 2023 07:30:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l24-20020a1709060e1800b009783791b1a1sm4555893eji.121.2023.06.27.07.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 07:30:44 -0700 (PDT)
Message-ID: <728e6857-9e4d-38c0-0f67-2385bd7d6ee5@redhat.com>
Date:   Tue, 27 Jun 2023 16:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 00/29] media: ov2680: Bugfixes + ACPI +
 selection(crop-tgt) API support
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
 <akiate3vlv2y6wty7eolqky366stu2vfmgnygbqazzxxvaa5vo@vo6s5qhtavh7>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <akiate3vlv2y6wty7eolqky366stu2vfmgnygbqazzxxvaa5vo@vo6s5qhtavh7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 6/27/23 16:11, Jacopo Mondi wrote:
> Hi Hans
> 
>   seems like [12/29] is missing, it doesn't show up in patchwork
> neither:
> https://patchwork.linuxtv.org/project/linux-media/list/?series=10723
> 
> have I missed it ?

Nope looks like something ate it. I've just resend it using
"--in-reply-to=20230627131830.54601-1-hdegoede@redhat.com"
so that it should show up in the thread / patch-set.

Regards,

Hans




> 
> On Tue, Jun 27, 2023 at 03:18:01PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Here is v3 of my ov2680 sensor driver patch series.
>>
>> Changes in v3:
>> - Add Rui Miguel Silva's Ack for the series
>> - 2 small fixes for remarks from Andy
>> - Add a new patch adding me as co-maintainer in MAINTAINERS
>>
>> Changes in v2
>> - Drop "media: Add MIPI CCI register access helper functions"
>>   (being reviewed in its own thread / patch-submission)
>> - Drop "media: ov2680: Add g_skip_frames op support"
>> - Add "media: ov2680: Fix regulators being left enabled on
>>   ov2680_power_on() errors"
>> - Add "media: ov2680: Add link-freq and pixel-rate controls"
>>   with this the driver now works on IPU3 with ipu3-capture.sh
>>   (libcamera support requires adding a couple more controls)
>> - Limit line length to 80 chars everywhere
>> - Address various small remarks from Andy
>>
>> During all the work done on the atomisp driver I have mostly been testing
>> on devices with an ov2680 sensor. As such I have also done a lot of work
>> on the atomisp-ov2680.c atomisp specific sensor driver.
>>
>> With the latest atomisp code from:
>> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/tag/?h=media-atomisp-6.5-1
>>
>> The atomisp code can now work with standard v4l2 sensor drivers using
>> the selections (crop-tgt) api and v4l2-async sensor driver registration.
>>
>> This patch series modifies the main drivers/media/i2c/ov2680.c driver
>> to add bugfixes, ACPI enumeration, selection API support and further
>> improvments. After this the driver can be used with the atomisp driver
>> and atomisp-ov2680.c can be dropped.
>>
>> This also gets the driver much closer to having everything needed for
>> use with IPU3 / libcamera. I have a Lenovo Miix 510 now with an IPU3 +
>> ov2680 sensor and with this series raw-capture using the ipu3-capture.sh
>> script works. I plan to work on libcamera support for this in the near
>> future.
>>
>> This series consist of 3 parts:
>>
>> 1. Patches 1-8 are bugfixes these are put first for backporting
>>
>> 2. Patch 9 converts the ov2680 driver to the new CCI helpers,
>> the same has been done in the other series with the atomisp-ov2680
>> driver and this makes it much easier to sync things up.
>>
>> Note this depends on the new CCI register helpers, these are being
>> reviewed here:
>>
>> https://lore.kernel.org/linux-media/20230627125109.52354-1-hdegoede@redhat.com/
>>
>> 3. Patches 9 - 29 implement the ACPI enumeration,
>> selection API support and further improvments.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>> Hans de Goede (29):
>>   media: ov2680: Remove auto-gain and auto-exposure controls
>>   media: ov2680: Fix ov2680_bayer_order()
>>   media: ov2680: Fix vflip / hflip set functions
>>   media: ov2680: Use select VIDEO_V4L2_SUBDEV_API
>>   media: ov2680: Don't take the lock for try_fmt calls
>>   media: ov2680: Add ov2680_fill_format() helper function
>>   media: ov2680: Fix ov2680_set_fmt() which == V4L2_SUBDEV_FORMAT_TRY
>>     not working
>>   media: ov2680: Fix regulators being left enabled on ov2680_power_on()
>>     errors
>>   media: ov2680: Convert to new CCI register access helpers
>>   media: ov2680: Store dev instead of i2c_client in ov2680_dev
>>   media: ov2680: Check for "powerdown" GPIO con-id before checking for
>>     "reset" GPIO con-id
>>   media: ov2680: Add runtime-pm support
>>   media: ov2680: Drop is_enabled flag
>>   media: ov2680: Add support for more clk setups
>>   media: ov2680: Add support for 19.2 MHz clock
>>   media: ov2680: Add endpoint matching support
>>   media: ov2680: Add support for ACPI enumeration
>>   media: ov2680: Fix ov2680_enum_frame_interval()
>>   media: ov2680: Annotate the per mode register setting lists
>>   media: ov2680: Add ov2680_mode struct
>>   media: ov2680: Make setting the mode algorithm based
>>   media: ov2680: Add an __ov2680_get_pad_format() helper function
>>   media: ov2680: Implement selection support
>>   media: ov2680: Fix exposure and gain ctrls range and default value
>>   media: ov2680: Add a bunch of register tweaks
>>   media: ov2680: Drop unnecessary pad checks
>>   media: ov2680: Read and log sensor revision during probe
>>   media: ov2680: Add link-freq and pixel-rate controls
>>   MAINTAINERS: Add Hans de Goede as OV2680 sensor driver maintainer
>>
>>  MAINTAINERS                |    1 +
>>  drivers/media/i2c/Kconfig  |    2 +
>>  drivers/media/i2c/ov2680.c | 1318 +++++++++++++++++++-----------------
>>  3 files changed, 691 insertions(+), 630 deletions(-)
>>
>> --
>> 2.41.0
>>
> 

