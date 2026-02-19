Return-Path: <linux-media+bounces-53095-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD7VMuokl2mZvAIAu9opvQ
	(envelope-from <linux-media+bounces-53095-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 15:57:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DDD15FDB5
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 15:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9336A305F643
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 14:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63DF341076;
	Thu, 19 Feb 2026 14:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bEJtpgY+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157F230FC0A;
	Thu, 19 Feb 2026 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771513014; cv=none; b=ewq525AJLqOtGF8855eJeQJaSn9qdCujGzLDbeki5HlJS2EoX6mVHk4oJDXmudTejFVR7Z2HpKLY/evH7Z+ko+Tg0+gvvh4sbuRD6qDQhxJqv/qfGkJsMhv6IrqiyUwSWs/+P116/0NkL8iWpS1ZnS4mNyuwIbNZmhIMUHKgGt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771513014; c=relaxed/simple;
	bh=s26NhBWk5Q9LQ2O/BRMQ12CeQYEqXO5aNaWPI6vqIGc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=bXgat2k7GNbXRqxCJdSOe9A4ggDIji2wwX5ReZe8yEyIixpJD+4sMouCnsSXEjnBeF0FT0szy3kEppG/FAKT7aEPNKdJO/HdwqbemtKXsy+UUPCCa+mW9sb6Ht9JTnNczwbDPQXztQA1xT3rDw2bQjUeRsgQSSdqwyxnEwOhBLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bEJtpgY+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:320d:fec:f64:f37:a9c9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 584A74D3;
	Thu, 19 Feb 2026 15:55:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771512956;
	bh=s26NhBWk5Q9LQ2O/BRMQ12CeQYEqXO5aNaWPI6vqIGc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bEJtpgY+6tmvMi0WEttl/0vCgOCV2ZYgApkgng7gMwgJ+T0GNzDaCPRBtAskojFjE
	 Z6ULyUDIczGq7ZFIA1HiLf3SeCGIu9KPiO3TC7SbnuBcCGWcV2KrnKbVX3oG2YwVKh
	 0QFoDAcMNGawZK0YYR8Qp4VRIMj3JQgDsFQzeEQo=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aZbdDqjogHqRvQYY@kekkonen.localdomain>
References: <20260219-media-fps-docs-v1-1-0387c5c5368c@ideasonboard.com> <aZbdDqjogHqRvQYY@kekkonen.localdomain>
Subject: Re: [PATCH] media: Documentation: Fix frame interval calculation for raw camera sensors
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 19 Feb 2026 20:26:43 +0530
Message-ID: <177151300381.14753.2751982828623249475@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53095-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 56DDD15FDB5
X-Rspamd-Action: no action

Hi Sakari,

Thanks for the review.

Quoting Sakari Ailus (2026-02-19 15:21:10)
> Hi Jai,
>=20
> Thanks for the patch.
>=20
> On Thu, Feb 19, 2026 at 01:20:50PM +0530, Jai Luthra wrote:
> > The previous frame interval formula used analogue crop dimensions. This
> > breaks down for some sensors when binning.
> >=20
> > For example in imx219 the minimum FLL (frame length in lines) can be
> > lower than the analogue crop height when binning, which would require a
> > negative VBLANK to represent the actual timing. Similarly, imx283 allows
> > a lower minimum HMAX (line length) when doing 2x2 or 3x3 binning than
> > the analogue crop width of the full resolution mode.
>=20
> V4L2 integer controls are signed so using negative numbers is a non-issue.
> CCS already does this in some cases actually.
>=20

Ah, I see. Control being negative was not the only problem, as it would
also diverge from what sensors and applications already do, but I see you
agreed on that below :-)

I'll update the commit message to make this clear(er).

> >=20
> > The CCS specification also describes under section "8.2.6 Line Length
> > and Frame Length" how the horizontal and vertical readout minimums can
> > be different when binning.
> >=20
> > Replace the formula with the underlying hardware concepts of LLP (line
> > length in pixels) and FLL (frame length in lines). These terms were
> > chosen to match the CCS specification on raw sensors, as it is a cleaner
> > reference compared to a typical sensor vendor datasheet.
> >=20
> > Finally, define the blanking controls relative to the active pixel
> > readout (post-binning) rather than the analogue crop size. This matches
> > what most sensor drivers already do, and also what applications like
> > libcamera expect. In "Figure 42" of CCS specification too, we see a
> > similar definition:
> >=20
> >   frame interval =3D (output width + HBLANK) *
> >                    (output height + VBLANK) / pixel rate
> >=20
> > Also add a note in the "Writing camera sensor drivers" guide, to ensure
> > this formula is followed by new sensor drivers.
>=20
> We're about to require implementing the common raw sensor model soon by
> essentially all new drivers so documenting the soon-to-be-obsolete state
> has limited benefits.

Makes sense.

>=20
> But the UAPI documentation remains relevant for quite some time, please s=
ee
> my comments below.
>=20
> >=20
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  Documentation/driver-api/media/camera-sensor.rst   | 11 ++++
> >  .../userspace-api/media/drivers/camera-sensor.rst  | 59 ++++++++++++++=
+-------
> >  2 files changed, 53 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documen=
tation/driver-api/media/camera-sensor.rst
> > index 94bd1dae82d5c570b2d11c7faee20dd45d2f4be6..8dcac7551f54ac4ffa71173=
281ae3bbea331c036 100644
> > --- a/Documentation/driver-api/media/camera-sensor.rst
> > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > @@ -120,6 +120,17 @@ The function returns a non-zero value if it succee=
ded getting the power count or
> >  runtime PM was disabled, in either of which cases the driver may proce=
ed to
> >  access the device.
> > =20
> > +Frame interval
> > +--------------
> > +
> > +If a sensor supports cropping or binning, it is the sensor driver's
> > +responsibility to ensure that the frame interval formula (see
> > +:ref:`media_using_camera_sensor_drivers`) remains valid regardless of =
the
> > +pipeline configuration. The driver shall adjust the minimum and maximu=
m allowed
> > +values of ``V4L2_CID_HBLANK`` and ``V4L2_CID_VBLANK`` as needed when t=
he mode
> > +changes, so that application developers can always rely on the same fo=
rmula to
> > +calculate the frame interval.
> > +
> >  Rotation, orientation and flipping
> >  ----------------------------------
> > =20
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rs=
t b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index 75fd9166383fdbb2dabdb6384ed0904c4e78a3c6..30dddea72a12da264fc9c30=
e37b561c762c09d29 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -49,35 +49,60 @@ depends on the type of the device.
> >  Raw camera sensors
> >  ~~~~~~~~~~~~~~~~~~
> > =20
> > -Instead of a high level parameter such as frame interval, the frame in=
terval is
> > -a result of the configuration of a number of camera sensor implementat=
ion
> > -specific parameters. Luckily, these parameters tend to be the same for=
 more or
> > -less all modern raw camera sensors.
> > +Instead of a high level parameter such as frame interval, the frame in=
terval on
> > +a raw camera sensor is determined by a number of sensor-specific param=
eters.
> > +These parameters tend to be common across most modern raw camera senso=
rs.
> > =20
> > -The frame interval is calculated using the following equation::
> > +The pixel array is the full grid of photosensitive elements on the sen=
sor. A
>=20
> s/sensor/camera sensor/
>=20

Will fix.

> > +subregion of it is selected by the analogue crop. The cropped image ma=
y then be
> > +subject to binning (averaging of a NxN block) or subsampling which
> > +further reduce the image dimensions. The resulting image is then read =
out by
> > +the ADC (analogue-to-digital converter) line by line. After ADC readou=
t,
> > +optional digital crop or scaling may further reduce the image dimensio=
ns, see
> > +:ref:`VIDIOC_SUBDEV_G_SELECTION <VIDIOC_SUBDEV_G_SELECTION>`.
> > =20
> > -     frame interval =3D (analogue crop width + horizontal blanking) *
> > -                      (analogue crop height + vertical blanking) / pix=
el rate
> > +The frame size is determined by two timing parameters: line length in =
pixels
> > +(LLP) and frame length in lines (FLL). These are fundamental sensor ti=
ming
> > +registers that control how fast the ADC reads out the image. They may =
go
> > +by different names for a particular sensor, like HMAX and VMAX, or HTO=
TAL and
> > +VTOTAL, or similar.
> > =20
> > -The formula is bus independent and is applicable for raw timing parame=
ters on
> > -large variety of devices beyond camera sensors. Devices that have no a=
nalogue
> > -crop, use the full source image size, i.e. pixel array size.
> > +LLP is the total number of pixel clock cycles per line, including both=
 the
> > +active readout width and horizontal blanking. FLL is the total number =
of lines
> > +per frame, including both the active readout height and vertical blank=
ing.
> > +
> > +The frame interval is::
> > +
> > +        frame interval =3D LLP * FLL / pixel rate
>=20
> How would this look like if you spell out LLP and FLL? The rest aren't
> abbreviated either.

        frame interval =3D (line length in pixels) *
                         (frame length in lines) / pixel rate

This reads much easier, thanks for the suggestion, will update it in v2.

>=20
> > =20
> >  Horizontal and vertical blanking are specified by ``V4L2_CID_HBLANK`` =
and
> >  ``V4L2_CID_VBLANK``, respectively. The unit of the ``V4L2_CID_HBLANK``=
 control
> >  is pixels and the unit of the ``V4L2_CID_VBLANK`` is lines. The pixel =
rate in
> > -the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` i=
n the same
> > -sub-device. The unit of that control is pixels per second.
> > +the sensor's **pixel array** is specified by ``V4L2_CID_PIXEL_RATE`` i=
n the
> > +same sub-device. The unit of that control is pixels per second.
> > +
> > +The blanking is defined relative to the size of the image being sent o=
ut to the
> > +host over the bus (like CSI-2)::
> > +
> > +        LLP =3D active width + V4L2_CID_HBLANK
> > +        FLL =3D active height + V4L2_CID_VBLANK
> > +
> > +The driver shall set the minimum and maximum values of ``V4L2_CID_HBLA=
NK`` and
> > +``V4L2_CID_VBLANK`` such that the resulting LLP and FLL values corresp=
ond to the
> > +range permitted by the sensor hardware for the current mode. Sensors t=
hat
> > +support binning often define a lower minimum for LLP or FLL registers,=
 which
> > +can help achieve higher framerates when binning.
> > +
> > +Application developers can calculate the frame interval using the outp=
ut
> > +dimensions and the blanking controls::
> > +
> > +        frame interval =3D (output width + horizontal blanking) *
> > +                         (output height + vertical blanking) / pixel r=
ate
>=20
> This is indeed what many presumably non-CCS sensor drivers implement. Are
> there any that would use the crop rectangle (the imx219 doesn't seem to)?
> For user space variance in this area is of course bad.

I am not aware of any, but I haven't checked all drivers.

The ones I checked (IMX219, IMX283, IMX335, OV5647, OV5640), all set:
[h/v]blank =3D [h/v]total - mode->[width/height]

So IMO updating the documentation to match that is simpler.

> The common raw sensor model introduces two new controls for the purpose so
> we could re-purpose the old VBLANK/HBLANK controls for this -- apart from
> the CCS driver.
>=20

I guess that's my final cue to finally take out time and read that series
properly :-)

Thanks,
    Jai

> > =20
> >  Register list-based drivers need to implement read-only sub-device nod=
es for the
> >  purpose. Devices that are not register list based need these to config=
ure the
> >  device's internal processing pipeline.
> > =20
> > -The first entity in the linear pipeline is the pixel array. The pixel =
array may
> > -be followed by other entities that are there to allow configuring binn=
ing,
> > -skipping, scaling or digital crop, see :ref:`VIDIOC_SUBDEV_G_SELECTION
> > -<VIDIOC_SUBDEV_G_SELECTION>`.
> > -
> >  USB cameras etc. devices
> >  ~~~~~~~~~~~~~~~~~~~~~~~~
> > =20
> >=20
> > ---
> > base-commit: 956b9cbd7f156c8672dac94a00de3c6a0939c692
> > change-id: 20260219-media-fps-docs-fd1da722cc38
> >=20
> > Best regards,
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus

