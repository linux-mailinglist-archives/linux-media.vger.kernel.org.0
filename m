Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34A0A2CAD76
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 21:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727165AbgLAUgc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 15:36:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27559 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727656AbgLAUgb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 15:36:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606854904;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A7/8+RJkGeSEwmLgpTG65Q4kAPCFxfMme+BpS8NvGD0=;
        b=ClBPuPAbk3ajWaP97DCoqv6Ymn2rst9rAncs/j8ntb6CwjZN22Kj0E9uDjErZiaxiFAarb
        bEPxHUINP8MyrClrJtkstJH+5ZCR3d8/TKfuq5siWs3WGb54CX+9I64zP2TWVrL8CBKrGC
        3r5vaMQzZ3BXD9iOdYEhgzIoIrCWAiM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-pYmHc35POU6pRFknOlOvKQ-1; Tue, 01 Dec 2020 15:35:03 -0500
X-MC-Unique: pYmHc35POU6pRFknOlOvKQ-1
Received: by mail-ej1-f69.google.com with SMTP id h17so1869090ejk.21
        for <linux-media@vger.kernel.org>; Tue, 01 Dec 2020 12:35:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A7/8+RJkGeSEwmLgpTG65Q4kAPCFxfMme+BpS8NvGD0=;
        b=YqL6wsVpJBGFkxc6OyCspbHSd174ROr3X3INlKiz9tIU1fKNf4EkxOuIjXiso6bRQO
         FZDy0WBevy1MciSz0agTX1WSGPcCbz0tzzILD6VTmVB+OVlxRJtX805XKwOpuFvBOE4l
         b1+u/vXv4op60gkciK8vxUDkG3npOEwxXaw18mBvSCQXZOL+lyXKIh8UpLE2sGN1/MpM
         zx8gkHyMzNwJTehLAENMYzJWTC8+3u85upyJ7+pi9K8w0obVW3zV3aEaS8Uf7rL5gkFs
         sUEa/WdlFr4W6wWCAn+1ty2ZAszPNut6tSqjxf/51DSJLqfhHeSgrmerEdVoYXKnuqFR
         B+Ww==
X-Gm-Message-State: AOAM532dZ+k29J9v17DeE4N+C37WxCIn0vAWJagfy3fwCvI8CM8U0GU2
        MS0lDO6ZD5RnipuULXdbxjLGnkzmaad3Ew6rbISOyvPmgq6snS2xe5Lm/64DKwgxmo6LxanGV4i
        1P9FPzZNmeaz0Kmqh+Cq/1jc=
X-Received: by 2002:a05:6402:2377:: with SMTP id a23mr4959742eda.34.1606854901207;
        Tue, 01 Dec 2020 12:35:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLq9OZNQRnGhP9eq3qlTmDQto7T45obR28fwzCSfvUxGuqUM2j8W9ulPaAbdBh7MLqvz+s1w==
X-Received: by 2002:a05:6402:2377:: with SMTP id a23mr4959715eda.34.1606854900954;
        Tue, 01 Dec 2020 12:35:00 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id i2sm410497edk.93.2020.12.01.12.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 12:35:00 -0800 (PST)
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dan Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <8a1b0f5b-1289-256b-b25d-cf8af43bdc84@gmail.com>
 <20201201185417.GL4077@smile.fi.intel.com>
 <20201201185548.GV4569@pendragon.ideasonboard.com>
 <20201201190523.GO4077@smile.fi.intel.com>
 <20201201190638.GZ4569@pendragon.ideasonboard.com>
 <20201201192137.GR4077@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4831d44a-5bcc-8cf3-964c-c7dca6827458@redhat.com>
Date:   Tue, 1 Dec 2020 21:34:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201192137.GR4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 12/1/20 8:21 PM, Andy Shevchenko wrote:
> On Tue, Dec 01, 2020 at 09:06:38PM +0200, Laurent Pinchart wrote:
>> On Tue, Dec 01, 2020 at 09:05:23PM +0200, Andy Shevchenko wrote:
>>> On Tue, Dec 01, 2020 at 08:55:48PM +0200, Laurent Pinchart wrote:
>>>> On Tue, Dec 01, 2020 at 08:54:17PM +0200, Andy Shevchenko wrote:
>>>>> On Tue, Dec 01, 2020 at 08:30:03AM +0000, Dan Scally wrote:
>>>>>> On 30/11/2020 20:07, Andy Shevchenko wrote:
>>>
>>> ...
>>>
>>>>>>>> +static struct int3472_sensor_regulator_map int3472_sensor_regulator_maps[] = {
>>>>>>>> +	{ "GNDF140809R", 2, miix_510_ov2680 },
>>>>>>>> +	{ "YHCU", 2, surface_go2_ov5693 },
>>>>>>>> +	{ "MSHW0070", 2, surface_book_ov5693 },
>>>>>>>> +};
>>>>>>>
>>>>>>> Hmm... Usual way is to use DMI for that. I'm not sure above will not give us
>>>>>>> false positive matches.
>>>>>>
>>>>>> I considered DMI too, no problem to switch to that if it's a better choice.
>>>>>
>>>>> I prefer DMI as it's a standard way to describe platform quirks in x86 world.
>>>>
>>>> Do you think the Windows driver would use DMI ?
>>>
>>> Linux is using DMI for quirks.
>>>
>>>> That seems quite
>>>> unlikely to me, given how they would have to release a new driver binary
>>>> for every machine. I'm pretty sure that a different mechanism is used to
>>>> identify camera integration, and I think it would make sense to follow
>>>> the same approach. That would allow us to avoid large tables of DMI
>>>> identifiers that would need to be constently updated, potentially making
>>>> user experience better.
>>>
>>> All Surface family can be matched in a way as Apple machines [1].
>>>
>>> [1]: https://lkml.org/lkml/2020/4/15/1198
>>
>> But not all Surface machines necessarily have the same camera
>> architecture. My point is that there seems to be identifiers reported in
>> ACPI for the exact purpose of identifying the camera architecture. If we
>> used DMI instead, we would have to handle each machine individually.
> 
> With help of DMI we may narrow down the search.
> 
> But again, we are talking about uncertainity. It may be your way (a lot of
> platforms that have different settings), or mine (only a few with more or less
> standard sets of settings).
> 
> DMI is simply standard in Linux (people usually easier can grep for quirks for
> a specific platform).
> 
> I would rather ask Hans' opinion since he has quite an expertise with DMI for
> good and bad.

So generally there are 2 ways how things like this can go:

1) There is sufficient information in the ACPI table and we use data from the
ACPI tables

2) There is unsufficient info in the ACPI tables (or we don't know how to
get / interpret the data) and we use DMI quirks

Although we do often also use a combination, getting what we can from ACPI,
combined with a set of defaults for what we cannot get from ACPI
based on what reference designs use (IOW what most devices seem to have
copy and pasted). Combined with DMI quirks for when the defaults do not
work (which is quite often).

Depending on if "not working because of wrong defaults" has bad side effects,
another option is also to only allow the driver to load on devices which
have the necessary info provided through a DMI match.

I hope this helps.

Regards,

Hans

