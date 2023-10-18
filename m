Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E40AD7CDD1A
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 15:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbjJRNXV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 09:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbjJRNXU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 09:23:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB92683
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 06:23:18 -0700 (PDT)
Received: from [192.168.1.110] (unknown [103.251.226.39])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EF312B3;
        Wed, 18 Oct 2023 15:23:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1697635390;
        bh=Chv+HK51PTcc2rswhoSfyMs/h2svT+uSHYzuhFLtNiE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=whQbop8Pd2aMNNpJpuh3Vvzo0MpeY3LwK7oYo4ObqUH+q0q+4X9KraTr2Z5WN9cQb
         Nwda9c36Fjo1VPCGS8hQNJlN4o6ZoPBDkTvbHUyfU0fMHTiDYgPgv8vpVVkUz7Z230
         9iHyjpJ2ZBH/xZH0NCeIv96D+JqfDf9EUg+Cv3uM=
Message-ID: <fc124e30-70ea-c47d-9151-1cbeace557d4@ideasonboard.com>
Date:   Wed, 18 Oct 2023 18:53:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Sensor driver support with CCS
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <54ntzswkt2eyhjdrrr4yk5fnru4msoc2fn6esuxffa6obp3met@mw2jqxtivbtp>
 <ZS+lH9G/SR2L2lGX@kekkonen.localdomain>
 <20231018103227.GC11118@pendragon.ideasonboard.com>
From:   Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20231018103227.GC11118@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 10/18/23 4:02 PM, Laurent Pinchart wrote:
> On Wed, Oct 18, 2023 at 09:27:59AM +0000, Sakari Ailus wrote:
>> On Wed, Oct 18, 2023 at 12:04:46PM +0530, Umang Jain wrote:
>>> Hello everyone,
>>>
>>> Past few weeks I have been working to support IMX519 sensor with CCS
>>> driver. The highlight is that I can capture frames with CCS driver now,
>>> with a few workarounds. This thread summarises the issues that we faced
>>> and act as placeholder for more open and structured discussion.
>>>
>>> - First open question is regarding the upstream support of a sensor
>>>    driver with CCS. How should we term that a sensor is 'mainline-supported'
>>>    if it is getting supported by CCS. How can one use a sensor out of the box
>>>    with mainline kernel, when supported by CCS?
>> If the sensor is fully compliant, it should "just work", but then there's
>> the question of CCS static data if the sensor needs it.
>>
>> For devices that aren't fully compliant this is a more complicated
>> question. Some devices might work with some parameters only, in particular
>> horizontal blanking is a sensitive value. The approach here should be to
>> set minimum and maximum to the same value to force horizontal blanking
>> value that is known to work. The if rules could be used for this as well.
>>
>>> - Continued from the previous discusion point, the more specific question is
>>>    about the sensor-specific static data that is composed of
>>>    manfacturer-specific-registers (MSRs) and (maybe) overridden
>>>    sensor-read-only-regs which are created as part of ccs-tools [1].
>>>    This becomes part of firmware? which needs to live /lib/firmware and
>>>    then picked up by CCS driver.
>>>
>>>    Where can they be centralized ? is linux-firmware an option? [2].
>> I'd favour this.
> linux-firmware could host the binary files, but how about the YAML
> sources ?
>
>>> - It was noticed that with current version of CCS - I was only able to
>>>    get 1/3 buffer filled. This was due to the fact that LINE_LENGTH_PCK
>>>    and FRAME_LENGTH_LINES registers are not getting updated to permissible
>>>    values in / before ccs_start_streaming() starts. Hence they are stuck
>>>    with values from probe time.
>> If you're not changing vertical or horizontal blanking, these are likely
>> the correct values from driver perspective. If these values do not work
>> however, then you most likely have an issue with sensor provided limit and
>> capability information. This should be fixed using CCS static data.
> I may have understood Umang incorrectly, but I thought he meant that the
> driver doesn't program those registers if the controls are not changed
> by userspace, and the register power-up default values are not right.
> Umang, is my understanding wrong ?

Tested everything again, so.. it does seem invoke through ccs_set_ctrl() 
before start streaming but write with the same values as defaults, so it 
appeared to me nothing changed before stream start to me.

So I can say, it wasn't a issue with the values, but the units implied. 
LINE_LENGTH_PCK wasn't written correctly in terms of units. Fixed that 
as part of
[PATCH] media: css: Write LINE_LENGTH_PCK correctly on linux-media.


>
>>> These are top issues we faced while trying to support IMX519. This thread
>>> will act as placeholder to have more discussions in the open and/or help
>>> other sensors that can be supported with CCS.
>> I'm happy to see you using the CCS driver on a sensor I haven't used
>> before. The above issues, while they prevent meaningfully using the sensor
>> right now, they also seem easy to resolve.
>>
>> Additionally --- if the sensor does not provide meaningful values for its
>> vendor and model, we could use the device's compatible string as the basis
>> for the firmware file name. I can post a patch for this.

