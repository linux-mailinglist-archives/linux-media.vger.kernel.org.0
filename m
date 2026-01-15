Return-Path: <linux-media+bounces-50818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AE7D28A10
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 22:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 141063010566
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 21:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F2132694F;
	Thu, 15 Jan 2026 21:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HInm4W39"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDEF326935
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 21:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511183; cv=none; b=EdjLuYP2Z7M0vEQZUS6XzYW2Y+LtJ/zxRCoR2lDQlvWTfxhTOaHqWEWZAANvnGGP2bJ9lSTuYY9DORhm9gYwqMO8sEn0lDoAPchBhrjmGlbLZiVLeNQn19uhGsH+Qa2eje/IL4WH/2MfGVMeplIYbMixe3w2O1BmH3ADpgAxh5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511183; c=relaxed/simple;
	bh=fAvByjJSBcsicYOldjfz6Z+p0KjsHA/GAyEmHx//WnM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Km6fENSh6uv3V8dP8RVandY1BzXMY0lQwYIpymVFhMIXV+o8knw4nXz2tePtyReZWyca5hxHLWXB7nKxOMydEBslKGkbdczYR+GP0D7DrRGIqUShyvdmDC8zgtTVBcfwpr+i/8f9817/7p+9ucBQnJCo4bRBGJaGLbPdFq5HVSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HInm4W39 reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:3333:77cb:788c:b5ec])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2DCC8316;
	Thu, 15 Jan 2026 22:05:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768511147;
	bh=fAvByjJSBcsicYOldjfz6Z+p0KjsHA/GAyEmHx//WnM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HInm4W39nbx2E6VFY0Z1UFg5WJO3D3eWrn/YKLoNS76aWF2WNnTdNLOCLaS1UJEb9
	 aK4POBY5vIKiQZM4sOsA2Q4BMMkOkkPKyDBNgi7agU21gACkSObpbc1hNapUNmPOjG
	 qaglBdnRXq7Ln4G0+3X2qzaPxvK+om4xtztTzgts=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aWjXzDXLxG7YyCY6@kekkonen.localdomain>
References: <aM1J9LsbpueEr30x@kekkonen.localdomain> <aN4lQPK5Mqve2bUI@kekkonen.localdomain> <kblfpuqfj2d6vkagspnqdhztno2js3wljdrsv2wpeywuwyzg5x@xt7rjhh5wt76> <r3kv25lxbyjtuufb2ze27wp5gbqnbgnps2ytk2gy2qkaeiijdd@ydn4ptkze2qp> <aN_MdmDhQPyLnQqD@kekkonen.localdomain> <zq3gzieoqd4eieghjetm6sus5s7i6niplommnubl4d4rskbhra@v7gslcsg5hce> <mseqfltfao5jqubs22asrzzrj2tnsf5bdmlvsmncwj4ss3gxmu@wk2lmramiy3a> <176008954951.211618.7730648133265251067@localhost> <176009379794.935713.4919963263447609305@ping.linuxembedded.co.uk> <aWjXzDXLxG7YyCY6@kekkonen.localdomain>
Subject: Re: [PATCH v11 39/66] media: Documentation: Add subdev configuration models, raw sensor model
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <"meh di.djait"@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 15 Jan 2026 22:06:11 +0100
Message-ID: <176851117186.98704.5427092951514812674@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Hi Sakari,

Quoting Sakari Ailus (2026-01-15 13:04:28)
> Hi Kieran, Stefan, Jacopo,
>=20
> On Fri, Oct 10, 2025 at 11:56:37AM +0100, Kieran Bingham wrote:
> > Quoting Stefan Klug (2025-10-10 10:45:49)
> > > Hi Sakari, hi Jacopo,
> > >=20
> > > Quoting Jacopo Mondi (2025-10-07 16:01:11)
> > > > Hi again Sakari,
> > > >    cc Kieran and Stefan
> > > >=20
> > > > Stefan and Kieran brought to my attention a use case I would like to
> > > > discuss with you
> > > >=20
> > > > On Fri, Oct 03, 2025 at 03:25:19PM +0200, Jacopo Mondi wrote:
> > > > > Hi Sakari,
> > > > >
> > > > > On Fri, Oct 03, 2025 at 04:15:34PM +0300, Sakari Ailus wrote:
> > > > > > Hi Jacopo,
> > > > >
> > > > > [snip]
> > > > >
> > > > > > > >
> > > > > > >
> > > > > > > A recent discussion on libcamera made me wonder a few things
> > > > > > >
> > > > > > > https://patchwork.libcamera.org/patch/24547/
> > > > > > >
> > > > > > > In the current world (pre-RAW sensor model) the situation can=
 be
> > > > > > > summarized as
> > > > > > >
> > > > > > > TGT_NATIVE_SIZE =3D full pixel array (readable and non readab=
le)
> > > > > > > TGT_CROP_BOUNDS =3D readable pixel array (visible and non vis=
ibile pixels)
> > > > > >
> > > > > > Crop bounds is generally the same as native size.
> > > > > >
> > > > >
> > > > > I checked two sensors datasheet for this yesterday and both of th=
em
> > > > > had parts of the pixel array that cannot be read out
> > > > >
> > > > > > > TGT_CROP_DEFAULT =3D visible pixels
> > > > > >
> > > > > > The default could exclude not-so-great pixels, too.
> > > > > >
> > > > >
> > > > > ok, suggested pixel array area used for image capture purposes th=
en
> > > > >
> > > > > > > TGT_CROP =3D analgoue crop
> > > > > >
> > > > > > This could include digital crop as well.
> > > > > >
> > > > >
> > > > > Yes it might, not all sensor drivers behaves the same indeed
> > > > >
> > > > > > >
> > > > > > > where:
> > > > > > > - visibile =3D pixels used for image capture purpose
> > > > > > > - non-visible =3D optically black, dummies etc
> > > > > > >
> > > > > > > With the RAW sensor model:
> > > > > > >
> > > > > > > format(1/0) =3D readable pixel array (visible and non visible)
> > > > > > > TGT_CROP_DEFAULT(1/0) =3D visible pixel area
> > > > > > > TGT_CROP(1/0) =3D analogue crop
> > > > > > > TGT_COMPOSE(1/0) =3D binning/skipping
> > > > > > >
> > > > > > > Have we lost the ability to report the full pixel array size =
(readable
> > > > > > > and not readable) ? Is this intentional ? As if pixels cannot=
 be read
> > > > > > > out they basically do no exist, and the information on the ac=
tual
> > > > > > > number of pixels (including non readable ones) should be kept
> > > > > > > somewhere else (like the libcamera sensor properties database=
) ?
> > > > > >
> > > > > > I'd keep this information in the user space if needed. There's =
little
> > > > > > software could presumably do with this information.
> > > > > >
> > > > >
> > > > > Agreed, there is no value I can think of in having this informati=
on in
> > > > > drivers
> > > > >
> > > >=20
> > > > So, Kieran and Stefan are working with a sensor whose driver was
> > > > initially upstreamed with a wrong "readable pixel array"
> > > > (TGT_CROP_BOUNDS). The developer later realized there was more of t=
he
> > > > pixel array to read and there was a use for the non-image pixels li=
ke
> > > > OB ones.
> > > >=20
> > > > With the current model this is fine (sort of), as all rectangles are
> > > > expressed with the TGT_NATIVE size reference. TGT_BOUNDS might
> > > > increases but TGT_CROP_DEFAULT and TGT_CROP are still valid both in=
 the
> > > > driver but also in userspace, which might have encoded some known
> > > > "tested" configurations.
> > > >=20
> > > > With the new model we lose the information reported by TGT_NATIVE a=
nd
> > > > all rectangles will be expressed with the format on 1/0 as referenc=
e.
> > > > If the format changes because we later find out there were portions=
 of
> > > > the pixel array that could have been read out, all other rectangles
> > > > will have to change as well, both in the driver (which is ok-ish) b=
ut
> > > > also in userspace, which we have no control on.
> > > >=20
> > > > Stefan and Kieran could elaborate more on this, but basically, the
> > > > physical array is the only fixed reference we could actually count =
on.
> > > > Other rectangles, are subject to the driver developer understanding=
 of
> > > > how the device work, which as we know very well, can change over ti=
me.
> > > >=20
> > > > Now, if you agree this is something to be concerned on, I presume t=
he
> > > > fix is quite easy
> > > >=20
> > > >          format(1/0) =3D physical pixel array size
> > > >          TGT_CROP_BOUNDS(1/0) =3D readable pixel array (visible and=
 non visible)
> > > >          TGT_CROP_DEFAULT(1/0) =3D visible pixel area
> > > >          TGT_CROP(1/0) =3D analogue crop
> > > >          TGT_COMPOSE(1/0) =3D binning/skipping
> > > >=20
> > > > which basically only require re-introducing the use of CROP_BOUNDS =
in
> > > > the RAW camera model specification.
> > >=20
> > > Thanks Jacopo for writing that up. Maybe a little addition on that
> > > matter. To our (especially Kierans) experience all the rectangles tend
> > > to be unexpectedly difficult to handle when you try to configure the
> > > sensors in a pixel perfect manner (having binned and non binned modes
> > > cover exactly the same area in all possible flipping configurations).
> > > The datasheets I'm aware of use the physical pixel array as common
> > > coordinate system to describe the geometry. Adding the readable pixel
> > > array as "artificial" coordinate system makes it difficult to match t=
he
> > > values reported by a v4l driver with the datasheets at hand.
> > >=20
> > > Another time where this comes into play is lens shading correction wh=
ere
> > > you would want to describe the LSC against one reference coordinate
> > > system that ideally never ever changes.
> > >=20
> > > To add to the confusion I'd love to have another rectangle added to t=
he
> > > list. I don't have a proper name for it. The intent would be to
> > > distinguish between the "readable pixel array" and the "light exposed
> > > pixel array". So the list would become:
> > >=20
> > >     format(1/0) =3D physical pixel array size
> > >     TGT_CROP_BOUNDS(1/0) =3D readable pixel array (visible and non vi=
sible)
> > >     TGT_CROP_VISIBLE(1/0) =3D visible pixel area including "flesh" fo=
r ISP
>=20
> Carnivorous ISPs?

Yes, beware! :-)

>=20
> > >     TGT_CROP_DEFAULT(1/0) =3D Recommended "good" pixels
>=20
> How often is this known? Or would you rely on what the vendor tells?

We had a brief discussion about that internally. Some datasheets contain
that information by surrounding the "Recording area" with a margin
labeled as "Effective margin for color processing". I don't have numbers
how often that is the case though. As it doesn't add much technical
value to the kernel we could set TGT_CROP_DEFAULT to the above mentioned
TGT_CROP_VISIBLE and keep the information about the color processing
margin outside the kernel, e.g. in libcamera.

The only downside I see there is that (to my knowledge) it will be
difficult to guarantee that really all the pixels inside
TGT_CROP_VISIBLE are good. That's ok for libraries like libcamera that
will default to cutting off some margin after processing, but it might
be a problem for simple applications that just try capture the
CROP_DEFAULT. But maybe these applications do not exist at all :-)

>=20
> > >     TGT_CROP(1/0) =3D analogue crop
> > >     TGT_COMPOSE(1/0) =3D binning/skipping
> > >=20
> > > The idea is to be able to capture a larger image from the sensor for =
ISP
> > > processing and then cut it down to CROP_DEFAULT. This way we can prev=
ent
> > > interpolation seams at the edges. Maybe the naming is bad and we shou=
ld
> > > make CROP_BOUNDS the recommended area and add CROP_READABLE to denote
> > > the readable pixels...
>=20
> CROP_BOUNDS really needs to be the bounding rectangle for everything.
> CROP_DEFAULT and NATIVE_SIZE are still up to definition, to a degree.
>=20
> Have you tried capturing the optical black pixels on different sensors?

Yes, we did at least on the imx335 and imx283. Kieran is more in the
details there...

>=20
> CCS specifies optical black pixel capture separately from the visible
> pixels and support also different VC, DT, depending on sensor capabilitie=
s;
> cropping results in capturing optical black pixel on the rows and columns
> specified for the crop area. In other words, the selection API isn't
> necessarily how optical black pixel capture is configured, at least for
> CCS.

Yes, that is a bit of a pain. Being able to select the VC or DT doesn't
make things easier. Some SoCs (e.g. imx8mp) are not able to capture
separate VCs or DTs. So to get to the information the only way is to go
through the image stream. Also for some use-cases like extra long
exposures in astro-photography it might be useful to have the OB in the
image data for postprocessing.  (The last case is a bit made up as I
don't know much about astro-photography tbh).=20

So I believe we should keep the option to capture OB over the image
stream.

>=20
> Let's assume the case of the sensor where you find, after the driver has
> been upstreamed, that there are extra columns and rows of pixels beyond t=
he
> left and top of the image. How would you modify the selection rectangles
> and the format to allow capturing image data from that area? Can you avoid
> affecting the existing userspace?

That would mean that the TGT_CROP_BOUNDS and or TGT_CROP_DEFAULT
changes. The assumption is that the native coordinate system (the old
TGT_CROP_NATIVE_SIZE) stays in place so the application can still use
all the tuning that was done relative to the native coordinate system.
As the TGT_CROP_BOUNDS from the first version has top/left coordinates >
0 there is room to enlarge the TGT_CROP_BOUNDS in that direction.

Sure, this does not work if the initial driver didn't specify
TGT_CROP_BOUNDS with the correct top/left offset. It also does not guard
against really wrong datasheets or arbitrary bugs. But allows to
transparently improve in situations where the first version implements
the "default FullHD setup from the vendor" and later a improved version
of the driver allows access to the additional margins around.

Best regards,
Stefan

>=20
> >=20
> > I think this is important - and in IMX283 - it seems to be exactly what
> > the datasheet is ultimately recommending.
> >=20
> > > > What do you think ?
> > >=20
> > > Best regards,
> > > Stefan
> > >=20
> > > >=20
> > > > > > >
> > > > > > > All the discussion about readable/non-readable, visible/non-v=
isibile
> > > > > > > and active and inactive areas make me think we would benefit =
from
> > > > > > > presenting a small glossary at the beginning of the "Sensor p=
ixel
> > > > > > > array size, cropping and binning" paragraph ?
> >=20
> > Oh yes, some sort of nicely interpretable description of "this rectangle
> > is expected to be this equivalent set of pixels" would be helpful. I've
> > found it so hard to identify which the right rectangle is here :D
> >=20
> >=20
> > I'm also weary that we might need to find a way to convey the
> > relationship between binning mode restrictions/offsets too.
> >=20
> > The IMX283 2x2 and 3x3 binning modes produce offset outputs:
> >=20
> > vwinpos is the coordinate programmed to the sensor to get a position -
> > and we have tooling in camshark that lets us determine the exact pixels
> > we capture from any mode to see what was really produced by the sensor:
> >=20
> >=20
> > ```
> > 'Sensor Native' ?
> > pixel (row)   -8 -7 -6 -5 -4 -3 -2 -1  0  1  2  3  4  5  6  7  8  9  10=
 11 12 13 14 15 16
> > native pixels  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | =
 |  |  |  |  |  |
> >=20
> >=20
> > vwinpos       -4    -3    -2    -1     0     1     2     3     4     5 =
    6     7     8
> > no-binning     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | =
 |  |  |  |  |  |
> >=20
> >=20
> > vwinpos             -3          -2          -1           0           1 =
          2     =20
> > /2 binning     |     |     |     |     |     |     |     |     |     | =
    |     |     |
> >=20
> >=20
> > vwinpos        0                 1                 2                 3 =
                4
> > /3 binning     |        |        |        |        |        |        | =
       |        |
> > ```
> >=20
> >=20
> > To fix this - I'm moving the current '0' position for IMX283 to -2 in
> > the non binned modes.
> >=20
> > That gives me a coordinate system where at least I can define an
> > alignment for 2x2 and 3x3 binning every 12 pixels (as the lowest common
> > multiplier).
> >=20
> > But - also murkies the water from the above rectanges as this sensor
> > turns out to have 48 lines of pixels (24 bayer pair lines) 'less than
> > zero' ... or at least those are the ones that are visible in light. I
> > can read further below zero but only for black pixels.
> >=20
> > So in otherwords - I can't even make a corresponding coordinate
> > rectangle that exactly matches the 'all readable' pixels or 'all
> > illuminated pixels' ... Ayeeeeee...
> >=20
> > My lesson/take on this: Don't trust the datasheets. They lie :D
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus
>

