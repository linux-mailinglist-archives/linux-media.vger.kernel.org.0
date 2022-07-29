Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0718585000
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 14:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235451AbiG2MLj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 08:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbiG2MLi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 08:11:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E1187F7D
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 05:11:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9DE26B827AE
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 12:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BF8C433D7;
        Fri, 29 Jul 2022 12:11:33 +0000 (UTC)
Message-ID: <9ddc981e-81fb-e4a7-9056-7134b1805ad2@xs4all.nl>
Date:   Fri, 29 Jul 2022 14:11:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/5] media: i2c: cat24c208: driver for the cat24c208 EDID
 EEPROM
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Erling Ljunggren <hljunggr@cisco.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Jonathan Selnes <jonathansb1@gmail.com>
References: <20220728114050.2400475-1-hljunggr@cisco.com>
 <20220728114050.2400475-5-hljunggr@cisco.com>
 <CAHp75VeKMJ7eSZ3SLki74o+LkL6CBfcx4RL90n2J20BE+8L+KA@mail.gmail.com>
 <8fe44de7-2cb5-eb9d-2e2b-ac6dc0af41a5@xs4all.nl>
 <CAHp75Ve1SC_a0ZM2G-3j73dE7rZCxFbay0zzmB5_m_iJKma5tg@mail.gmail.com>
 <b97dcd78-3565-e20f-274a-693972834107@xs4all.nl>
 <CAHp75Vdw8z3m+gs-vU-O8Umh2CqstNUoMPs08-PtJxfuU8K=kA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAHp75Vdw8z3m+gs-vU-O8Umh2CqstNUoMPs08-PtJxfuU8K=kA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On 29/07/2022 14:00, Andy Shevchenko wrote:
> On Fri, Jul 29, 2022 at 9:21 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>> On 28/07/2022 22:56, Andy Shevchenko wrote:
>>> On Thu, Jul 28, 2022 at 3:23 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>> On 28/07/2022 14:02, Andy Shevchenko wrote:
>>>>> On Thursday, July 28, 2022, Erling Ljunggren <hljunggr@cisco.com <mailto:hljunggr@cisco.com>> wrote:
>>>
>>>>>     Support reading and writing the EDID EEPROM through the
>>>>>     v4l2 API.
>>>>>
>>>>> Why the normal way of representing as a memory (we have framework and drivers) can’t work?
>>>>
>>>> Because support for EDID for video sinks is already part of the media subsystem (V4L2).
>>>> Normally it is integrated into an HDMI receiver, but in this case it is just the EDID
>>>> support without the video receiver. It belongs in drivers/media in any case since EDIDs
>>>> are closely tied to media.
>>>
>>> It's fine. From the Linux perspective we do not reduplicate the
>>> drivers that are done by other frameworks, right?
>>>
>>>>> Moreover, this driver seems limited in support of variety of the eeprom chips.
>>>>
>>>> Not quite sure what you mean. The cat24c208 is what this was developed for and
>>>> the only one we have.
>>>>
>>>> Note that an EDID EEPROM != a regular EEPROM: it has to support the VESA E-DDC
>>>> standard, which a normal EEPROM doesn't. So these devices are specifically made
>>>> for this use-case.
>>>
>>> What is the difference from a programming interface?
>>> Can the nvmem driver(s) be reused (at24?)?
>>
>> No. EDID EEPROM devices are specific to storing EDIDs: they have two i2c
>> ports, one connected to (typically) the HDMI bus (DDC lines) allowing a
>> video source to read the EDID, the other is connected to the SoC to write to
>> and configure the device. The HDMI bus side has two i2c addresses (reading the
>> EEPROM and to write to the segment address for EDIDs > 256 bytes), the SoC
>> side has three i2c addresses: to configure the behavior, the segment address,
>> and to write the EDID from the SoC.
>>
>> So it is a much more complex device than a regular eeprom, and it really
>> is dedicated to EDIDs only.
> 
> Thanks for the explanation, but it's still unclear what the
> differences are in the programming interface there. Perhaps you may
> simply register a platform device in this driver and reuse the rest
> from at24?

No, it's really different from a regular eeprom.

> 
>> Also note that the V4L2 API is already used to get/set EDIDs, everything is
>> in place for supporting that, including support for parsing EDIDs for the
>> physical address, which is something that is needed if this is combined with
>> HDMI CEC hardware. It's not implemented in this driver since it is not
>> needed in our use-case, but that might change in the future.
>>
>> And by using the V4L2 API you can use v4l2-ctl --get-edid and --set-edid
>> out of the box, using the standard API for EDIDs.
> 
> Bonus question: we have cat24c04/cat24c05 are recognized by at24
> already, are they different to cat24c08?
> 

Yes, they are different.

Regards,

	Hans
