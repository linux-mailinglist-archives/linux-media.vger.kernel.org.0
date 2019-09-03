Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5FE4A625E
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 09:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfICHVw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 03:21:52 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:59515 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726062AbfICHVw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Sep 2019 03:21:52 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 538JiFabJxNy0538MicOnD; Tue, 03 Sep 2019 09:21:50 +0200
Subject: Re: [ANN] Topics for a media summit in Lyon in October
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>
References: <010ba9ce-bac9-6f0c-f128-4f163a7d8ea7@xs4all.nl>
 <a9bb00f0-7ce8-98d4-92cf-57b140814ef6@xs4all.nl>
Message-ID: <e4421a68-e68f-e4b8-8e1d-82ace47ba632@xs4all.nl>
Date:   Tue, 3 Sep 2019 09:21:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a9bb00f0-7ce8-98d4-92cf-57b140814ef6@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIpyUpalLqKFdZY3KFUJzrVwWBCKrYOEIE6qU7ryF4BncrZdSQ8oN6tR555pvRD4bcL0LBcv+sjQL72YE09K1rl76X8kQvxnAt4LrTzJKMPuX/0AopCz
 9he/41a0sCgJ8MI62aaUsscfKomOPtfO58UHFJxmHD3K089m4XkcqLnNUTwbI18cg12jTWaskJYh7cpcjsCTwy5CLF9DkwFDJnblKbgA9zCkcd4N6eBRRe6Z
 wmCysuBS5lz+/3/bnze6GxgP0TMewWLm2WPZyfL8Gvx2d7ZWdM7sEyfzqjdSzxv7AxSgFXE6VFN1g7hLaLppuWVz88jSSSgk6e5XkugzSwlgo97ycL2wRhLJ
 1LYUSapXo8gTsIVTawuh7INo/1tycpPC3sA+gCG6C0zp6+mwj97skw6E976+415wi9gnMD7P+Vsa4ZgqUSKoTrSKUXvVG3j1lEXXd+cveA7VR5QIlMnyE3g6
 jiPbAtK5z2Fz46pfwqpUYUZRaypODrUAfpXsdItv4IMzOkZ05unrc+OCyuZSKOLTyhh2h03x3b5aQLjNblLBbk2tU8a0n1k6zhLP830EOnDgebgDW5T7noY1
 4qcvZDibsh1iTSG7v3bin0UthmxVO8m7HvuNZf0KAV9glvR1CEBFuHDHFFDUkxSowJ4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

I've decided to hold the meeting during the ELCE and not on Thursday.
Two key people can't be there on Thursday and some travel back Thursday
evening and so would have to leave early.

Looking at the schedule I propose instead to have one meeting on
Tuesday morning concentrating on finalizing the codec support.

On Wednesday we have a second meeting for libcamera (morning) and looking
at future V4L2 developments such as v4l2_ext_buffer/format, Request API and
complex camera pipelines (afternoon).

Laurent, it would make sense if you or one of the other libcamera devs is
'chairing' the libcamera meeting. Do you agree? If so, can you prepare an
agenda for that meeting?

I plan on leaving Thursday afternoon, so we have the option to continue the
talks around that last topic on Thursday morning.

I have no idea where we will hold these meetings since I've no idea
what the conference center looks like and if they have suitable places
for doing something like this. So I'll look around on the Monday and
mail the details of where to meet then.

Confirmed attendees:

Boris Brezillon <boris.brezillon@collabora.com>
Alexandre Courbot <acourbot@chromium.org>
Nicolas Dufresne <nicolas@ndufresne.ca>
Tomasz Figa <tfiga@chromium.org>
Ezequiel Garcia <ezequiel@collabora.com>
Eugen Hristev <Eugen.Hristev@microchip.com>
Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Helen Koike <helen.koike@collabora.com>
Jacopo Mondi <jacopo@jmondi.org>
Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Hans Verkuil <hverkuil@xs4all.nl>

If you are not on this list, but want to join, please let me know.

Since this is really three half-day meetings, each with a different
topic, please let me know which of those half-day meetings you want
to attend.

Regards,

	Hans

On 8/28/19 12:55 PM, Hans Verkuil wrote:
> On 8/16/19 10:06 AM, Hans Verkuil wrote:
>> Rather then discussing topics for a meeting under the subject 'Lisbon'
>> let's start a new thread referring to the right place :-)
>>
>> I will try to organize a room, either during the ELCE or (if that doesn't
>> work) perhaps on the Thursday afterwards. If that's going to be a problem
>> for someone, please let me know.
> 
> I can only get a room for Thursday afternoon (2pm-6pm). I'm inclined to take
> that room, but if a lot of people who want to come, will already have left
> on the Thursday, then there is no point in me reserving this room.
> 
> So if you are unable to attend on Thursday, then please let me know asap!
> 
> If Thursday is no problem, then I wanted to have more informal meetings
> somewhere in the conference center during the morning, and after lunch
> use the room.
> 
> If Thursday is a no-go, then we will just have to find a place inside
> the conference center during the ELCE.
> 
> Regards,
> 
> 	Hans
> 
>>
>> I do need to know how many people I can expect. I have the following
>> confirmed attendees (and please reply if you are not listed!):
>>
>> Alexandre Courbot <acourbot@chromium.org>
>> Tomasz Figa <tfiga@chromium.org>
>> Jacopo Mondi <jacopo@jmondi.org>
>> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Hans Verkuil <hverkuil@xs4all.nl>
>>
>> I know there were more who mentioned on irc that they would attend,
>> but it is easier to keep track if I have it in an email.
>>
>> Topics posted under the previous thread:
>>
>> Tomasz:
>>
>> I would want to discuss various v4l2_buffer improvements, e.g.
>> - DMA-buf import with plane offsets,
>> - unifying the buffer structs for M and non-M formats,
>> - ability to import different FDs with offsets for non-M formats if the
>> layout matches driver expectations, etc.
>>
>> Besides that, I would be interested in the general idea on handling
>> complex cameras in the Linux kernel in spite of the remaining V4L2
>> limitations, e.g.
>> - combinatorial explosion of /dev/video nodes,
>> - significant ioctl overhead,
>> - huge amount of historical legacy making the driver and userspace
>> implementations overly difficult and prone to repetitive mistakes,
>> - the above also limiting the flexibility of the API - formats, frame
>> rates, etc. set using distinct APIs, not covered by Request API, with
>> non-failure "negotiation hell", etc.
>> - lack of fences, etc.
>>
>> Jacopo:
>>
>> Apart from discussing libcamera and hope we could kickstart a review of
>> its API, I would like to re-start discussing multiplexed stream support,
>> but that would require Sakari to be there, something I'm not certain
>> about. Sakari?
>>
>> Alexandre:
>>
>> If Collabora/Bootlin is there, I'd certainly want to discuss stateless
>> codecs, in particular m2m codec helpers and finalize the specification
>> in general.
>>
>> Regards,
>>
>> 	Hans
>>
> 

