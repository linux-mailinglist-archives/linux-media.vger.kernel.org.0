Return-Path: <linux-media+bounces-26760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8848AA41611
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 08:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC4257A2140
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 07:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782A31A5B8B;
	Mon, 24 Feb 2025 07:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RCIbHxqB"
X-Original-To: linux-media@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5874414
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 07:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740381351; cv=none; b=URT8xL6A3USsk7zBa35BSvlw1R1xoejTb3ajiQUurcJPbT3/HrwqkN13AkzN8at1sRJIepNe2fxDF7dlPrnTAaW0iO00uEu6rv08XLaoTD8TKIrocpqn+6J2L1azrCniKVQj6TdUJVvaetHLTGHAjpFh5KB4UMoc0BFIFwKOTcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740381351; c=relaxed/simple;
	bh=CcIlasMlwGyRUnGlK2ln480ok4GS2N+woVsRBl1G40o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMsVt2JzqAwZT2XP2YOWZ8OTfutOTB+40Ta2exmRq6shMb7OfETnnRD9nWENIfMIPcok24vsQnTsem50L3mzMJu/Rcrx/mp+svvOPlXSmqkbK69r11PpycAYcz5+RqMGc8gS0GsBvH/zUImtSXIyU6lY7OkgSuScP9qDAWPeZiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RCIbHxqB; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 24 Feb 2025 12:44:52 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740381345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yMCBsuCxywFQdUGguzwFOiAlKOVDXhCL8WkyMF7aUdc=;
	b=RCIbHxqBBl+y9TRQSb1MoRxJCT1aBon2X4cxiEot8bbWUD0QNpZwhlarz5+K+JfQ6Y/W29
	YK5DB/dPs2QXA+RqXShfDqfBAd8GHEHUqbB1Rnvt2YzKzvPWc7Wo/4Z2oe4yBSuZUMGZQn
	G84CJLV86vAx4YN+yyPxI6YocRYexjw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mripard@kernel.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devarsht@ti.com, vaishnav.a@ti.com, 
	r-donadkar@ti.com, u-kumar1@ti.com
Subject: Re: [PATCH v3 2/2] media: cadence: csi2rx: Enable csi2rx_err_irq
 interrupt and add support for VIDIOC_LOG_STATUS
Message-ID: <4ukas366gvkl7fljddneulgxwnzdvblkknantgv4iu427sfhor@d3rpvym4ynhn>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250221120337.3920874-1-y-abhilashchandra@ti.com>
 <20250221120337.3920874-3-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4aroo4gfbhv2sbc4"
Content-Disposition: inline
In-Reply-To: <20250221120337.3920874-3-y-abhilashchandra@ti.com>
X-Migadu-Flow: FLOW_OUT


--4aroo4gfbhv2sbc4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/2] media: cadence: csi2rx: Enable csi2rx_err_irq
 interrupt and add support for VIDIOC_LOG_STATUS
MIME-Version: 1.0

Hi Abhilash,

Thanks for the patch.

On Fri, Feb 21, 2025 at 05:33:37PM +0530, Yemike Abhilash Chandra wrote:
> Enable the csi2rx_err_irq interrupt to record any errors during streaming
> and also add support for VIDIOC_LOG_STATUS ioctl. The VIDIOC_LOG_STATUS
> ioctl can be invoked from user space to retrieve the device status,
> including details about any errors.
>=20
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>=20
> Changes in v3:
> - Address Jai's review comment to enable FIFO overflow bits in the mask
>   only for the source pads that have an active remote.
> - Drop TI-specific interrupt and have support for only two interrupts
>   that are common across all vendors.
> - Address Changhuang's review to use pdev directly to get the interrupt.
> - Set the interrupt mask register only if the interrupt is defined in the=
 DT.
>=20
>=20
>  drivers/media/platform/cadence/cdns-csi2rx.c | 125 +++++++++++++++++++
>  1 file changed, 125 insertions(+)
>=20
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media=
/platform/cadence/cdns-csi2rx.c
> index cebcae196eec..81375f11a32f 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -57,6 +57,25 @@
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
> +
>  enum csi2rx_pads {
>  	CSI2RX_PAD_SINK,
>  	CSI2RX_PAD_SOURCE_STREAM0,
> @@ -71,9 +90,32 @@ struct csi2rx_fmt {
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
> +	int				error_irq;
> =20
>  	/*
>  	 * Used to prevent race conditions between multiple,
> @@ -95,6 +137,7 @@ struct csi2rx_priv {
>  	u8				max_lanes;
>  	u8				max_streams;
>  	bool				has_internal_dphy;
> +	u32				events[CSI2RX_NUM_EVENTS];
> =20
>  	struct v4l2_subdev		subdev;
>  	struct v4l2_async_notifier	notifier;
> @@ -124,6 +167,50 @@ static const struct csi2rx_fmt formats[] =3D {
>  	{ .code	=3D MEDIA_BUS_FMT_BGR888_1X24,  .bpp =3D 24, },
>  };
> =20
> +static void csi2rx_configure_error_irq_mask(void __iomem *base, struct c=
si2rx_priv *csi2rx)
> +{
> +	u32 error_irq_mask =3D 0;
> +
> +	error_irq_mask |=3D CSI2RX_ECC_ERRORS;
> +	error_irq_mask |=3D CSI2RX_PACKET_ERRORS;
> +
> +	/*
> +	 * iterate through all source pads and check if they are linked

nit: s/iterate/Iterate

> +	 * to an active remote pad. If an active remote pad is found,
> +	 * calculate the corresponding bit position and set it in
> +	 * mask, enabling the stream overflow error in the mask.
> +	 */
> +

nit: drop this extra whitespace

> +	for (int i =3D CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
> +		struct media_pad *remote_pad =3D media_pad_remote_pad_first(&csi2rx->p=
ads[i]);
> +
> +		if (remote_pad) {
> +			int bit_position =3D 16 + (i - CSI2RX_PAD_SOURCE_STREAM0);

It would be cleaner to not use the magic number of 16 here, instead using t=
he=20
already defined macro:

            error_irq_mask |=3D (CSI2RX_STREAM0_FIFO_OVERFLOW_IRQ
					   << (i - CSI2RX_PAD_SOURCE_STREAM0));

> +
> +			error_irq_mask |=3D (1 << bit_position);
> +		}
> +	}
> +
> +	writel(error_irq_mask, base + CSI2RX_ERROR_IRQS_MASK_REG);
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
> +	writel(error_status, csi2rx->base + CSI2RX_ERROR_IRQS_REG);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
>  {
>  	unsigned int i;
> @@ -220,6 +307,9 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  	reset_control_deassert(csi2rx->p_rst);
>  	csi2rx_reset(csi2rx);
> =20
> +	if (csi2rx->error_irq >=3D 0)
> +		csi2rx_configure_error_irq_mask(csi2rx->base, csi2rx);
> +
>  	reg =3D csi2rx->num_lanes << 8;
>  	for (i =3D 0; i < csi2rx->num_lanes; i++) {
>  		reg |=3D CSI2RX_STATIC_CFG_DLANE_MAP(i, csi2rx->lanes[i]);
> @@ -332,6 +422,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  	reset_control_assert(csi2rx->sys_rst);
>  	clk_disable_unprepare(csi2rx->sys_clk);
> =20
> +	writel(0, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
> +
>  	for (i =3D 0; i < csi2rx->max_streams; i++) {
>  		writel(CSI2RX_STREAM_CTRL_STOP,
>  		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
> @@ -363,6 +455,21 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
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
> @@ -468,7 +575,12 @@ static const struct v4l2_subdev_video_ops csi2rx_vid=
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
> @@ -705,6 +817,19 @@ static int csi2rx_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_cleanup;
> =20
> +	csi2rx->error_irq =3D platform_get_irq_byname_optional(pdev, "error_irq=
");
> +
> +	if (csi2rx->error_irq < 0) {
> +		dev_dbg(csi2rx->dev, "Optional interrupt not defined, proceeding witho=
ut it\n");
> +	} else {
> +		ret =3D devm_request_irq(csi2rx->dev, csi2rx->error_irq, csi2rx_irq_ha=
ndler, 0,
> +					"csi2rx-error-irq", csi2rx);

Why "csi2rx-error-irq" is passed in the devname argument instead of the dev=
ice=20
name `dev_name(&pdev->dev)`? Also there is an alignment issue:

CHECK: Alignment should match open parenthesis
#204: FILE: drivers/media/platform/cadence/cdns-csi2rx.c:824:
+               ret =3D devm_request_irq(csi2rx->dev, csi2rx->error_irq, cs=
i2rx_irq_handler, 0,
+                                       "csi2rx-error-irq", csi2rx);

> +		if (ret) {
> +			dev_err(csi2rx->dev, "Unable to request interrupt: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
>  	ret =3D v4l2_subdev_init_finalize(&csi2rx->subdev);
>  	if (ret)
>  		goto err_cleanup;
> --=20
> 2.34.1
>=20

--4aroo4gfbhv2sbc4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAme8HGsACgkQQ96R+SSa
cUVZMw/+P+NfrNgRv9I3HrrgDUBcAquipWOLhPSiGrVVKB5NIHk6AHkSFQ8XAvqS
jR1jRQsoCY97EXU3AXszc5UMAfNrAAnd7mXyRyrmOto6OobH36TFBXb5YCngP9rr
Or+E+tQC9DY/urYiYmh/7N+xbQZ2kdgu6ZKnjaroWN7ePOw3ncBcfnIvD/4m3v52
ofZj+nh/KT7CnEaxAx8avI4bavsJDTD8fKVyMUHA/3QjnGFVJZKv3wCx7GFof0Ac
KwKG6A07IuM+fxLhltMhT7Ykrdhr6kyJIPXf6Rb6J9mHYpfBhuEeRezbwbutOgp9
Ycn9hzM4DsfjFEo+r7l5rxcSYfiMBvUYkUfAvmTXHrxIf8fc+sfSSNt/I63hG926
pAD22sJkct/fQVtvSR+Ijuy/dP/Gxh66tmFkkuxEqZ9g+Bexgx3kko5kUkyM8AqQ
iwub+kXan5TD+LIWc7N5U7wW13HVn+qMnYKuiqlU7lE9bhLBiDUea6iO5pMJGhmu
77Te3QIgL6t7eNukfL8Blv5G+6+y/1OKaQelkGjB+NnxvFxZpUHyD6Eve9fLMDBT
VelQwKUJqwtrmlcvfoSzUgEUdjlS7ab6pT3X1uOnVfL1VTZjzlPGIGhcli4HJUDE
VinnJJ7ZRaF5Bh9jfSNyecP/VUJW7bVUUaKjmsjGpR4u1kqAJ7s=
=IBdl
-----END PGP SIGNATURE-----

--4aroo4gfbhv2sbc4--

