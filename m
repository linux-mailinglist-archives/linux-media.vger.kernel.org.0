Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF36D27AF8F
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 16:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgI1OBH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 10:01:07 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:43211 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726348AbgI1OBG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 10:01:06 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Mti8k6esDv4gEMtiBkRJXI; Mon, 28 Sep 2020 16:01:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1601301664; bh=EG2psuMnsd0FnV6KjMroB4Lfp/laKLR/+FdHziTm0ts=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Pxkl85lxpGmnpvxXOg81+2jCO84nEB5f4nSH7nHReVSjUr/Th/MDVa8U/LOHaar5S
         6lIi79MH45+K0/GMLW5weJDyzo7Z/Cp05U0qkSFgslbWM4VJSXDsVNgOm7TVSjK7LQ
         QsFbY8PVK1tl6/83+jOzOa38iJMvk7PEreb6xGGaZ8+kSVPbxyVdRwWHFfIARVTgqj
         WEa5zKXei30Cd0wLgsoOJzOwY8H2y3R1k8lSvTpZccDZDFAhDsdLXxiDKUa8E3k/EB
         ge4akzS2T1t+yNC2+i4vaA/+oXuRHAAefbirmS6hKRY4xZ6RV35jIG+JGvttD4C3g9
         IpkLEUAv2+9JQ==
Subject: Re: [PATCH RFT/RFC v2 00/47] staging: media: bring back zoran driver
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Corentin Labbe <clabbe@baylibre.com>, gregkh@linuxfoundation.org,
        mchehab@kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
 <34662073-bbf3-8eaf-47b4-c715337f4021@xs4all.nl>
 <20200928135344.GD23539@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c941a8b9-6ed8-ff54-6114-f31af37d25a1@xs4all.nl>
Date:   Mon, 28 Sep 2020 16:01:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928135344.GD23539@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP6ilyQnBZPXVL7uj9Y/p3z5YXk81zTYKn5zMCj4nIX/6GpMDwUZ2GrqRFxQwI97GjGtuohsBTbUoCVB2YBhRReApBPjhVn9FF/lyvRmA7mcXUheyBaJ
 74GE/gdFPAw1eh6nMDtuulJf35gj4a4GNwMepCxkfU2T8fX7VQfU49NSpY9oAn0YB90llAJAfvK7itkoiLuVqH/ATldWed8dCFMBcGfGdOUgu+LQFyHT5zc7
 pAwTXnn5go8Pj2IuUvvf+wOpB2aPnbbUdYZJOB4UkTKI9Nm1UURjhV2K+M5enuomVbI0l/hWVfVRGt0u8FAJa7dK0mPOgq4U+B5CJZWwuCN2oe2qRAthI8rW
 O57V6KBeA3/iyYNDW3fa4bqK16NE/+UXu4NGmKqICDtS2cHDqjJhGD8QAuOTsc0rtdMjE3C0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/09/2020 15:53, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Mon, Sep 28, 2020 at 03:45:03PM +0200, Hans Verkuil wrote:
>> On 25/09/2020 20:30, Corentin Labbe wrote:
>>> Hello
>>>
>>> The zoran driver was removed in 5.3
>>> The main reason of the removing was lack of motivation to convert it to
>>> VB2
>>> Since I need it, I worked on bringing it back.
>>>
>>> So the plan to achieve it was:
>>> - clean up the coding style.
>>> - convert old usage/API
>>> - clean unused code
>>> - convert to VB2
>>>
>>> I have tried to split a bit the VB2 patch (by adding/removing code in
>>> another patch), but the result is unfortunately still a big patch.
>>>
>>> The result of this serie is a working zoran driver.
>>> Furthermore it is now compliant to v4l-compliance.
>>>
>>> In the process some old (useless) feature (fbuf, overlay) was removed
>>> for simplifying maintenance.
>>>
>>> The zoran hardware support MJPEG decompression, but this feature is
>>> temporarily disabled by this serie.
>>> But basically, this feature was unusable, since the only tool which
>>> permitted to use it was a mplayer option.
>>> But this mplayer option no longer compile (probably since a long time)
>>> and is such a hack (a copy of some private ffmpeg structure) that it is
>>> unfixable.
>>> Happily, when I started to work on zoran, a patch was posted on ffmpeg
>>> ML which permit it to output non-raw video stream (and so MJPEG for
>>> zoran case).
>>> But the zoran hw does not like some part of JPEG header it receives, so
>>> a filter need to be written.
>>> Anyway, this disabling is not a regression, since this feature was not
>>> usable since a long time.
>>>
>>> Since the driver was in staging, I targeted staging, but probably the
>>> driver is in a sufficient good shape to target media and bypass staging.
>>>
>>> This driver is tested on a DC10+ (on x86). Tests on different hardware
>>> are welcome.
>>>
>>> I would like to thanks all people that helped me to achieve this (mostly
>>> #v4l)
>>>
>>> Regards
>>>
>>> PS: this serie is resent a bit soon since linux-media didnt get some patch
>>> and cover letter
>>
>> Thank you very much for your hard work!
>>
>> I've just posted a PR for this driver since it is in good enough shape to
>> resurrect in staging.
>>
>> This means that starting with 5.10 this driver will once again be available.
>>
>> There are some things that I would like to see fixed before moving it out
>> of staging:
>>
>> 1) Check the driver with checkpatch --strict: I noticed various warnings
>> that would be good to fix. Let's have this cleaned up before moving it
>> out of staging.
>>
>> 2) I would like to see the output support fixed.
> 
> As lots of time has elapsed since the very first driver for this card
> was merged, and the (Linux) world has changed quite a bit since then,
> would it make sense to expose this feature through DRM/KMS instead ?

No, this is really a video output only, not something you would use as a
desktop output. I'm sure you can probably shoehorn it into DRM/KMS, but
it would not be a logical fit for this type of hardware. And besides, it
makes no sense to put a lot of effort in that for such old hardware.

Regards,

	Hans
