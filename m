Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 727BC733725
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 19:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345784AbjFPRH3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 13:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345632AbjFPRHS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 13:07:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B14C5
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 10:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686935196;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RmuBDxyrQ0gNPz4G/pUidnWbnDz+Ge3eTdy+O0ZRtTw=;
        b=dzo2b63q526mVcDdMu56/qkpzVSgUuGMsUFDBQ8R+zZwC7tsAzDlpWrDk8GS80padMrOpg
        Y+T8RkmtD0NvlIT/y/J126R5GWmE6eJFg/28AUeqcMalhhazUkpQLd+RyZzwBKgpR3rmhD
        Lf5M1X5k33QBV61+DC/O8ZfMGb6nnHE=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-8xjFpIVZMWSvhUH36NGwug-1; Fri, 16 Jun 2023 13:06:35 -0400
X-MC-Unique: 8xjFpIVZMWSvhUH36NGwug-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2b34568a4e5so7588321fa.0
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 10:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686935194; x=1689527194;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RmuBDxyrQ0gNPz4G/pUidnWbnDz+Ge3eTdy+O0ZRtTw=;
        b=eSaVsYW29oTbXgMKxYnuE9qBixRjY3VpPkX85PG1Z80PtuDeZ235bp7Ix76C9uqIrt
         dUUffnKWDlhIF35dt35/lDb7ZckYHZAmnw/gYEaUnxDpsD+xL68tTef+QjA23kU7RYbA
         iYXBI6ap9n1SYuy0lZ8Q6vO+62C6ffhUqROF+Noh0/QN3i2tHMv2zK6rTFh/zZY8uf7m
         mZKFNqY//ZNo8OnATOlCh+44PEcNj+DQDLF+WrDLKYkgiSiQ6FJkHTXEyAtnm4a4uv3S
         SxkmVK0/CS7an6FoBiU+Nfu42hGjyUXXcaurf/hY+aNma3gE4feAymIk4KVVv2Wr4+WZ
         ZBcA==
X-Gm-Message-State: AC+VfDye5R1j0qxc9Qkqir19TageCA1pFxD6rkbOI8OBF15tz0q6wlfk
        U/dml7uMFkg4OtscEUjHrI3stjHBAyhlR+/s4Oxb6Ji9Ql86PXwH1EIm6HjGFPGQT1QvAd7KyTl
        TUPrHvbV/S93gozd2L/BRma8=
X-Received: by 2002:a2e:95c2:0:b0:2ae:db65:2d01 with SMTP id y2-20020a2e95c2000000b002aedb652d01mr2391048ljh.23.1686935193770;
        Fri, 16 Jun 2023 10:06:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7wN2ZySC6FegyfCY4QvXCvLd8VZm04HofVFox9o1gi6+ZWUXs9sWo9sH57tdz8l1iuduxmfQ==
X-Received: by 2002:a2e:95c2:0:b0:2ae:db65:2d01 with SMTP id y2-20020a2e95c2000000b002aedb652d01mr2391032ljh.23.1686935193397;
        Fri, 16 Jun 2023 10:06:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b24-20020a056402139800b0051827a12b47sm8060250edv.15.2023.06.16.10.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 10:06:32 -0700 (PDT)
Message-ID: <b70ddd8e-e45d-abf2-9bf4-63e6216c2e99@redhat.com>
Date:   Fri, 16 Jun 2023 19:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 00/28] media: ov2680: Bugfixes + ACPI +
 selection(crop-tgt) API support
Content-Language: en-US, nl
To:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230615141349.172363-1-hdegoede@redhat.com>
 <m38rck7hse.fsf@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <m38rck7hse.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rui,

On 6/15/23 19:32, Rui Miguel Silva wrote:
> Hi Hans,
> Hans de Goede <hdegoede@redhat.com> writes:
> 
>> Hi All,
>>
>> Here is v2 of my ov2680 sensor driver patch series.
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
>> https://lore.kernel.org/linux-media/20230614192343.57280-1-hdegoede@redhat.com/
>>
>> 3. Patches 9 - 28 implement the ACPI enumeration,
>> selection API support and further improvments.
> 
> Wonder why you did not cc me, since the Maintainers entry is up to date
> with my email on this driver.

No particular reason. People already pointed this out during
the v1 posting of this series and I still managed to forget
to add you for v2. My bad, sorry.

> Thanks a lot for all this work, I had at the time a very limited iot device
> without IPU and could only do processing offline, and got out of working
> on this device very quick.
> 
> So, looks like you have a much robust setup and test scenarios. Again
> thanks for the fixes and updates using new api and extend functionality
> on this one. I went over it and all looks pretty good, so for the all
> series:
> 
> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

Thank you.

> And please, if you agree of course, if you send a new version of this
> series or as a follow up patch, I think would make sense to add you as
> maintainer also.

Ack I'll add a patch to do that for v3 (I'll add it to my local tree
right away).

Regards,

Hans


>> Hans de Goede (28):
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
>>
>>  drivers/media/i2c/Kconfig  |    2 +
>>  drivers/media/i2c/ov2680.c | 1316 +++++++++++++++++++-----------------
>>  2 files changed, 689 insertions(+), 629 deletions(-)
>>
>> -- 
>> 2.40.1
> 

