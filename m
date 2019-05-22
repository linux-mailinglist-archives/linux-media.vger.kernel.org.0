Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2918269B6
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 20:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728450AbfEVSSq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 14:18:46 -0400
Received: from mail-qk1-f173.google.com ([209.85.222.173]:36833 "EHLO
        mail-qk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727984AbfEVSSq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 14:18:46 -0400
Received: by mail-qk1-f173.google.com with SMTP id o2so1797717qkb.3
        for <linux-media@vger.kernel.org>; Wed, 22 May 2019 11:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=xNMtNZgwFyLADZ0hqOJ1E9sbxjNMg7q0rPt6S1NZ27k=;
        b=C9OuXTwAPbrrOkeZQyDYV0tKqQri/aZ+WWjeu4+dU9mEUX+8YOh+lauAiZrwwDjFCe
         92cwb2zCQ35U9DTlCWLLkHf9JF3SMQ/o/J7VlrSso1kZ1UEBQmXwz5w3QLSTnJwSejtg
         k5oG/yx9GkmMNfJseLSwpcHqufWaGsLBg1VA8KmaGU+RmS1awzJRuMvYH+ceRe2Ivrxl
         YjxJ/NU/GCXTZW7lOqTMFOxQUSwbAsrmt2p/HYTIDAENCQEXGQDtTE5o7PDv4T2eL0oo
         CDO21Dh/qfsmtYf2WlvXMX4QRT87FG53pVfiHBi4UHCalzKbIua4eQjSeAtbCRC1quOS
         Ss+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=xNMtNZgwFyLADZ0hqOJ1E9sbxjNMg7q0rPt6S1NZ27k=;
        b=N55x/FP78cockYi4beZU1kPnm3KcYNEpMtoIIqNqDbUbomixfbRC8/o1gfV2J4HUX9
         IM+vEWuUApguYmJ7v+EYo6zEyH9zghNpouiCh8eGSAG5lnO0FZ925HMZTwQ7SH4ZzV0K
         W66ydd4E+dHQVU0SEQHgymV/8KQl9F0r3JDHda5T0BGbhld+AymFE4klxaSNahIuwhaF
         r4DByUQaj97yaESnOKHXb6GN7X6o6JHth07HEreO0ob3RkwcFd9y/3K0xlRK6qsis8/n
         qhhfENt8equzViblDGiY5r7XL4OlgmTyMUxsPRiE/13ubRJPxA+C/raKnNKiZbIIZgWI
         u7aw==
X-Gm-Message-State: APjAAAVAPTm3A58+/cRnzQJdEjJhDk9Prja9/efsmXCLK0Vqdklr9tbq
        uFua+LV4NwoxjzaAzeXzbPG/Dw==
X-Google-Smtp-Source: APXvYqzHYTLXQ81+HME2bKwsRfwZW5YHE9KfnEi8eXMOK15w/YY8r+bHW56V7QFQlSv510LCjzTF9Q==
X-Received: by 2002:a05:620a:15c4:: with SMTP id o4mr4137812qkm.89.1558549125263;
        Wed, 22 May 2019 11:18:45 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id s12sm12151715qkm.38.2019.05.22.11.18.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 22 May 2019 11:18:44 -0700 (PDT)
Message-ID: <dd84eeebb5ca744976f5edead063c0285ecf79ce.camel@ndufresne.ca>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Date:   Wed, 22 May 2019 14:18:42 -0400
In-Reply-To: <20190522102055.53933998@collabora.com>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
         <3e0d6d5106e9c0c27ef4b11e64a488726ff77103.camel@ndufresne.ca>
         <39ded6d4ddf85849bf45abc94dc8e104fd4c0978.camel@bootlin.com>
         <20190521154358.GC7098@ulmo>
         <124db795c1ed77854be6c565092c2820776ac223.camel@ndufresne.ca>
         <CAAFQd5Cmv-CJAsQ7QdoEPYyCFLDjAJjFFLo8PMZT=zeOumnkmQ@mail.gmail.com>
         <20190522092924.116b212e@collabora.com>
         <20190522102055.53933998@collabora.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-sC3I7RKfJoRRYXbMBPHB"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-sC3I7RKfJoRRYXbMBPHB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 22 mai 2019 =C3=A0 10:20 +0200, Boris Brezillon a =C3=A9crit :
> On Wed, 22 May 2019 09:29:24 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>=20
> > On Wed, 22 May 2019 15:39:37 +0900
> > Tomasz Figa <tfiga@chromium.org> wrote:
> >=20
> > > > It would be premature to state that we are excluding. We are just
> > > > trying to find one format to get things upstream, and make sure we =
have
> > > > a plan how to extend it. Trying to support everything on the first =
try
> > > > is not going to work so well.
> > > >=20
> > > > What is interesting to provide is how does you IP achieve multi-sli=
ce
> > > > decoding per frame. That's what we are studying on the RK/Hantro ch=
ip.
> > > > Typical questions are:
> > > >=20
> > > >   1. Do all slices have to be contiguous in memory
> > > >   2. If 1., do you place start-code, AVC header or pass a seperate =
index to let the HW locate the start of each NAL ?
> > > >   3. Does the HW do support single interrupt per frame (RK3288 as a=
n example does not, but RK3399 do)   =20
> > >=20
> > > AFAICT, the bit about RK3288 isn't true. At least in our downstream
> > > driver that was created mostly by RK themselves, we've been assuming
> > > that the interrupt is for the complete frame, without any problems. =
=20
> >=20
> > I confirm that's what happens when all slices forming a frame are packe=
d
> > in a single output buffer: you only get one interrupt at the end of the
> > decoding process (in that case, when the frame is decoded). Of course,
> > if you split things up and do per-slice decoding instead (one slice per
> > buffer) you get an interrupt per slice, though I didn't manage to make
> > that work.
> > I get a DEC_BUFFER interrupt (AKA, "buffer is empty but frame is not
> > fully decoded") on the first slice and an ASO (Arbitrary Slice Ordering=
)
> > interrupt on the second slice, which makes me think some states are
> > reset between the 2 operations leading the engine to think that the
> > second slice is part of a new frame.
> >=20
> > Anyway, it doesn't sound like a crazy idea to support both per-slice
> > and per-frame decoding and maybe have a way to expose what a
> > specific codec can do (through an extra cap mechanism).
> > The other option would be to support only per-slice decoding with a
> > mandatory START_FRAME/END_FRAME sequence to let drivers for HW that
> > only support per-frame decoding know when they should trigger the
> > decoding operation.
>=20
> Just to clarify, we can use Hans' V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF
> work to identify start/end frame boundaries, the only problem I see is
> that users are not required to clear the flag on the last slice of a
> frame, so there's no way for the driver to know when it should trigger
> the decode-frame operation. I guess we could trigger this decode
> operation when v4l2_m2m_release_capture_buf() returns true, but I
> wonder if it's not too late to do that.

If the flag is gone, you can schedule immediatly, otherwise you'll know
by the timestamp change on the following slice.

>=20
> > The downside is that it implies having a bounce
> > buffer where the driver can pack slices to be decoded on the END_FRAME
> > event.
> >=20

--=-sC3I7RKfJoRRYXbMBPHB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXOWSggAKCRBxUwItrAao
HO1yAKCsB1hMd7AXSRxKGDvGgH+CE87CrACfenDwxV3/5VACRr3RrNR+UwqQQ+E=
=gPFh
-----END PGP SIGNATURE-----

--=-sC3I7RKfJoRRYXbMBPHB--

