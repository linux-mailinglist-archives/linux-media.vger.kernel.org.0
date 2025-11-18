Return-Path: <linux-media+bounces-47290-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E8FC699AA
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 14:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 94AB1383607
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7AA354AF5;
	Tue, 18 Nov 2025 13:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ftDsZ6RC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AEB3546E9;
	Tue, 18 Nov 2025 13:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763472469; cv=none; b=FQPYLAS3ZKJin/2xKY1GtpLyIxfu3zklq1lGvoEXIw9xJMLL0XzvcY0VzZ0BVRVObIDGuM3achGlMQ6SG0/EJb+MaAyD3xAU8U7spnhjRypsWMVJ62QCjyqAne5wnlKhQ6JTnaZ9Rw6xr3XPz2k7MIruOT4nbUMTbPgBGgX9JZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763472469; c=relaxed/simple;
	bh=Y1Q0s9/1a/2ogde0fl6iNvwOmP4x/JbwJCKCpYqVIkQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=DVhUjsh8b8pJknLoiIr3gtX0X9ptI43dET6nzof5OnQ9WZMcuqXoPd7f288BSHSZmsBxZR7cGIdvggzSaJ7jSx0qguDYjYxRgQG2GFmQbPidBAyRVddM/2FZpQpHKiSeSC+labJePRf17R/Bx3+SKmvZP0m2ruiCYhInk/sXsvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ftDsZ6RC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 195E11E33;
	Tue, 18 Nov 2025 14:25:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763472340;
	bh=Y1Q0s9/1a/2ogde0fl6iNvwOmP4x/JbwJCKCpYqVIkQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ftDsZ6RCOOJQUV0IRrmp35drpcPNpr129GWBDr+q2TqtO/qNLWXVpqAhp2Scb58Ig
	 IzDIVbdCLuSTJhpUWHtYJoKWxJ7gypvjrTCwGzYOG5vNGVNDszr7SoIlMu7Gtn6G5r
	 W6HQLpeVcJ3GD1p34p3feDCS7W0s/bXaGDFOrDdk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntA2TCf9FuB6Nk+On+y6N_PMuYPAOAr3Yx8YESwe4skWvw@mail.gmail.com>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com> <20251028-b4-rpi-ov5647-v1-13-098413454f5e@ideasonboard.com> <tca3pwpzwqokxpjlv5mjsf3mai6ojlwypve6np53vur4cojd3t@viistqpnzv25> <176346530691.268162.12757814341347187181@freya> <CAPY8ntA2TCf9FuB6Nk+On+y6N_PMuYPAOAr3Yx8YESwe4skWvw@mail.gmail.com>
Subject: Re: [PATCH 13/13] media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY control
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Ivan T. Ivanov <iivanov@suse.de>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 18 Nov 2025 18:57:37 +0530
Message-ID: <176347245796.268162.1039078457352251254@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Dave,

Quoting Dave Stevenson (2025-11-18 18:17:25)
> Hi Jacopo & Jai
>=20
> On Tue, 18 Nov 2025 at 11:28, Jai Luthra <jai.luthra@ideasonboard.com> wr=
ote:
> >
> > Hi Jacopo,
> >
> > Quoting Jacopo Mondi (2025-11-02 16:59:02)
> > > Hi Jai
> > >
> > > On Tue, Oct 28, 2025 at 12:57:24PM +0530, Jai Luthra wrote:
> > > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > >
> > > > The link frequency can vary between modes, so add it as a
> > > > control.
> > > >
> > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > > ---
> > > >  drivers/media/i2c/ov5647.c | 25 ++++++++++++++++++++++++-
> > > >  1 file changed, 24 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > > > index be0b96c4372ae0c6d8fc57280b195d6069dd7019..dea978305c3c8688197=
80f7f631b225f4c1e7756 100644
> > > > --- a/drivers/media/i2c/ov5647.c
> > > > +++ b/drivers/media/i2c/ov5647.c
> > > > @@ -97,6 +97,13 @@ static const char * const ov5647_supply_names[] =
=3D {
> > > >
> > > >  #define OV5647_NUM_SUPPLIES ARRAY_SIZE(ov5647_supply_names)
> > > >
> > > > +#define FREQ_INDEX_FULL              0
> > > > +#define FREQ_INDEX_VGA               1
> > > > +static const s64 ov5647_link_freqs[] =3D {
> > > > +     [FREQ_INDEX_FULL]       =3D 218500000,
> > >
> > > The full mode pixel rate is set to 87500000, which considering CSI-2
> > > DDR mode and the 2 lanes in use give me a link freq of 21875000.
> >
> > Indeed, I get the same value, will update.
>=20
> Agreed. I obviously lost a digit.
>=20
> > >
> > > Do you know where 218500000 comes from ? (it might be perfectly legit,
> > > I'm not questioning that).
> > >
> >
> > > > +     [FREQ_INDEX_VGA]        =3D 208333000,
> >
> > This value should be 137500000 if we do the same calculation using the
> > pixel rate for the VGA mode. But for the VGA mode, the sensor does 2x2
> > binning + 2x2 subsampling, which is quite a bit different than other mo=
des.
> >
> > https://docs.kernel.org/driver-api/media/tx-rx.html#pixel-rate mentions
> > that the pixel rate value calculated from the bus link frequency does n=
ot
> > necessarily have to match the PIXEL_RATE control value (which is for the
> > sensor's internal readout of pixels including blanking).
>=20
> Indeed you should never assume that pixel rate and link frequency are
> directly linked. So many sensors have separate PLLs for the pixel
> array vs the MIPI block.
>=20
> Having said that, OV5647 appears to use the same PLL for pixel clock
> and MIPI, although it does have a separate PLLADCLK which is
> presumably for the ADC.

Ah that's really helpful information, thanks.

>=20
> > Ultimately, these values are coming from the BSP where the CFE driver is
> > using the link frequency control to configure the DPHY-RX rate, so I th=
ink
> > it would be wiser to not reduce the VGA link frequency value, which may
> > cause issues with DPHY-RX latching. We can always fix it later if neede=
d.
>=20
> It's been a long time since I looked at these settings, but I do have
> a spreadsheet from Omnivision that gives clock frequencies based on
> register values.
> In my experience the link frequency isn't critical to be exactly right
> as it typically only sets up timeout ranges in the PHY. Even if the
> value is significantly out it will generally work just fine.
>=20
> VGA and full modes differ in register 0x3036 (SC_CMMN_PLL_MULTIPLIER)
> which alters all the timings.
>=20
> Running the numbers again, I get the VGA link frequency to be
> 145.8333MHz, but also the pixel rate to be 58.333MPix/s vs 55 in the
> driver. I don't recall the VGA mode being 6% out on frame rate and
> exposure setup, so I can't quite square that with reality. I'll try to
> find 10 minutes to confirm, unless either of you happen to have one
> set up and could validate the frame times.
>=20

Running 640x480 capture with default hblank/vblank I get frames at
62.49fps.

58333000/(1852*504) =3D 62.4946

So 58.333MPix/s seems to be the correct value instead of 55MPix/s.

I had already sent a v2, so I'll wait till next -rc1 is tagged for any
more comments, and will update these values in v3.

Thanks,
Jai

>   Dave
>=20

[snip]

