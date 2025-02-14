Return-Path: <linux-media+bounces-26142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32179A356EB
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 07:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDF4D3AF3B7
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 06:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3061FC0E2;
	Fri, 14 Feb 2025 06:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Myw/mRV1"
X-Original-To: linux-media@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276581714CF
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 06:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739513713; cv=none; b=Spg5CFpv95IN0ZVGFhKYo+3sJGVWkgolAt8uSLotSamI9hE9iyaBmZy4EF0vbQ8REtMa0BY3MyFpChyCQt4EN0EHJPvnZpSha4eTL/N/d6TZpMOfIpkl833fGqkmYed9LQ2A2lzEWLsEq3UZWkkWEDuFFFK56reNT+zV+cy6KXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739513713; c=relaxed/simple;
	bh=1DonSn/LHoukADZsHlHNOctnxJ/2J8fqMCCdZt1/DsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDH6NgYYPNAd1KgyGswXF/Xz1zlTm+bfgEPp5Ji0QHUypjFdJkMGjf4nbXBIHdaYY+FAR6JSkIkCQqAHPV8bHymqS8iR4nbqkXSV8VKbbQRGERRhBr3Zvt3xTGySoPrYgHIgLjHe/HDYwAZYoiyZWtNn8lUqUmjoiP80b4Ao83M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Myw/mRV1; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 14 Feb 2025 11:44:57 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739513707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J07zWXS0SWtytEBV7PJUJH6kXT7LOJozPMw0GGqXxuY=;
	b=Myw/mRV1/9tBAxTpCRw1CNE5o2QW6ZHsswwe0l+q5EE8rYMfKfAXl+lAVXUr9A1QEiwqFD
	Y7FKB5zPVgSIIIXjEbG3z20BWRVBILDByRzqER35FX80g5j14ouvEmkzhWspgP3q/R/bFS
	AjWToufiYbJ/eQgVWSlpGVrAFgCw0ys=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mripard@kernel.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devarsht@ti.com, vaishnav.a@ti.com, 
	r-donadkar@ti.com, u-kumar1@ti.com
Subject: Re: [RFC PATCH 2/3] media: cadence: csi2rx: Enable csi2rx_err_irq
 interrupt and add support for VIDIOC_LOG_STATUS
Message-ID: <s7xhbinc4m3le57f3y5je2ejmpxkgwrvukb7u3cjkg3zy4i63r@6fdctkuv5wrz>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250212131244.1397722-1-y-abhilashchandra@ti.com>
 <20250212131244.1397722-3-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yhmthg2swa7li7p5"
Content-Disposition: inline
In-Reply-To: <20250212131244.1397722-3-y-abhilashchandra@ti.com>
X-Migadu-Flow: FLOW_OUT


--yhmthg2swa7li7p5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 2/3] media: cadence: csi2rx: Enable csi2rx_err_irq
 interrupt and add support for VIDIOC_LOG_STATUS
MIME-Version: 1.0

Hi Abhilash,

On Wed, Feb 12, 2025 at 06:42:43PM +0530, Yemike Abhilash Chandra wrote:
> Enable the csi2rx_err_irq interrupt to record any errors during streaming
> and also add support for VIDIOC_LOG_STATUS ioctl. The VIDIOC_LOG_STATUS
> ioctl can be invoked from user space to retrieve the device status,
> including details about any errors.
>=20
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 104 ++++++++++++++++++-
>  1 file changed, 103 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media=
/platform/cadence/cdns-csi2rx.c
> index 4d64df829e75..b3d76f0678fa 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -57,6 +57,28 @@
>  #define CSI2RX_LANES_MAX	4
>  #define CSI2RX_STREAMS_MAX	4
> =20
> +#define CSI2RX_ERROR_IRQS_REG			0x28
> +#define CSI2RX_ERROR_IRQS_MASK_REG		0x2C
> +
> +#define CSI2RX_STREAM3_FIFO_OVERFLOW_IRQ	BIT(19)
> +#define CSI2RX_STREAM2_FIFO_OVERFLOW_IRQ	BIT(18)
> +#define CSI2RX_STREAM1_FIFO_OVERFLOW_IRQ	BIT(17)
> +#define CSI2RX_STREAM0_FIFO_OVERFLOW_IRQ	BIT(16)
> +#define CSI2RX_FRONT_TRUNC_HDR_IRQ		BIT(12)
> +#define CSI2RX_PROT_TRUNCATED_PACKET_IRQ	BIT(11)
> +#define CSI2RX_FRONT_LP_NO_PAYLOAD_IRQ		BIT(10)
> +#define CSI2RX_SP_INVALID_RCVD_IRQ		BIT(9)
> +#define CSI2RX_DATA_ID_IRQ			BIT(7)
> +#define CSI2RX_HEADER_CORRECTED_ECC_IRQ	BIT(6)
> +#define CSI2RX_HEADER_ECC_IRQ			BIT(5)
> +#define CSI2RX_PAYLOAD_CRC_IRQ			BIT(4)
> +
> +#define CSI2RX_ECC_ERRORS		GENMASK(7, 4)
> +#define CSI2RX_PACKET_ERRORS		GENMASK(12, 9)
> +#define CSI2RX_STREAM_ERRORS		GENMASK(19, 16)
> +#define CSI2RX_ERRORS			(CSI2RX_ECC_ERRORS | CSI2RX_PACKET_ERRORS | \
> +					CSI2RX_STREAM_ERRORS)
> +
>  enum csi2rx_pads {
>  	CSI2RX_PAD_SINK,
>  	CSI2RX_PAD_SOURCE_STREAM0,
> @@ -71,6 +93,28 @@ struct csi2rx_fmt {
>  	u8				bpp;
>  };
> =20
> +struct csi2rx_event {
> +	u32 mask;
> +	const char *name;
> +};
> +
> +static const struct csi2rx_event csi2rx_events[] =3D {
> +	{ CSI2RX_STREAM3_FIFO_OVERFLOW_IRQ, "Overflow of the Stream 3 FIFO dete=
cted" },
> +	{ CSI2RX_STREAM2_FIFO_OVERFLOW_IRQ, "Overflow of the Stream 2 FIFO dete=
cted" },
> +	{ CSI2RX_STREAM1_FIFO_OVERFLOW_IRQ, "Overflow of the Stream 1 FIFO dete=
cted" },
> +	{ CSI2RX_STREAM0_FIFO_OVERFLOW_IRQ, "Overflow of the Stream 0 FIFO dete=
cted" },
> +	{ CSI2RX_FRONT_TRUNC_HDR_IRQ, "A truncated header [short or long] has b=
een received" },
> +	{ CSI2RX_PROT_TRUNCATED_PACKET_IRQ, "A truncated long packet has been r=
eceived" },
> +	{ CSI2RX_FRONT_LP_NO_PAYLOAD_IRQ, "A truncated long packet has been rec=
eived. No payload" },
> +	{ CSI2RX_SP_INVALID_RCVD_IRQ, "A reserved or invalid short packet has b=
een received" },
> +	{ CSI2RX_DATA_ID_IRQ, "Data ID error in the header packet" },
> +	{ CSI2RX_HEADER_CORRECTED_ECC_IRQ, "ECC error detected and corrected" },
> +	{ CSI2RX_HEADER_ECC_IRQ, "Unrecoverable ECC error" },
> +	{ CSI2RX_PAYLOAD_CRC_IRQ, "CRC error" },
> +};
> +
> +#define CSI2RX_NUM_EVENTS		ARRAY_SIZE(csi2rx_events)
> +
>  struct csi2rx_priv {
>  	struct device			*dev;
>  	unsigned int			count;
> @@ -95,6 +139,7 @@ struct csi2rx_priv {
>  	u8				max_lanes;
>  	u8				max_streams;
>  	bool				has_internal_dphy;
> +	u32				events[CSI2RX_NUM_EVENTS];
> =20
>  	struct v4l2_subdev		subdev;
>  	struct v4l2_async_notifier	notifier;
> @@ -124,6 +169,29 @@ static const struct csi2rx_fmt formats[] =3D {
>  	{ .code	=3D MEDIA_BUS_FMT_BGR888_1X24,  .bpp =3D 24, },
>  };
> =20
> +static void csi2rx_configure_err_irq_mask(void __iomem *base)
> +{
> +	writel(CSI2RX_ERRORS, base + CSI2RX_ERROR_IRQS_MASK_REG);
> +}
> +
> +static irqreturn_t csi2rx_irq_handler(int irq, void *dev_id)
> +{
> +	struct csi2rx_priv *csi2rx =3D dev_id;
> +	int i;
> +	u32 error_status;
> +
> +	error_status =3D readl(csi2rx->base + CSI2RX_ERROR_IRQS_REG);
> +
> +	for (i =3D 0; i < CSI2RX_NUM_EVENTS; i++)
> +		if (error_status & csi2rx_events[i].mask)
> +			csi2rx->events[i]++;
> +
> +	writel(CSI2RX_ERRORS & error_status,
> +	       csi2rx->base + CSI2RX_ERROR_IRQS_REG);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
>  {
>  	unsigned int i;
> @@ -209,12 +277,26 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  	unsigned int i;
>  	unsigned long lanes_used =3D 0;
>  	u32 reg;
> -	int ret;
> +	int irq, ret;
> =20
>  	ret =3D clk_prepare_enable(csi2rx->p_clk);
>  	if (ret)
>  		return ret;
> =20
> +	irq =3D platform_get_irq_byname_optional(to_platform_device(csi2rx->dev=
), "error");

Why is this interrupt acquired everytime somebody starts the stream, as=20
opposed to once at probe-time?

> +
> +	if (irq < 0) {
> +		dev_warn(csi2rx->dev, "Optional interrupt not defined, proceeding with=
out it\n");

Given this is an optional interrupt, and different SoC vendors may or may n=
ot=20
integerate it, I don't think bothering the end-user with a warning everytim=
e=20
is best. This could be dev_dbg.

> +	} else {
> +		csi2rx_configure_err_irq_mask(csi2rx->base);
> +		ret =3D devm_request_irq(csi2rx->dev, irq, csi2rx_irq_handler, 0,
> +					"csi2rx-irq", csi2rx);
> +		if (ret) {
> +			dev_err(csi2rx->dev, "Unable to request interrupt: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
>  	reset_control_deassert(csi2rx->p_rst);
>  	csi2rx_reset(csi2rx);
> =20
> @@ -361,6 +443,21 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  	}
>  }
> =20
> +static int csi2rx_log_status(struct v4l2_subdev *sd)
> +{
> +	struct csi2rx_priv *csi2rx =3D v4l2_subdev_to_csi2rx(sd);
> +	unsigned int i;
> +
> +	for (i =3D 0; i < CSI2RX_NUM_EVENTS; i++) {
> +		if (csi2rx->events[i])
> +			dev_info(csi2rx->dev, "%s events: %d\n",
> +				 csi2rx_events[i].name,
> +				 csi2rx->events[i]);
> +	}
> +
> +	return 0;
> +}
> +
>  static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
>  {
>  	struct csi2rx_priv *csi2rx =3D v4l2_subdev_to_csi2rx(subdev);
> @@ -466,7 +563,12 @@ static const struct v4l2_subdev_video_ops csi2rx_vid=
eo_ops =3D {
>  	.s_stream	=3D csi2rx_s_stream,
>  };
> =20
> +static const struct v4l2_subdev_core_ops csi2rx_core_ops =3D {
> +	.log_status	=3D csi2rx_log_status,
> +};
> +
>  static const struct v4l2_subdev_ops csi2rx_subdev_ops =3D {
> +	.core		=3D &csi2rx_core_ops,
>  	.video		=3D &csi2rx_video_ops,
>  	.pad		=3D &csi2rx_pad_ops,
>  };
> --=20
> 2.34.1
>=20

--yhmthg2swa7li7p5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmeu32EACgkQQ96R+SSa
cUWt2g/+NR/m8BArB6eY7pFE5Uqp4hLYIl9bX4xKJXYY1pqsT3r9uwo7Q+OAZXKb
/rjiCSxLrW5F7QDgobT2R4aVqwvznn0Cy4O2T2FwAlFON/RdgnU+OlbGG9+x63Pg
p1tVPA4135HX/nvi1wozpL6oPW0+2k0CM0bDiA/Fia0sc6VJL3x1TpLAD0w+LirU
8W+8Wb92lKHZ9mLfj6YiIJuRb5Pk0uz0tRhz5oRdG3orNkdO6wEYzxm9t8OeYmNM
BKb8rSuaw+MU+Ml2eU8I64roZbyGUmTzwWrUwiiUS5vo52zaQSbknG5WTGojSATt
FbMHITT2RnI3Mv2vQHJIX3cGydV6Ji9sIa50FOF4c7YDEzZXJaqJeREzE7G4jyVl
7aGegNsO4Hxv+tAejCvTprnnNgA31/7drm2o2mCCjmH+EDgtqIDUky2mm9DSxPSc
1csXGlTvv1IgFTnZ2dTaaa2NhHzDYQnZUK2TbMG8roeT3bVy1jPdERTnwtvcin6w
nZ2P3oU1nRBgHUdqLVX4qG/+VFkh47LzH9Zn8+X2UwhnLoeuW1W7wBamsROXir+A
OF2EOf3vXmWxKVZ+R14J1MNwiYRL8yaw3BM7nDZHrT5kJXR1rPBR5cI8+t8F5zW5
MM/wBU9GzV4HRvIbPbPDqiUzcOitlZyJTj5duKqYB+to1sISrUk=
=DuUi
-----END PGP SIGNATURE-----

--yhmthg2swa7li7p5--

