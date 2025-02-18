Return-Path: <linux-media+bounces-26256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4780EA39486
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 09:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 420633ADB6C
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 08:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1340122AE4E;
	Tue, 18 Feb 2025 08:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m6NDurDT"
X-Original-To: linux-media@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FF81DE4C2
	for <linux-media@vger.kernel.org>; Tue, 18 Feb 2025 08:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739866208; cv=none; b=TFPjtaA8Z6+tSnyBBa+HZBKSdEJ1azssN8VEydVOp2nIeuDM5UnqK1NyHlICrFPiqP0s/eZR82uRDfpRSxpCzlHtcNRl5wCewMfyF4DX5+3f5VNNwYUKFUoaHtq+IRpcDotT7LpXeQmX/goAuCCB0a1rQhZSaH61FFTSGL13Stk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739866208; c=relaxed/simple;
	bh=0iQszF3aOQUx0RH7/52EySFF4PuSiLgEtr9HQo8excU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyg1DVmplG2Adb2ih+NE/EYNUqjdQAuKtYkzaCIlytEQmWpvkbPh5UTgKWHOnuA+By4qPBDCiqqSL0KvcIEkP3VbEfUlDTD6fKrWxFc0u+2yweqfS9HdEHZGeHwQLr1T3vSCKTL5QkdbLvo+4DWkL9uC94FhGVV/Yit2eEv7ngc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m6NDurDT; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 18 Feb 2025 13:39:52 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739866202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q+qcyfogl80YNKhUoy4AsrKtrIZYeuFWq7dao6s66Gk=;
	b=m6NDurDTyvgf/k+mWanLAPlsUVd+PDRIXtdOMUlLQRalxJYqTpf0ehxBrE2nWB3uY6svxw
	Uz/1SZ8bap3Y4YTymatvquW7dFScROBzqZMBfWCeR38dhUqME2Mm5Kdg+Ijl40pe3GD331
	Ts3Mi2VHha0kBAKJUv1z6mo4V5dqAFc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
	Rishikesh Donadkar <r-donadkar@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Vaishnav Achath <vaishnav.a@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, mripard@kernel.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, u-kumar1@ti.com
Subject: Re: [PATCH v2 2/2] media: cadence: csi2rx: Enable csi2rx_err_irq
 interrupt and add support for VIDIOC_LOG_STATUS
Message-ID: <x6akslzswdbesyazl6wi5xetikw7gnklvb3xuz2jra3qnk72as@r23gujc6ldhl>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250217130013.2802293-1-y-abhilashchandra@ti.com>
 <20250217130013.2802293-3-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="depqe2pkfz25xcrz"
Content-Disposition: inline
In-Reply-To: <20250217130013.2802293-3-y-abhilashchandra@ti.com>
X-Migadu-Flow: FLOW_OUT


--depqe2pkfz25xcrz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] media: cadence: csi2rx: Enable csi2rx_err_irq
 interrupt and add support for VIDIOC_LOG_STATUS
MIME-Version: 1.0

Hi Abhilash,

On Mon, Feb 17, 2025 at 06:30:13PM +0530, Yemike Abhilash Chandra wrote:
> Enable the csi2rx_err_irq interrupt to record any errors during streaming
> and also add support for VIDIOC_LOG_STATUS ioctl. The VIDIOC_LOG_STATUS
> ioctl can be invoked from user space to retrieve the device status,
> including details about any errors.
>=20
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>=20
> Changes in v2:
> - Address Jai's review comment to get interrupt at probe instead of
>   start_stream.
> - Address Jai's review comment to change dev_warn to dev_dbg when there
>   is no interrupt defined in DT.
>=20
>  drivers/media/platform/cadence/cdns-csi2rx.c | 102 ++++++++++++++++++-
>  1 file changed, 101 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media=
/platform/cadence/cdns-csi2rx.c
> index 4d64df829e75..79f0c31eaf50 100644
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
> @@ -124,6 +169,24 @@ static const struct csi2rx_fmt formats[] =3D {
>  	{ .code	=3D MEDIA_BUS_FMT_BGR888_1X24,  .bpp =3D 24, },
>  };
> =20
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
> @@ -218,6 +281,8 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  	reset_control_deassert(csi2rx->p_rst);
>  	csi2rx_reset(csi2rx);
> =20
> +	writel(CSI2RX_ERRORS, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
> +

Because all events are masked here, I receive a flood of interrupts on my=
=20
SK-AM62A due to Stream1 overflow events.

[  328.931479] cdns_csi2rx.30101000.csi-bridge: =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D  START STATUS  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
[  328.940213] cdns-csi2rx 30101000.csi-bridge: Overflow of the Stream 1 FI=
FO detected events: 108078
[  328.949179] cdns_csi2rx.30101000.csi-bridge: =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D  END STATUS  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

$ cat /proc/interrupts | grep csi
559:     108078          0          0          0     GICv3 175 Level     cs=
i2rx-irq

I don't think Stream1 (pad2 of cdns-csi2rx) is connected to anything in the=
=20
hardware, at least from what I can see in the AM62A TRM [1].

It should be possible to figure out which pads of cdns-csi2rx subdev have=
=20
active links to other subdevs, and only enable events for the corresponding=
=20
Stream port on the hardware.

This also exposes another issue in the csi2rx_start() function where we sta=
rt=20
streaming on all source pads, ignoring if it is actually linked to any subd=
ev=20
in the pipeline:

    for (i =3D 0; i < csi2rx->max_streams; i++) {
    ...
		writel(CSI2RX_STREAM_CTRL_START,
		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
    }

I believe that should be fixed as a separate patch, probably along with the=
 v3=20
of v4l2 streams API support [2].

[1] https://www.ti.com/lit/pdf/spruj16
[2] https://lore.kernel.org/linux-media/20240627-multistream-v2-0-6ae96c54c=
1c3@ti.com/

>  	reg =3D csi2rx->num_lanes << 8;
>  	for (i =3D 0; i < csi2rx->num_lanes; i++) {
>  		reg |=3D CSI2RX_STATIC_CFG_DLANE_MAP(i, csi2rx->lanes[i]);
> @@ -330,6 +395,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  	reset_control_assert(csi2rx->sys_rst);
>  	clk_disable_unprepare(csi2rx->sys_clk);
> =20
> +	writel(0, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
> +
>  	for (i =3D 0; i < csi2rx->max_streams; i++) {
>  		writel(CSI2RX_STREAM_CTRL_STOP,
>  		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
> @@ -361,6 +428,21 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
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
> @@ -466,7 +548,12 @@ static const struct v4l2_subdev_video_ops csi2rx_vid=
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
> @@ -665,7 +752,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>  {
>  	struct csi2rx_priv *csi2rx;
>  	unsigned int i;
> -	int ret;
> +	int irq, ret;
> =20
>  	csi2rx =3D kzalloc(sizeof(*csi2rx), GFP_KERNEL);
>  	if (!csi2rx)
> @@ -703,6 +790,19 @@ static int csi2rx_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_cleanup;
> =20
> +	irq =3D platform_get_irq_byname_optional(to_platform_device(csi2rx->dev=
), "error");
> +

What about the other two interrupts that are required in DT?

> +	if (irq < 0) {
> +		dev_dbg(csi2rx->dev, "Optional interrupt not defined, proceeding witho=
ut it\n");
> +	} else {
> +		ret =3D devm_request_irq(csi2rx->dev, irq, csi2rx_irq_handler, 0,
> +					"csi2rx-irq", csi2rx);
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

Thanks,
Jai

--depqe2pkfz25xcrz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAme0QFAACgkQQ96R+SSa
cUXtVQ/+Oi45Ws2UddZpK74gxLQC/5UYwcb0pMiL/1HGhG6cZU2S7beFI3SB2TIv
8Go+/xYPROk5RIfcs7iAB7z1p7XmR8+OEgZEvcfIYcuQQnD5ubz6LQYgtlJ0jZDP
ODzys2p7YPtUKK57ylFhaQPtogJNy44keLX49KE7Ejcz24MP3QOozGrEVoYpht52
0oiJt/4xjAI2xZia4HeF3UQ1IA+7C6wy+SZgaePFJmBHsip+o11BQv6XakqPcnUX
vQPvd+2LeX0qdhmS9c782eCt9MoifyDLaWfXid4/KlvJFrTzw36q4kPXuZNbjPT4
RKpiDqVRiZDY5M/8eHde6jdjeLHB7GyMdanxHq2OkXcqfUCMf0oG5pZZqvPzX3ac
x1iX77sbhB+6xODeiG+b+otXWu5Bulic9q6puKmbeNKxZt0hKWox1vwZaaigwTcM
/SImkKXIDvpWNAyc3DBmc60QEay1Gy0NGOuPwQifVDlKyNyCe9xP9CO/99n+Nm95
WneKJvKq43Eoy8msNadWrbQNxpb9JR2o4xUEAsGvfCHJ57U4eOqyyA+p/67FukBH
/j8zu5+9XD/4N1+crR+Eum81ZQBPywerqrwxYVjfNWUdWSUcubjgMTpHQI7QIzbO
bjKMTWzzNMuEtFEW9UaGnd7+HJaXWwjFeII1kKa628PD7bRXRic=
=CVBr
-----END PGP SIGNATURE-----

--depqe2pkfz25xcrz--

