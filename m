Return-Path: <linux-media+bounces-27197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CACA4928F
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 08:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B152D3A7531
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 07:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7561CAA81;
	Fri, 28 Feb 2025 07:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J3HpjlTU"
X-Original-To: linux-media@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAD61C8636
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 07:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740729499; cv=none; b=sXSctsoNzBX4kKGiPwGzMtqZ3uZof8fn/y+4ABZcbzAE5ejSJ55s6e/lmvI/lcYinRqgXpT3jRhCMo9lb1ONAbAxv8Pfh0SxbJMeu/h6DqFFK9ymWsiGMM7fUI1QapvgUElJ5KoCGkoQpHzYQSG6tHu/F5Ehzz4HPvw4ziMSKCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740729499; c=relaxed/simple;
	bh=NT6VluaEJiIQJFgqWHwcRU+IaNYs6C7ttyol+KyS2Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMIcFd5UKTaWZnON0v3zBWgeCglP54qFkgfXUQ3Yv03vSJ3cbmvyIEcKDlWTtvCUDYA8Z9kD3vwEf5XZsYb8wey4ZnuvXpmRVkws0Yth+4oTVbugqCS1D8gUwKhUTZddcuhCJUOSLQXVX8I8bazibl85INpHyx/yQ+AiZGLskj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J3HpjlTU; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 28 Feb 2025 13:28:08 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740729494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e3qtsbSY2qbVhXUHHet1nLnHazcFTu6U/AIbEu/TP9k=;
	b=J3HpjlTUxQ5DTHgerXk7/Oz2qPcE7YaIdVOG057Yyi0jRWcvHKuk1y5YvgvMgZcqlP8pTw
	Yw+0z08NFPHq9muRhnZA8qVGIb+xsRBhCpC7eJhyQvxAvTrvXFLTVyGy1AxmqJCosu1Llj
	dj9SlAaR7P9WYYBp31eOg4W89Ux4Dzs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mripard@kernel.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devarsht@ti.com, vaishnav.a@ti.com, 
	r-donadkar@ti.com, u-kumar1@ti.com
Subject: Re: [PATCH v4 2/2] media: cadence: csi2rx: Enable csi2rx_err_irq
 interrupt and add support for VIDIOC_LOG_STATUS
Message-ID: <dxgnjy3cah3q45gb3zv2zxyfgsvkilxhwjerqogsp2xoxkzhmu@cyr7z6xr54sq>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250227082920.744908-1-y-abhilashchandra@ti.com>
 <20250227082920.744908-3-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sj275sijlhe6pcb4"
Content-Disposition: inline
In-Reply-To: <20250227082920.744908-3-y-abhilashchandra@ti.com>
X-Migadu-Flow: FLOW_OUT


--sj275sijlhe6pcb4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/2] media: cadence: csi2rx: Enable csi2rx_err_irq
 interrupt and add support for VIDIOC_LOG_STATUS
MIME-Version: 1.0

Hi Abhilash,

Thanks for the patch.

On Thu, Feb 27, 2025 at 01:59:20PM +0530, Yemike Abhilash Chandra wrote:
> Enable the csi2rx_err_irq interrupt to record any errors during streaming
> and also add support for VIDIOC_LOG_STATUS ioctl. This allows users to
> retrieve detailed error information during streaming, including FIFO
> overflow, packet errors, and ECC errors.
>=20
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Tested-by: Jai Luthra <jai.luthra@linux.dev>
> ---
>=20
> Changes in v4:
> - Use dev_name(&pdev->dev) while requesting the IRQ handler
> - Fix minor issues such as avoiding magic numbers, splitting long lines
>   of code and removing extra spaces
> - Make some minor changes in the commit messages.
>=20

Reviewed-by: Jai Luthra <jai.luthra@linux.dev>

>  drivers/media/platform/cadence/cdns-csi2rx.c | 129 +++++++++++++++++++
>  1 file changed, 129 insertions(+)
>=20
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media=
/platform/cadence/cdns-csi2rx.c
> index cebcae196eec..30cf2da36023 100644
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
> @@ -124,6 +167,52 @@ static const struct csi2rx_fmt formats[] =3D {
>  	{ .code	=3D MEDIA_BUS_FMT_BGR888_1X24,  .bpp =3D 24, },
>  };
> =20
> +static void csi2rx_configure_error_irq_mask(void __iomem *base,
> +					    struct csi2rx_priv *csi2rx)
> +{
> +	u32 error_irq_mask =3D 0;
> +
> +	error_irq_mask |=3D CSI2RX_ECC_ERRORS;
> +	error_irq_mask |=3D CSI2RX_PACKET_ERRORS;
> +
> +	/*
> +	 * Iterate through all source pads and check if they are linked
> +	 * to an active remote pad. If an active remote pad is found,
> +	 * calculate the corresponding bit position and set it in
> +	 * mask, enabling the stream overflow error in the mask.
> +	 */
> +	for (int i =3D CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
> +		struct media_pad *remote_pad;
> +
> +		remote_pad =3D media_pad_remote_pad_first(&csi2rx->pads[i]);
> +		if (remote_pad) {
> +			int pad =3D i - CSI2RX_PAD_SOURCE_STREAM0;
> +			u32 bit_mask =3D CSI2RX_STREAM0_FIFO_OVERFLOW_IRQ << pad;
> +
> +			error_irq_mask |=3D bit_mask;
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
> @@ -220,6 +309,9 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  	reset_control_deassert(csi2rx->p_rst);
>  	csi2rx_reset(csi2rx);
> =20
> +	if (csi2rx->error_irq >=3D 0)
> +		csi2rx_configure_error_irq_mask(csi2rx->base, csi2rx);
> +
>  	reg =3D csi2rx->num_lanes << 8;
>  	for (i =3D 0; i < csi2rx->num_lanes; i++) {
>  		reg |=3D CSI2RX_STATIC_CFG_DLANE_MAP(i, csi2rx->lanes[i]);
> @@ -332,6 +424,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  	reset_control_assert(csi2rx->sys_rst);
>  	clk_disable_unprepare(csi2rx->sys_clk);
> =20
> +	writel(0, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
> +
>  	for (i =3D 0; i < csi2rx->max_streams; i++) {
>  		writel(CSI2RX_STREAM_CTRL_STOP,
>  		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
> @@ -363,6 +457,21 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
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
> @@ -468,7 +577,12 @@ static const struct v4l2_subdev_video_ops csi2rx_vid=
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
> @@ -705,6 +819,21 @@ static int csi2rx_probe(struct platform_device *pdev)
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
> +		ret =3D devm_request_irq(csi2rx->dev, csi2rx->error_irq,
> +				       csi2rx_irq_handler, 0,
> +				       dev_name(&pdev->dev), csi2rx);
> +		if (ret) {
> +			dev_err(csi2rx->dev,
> +				"Unable to request interrupt: %d\n", ret);
> +			goto err_cleanup;
> +		}
> +	}
> +
>  	ret =3D v4l2_subdev_init_finalize(&csi2rx->subdev);
>  	if (ret)
>  		goto err_cleanup;
> --=20
> 2.34.1
>=20

--sj275sijlhe6pcb4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmfBbJAACgkQQ96R+SSa
cUU0DA//ZrlsUHPdTOPam9cfjAHM0g7Vuc/MAs8hjFpf9TJVLaNPcxKaSADiY4xP
8l0nT8lJ+HBJbJen1OV0NmV9JQqM6NO3RAY87nhYzpKMvoMo3/2ilIF3ifnKjohZ
d2iWXcoXFXgFlCmW5XaJkci58i2KOJjdRaO14vn23bRrYbpw2Q6iDt2FxelagsD2
soUtNYb/TgAJehLTsqPUCqUhNuSiqf496SXXec2nGQZEtf3q9Ykb4DAXqAT2ltiF
YMMNfB3Chx8Y+xh8fCoMydRQrPWwCw+zxe51ZR2pZe1gn4Ok9eZqnrMGSN3MgNYE
uaTSn603NRBU/4YqJK6enpOoe5TNaSrPYxejp6SoZRRfUfP+BXUM3e9uY33pX0he
OYZI1x7Upb4zqGGd7EbFvtcsYZtW2cDnUkot0RSxU8Bkwc8l+vze2Dvn/h8U5X3x
HQ8O2iHcEJThtcVxi4clpafmEBT5em61D6oT+MJRPwUbafnFx4OsJ+SdBTXof9TO
By1Lduy2x2zeF1jpADp0jvSgouIeaCS0qBBu1sS10yWflmAOlP62i7f5uRwyINJN
bOYYmN170o0W6OvwU54G0rUZPWGC6Au8ZBopzKKW2oQndW6j/iY1gEpbpUCwb2vJ
ElocKsLuPndltEmh82N1Z/VOPyU6ZdCVaE1qgItfQkXx4Ubqadc=
=pbHG
-----END PGP SIGNATURE-----

--sj275sijlhe6pcb4--

