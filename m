Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 580C35EAC0
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 19:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfGCRqt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 13:46:49 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:38131 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbfGCRqt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 13:46:49 -0400
Received: by mail-qk1-f193.google.com with SMTP id a27so3482602qkk.5
        for <linux-media@vger.kernel.org>; Wed, 03 Jul 2019 10:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=BKcrmoFhdbxVy0evprumyY9DFgai56TOrtZEcJQ6yL0=;
        b=J6tuzg9K+Rt8kQRaQslsGU9SBBD8KGPsQLgrtUP6zm2X7igRjbPDxmJMLvT6CNA6YY
         gQRFKvZYiWehn2bwM+GAg4HQlVyWTxdKzYkg92SkU338NcXYRdngwwiVJQBXDUemlDpY
         h5mZokBHjMknoaSl7EY+R57VRGvNi4/SEhqTrBDoZvPNZtxiMa87b3G8djFcYieaUvMO
         cvKWl9WOPz5TLT1agIv1Svi0CJ0ygDMFtd3q/8AubAGRGpLunKIvlruQiyeUk4Mz93IA
         YYX6NrrTawoVoT8WlQnpUahUuls9bzh4XW3NCgrnpoKth6iA1ZO8jjTL2oEoYOCUgAiN
         yOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=BKcrmoFhdbxVy0evprumyY9DFgai56TOrtZEcJQ6yL0=;
        b=YzRn5gpW8asp0mEzqGaON3xBVxTRtpV0A2drxmkS1nKvOf94T/fHHk1kcRnZXNtCBs
         Yc6+CeaVdpsv0qhDmrcYZJbbCnBMZv9K9gK0IsfPc73yZt6AJXlw35zG/TYSnBVOeW//
         KgsZ4FHX5XzpaeuwiEpOGsFbgJ9d80QiWqRlFkNhWupSjHkJPwC6PzO9X5I2E94RdYqw
         7CRDq0nMKhKc1b4Xve+zFzkZjvrve6BMwsfvSYGu53xY8W0Vni0GT+fxRvn1ZUAKDT9V
         etaGpmSUxPlHKfd4O5YKFmFuzkyC7cMRK6CpoGKoV2ae5/G74q8U8nShWxKIbHw6EXjt
         QS9A==
X-Gm-Message-State: APjAAAW2hxF31i5Yaqy5gHjXNtNBPPEGXCJytBzDOFcQ8ulimcEulIcG
        DS7UaoxaqMIimOHtoVhbWBfXJQ==
X-Google-Smtp-Source: APXvYqxUgcazbMtSrc+31IfuCWwV5uLl30ORqCz+4yYnZWVSgwL5Ur/QfADvaYQFsqT+u35RAEb68w==
X-Received: by 2002:a05:620a:69c:: with SMTP id f28mr31367961qkh.274.1562176007786;
        Wed, 03 Jul 2019 10:46:47 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id r36sm1344415qte.71.2019.07.03.10.46.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 10:46:46 -0700 (PDT)
Message-ID: <fa2621ee1639108f725a7f1deb9f6aac060d7cd4.camel@ndufresne.ca>
Subject: Re: [RFC] Stateful codecs and requirements for compressed formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Date:   Wed, 03 Jul 2019 13:46:45 -0400
In-Reply-To: <CAAFQd5BqUS201QP4KHzmnKi5r+3P_KAa=L9CF3=zyQKypNyVuw@mail.gmail.com>
References: <530f28e9-f686-6222-c6cc-9a5207b151f7@xs4all.nl>
         <CAAFQd5BqUS201QP4KHzmnKi5r+3P_KAa=L9CF3=zyQKypNyVuw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-ax8HriGzGM38AAZeOARE"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-ax8HriGzGM38AAZeOARE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 juillet 2019 =C3=A0 17:32 +0900, Tomasz Figa a =C3=A9crit :
> Hi Hans,
>=20
> On Fri, Jun 28, 2019 at 11:34 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > Hi all,
> >=20
> > I hope I Cc-ed everyone with a stake in this issue.
> >=20
> > One recurring question is how a stateful encoder fills buffers and how =
a stateful
> > decoder consumes buffers.
> >=20
> > The most generic case is that an encoder produces a bitstream and just =
fills each
> > CAPTURE buffer to the brim before continuing with the next buffer.
> >=20
> > I don't think there are drivers that do this, I believe that all driver=
s just
> > output a single compressed frame. For interlaced formats I understand i=
t is either
> > one compressed field per buffer, or two compressed fields per buffer (t=
his is
> > what I heard, I don't know if this is true).
> >=20
> > In any case, I don't think this is specified anywhere. Please correct m=
e if I am
> > wrong.
> >=20
> > The latest stateful codec spec is here:
> >=20
> > https://hverkuil.home.xs4all.nl/codec-api/uapi/v4l/dev-mem2mem.html
> >=20
> > Assuming what I described above is indeed the case, then I think this s=
hould
> > be documented. I don't know enough if a flag is needed somewhere to des=
cribe
> > the behavior for interlaced formats, or can we leave this open and have=
 userspace
> > detect this?
> >=20
>=20
> From Chromium perspective, we don't have any use case for encoding
> interlaced contents, so we'll be okay with whatever the interested
> parties decide on. :)
>=20
> > For decoders it is more complicated. The stateful decoder spec is writt=
en with
> > the assumption that userspace can just fill each OUTPUT buffer to the b=
rim with
> > the compressed bitstream. I.e., no need to split at frame or other boun=
daries.
> >=20
> > See section 4.5.1.7 in the spec.
> >=20
> > But I understand that various HW decoders *do* have limitations. I woul=
d really
> > like to know about those, since that needs to be exposed to userspace s=
omehow.
>=20
> AFAIK mtk-vcodec needs H.264 SPS and PPS to be split into their own
> separate buffers. I believe it also needs 1 buffer to contain exactly
> 1 frame and 1 frame to be fully contained inside 1 buffer.
>=20
> Venus also needed 1 buffer to contain exactly 1 frame and 1 frame to
> be fully contained inside 1 buffer. It used to have some specific
> requirements regarding SPS and PPS too, but I think that was fixed in
> the firmware.
>=20
> > Specifically, the venus decoder needs to know the resolution of the cod=
ed video
> > beforehand
>=20
> I don't think that's true for venus. It does parsing and can detect
> the resolution.
>=20
> However that's probably the case for coda...

I'm probably the worst person to have access to the documentation, but
from the documentation I have read, it seems like this is a limitation
of the amount of the driver. Unless it's a limitation of 960,
documentation I have is 970.

>=20
> > and it expects a single frame per buffer (how does that work for
> > interlaced formats?).
> >=20
> > Such requirements mean that some userspace parsing is still required, s=
o these
> > decoders are not completely stateful.
> >=20
> > Can every codec author give information about their decoder/encoder?
> >=20
> > I'll start off with my virtual codec driver:
> >=20
> > vicodec: the decoder fully parses the bitstream. The encoder produces a=
 single
> > compressed frame per buffer. This driver doesn't yet support interlaced=
 formats,
> > but when that is added it will encode one field per buffer.
> >=20
> > Let's see what the results are.
>=20
> s5p-mfc:
>  decoder: fully parses the bitstream,
>  encoder: produces a single frame per buffer (haven't tested interlaced s=
tuff)
>=20
> mtk-vcodec:
>  decoder: expects separate buffers for SPS, PPS and full frames
> (including some random stuff like SEIMessage),
>  encoder: produces a single frame per buffer (haven't tested interlaced s=
tuff)
>=20
> Best regards,
> Tomasz

--=-ax8HriGzGM38AAZeOARE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXRzqBQAKCRBxUwItrAao
HGETAJ0dnn1K0DnHoyQ99bnysm5Yw2t/1gCfScpNwwmagT/bdixVI+/8zK6asRw=
=93oS
-----END PGP SIGNATURE-----

--=-ax8HriGzGM38AAZeOARE--

