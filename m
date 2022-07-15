Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA60575FBE
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 13:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbiGOLIK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 07:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiGOLIJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 07:08:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1927868BE
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 04:08:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8D71262285
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 11:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8ACC34115;
        Fri, 15 Jul 2022 11:08:03 +0000 (UTC)
Message-ID: <4f7af7d8-acc3-0dcb-38c3-2d728adb603f@xs4all.nl>
Date:   Fri, 15 Jul 2022 13:08:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [ANN] Media Summit at OSS Europe in Dublin: September 12
Content-Language: en-US
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
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
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
References: <54d42d4e-5994-68a2-4a21-770167d5405a@xs4all.nl>
 <CAPY8ntAuNjyXGOB64ix7g+Tz512XhkE_q2-mxVWfu4GhTShhUQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CAPY8ntAuNjyXGOB64ix7g+Tz512XhkE_q2-mxVWfu4GhTShhUQ@mail.gmail.com>
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

Hi Dave,

On 7/15/22 12:34, Dave Stevenson wrote:
> Hi Hans
> 
> On Fri, 15 Jul 2022 at 09:15, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi all,
>>
>> The Linux Foundation organized a meeting room for us to use on Monday September 12
>> at the Convention Centre Dublin. It is co-located with the Open Source Summit Europe,
>> see https://events.linuxfoundation.org/open-source-summit-europe/ for more info.
>>
>> To attend this Media Summit no registration is required for the OSSE, but you do need
>> to register with me by sending me an email. There is a maximum of 20 participants.
> 
> I hadn't realised you were looking at the Monday for the Media Summit,
> so have currently booked to travel on Monday afternoon.
> 
> If the image sensor related stuff I raised can be scheduled for after
> about 11am, then I should be able to rearrange to be there.
> The stateful encoder stuff is also of interest.

That shouldn't be a problem, certainly not for the sensor stuff, unless I
get similar requests that conflict with this.

Regards,

	Hans

> 
>   Dave
> 
>> I send out a request for topics in May and got quite a few replies:
>>
>> https://lore.kernel.org/all/a7007268a65846674b82a108215992d39b430b38.camel@ndufresne.ca/T/
>>
>> If you have more ideas for topics, then reply either to that message (preferred) or this
>> one.
>>
>> See here for more details about the conference:
>>
>> https://events.linuxfoundation.org/open-source-summit-europe/
>>
>> It is primarily meant for media developers to meet face-to-face. Whether there will
>> be a possibility to participate remotely is not certain at this time. Past experience
>> shows that meetings like this are a poor fit for remote attendance, unless you have
>> a meeting room that is designed for such purposes, which we don't have.
>>
>> The actual agenda will depend on who will attend, I hope to be able to put that
>> together around mid August. But the link above with the 'Request for Topics' thread
>> will give a good indication of what to expect.
>>
>> So, if you want to attend, then let me know by email. Please reply as soon as possible,
>> even if you are not entirely certain yet if you can attend.
>>
>> The health and safety regulations will be those of the OSSE LF:
>>
>> https://events.linuxfoundation.org/open-source-summit-europe/attend/health-and-safety/
>>
>> Code of conduct:
>>
>> https://events.linuxfoundation.org/open-source-summit-europe/attend/code-of-conduct/
>>
>> A final note: the total cost is at most $650 (depends on the number of people):
>> that's for a whiteboard, powerstrips and refreshments (coffee, tea, soda, water).
>>
>> It would be nice if this can be sponsored by one or more companies. I'll ask
>> my manager if Cisco can contribute to this (once he's back from vacation), but
>> if other companies want to contribute as well, then let me know and we can
>> split the bill. And start off the meeting with a nice slide saying: "Sponsored by:".
>>
>> Regards,
>>
>>         Hans
