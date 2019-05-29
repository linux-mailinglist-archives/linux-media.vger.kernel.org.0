Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CABC52DF12
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 16:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727471AbfE2OCp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 10:02:45 -0400
Received: from casper.infradead.org ([85.118.1.10]:51628 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727445AbfE2OCo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 10:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=DzWIwTHRXYowZ370y2QK4BpFgTP2UTXGBlIiUm4zAP4=; b=f6dyF6mLf9voR8Rq30jhEZGUQR
        4Z1xXXTdUW2Yb0vWwej9nxCrRWliRCVOUIdB6vTEsB2ebjIRweAyQJfo5K9AmAkTX86HB8x4uR2N3
        1TMLhl6gd5w+m7JXDeqn6V4S3rkpwjylMEOMmFvsjyuByKfDjgU6JRD/zhIZxspdLlPWmQG5mbwk1
        HoCUCLxKhKcTAerDKizfZPcT07p1vueKKS6wkmN+vYwXJRSYxFG0bNQAUBom4Hd0OjBHFGU/JdR1q
        PvUS6/TYkMh0LsBEwmpkHC/fWDNEB2IvnoYU5ORIPgKe8ATCGObMoPpFASCX3npzWiyav+lUz5I42
        /ky/ksQw==;
Received: from 177.132.232.81.dynamic.adsl.gvt.net.br ([177.132.232.81] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hVzA7-0001ls-LQ; Wed, 29 May 2019 14:02:40 +0000
Date:   Wed, 29 May 2019 11:02:33 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com, Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v6 03/16] media: v4l2-common: Support custom imagesize
 in fill_pixfmt()
Message-ID: <20190529110233.0ff81aff@coco.lan>
In-Reply-To: <4ef64e22f4035fccf09fbb7f0be04a9778b1230d.camel@collabora.com>
References: <20190528170232.2091-1-ezequiel@collabora.com>
        <20190528170232.2091-4-ezequiel@collabora.com>
        <20190529082809.0b9f3553@coco.lan>
        <4ef64e22f4035fccf09fbb7f0be04a9778b1230d.camel@collabora.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 29 May 2019 09:54:09 -0400
Nicolas Dufresne <nicolas.dufresne@collabora.com> escreveu:

> Hi Mauro,
>=20
> Le mercredi 29 mai 2019 =C3=A0 08:28 -0300, Mauro Carvalho Chehab a =C3=
=A9crit :
> > Em Tue, 28 May 2019 14:02:19 -0300
> > Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> >=20
> > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > >=20
> > > Users can define custom sizeimage as long as they're big enough to
> > > store the amount of pixels required for a specific width/height under=
 a
> > > specific format. Avoid overriding those fields in this case.
> > >=20
> > > We could possibly do the same for bytesperline, but it gets tricky wh=
en
> > > dealing with !MPLANE definitions, so this case is omitted for now and
> > > ->bytesperline is always overwritten with the value calculated in
> > > fill_pixfmt().
> > >=20
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > ---
> > > Changes from v5:
> > > * Overwrite bytesperline with the value calculated in fill_pixfmt()
> > >=20
> > > Changes from v4:
> > > * New patch
> > >=20
> > >  drivers/media/v4l2-core/v4l2-common.c | 58 ++++++++++++++++++++-----=
--
> > >  1 file changed, 43 insertions(+), 15 deletions(-)
> > >=20
> > > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4=
l2-core/v4l2-common.c
> > > index b2d1e55d9561..fd286f6e17d7 100644
> > > --- a/drivers/media/v4l2-core/v4l2-common.c
> > > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > > @@ -585,9 +585,9 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mp=
lane *pixfmt,
> > >  	pixfmt->num_planes =3D info->mem_planes;
> > > =20
> > >  	if (info->mem_planes =3D=3D 1) {
> > > +		u32 sizeimage =3D 0;
> > > +
> > >  		plane =3D &pixfmt->plane_fmt[0];
> > > -		plane->bytesperline =3D ALIGN(width, v4l2_format_block_width(info,=
 0)) * info->bpp[0];
> > > -		plane->sizeimage =3D 0;
> > > =20
> > >  		for (i =3D 0; i < info->comp_planes; i++) {
> > >  			unsigned int hdiv =3D (i =3D=3D 0) ? 1 : info->hdiv;
> > > @@ -598,10 +598,21 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_=
mplane *pixfmt,
> > >  			aligned_width =3D ALIGN(width, v4l2_format_block_width(info, i));
> > >  			aligned_height =3D ALIGN(height, v4l2_format_block_height(info, i=
));
> > > =20
> > > -			plane->sizeimage +=3D info->bpp[i] *
> > > -				DIV_ROUND_UP(aligned_width, hdiv) *
> > > -				DIV_ROUND_UP(aligned_height, vdiv);
> > > +			sizeimage +=3D info->bpp[i] *
> > > +				     DIV_ROUND_UP(aligned_width, hdiv) *
> > > +				     DIV_ROUND_UP(aligned_height, vdiv);
> > >  		}
> > > +
> > > +		/* Custom bytesperline value is not supported yet. */
> > > +		plane->bytesperline =3D ALIGN(width,
> > > +					    v4l2_format_block_width(info, 0)) *
> > > +				      info->bpp[0];
> > > +
> > > +		/*
> > > +		 * The user might have specified a custom sizeimage, only
> > > +		 * override it if it's not big enough.
> > > +		 */
> > > +		plane->sizeimage =3D max(sizeimage, plane->sizeimage);
> >=20
> > No upper limit? That doesn't sound a good idea to me, specially since s=
ome
> > (broken) app might not be memset the format to zero before filling the =
ioctl
> > structure.
> >=20
> > Perhaps we could do something like:
> >=20
> > 		sizeimage =3D min (sizeimage, 2 * plane->sizeimage)
> >=20
> > or something similar that would be reasonable.
> >=20
> > >  	} else {
> > >  		for (i =3D 0; i < info->comp_planes; i++) {
> > >  			unsigned int hdiv =3D (i =3D=3D 0) ? 1 : info->hdiv;
> > > @@ -613,10 +624,19 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_=
mplane *pixfmt,
> > >  			aligned_height =3D ALIGN(height, v4l2_format_block_height(info, i=
));
> > > =20
> > >  			plane =3D &pixfmt->plane_fmt[i];
> > > -			plane->bytesperline =3D
> > > -				info->bpp[i] * DIV_ROUND_UP(aligned_width, hdiv);
> > > -			plane->sizeimage =3D
> > > -				plane->bytesperline * DIV_ROUND_UP(aligned_height, vdiv);
> > > +
> > > +			/* Custom bytesperline value is not supported yet. */
> >=20
> > Supporting custom bytesperline seems too risky of breaking apps.=20
> > So, I would drop this comment.
>=20
> We will really need this in the long run in many drivers in order to
> allow import/export of DMABuf. Without such adaptive feature, we have a
> software limitation that forces bouncing memory. I have already
> discussed about adding this feature notably in vivid and uvcvideo on
> IRC and in conference, which both have no restriction the memory
> alignment, so should allow importing any kind of video layout.
>=20
> We already have a partial userspace implementation for this in
> GStreamer and upstream driver submission should come when the IP is
> considered stable enough.

I understand the need. I'm not against an implementation for such
feature, provided that it won't break anything.

I guess one of the things we miss at V4L2 API is an indication from
userspace about what it supports. I mean, just like we have the
caps flags where the Kernel reports what it supports, we could have
a similar "userspace caps"  field.

> Why I think it won't break userspace is that the correct way to use
> these read-only members of V4L2 struct is to set these to 0, which is
> also documented.

Yeah, the apps I'm aware of usually call memset() before filling
V4L2 structs. On those, adding this behavior would be ok. Yet,
I'm not sure if 100% of (open source) apps do that.

> Adding upper bound seems like a good idea though.

Agreed.

>=20
>
Thanks,
Mauro
