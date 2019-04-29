Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB429EA13
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2019 20:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbfD2S1s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Apr 2019 14:27:48 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:33090 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728903AbfD2S1r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Apr 2019 14:27:47 -0400
Received: by mail-qk1-f194.google.com with SMTP id k189so6579065qkc.0
        for <linux-media@vger.kernel.org>; Mon, 29 Apr 2019 11:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=IP3FHnMV/mFDceaG7NR28w+jM+ZEbdN5PFi1FsBUSc8=;
        b=DVjUI2QRhQK15j5OYtkyws9OgmMjkNAK+jRGC1G7UbaGz4iHPEMpIcPfUDxNs9yW3T
         nKeIWFD1+fgsphMkkA9D7JrgXuAZvpwDTuqqw5oIYQs2ytXsNtQLVAJnKwAxb1nZAdon
         sVgYIWTTuSuIWzAKUdyIRa4ZXLmuRUaBxYtDEm5QwWieTdpJUhV4kbUNacoMfSEMGIdd
         seGOHP89VCy8fry9dE9GDzOwuKe9YuVspzAMMP4D+RBwQ534gyc6JfOamg7RVT3EWkHx
         XlkBMjwrNRDI/yuOSdv0EDVgUvGGd0w/+o/JLL1mwvKnTG2PAq2vGd0Xh503GNb+hO6H
         btng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=IP3FHnMV/mFDceaG7NR28w+jM+ZEbdN5PFi1FsBUSc8=;
        b=gBR7s07KIfbKe9jVpNBmUEjLMJcUm/wscApWspIPH+d+j20s2J3CoioRWUDDYDmgmq
         CjFPCY+rgbLHbEoHQuO94MxTatfGmZEfV/o6SGy4h5Xw4AbqG8NwaWMLQBfrBNWn7CsZ
         +AHM88eB8S4kDU01nHFlw8RB4Jb0odOs7dA3Vd476r44u1QrG4GqUH2a29FtO1GuPeDc
         FfnQp0OB35ao6o+y3fBDVN1XSdstm6hLWExFJU97mfaMwSXEbvJUHjaMABzldZ7bOQ4q
         XUA+wwQjGDU3BFfjRF7lZtSKQzKa1hBNRW1bozvZXozISt1GdAwD/VASEM9jpNnKAB3k
         dZ8w==
X-Gm-Message-State: APjAAAXYjp1Kzcg2nv0LrQYibHjbaqQcSIXcBlhN4kAtgEWmUr/R7us4
        5qdAWpr3FBJivTU/mXuryBkRAQ==
X-Google-Smtp-Source: APXvYqxU7ss5ur9sEjiVz8vw8cQGWn3lwNw2Intycj3sl212aOKhoJ3aivrTiP2osxcvvwmFd25pMA==
X-Received: by 2002:a37:4f88:: with SMTP id d130mr13215741qkb.154.1556562466202;
        Mon, 29 Apr 2019 11:27:46 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id q11sm5784408qkn.19.2019.04.29.11.27.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 11:27:43 -0700 (PDT)
Message-ID: <d656119e73d491fe307045639ccc2102cb8a8722.camel@ndufresne.ca>
Subject: Re: [PATCH v4] media: docs-rst: Document m2m stateless video
 decoder interface
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        kernel mailing list <kernel@lists.collabora.co.uk>
Date:   Mon, 29 Apr 2019 14:27:41 -0400
In-Reply-To: <16a3a61fe354dc545e99aef36aa58c7d4943de26.camel@bootlin.com>
References: <20190306080019.159676-1-acourbot@chromium.org>
         <371df0e4ec9e38d83d11171cbd98f19954cbf787.camel@ndufresne.ca>
         <da5aa9ab957923a72e30b169a3c242c4fe6260f1.camel@bootlin.com>
         <c07703459c7e48904bd7fd83be1e675c70eee83c.camel@ndufresne.ca>
         <d81d0112b99feba0a1899f3722077a4aeec9860c.camel@bootlin.com>
         <439b7f57aa3ba2b2ed5b043f961ef87cb83912af.camel@ndufresne.ca>
         <59e23c5ca5bfbadf9441ea06da2e9b9b5898c6d7.camel@bootlin.com>
         <0b495143bb260cf9f8927ee541e7f001842ac5c3.camel@ndufresne.ca>
         <CAPBb6MVG+3jQcw3AuhYDYCZ0YJ0aX=TmEuM5izh12GLw9V6B8Q@mail.gmail.com>
         <793af82c-6b37-6f69-648e-2cd2a2e87645@xs4all.nl>
         <f30f69af184cc80d5c56853b517943f45c90d9d9.camel@ndufresne.ca>
         <0a39c613-440d-c7a9-a078-b4688874f9e6@xs4all.nl>
         <16a3a61fe354dc545e99aef36aa58c7d4943de26.camel@bootlin.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-BvhEZUwF+CTFnteYIJW9"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-BvhEZUwF+CTFnteYIJW9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 29 avril 2019 =C3=A0 10:48 +0200, Paul Kocialkowski a =C3=A9crit :
> Hi,
>=20
> On Mon, 2019-04-29 at 10:41 +0200, Hans Verkuil wrote:
> > On 4/27/19 2:06 PM, Nicolas Dufresne wrote:
> > > Le vendredi 26 avril 2019 =C3=A0 16:18 +0200, Hans Verkuil a =C3=A9cr=
it :
> > > > On 4/16/19 9:22 AM, Alexandre Courbot wrote:
> > > >=20
> > > > <snip>
> > > >=20
> > > > > Thanks for this great discussion. Let me try to summarize the sta=
tus
> > > > > of this thread + the IRC discussion and add my own thoughts:
> > > > >=20
> > > > > Proper support for multiple decoding units (e.g. H.264 slices) pe=
r
> > > > > frame should not be an afterthought ; compliance to encoded forma=
ts
> > > > > depend on it, and the benefit of lower latency is a significant
> > > > > consideration for vendors.
> > > > >=20
> > > > > m2m, which we use for all stateless codecs, has a strong assumpti=
on
> > > > > that one OUTPUT buffer consumed results in one CAPTURE buffer bei=
ng
> > > > > produced. This assumption can however be overruled: at least the =
venus
> > > > > driver does it to implement the stateful specification.
> > > > >=20
> > > > > So we need a way to specify frame boundaries when submitting enco=
ded
> > > > > content to the driver. One request should contain a single OUTPUT
> > > > > buffer, containing a single decoding unit, but we need a way to
> > > > > specify whether the driver should directly produce a CAPTURE buff=
er
> > > > > from this request, or keep using the same CAPTURE buffer with
> > > > > subsequent requests.
> > > > >=20
> > > > > I can think of 2 ways this can be expressed:
> > > > > 1) We keep the current m2m behavior as the default (a CAPTURE buf=
fer
> > > > > is produced), and add a flag to ask the driver to change that beh=
avior
> > > > > and hold on the CAPTURE buffer and reuse it with the next request=
(s) ;
> > > > > 2) We specify that no CAPTURE buffer is produced by default, unle=
ss a
> > > > > flag asking so is specified.
> > > > >=20
> > > > > The flag could be specified in one of two ways:
> > > > > a) As a new v4l2_buffer.flag for the OUTPUT buffer ;
> > > > > b) As a dedicated control, either format-specific or more common =
to all codecs.
> > > > >=20
> > > > > I tend to favor 2) and b) for this, for the reason that with H.26=
4 at
> > > > > least, user-space does not know whether a slice is the last slice=
 of a
> > > > > frame until it starts parsing the next one, and we don't know whe=
n we
> > > > > will receive it. If we use a control to ask that a CAPTURE buffer=
 be
> > > > > produced, we can always submit another request with only that con=
trol
> > > > > set once it is clear that the frame is complete (and not delay
> > > > > decoding meanwhile). In practice I am not that familiar with
> > > > > latency-sensitive streaming ; maybe a smart streamer would just a=
ppend
> > > > > an AUD NAL unit at the end of every frame and we can thus submit =
the
> > > > > flag it with the last slice without further delay?
> > > > >=20
> > > > > An extra constraint to enforce would be that each decoding unit
> > > > > belonging to the same frame must be submitted with the same times=
tamp,
> > > > > otherwise the request submission would fail. We really need a
> > > > > framework to enforce all this at a higher level than individual
> > > > > drivers, once we reach an agreement I will start working on this.
> > > > >=20
> > > > > Formats that do not support multiple decoding units per frame wou=
ld
> > > > > reject any request that does not carry the end-of-frame informati=
on.
> > > > >=20
> > > > > Anything missing / any further comment?
> > > > >=20
> > > >=20
> > > > After reading through this thread and a further irc discussion I no=
w
> > > > understand the problem. I think there are several ways this can be
> > > > solved, but I think this is the easiest:
> > > >=20
> > > > Introduce a new V4L2_BUF_FLAG_HOLD_CAPTURE_BUFFER flag.
> > > >=20
> > > > If set in the OUTPUT buffer, then don't mark the CAPTURE buffer as
> > > > done after processing the OUTPUT buffer.
> > > >=20
> > > > If an OUTPUT buffer was queued with a different timestamp than was
> > > > used for the currently held CAPTURE buffer, then mark that CAPTURE
> > > > buffer as done before starting processing this OUTPUT buffer.
> > >=20
> > > Just a curiosity, can you extend on how this would be handled. If the=
re
> > > is a number of capture buffer, these should have "no-timestamp". So I
> > > suspect we need the condition to differentiate no-timestamp from
> > > previous timestamp. What I'm unclear is to what does it mean "no-
> > > timestamp". We already stated the timestamp 0 cannot be reserved as
> > > being an unset timestamp.
> >=20
> > For OUTPUT buffers there is no such thing as 'no timestamp'. They alway=
s
> > have a timestamp (which may be 0). The currently active CAPTURE buffer
> > also always has a timestamp as that was copied from the first OUTPUT bu=
ffer
> > for that CAPTURE buffer.
> >=20
> > > > In other words, for slicing you can just always set this flag and
> > > > group the slices by the OUTPUT timestamp. If you know that you
> > > > reached the last slice of a frame, then you can optionally clear th=
e
> > > > flag to ensure the CAPTURE buffer is marked done without having to =
wait
> > > > for the first slice of the next frame to arrive.
> > > >=20
> > > > Potential disadvantage of this approach is that this relies on the
> > > > OUTPUT timestamp to be the same for all slices of the same frame.
> > > >=20
> > > > Which sounds reasonable to me.
> > > >=20
> > > > In addition add a V4L2_BUF_CAP_SUPPORTS_HOLD_CAPTURE_BUFFER
> > > > capability to signal support for this flag.
> > > >=20
> > > > I think this can be fairly easily implemented in v4l2-mem2mem.c.
> > > >=20
> > > > In addition, this approach is not specific to codecs, it can be
> > > > used elsewhere as well (composing multiple output buffers into one
> > > > capture buffer is one use-case that comes to mind).
> > > >=20
> > > > Comments? Other ideas?
> > >=20
> > > Sounds reasonable to me. I'll read through Paul's comment now and
> > > comment if needed.
> >=20
> > Paul's OK with it as well. The only thing I am not 100% happy with is
> > the name of the flag. It's a very low-level name: i.e. it does what it
> > says, but it doesn't say for what purpose.
> >=20
> > Does anyone have any better suggestions?
>=20
> Good naming is always so hard to find... I don't have anything better
> to suggest off the top of my head, but will definitely keep thinking
> about it.
>=20
> > Also, who will implement this in v4l2-mem2mem? Paul, where you planning=
 to do that?
>=20
> Well, I no longer have time chunks allocated to the VPU topic at work,
> so that means I'll have to do it on spare time and it may take me a
> while to get there.
>=20
> So if either one of you would like to pick it up to get it over with
> faster, feel free to do that!

Adding Boris in CC. Boris, do you think that could possibly fit into
your todo while working on the H264 accelerator on RK ? If needed I can
generate test streams, there is couple of lines of code to remove / add
in FFMPEG backend if you want to test this properly, though I'm not
able to run this code atm (it requires a working DRM, and I'm having
issues with my board in this regard).

>=20
> Cheers,
>=20
> Paul
>=20

--=-BvhEZUwF+CTFnteYIJW9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXMdCHQAKCRBxUwItrAao
HFskAJ9hwh12OuDwcxDOiF5VwiOlrM/zJwCgim/rJ+U/ixWMWEym8jVyK92DzIg=
=92cZ
-----END PGP SIGNATURE-----

--=-BvhEZUwF+CTFnteYIJW9--

