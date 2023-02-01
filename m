Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 009366862A7
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 10:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbjBAJQW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 04:16:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232002AbjBAJQP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 04:16:15 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEFBF6186D
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 01:15:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A0FC4B82155
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 09:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45047C433D2;
        Wed,  1 Feb 2023 09:15:40 +0000 (UTC)
Message-ID: <20ceeb7f-336a-b51c-8cc8-128cc9ebcd2e@xs4all.nl>
Date:   Wed, 1 Feb 2023 10:15:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Future of the SAA7146 drivers
Content-Language: en-US
To:     Stefan Herdler <herdler@nurfuerspam.de>,
        linux-media@vger.kernel.org
Cc:     Soeren Moch <smoch@web.de>, Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
 <c093e775-e863-f886-e819-e8a929775a89@xs4all.nl>
 <a24d4645-ac78-9990-92c3-7c04282f190e@nurfuerspam.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <a24d4645-ac78-9990-92c3-7c04282f190e@nurfuerspam.de>
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

Hi Stefan, Sören,

On 01/02/2023 00:56, Stefan Herdler wrote:
> Hello Hans,
> 
> I'm glad to read that at least the saa7146 driver won't be removed
> completely.
> 
> 
> On 31/01/23 09:45, Hans Verkuil wrote:
>> Hi Stefan,
>>
>> On 30/01/2023 23:19, Stefan Herdler wrote:
>>> Hello everyone.
>>>
>>> This mail is a little bit long, I'm sorry for that.
>>> But I have to describe the TV-situation in Germany roughly. Without that
>>> knowledge it is definitely not understandable why this DVB-S cards are
>>> still very useful here.
>>> Reader familiar with this crazy situation may proceed to the driver
>>> section below.
>>>
>>> I'm primary a user of this cards but have profound knowledge about the
>>> Hardware. I used to repair the cards for me and other users back then.
>>>
>>> I own Fullfeatured and Budget-cards and use them daily in my VDR-System.
>>> In Germany many channels are free-to-air in the DVB-S version only. I
>>> would like to use these cards for a few more years until DVB-S is
>>> deactivated or the HD-Versions of the channels become free-to-air.
>>> I'm not willing to pay 75 Euro a year for TV-commercials in HD and I'm
>>> not the only one with this opinion.
>>> 14 million of the 17 million satelite-tv-households in Germany watch
>>> this channels in SD-quality only (~82%)![1]
>>> In addition uses the encrypting-system a proprietary CAM extension which
>>> makes it impossible to watch this channels on a HTPC legally.
>>> This situation won't change until 2025 (by a kind of law!). What then
>>> happens is currently completely uncertain.
>>>
>>>
>>> The driver topic however is new to me, the cards where always working
>>> out of the box. I noticed the upcoming removal right before my first mail.
>>>
>>> Honestly I was a little shocked that the driver may be removed from Kernel.
>>
>> Don't worry, the saa7146 driver won't be removed. I admit that that was
>> my initial plan, but you are not the only one who contacted me to let me
>> know that the DVB functionality is still in use. I had not expected that
>> for such old hardware, but it is clear that this driver can't be removed.
>>
>>> The card may be old and not produced any more, but they are not rare and
>>> easily obtainable second hand. There are always multiple offers for
>>> reasonable prices on the common platforms.
>>> And the cards are running flawless on current mainboards with PCIe-PCI
>>> Bridge.
>>>
>>> There must be a lot of SAA7146 based cards been sold in Europe. Many
>>> brands sold them, mostly rebranded Technotrend cards.
>>> Even Hauppauge, the most important brand, sold the TT-Budged as "Nova"
>>> and the Fullfeatured as "Nexus" for years. Their own Connexant based
>>> designs came pretty late, short before the PCIe-cards.
>>>
>>> I carefully estimate, at least 50% of all PCI-DVB-cards sold in Europe
>>> where SAA7146 based.
>>> There must be still a number of users out there.
>>>
>>> The relevance of SAA7146 for PCI-DVB-cards is almost like the Bttv-Chips
>>> for analog TV a few years before. At least in Europe.
>>> And the bttv driver not deprecated despite older and using videobuf1 API!
>>
>> The underlying reason for deprecating this driver in the first place was
>> the use of the old videobuf framework for analog TV in this driver: we
>> want to get rid of that, either by removing such drivers, or converting
>> it to vb2 (we plan to do that for bttv and cx18). For the saa7146 there
>> is another option: dropping the analog TV support only.
>>
>>>
>>>
>>> SAA7146 driver
>>> ==============
>>>
>>> I've read a lot in the last days and the main issue with the SAA7146
>>> driver seems to be the missing maintainer.
>>> All other issues seem to be a result of that.
>>> Right?
>>
>> Right. I'm on record as the maintainer, but I really don't have the time
>> to do a substantial job like the vb2 conversion.
>>
>>> And the driver desperately needs someone with expertise about the cards
>>> and the driver.
>>> I've spotted a big chunk of unused code just by knowing which cards have
>>> been build and which not.
>>>
>>> Sören Moch offered to maintain the complete SAA7146 driver in the
>>> VDRportal and in this list too. This offer includes the videobuf2
>>> conversion too.
>>> On condition that the support of the fullfeatured cards stays in the
>>> kernel.
>>> I understand that. He only owns fullfeatured cards.
>>> And I am interested in keeping my fullfeatured cards operational too.
>>>
>>> I'm convinced Sören could handle the driver well and he is the only one
>>> I know who probably could do that. And he is actively offering to do the
>>> job.
>>
>> Honestly, that would be great. We really need to get rid of the old videobuf
>> framework, it is awful. I found someone to do the bttv conversion, and I plan
>> to do the cx18 conversion. So that leaves the saa7146: it's either converted
>> to vb2, or analog video support (that's the part that uses videobuf) has to
>> be removed.
>>
>> Obviously, if someone wants to do the vb2 conversion, then that would be
>> perfect. I was looking at removing analog video support, and that doesn't
>> look as easy as I thought it would be.
>>
> The SAA7146 driver suite is a kind of beast ;-).
> 
> I guess it is mainly caused by the DVB-C Budget-Cards.
> There are some having analog support too.
> 
>> I can certainly advice how to go about converting to vb2 as I've done it a
>> few times in the past. It's rather painful, mostly because it is a 'big bang'
>> change: it ends up as a single large and mostly unreviewable patch.
>>
> Indeed, I've searched for some patches and all are huge.
> I have some basic C knowledge, but no experience with kerneldrivers nor
> vb1 nor vb2. Unfortunately such a conversion would be out of scope for
> me. At least if it should be done in a reasonable time frame.
> 
> Sören wrote the conversion would't be a big deal for him and it would be
> done within a few weeks.
> 
>>>
>>>
>>> That leads to the DVB-API part for the AV7110 which should be removed.
>>>
>>> An API conversion for the AV7110 does not make sense any more. 10 years
>>> ago maybe, but not now.
>>> Working software would be broken and there will be no benefit for the
>>> user at all.
>>>
>>> Converting is however not easy and a driver specific UAPI would be
>>> necessary in any case.
>>> The ioctl "VIDEO_SELECT_SOURCE" needed and definitely missing in the
>>> V4l2-API (see ivtv driver).
>>> The OSD of the FF-Cards is more canvas like, not a framebuffer. The OSD
>>> ioctl are also needed and I haven't found anything in V4l2-API to
>>> replace them.
>>>
>>> What about putting the 3 API-files into one driver specific UAPI file?
>>> The deprecated DVB-API part could be officially removed and the
>>> maintainer of the av7110 driver would become responsible for the API.
>>> Could that be an acceptable solution for everybody?
>>> Or do the ~10Kb of possible redundancy in the header hurt so much?
>>
>> I think this can be something that can be discussed later. It's not my
>> main concern and not the reason why I originally planned to remove the
>> driver. The use of videobuf is the main problem.
>>
>> If Sören wants to become an active maintainer for this driver, then the
>> vb2 conversion would be the first step. But there is a lot more that can
>> be done, I'm sure.
>>
> Yes he wants, that is his offer to the VDR-community.
> 
> He just wants a kind of guarantee, that the driver for the fullfeatured
> cards he owns stays in the kernel.
> That is understandable for me, he would do the job voluntary without
> been payed.

Once it is converted to vb2 the driver can stay.

Note that the driver might need a bit more work: we use the v4l2-compliance
utility to test V4L2 API compliance of a driver, and after the vb2
conversion the driver should pass this test. So the compliance test might
find some other things that do not work as they should, and it would be
really good to clean that up as well. Usually the things it finds are pretty
easy to fix.

> 
> There is a long lasting controversy about the deprecated 3 DVB-API-files
> for the av7110 driver.
> Sören stated he is tired about that discussions and looking for
> permanent solution without having to rewrite the whole driver.
> 
> In this case I'm just the messenger, but I would also prefer a permanent
> solution.
> That is why I made the suggestion with the driver specific UAPI file.
> The av7110 driver is only driver using this API-part.
> And the modification is fairly easy and the impact minimal.
> 
> May that be a compromise all parties can live with?

Moving it to a public av7110.h header makes sense to me.

It's a nice-to-have in my view, and moving it to a driver-specific API
should avoid future discussions. The fact remains that as long as
people use this API we can't remove it, however much we would want to.

I think the main problem has always been that we are surprised at how
many people still use these cards. It's very similar in that respect
to the bttv driver: very old, but still in use.

The difference appears to be that the use of saa7146 cards is confined
to a specific region (esp. Germany), whereas bttv is in use worldwide.

Because of that we just miss that it is still in use.

Having an active maintainer should help with that.

Regards,

	Hans
