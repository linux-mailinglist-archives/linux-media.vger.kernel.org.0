Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84E4369F2DC
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 11:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbjBVKnM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 05:43:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbjBVKnL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 05:43:11 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 035262BF03
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 02:43:09 -0800 (PST)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 326BB1BF215;
        Wed, 22 Feb 2023 10:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1677062588;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=w15XMuIo0Mr5frPVdQZygcsiedXqfhLVljOtB3007iU=;
        b=LzqZvOcHflDDc1ygHdJ6rvprTP8rXyX38/5gnYr2bdK/PBk3/9Op2bWNRpDFSgkNHlmUNt
        NS9L3ZSkoDN2E9+tg372GDeT4bplKQQVGB70CAqgDM6gvnGTWeJLofF2RRvUWUqxfZUiqw
        gVDZY/weyFXQWiSVZfd2Finixnpe6Y/xOIWhLF0Zxqoa5Ndz45Q1FasDLHm87v0PoAAuEw
        l/L95fyEO6W9Cz69/EX805d2YfAxRzZqkEPm3j9gCeXS4+emSB2Rjejh4eO1h4HgthHb3T
        q7IxN6DonGVBym9EOIt1WOokv0wb19DLdVv3Tal3Jo1ipAm+1zL/oCH1q9tvfg==
Date:   Wed, 22 Feb 2023 11:43:06 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     adam@piggz.co.uk, linux-media@vger.kernel.org,
        yong.deng@magewell.com, mchehab@kernel.org,
        linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/3] media: sun6i-csi: implement vidioc_enum_framesizes
Message-ID: <Y/XxuqtQ+RiANngZ@aptenodytes>
References: <20230106194038.16018-1-adam@piggz.co.uk>
 <20230106194038.16018-4-adam@piggz.co.uk>
 <Y7iwR3W5RiQ2K+Ip@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pZJD/d0ZMeQ5vF/E"
Content-Disposition: inline
In-Reply-To: <Y7iwR3W5RiQ2K+Ip@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--pZJD/d0ZMeQ5vF/E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat 07 Jan 23, 01:35, Laurent Pinchart wrote:
> Hi Adam,
>=20
> Thank you for the patch.
>=20
> On Fri, Jan 06, 2023 at 07:40:38PM +0000, adam@piggz.co.uk wrote:
> > From: Adam Pigg <adam@piggz.co.uk>
> >=20
> > Create sun6i_csi_capture_enum_framesizes which defines the min
> > and max frame sizes
>=20
> With the commit message updated (see review of 1/3),
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'm always a bit confused regarding how such an ioctl's behavior should dep=
end
on the attached subdev. Is it well-defined behavior that this here is only
about the receiver part and has nothing to do with what the connected senso=
r?

> > Signed-off-by: Adam Pigg <adam@piggz.co.uk>
> > ---
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >=20
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c=
 b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > index 54beba4d2b2f..2be761e6b650 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> > @@ -739,6 +739,29 @@ static int sun6i_csi_capture_try_fmt(struct file *=
file, void *private,
> >  	return 0;
> >  }
> > =20
> > +static int sun6i_csi_capture_enum_framesizes(struct file *file, void *=
fh,
> > +					  struct v4l2_frmsizeenum *fsize)

A cosmetic/consistency suggestion would be to name this variable "frmsize" =
to
reuse part of the name of the structure, which is what I've done in other p=
laces
of the driver.

Cheers,

Paul

> > +{
> > +	const struct sun6i_csi_capture_format *format;
> > +
> > +	if (fsize->index > 0)
> > +		return -EINVAL;
> > +
> > +	format =3D sun6i_csi_capture_format_find(fsize->pixel_format);
> > +	if (!format)
> > +		return -EINVAL;
> > +
> > +	fsize->type =3D V4L2_FRMSIZE_TYPE_CONTINUOUS;
> > +	fsize->stepwise.min_width =3D SUN6I_CSI_CAPTURE_WIDTH_MIN;
> > +	fsize->stepwise.max_width =3D SUN6I_CSI_CAPTURE_WIDTH_MAX;
> > +	fsize->stepwise.min_height =3D SUN6I_CSI_CAPTURE_HEIGHT_MIN;
> > +	fsize->stepwise.max_height =3D SUN6I_CSI_CAPTURE_HEIGHT_MAX;
> > +	fsize->stepwise.step_width =3D 1;
> > +	fsize->stepwise.step_height =3D 1;
> > +
> > +	return 0;
> > +}
> > +
> >  static int sun6i_csi_capture_enum_input(struct file *file, void *priva=
te,
> >  					struct v4l2_input *input)
> >  {
> > @@ -775,6 +798,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_captur=
e_ioctl_ops =3D {
> >  	.vidioc_g_fmt_vid_cap		=3D sun6i_csi_capture_g_fmt,
> >  	.vidioc_s_fmt_vid_cap		=3D sun6i_csi_capture_s_fmt,
> >  	.vidioc_try_fmt_vid_cap		=3D sun6i_csi_capture_try_fmt,
> > +	.vidioc_enum_framesizes		=3D sun6i_csi_capture_enum_framesizes,
> > =20
> >  	.vidioc_enum_input		=3D sun6i_csi_capture_enum_input,
> >  	.vidioc_g_input			=3D sun6i_csi_capture_g_input,
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--pZJD/d0ZMeQ5vF/E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmP18boACgkQ3cLmz3+f
v9EWYgf7BD4C1MPAlmcXb6R5UmcCjQrgdhwtU/IqjRy4ShscyT8pucIRo+Ev6ZCp
UnWxibMjfmAHs6hTVtFv8gPyhOOEPqb95Ez4+G9fm9Olxh4l9EWdtngylHPlYH8p
CfG0nu8G3KdrX5uJHgguZJX1lek9AytFyGZRlHIFq10CqIKDmfVjSAZR2NGYRQEY
jVw6Npp+6Wv/3ZLHr/OOCg+E2zmhbThzWvH1wm9uro4vJ3h6sVKE6hIQFM+jId9F
tprpMQdRhlX/tLvNzkWBZ3Y6HhKYljBtcgE1ZMzlZO69EivE1U8kgAvYUm4UEyMu
ELZa26EKK6QTB+nRAanoRNUtHPi47Q==
=BgDg
-----END PGP SIGNATURE-----

--pZJD/d0ZMeQ5vF/E--
