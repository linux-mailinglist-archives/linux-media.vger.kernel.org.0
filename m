Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06BB845E8F1
	for <lists+linux-media@lfdr.de>; Fri, 26 Nov 2021 09:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242802AbhKZIEE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Nov 2021 03:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353685AbhKZICE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Nov 2021 03:02:04 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DBAFC061763
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 23:58:51 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id o13so16742373wrs.12
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 23:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=lIR1MOuefRE8SGxhYyzGFR9jlRxFfoyCa7d8xFxI71I=;
        b=j15P1mkZiUQ7FlflcB21hW1MZAlUI+ztxw1A/0TrvDONZVmyoT4/qVs10Jiunireqt
         SyIM55v+UoX0CwFAaMjV5yJSRNwwjxLEV+AEiZy1ePun0He388i9iQQtiMBy/dSQ9Lzq
         ykmK3/Ys5ggxtXTS8r/x+0/XRuIfIc5/WrWMWqmS5WEQ7LaKMZ4o/eMtbib6fXQIglZ7
         s+r6TRf06m8/68q+/XpcizchsOriru3luWAncB0tc69+tnmlJjD+7CJE4FGeBjDLf0xS
         fIFeUUGZdhuwFn7WJncYFh1FjV8dhuamUak8KvF2v3IKV94jUmc8s2odMJ7YnHECOMfL
         jQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=lIR1MOuefRE8SGxhYyzGFR9jlRxFfoyCa7d8xFxI71I=;
        b=GWL+kBBb0O4WiWnphCv3hRTCnHLMFKN5jgY1ahCsAd5WKjyPGZ7SJqqRym+xqeKF56
         K8VOkq02Qyxtw4P5IprT0TFj2vEk2CvLlWvjPO3Xn/IUcJ4x9dgzRfuosPniKojSFTCk
         Xc9i3uGq1uG4trevicakqSFPdGqQjQOqk/Fs84PtiT/ghk6NY3/l9GeBhgq11fT4Vvb3
         dEYSd9Ea1ELM0un4pO0E73X8xroa6W0OdzFWsrxUR5TOFz5N9vULVNVfc9EZxE3bLlbr
         6bAoL1+nebAEH0iLYQv9WWw8xhkX5A6SaoDjRKIXxu0LHX1K5Fe6eU0IS08BpnVGeOh/
         ejzQ==
X-Gm-Message-State: AOAM530d7bJW8t2DdJ/hCkDfx9KmcdFLKS2y05nrEL3LWuPqaz8ia4DP
        SOCBr1mXOM2Hz03MVVvAxq4=
X-Google-Smtp-Source: ABdhPJyXDN/I0J6rX7tgA6qBo+gLx59/0eK26JUBhd4I9P4RVw3kUsGPR+A7th43sRskFZUJYEeyZQ==
X-Received: by 2002:adf:fc88:: with SMTP id g8mr12349158wrr.334.1637913528778;
        Thu, 25 Nov 2021 23:58:48 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id q24sm9769319wmj.21.2021.11.25.23.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 23:58:48 -0800 (PST)
Subject: Re: [RFC PATCH 0/2] Introduce ancillary links
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com
References: <20211126001603.41148-1-djrscally@gmail.com>
 <YaBNlpcr+i6s5rng@pendragon.ideasonboard.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <de31fd62-b6f9-e042-9d26-6c3feb3faaa4@gmail.com>
Date:   Fri, 26 Nov 2021 07:58:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaBNlpcr+i6s5rng@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 26/11/2021 02:59, Laurent Pinchart wrote:
> On Fri, Nov 26, 2021 at 12:16:01AM +0000, Daniel Scally wrote:
>> Hello all
>>
>> This series is not yet ready to merge, but I wanted to share it as I know some
>> other folks are working in similar areas at the moment (and I am including the
>> libcamera devel list for the same reason)
> Seems you forgot to CC libcamera-devel :-) Let's fix that on v2.


Argh! Sorry, will do

>> At present there's no means in the kernel of describing the supporting
>> relationship between subdevices that work together to form an effective single
>> unit - the type example in this case being a camera sensor and its
>> corresponding vcm. To attempt to solve that, this series adds a new type of
>> media link called MEDIA_LNK_FL_ANCILLARY_LINK, which connects two instances of
>> struct media_entity. Further work would be needed to document it properly, and
>> there may be ramifications within the v4l2-core which I have not yet discovered
>> (a lot of places seem to assume that media_entity->links means pad-2-pad links,
>> so some extra work might be needed to validate the link type before doing any
>> thing to them).
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
>> Thoughts and comments very welcome :)
>>
>> Dan
>>
>> Daniel Scally (2):
>>   media: entity: Add support for ancillary links
>>   media: v4l2-async: Create links during v4l2_async_match_notify()
>>
>>  drivers/media/mc/mc-entity.c         | 30 ++++++++++++++++
>>  drivers/media/v4l2-core/v4l2-async.c | 51 ++++++++++++++++++++++++++++
>>  include/media/media-entity.h         | 30 ++++++++++++++++
>>  include/uapi/linux/media.h           |  1 +
>>  4 files changed, 112 insertions(+)
>>
