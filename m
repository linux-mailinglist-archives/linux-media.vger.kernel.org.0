Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8351BB769
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2019 17:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731503AbfIWPAk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Sep 2019 11:00:40 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:54059 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731437AbfIWPAk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Sep 2019 11:00:40 -0400
X-Originating-IP: 37.176.15.222
Received: from uno.localdomain (mob-37-176-15-222.net.vodafone.it [37.176.15.222])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 52ED2C0007;
        Mon, 23 Sep 2019 15:00:34 +0000 (UTC)
Date:   Mon, 23 Sep 2019 17:02:13 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniel Gomez <daniel@qtec.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Helen Koike <helen.koike@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [ANN] Media sessions in Lyon in October: codecs
Message-ID: <20190923150213.2ub26ys4mhpp2hm5@uno.localdomain>
References: <b3b2c3a6-43d6-ffbd-f94c-e6f92cad8a97@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7dlf2k42yngoybvr"
Content-Disposition: inline
In-Reply-To: <b3b2c3a6-43d6-ffbd-f94c-e6f92cad8a97@xs4all.nl>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--7dlf2k42yngoybvr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Hans,

On Mon, Sep 23, 2019 at 04:12:55PM +0200, Hans Verkuil wrote:
> Hi all,
>
> Since we have three separate half-day sessions for different topics I decided
> to split the announcement for this in three emails as well, so these things
> can be discussed in separate threads.
>
> All sessions are in room Terreaux VIP Lounge - Level 0.
> There is a maximum of 15 people.
>
> The first session deals with the codec API and is on Tuesday morning from
> 8:30 (tentative, might change) to 12:00 (we have to vacate the room at that
> time).
>
> Confirmed attendees for this session:
>
> Boris Brezillon <boris.brezillon@collabora.com>
> Alexandre Courbot <acourbot@chromium.org>
> Nicolas Dufresne <nicolas@ndufresne.ca>
> Tomasz Figa <tfiga@chromium.org>
> Ezequiel Garcia <ezequiel@collabora.com>
> Daniel Gomez <daniel@qtec.com>
> Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Eugen Hristev <Eugen.Hristev@microchip.com>
> Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Helen Koike <helen.koike@collabora.com>
> Michael Tretter <m.tretter@pengutronix.de>
> Hans Verkuil <hverkuil@xs4all.nl>
>
> Tentative:
>
> Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Jacopo Mondi <jacopo@jmondi.org>
>
> Jacopo, please confirm if you want to attend this session. I didn't find
> an email with explicit confirmation, so it was probably done via irc. But since
> this session is getting close to capacity I would prefer to keep attendance to
> those are actually working with codecs (or will work with it in the near future).

I'm not really working on codecs, so if you're running almost at full
capacity please feel free to re-assign my seat.

If there are free seats I might flock in, but without contributing too
much to the discussions :)

Thanks
   j

>
> If I missed someone, or you are on the list but won't attend after all, then
> please let me know.
>
>
>
> Agenda:
>
> - Status of any pending patches related to codec support.
>
> - Requirements of moving codec drivers out of staging.
>
> - Finalize the stateful encoder API. There are two pieces that need
>   to be defined:
>
> 1) Setting the frame rate so bitrate control can make sense, since
>    they need to know this information. This is also relevant for the
>    stateless codec (and this may have to change on a per-frame basis
>    for stateless codecs!).
>
>    This can either be implemented via ENUM_FRAMEINTERVALS for the coded
>    pixelformats and S_PARM support, or we just add a new control for this.
>    E.g. V4L2_CID_MPEG_VIDEO_FRAME_INTERVAL (or perhaps FRAME_RATE). If we
>    go for a control, then we need to consider the unit. We can use a
>    fraction as well. See this series that puts in the foundation for that:
>    https://patchwork.linuxtv.org/cover/58857/
>
>    I am inclined to go with a control, since the semantics don't really
>    match ENUM_FRAMEINTERVALS/S_PARM. These ioctls still need to be supported
>    for legacy drivers. Open question: some drivers (mediatek, hva, coda)
>    require S_PARM(OUTPUT), some (venus) allow both S_PARM(CAPTURE) and
>    S_PARM(OUTPUT). I am inclined to allow both since this is not a CAPTURE
>    vs OUTPUT thing, it is global to both queues.
>
> 2) Interactions between OUTPUT and CAPTURE formats.
>
>    The main problem is what to do if the capture sizeimage is too small
>    for the OUTPUT resolution when streaming starts.
>
>    Proposal: width and height of S_FMT(OUTPUT) are used to
>    calculate a minimum sizeimage (app may request more). This is
>    driver-specific. (Is it? Or is this codec-specific?)
>
>    V4L2_FMT_FLAG_FIXED_RESOLUTION is always set for codec formats
>    for the encoder (i.e. we don't support mid-stream resolution
>    changes for now) and V4L2_EVENT_SOURCE_CHANGE is not
>    supported. See https://patchwork.linuxtv.org/patch/56478/ for
>    the patch adding this flag.
>
>    Of course, if we start to support mid-stream resolution
>    changes (or other changes that require a source change event),
>    then this flag should be dropped by the encoder driver and
>    documentation on how to handle the source change event should
>    be documented in the encoder spec. I prefer to postpone this
>    until we have an encoder than can actually do mid-stream
>    resolution changes.
>
>    If sizeimage of the OUTPUT is too small for the CAPTURE
>    resolution and V4L2_EVENT_SOURCE_CHANGE is not supported,
>    then the second STREAMON (either CAPTURE or OUTPUT) will
>    return -ENOMEM since there is not enough memory to do the
>    encode.
>
>    If V4L2_FMT_FLAG_FIXED_RESOLUTION is set (i.e. that should
>    be the case for all current encoders), then any bitrate controls
>    will be limited in range to what the current state (CAPTURE and
>    OUTPUT formats and frame rate) supports.
>
> - Stateless encoders?
>
> - Anything else? (I have a feeling I missed a codec-related topic, but
>   I can't find it in my mailbox)
>
> Regards,
>
> 	Hans

--7dlf2k42yngoybvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2I3nUACgkQcjQGjxah
VjwrzQ//dNjV00Pcn905EM9/D6HCiyQSnUvOzEMY2+HcuuVaXyE8RSsFkBAHjKHf
2hq5oE4MAcsLbVMKnIyRifefq9RucKnostQi0iH6UUz9uhkwTWtGH2ycWMwtshn5
qwYMdZZRCtWyUXi0Qb1yT2mwSdAN45domlR2QZC060S0gorYwj9WeqfsOpxNvde/
8Pk7ZJEr0QfT2URPQVTxqND0PQrsYfQQ/D5zI1YsKifzQXTvTdAGNOR8uYhIu1Mz
vkzoPaCxIb/gsUxCIic3pP0+3EqxPO2XAIbaCwZ0ECZj8vOL0oPzhoTtCFsXSvId
7jM2roxBLFG2iv1Ek/HoKuzhDpi1FJnOHiHkAVO70of9SMUaYA6tIUR6nCxSfcd0
SMMNpSH7evIQ0zcpqXbmZJabUblNQeYk+rP6VyiaxPZ6IQQ6RIsm6wEhRL3bai9f
oWKKVoQPjfdLkWoePOT/6rge2y4cL3hNZSJ1XaoOuH2MNT2L1YOylsqoNkFTt+dA
K5zOmw0qgFt4VpyfFA0LVc9HyGP0pWeb9HtPD727LM6Bg79PfWhC2fZKoJ0LXvfZ
bPY/sphgkXvlys5FYqpC9bxrted3VvyW6V3WrjZu4YsegiZQlJvpucxtAMFTJatU
YuL6oURPsJK+9k2WxMEiA1oB9oR8tMffCxS8uyBL0Od94+sTrLw=
=ramq
-----END PGP SIGNATURE-----

--7dlf2k42yngoybvr--
