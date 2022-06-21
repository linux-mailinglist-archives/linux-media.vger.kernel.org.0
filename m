Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFAE35534C4
	for <lists+linux-media@lfdr.de>; Tue, 21 Jun 2022 16:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351855AbiFUOof (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jun 2022 10:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351844AbiFUOoe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jun 2022 10:44:34 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E23DE1CB02
        for <linux-media@vger.kernel.org>; Tue, 21 Jun 2022 07:44:32 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id q4so8558917qvq.8
        for <linux-media@vger.kernel.org>; Tue, 21 Jun 2022 07:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=UjVnf+9L7ZC1WLXqq85gCxdmWfMAHHI4/tuT2zIFjbg=;
        b=hTosMnsYfB/KMIWaoOr0Qoc70DK9OmDeFVXrjKGJRmGkpYdNkyQ13BJ8DjhdIOVUAr
         7Fm2jAy9UdQYGDR3KBQPztNFt4beLoxlXPy55l3S19aDoNKWZGY2VXQrQiAR2gXHQbqn
         lPEIEzTuQlYSlOvjuLogY3Prv8nzjp+XtAgmrKMvd2L6blRgg09pKHV4Rw8GVHY0zRUA
         eKFaM8C2PEncf5K207+AJlASQaLY3coOMQWi+W0PvYM7lTh4Cbkk5qrHAoXikJTMXMFu
         heMMjDYlJucj6N2Gt23ZkP4bgvF1CUneZf2WpaKD+EfXvPvx5ByYxmxfnTxy+hPw2ikk
         6v8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=UjVnf+9L7ZC1WLXqq85gCxdmWfMAHHI4/tuT2zIFjbg=;
        b=I1RMK+Js9TrQKQ3FbOjuDnBvGlH1x4h9aVQ45B7njw5Tqy7NiYWRwyAwiVWnVg0QCE
         52+tewMbOncRd4ZGt/QZzuWtEbq0EMQ9t2hiht6P1+46Hsal96+ZKTgxvF2rijS7nMvB
         NnSf/Vk0YZx+xgrWT/Y+2iRke5R+0WLdTZr4AEOTpqr/otiYaK4w+hmDIwdEnee+I5zU
         1OhEVQ7UPdEMxpZlCkp49OrKhVv31m6NLSMp6lEQk1xE2/xJ/BAqgKPaSymBEp781czB
         Ur2wVL6TLlgKLRmUQOdiKOCRsQjCllepvAUFKkOvEOiRGU4w0iN7zmRctqjeBKbbUFZT
         ZMxw==
X-Gm-Message-State: AJIora9B+O8dXXD6B3N4rKpEL4sTLT15de7G2EWaQFrbKwJGgD4oeVmY
        DZvqh5ixAvJ7wC1nGJiCXOr+Lg==
X-Google-Smtp-Source: AGRyM1uuiep9kSnI+2x3DKsy14BVrRGzdFdJNl2BFfSWIJ9LXRGbqS0glKXWf6n4g4jO31eE39T6nw==
X-Received: by 2002:a05:622a:1b09:b0:305:2a33:38bd with SMTP id bb9-20020a05622a1b0900b003052a3338bdmr24109023qtb.346.1655822671988;
        Tue, 21 Jun 2022 07:44:31 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id s12-20020a05620a0bcc00b006a68fdc2d18sm13702813qki.130.2022.06.21.07.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 07:44:31 -0700 (PDT)
Message-ID: <72fb06db282db1377b3d7ac1adf3987b26ac30c8.camel@ndufresne.ca>
Subject: Re: [PATCH 0/3] Enable JPEG Encoder on RK3566/RK3568
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Michael Riesch <michael.riesch@wolfvision.net>,
        Liang Chen <cl@rock-chips.com>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Kever Yang <kever.yang@rock-chips.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Date:   Tue, 21 Jun 2022 10:44:29 -0400
In-Reply-To: <20220620134039.GG21590@pengutronix.de>
References: <20220427224438.335327-1-frattaroli.nicolas@gmail.com>
         <198ce3981ad15844627581f9519cab67ed2a81c1.camel@ndufresne.ca>
         <2438841.KJ31GcehEG@archbook> <20220429232047.GG7671@pengutronix.de>
         <0414bb0816eef95961fe47de96f97f925d29228f.camel@ndufresne.ca>
         <20220620134039.GG21590@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 20 juin 2022 =C3=A0 15:40 +0200, Michael Grzeschik a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
> Hi Andrzej,
>=20
> On Mon, May 02, 2022 at 08:20:50AM -0400, Nicolas Dufresne wrote:
> > Le samedi 30 avril 2022 =C3=A0 01:20 +0200, Michael Grzeschik a =C3=A9c=
rit=C2=A0:
> > > Since the RK3568 seems to get more and more of attention at the momen=
t
> > > I would like to ask if somebody is planning to write support the RKVE=
NC
> > > in mainline. That is the VEPU540 core refered to in the RK3568 TRM.
> > >=20
> > > I would start with that in the next weeks, taking the bootlin H1 supp=
ort
> > > as an reference to handle the request_api for the encoder part. Which=
 is
> > > currently completely untouched in mainline AFAIK.
> >=20
> > I'm very happy to ear you'd be interest in helping with this. I'm addin=
g Andrzej
> > in CC, as he started some base work using VP8 encoder on RK3399 (same H=
W found
> > on other RK SoC) to make this possible. Note that these are a new type =
of
> > encoders and a specification is needed to ensure they all have a cohere=
nt work-
> > flow. The first step was obviously to have working prototype, Bootlin s=
tarted
> > with H264 (but never posted anything on the mailing list). I'm under th=
e
> > impression they have abandoned it. Andrzej have decided to use VP8 as i=
t is
> > simpler. The prototype should help understand the basic flow of an enco=
der and
> > produce a specification for this.
>=20
> I just have tested the bootlin v4l2-h264-encoder stack on the rk3399
> with v5.19-rc2. It is working as expected.
>=20
> Since there have been some rumours about using the VEPU121 core on the
> rk3568, which could have h264 support as well. I have tested this
> stack on that core as well.
>=20
> The findings are; It is producing some data, but the stream created
> is not possible to be decoded. Tested with vlc and gstreamer.

Oh well, I'd say unless vendor document it, we'll not going to just enable =
it
there. There is another (and faster) encoder there with an vendor but fully=
 Open
Source stack anyway. Thanks for the extra step here.

>=20
> Be it due to misconfiguration or the core is really not h264 capable.
>=20
> Find the latest code here:
>=20
> https://git.pengutronix.de/cgit/mgr/linux/log/?h=3Dv5.19/topic/rk3568-vep=
u-h264-stateless-bootlin
>=20
> > From there, the "easy" part is to make per codec controls, to configure=
 the
> > encoder. Demonstrating fixed QP, this is about were I believe Bootlin s=
topped.
>=20
> I have seen that the userspace tool is filling in some initial values
> in the PPS and SPS headers, which are not adjustable. I bet you refer to =
that.
>=20
> > And I personally believe some OSS userland (not just tests) that can ha=
ndle
> > multiple reference, perhaps more advance GOP pattern and some basic rat=
e control
> > would help build confidence in the uAPI.
>=20
> I found the following CTRL Types being defined in the bootlin stack
> for the request API.
>=20
> V4L2_CID_STATELESS_H264_ENCODE_PARAMS
> V4L2_CID_STATELESS_H264_ENCODE_RC
> V4L2_CID_STATELESS_H264_ENCODE_FEEDBACK
>=20
> The FEEDBACK CID is the information we gain after one frame was
> encoded. With this data the RC (Rate Control) parameter is prepared for
> the next frame.
>=20
> You mean to have some user interface to make the rate control user
> configurable?

RC feedback controls are going to all be vendor specific. This one cannot b=
e
called with a generic name like "ENCODE_FEEDBACK" since it is not generic. =
In
fact, news Hantro chip don't have this feedback, they have something else b=
ut it
is not used by the vendor software (not open source, but you can find leaks=
 I
suppose). They only use the size of the compressed frames, and do RC in sof=
tware
there.

In addition to that, with the current trend, "feedback" controls would have=
 to
use RO Request, so that one can still queue multiple encode and be able to =
match
the feedback to a specific request/frame.

>=20
> > Let us know how we can help, we should >void doing the same thing, as
> > this is already quite a large project that can easily take over a year
> > to become mainline ready.
>=20
> It would probably help to share some codebase. If you already have
> something for that rkvenc codec, be it VP8 support. It would probably
> make sense for me to build up on that. Or to discuss common code
> patterns on structures.

We are doing the exercise with VP8 using the original Hantro G1 design, as =
fond
on IMX8MQ and RK3288. Though we only test on NXP boards at the moment.

Andrzej is on vacation this week, I'll check with him why hist draft isn't
accessible to the public. Meanwhile, the userland / GStreamer part is draft=
ed
(careful its a draft) here:

https://gitlab.freedesktop.org/benjamin.gaignard1/gstreamer/-/tree/WIP_V4L2=
_VP8_STATELESS_ENCODER

Currently we are still working on very basic bit of the puzzle, understandi=
ng
the problem in order to produce a proper Stateless Encoder specification. A=
s an
example, the Hantro VP8 encoder brought interesting aspect, as an example i=
t
produces 2 buffers. Shall we offset these into 1 buffer, shall we use plane=
s to
zero copy that to user, or shall we memcpy in the driver .. Shall the VP8 f=
rame
header be produced by the driver (even though the HW don't produce it) or s=
hall
we have more stateless VP8 format for both cases. Its a big series of tiny
things like this that we need to study and weight, and compare against othe=
r
Hardware designs.

regards,
Nicolas

