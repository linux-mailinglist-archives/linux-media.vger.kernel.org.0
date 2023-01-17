Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 236D066E2BF
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 16:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbjAQPv1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 10:51:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232741AbjAQPvF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 10:51:05 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 041B186AF
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 07:48:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 96F0861230
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 15:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0C0C433D2;
        Tue, 17 Jan 2023 15:48:54 +0000 (UTC)
Message-ID: <c75b0172-fc2c-90ab-8138-8f916d20be63@xs4all.nl>
Date:   Tue, 17 Jan 2023 16:48:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCHv2 00/16] staging/media: remove most deprecated drivers
Content-Language: en-US
To:     dac6a072-39f4-96c5-cb13-171c54213937@xs4all.nl,
        Corinna Vinschen <vinschen@redhat.com>,
        linux-media@vger.kernel.org
Cc:     Rudy Zijlstra <rudy@grumpydevil.homelinux.org>
References: <Y8UepVxVuihu4Vjj@calimero.vinschen.de>
 <86c7f052-152a-6199-5a00-2db7b3d7cad6@xs4all.nl>
 <Y8VSmox2xCbYltXp@calimero.vinschen.de>
 <dac6a072-39f4-96c5-cb13-171c54213937@xs4all.nl>
 <7bc7316b-6d4a-cac0-bc70-e8b4d2b4b1fd@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <7bc7316b-6d4a-cac0-bc70-e8b4d2b4b1fd@gmail.com>
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

On 17/01/2023 16:38, Tomasz Maciej Nowak wrote:
> Hi.
> 
> W dniu 16.01.2023 o 15:39, Hans Verkuil pisze:
>> On 16/01/2023 14:35, Corinna Vinschen wrote:
>>> Hi Hans,
>>>
>>> On Jan 16 11:08, Hans Verkuil wrote:
>>>> Hi Corinna,
>>>>
>>>> On 16/01/2023 10:53, Corinna Vinschen wrote:
>>>>> Hi Hans,
>>>>>
>>>>> I only learned about this yesterday, so I hope I'm not too late.
>>>>>
>>>>> Please don't do that.  You're about to remove working drivers used by a
>>>>> lot of people.
>>>>>
>>>>> If you remove them from the Linux kernel, you will leave *lots* of DVB-C
>>>>> and DVB-S card users behind.  They will update their TV recording
>>>>> machines to a newer system at one point and suddenly their ability to
>>>>> record from TV is gone forever.
>>>>>
>>>>> I'm personally affected by this as well.  We're using a machine with
>>>>> four Technotrend S2-3200 Budget DVB-S2 cards for TV recordings using
>>>>> the VDR package.  This card is apparently handled by the code under
>>>>> drivers/staging/media/deprecated/saa7146.
>>>>>
>>>>> If this code goes away, we will have to keep the machine running on
>>>>> an old kernel for a long time.
>>>>>
>>>>> I'm fortunate that I even learned about this developement, being a
>>>>> developer myself, but how's a normal user to know that a Linux driver
>>>>> they are using every day is about to be removed from the kernel?  Again,
>>>>> please don't break the equipment of us users of these DVB-C and DVB-S
>>>>> cards for the future.  
>>>>
>>>> I've dropped the PR for now.
>>>
>>> I'm really glad to read that.
> 
> Thanks from me as well.
> 
>>>> Is the concern specifically for the saa7146
>>>> based hardware?
>>>>
>>>> I.e., from Red Hat's point of view, are there any concerns about removing
>>>> vpfe_capture, tm6000, zr364xx, stkwebcam, fsl-viu, cpia2 and meye?
>>>
>>> I'm not part of the Red Hat media team, so I can't answer that, sorry.  
>>>
>>> The problem is that there are no usage numbers anywhere.  I don't know
>>> which of these drivers are still in use and which aren't.  I only know
>>> for certain for our saa7146 based cards @home.  Terratec was the market
>>> leader for quite some time, so there are lots of Terratec cards and
>>> budget cards from third party vendors in the wild.
> 
> I've got six of saa7146 based DVB-S2 budget cards still in use.
> Apparently You can still buy a new one[1] which is supported by budget
> driver.
> 
>>>> The core problem with saa7146 (and the other deprecated drivers) is that
>>>> it is using the old videobuf framework, which has known problems and we
>>>> want (need!) to get rid of it, either by dropping drivers or converting
>>>> them.
>>>>
>>>> One partial solution would be to drop analog video support from saa7146,
>>>> since that's the bit that uses this framework. DVB would remain working,
>>>> but analog video support would die, unless someone steps up to do the
>>>> conversion from vb1 to vb2.
> 
> There is ongoing discussion in VDR community about converting to vb2,
> albeit it's very slow and I don't know yet if it'll reach a conclusion.
> And, as proposed, keeping it in staging area or keeping the driver with
> stripped analog video capabilities would definitely help.
> 
>>> Maybe I'm biased, but who has actually still access to analog TV?  I'm
>>> not sure about that, but in Germany, analog TV over terrestrial antenna
>>> has been dropped about 2005.  Analog satellite has gone 2012.  Analog
>>> cable took until 2019.  I don't know about other regions.
>>
>> Analog TV is almost certainly still used in places.
>>
>> But it's not so much about TV as it is about analog video in general, so
>> also capturing from S-Video or composite connectors. That's definitely
>> still used.
>>
>>>
>>>> So support for the old MXB, Hexium Gemini and Hexium Orion would die, but
>>>> for the other DVB devices it would stay alive.
>>>
>>> So, yeah, from my POV this might be an option.
>>>
>>>> I'm honestly quite surprised that these old DVB PCI cards are still in
>>>> use, I did not expect that.
>>>
>>> There isn't a really well-working alternative, unless you plug in lots
>>> of USB devices instead.  Even more important these days, the cards are
>>> still working, despite their age.  There's really no good reason to
>>> throw them into the dustbin and buy something new, instead of trying to
>>> use working equipment as long as possible to save waste.
>>
>> OK, I'll make a new PR that keeps the saa7146 for now, and work on removing
>> analog video support from saa7146.
> 
> Thank You, that would certainly make me satisfied. Would that mean that
> after removing analog video support, driver would go out of staging, back
> to maintained area?

Yes, since there is no reason to keep it in staging once that's done.

Regards,

	Hans

> 
> Best Regards
> 
> 1. https://www.omicom.info/PayPal_Omicom_S2_PCIr3.html
> 

