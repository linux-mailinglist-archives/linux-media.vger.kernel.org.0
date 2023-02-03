Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 289506892BC
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 09:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbjBCIvL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 03:51:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbjBCIvJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 03:51:09 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2006B036
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 00:51:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E93CCB82614
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 08:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577D7C433D2;
        Fri,  3 Feb 2023 08:51:01 +0000 (UTC)
Message-ID: <c735aadc-80cd-9332-6661-638cad63afa2@xs4all.nl>
Date:   Fri, 3 Feb 2023 09:50:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Future of the SAA7146 drivers
Content-Language: en-US
To:     Stefan Herdler <herdler@nurfuerspam.de>,
        linux-media@vger.kernel.org
Cc:     Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>,
        Soeren Moch <smoch@web.de>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
 <c093e775-e863-f886-e819-e8a929775a89@xs4all.nl>
 <a24d4645-ac78-9990-92c3-7c04282f190e@nurfuerspam.de>
 <20ceeb7f-336a-b51c-8cc8-128cc9ebcd2e@xs4all.nl>
 <014db0ee-55fe-2966-a531-b8c23e97b402@web.de>
 <d9197b80-335c-ee70-eccc-ad04c026cbc9@xs4all.nl>
 <8fb1799b-5ed1-9d26-54fc-b47abe0c13cf@nurfuerspam.de>
 <df796e6c-c82f-8734-3de6-8446bd0b48ab@web.de>
 <014a6ade-dddb-6c0d-a59a-186e0b0aa3c2@nurfuerspam.de>
 <44cc2154-9224-510d-1f9c-34ae49f01c73@nurfuerspam.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <44cc2154-9224-510d-1f9c-34ae49f01c73@nurfuerspam.de>
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

On 03/02/2023 01:58, Stefan Herdler wrote:
> Hi Hans,
> 
> It's me again, sorry.
> 
> Sören wrote to me that he dislikes the idea of driver specific
> headerfile and will refuse to maintain the driver if there is any change.
> 
> I can't tell more, I'm just the messenger, sorry.

No problem, I think we'll just leave it as-is.

The reality is that 1) there are very few developers with in-depth DVB
knowledge in the media subsystem, and 2) they don't have time.

Also, the DVB drivers that are in the kernel seem to be doing fine:
bug reports are rare. This videobuf issue is the first in years that
cropped up and this too is really only analog video as well, it's just
that it affects DVB boards as well since the same driver is used.

The av7110 has always been an unusual card and some API decisions were
made in the past that do not fit well into our current ideas how this
should work. But frankly, I personally have no interest in getting
involved in that 'fight'.

BTW, I looked at your av7110api.diff patch and that is a good first step.
I do thing that the existing video.h/audio.h/osd.h should be replaced
with versions that just include av7110.h, with a big fat notice that
these APIs are now av7110 specific (as they have almost always been in
practice).

Regards,

	Hans

> 
> Regards,
> Stefan
> 
> 
> 
> On 02.02.23 22:26, Stefan Herdler wrote:> Hi Hans, Sören,
>>
>> On 02/02/23 10:43, Soeren Moch wrote:
>>> Hi Stefan, Hans,
>>>
>>> On 02.02.23 00:12, Stefan Herdler wrote:
>>>> Hi Hans, Sören,
>>>>
>>>> On 01/02/23, 10:15 Hans Verkuil wrote:
>>>>
>>>> [...]
>>>>>
>>>>> Once it is converted to vb2 the driver can stay.
>>>>>
>>>>> Note that the driver might need a bit more work: we use the
>>>>> v4l2-compliance
>>>>> utility to test V4L2 API compliance of a driver, and after the vb2
>>>>> conversion the driver should pass this test. So the compliance test
>>>>> might
>>>>> find some other things that do not work as they should, and it would be
>>>>> really good to clean that up as well. Usually the things it finds are
>>>>> pretty
>>>>> easy to fix.
>>>>>
>>>> For the records, as long I remember it:
>>>> The "Buget Patch" driver is superfluous and can be removed.
>>>> This driver is for an experimental hardware-mod which never really
>>>> worked. No such hardware was ever produced.
>>>> I was really surprised to see it.
>>> I own such card, as I wrote earlier. The budget patch works great and is
>>> necessary for such cards. Please keep it.
>>>
>> I think you confused it with is successor "fullTSmod" which works great
>> indeed.
>>
>> The support for the "fullTSmod" is implemented in the "dvb-ttpci" kernel
>> module.
>> The "Buget Patch" driver is an separate kernel module.
>>
>>  From Kkonfig:
>> config DVB_BUDGET_PATCH
>>      [...]
>>        Support for Budget Patch (full TS) modification on
>>        SAA7146+AV7110 based cards (DVB-S cards). This
>>        driver doesn't use onboard MPEG2 decoder. The
>>        card is driven in Budget-only mode. Card is
>>        required to have loaded firmware to tune properly.
>>        Firmware can be loaded by insertion and removal of
>>        standard AV7110 driver prior to loading this
>>        driver.
>>
>> I my self own and operate a card with "fullTSmod" too. An I did some
>> mods for others.
>> I never loaded the "Buget Patch" driver.
>> And the kernel module it isn't loaded on my VDR. I checked it right now
>> again.
>>
>> I removed the "budget-patch.ko" and everything kept working like usual.
>> Ill keep an eye on it.
>>
>> Regards,
>> Stefan
>>
>>
>>
>>
>>> Regards,
>>> Soeren
>> [...]

