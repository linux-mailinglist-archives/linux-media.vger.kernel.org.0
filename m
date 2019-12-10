Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3757117DC9
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 03:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfLJCat (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 21:30:49 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52088 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbfLJCat (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 21:30:49 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 18DB128ADDD
Message-ID: <2a6629b95f9c8a5f41ec783ef2e39f5cba8e7a20.camel@collabora.com>
Subject: Re: [PATCH v2] uvcvideo: Also validate buffers in BULK mode
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 09 Dec 2019 21:30:44 -0500
In-Reply-To: <b30648712504dedd388ac13100afc43beba9408a.camel@collabora.com>
References: <2206409.jVpTcjFX6j@avalon>
         <20180605234607.5334-1-nicolas.dufresne@collabora.com>
         <b30648712504dedd388ac13100afc43beba9408a.camel@collabora.com>
Organization: Collabora
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-W5rmSR8ZLiNuf29ErQEm"
User-Agent: Evolution 3.34.1 (3.34.1-1.fc31) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-W5rmSR8ZLiNuf29ErQEm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 09 d=C3=A9cembre 2019 =C3=A0 21:27 -0500, Nicolas Dufresne a =C3=
=A9crit :
> Le mardi 05 juin 2018 =C3=A0 19:46 -0400, Nicolas Dufresne a =C3=A9crit :
> > Just like for ISOC, validate the decoded BULK buffer size when possible=
.
> > This avoids sending corrupted or partial buffers to userspace, which ma=
y
> > lead to application crash or run-time failure.
> >=20
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> Ping. That was a year and a half ago and still applies.

Please ignore, I was looking into the wrong branch by accident. Please,
update patchwork, that might also help to avoid confusion.

>=20
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/=
uvc_video.c
> > index aa0082fe5833..025ffac196f3 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1234,6 +1234,7 @@ static void uvc_video_next_buffers(struct uvc_str=
eaming *stream,
> >  		*meta_buf =3D uvc_queue_next_buffer(&stream->meta.queue,
> >  						  *meta_buf);
> >  	}
> > +	uvc_video_validate_buffer(stream, *video_buf);
> >  	*video_buf =3D uvc_queue_next_buffer(&stream->queue, *video_buf);
> >  }
> > =20
> > @@ -1258,10 +1259,8 @@ static void uvc_video_decode_isoc(struct urb *ur=
b, struct uvc_streaming *stream,
> >  		do {
> >  			ret =3D uvc_video_decode_start(stream, buf, mem,
> >  				urb->iso_frame_desc[i].actual_length);
> > -			if (ret =3D=3D -EAGAIN) {
> > -				uvc_video_validate_buffer(stream, buf);
> > +			if (ret =3D=3D -EAGAIN)
> >  				uvc_video_next_buffers(stream, &buf, &meta_buf);
> > -			}
> >  		} while (ret =3D=3D -EAGAIN);
> > =20
> >  		if (ret < 0)
> > @@ -1277,10 +1276,8 @@ static void uvc_video_decode_isoc(struct urb *ur=
b, struct uvc_streaming *stream,
> >  		uvc_video_decode_end(stream, buf, mem,
> >  			urb->iso_frame_desc[i].actual_length);
> > =20
> > -		if (buf->state =3D=3D UVC_BUF_STATE_READY) {
> > -			uvc_video_validate_buffer(stream, buf);
> > +		if (buf->state =3D=3D UVC_BUF_STATE_READY)
> >  			uvc_video_next_buffers(stream, &buf, &meta_buf);
> > -		}
> >  	}
> >  }
> > =20

--=-W5rmSR8ZLiNuf29ErQEm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXe8DVAAKCRBxUwItrAao
HLiXAKDDXZH4okqc7Ii0nCheYAYH/tLAKQCfSK7KLBI5mTlGuV9GEwlDHaO3U0Y=
=pUSr
-----END PGP SIGNATURE-----

--=-W5rmSR8ZLiNuf29ErQEm--

