Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7502966C2C2
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbjAPOx3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:53:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbjAPOwb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:52:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360A322796
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:39:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E3F46B80E6E
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 14:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB42EC433D2;
        Mon, 16 Jan 2023 14:39:01 +0000 (UTC)
Message-ID: <dac6a072-39f4-96c5-cb13-171c54213937@xs4all.nl>
Date:   Mon, 16 Jan 2023 15:39:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCHv2 00/16] staging/media: remove most deprecated drivers
Content-Language: en-US
To:     Corinna Vinschen <vinschen@redhat.com>
Cc:     linux-media@vger.kernel.org,
        Rudy Zijlstra <rudy@grumpydevil.homelinux.org>
References: <Y8UepVxVuihu4Vjj@calimero.vinschen.de>
 <86c7f052-152a-6199-5a00-2db7b3d7cad6@xs4all.nl>
 <Y8VSmox2xCbYltXp@calimero.vinschen.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <Y8VSmox2xCbYltXp@calimero.vinschen.de>
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

On 16/01/2023 14:35, Corinna Vinschen wrote:
> Hi Hans,
> 
> On Jan 16 11:08, Hans Verkuil wrote:
>> Hi Corinna,
>>
>> On 16/01/2023 10:53, Corinna Vinschen wrote:
>>> Hi Hans,
>>>
>>> I only learned about this yesterday, so I hope I'm not too late.
>>>
>>> Please don't do that.  You're about to remove working drivers used by a
>>> lot of people.
>>>
>>> If you remove them from the Linux kernel, you will leave *lots* of DVB-C
>>> and DVB-S card users behind.  They will update their TV recording
>>> machines to a newer system at one point and suddenly their ability to
>>> record from TV is gone forever.
>>>
>>> I'm personally affected by this as well.  We're using a machine with
>>> four Technotrend S2-3200 Budget DVB-S2 cards for TV recordings using
>>> the VDR package.  This card is apparently handled by the code under
>>> drivers/staging/media/deprecated/saa7146.
>>>
>>> If this code goes away, we will have to keep the machine running on
>>> an old kernel for a long time.
>>>
>>> I'm fortunate that I even learned about this developement, being a
>>> developer myself, but how's a normal user to know that a Linux driver
>>> they are using every day is about to be removed from the kernel?  Again,
>>> please don't break the equipment of us users of these DVB-C and DVB-S
>>> cards for the future.  
>>
>> I've dropped the PR for now.
> 
> I'm really glad to read that.
> 
>> Is the concern specifically for the saa7146
>> based hardware?
>>
>> I.e., from Red Hat's point of view, are there any concerns about removing
>> vpfe_capture, tm6000, zr364xx, stkwebcam, fsl-viu, cpia2 and meye?
> 
> I'm not part of the Red Hat media team, so I can't answer that, sorry.  
> 
> The problem is that there are no usage numbers anywhere.  I don't know
> which of these drivers are still in use and which aren't.  I only know
> for certain for our saa7146 based cards @home.  Terratec was the market
> leader for quite some time, so there are lots of Terratec cards and
> budget cards from third party vendors in the wild.
> 
>> The core problem with saa7146 (and the other deprecated drivers) is that
>> it is using the old videobuf framework, which has known problems and we
>> want (need!) to get rid of it, either by dropping drivers or converting
>> them.
>>
>> One partial solution would be to drop analog video support from saa7146,
>> since that's the bit that uses this framework. DVB would remain working,
>> but analog video support would die, unless someone steps up to do the
>> conversion from vb1 to vb2.
> 
> Maybe I'm biased, but who has actually still access to analog TV?  I'm
> not sure about that, but in Germany, analog TV over terrestrial antenna
> has been dropped about 2005.  Analog satellite has gone 2012.  Analog
> cable took until 2019.  I don't know about other regions.

Analog TV is almost certainly still used in places.

But it's not so much about TV as it is about analog video in general, so
also capturing from S-Video or composite connectors. That's definitely
still used.

> 
>> So support for the old MXB, Hexium Gemini and Hexium Orion would die, but
>> for the other DVB devices it would stay alive.
> 
> So, yeah, from my POV this might be an option.
> 
>> I'm honestly quite surprised that these old DVB PCI cards are still in
>> use, I did not expect that.
> 
> There isn't a really well-working alternative, unless you plug in lots
> of USB devices instead.  Even more important these days, the cards are
> still working, despite their age.  There's really no good reason to
> throw them into the dustbin and buy something new, instead of trying to
> use working equipment as long as possible to save waste.

OK, I'll make a new PR that keeps the saa7146 for now, and work on removing
analog video support from saa7146.

Regards,

	Hans
