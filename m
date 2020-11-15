Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6532B3302
	for <lists+linux-media@lfdr.de>; Sun, 15 Nov 2020 09:50:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgKOIph (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Nov 2020 03:45:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbgKOIpP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Nov 2020 03:45:15 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866C5C0613D1;
        Sun, 15 Nov 2020 00:45:09 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id d12so15143739wrr.13;
        Sun, 15 Nov 2020 00:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Gi8K2D21kMH0e4vSIVfIsnkglKo4R+84o/ooESBYffA=;
        b=WQrbwDAIQ6s0zG6ZDzW3vb428iB00BcpkAO6224NqN/g+SR6mMDAC9K6OCb6fH/3rG
         G613XnhaPTU3MPRwwLO1D4DT9/letDGLbvAwq+rpBDatLZsAWqvj22e4r+Imoh+Z0FKw
         pbE3AS7fyTj51f9Pl3cNKoKSRlpV15zVZpDwmZgP8uF6o5wd8inAXwMBHtWOXhkxAU7G
         RoG+9TzAXrq3Lq6ILRBGYl2G1NvJ1flReMPxhMWzmKvRiuoz3isMYpooDrk/xtGshD1I
         Dc8Ov5m4YSBn8uE5qtn9uFTwOfHCwqdQAYk+3WBhp241KIfpMDduvehMJ8R6ZK7IiPz7
         yUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Gi8K2D21kMH0e4vSIVfIsnkglKo4R+84o/ooESBYffA=;
        b=GULU6a8Lo3bOwBX0nqMR1rSXmsMF2vuqe2LprGpgVX1ny1ZcUm5tjE5v57CgHBC9Pu
         2OmNQVwSU05EJA6ic6aKqLMzFTI3+QoLKrsb/Xpwe/Thuq14sBoxr2EuKqZmRjI8ZrvB
         BYI91yOdlTAIqCaE1xi6AtnJLpuLf5+GLBtl0I0XSTzUQdJiLFasrYGw8FrW9ictsqh5
         3wYuVysEN82Jy1VUacmiuf4kAIz7D4t88AxVAcejsJ7i++FtouUqpQc8INVKCVx6ECLX
         om2l6F+/bgKDGQojHIAuzC/joTpRJwGiVuNtZVmIQmH/NJO2/gRxvW/Ld8eISlbyTpWy
         koDA==
X-Gm-Message-State: AOAM533HYOH7SjY7oIC+2Zeh7WjuU6iI0YHzSPPznOKpbogZMEb2T2BM
        NgZbouV4NDx3AOFgT4Rkou5niTlV4dGVnwdM
X-Google-Smtp-Source: ABdhPJzwtSwBu40VCcPK4syvo7naIXMtETdTn6AVW76HP+BL0MeL0hgbN5aIjapm80hSA8SOnsk3LQ==
X-Received: by 2002:a5d:6692:: with SMTP id l18mr12549544wru.44.1605429908267;
        Sun, 15 Nov 2020 00:45:08 -0800 (PST)
Received: from [192.168.1.158] ([2.31.225.98])
        by smtp.gmail.com with ESMTPSA id q17sm20642257wro.36.2020.11.15.00.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2020 00:45:07 -0800 (PST)
Subject: Re: [RFC PATCH v3 9/9] ipu3-cio2: Add functionality allowing
 software_node connections to sensors on platforms designed for Windows
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        laurent.pinchart+renesas@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Petr Mladek <pmladek@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tsuchiya Yuto <kitakar@gmail.com>
References: <20201024012411.GT5979@pendragon.ideasonboard.com>
 <d188f8b5-ed3b-f91b-171a-26afeb7d213e@gmail.com>
 <20201024093702.GA3939@pendragon.ideasonboard.com>
 <20201026161050.GQ4077@smile.fi.intel.com>
 <20201029201918.GD15024@pendragon.ideasonboard.com>
 <CAHp75Vc9uYVvhBe3OyCJzCsU0EY9yi62hsxt3pAwppSfjB+jDg@mail.gmail.com>
 <20201029212930.GE15024@pendragon.ideasonboard.com>
 <20201029222215.GI4077@smile.fi.intel.com>
 <20201029225124.GI15024@pendragon.ideasonboard.com>
 <60b36af2-ad57-000b-76e4-379e1b58a3a0@gmail.com>
 <20201113162231.GO7524@pendragon.ideasonboard.com>
 <CAHp75VeGJKMeY-reNWgypVzJ6Myz5S2RXJPHqbPH5kzLYX3G4g@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <67d30113-6109-9a1d-5ec7-d8daa90a4f34@gmail.com>
Date:   Sun, 15 Nov 2020 08:45:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VeGJKMeY-reNWgypVzJ6Myz5S2RXJPHqbPH5kzLYX3G4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/11/2020 19:45, Andy Shevchenko wrote:
> On Fri, Nov 13, 2020 at 6:22 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>> On Fri, Nov 13, 2020 at 10:02:30AM +0000, Dan Scally wrote:
>>> On 29/10/2020 22:51, Laurent Pinchart wrote:
>>>> On Fri, Oct 30, 2020 at 12:22:15AM +0200, Andy Shevchenko wrote:
>>>>> On Thu, Oct 29, 2020 at 11:29:30PM +0200, Laurent Pinchart wrote:
> ...
>
>>>>> In this case we probably need something like
>>>>>
>>>>> struct acpi_device *
>>>>> acpi_dev_get_next_match_dev(struct acpi_device *adev,
>>>>>                        const char *hid, const char *uid, s64 hrv)
>>>>> {
>>>>>    struct device *start = adev ? &adev->dev : NULL;
>>>>>    ...
>>>>>    dev = bus_find_device(&acpi_bus_type, start, &match, acpi_dev_match_cb);
>>>>>    ...
>>>>> }
>>>>>
>>>>> in drivers/acpi/utils.c and
>>>>>
>>>>> static inline struct acpi_device *
>>>>> acpi_dev_get_first_match_dev(const char *hid, const char *uid, s64 hrv)
>>>>> {
>>>>>    return acpi_dev_get_next_match_dev(NULL, hid, uid, hrv);
>>>>> }
>>>>>
>>>>> in include/linux/acpi.h.
>>>>>
>>>>> Then we may add
>>>>>
>>>>> #define for_each_acpi_dev_match(adev, hid, uid, hrv)                       \
>>>>>    for (adev = acpi_dev_get_first_match_dev(hid, uid, hrv);        \
>>>>>         adev;                                                      \
>>>>>         adev = acpi_dev_get_next_match_dev(adev, hid, uid, hrv))
>>>> What the cio2-bridge code needs is indeed
>>>>
>>>>     for each hid in supported hids:
>>>>             for each acpi device that is compatible with hid:
>>>>                     ...
>>>>
>>>> which could also be expressed as
>>>>
>>>>     for each acpi device:
>>>>             if acpi device hid is in supported hids:
>>>>                     ...
>>>>
>>>> I don't mind either option, I'll happily follow the preference of the
>>>> ACPI maintainers.
>>> Does this need raising elsewhere then? The original idea of just
>>> bus_for_each_dev(&acpi_bus_type...) I have now tested and it works fine,
>>> but it does mean that I need to export acpi_bus_type (currently that
>>> symbol's not available)...that seems much simpler to me but I'm not sure
>>> whether that's something to avoid, and if so whether Andy's approach is
>>> better.
>>>
>>> Thoughts?
>> I like simple options :-) A patch to export acpi_bus_type, with enough
>> context in the commit message (and in the cover latter of the series),
>> should be enough to provide all the information the ACPI maintainers
>> need to decide which option is best. With a bit of luck that patch will
>> be considered the best option and no extra work will be needed.
> The problem with ACPI bus is that it is not as simple as other buses,
> i.e. it may have purely ACPI devices along with *companion* devices,
> which are usually represented by platform bus. On top of that for
> several ACPI devices there can be one physical node and it will be not
> so clear what you are exactly looking for by traversing acpi_bus_type.
> I believe it's hidden on purpose.
Alright - I followed your suggestion to implement the iterator instead
then and left acpi_bus_type hidden, thanks.
