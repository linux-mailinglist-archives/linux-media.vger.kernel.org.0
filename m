Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A621720245
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 14:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234687AbjFBMkZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 08:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234530AbjFBMkW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 08:40:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99455180
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 05:40:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3595361D30
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 12:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F34DC433EF;
        Fri,  2 Jun 2023 12:40:14 +0000 (UTC)
Message-ID: <e00c7214-198e-a83b-7544-2b527d0be068@xs4all.nl>
Date:   Fri, 2 Jun 2023 14:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [ANN] Media Summit June 26th: Draft Agenda v3
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Language: en-US
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
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This is version 3 of the agenda for the media summit. As always, it
is subject to change and all times are guesstimates!

The media summit will be held at the Holiday Inn which is close to the
conference centre where the Embedded Open Source Summit is held:

Holiday Inn Prague Congress Centre - Meeting room "E"
Na Pankráci 1684/ 15, 140 00 Praha 4-Nusle
https://www.ihg.com/holidayinn/hotels/us/en/prague/prgnp/hoteldetail

Refreshments (tea/coffee/soda) are available during the day.

The meeting room is sponsored by Collabora and Cisco Systems Norway.
And lunch is sponsored by Ideas On Board.

Many thanks to the sponsors!

In-Person Attendees:

Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
Kieran Bingham <kieran.bingham@ideasonboard.com> (Ideas On Board)
Deborah Brouwer <deborahbrouwer3563@gmail.com>
Mauro Carvalho Chehab <mchehab@kernel.org> (Intel)
Ricardo Ribalda <ribalda@chromium.org> (Google)
Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
Martin Hecht <martin.hecht@avnet.eu> (Avnet)
Jai Luthra <j-luthra@ti.com> (TI)
Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
Andrzej Pietrasiewicz <andrzej.p@collabora.com> (Collabora)
Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
Michael Roeder <michael.roeder@avnet.eu> (Avnet)
Niklas Söderlund <niklas.soderlund@ragnatech.se> (Ragnatech)
Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
Martin Tůma <tumic@gpxsee.org> (GPXSee)
Stanimir Varbanov <stanimir.varbanov@linaro.org> (Linaro, tentative, after 16:30 only)
Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
Alain Volmat <alain.volmat@foss.st.com> (ST Electronics)

Remote Attendees:

Nicolas Dufresne <nicolas@ndufresne.ca> (Collabora, tentative, afternoon only)
Hsia-Jun Li <Randy.Li@synaptics.com> (Synaptics)

I will email details on how to join remotely a few days before the media summit
starts.

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

We have the room until 18:30, but (fingers crossed) I hope to finish before that.

The "Add extended fmt and buffer" and the "Subsystem development process" are
*very* hard to predict. I want to limit the initial discussion of the that first
topic to 45-60 minutes, and continue (if needed) in the afternoon after the discussion
about the subsystem development process. We will have see how it goes.

Please reply with corrections, questions, etc. to this email. I'll update the agenda
over time.

Regards,

	Hans
