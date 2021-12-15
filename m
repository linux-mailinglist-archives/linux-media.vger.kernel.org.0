Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1186F475545
	for <lists+linux-media@lfdr.de>; Wed, 15 Dec 2021 10:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241211AbhLOJgO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 04:36:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236594AbhLOJgN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 04:36:13 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B34C061574
        for <linux-media@vger.kernel.org>; Wed, 15 Dec 2021 01:36:13 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id i22so7258042wrb.13
        for <linux-media@vger.kernel.org>; Wed, 15 Dec 2021 01:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=hGhiOZoNFezPBSG6DBLOpLXgwVZkfwjw+NMMaFsgmEQ=;
        b=BkxD3+iBhYlaulChNb3Y9OWAMvuCV0ci8yywNPwq/8TtaQC0M4/4BswCo437rh4gqA
         6VGkU7/JYzEoGg8UBxbmc6A1B1tWr/GD/DR0kC8oeqThb5GArPWtkNU2CniqYIykFyC9
         dGz+99MrsM6x/KaryP7QVZVnSkqwUxEM970yD/f5VkEBchskNgz+Ea2yXubTSHbFL9uv
         i9M5XQZy09YRM3eUrpJC/ZJXo2pt3DxXcGe63Q0eSU9ZA0Xj1NQu05t1ofb3O2zu/4wH
         qzVKzLKlWKc3U5SPuGA0Jz7emvgLIz0zZELQXnBgU5G4dBS8vkNr0B1hzM+ooSQiJzqj
         /iSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=hGhiOZoNFezPBSG6DBLOpLXgwVZkfwjw+NMMaFsgmEQ=;
        b=35aMtW+ArC9MXkbFkxGw/egp2fUX9w9neegkZGzkByd0Bcjo+z4icShXNNmGg6xVUI
         ulTUFFJ56Vh5j14hGNU4aceT9SLUI0QkBMoNb5T5QDaZbmm8uSV5QnYaebNddXDFZQIH
         FBUaFZAEkggF4v5tzIH6q35KJvX7CCfQOs1+KeDVt0mWsUE+pPrBDxGt7WDsVQd8VnWe
         N0KbaTWtL4bpVBew+Nno7fvviGci1JwXt5QOx6YDZQb0yjGLlP1Po654bDhwm7ma2s4V
         B9S1QHeGrLjw6LJS15dnk22GHsC+s/CIFoKy3HVvatrfG7uInUhV9IBmO8a9XLGjri43
         kWSQ==
X-Gm-Message-State: AOAM5315OelHbAZQti9WvuiyuBVMklMv9byV+VITN+pKdOeswQmDDeou
        Wewh3Box9lo/plD2H8dbDT8=
X-Google-Smtp-Source: ABdhPJwhliBYrdN6QmS38dFfMgfcuWWK7J0GBxdKWUIsqpjJXXZJV4mRc89cEIA8ImjjlXys+0pS8w==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr2364595wrn.93.1639560971522;
        Wed, 15 Dec 2021 01:36:11 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id t4sm4221585wmi.48.2021.12.15.01.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 01:36:11 -0800 (PST)
Subject: Re: [PATCH 0/5] Introduce ancillary links
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
References: <20211213232849.40071-1-djrscally@gmail.com>
 <20211215102509.2969578d@coco.lan>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <621f03ed-4137-ab6e-a5c8-3c11fbf70aff@gmail.com>
Date:   Wed, 15 Dec 2021 09:36:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215102509.2969578d@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro

On 15/12/2021 09:25, Mauro Carvalho Chehab wrote:
> Em Mon, 13 Dec 2021 23:28:44 +0000
> Daniel Scally <djrscally@gmail.com> escreveu:
>
>> Hello all
>>
>> At present there's no means in the kernel of describing the supporting
>> relationship between subdevices that work together to form an effective single
>> unit - the type example in this case being a camera sensor and its
>> corresponding vcm. To attempt to solve that, this series adds a new type of
>> media link called MEDIA_LNK_FL_ANCILLARY_LINK, which connects two instances of
>> struct media_entity.
>>
>> The mechanism of connection I have modelled as a notifier and async subdev,
>> which seemed the best route since sensor drivers already typically will call
>> v4l2_async_register_subdev_sensor() on probe, and that function already looks
>> for a reference to a firmware node with the reference named "lens-focus". To
>> avoid boilerplate in the sensor drivers, I added some new functions in
>> v4l2-async that are called in v4l2_async_match_notify() to create the ancillary
>> links - checking the entity.function of both notifier and subdev to make sure
>> that's appropriate. I haven't gone further than that yet, but I suspect we could
>> cut down on code elsewhere by, for example, also creating pad-to-pad links in
>> the same place.
>>
>> Thoughts and comments very welcome 
> The idea of ancillary link sounds interesting. I did a quick look at
> the series. 
>
> Laurent already did some good points during his review.
> Besides that, one thing it is missing, though, is an implementation on
> a driver. At least vimc should gain an implementation at this series,
> in order to allow media developers to test and see how the graph will
> be after the patch series.


We have this running through libcamera at the moment; this series piggy
backs onto the notifier that's set up by
v4l2_async_create_sensor_subdev() so that the connection is made and the
links created when a lens controller is linked to the sensor via the
lens-focus firmware property. I've been testing this using the dw9719
driver I posted [1], plus a series that adds support to libcamera [2]. I
believe that some folks from Cros have also tested it with the dw9714
driver too.


[1]
https://lore.kernel.org/linux-media/20211128232115.38833-1-djrscally@gmail.com/

[2]
https://lists.libcamera.org/pipermail/libcamera-devel/2021-December/028082.html

>
> Regards,
> Mauro
>
>> Dan
>>
>> Daniel Scally (5):
>>   media: media.h: Add new media link type
>>   media: entity: Add link_type() helper
>>   media: entity: Skip non-data links in graph iteration
>>   media: entity: Add support for ancillary links
>>   media: v4l2-async: Create links during v4l2_async_match_notify()
>>
>>  drivers/media/mc/mc-entity.c         | 56 ++++++++++++++++++++++++++--
>>  drivers/media/v4l2-core/v4l2-async.c | 51 +++++++++++++++++++++++++
>>  include/media/media-entity.h         | 29 ++++++++++++++
>>  include/uapi/linux/media.h           |  1 +
>>  4 files changed, 134 insertions(+), 3 deletions(-)
>>
>
>
> Thanks,
> Mauro
