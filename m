Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9552349391F
	for <lists+linux-media@lfdr.de>; Wed, 19 Jan 2022 12:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353917AbiASLBb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jan 2022 06:01:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23900 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353670AbiASLAp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jan 2022 06:00:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642590044;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d2m48mn80jDKDCnE2rawlNHY8eHCKj6fdtri+LMOkmo=;
        b=bH0YdNl3gROqzED72yvrb4OtQaPtn4d2qV6Esdl/e6gkmTkElwyuWCjRTjIgpSfkb9fcCA
        SMGKCOiLmyetsmdMSVol5Dot8i/CVc7EFQZ1dcOqNgyqw1VvlfV97XkOv+yVGl1DCiAW96
        zbLsEkDT4EEyfVjE/c74Gdhs4w5oKOw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-GWvn_zqPMHysmjWZRgc3aw-1; Wed, 19 Jan 2022 06:00:42 -0500
X-MC-Unique: GWvn_zqPMHysmjWZRgc3aw-1
Received: by mail-ed1-f72.google.com with SMTP id ej6-20020a056402368600b00402b6f12c3fso1954453edb.8
        for <linux-media@vger.kernel.org>; Wed, 19 Jan 2022 03:00:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=d2m48mn80jDKDCnE2rawlNHY8eHCKj6fdtri+LMOkmo=;
        b=rH8MBxEnPlWfqCMIULa4NuiN9rE3+cmAbQLTXiyYoTsG/RDfvMgALwqrjZ4B+o6bDF
         6oi9JTwDCaXc7CDkut3Oj58M/0QE6bOQQqGD1kf+Y8GLMVomm5eBCWOWZNZuN4oOWEXF
         dUM1jrZ+leE3CMzl4Qv8tPFMk+KL/PwZLyzi3NF4noDTnvAN1BDxdhvYWBIvOT7p18+D
         OKkQHoDEDnliuthGNuBcJnrHzpeV69WEcb99zMUaiYPtsQesueHzxiMFrsOtHQ4T5DGZ
         Xjt6+BAi5pP+9Twtf/pvlLvw+J7RpP+2PPJRjFolWsYiXdcz5I6J5dMuK444GW1IxRt8
         a9tg==
X-Gm-Message-State: AOAM533bicXUCXNVn0Wb+AQlQGlKjEGmLivL4XfwurLRZppCOhj6Pbwk
        UhaQDaHX/Eg3bleBrQI8EvxDCuBpEUW107khjsYgFg0kp2V6ODoBgWtalG3PNwPmF8GfiLgyWzi
        hTxv2yfjJqURaAbruM7s1ce8=
X-Received: by 2002:a17:906:2f08:: with SMTP id v8mr23230707eji.708.1642590041274;
        Wed, 19 Jan 2022 03:00:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCmB/YHMJKgLCZ28d1HocJEFO46QAhgLYaXKV9pdmjmCPFl1oKfHvRv/RgnoI+8rcGchE17Q==
X-Received: by 2002:a17:906:2f08:: with SMTP id v8mr23230691eji.708.1642590041054;
        Wed, 19 Jan 2022 03:00:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id l1sm6224345ejh.57.2022.01.19.03.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 03:00:40 -0800 (PST)
Message-ID: <24b78ce0-dd6c-dcdb-ecdd-3f8e27debd9b@redhat.com>
Date:   Wed, 19 Jan 2022 12:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Firmware (devicetree/ACPI interface) for marking camera sensors
 being on the front/back of a device
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        libcamera devel <libcamera-devel@lists.libcamera.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <31c05526-f6fc-f48f-a900-8103ac5c4215@redhat.com>
 <YeSaFXO1Z+F088LR@pendragon.ideasonboard.com>
 <179e8c32-a5f5-48a5-8410-e4f0a8f73bd2@redhat.com>
 <YeWMzbq70ZDcWUB2@pendragon.ideasonboard.com>
 <5dbbba6c-9036-a104-d6a6-483fa621c0b6@redhat.com>
 <Yea3NFdjXmrhkVum@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yea3NFdjXmrhkVum@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 1/18/22 13:48, Laurent Pinchart wrote:

<snip>

>>> I wonder if the atomisp2 driver will ever get out of staging. There's so
>>> much work to be done there.
>>
>> I would be more then happy if we can get it mostly functional, ever
>> getting it out of staging indeed is unlikely.
> 
> :-)
> 
> Does it require image processing algorithms in userspace, or is it all
> handled by firmware ?

I believe it will require 3A stuff in userspace, so the plan is to
write a libcamera pipeline handler for it eventually. ATM my focus
is on just getting a picture out of it, setting e.g. exposure + gain
manually for now.  We do have it working on some Cherry Trail devices
now, but I would really like to also get it to work on Bay Trail devices,
because the more work we do on improving it while only CHT is supported
to bigger the chance that we introduce changes which cause (more)
brokenness on BYT.

So my plan (for the weekends) is to get the @#%$#@! piece of code to
produce an image on BYT hw :)

Regards,

Hans

