Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C294858A810
	for <lists+linux-media@lfdr.de>; Fri,  5 Aug 2022 10:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbiHEIcA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Aug 2022 04:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiHEIb7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Aug 2022 04:31:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A0217A8D
        for <linux-media@vger.kernel.org>; Fri,  5 Aug 2022 01:31:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D0F8760FEB
        for <linux-media@vger.kernel.org>; Fri,  5 Aug 2022 08:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5133C433D6;
        Fri,  5 Aug 2022 08:31:51 +0000 (UTC)
Message-ID: <6b390ec3-d0f0-7cca-7cfe-6bc1f55a66ed@xs4all.nl>
Date:   Fri, 5 Aug 2022 10:31:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [ANN] Media Summit at OSS Europe in Dublin: September 12
Content-Language: en-US
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Sean Young <sean@mess.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        paul.kocialkowski@bootlin.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        hidenorik@chromium.org
References: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
 <194a3931-7546-9f26-0607-4ce9f12e9599@xs4all.nl>
 <CAAFQd5D2SL-15eGifaGnFC_aN=XSd=2Rk-YHPdbUBi0tKj0kkA@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CAAFQd5D2SL-15eGifaGnFC_aN=XSd=2Rk-YHPdbUBi0tKj0kkA@mail.gmail.com>
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

On 8/5/22 10:02, Tomasz Figa wrote:
> Hi Hans,
> 
> On Mon, Jul 25, 2022 at 4:41 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi all,
>>
>> On 7/15/22 10:15, Hans Verkuil wrote:
>>> Hi all,
>>>
>>> The Linux Foundation organized a meeting room for us to use on Monday September 12
>>> at the Convention Centre Dublin. It is co-located with the Open Source Summit Europe,
>>> see https://events.linuxfoundation.org/open-source-summit-europe/ for more info.
>>>
>>> To attend this Media Summit no registration is required for the OSSE, but you do need
>>> to register with me by sending me an email. There is a maximum of 20 participants.
>>>
>>> I send out a request for topics in May and got quite a few replies:
>>>
>>> https://lore.kernel.org/all/a7007268a65846674b82a108215992d39b430b38.camel@ndufresne.ca/T/
>>>
>>> If you have more ideas for topics, then reply either to that message (preferred) or this
>>> one.
>>>
>>> See here for more details about the conference:
>>>
>>> https://events.linuxfoundation.org/open-source-summit-europe/
>>>
>>> It is primarily meant for media developers to meet face-to-face. Whether there will
>>> be a possibility to participate remotely is not certain at this time. Past experience
>>> shows that meetings like this are a poor fit for remote attendance, unless you have
>>> a meeting room that is designed for such purposes, which we don't have.
>>>
>>> The actual agenda will depend on who will attend, I hope to be able to put that
>>> together around mid August. But the link above with the 'Request for Topics' thread
>>> will give a good indication of what to expect.
>>>
>>> So, if you want to attend, then let me know by email. Please reply as soon as possible,
>>> even if you are not entirely certain yet if you can attend.
>>
>> The current list of attendees is:
>>
>> Sakari Ailus
>> Kieran Bingham
>> Nicolas Dufresne
>> Benjamin Gaignard
>> Paul Kocialkowski
>> Jacopo Mondi
>> Laurent Pinchart
>> Ricardo Ribalda
>> Maxime Ripard
>> Dave Stevenson (from 11 am)
>> Hans Verkuil
>> Philipp Zabel
>>
>> Tentative:
>>
>> Jernej Škrabec
>>
>> So 12 confirmed attendees. The room holds 20 people, so if you are interested and
>> able to attend, then just let me know, there are still seats available.
> 
> +CC Hidenori from my team who was interested in joining too.
> 
> Do we still have some seats left?

Yes, we have!

I've added Hidenori to the list of attendees.

	Hans

> 
> Best regards,
> Tomasz
> 
>>
>> I plan to post a first draft agenda next week.
>>
>>>
>>> The health and safety regulations will be those of the OSSE LF:
>>>
>>> https://events.linuxfoundation.org/open-source-summit-europe/attend/health-and-safety/
>>>
>>> Code of conduct:
>>>
>>> https://events.linuxfoundation.org/open-source-summit-europe/attend/code-of-conduct/
>>>
>>> A final note: the total cost is at most $650 (depends on the number of people):
>>> that's for a whiteboard, powerstrips and refreshments (coffee, tea, soda, water).
>>>
>>> It would be nice if this can be sponsored by one or more companies. I'll ask
>>> my manager if Cisco can contribute to this (once he's back from vacation), but
>>> if other companies want to contribute as well, then let me know and we can
>>> split the bill. And start off the meeting with a nice slide saying: "Sponsored by:".
>>
>> Collabora offered to sponsor this, many thanks for that!
>>
>> Regards,
>>
>>         Hans

