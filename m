Return-Path: <linux-media+bounces-61806-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO7SHg15CGpvrAMAu9opvQ
	(envelope-from <linux-media+bounces-61806-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 16:02:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D891C55BFDC
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 16:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 173D3300CC3D
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 14:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9893D3D08;
	Sat, 16 May 2026 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nJPqpPGP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB9221FF2E;
	Sat, 16 May 2026 14:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778940156; cv=none; b=Dwz34boukSLbc5f71GIAHG7jVt3km0nPBkCTqQctMI5XzFZx8tGN4pZOSPOG4FUQzwCeey7Eam/txhqJRhI/Dhqgr6FlvUjFxoeB+rNYybei8Gcm4pPsK/rz6D9QDgZX0IxB6XSJXgwBAaAZ7yuyXj3a8KY6tBXpEa4jxRyQQa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778940156; c=relaxed/simple;
	bh=/MGhmNGd58Y8tUBcNrPN7bRt88SN7DcrRjossZzLX6Q=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=X3ifMfIdx70Q8cmAFJ0AELszzc8N49U+cFQO0ubVo13yVOUwbMGUJyPcWVi8mkoWUEaUx8rSVSZV5X98P7COqDfwrtLdPCki6mdGKgCdiYazFmTIJbgEMPtOWICb68t1OQBVX8cid+YT7qFJ8R4QOEu/C+Q19pblefu6OH0xRkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nJPqpPGP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1543B229;
	Sat, 16 May 2026 16:02:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778940142;
	bh=/MGhmNGd58Y8tUBcNrPN7bRt88SN7DcrRjossZzLX6Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nJPqpPGPKlaMbO1UbuAPM0Su5/L2GQHSD5bsSBZ+tN0k7JySES9/jW9RZ2vdiBkAG
	 gArqXqzGi5v3S9eaGIQ6yAeZZ9CzTvIL7SNxP2XN1NqGX0YSmUfdlHV+s+c8HuJKvX
	 mlvxW0VatYyRbNlilbGip1E4tc0EuuD9weD9bPwE=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <177873553195.34645.15555914837036171264@freya>
References: <20260513-imx678-v1-0-30fc593ed8fa@ideasonboard.com> <20260513-imx678-v1-2-30fc593ed8fa@ideasonboard.com> <CAPY8ntBi88-dd2HxxftErf8h5-ERRPcGy5KJ-+oF7jawNOJpuA@mail.gmail.com> <177873553195.34645.15555914837036171264@freya>
Subject: Re: [PATCH 2/2] media: i2c: imx678: Add driver for Sony IMX678
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Sat, 16 May 2026 19:32:27 +0530
Message-ID: <177894014786.34645.15432488649235816946@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Queue-Id: D891C55BFDC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61806-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Quoting Jai Luthra (2026-05-14 10:42:11)
> Hi Dave
>=20
> Thank you for the review.
>=20
> Quoting Dave Stevenson (2026-05-13 23:58:32)
> > Hi Jai
> >=20
> > I think Soho Enterprises sent me an IMX678 module a while back, so
> > I'll try and track it down and test the driver out.
> >=20
> > A couple of comments based on a quick read though.
> >=20
> > On Wed, 13 May 2026 at 16:42, Jai Luthra <jai.luthra@ideasonboard.com> =
wrote:
> > >
> > > Add a V4L2 subdev driver for the Sony IMX678 image sensor.
> > >
> > > IMX678 is a diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type
> > > solid-state image sensor with a square pixel array and 8.40 M effecti=
ve
> > > pixels.
> > >
> > > The following features are supported by the driver:
> > > - Monochrome and Color (Bayer filter) variants
> > > - Multiple input clock frequencies supported
> > > - Multiple link frequencies supported
> > > - VBLANK and HBLANK control for variable framerate
> > > - Freely configurable resolution through S_FMT ioctl
> > > - Freely configurable crop through S_SELECTION ioctl
> > > - 2x2 binning configurable via S_FMT/S_SELECTION APIs
> > > - VFLIP and HFLIP control for flipping readout
> > > - Test pattern control support
> > > - Exposure and gain control
> > > - MIPI RAW12 output
> > >
> > > Following features are not currently supported but may be added later:
> > > - Pixel-perfect crop reporting, account for the shift-by-1 when flipp=
ing
> > >   using HFLIP/VFLIP, which maintains the bayer readout order
> > > - Increased framerate (lower HMAX/VMAX) when cropping
> > > - MIPI RAW10 output mode
> > > - Embedded data stream
> > >
> > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

[snip]

> > > +
> > > +static u64 imx678_output_pixel_rate(struct imx678 *imx678)
> > > +{
> > > +       const u32 lane_count =3D imx678->lane_count;
> > > +       const u64 link_freq =3D link_freqs[imx678->link_freq_idx];
> > > +       const u8 bpp =3D 12;
> > > +       u64 numerator =3D link_freq * 2 * lane_count;
> > > +
> > > +       do_div(numerator, bpp);
> >=20
> > I don't believe the pixel rate changes with link frequency or bit
> > depth, and plausibly you're ending up with the same number every time.
> >=20
> > Reading the Software Reference Manual (rev 7.0), Section 4 "Operating M=
ode".
> > 2 lanes at 1440Mbit/s/lane 10bpp 25fps readout requires 1H period
> > (HMAX) of 1320, and 1V period (VMAX) of 2250.
> > 2 lanes at 1782Mbit/s/lane 12bpp 25fps readout requires 1H period
> > (HMAX) of 1320, and 1V period (VMAX) of 2250.
> > So there is no change in HMAX or VMAX when changing bit depth, so
> > pixel rate must be the same.
> > You can get away with a lower link frequency as there is less data to s=
end.
> >=20
> > 4 lanes at 720Mbit/s/lane 10bpp 25fps readout requires 1H period
> > (HMAX) of 1320, and 1V period (VMAX) of 2250.
> > So again no change with number of lanes and link frequency.
> >=20
> >=20
> > Potentially coincidence, but if you play with the numbers from the
> > 12bit readout mode:
> > 2 lanes at 1782Mbit/s/lane 12bpp 25fps readout requires 1H period
> > (HMAX) of 1320, and 1V period (VMAX) of 2250.
> >=20
> > 1782Mbits/lane * 2 lanes / 12bpp / 25fps =3D 11,880,000Pixel_clocks/fra=
me.
> > 11880000 / 2250 (VMAX) =3D 5280, which so happens to be exactly 1320 (H=
MAX) * 4
>=20
> Good find! You're right the FPS is only tied to 1H/1V period in that tabl=
e,
> so pixel rate should be independent of lane/linkrate/bpp.
>=20
> I'll update this in v2, and cleaner blanking calculation will anyway be
> useful to support higher FPS (lower hblank) when doing cropping. It would
> be ideal if I manage to figure out the minimum HMAX programmatically for
> each link rate/crop so the table can be dropped.
>=20
> >=20
> > If you define the pixel rate as 297MPix/s (1782*2/12), treat the
> > HBLANK and VBLANK controls in the normal manner, but write HMAX as
> > (width + hblank / 4), I believe you'll find all the numbers fall out
> > to perfectly match the datasheet.
> >=20

The trouble with 4x was that it resulted in negative blankings for higher
link frequency 4-lane modes.

The Operation Mode section also runs at 60FPS with 4 lanes of 1728Mbps,
where (1728M * 4 / 12 / 60)/2250 =3D 4400 which matches 550 (HMAX) * 8.

So I've ended up with 8x ratio, i.e. pixel rate of 594MPix/s. I'll post v2
with that.

> > This is the approach I found worked for IMX415 (needed /12) and IMX662
> > (needed /3).
> >=20
> > > +
> > > +       return numerator;
> > > +}
> > > +

[snip]

Thanks,
    Jai

