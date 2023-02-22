Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3876C69F2D6
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 11:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbjBVKju (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 05:39:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbjBVKjt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 05:39:49 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211B8367F8
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 02:39:45 -0800 (PST)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id B24321C000B;
        Wed, 22 Feb 2023 10:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1677062384;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0fhR9aPzPWzSJIphFbiZLm6maASMrppR5tQ4aVuAgts=;
        b=JxucMadDtg+Wy5a+aCbwMeK9Cr//78hr8HUQqXcAQkXCwlLh42biDWlMz75DOpefYe6erY
        OtoMDMH7P0nC1ugkyuCEgZsSg5SVG5vZvqlFQYL8q4N7RNRmYwUzqTRFwhVtUCeO3JaJ3A
        c0dp4X/gPILYp/P4I19TNp5T6bkKsc8NQVaBNlWfS0eoTvVlmW1ie1CPmgARRQUOeuUMvm
        woQD/o4gkutmMyjcHOh0ujfI/7CCmSbF+w1t2PLQhgSXmwwlj9N8apyPqpMcM2vV0D8Af3
        NBb9LjZkIxaHmANwkHBl6Ef2dNWQ7eNVoMBKEZG6mwU8mRFf3Xk5HYBDyO6AAQ==
Date:   Wed, 22 Feb 2023 11:39:42 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Adam Pigg <adam@piggz.co.uk>, linux-media@vger.kernel.org,
        yong.deng@magewell.com, mchehab@kernel.org,
        linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/3] media: sun6i-csi: merge sun6i_csi_formats and
 sun6i_csi_formats_match
Message-ID: <Y/Xw7lsKOYFqaZEw@aptenodytes>
References: <20230106194038.16018-1-adam@piggz.co.uk>
 <20230106194038.16018-2-adam@piggz.co.uk>
 <Y7ivZC2e0TZtbASV@pendragon.ideasonboard.com>
 <5905587.lOV4Wx5bFT@192-168-1-215>
 <Y7sm4ZbAoBhuhmP/@pendragon.ideasonboard.com>
 <Y+/FUICC58w10rNJ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xmo6U0mRgEJu4lvq"
Content-Disposition: inline
In-Reply-To: <Y+/FUICC58w10rNJ@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--xmo6U0mRgEJu4lvq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Adam, Laurent,

On Fri 17 Feb 23, 20:20, Laurent Pinchart wrote:
> Could you share your opinion on the question below ?

Yeah sorry for the long delay here. It's taken me a while to dive back into
this topic.

My first impression is that I would rather be in favor of keeping a dynamic
approach like what's already in sun6i_csi_capture_link_validate and extract
the mbus/pixfmt matching logic from there.

I would be happy to craft a patch in that direction, but maybe you'd like
to have a try at it (since it's your series). Just let me know, I think I c=
an
do it pretty quickly now that I have everything back in mind. I could also
add some comment about the general hardware mechanism/limitations.

The hardware is a bit odd in a few ways and I found that the explicit
combinatory approach wasn't a very good fit (but obviously that's an open t=
opic
for discussions).

The general idea is that the SUN6I_CSI_INPUT_FMT_YUV420/422 can only be used
to produce outputs on 2 or 3 planes, but not packed YUV. There's also no
explicit hardware reordering of the chroma components, so we need to lie ab=
out
the input order (input_yuv_seq_invert) to achieve inverted chroma components
on the output format.

In order to produce packed data, we can only rely on SUN6I_CSI_INPUT_FMT_RAW
which provides no reordering mechanism. This is why it made good sense to me
to only have an explicit matching table for this case and rely on more gene=
ral
logic that reflects the hardware capabilities otherwise.

> On Sun, Jan 08, 2023 at 10:26:09PM +0200, Laurent Pinchart wrote:
> > On Sun, Jan 08, 2023 at 06:23:56PM +0000, Adam Pigg wrote:
> > > On Friday, 6 January 2023 23:31:48 GMT Laurent Pinchart wrote:
> > > > On Fri, Jan 06, 2023 at 07:40:36PM +0000, adam@piggz.co.uk wrote:

[...]

> > > > > +#define SUN6I_BUS_FMTS(fmt...) (const u32[]) {fmt, 0}

Cosmetic suggestion to stay consistent with the rest:
#define SUN6I_CSI_CAPTURE_MBUS_CODES(mbus_codes...) \
	(const u32[]) { mbus_codes, 0 }

Also it would look better in sun6i_csi_capture.h.

But really I would be happier with a dynamic approach.

[...]

> > > > >  	/* YUV422 */
> > > > >  	{
> > > > >=20
> > > > > @@ -123,6 +139,8 @@ static const struct sun6i_csi_capture_format
> > > > > sun6i_csi_capture_formats[] =3D {>=20
> > > > >  		.output_format_field	=3D  SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > > > >  		.input_format_raw	=3D true,
> > > > >  		.hsize_len_factor	=3D 2,
> > > > >=20
> > > > > +		.mbus_codes		=3D  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > +							  MEDIA_BUS_FMT_YUYV8_1X16),
> > > > >=20
> > > > >  	},
> > > > >  	{
> > > > >  =09
> > > > >  		.pixelformat		=3D V4L2_PIX_FMT_YVYU,
> > > > >=20
> > > > > @@ -130,6 +148,8 @@ static const struct sun6i_csi_capture_format
> > > > > sun6i_csi_capture_formats[] =3D {>=20
> > > > >  		.output_format_field	=3D  SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > > > >  		.input_format_raw	=3D true,
> > > > >  		.hsize_len_factor	=3D 2,
> > > > >=20
> > > > > +		.mbus_codes		=3D  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_YVYU8_2X8,
> > > > > +							  MEDIA_BUS_FMT_YVYU8_1X16),
> > > > >=20
> > > > >  	},
> > > > >  	{
> > > > >  =09
> > > > >  		.pixelformat		=3D V4L2_PIX_FMT_UYVY,
> > > > >=20
> > > > > @@ -137,6 +157,8 @@ static const struct sun6i_csi_capture_format
> > > > > sun6i_csi_capture_formats[] =3D {
> > > > >  		.output_format_field	=3D  SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > > > >  		.input_format_raw	=3D true,
> > > > >  		.hsize_len_factor	=3D 2,
> > > > >=20
> > > > > +		.mbus_codes		=3D  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
> > > > > +							  MEDIA_BUS_FMT_UYVY8_1X16),
> > > > >=20
> > > > >  	},
> > > > >  	{
> > > > >  =09
> > > > >  		.pixelformat		=3D V4L2_PIX_FMT_VYUY,
> > > > >=20
> > > > > @@ -144,57 +166,68 @@ static const struct sun6i_csi_capture_format
> > > > > sun6i_csi_capture_formats[] =3D {>=20
> > > > >  		.output_format_field	=3D  SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > > > >  		.input_format_raw	=3D true,
> > > > >  		.hsize_len_factor	=3D 2,
> > > > >=20
> > > > > +		.mbus_codes		=3D  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_VYUY8_2X8,
> > > > > +							  MEDIA_BUS_FMT_VYUY8_1X16),
> > > > >=20
> > > > >  	},
> > > > >  	{
> > > > >  =09
> > > > >  		.pixelformat		=3D V4L2_PIX_FMT_NV16,
> > > > >  		.output_format_frame	=3D  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422SP,
> > > > >  		.output_format_field	=3D  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422SP,
> > > > >=20
> > > > > +		.mbus_codes		=3D 0,
> > > >=20
> > > > I don't think this is correct. To produce semi-planar or multi-plan=
ar
> > > > YUV formats, I believe the CSI needs YUV input. This should thus be
> > > > (unless I'm mistaken)

You are correct.

> > > >=20
> > > > 		.mbus_codes		=3D  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8,
> > > > 							  MEDIA_BUS_FMT_UYVY8_1X16,
> > > > 							  MEDIA_BUS_FMT_VYUY8_2X8,
> > > > 							  MEDIA_BUS_FMT_VYUY8_1X16,
> > > > 							  MEDIA_BUS_FMT_YUYV8_2X8,
> > > > 							  MEDIA_BUS_FMT_YUYV8_1X16,
> > > > 							  MEDIA_BUS_FMT_YVYU8_2X8,
> > > > 							  MEDIA_BUS_FMT_YVYU8_1X16),
> > > >=20
> > > > and same below.

All of the YUV420/422 pixel formats on 2 or 3 planes can take all of the
supports packed 16-bit YUV bus formats, which is why it doesn't seem very
graceful to have an explicit list.

> > > >=20
> > > Hi Laurent
> > >=20
> > > Thanks for the help and tips.  Ive made all the other changes, which =
can be=20
> > > viewed here until i resubmit them https://github.com/sailfish-on-dont=
beevil/
> > > kernel-megi/commits/pinephone-libcamera
> > >=20
> > > Im just not quite sure on this one.  I think my implementation of mer=
ging the=20
> > > arrays keeps the previous mapping right?  In sun6i_csi_capture_format=
_matches=20
> > > there is no mapping for the *NV formats, and the remaining ones ive s=
et to 0?
> >=20
> > The current implementation allows writing multi-planar formats (e.g.
> > NV12) to memory when the input of the CSI is a YUV media bus format
> > (e.g. YUYV8_1X16). This patch doesn't change that, but it will prevent
> > NV12 from being enumerated when using media bus-based enumeration of
> > pixel formats, so userspace won't see NV12 as being available.
> >=20
> > It would be fine fixing that issue in a separate patch on top of this
> > one, but I though you could as well do both in one go.
>=20
> Adam, you mentioned that NV12 and NV16 "don't work". Could you elaborate
> and explain what you've tried exactly ?

We definitely need to keep the ability to produce NV12, NV16 and friends fr=
om
YUV bus formats.

> > > > Paul, could you confirm this ?
> > > >=20
> > > > I'm a bit surprised that the CSI can't shuffle the YUV components f=
or
> > > > packed YUYV formats, but so be it if that's a hardware limitation.

Yep that is correct, it's a hardware limitation.

Cheers,

Paul

> > > > I'm also thinking that a subsequent patch could drop the raw check =
=66rom
> > > > sun6i_csi_capture_link_validate():
> > > >=20
> > > > -	/* With raw input mode, we need a 1:1 match between input and  ou=
tput. */
> > > > -	if (bridge_format->input_format =3D=3D SUN6I_CSI_INPUT_FMT_RAW ||
> > > > -	    capture_format->input_format_raw) {
> > > > -		match =3D sun6i_csi_capture_format_match(pixelformat,
> > > > -						        fmt.format.code);
> > > > -		if (!match)
> > > > -			goto invalid;
> > > > -	}
> > > > +	/* Make sure the media bus code and pixel format are compatible. =
*/
> > > > +	match =3D sun6i_csi_capture_format_match(pixelformat,  fmt.format=
=2Ecode);
> > > > +	if (!match)
> > > > +		goto invalid;
> > > >=20
> > > > >  	},
> > > > >  	{
> > > > >  =09
> > > > >  		.pixelformat		=3D V4L2_PIX_FMT_NV61,
> > > > >  		.output_format_frame	=3D  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422SP,
> > > > >  		.output_format_field	=3D  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422SP,
> > > > >  		.input_yuv_seq_invert	=3D true,
> > > > >=20
> > > > > +		.mbus_codes		=3D 0,
> > > > >=20
> > > > >  	},
> > > > >  	{
> > > > >  =09
> > > > >  		.pixelformat		=3D V4L2_PIX_FMT_YUV422P,
> > > > >  		.output_format_frame	=3D  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV422P,
> > > > >  		.output_format_field	=3D  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV422P,
> > > > >=20
> > > > > +		.mbus_codes		=3D 0,
> > > > >=20
> > > > >  	},
> > > > >  	/* YUV420 */
> > > > >  	{
> > > > >  =09
> > > > >  		.pixelformat		=3D V4L2_PIX_FMT_NV12_16L16,
> > > > >  		.output_format_frame	=3D  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420MB,
> > > > >  		.output_format_field	=3D  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420MB,
> > > > >=20
> > > > > +		.mbus_codes		=3D 0,
> > > > >=20
> > > > >  	},
> > > > >  	{
> > > > >  =09
> > > > >  		.pixelformat		=3D V4L2_PIX_FMT_NV12,
> > > > >  		.output_format_frame	=3D  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420SP,
> > > > >  		.output_format_field	=3D  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420SP,
> > > > >=20
> > > > > +		.mbus_codes		=3D 0,
> > > > >=20
> > > > >  	},
> > > > >  	{
> > > > >  =09
> > > > >  		.pixelformat		=3D V4L2_PIX_FMT_NV21,
> > > > >  		.output_format_frame	=3D  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420SP,
> > > > >  		.output_format_field	=3D  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420SP,
> > > > >  		.input_yuv_seq_invert	=3D true,
> > > > >=20
> > > > > +		.mbus_codes		=3D 0,
> > > > >=20
> > > > >  	},
> > > > >  =09
> > > > >  	{
> > > > >  =09
> > > > >  		.pixelformat		=3D V4L2_PIX_FMT_YUV420,
> > > > >  		.output_format_frame	=3D  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420P,
> > > > >  		.output_format_field	=3D  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420P,
> > > > >=20
> > > > > +		.mbus_codes		=3D 0,
> > > > >=20
> > > > >  	},
> > > > >  	{
> > > > >  =09
> > > > >  		.pixelformat		=3D V4L2_PIX_FMT_YVU420,
> > > > >  		.output_format_frame	=3D  SUN6I_CSI_OUTPUT_FMT_FRAME_YUV420P,
> > > > >  		.output_format_field	=3D  SUN6I_CSI_OUTPUT_FMT_FIELD_YUV420P,
> > > > >  		.input_yuv_seq_invert	=3D true,
> > > > >=20
> > > > > +		.mbus_codes		=3D 0,
> > > > >=20
> > > > >  	},
> > > > >  	/* Compressed */
> > > > >  	{
> > > > >  =09
> > > > >  		.pixelformat		=3D V4L2_PIX_FMT_JPEG,
> > > > >  		.output_format_frame	=3D  SUN6I_CSI_OUTPUT_FMT_FRAME_RAW_8,
> > > > >  		.output_format_field	=3D  SUN6I_CSI_OUTPUT_FMT_FIELD_RAW_8,
> > > > >=20
> > > > > +		.mbus_codes		=3D  SUN6I_BUS_FMTS(MEDIA_BUS_FMT_JPEG_1X8),
> > > > >=20
> > > > >  	},
> > > > > =20
> > > > >  };
> > > > >=20
> > > > > @@ -210,118 +243,20 @@ struct sun6i_csi_capture_format
> > > > > *sun6i_csi_capture_format_find(u32 pixelformat)>=20
> > > > >  	return NULL;
> > > > > =20
> > > > >  }
> > > > >=20
> > > > > -/* RAW formats need an exact match between pixel and mbus format=
s. */
> > > > > -static const
> > > > > -struct sun6i_csi_capture_format_match sun6i_csi_capture_format_m=
atches[]
> > > > > =3D { -	/* YUV420 */
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_YUYV,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_YUYV8_2X8,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_YUYV,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_YUYV8_1X16,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_YVYU,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_YVYU8_2X8,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_YVYU,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_YVYU8_1X16,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_UYVY,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_UYVY8_2X8,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_UYVY,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_UYVY8_1X16,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_VYUY,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_VYUY8_2X8,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_VYUY,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_VYUY8_1X16,
> > > > > -	},
> > > > > -	/* RGB */
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_RGB565,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_RGB565_2X8_LE,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_RGB565X,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_RGB565_2X8_BE,
> > > > > -	},
> > > > > -	/* Bayer */
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_SBGGR8,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_SBGGR8_1X8,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_SGBRG8,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_SGBRG8_1X8,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_SGRBG8,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_SGRBG8_1X8,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_SRGGB8,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_SRGGB8_1X8,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_SBGGR10,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_SBGGR10_1X10,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_SGBRG10,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_SGBRG10_1X10,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_SGRBG10,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_SGRBG10_1X10,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_SRGGB10,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_SRGGB10_1X10,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_SBGGR12,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_SBGGR12_1X12,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_SGBRG12,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_SGBRG12_1X12,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_SGRBG12,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_SGRBG12_1X12,
> > > > > -	},
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_SRGGB12,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_SRGGB12_1X12,
> > > > > -	},
> > > > > -	/* Compressed */
> > > > > -	{
> > > > > -		.pixelformat	=3D V4L2_PIX_FMT_JPEG,
> > > > > -		.mbus_code	=3D MEDIA_BUS_FMT_JPEG_1X8,
> > > > > -	},
> > > > > -};
> > > > > -
> > > > >=20
> > > > >  static bool sun6i_csi_capture_format_match(u32 pixelformat, u32
> > > > >  mbus_code)
> > > > >  {
> > > > >=20
> > > > > -	unsigned int i;
> > > > > -
> > > > > -	for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches);=
 i++)  {
> > > > > -		const struct sun6i_csi_capture_format_match *match =3D
> > > > > -			&sun6i_csi_capture_format_matches[i];
> > > > > -
> > > > > -		if (match->pixelformat =3D=3D pixelformat &&
> > > > > -		    match->mbus_code =3D=3D mbus_code)
> > > > > -			return true;
> > > > > +	unsigned int i, j;
> > > > > +
> > > > > +	for (i =3D 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++) {
> > > > > +		const struct sun6i_csi_capture_format *format =3D
> > > > > +			&sun6i_csi_capture_formats[i];
> > > > > +
> > > > > +		if (format->pixelformat =3D=3D pixelformat) {
> > > > > +			for (j =3D 0; format->mbus_codes[j]; j++) {
> > > > > +				if (mbus_code =3D=3D format->mbus_codes[j])
> > > > > +					return true;
> > > > > +			}
> > > > > +		}
> > > > >=20
> > > > >  	}
> > > > >  =09
> > > > >  	return false;
> > > > >=20
> > > > > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_cap=
ture.h
> > > > > b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h index
> > > > > 3ee5ccefbd10..0484942834e3 100644
> > > > > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> > > > > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> > > > > @@ -27,11 +27,7 @@ struct sun6i_csi_capture_format {
> > > > >=20
> > > > >  	bool	input_yuv_seq_invert;
> > > > >  	bool	input_format_raw;
> > > > >  	u32	hsize_len_factor;
> > > > >=20
> > > > > -};
> > > > > -
> > > > > -struct sun6i_csi_capture_format_match {
> > > > > -	u32	pixelformat;
> > > > > -	u32	mbus_code;
> > > > > +	const u32 *mbus_codes;
> > > > >=20
> > > > >  };
> > > > > =20
> > > > >  #undef current
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--xmo6U0mRgEJu4lvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmP18O4ACgkQ3cLmz3+f
v9E5Kwf+OVGUoQDVCZ8yPwlXd4fUCw8R3jrEbTdhkZxUV2veapAU7qHrXHPrQL2j
R0Wt8V3TlikQ1trMT7TwTH7fCcdy9Vmha7pJGPO+MLwH419A+0WC8dU7oc3TAR9F
bz0aU92pTHIWwImcLxbc3cbRhs5tIcwZN5jQwFEl1ZluGlu5tJ5WH/x+pvwDzyUj
GHk6c+DY0q+/XQeinjZFLZyeJuSFtAI2rTRh4W0TDYC1uj43xfELoZtgtkPbMY09
/yLA4Eh/GyT4sUkggV8DGPI98zmyBlPvNtKS+ygWk+AX7phfOSveJ/s4Ac/yN8lX
uHK47NhWuqtWs2pe0y6VMN2UzOmwUQ==
=TcSY
-----END PGP SIGNATURE-----

--xmo6U0mRgEJu4lvq--
