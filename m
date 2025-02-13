Return-Path: <linux-media+bounces-26122-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75799A3405D
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 14:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71E1416A3FE
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 13:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD89227EB9;
	Thu, 13 Feb 2025 13:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="W2R8s45M"
X-Original-To: linux-media@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5382123F427
	for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 13:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739453242; cv=none; b=lWrwOUKFJ9quYaNnxZf5UjTIgE3SZPBAP4rKPijQie9F7k4e8/25oIKQ0k8I9CYY73eqlFtJPiHhs+NdTNLa4+EChb7GZyJhX339KKD67mV3zVJGW/eMtTvYNYkp6rz40K8gtEaLjDcsYNhEiu2XSo3GiemIsnH6nKR11KC3oDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739453242; c=relaxed/simple;
	bh=PETh38ePI29EJVHzrw4elbMK85jko6m6w3+fzKkGw4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Njl5kfug3d3KzkOMZaiTKeQIIGWJpAKN3WvICGIEwv9u+hhgo0bEjjPvEKOiPvSmZDpOs1A6UiduT5s/frskElz7DH6GQ02ESwxEqAbWSm4xs2O8d0t8hZPEGKMoVfuoN3bDQiKSZfmGQ32bJHoErGpt9Gh5Ir+xLo8SPLOMN1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=W2R8s45M; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 13 Feb 2025 18:56:45 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739453226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WzD/OC0ZByBLmQNngbMt1lFnaeNPGOwTY+A25jppGVo=;
	b=W2R8s45M6Rdy6DBdhwhHWEe0Nrz/vcqTmXF6dPeS95nppgNdSxB9JUX13KftJDHnEbQMDI
	R5cKlCH/iBFqLictE1CBrp49paOvXv9OV2Rroy4RuM7gDaJyOS6wv8KDZTl1gy4YyUaGlV
	ZQnZAJJLwDI6ePm7MAWUuXlGnD+dBBo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mripard@kernel.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devarsht@ti.com, vaishnav.a@ti.com, 
	r-donadkar@ti.com, u-kumar1@ti.com
Subject: Re: [RFC PATCH 3/3] media: ti: j721e-csi2rx: Add support for
 VIDIOC_LOG_STATUS
Message-ID: <nvyplkcl74rpe7zl2vprfztaivlmwvrsrwyrqw7lbvbeij5ubt@4dehnb7j6ona>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250212131244.1397722-1-y-abhilashchandra@ti.com>
 <20250212131244.1397722-4-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s4c7q4omkexuyfrp"
Content-Disposition: inline
In-Reply-To: <20250212131244.1397722-4-y-abhilashchandra@ti.com>
X-Migadu-Flow: FLOW_OUT


--s4c7q4omkexuyfrp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 3/3] media: ti: j721e-csi2rx: Add support for
 VIDIOC_LOG_STATUS
MIME-Version: 1.0

Hi Abhilash,

On Wed, Feb 12, 2025 at 06:42:44PM +0530, Yemike Abhilash Chandra wrote:
> The VIDIOC_LOG_STATUS ioctl outputs the current status of a device to the
> kernel log. When this ioctl is called on a video device, the current
> implementation queries the log status for all connected subdevices in the
> media pipeline.
>=20

What is the benefit of doing this for a video node? The user can directly=
=20
check the status on the cdns-csi2rx subdev for CSI errors.

As far as I understand, the video node corresponds to a particular stream, =
but=20
the cdns-csi2rx source pad is shared for all video nodes, so it will report=
=20
the total errors seen for all video nodes in multi-camera scenarios.

This approach will also give you v4l2 control handler status from a few=20
sensors (like OV5640) that implement the ioctl using=20
v4l2_ctrl_subdev_log_status(), which is probably just noise for the case wh=
ere=20
a user wants to check for stream errors.

> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 6412a00be8ea..946704458fee 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -377,6 +377,15 @@ static int ti_csi2rx_enum_framesizes(struct file *fi=
le, void *fh,
>  	return 0;
>  }
> =20
> +static int ti_csi2rx_log_status(struct file *file, void *fh)
> +{
> +	struct ti_csi2rx_dev *csi =3D video_drvdata(file);
> +
> +	v4l2_device_call_all(&csi->v4l2_dev, 0, core, log_status);
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_ioctl_ops csi_ioctl_ops =3D {
>  	.vidioc_querycap      =3D ti_csi2rx_querycap,
>  	.vidioc_enum_fmt_vid_cap =3D ti_csi2rx_enum_fmt_vid_cap,
> @@ -393,6 +402,7 @@ static const struct v4l2_ioctl_ops csi_ioctl_ops =3D {
>  	.vidioc_expbuf        =3D vb2_ioctl_expbuf,
>  	.vidioc_streamon      =3D vb2_ioctl_streamon,
>  	.vidioc_streamoff     =3D vb2_ioctl_streamoff,
> +	.vidioc_log_status	=3D ti_csi2rx_log_status,
>  };
> =20
>  static const struct v4l2_file_operations csi_fops =3D {
> --=20
> 2.34.1
>=20

Thanks,
Jai

--s4c7q4omkexuyfrp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmet8xUACgkQQ96R+SSa
cUWkRw/9Fha7996M+iSt4Hze7iS/MHJkt1zXGu/V5py5hMizMPXwke/BGF3rO6DM
CyehfaRs2jdm4kq2U95udD/TB3WwH0ZYKqK7vJ5xgKpFK5/gJMqHhAAosto9XRFT
L1STl7eIMclg2C65wEkPvYk7ZdSSM/7EK2153skpsoAao3xMBfaED1uFWQah/dW+
XqHvnB4PoCy35Vsg8jT2rtfkXxv8GvkNmYzEgGqdRDE9vRIexTjLDPTovBVH768I
bSgei72CSWlcHuQ7IFvfnuI0PPHVbEqCBo31mnCUIfRwSqXKq4b7ABEvw/HLyax0
cNg753tCtEbkV6LFn20DS2OUEG2W2vOoAfaOEwljOhU+ehzO+61IJGsKyudD3heB
f7UzczkacN5iyTfroW3fD6ZQhE76ZxW7CAeunbLUxaJi+kLbDwk+BD/x7DQ4WWQY
h+mwzWFdyP+Y3oTRBftvk/iJ42nHabGsGnQrbUzHLke3uSjBGAPmFiqSCFPJ8fsj
U3NMbgS5rdQrPWu8lydVK1n2GPDLSia9Ie8hTxiTcaEmDfLoOWoD4A3F1Bzh1YZn
uimjh+pTkcpAk9Wi24I1/iWPfhk8xJPbaEsnvNeFNLfkO5p//tQ0kU/83GAEvG9L
p+YKvNw9WdDFyz8GCgXbeY8bhLyef0cBwrBRGtUwYdrIqipnHv0=
=W2Qx
-----END PGP SIGNATURE-----

--s4c7q4omkexuyfrp--

