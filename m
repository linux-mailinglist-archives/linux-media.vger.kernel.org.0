Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11DF8720394
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 15:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234739AbjFBNlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 09:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234946AbjFBNlJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 09:41:09 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9026B1BB
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 06:41:07 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6af7fef214cso1520390a34.0
        for <linux-media@vger.kernel.org>; Fri, 02 Jun 2023 06:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685713267; x=1688305267;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kb1cWqT71om+MaEYjwVLshlWxYw3BLGzsv+5icWly0M=;
        b=K2SCdZgE9y+IEEs+SH98o6H6xCF0zrWv2dc/VVYjOcJRNd/jPRwGV4OtUdx9csH50R
         OwQ54pfrY8L/FDCHD1H/k2QhJFI0TAhr9dclQB9RJ3nGUu3sKdds8qWbr8YiZ6J6tDWr
         vHdZIUdbvgEHIk2I6eZeg8LKk91CDJVrQIGSAw7cmIUDsiEzy5nhUH0n4zeSjVSZVBYL
         TK8yCS7lHO5nfFHh/7pR2S2cNAE+ec5dErF5WYTPHPowtNdke/5WKIuOp/uVt0xFLWYm
         cCRU5DEJ19S1CgUS9LA7HzhRVdQM5padEd8atWKLThRCQk0YVjWc5GkUgnc8su3H41eN
         qqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685713267; x=1688305267;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kb1cWqT71om+MaEYjwVLshlWxYw3BLGzsv+5icWly0M=;
        b=cNKQPku6X0AxStvdJAHDA0KU0//rDqawdD9HKNA4nE6RhhhJMqAq0vKgAUSaC5Y6WN
         1d19Pfpoq0ikfim44rMK0REuokR3mTTbEbz1p9uuyTy5vIMfU+qExPiaj9V5P1qiMVfB
         q+ccDv6BjNUdGm4+1MRoD6juT0TwGH4ck6utoiE6URzRMwmmxLBi3IP0GG89w2rE7k6a
         BBSvY9WIH3Kq8s7V4LqGSR1ruyEJQjYTj5wOZ1kl1L6uPltFakn9gF5GPelfBjoDpYKJ
         ASykYGscTeS1LXHHh4NQOFkwLhsKHru1/E6cOCjlLnGyyQpMSlMX1Ugn7XAMOACXn4WV
         4lbw==
X-Gm-Message-State: AC+VfDxMWZWtxh9tuPg4ChjiTvGfaV7cTKlrYduA9bSnLVDZIR4Idv3s
        E8S8qK4rBHx3kJ4OYjr4PQk=
X-Google-Smtp-Source: ACHHUZ43O2QOq9HlMr8W+hu3OLQcivz9ILL5WrlCACOIrrdS+g3GbQigqlYAIoiIfKKTKAin759iXg==
X-Received: by 2002:a9d:5908:0:b0:6af:7c91:6ba2 with SMTP id t8-20020a9d5908000000b006af7c916ba2mr1130488oth.4.1685713266735;
        Fri, 02 Jun 2023 06:41:06 -0700 (PDT)
Received: from ?IPv6:2804:14d:72b4:852d:b542:65a2:cbcc:f28b? ([2804:14d:72b4:852d:b542:65a2:cbcc:f28b])
        by smtp.gmail.com with ESMTPSA id d2-20020a9d5e02000000b006abb3b660a9sm585941oti.54.2023.06.02.06.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:41:06 -0700 (PDT)
Message-ID: <fdb70f73bc18991a49d15679a1117f136cd3bc34.camel@gmail.com>
Subject: Re: [ANN] Media Summit June 26th: Draft Agenda v3
From:   dwlsalmeida@gmail.com
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     daniel.almeida@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Martin =?UTF-8?Q?T=C5=AFma?= <martin.tuma@digiteqautomotive.com>,
        Martin Hecht <martin.hecht@avnet.eu>,
        Michael Roeder <michael.roeder@avnet.eu>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hsia-Jun Li <Randy.Li@synaptics.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Date:   Fri, 02 Jun 2023 10:40:58 -0300
In-Reply-To: <e00c7214-198e-a83b-7544-2b527d0be068@xs4all.nl>
References: <e00c7214-198e-a83b-7544-2b527d0be068@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans, I am missing myself as an atendee?

I thought that was implied since I'll be presenting.

-- Daniel


On Fri, 2023-06-02 at 14:40 +0200, Hans Verkuil wrote:
> Hi all,
>=20
> This is version 3 of the agenda for the media summit. As always, it
> is subject to change and all times are guesstimates!
>=20
> The media summit will be held at the Holiday Inn which is close to
> the
> conference centre where the Embedded Open Source Summit is held:
>=20
> Holiday Inn Prague Congress Centre - Meeting room "E"
> Na Pankr=C3=A1ci 1684/ 15, 140 00 Praha 4-Nusle
> https://www.ihg.com/holidayinn/hotels/us/en/prague/prgnp/hoteldetail
>=20
> Refreshments (tea/coffee/soda) are available during the day.
>=20
> The meeting room is sponsored by Collabora and Cisco Systems Norway.
> And lunch is sponsored by Ideas On Board.
>=20
> Many thanks to the sponsors!
>=20
> In-Person Attendees:
>=20
> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
> Kieran Bingham <kieran.bingham@ideasonboard.com> (Ideas On Board)
> Deborah Brouwer <deborahbrouwer3563@gmail.com>
> Mauro Carvalho Chehab <mchehab@kernel.org> (Intel)
> Ricardo Ribalda <ribalda@chromium.org> (Google)
> Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
> Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
> Martin Hecht <martin.hecht@avnet.eu> (Avnet)
> Jai Luthra <j-luthra@ti.com> (TI)
> Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
> Andrzej Pietrasiewicz <andrzej.p@collabora.com> (Collabora)
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
> Michael Roeder <michael.roeder@avnet.eu> (Avnet)
> Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se> (Ragnatech)
> Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
> Martin T=C5=AFma <tumic@gpxsee.org> (GPXSee)
> Stanimir Varbanov <stanimir.varbanov@linaro.org> (Linaro, tentative,
> after 16:30 only)
> Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
> Alain Volmat <alain.volmat@foss.st.com> (ST Electronics)
>=20
> Remote Attendees:
>=20
> Nicolas Dufresne <nicolas@ndufresne.ca> (Collabora, tentative,
> afternoon only)
> Hsia-Jun Li <Randy.Li@synaptics.com> (Synaptics)
>=20
> I will email details on how to join remotely a few days before the
> media summit
> starts.
>=20
> If you are listed as attendee (in person or remote) and you can't
> attend
> after all, please let me know.
>=20
> If you are listed as presenting a topic during the meeting, then
> please
> check if the details are correct. It would be really appreciated if
> you
> can post any slides you have before the meeting (just reply to this
> message
> with the presentation attached).
>=20
> Agenda:
>=20
> 8:45-9:15: get settled :-)
>=20
> 9:15-9:25: Hans: Quick introduction
>=20
> 9:25-10:15: Daniel Almeida: Rust V4L2 support
>=20
> =C2=A0=C2=A0=C2=A0 Discuss the potential blockers as well as the roadmap =
and
> priorities for
> =C2=A0=C2=A0=C2=A0 bindings. Present what is currently supported and what=
 isn't in
> the Rust
> =C2=A0=C2=A0=C2=A0 code for V4L2. Identify potential candidates for new d=
rivers that
> can be
> =C2=A0=C2=A0=C2=A0 written in Rust. Discuss about maintainership issues r=
elated to
> Rust in V4L2.
>=20
> 10:15-10:30: Break
>=20
> 10:30-11:15 Hans & Hsia-Jun Li: "Add extended fmt and buffer" patch
> series
>=20
> =C2=A0=C2=A0=C2=A0
> https://patchwork.linuxtv.org/project/linux-media/cover/20230206043308.28=
365-1-ayaka@soulik.info/
>=20
> =C2=A0=C2=A0=C2=A0 We've been postponing the work on this, but I think we=
 need to
> decide how to
> =C2=A0=C2=A0=C2=A0 proceed since pixel formats and single vs multi planar=
 is getting
> to be a nightmare.
>=20
> =C2=A0=C2=A0=C2=A0 More details from Hsia-Jun Li:
>=20
> =C2=A0=C2=A0=C2=A0 1. v4l2 header would only maintain the codec format an=
d pixel
> format in bus.
> =C2=A0=C2=A0=C2=A0 2. the pixel formats would be maintained by the Direct=
Render,
> those M
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 variant would not be supported in th=
e new extend pixel format
> API.
> =C2=A0=C2=A0=C2=A0 3. The number of plane for a pixel format would also r=
esponds for
> its data
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 layout. Ex. NV12 =3D 2 planes(luma, =
chroma), I420 =3D 3 planes(Y,
> U, V).
> =C2=A0=C2=A0=C2=A0 4. Userspace that supports new extend API could access=
 those
> driver didn't
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adapt the new API, kernel would have=
 a backward compatible
> layer. While
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the opposite backward compatible is =
not offered (old API
> userspace can't
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 access the driver support the new AP=
I).
>=20
> =C2=A0=C2=A0=C2=A0 [optional part]
> =C2=A0=C2=A0=C2=A0 5. An alloc flag would be introduced for allocating th=
ose M
> variant buf.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> https://lore.kernel.org/lkml/20230322105226.122467-1-randy.li@synaptics.c=
om/
> =C2=A0=C2=A0=C2=A0 6. Stateless codec format would be a modifier to the s=
tateful
> codec format.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 We could support different packing m=
ode here.
>=20
> 11:15-11:30: Break
>=20
> 11:30-12:15: Andrzej Pietrasiewicz: Stateless Encoders: VP8
>=20
> =C2=A0=C2=A0=C2=A0 - Introduction to stateless encoders and previous work=
 in this
> area
>=20
> =C2=A0=C2=A0=C2=A0 https://github.com/bootlin/linux/tree/hantro/h264-enco=
ding-v5.11
>=20
> =C2=A0=C2=A0=C2=A0
> https://lore.kernel.org/linux-arm-kernel/20230309125651.23911-1-andrzej.p=
@collabora.com/T/
>=20
> =C2=A0=C2=A0=C2=A0 - High level decisions
> =C2=A0=C2=A0=C2=A0 - Rate control
> =C2=A0=C2=A0=C2=A0 - VP8 uAPI
> =C2=A0=C2=A0=C2=A0 - Challenges
>=20
> 12:15-13:30: Lunch
>=20
> 13:30-14:00: Ricardo Ribalda Delgado: KCAM update
>=20
> =C2=A0=C2=A0=C2=A0 I would like to share the progress on KCAM from our en=
d.
>=20
> =C2=A0=C2=A0=C2=A0 I am also trying to collect all the requirements that =
we are
> getting
> =C2=A0=C2=A0=C2=A0 from vendors regarding V4L2.
>=20
> 14:00-14:45: Sakari: generic line-based metadata formats:
>=20
> =C2=A0=C2=A0=C2=A0
> https://lore.kernel.org/linux-media/20230505215257.60704-1-sakari.ailus@l=
inux.intel.com/T/#t
>=20
> 14:45-??:??: Mauro & sub-maintainers: Subsystem development process
>=20
> =C2=A0=C2=A0=C2=A0 How to improve it? How do we get more maintainers? It'=
s not
> working very
> =C2=A0=C2=A0=C2=A0 well at the moment.
>=20
> =C2=A0=C2=A0=C2=A0 Mauro will present how the media CI works today.
> =C2=A0=C2=A0=C2=A0 Hans will present how the daily build scripts work.
>=20
> =C2=A0=C2=A0=C2=A0 Can this be harmonized?
>=20
> Final short topic: Hans: Should we keep the media summit together
> with the ELCE conference?
> =C2=A0=C2=A0=C2=A0 Or organize it separately, and ask a company like Cisc=
o, Intel or
> Collabora
> =C2=A0=C2=A0=C2=A0 to organize a room. What would work best? Anything to =
improve on
> this?
>=20
> We have the room until 18:30, but (fingers crossed) I hope to finish
> before that.
>=20
> The "Add extended fmt and buffer" and the "Subsystem development
> process" are
> *very* hard to predict. I want to limit the initial discussion of the
> that first
> topic to 45-60 minutes, and continue (if needed) in the afternoon
> after the discussion
> about the subsystem development process. We will have see how it
> goes.
>=20
> Please reply with corrections, questions, etc. to this email. I'll
> update the agenda
> over time.
>=20
> Regards,
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Hans

