Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDB5E72B0A2
	for <lists+linux-media@lfdr.de>; Sun, 11 Jun 2023 09:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233060AbjFKHml (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Jun 2023 03:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjFKHmk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Jun 2023 03:42:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695212D48
        for <linux-media@vger.kernel.org>; Sun, 11 Jun 2023 00:42:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 05DBD60B98
        for <linux-media@vger.kernel.org>; Sun, 11 Jun 2023 07:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D9BC433D2;
        Sun, 11 Jun 2023 07:42:36 +0000 (UTC)
Message-ID: <fb0a3e84-7174-59b9-d8eb-a966ab61bf73@xs4all.nl>
Date:   Sun, 11 Jun 2023 09:42:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [ANN] Media Summit June 26th: Draft Agenda v4
Content-Language: en-US
To:     wens@kernel.org
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <4ca781b7-1bdd-d71b-ea48-715346672e48@xs4all.nl>
 <CAGb2v673n60PnwNAJeJyvqK1hWNVTRaKLtzU8EfvVbCAO230cw@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <CAGb2v673n60PnwNAJeJyvqK1hWNVTRaKLtzU8EfvVbCAO230cw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/06/2023 09:33, Chen-Yu Tsai wrote:
> Hi Hans,
> 
> On Fri, Jun 9, 2023 at 9:08 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi all,
>>
>> This is version 4 of the agenda for the media summit. Changes since v3:
>> - add the fact mask policy
>> - updates to the attendees list.
>>
>> As always, the agenda is subject to change and all times are guesstimates!
>>
>> The media summit will be held on Monday June 26th at the Holiday Inn which
>> is close to the conference centre where the Embedded Open Source Summit is held:
>>
>> Holiday Inn Prague Congress Centre - Meeting room "E"
>> Na Pankráci 1684/ 15, 140 00 Praha 4-Nusle
>> https://www.ihg.com/holidayinn/hotels/us/en/prague/prgnp/hoteldetail
>>
>> Refreshments (tea/coffee/soda) are available during the day.
>>
>> The meeting room is sponsored by Collabora and Cisco Systems Norway.
>> And lunch is sponsored by Ideas On Board.
>>
>> Many thanks to the sponsors!
>>
>> Regarding the face mask policy: we will follow the same guidance that the
>> Linux Foundation gives for the EOSS conference:
>>
>> https://events.linuxfoundation.org/embedded-open-source-summit/attend/health-and-safety/
>>
>> So: "Masks are recommended, but not required, to be worn at the event."
>>
>> In-Person Attendees:
>>
>> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
>> Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
>> Deborah Brouwer <deborahbrouwer3563@gmail.com>
>> Mauro Carvalho Chehab <mchehab@kernel.org> (Media Kernel Maintainer)
>> Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
>> Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
>> Martin Hecht <martin.hecht@avnet.eu> (Avnet)
>> Jai Luthra <j-luthra@ti.com> (TI)
>> Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
>> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
>> Andrzej Pietrasiewicz <andrzej.p@collabora.com> (Collabora)
>> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
>> Ricardo Ribalda <ribalda@chromium.org> (Google)
>> Michael Roeder <michael.roeder@avnet.eu> (Avnet)
>> Niklas Söderlund <niklas.soderlund@ragnatech.se> (Ragnatech)
>> Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
>> Martin Tůma <tumic@gpxsee.org> (GPXSee)
>> Stanimir Varbanov <stanimir.varbanov@linaro.org> (Linaro, tentative, after 16:30 only)
>> Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
>> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> (Ideas On Board)
>> Arthur Vinchon <arthur.vinchon@allegrodvt.com> (AllegroDVT)
>> Alain Volmat <alain.volmat@foss.st.com> (ST Electronics)
> 
> I'm still not on the list?

You were added everywhere except in this list in this email :-)

Apologies for that, v5 will have you listed.

Regards,

	Hans
