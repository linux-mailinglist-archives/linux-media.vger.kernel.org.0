Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E033FF7FE0
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 20:27:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfKKT1W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 14:27:22 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:35322 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727340AbfKKT1W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 14:27:22 -0500
Received: by mail-qv1-f65.google.com with SMTP id y18so5362937qve.2
        for <linux-media@vger.kernel.org>; Mon, 11 Nov 2019 11:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=FxXPS2E+pi74/aFJO+MxmAtUY6WXRBpzxnvbYgaZAsg=;
        b=ZRWXwqT2HAktaOF3pvvrZPt0oe4mkJpg6hmRwyhr0j+pVzN8+oi0TaHr8L6NXJ4W2s
         TKzr8VyzMhM77gZRV+ZaHoh2gC/D9UnY/FlVqhaN/sN+LxfZGFRElaKxgsuDJzY6rzJx
         qvA/gtSefpOhZPapK+woib//hQ8JLwdLoUZoJyDrgRmRGiRB6+cX0bI58+oyNrIn5fsC
         DwGyQobFmGwzEqqq0PiwcqnQtnvvOw7+c72ikPcxcfBYW9AICTzGnSAROj/lkQdJccNh
         mjUtonM5BXuSQRYhk2uImP22C5tlYdtv9V5J7vWX75118N46FTqEEue8mWxTiTRIsNiy
         /bxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=FxXPS2E+pi74/aFJO+MxmAtUY6WXRBpzxnvbYgaZAsg=;
        b=RzJe20w1SF+GyWBnh3mH3/iJIBL2vP2kekY57VU41nJ9aby8/rrYJvI05P+RWIV0FQ
         RqtqozCmq33epq8ijhgao1BsVLLNkdIe7lHhE2v04Eoyut6nxcacZ9rmLSE/Og0OC7Cv
         mJMYFhHmqEgv732gNDq5BzG1d/fDqWOaCw8L/K1+CMhbyUIpN27XLtJ5BFpRlraX5aMD
         +GjMuAYbzyZ7v1tffd2nu1OxlcMdP3yC4hpZlQMj3OdISiOpey6eX+xV0q4E86yZF9MC
         WzpEqewCXkgIpEHJYfYPowe1t3tvsWw1vQU5wIb+kO5D4+7qZKkOscF5P0jiDMdPuels
         W9Kw==
X-Gm-Message-State: APjAAAVLmMsLc5/M2bi2rL6omFbfwUAQudKZ85vDwGM7YtPBQsNAiG2+
        iVXMToswUUcZRzXAiml9Tdq8Tg==
X-Google-Smtp-Source: APXvYqx7kRN8SYuTkQDfCv2v1BFu6Hh/BwrHyobt4HsFo3+cCQZuidhLM65/C8myY5V8T87/y0d79Q==
X-Received: by 2002:a0c:ec01:: with SMTP id y1mr11198713qvo.90.1573500440868;
        Mon, 11 Nov 2019 11:27:20 -0800 (PST)
Received: from tpx230-nicolas.localdomain (marriott-chateau-champlain-montreal.sites.intello.com. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id i186sm8043025qkc.8.2019.11.11.11.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 11:27:19 -0800 (PST)
Message-ID: <a7c72589f55594069160afbf94613d322b55470a.camel@ndufresne.ca>
Subject: Re: [EXT] Re: [PATCH 0/5] Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Date:   Mon, 11 Nov 2019 14:27:17 -0500
In-Reply-To: <ffbc7501-bb56-b5f2-cd43-209f099be594@xs4all.nl>
References: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
         <87d80882-b032-f332-0808-d669600f844f@xs4all.nl>
         <1573058741.16477.18.camel@nxp.com>
         <2ad1718b-2556-ea7c-27e0-9e60445a5b71@xs4all.nl>
         <1573220200.16477.32.camel@nxp.com>
         <ffbc7501-bb56-b5f2-cd43-209f099be594@xs4all.nl>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-VUH0YJwbahd5gI0MVm8e"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-VUH0YJwbahd5gI0MVm8e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 08 novembre 2019 =C3=A0 15:06 +0100, Hans Verkuil a =C3=A9crit =
:
> On 11/8/19 2:36 PM, Mirela Rabulea wrote:
> > Hi Hans,
> >=20
> > On Mi, 2019-11-06 at 17:52 +0100, Hans Verkuil wrote:
> > >       test Scaling: OK
> > > The presence of a scaler is suspicious: is the encoder indeed
> > > capable of scaling? I suspect this is a bug.
> >=20
> > No, it's not capable of scaling. You suspect a bug in the driver or the
> > tests?
>=20
> Actually, I think that's an outstanding bug in v4l-utils. It doesn't
> correctly handle the m2m case with respect to scaling. I think. I'll
> look into this a bit more.
>=20
> > > Codec ioctls:
> > > >       test VIDIOC_(TRY_)ENCODER_CMD: OK
> > > The presence of this...
> > >=20
> > > >       test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > >       test VIDIOC_(TRY_)DECODER_CMD: OK
> > > ...and this is also strange for a JPEG codec. These ioctls are
> > > typically only
> > > needed for MPEG/H264/etc. codecs, and not for a simple JPEG codec.
> > >=20
> > > The same issues are found for the JPEG decoder.
> >=20
> > I implemented the CMD_STOP for both encoder & decoder, because it was
> > requested by our developer for gstreamer plugin for this codec.
> > The context in which this was requested was for playing MJPEG videos (a
> > concatenation of JPEG frames).
>=20
> This ioctl makes no sense for JPEG codecs, and in fact jpeg drivers like
> s5p-jpeg or mtk-jpeg do not implement this. This sounds like a gstreamer =
bug.
> Nicolas, do you know anything about this?

This code was added in generic bits of GStreamer. So we just always do
CMD_STOP to drain the remaining buffers and expect EPIPE later on when
done. We can special case this, but at the same time why ? This could
be buried into the m2m helpers with a default implementation.

If you feel like this is completely wrong and userspace should do more
case-by-case code path for different CODEC handling, then someone will
have to update GStreamer accordingly. This is all moving target at the
spec just got merged.

>=20
> > > Streaming ioctls:
> > > >       test read/write: OK (Not Supported)
> > > >       test blocking wait: OK
> > > >               fail: v4l2-test-buffers.cpp(254): g_field() =3D=3D
> > > > V4L2_FIELD_ANY
> > > The driver shall never return FIELD_ANY. This needs to be FIELD_NONE.
> >=20
> > Is there a "good example" of a v4l m2m driver that passes these
>=20
> vim2m. Also drivers/media/platform/mtk-jpeg/ (although I'm not sure when
> it was last tested with v4l2-compliance, so it might be a bit out of date=
).
>=20
> > streaming tests? That would save some time on my side.
> > For the FIELD_ANY issue, I got inspired from your commit:
> > ab7afaf3 media: vim2m: add buf_out_validate callback
> > But there's a lot more to go...
> >=20
> > Thanks,
> > Mirela
> >=20
>=20
> Regards,
>=20
> 	Hans

--=-VUH0YJwbahd5gI0MVm8e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXcm2FQAKCRBxUwItrAao
HH/yAJ4i/zn4lovHANSysp2/fBJ+90qJgQCgp6bTO443f6uWk4bazz8NHgVEmy0=
=zbkH
-----END PGP SIGNATURE-----

--=-VUH0YJwbahd5gI0MVm8e--

