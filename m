Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B79F1A0E4
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 18:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbfEJQBK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 12:01:10 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:38047 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727262AbfEJQBK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 12:01:10 -0400
Received: by mail-qk1-f195.google.com with SMTP id a64so3966236qkg.5
        for <linux-media@vger.kernel.org>; Fri, 10 May 2019 09:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=EPF7suJx7mubtbHbpRYCGM9W4V9liOQ67kxw5dbhCZU=;
        b=LKnu9kS3XgOzMbil/gpYDBgBy3uif2JdNUUihdW1oSuvOo5EIG2jEGZNak/2JqvxAD
         8+hOZTtQWU9nmp0rN7Khc92XZVBG6y8+0UgCWzzwYf8hQS/WYC4vruAL9FdIAxtEar6C
         OKKhTAPkbrZuzgwAyfBc6E2R3tIIApVpz7oCbgYFvt54IRGJQTTlF2FJxxOCEq24AdzL
         VQKj6nCchOfVS7AV13tzYE0i/QgK2zdVCbck0beAZlWlRaQDRuJRyOgttzhtSRBt+fzU
         X4Lr1zVYH8WwBW6nZkWhxl0W4aIpxwNInA9j9s43TPQMqzN0T7RmWYnHJXoqaP60X34J
         K5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=EPF7suJx7mubtbHbpRYCGM9W4V9liOQ67kxw5dbhCZU=;
        b=ndZgbed3vgR1/wnVio+a87p9Z7pb5TICx0BE2MEa0OqZDV7Oojxi+lTVD3qEsh1xhY
         oGUss994X2/mTTipA7viQZ+etquRJieivqZQTH5OefoVbpBQBCMOY9YJfPByxmrZvWtl
         8xRSR3zLbDsimHG13pVLNlPunrAAqNeg/dy+AET+5kQaykSSrvzLj/kQonQVX4x7GTbY
         C11euirhOjxq4FzYiySPswDkuKn9hiCiHOgcpqLCDdG9/0bjbR8Oyfyie2uSTAwXk8Iz
         FtD4qVtfLhASn31WMVH8VdHTTHMLmn7jq6BsWaUHxYqQ5XETR2y5OJoVYbPMaaO4+u8T
         gUuA==
X-Gm-Message-State: APjAAAV2Shck4BbTw6r52ZuagMwTHaC8awt6iIxT6ioR12sAXvrFVIB/
        OjCrDZFGHcHlpPnEZkxaR+yRvg==
X-Google-Smtp-Source: APXvYqwccncUBlMU8w3XVxFxA+PuBYg7glfVagdzjZa2xpSPYGmoB2pqIO/OvE0URLMWpGRL/4Q+7w==
X-Received: by 2002:ae9:c311:: with SMTP id n17mr9249550qkg.332.1557504068862;
        Fri, 10 May 2019 09:01:08 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id 8sm3357686qtr.32.2019.05.10.09.01.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 10 May 2019 09:01:07 -0700 (PDT)
Message-ID: <703e94a8eaf995ffedf94d3d6d88a83cf8a5366e.camel@ndufresne.ca>
Subject: Re: [PATCH v5 03/15] media: v4l2-common: Support custom
 imagesize/bytesperline in fill_pixfmt()
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Date:   Fri, 10 May 2019 12:01:04 -0400
In-Reply-To: <4e7f49b2-48ad-b504-5826-d993ba85e624@xs4all.nl>
References: <20190503114719.28784-1-boris.brezillon@collabora.com>
         <20190503114719.28784-4-boris.brezillon@collabora.com>
         <0c5a648c-27a8-8195-8ad9-8cefb4369837@xs4all.nl>
         <20190510112847.GA4972@pendragon.ideasonboard.com>
         <c2d02ffb-5273-67a8-1a3a-c7268dc7bfb6@xs4all.nl>
         <20190510122411.GB4972@pendragon.ideasonboard.com>
         <f9ffc9ae-2c27-2883-7f62-9931597c8e75@xs4all.nl>
         <106a6aa5fe62cf5b18652b667d15bc8677790cad.camel@ndufresne.ca>
         <4e7f49b2-48ad-b504-5826-d993ba85e624@xs4all.nl>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-yEjoGGMsbnF9v99MRnEu"
User-Agent: Evolution 3.32.1 (3.32.1-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-yEjoGGMsbnF9v99MRnEu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 10 mai 2019 =C3=A0 16:07 +0200, Hans Verkuil a =C3=A9crit :
> On 5/10/19 3:51 PM, Nicolas Dufresne wrote:
> > Le vendredi 10 mai 2019 =C3=A0 14:30 +0200, Hans Verkuil a =C3=A9crit :
> > > On 5/10/19 2:24 PM, Laurent Pinchart wrote:
> > > > Hi Hans,
> > > >=20
> > > > On Fri, May 10, 2019 at 02:17:32PM +0200, Hans Verkuil wrote:
> > > > > On 5/10/19 1:28 PM, Laurent Pinchart wrote:
> > > > > > On Fri, May 10, 2019 at 10:57:26AM +0200, Hans Verkuil wrote:
> > > > > > > On 5/3/19 1:47 PM, Boris Brezillon wrote:
> > > > > > > > Users can define custom sizeimage and bytesperline as long =
as they're
> > > > > > > > big enough to store the amount of pixels required for a spe=
cific
> > > > > > > > width/height under a specific format. Avoid overriding thos=
e fields in
> > > > > > > > this case.
> > > > > > > >=20
> > > > > > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.c=
om>
> > > > > > > > ---
> > > > > > > > Hello Hans,
> > > > > > > >=20
> > > > > > > > The sizeimage/bytesperline check on !MPLANE formats is stil=
l not 100%
> > > > > > > > sure, as custom bytesperline might induce bigger sizeimage =
than what
> > > > > > > > we calculate.
> > > > > > > >=20
> > > > > > > > I tried implementing something smarter taking the per-compo=
nent plane
> > > > > > > > bpp + hdiv param as we discussed the other day but decided =
to step
> > > > > > > > back after realizing the per-component plane macro block mi=
ght also
> > > > > > > > differ at least in theory (not sure that's true in practice=
) and that
> > > > > > > > has an impact on bytesperline too.
> > > > > > > >=20
> > > > > > > > Let me know how you want to handle that case.
> > > > > > > >=20
> > > > > > > > Regards,
> > > > > > > >=20
> > > > > > > > Boris
> > > > > > > >=20
> > > > > > > > Changes in v5:
> > > > > > > > * New patch
> > > > > > > > ---
> > > > > > > >  drivers/media/v4l2-core/v4l2-common.c | 54 +++++++++++++++=
++++--------
> > > > > > > >  1 file changed, 39 insertions(+), 15 deletions(-)
> > > > > > > >=20
> > > > > > > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/driver=
s/media/v4l2-core/v4l2-common.c
> > > > > > > > index 3c6f5c115fc5..37bfc984a8b5 100644
> > > > > > > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > > > > > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > > > > > > @@ -563,9 +563,10 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pi=
x_format_mplane *pixfmt,
> > > > > > > >  	pixfmt->num_planes =3D info->mem_planes;
> > > > > > > > =20
> > > > > > > >  	if (info->mem_planes =3D=3D 1) {
> > > > > > > > +		u32 bytesperline, sizeimage =3D 0;
> > > > > > > > +
> > > > > > > >  		plane =3D &pixfmt->plane_fmt[0];
> > > > > > > > -		plane->bytesperline =3D ALIGN(width, v4l2_format_block_w=
idth(info, 0)) * info->bpp[0];
> > > > > > > > -		plane->sizeimage =3D 0;
> > > > > > > > +		bytesperline =3D ALIGN(width, v4l2_format_block_width(in=
fo, 0)) * info->bpp[0];
> > > > > > > > =20
> > > > > > > >  		for (i =3D 0; i < info->comp_planes; i++) {
> > > > > > > >  			unsigned int hdiv =3D (i =3D=3D 0) ? 1 : info->hdiv;
> > > > > > > > @@ -576,10 +577,17 @@ int v4l2_fill_pixfmt_mp(struct v4l2_p=
ix_format_mplane *pixfmt,
> > > > > > > >  			aligned_width =3D ALIGN(width, v4l2_format_block_width(=
info, i));
> > > > > > > >  			aligned_height =3D ALIGN(height, v4l2_format_block_heig=
ht(info, i));
> > > > > > > > =20
> > > > > > > > -			plane->sizeimage +=3D info->bpp[i] *
> > > > > > > > -				DIV_ROUND_UP(aligned_width, hdiv) *
> > > > > > > > -				DIV_ROUND_UP(aligned_height, vdiv);
> > > > > > > > +			sizeimage +=3D info->bpp[i] *
> > > > > > > > +				     DIV_ROUND_UP(aligned_width, hdiv) *
> > > > > > > > +				     DIV_ROUND_UP(aligned_height, vdiv);
> > > > > > > >  		}
> > > > > > > > +
> > > > > > > > +		/*
> > > > > > > > +		 * The user might have specified custom sizeimage/bytesp=
erline,
> > > > > > > > +		 * only override them if they're not big enough.
> > > > > > > > +		 */
> > > > > > > > +		plane->sizeimage =3D max(sizeimage, plane->sizeimage);
> > > > > > > > +		plane->bytesperline =3D max(bytesperline, plane->bytespe=
rline);
> > > > > > >=20
> > > > > > > Let's just set bytesperline, ignoring the value the user supp=
lied. There are very
> > > > > > > few drivers that allow the user to set bytesperline anyway, s=
o it's not a big deal
> > > > > > > to drop support for that for now. We can add it back later.
> > > > > > >=20
> > > > > > > Just add a comment that a user-defined bytesperline value isn=
't currently supported.
> > > > > >=20
> > > > > > Kieran recently ran into an issue related to this, when sharing=
 buffers
> > > > > > between a CSI-2 receiver and an ISP. The ISP has alignment cons=
traints
> > > > > > in both the horizontal and vertical directions on the line stri=
de and
> > > > > > total image size. Out software framework currently allocates bu=
ffers
> > > > > > from the CSI-2 receiver which doesn't have those constraints, a=
nd not
> > > > > > being able to specify sizeimage is thus a problem.
> > > > >=20
> > > > > Not being able to specify sizeimage where? From userspace? Sorry,=
 I don't
> > > > > quite understand the specific issue here.
> > > >=20
> > > > Yes, from userspace.
> > >=20
> > > Ah, OK. But why not use CREATEBUFS? You can provide your own size whe=
n allocating
> > > the buffers.
> > >=20
> > > Also note this patch: https://patchwork.linuxtv.org/patch/55656/
> > >=20
> > > Although this is specific for compressed formats.
> >=20
> > While this work for compressed formats, it does not do anything for raw
> > image horizontal padding. The importation bit of V4L2 is pretty
> > difficult, so if we add helpers, we should load the way and simplify
> > things for userspace rather then enforcing the existing difficulty.
> >=20
> > I think from now own we should design with the mindset that a DMABuf
> > that cannot be imported back into another driver due to software
> > limitations is a useless waste of FD.
>=20
> I agree, but I feel that this is part of the new fmt and streaming
> ioctls project that Boris started. Doing further hacking of the existing =
API
> is just complicating matters even more.
>=20
> Creating new format ioctls that are much more flexible in describing imag=
e
> formats (and closer to drm where possible) seems to be the right approach=
.
>=20
> Hmmm... "waste of FD": Face Detection? File Descriptor? Probably not.
>=20
> The urbandictionary doesn't help either: https://www.urbandictionary.com/=
define.php?term=3DFD
>=20
> No idea what FD means :-), although I get the sentiment.

I was not swearing. An FD on Unix systems like Linux is also well know
as a File Descriptor. DMABuf, memfd, an open file, etc.

regards,
Nicolas

>=20
> Regards,
>=20
> 	Hans
>=20

--=-yEjoGGMsbnF9v99MRnEu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXNWgQQAKCRBxUwItrAao
HOX2AKCZZogx/e+z8hoV2BV/L1iPqNyNgwCglC9UIw2gaCh2F73xSghYer0xUjQ=
=Gm4Z
-----END PGP SIGNATURE-----

--=-yEjoGGMsbnF9v99MRnEu--

