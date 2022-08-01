Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9AF58706D
	for <lists+linux-media@lfdr.de>; Mon,  1 Aug 2022 20:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbiHASfG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Aug 2022 14:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbiHASfF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Aug 2022 14:35:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC24C60
        for <linux-media@vger.kernel.org>; Mon,  1 Aug 2022 11:35:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 743CBB81603
        for <linux-media@vger.kernel.org>; Mon,  1 Aug 2022 18:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1FFC433C1;
        Mon,  1 Aug 2022 18:35:01 +0000 (UTC)
Message-ID: <b426bd08-6c52-3891-9319-b6cc52bdfbab@xs4all.nl>
Date:   Mon, 1 Aug 2022 20:34:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/5] media: i2c: cat24c208: driver for the cat24c208 EDID
 EEPROM
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Erling Ljunggren (hljunggr)" <hljunggr@cisco.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "jonathansb1@gmail.com" <jonathansb1@gmail.com>
References: <20220728114050.2400475-1-hljunggr@cisco.com>
 <20220728114050.2400475-5-hljunggr@cisco.com>
 <CAHp75Ve6-BQ_Ajst96cr=XvJGV247_FYLTHTz=nvTCC3NhQa1A@mail.gmail.com>
 <db2d74d0ab17b407223092c8e0e01784d36bbda1.camel@cisco.com>
 <CAHp75Vc2qWQXk-+0ath8zuTaGHmSG_ZiUYih=4rGeKx3_nmtsQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAHp75Vc2qWQXk-+0ath8zuTaGHmSG_ZiUYih=4rGeKx3_nmtsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 01/08/2022 16:57, Andy Shevchenko wrote:
> On Mon, Aug 1, 2022 at 3:07 PM Erling Ljunggren (hljunggr)
> <hljunggr@cisco.com> wrote:
>> On Fri, 2022-07-29 at 17:51 +0200, Andy Shevchenko wrote:
>>> On Thu, Jul 28, 2022 at 1:53 PM Erling Ljunggren <hljunggr@cisco.com>
>>> wrote:
> 
> ...
> 
>>>> +       usleep_range(WRITE_CYCLE_TIME_US, 2 * WRITE_CYCLE_TIME_US);
>>>
>>> Sleep even in case of error? Is it required?
>>> (Same Q per other similar places)
>>
>> The i2c transfer may still have written some data, and we need to wait
>> for the EEPROM to update.
> 
> But in an error case you will leave EEPROM in an erroneous state?

Yes, if this happens you likely have a hardware error anyway. It's not
worth it trying to be smart in that case. For that matter, I don't know
what a smart solution would be.

> 
> ...
> 
>>>> +       static const u8 header_pattern[] = {
>>>> +               0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00
>>>
>>> Keeping a comma at the end is good anyway.
>>
>> This header pattern is fixed to 8 bytes, and will never be more than 8
>> bytes. So I don't think think the added comma is necessary.
> 
> It's minor, so up to you, folks.
> 
>>>> +       };
> 
> ...
> 
>>>> +       state = kzalloc(sizeof(*state), GFP_KERNEL);
>>>> +       if (!state)
>>>> +               return -ENOMEM;
>>>
>>> devm_kzalloc() ?
>>
>> This will fail if the device is forcibly unloaded while some
>> application has the device node open.
> 
> I'm not sure how it's related. Can you elaborate a bit, please?
> 
> If you try to forcibly unload the device (driver) when it's open and
> it somehow succeeds, that will be a sign of lifetime issues in the
> code.
> 

Not with rmmod but using the unbind facility. For new media drivers we generally
want to avoid using devm_*alloc, it causes more problems than it solves.

It's unlikely to be an issue here, but I'd rather keep it as-is.

Regards,

	Hans
