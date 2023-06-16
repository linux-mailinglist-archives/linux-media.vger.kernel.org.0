Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8A273286C
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 09:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244499AbjFPHJN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 03:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244490AbjFPHIr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 03:08:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 532383C15
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 00:07:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B61B0624FE
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 07:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C0BC433C0;
        Fri, 16 Jun 2023 07:07:48 +0000 (UTC)
Message-ID: <1c1557b1-dcdd-7919-43c5-8bd342781152@xs4all.nl>
Date:   Fri, 16 Jun 2023 09:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [ANN] Media Summit June 26th: Agenda v5
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Martin_T=c5=afma?= <martin.tuma@digiteqautomotive.com>,
        Martin Hecht <martin.hecht@avnet.eu>,
        Michael Roeder <michael.roeder@avnet.eu>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hsia-Jun Li <Randy.Li@synaptics.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
        Umang Jain <umang.jain@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This is version 5 of the agenda for the media summit. Changes since v4:
- updates to the attendees list.
- updated the final topic.

I expect to post the final version Friday next week.

As always, the agenda is subject to change and all times are guesstimates!

The media summit will be held on Monday June 26th at the Holiday Inn which
is close to the conference centre where the Embedded Open Source Summit is held:

Holiday Inn Prague Congress Centre - Meeting room "E"
Na Pankráci 1684/ 15, 140 00 Praha 4-Nusle
https://www.ihg.com/holidayinn/hotels/us/en/prague/prgnp/hoteldetail

Refreshments (tea/coffee/soda) are available during the day.

The meeting room is sponsored by Collabora and Cisco Systems Norway.
And lunch is sponsored by Ideas On Board.

Many thanks to the sponsors!

Regarding the face mask policy: we will follow the same guidance that the
Linux Foundation gives for the EOSS conference:

https://events.linuxfoundation.org/embedded-open-source-summit/attend/health-and-safety/

So: "Masks are recommended, but not required, to be worn at the event."

In-Person Attendees:

Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
Deborah Brouwer <deborahbrouwer3563@gmail.com>
Mauro Carvalho Chehab <mchehab@kernel.org> (Media Kernel Maintainer)
Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
Martin Hecht <martin.hecht@avnet.eu> (Avnet)
Jai Luthra <j-luthra@ti.com> (TI)
Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
Andrzej Pietrasiewicz <andrzej.p@collabora.com> (Collabora)
Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
Ricardo Ribalda <ribalda@chromium.org> (Google)
Michael Roeder <michael.roeder@avnet.eu> (Avnet)
Niklas Söderlund <niklas.soderlund@ragnatech.se> (Ragnatech)
Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
Chen-Yu Tsai <wens@kernel.org>
Martin Tůma <tumic@gpxsee.org> (GPXSee)
Stanimir Varbanov <stanimir.varbanov@linaro.org> (Linaro, tentative, after 16:30 only)
Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> (Ideas On Board)
Arthur Vinchon <arthur.vinchon@allegrodvt.com> (AllegroDVT)
Alain Volmat <alain.volmat@foss.st.com> (ST Electronics)

Remote Attendees:

Kieran Bingham <kieran.bingham@ideasonboard.com> (Ideas On Board)
Nicolas Dufresne <nicolas@ndufresne.ca> (Collabora, tentative, afternoon only)
Umang Jain <umang.jain@ideasonboard.com> (Ideas On Board)
Hsia-Jun Li <Randy.Li@synaptics.com> (Synaptics)
Benjamin Mugnier <benjamin.mugnier@foss.st.com> (ST Electronics)

I will email details on how to join remotely on Thursday. If you did NOT receive
an email, then let me know on Friday.

Disclaimer: I have no idea how good the remote experience will be, it will
depend on how the room is set up and the wifi quality. It worked reasonably
well in Dublin, so fingers crossed. It will be a Webex conference. If you
plan to speak as well, then I strongly recommend that you use a good webcam
since the typical laptop microphone is horrible.

If you are listed as attendee (in person or remote) and you can't attend
after all, please let me know.

If you are listed as presenting a topic during the meeting, then please
check if the details are correct. It would be really appreciated if you
can post any slides you have before the meeting (just reply to this message
with the presentation attached).

Agenda:

8:45-9:15: get settled :-)

9:15-9:25: Hans: Quick introduction

9:25-10:15: Daniel Almeida: Rust V4L2 support

    Discuss the potential blockers as well as the roadmap and priorities for
    bindings. Present what is currently supported and what isn't in the Rust
    code for V4L2. Identify potential candidates for new drivers that can be
    written in Rust. Discuss about maintainership issues related to Rust in V4L2.

10:15-10:30: Break

10:30-11:15 Hans & Hsia-Jun Li: "Add extended fmt and buffer" patch series

    https://patchwork.linuxtv.org/project/linux-media/cover/20230206043308.28365-1-ayaka@soulik.info/

    We've been postponing the work on this, but I think we need to decide how to
    proceed since pixel formats and single vs multi planar is getting to be a nightmare.

    More details from Hsia-Jun Li:

    1. v4l2 header would only maintain the codec format and pixel format in bus.
    2. the pixel formats would be maintained by the DirectRender, those M
       variant would not be supported in the new extend pixel format API.
    3. The number of plane for a pixel format would also responds for its data
       layout. Ex. NV12 = 2 planes(luma, chroma), I420 = 3 planes(Y, U, V).
    4. Userspace that supports new extend API could access those driver didn't
       adapt the new API, kernel would have a backward compatible layer. While
       the opposite backward compatible is not offered (old API userspace can't
       access the driver support the new API).

    [optional part]
    5. An alloc flag would be introduced for allocating those M variant buf.
       https://lore.kernel.org/lkml/20230322105226.122467-1-randy.li@synaptics.com/
    6. Stateless codec format would be a modifier to the stateful codec format.
       We could support different packing mode here.

11:15-11:30: Break

11:30-12:15: Andrzej Pietrasiewicz: Stateless Encoders: VP8

    - Introduction to stateless encoders and previous work in this area

    https://github.com/bootlin/linux/tree/hantro/h264-encoding-v5.11

    https://lore.kernel.org/linux-arm-kernel/20230309125651.23911-1-andrzej.p@collabora.com/T/

    - High level decisions
    - Rate control
    - VP8 uAPI
    - Challenges

12:15-13:30: Lunch

13:30-14:00: Ricardo Ribalda Delgado: KCAM update

    I would like to share the progress on KCAM from our end.

    I am also trying to collect all the requirements that we are getting
    from vendors regarding V4L2.

14:00-14:45: Sakari: generic line-based metadata formats:

    https://lore.kernel.org/linux-media/20230505215257.60704-1-sakari.ailus@linux.intel.com/T/#t

14:45-??:??: Mauro & sub-maintainers: Subsystem development process

    How to improve it? How do we get more maintainers? It's not working very
    well at the moment.

    Mauro will present how the media CI works today.
    Hans will present how the daily build scripts work.

    Can this be harmonized?

Final short topic: Hans: Should we keep the media summit together with the ELCE conference?
    Or organize it separately, and ask a company like Cisco, Intel or Collabora
    to organize a room. What would work best? Anything to improve on this?
    We are currently limiting the number of attendees to allow for - hopefully - more
    focused discussions. Should we continue with that or open it up to more people?
    If we keep it limited, what criteria should be used?


We have the room until 18:30, but (fingers crossed) I hope to finish before that.

The "Add extended fmt and buffer" and the "Subsystem development process" are
*very* hard to predict. I want to limit the initial discussion of the that first
topic to 45-60 minutes, and continue (if needed) in the afternoon after the discussion
about the subsystem development process. We will have see how it goes.

Please reply with corrections, questions, etc. to this email. I'll update the agenda
over time.

Regards,

	Hans
