Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2A772A9EF
	for <lists+linux-media@lfdr.de>; Sat, 10 Jun 2023 09:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjFJHdO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Jun 2023 03:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbjFJHdM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Jun 2023 03:33:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78DBB3A8C
        for <linux-media@vger.kernel.org>; Sat, 10 Jun 2023 00:33:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0DF2461135
        for <linux-media@vger.kernel.org>; Sat, 10 Jun 2023 07:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B34C433EF
        for <linux-media@vger.kernel.org>; Sat, 10 Jun 2023 07:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686382389;
        bh=lo/O3ZF7BFRAvx0BxzR2Ue/MzUPDJRV/giRVrufC5HA=;
        h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
        b=DPp1EyZvQzIzXBiVRF1pFCXItdI50Syt5wpIli8TsE4FpQnS1jwwqliYeM2XHvobA
         Fn+8ExGNqiwW05H41A4D0PA5jZ2y01aTsodpeoDNVPbV0UV//GzP10rolM5VT+BEcy
         uCiG9kVAP1llXhZs4zqGX5pPS4ZtY9u+pzJq9A4ONYISCFsI3rxO7z9VcWRh6dQzFs
         MWhp+zGxwEsfpjVbrqouMGxyzHTnAkS6yn+Wh3VHZ5kCF41xf+NzEJWogcQ2ldqHAY
         olvzIszLm5rVTT/1OTFNFwsx1fKNMlBVTLMu7QJOrecF5AyhxIfzGc3z3/16D6ViRo
         oZfUHGlf85rpA==
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f7e7fc9fe6so24906175e9.3
        for <linux-media@vger.kernel.org>; Sat, 10 Jun 2023 00:33:09 -0700 (PDT)
X-Gm-Message-State: AC+VfDzmQXh1IUxPQrMRVSbWld7+EC8H3TxmYjZW5G3S5oFd6x7bUdgR
        KMKMzAacaFdXKhwNf5RVXKLOJreS4jKjzAWtfaM=
X-Google-Smtp-Source: ACHHUZ5rmp8E8/cvI2d/5LjOfsrThhKJzptobSZROZOx7YhMjES26a0Vj4WcgWug2/PGVWcoA/e0OL6887mFnYPcjoc=
X-Received: by 2002:a7b:ce07:0:b0:3f7:f584:5791 with SMTP id
 m7-20020a7bce07000000b003f7f5845791mr2948850wmc.35.1686382387573; Sat, 10 Jun
 2023 00:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <4ca781b7-1bdd-d71b-ea48-715346672e48@xs4all.nl>
In-Reply-To: <4ca781b7-1bdd-d71b-ea48-715346672e48@xs4all.nl>
Reply-To: wens@kernel.org
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Sat, 10 Jun 2023 15:33:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v673n60PnwNAJeJyvqK1hWNVTRaKLtzU8EfvVbCAO230cw@mail.gmail.com>
Message-ID: <CAGb2v673n60PnwNAJeJyvqK1hWNVTRaKLtzU8EfvVbCAO230cw@mail.gmail.com>
Subject: Re: [ANN] Media Summit June 26th: Draft Agenda v4
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Jun 9, 2023 at 9:08=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> wr=
ote:
>
> Hi all,
>
> This is version 4 of the agenda for the media summit. Changes since v3:
> - add the fact mask policy
> - updates to the attendees list.
>
> As always, the agenda is subject to change and all times are guesstimates=
!
>
> The media summit will be held on Monday June 26th at the Holiday Inn whic=
h
> is close to the conference centre where the Embedded Open Source Summit i=
s held:
>
> Holiday Inn Prague Congress Centre - Meeting room "E"
> Na Pankr=C3=A1ci 1684/ 15, 140 00 Praha 4-Nusle
> https://www.ihg.com/holidayinn/hotels/us/en/prague/prgnp/hoteldetail
>
> Refreshments (tea/coffee/soda) are available during the day.
>
> The meeting room is sponsored by Collabora and Cisco Systems Norway.
> And lunch is sponsored by Ideas On Board.
>
> Many thanks to the sponsors!
>
> Regarding the face mask policy: we will follow the same guidance that the
> Linux Foundation gives for the EOSS conference:
>
> https://events.linuxfoundation.org/embedded-open-source-summit/attend/hea=
lth-and-safety/
>
> So: "Masks are recommended, but not required, to be worn at the event."
>
> In-Person Attendees:
>
> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
> Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
> Deborah Brouwer <deborahbrouwer3563@gmail.com>
> Mauro Carvalho Chehab <mchehab@kernel.org> (Media Kernel Maintainer)
> Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
> Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
> Martin Hecht <martin.hecht@avnet.eu> (Avnet)
> Jai Luthra <j-luthra@ti.com> (TI)
> Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
> Andrzej Pietrasiewicz <andrzej.p@collabora.com> (Collabora)
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
> Ricardo Ribalda <ribalda@chromium.org> (Google)
> Michael Roeder <michael.roeder@avnet.eu> (Avnet)
> Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se> (Ragnatech)
> Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
> Martin T=C5=AFma <tumic@gpxsee.org> (GPXSee)
> Stanimir Varbanov <stanimir.varbanov@linaro.org> (Linaro, tentative, afte=
r 16:30 only)
> Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> (Ideas On Board)
> Arthur Vinchon <arthur.vinchon@allegrodvt.com> (AllegroDVT)
> Alain Volmat <alain.volmat@foss.st.com> (ST Electronics)

I'm still not on the list?

ChenYu

> Remote Attendees:
>
> Kieran Bingham <kieran.bingham@ideasonboard.com> (Ideas On Board)
> Nicolas Dufresne <nicolas@ndufresne.ca> (Collabora, tentative, afternoon =
only)
> Umang Jain <umang.jain@ideasonboard.com> (Ideas On Board)
> Hsia-Jun Li <Randy.Li@synaptics.com> (Synaptics)
> Benjamin Mugnier <benjamin.mugnier@foss.st.com> (ST Electronics)
>
> I will email details on how to join remotely a few days before the media =
summit
> starts.
>
> Disclaimer: I have no idea how good the remote experience will be, it wil=
l
> depend on how the room is set up and the wifi quality. It worked reasonab=
ly
> well in Dublin, so fingers crossed. It will be a Webex conference. If you
> plan to speak as well, then I strongly recommend that you use a good webc=
am
> since the typical laptop microphone is horrible.
>
> If you are listed as attendee (in person or remote) and you can't attend
> after all, please let me know.
>
> If you are listed as presenting a topic during the meeting, then please
> check if the details are correct. It would be really appreciated if you
> can post any slides you have before the meeting (just reply to this messa=
ge
> with the presentation attached).
>
> Agenda:
>
> 8:45-9:15: get settled :-)
>
> 9:15-9:25: Hans: Quick introduction
>
> 9:25-10:15: Daniel Almeida: Rust V4L2 support
>
>     Discuss the potential blockers as well as the roadmap and priorities =
for
>     bindings. Present what is currently supported and what isn't in the R=
ust
>     code for V4L2. Identify potential candidates for new drivers that can=
 be
>     written in Rust. Discuss about maintainership issues related to Rust =
in V4L2.
>
> 10:15-10:30: Break
>
> 10:30-11:15 Hans & Hsia-Jun Li: "Add extended fmt and buffer" patch serie=
s
>
>     https://patchwork.linuxtv.org/project/linux-media/cover/2023020604330=
8.28365-1-ayaka@soulik.info/
>
>     We've been postponing the work on this, but I think we need to decide=
 how to
>     proceed since pixel formats and single vs multi planar is getting to =
be a nightmare.
>
>     More details from Hsia-Jun Li:
>
>     1. v4l2 header would only maintain the codec format and pixel format =
in bus.
>     2. the pixel formats would be maintained by the DirectRender, those M
>        variant would not be supported in the new extend pixel format API.
>     3. The number of plane for a pixel format would also responds for its=
 data
>        layout. Ex. NV12 =3D 2 planes(luma, chroma), I420 =3D 3 planes(Y, =
U, V).
>     4. Userspace that supports new extend API could access those driver d=
idn't
>        adapt the new API, kernel would have a backward compatible layer. =
While
>        the opposite backward compatible is not offered (old API userspace=
 can't
>        access the driver support the new API).
>
>     [optional part]
>     5. An alloc flag would be introduced for allocating those M variant b=
uf.
>        https://lore.kernel.org/lkml/20230322105226.122467-1-randy.li@syna=
ptics.com/
>     6. Stateless codec format would be a modifier to the stateful codec f=
ormat.
>        We could support different packing mode here.
>
> 11:15-11:30: Break
>
> 11:30-12:15: Andrzej Pietrasiewicz: Stateless Encoders: VP8
>
>     - Introduction to stateless encoders and previous work in this area
>
>     https://github.com/bootlin/linux/tree/hantro/h264-encoding-v5.11
>
>     https://lore.kernel.org/linux-arm-kernel/20230309125651.23911-1-andrz=
ej.p@collabora.com/T/
>
>     - High level decisions
>     - Rate control
>     - VP8 uAPI
>     - Challenges
>
> 12:15-13:30: Lunch
>
> 13:30-14:00: Ricardo Ribalda Delgado: KCAM update
>
>     I would like to share the progress on KCAM from our end.
>
>     I am also trying to collect all the requirements that we are getting
>     from vendors regarding V4L2.
>
> 14:00-14:45: Sakari: generic line-based metadata formats:
>
>     https://lore.kernel.org/linux-media/20230505215257.60704-1-sakari.ail=
us@linux.intel.com/T/#t
>
> 14:45-??:??: Mauro & sub-maintainers: Subsystem development process
>
>     How to improve it? How do we get more maintainers? It's not working v=
ery
>     well at the moment.
>
>     Mauro will present how the media CI works today.
>     Hans will present how the daily build scripts work.
>
>     Can this be harmonized?
>
> Final short topic: Hans: Should we keep the media summit together with th=
e ELCE conference?
>     Or organize it separately, and ask a company like Cisco, Intel or Col=
labora
>     to organize a room. What would work best? Anything to improve on this=
?
>
> We have the room until 18:30, but (fingers crossed) I hope to finish befo=
re that.
>
> The "Add extended fmt and buffer" and the "Subsystem development process"=
 are
> *very* hard to predict. I want to limit the initial discussion of the tha=
t first
> topic to 45-60 minutes, and continue (if needed) in the afternoon after t=
he discussion
> about the subsystem development process. We will have see how it goes.
>
> Please reply with corrections, questions, etc. to this email. I'll update=
 the agenda
> over time.
>
> Regards,
>
>         Hans
