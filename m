Return-Path: <linux-media+bounces-15040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4539322E5
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 11:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 030AB283364
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 09:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0890617D374;
	Tue, 16 Jul 2024 09:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FH+jM99B"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233046FB8;
	Tue, 16 Jul 2024 09:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721122389; cv=none; b=eU87awxsOAUUMpZYOgdTz/KAPQMioi/HKHM27f//4YGK8MZ2Z6oNVbFTCK0rgGurzvvtypTo/MtKQuFEuzdyxbABpqrGvPJhAIiI0FTzGyNQZ+2wrfjtoXdndy1e/GUpEn0OM3h0kgvgRJs9b3xF4G6i0wlxt3s8ya1Ejf3rYcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721122389; c=relaxed/simple;
	bh=ZDEq/TsXljr8vx/ufRN8WCfzl3W9PB+0cKQ8AHmOg4I=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+XeVDxMbYJv5VMdfxBv3zOBxBwuZy5bYPi87+4Ryj7i6fcuNItTWqrbGJ2OzKd71S8h8FtyYmv+ZXWrJr/FcmsaZmeGk7wtONQ4bI25XU44jjt+VvjmuJyOT6eP13DylJw6EnDjy/mUDE/BJDTv4KBXsD9CLHxAy9LpQWstgFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FH+jM99B; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46G9WoKW099254;
	Tue, 16 Jul 2024 04:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721122370;
	bh=MMFFQwTUXWXk95wv8mo6ZgDmp0h2I2lNNn9gvGpJqiI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=FH+jM99BiMT1nNc26cGC8u5lc34VpQmPpKxV04HZoO9/GHbhdlgYhF9P+VVXEffj7
	 aoTfgIwe7vXVzOHPC4nmJszfjbUSPp2H880QheV0M8Ozwtdh0KuLio7++4AKDV7idS
	 UmdXYtXiqckbkHXBYp++Y+wUV6vaKS/TS5E66raI=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46G9Woa8004737
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Jul 2024 04:32:50 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 04:32:50 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 04:32:50 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46G9WnGl063997;
	Tue, 16 Jul 2024 04:32:49 -0500
Date: Tue, 16 Jul 2024 15:02:48 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Aradhya
 Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
        Changhuang
 Liang <changhuang.liang@starfivetech.com>,
        Jack Zhu
	<jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: Re: [PATCH v2 06/13] media: ti: j721e-csi2rx: add a subdev for
 the core device
Message-ID: <x3hku4b4ybomt3jttwckggvagzasfnj3bdztsiei5uedj5xu4n@go5lpd6kugdf>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-6-6ae96c54c1c3@ti.com>
 <jrblrr34yriz2xb4id5hpx6cbf5vdzte4jmkt535uwmyfoqsox@jvvcjtq5nlmh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ycwdwylk75oeqven"
Content-Disposition: inline
In-Reply-To: <jrblrr34yriz2xb4id5hpx6cbf5vdzte4jmkt535uwmyfoqsox@jvvcjtq5nlmh>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--ycwdwylk75oeqven
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 12, 2024 at 16:18:36 +0200, Jacopo Mondi wrote:
> On Thu, Jun 27, 2024 at 06:40:01PM GMT, Jai Luthra wrote:
> > With single stream capture, it was simpler to use the video device as
> > the media entity representing the main TI CSI2RX device. Now with multi
> > stream capture coming into the picture, the model has shifted to each
> > video device having a link to the main device's subdev. The routing
> > would then be set on this subdev.
> >
> > Add this subdev, link each context to this subdev's entity and link the
> > subdev's entity to the source. Also add an array of media pads. It will
> > have one sink pad and source pads equal to the number of contexts.
> >
> > Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > ---
> >  .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 237 +++++++++++++=
+++++---
> >  1 file changed, 212 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/dr=
ivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > index 361b0ea8e0d9..13d7426ab4ba 100644
> > --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > @@ -51,6 +51,11 @@
> >  #define MAX_WIDTH_BYTES			SZ_16K
> >  #define MAX_HEIGHT_LINES		SZ_16K
> >
> > +#define TI_CSI2RX_PAD_SINK		0
> > +#define TI_CSI2RX_PAD_FIRST_SOURCE	1
> > +#define TI_CSI2RX_NUM_SOURCE_PADS	1
> > +#define TI_CSI2RX_NUM_PADS		(1 + TI_CSI2RX_NUM_SOURCE_PADS)
> > +
> >  #define DRAIN_TIMEOUT_MS		50
> >  #define DRAIN_BUFFER_SIZE		SZ_32K
> >
> > @@ -97,6 +102,7 @@ struct ti_csi2rx_ctx {
> >  	struct mutex			mutex; /* To serialize ioctls. */
> >  	struct v4l2_format		v_fmt;
> >  	struct ti_csi2rx_dma		dma;
> > +	struct media_pad		pad;
> >  	u32				sequence;
> >  	u32				idx;
> >  };
> > @@ -104,12 +110,15 @@ struct ti_csi2rx_ctx {
> >  struct ti_csi2rx_dev {
> >  	struct device			*dev;
> >  	void __iomem			*shim;
> > +	struct mutex			mutex; /* To serialize ioctls. */
> > +	unsigned int			enable_count;
> >  	struct v4l2_device		v4l2_dev;
> >  	struct media_device		mdev;
> >  	struct media_pipeline		pipe;
> > -	struct media_pad		pad;
> > +	struct media_pad		pads[TI_CSI2RX_NUM_PADS];
> >  	struct v4l2_async_notifier	notifier;
> >  	struct v4l2_subdev		*source;
> > +	struct v4l2_subdev		subdev;
> >  	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_NUM_CTX];
> >  	/* Buffer to drain stale data from PSI-L endpoint */
> >  	struct {
> > @@ -431,6 +440,15 @@ static int csi_async_notifier_complete(struct v4l2=
_async_notifier *notifier)
> >  	struct ti_csi2rx_dev *csi =3D dev_get_drvdata(notifier->v4l2_dev->dev=
);
> >  	int ret, i;
> >
> > +	/* Create link from source to subdev */
> > +	ret =3D v4l2_create_fwnode_links_to_pad(csi->source,
>=20
> Isn't this a single link from the image source to the RX's sink pad ?
> Wouldn't media_create_pad_link() do here ?

The source here is always cdns-csi2rx bridge (and not the sensor) which=20
has multiple pads.

If we use media_create_pad_link() here, we would need to figure out the=20
correct source pad using fwnode APIs. v4l2_create_fwnode_links_to_pad()=20
helper already does that for us.

But because of your comment I realized that we are missing=20
=2Eget_fwnode_pad() callbacks in both cdns-csi2rx and this driver.

It is working by sheer luck as media_entity_get_fwnode_pad() returns the=20
first pad as fallback. I will fix this in v3.

>=20
>=20
> > +					      &csi->pads[TI_CSI2RX_PAD_SINK],
> > +					      MEDIA_LNK_FL_IMMUTABLE |
> > +					      MEDIA_LNK_FL_ENABLED);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Create and link video nodes for all DMA contexts */
> >  	for (i =3D 0; i < TI_CSI2RX_NUM_CTX; i++) {
> >  		struct ti_csi2rx_ctx *ctx =3D &csi->ctx[i];
> >  		struct video_device *vdev =3D &ctx->vdev;
> > @@ -438,13 +456,17 @@ static int csi_async_notifier_complete(struct v4l=
2_async_notifier *notifier)
> >  		ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> >  		if (ret)
> >  			goto unregister_dev;
> > -	}
> >
> > -	ret =3D v4l2_create_fwnode_links_to_pad(csi->source, &csi->pad,
> > -					      MEDIA_LNK_FL_IMMUTABLE |
> > -					      MEDIA_LNK_FL_ENABLED);
> > -	if (ret)
> > -		goto unregister_dev;
> > +		ret =3D media_create_pad_link(&csi->subdev.entity,
> > +					    TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
> > +					    &vdev->entity, 0,
> > +					    MEDIA_LNK_FL_IMMUTABLE |
> > +					    MEDIA_LNK_FL_ENABLED);
> > +		if (ret) {
> > +			video_unregister_device(vdev);
> > +			goto unregister_dev;
>=20
> Should you call media_entity_remove_links() on the csi2 entity on the
> error path ?
>=20

Will fix.

> > +		}
> > +	}
> >
> >  	ret =3D v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
> >  	if (ret)
> > @@ -859,7 +881,7 @@ static int ti_csi2rx_start_streaming(struct vb2_que=
ue *vq, unsigned int count)
> >  	dma->state =3D TI_CSI2RX_DMA_ACTIVE;
> >  	spin_unlock_irqrestore(&dma->lock, flags);
> >
> > -	ret =3D v4l2_subdev_call(csi->source, video, s_stream, 1);
> > +	ret =3D v4l2_subdev_call(&csi->subdev, video, s_stream, 1);
> >  	if (ret)
> >  		goto err_dma;
> >
> > @@ -887,7 +909,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_que=
ue *vq)
> >  	writel(0, csi->shim + SHIM_CNTL);
> >  	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
> >
> > -	ret =3D v4l2_subdev_call(csi->source, video, s_stream, 0);
> > +	ret =3D v4l2_subdev_call(&csi->subdev, video, s_stream, 0);
> >  	if (ret)
> >  		dev_err(csi->dev, "Failed to stop subdev stream\n");
> >
> > @@ -905,6 +927,119 @@ static const struct vb2_ops csi_vb2_qops =3D {
> >  	.wait_finish =3D vb2_ops_wait_finish,
> >  };
> >
> > +static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *=
sd)
> > +{
> > +	return container_of(sd, struct ti_csi2rx_dev, subdev);
> > +}
> > +
> > +static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
> > +				struct v4l2_subdev_state *state,
> > +				struct v4l2_subdev_format *format)
> > +{
> > +	struct v4l2_mbus_framefmt *fmt;
> > +	int ret =3D 0;
> > +
> > +	/* No transcoding, don't allow setting source fmt */
> > +	if (format->pad >=3D TI_CSI2RX_PAD_FIRST_SOURCE)
>=20
>=20
>                         > TI_CSI2RX_PAD_SINK
>=20
> might be clearer

Will fix.

>=20
> > +		return v4l2_subdev_get_fmt(sd, state, format);
> > +
> > +	if (!find_format_by_code(format->format.code))
> > +		format->format.code =3D ti_csi2rx_formats[0].code;
> > +
> > +	format->format.field =3D V4L2_FIELD_NONE;
>=20
> What about other colorspace related fields ?

The HW does not care about colorspace/encoding etc. and acts as=20
passthrough, so we accept whatever userspace sets for those.

>=20
> > +
> > +	fmt =3D v4l2_subdev_state_get_format(state, format->pad, format->stre=
am);
> > +	if (!fmt) {
>=20
> Can this happen ?

Yes __v4l2_subdev_state_get_format() may return NULL if userspace tried=20
to set format with an invalid `stream` (i.e. no routes exist for that=20
stream)

>=20
> > +		ret =3D -EINVAL;
> > +		goto out;
> > +	}
> > +	*fmt =3D format->format;
> > +
> > +	fmt =3D v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURC=
E,
> > +					   format->stream);
> > +	if (!fmt) {
> > +		ret =3D -EINVAL;
>=20
> ditto
>=20
> > +		goto out;
>=20
> kind of missing the point of a jump here where you can simply return
> -EINVAL

Will fix.

>=20
> > +	}
> > +	*fmt =3D format->format;
> > +
> > +out:
> > +	return ret;
> > +}
> > +
> > +static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
> > +				   struct v4l2_subdev_state *state)
> > +{
> > +	struct v4l2_subdev_format format =3D {
> > +		.pad =3D TI_CSI2RX_PAD_SINK,
> > +		.format =3D {
> > +			.width =3D 640,
> > +			.height =3D 480,
> > +			.code =3D MEDIA_BUS_FMT_UYVY8_1X16,
> > +			.field =3D V4L2_FIELD_NONE,
> > +			.colorspace =3D V4L2_COLORSPACE_SRGB,
> > +			.ycbcr_enc =3D V4L2_YCBCR_ENC_601,
> > +			.quantization =3D V4L2_QUANTIZATION_LIM_RANGE,
> > +			.xfer_func =3D V4L2_XFER_FUNC_SRGB,
> > +		},
> > +	};
> > +
> > +	return ti_csi2rx_sd_set_fmt(sd, state, &format);
> > +}
> > +
> > +static int ti_csi2rx_sd_s_stream(struct v4l2_subdev *sd, int enable)
>=20
> Even if I never used that API myself, but I have a feeling
> enable_streams() (which is meant to replace s_stream for multiplexed
> subdev) would help you avoiding the manual enable_count booking here
> below ?

In PATCH 12/13 we switch to using enable_streams() APIs here.

We still keep this enable_count bookkeeping, but I agree it can be=20
dropped with minor changes. Will fix in v3.

>=20
> > +{
> > +	struct ti_csi2rx_dev *csi =3D to_csi2rx_dev(sd);
> > +	int ret =3D 0;
> > +
> > +	mutex_lock(&csi->mutex);
> > +
> > +	if (enable) {
> > +		if (csi->enable_count > 0) {
> > +			csi->enable_count++;
> > +			goto out;
> > +		}
> > +
> > +		ret =3D v4l2_subdev_call(csi->source, video, s_stream, 1);
> > +		if (ret)
> > +			goto out;
> > +
> > +		csi->enable_count++;
> > +	} else {
> > +		if (csi->enable_count =3D=3D 0) {
> > +			ret =3D -EINVAL;
> > +			goto out;
> > +		}
> > +
> > +		if (--csi->enable_count > 0)
> > +			goto out;
> > +
> > +		ret =3D v4l2_subdev_call(csi->source, video, s_stream, 0);
> > +	}
> > +
> > +out:
> > +	mutex_unlock(&csi->mutex);
> > +	return ret;
> > +}
> > +
> > +static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops =3D {
> > +	.get_fmt =3D v4l2_subdev_get_fmt,
> > +	.set_fmt =3D ti_csi2rx_sd_set_fmt,
> > +};
> > +
> > +static const struct v4l2_subdev_video_ops ti_csi2rx_subdev_video_ops =
=3D {
> > +	.s_stream =3D ti_csi2rx_sd_s_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_ops ti_csi2rx_subdev_ops =3D {
> > +	.video =3D &ti_csi2rx_subdev_video_ops,
> > +	.pad =3D &ti_csi2rx_subdev_pad_ops,
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops ti_csi2rx_internal_ops =
=3D {
> > +	.init_state =3D ti_csi2rx_sd_init_state,
> > +};
> > +
> >  static void ti_csi2rx_cleanup_dma(struct ti_csi2rx_ctx *ctx)
> >  {
> >  	dma_release_channel(ctx->dma.chan);
> > @@ -912,6 +1047,7 @@ static void ti_csi2rx_cleanup_dma(struct ti_csi2rx=
_ctx *ctx)
> >
> >  static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
> >  {
> > +	v4l2_subdev_cleanup(&csi->subdev);
> >  	media_device_unregister(&csi->mdev);
> >  	v4l2_device_unregister(&csi->v4l2_dev);
> >  	media_device_cleanup(&csi->mdev);
> > @@ -973,14 +1109,22 @@ static int ti_csi2rx_link_validate(struct media_=
link *link)
> >  	struct v4l2_subdev_format source_fmt =3D {
> >  		.which	=3D V4L2_SUBDEV_FORMAT_ACTIVE,
> >  		.pad	=3D link->source->index,
> > +		.stream =3D 0,
>=20
> I don't think it hurts, but this seems not to be strictly related to
> this patch ?
>=20
> >  	};
> > +	struct v4l2_subdev_state *state;
> >  	const struct ti_csi2rx_fmt *ti_fmt;
> >  	int ret;
> >
> > -	ret =3D v4l2_subdev_call_state_active(csi->source, pad,
> > -					    get_fmt, &source_fmt);
> > -	if (ret)
> > -		return ret;
> > +	state =3D v4l2_subdev_lock_and_get_active_state(&csi->subdev);
> > +	ret =3D v4l2_subdev_call(&csi->subdev, pad, get_fmt, state, &source_f=
mt);
> > +	v4l2_subdev_unlock_state(state);
> > +
> > +	if (ret) {
> > +		dev_dbg(csi->dev,
> > +			"Skipping validation as no format present on \"%s\":%u:0\n",
> > +			link->source->entity->name, link->source->index);
>=20
> If get_fmt returns an error, should you simply continue or fail ? In
> which cases get_fmt on a subdev fails ? Only if the pad or the stream
> are not valid right ?

The subdev introduced in this patch has multiple source pads, all=20
actively linked to separate video nodes, one for each DMA channel.

We continue (return 0) here as we don't want __media_pipeline_start to=20
fail because of pads that are "unused" i.e. have no routes and no=20
formats set.

If the user actually routes a stream to any pad the pipeline validation=20
will check that a format is also set (and thus the link will get=20
validated here).

I wonder if we can keep the links mutable, and expect userspace to=20
disable links to unused video nodes. Will have to think more about that=20
approach.

>=20
> > +		return 0;
> > +	}
> >
> >  	if (source_fmt.format.width !=3D csi_fmt->width) {
> >  		dev_dbg(csi->dev, "Width does not match (source %u, sink %u)\n",
> > @@ -1010,8 +1154,9 @@ static int ti_csi2rx_link_validate(struct media_l=
ink *link)
> >
> >  	if (ti_fmt->fourcc !=3D csi_fmt->pixelformat) {
> >  		dev_dbg(csi->dev,
> > -			"Cannot transform source fmt 0x%x to sink fmt 0x%x\n",
> > -			ti_fmt->fourcc, csi_fmt->pixelformat);
> > +			"Cannot transform \"%s\":%u format %p4cc to %p4cc\n",
> > +			link->source->entity->name, link->source->index,
> > +			&ti_fmt->fourcc, &csi_fmt->pixelformat);
> >  		return -EPIPE;
> >  	}
> >
> > @@ -1022,6 +1167,10 @@ static const struct media_entity_operations ti_c=
si2rx_video_entity_ops =3D {
> >  	.link_validate =3D ti_csi2rx_link_validate,
> >  };
> >
> > +static const struct media_entity_operations ti_csi2rx_subdev_entity_op=
s =3D {
> > +	.link_validate =3D v4l2_subdev_link_validate,
> > +};
> > +
> >  static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
> >  {
> >  	struct dma_slave_config cfg =3D {
> > @@ -1053,7 +1202,8 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ct=
x *ctx)
> >  static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
> >  {
> >  	struct media_device *mdev =3D &csi->mdev;
> > -	int ret;
> > +	struct v4l2_subdev *sd =3D &csi->subdev;
> > +	int ret, i;
> >
> >  	mdev->dev =3D csi->dev;
> >  	mdev->hw_revision =3D 1;
> > @@ -1065,16 +1215,50 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx=
_dev *csi)
> >
> >  	ret =3D v4l2_device_register(csi->dev, &csi->v4l2_dev);
> >  	if (ret)
> > -		return ret;
> > +		goto cleanup_media;
> >
> >  	ret =3D media_device_register(mdev);
> > -	if (ret) {
> > -		v4l2_device_unregister(&csi->v4l2_dev);
> > -		media_device_cleanup(mdev);
> > -		return ret;
> > -	}
> > +	if (ret)
> > +		goto unregister_v4l2;
> > +
> > +	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
> > +	sd->internal_ops =3D &ti_csi2rx_internal_ops;
> > +	sd->entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> > +	sd->flags =3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
> > +	sd->dev =3D csi->dev;
> > +	sd->entity.ops =3D &ti_csi2rx_subdev_entity_ops;
> > +
> > +	csi->pads[TI_CSI2RX_PAD_SINK].flags =3D MEDIA_PAD_FL_SINK;
> > +
> > +	for (i =3D TI_CSI2RX_PAD_FIRST_SOURCE; i < TI_CSI2RX_NUM_PADS; i++)
>=20
>         for (unsigned int i =3D 0;

Will fix.

>=20
> > +		csi->pads[i].flags =3D MEDIA_PAD_FL_SOURCE;
> > +
> > +	ret =3D media_entity_pads_init(&sd->entity, ARRAY_SIZE(csi->pads),
> > +				     csi->pads);
> > +	if (ret)
> > +		goto unregister_media;
> > +
> > +	ret =3D v4l2_subdev_init_finalize(sd);
> > +	if (ret)
> > +		goto unregister_media;
> > +
> > +	ret =3D v4l2_device_register_subdev(&csi->v4l2_dev, sd);
> > +	if (ret)
> > +		goto cleanup_subdev;
> >
> >  	return 0;
> > +
> > +cleanup_subdev:
> > +	v4l2_subdev_cleanup(sd);
> > +unregister_media:
> > +	media_device_unregister(mdev);
> > +unregister_v4l2:
> > +	v4l2_device_unregister(&csi->v4l2_dev);
> > +cleanup_media:
> > +	media_device_cleanup(mdev);
> > +
> > +	return ret;
> >  }
> >
> >  static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
> > @@ -1101,9 +1285,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ct=
x *ctx)
> >
> >  	ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
> >
> > -	csi->pad.flags =3D MEDIA_PAD_FL_SINK;
>=20
> Ah was this re-initializing the same pad multiple times ?

Not sure I understand the comment fully. We have only 1 video context=20
here, more contexts will be introduced in subsequent patches.

>=20
> > +	ctx->pad.flags =3D MEDIA_PAD_FL_SINK;
> >  	vdev->entity.ops =3D &ti_csi2rx_video_entity_ops;
> > -	ret =3D media_entity_pads_init(&ctx->vdev.entity, 1, &csi->pad);
> > +	ret =3D media_entity_pads_init(&ctx->vdev.entity, 1, &ctx->pad);
> >  	if (ret)
> >  		return ret;
> >
> > @@ -1159,6 +1343,8 @@ static int ti_csi2rx_probe(struct platform_device=
 *pdev)
> >  	if (!csi->drain.vaddr)
> >  		return -ENOMEM;
> >
> > +	mutex_init(&csi->mutex);
> > +
> >  	ret =3D ti_csi2rx_v4l2_init(csi);
> >  	if (ret)
> >  		goto err_v4l2;
> > @@ -1191,6 +1377,7 @@ static int ti_csi2rx_probe(struct platform_device=
 *pdev)
> >  		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
> >  	ti_csi2rx_cleanup_v4l2(csi);
> >  err_v4l2:
> > +	mutex_destroy(&csi->mutex);
> >  	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
> >  			  csi->drain.paddr);
> >  	return ret;
> > @@ -1213,7 +1400,7 @@ static void ti_csi2rx_remove(struct platform_devi=
ce *pdev)
> >
> >  	ti_csi2rx_cleanup_notifier(csi);
> >  	ti_csi2rx_cleanup_v4l2(csi);
> > -
> > +	mutex_destroy(&csi->mutex);
> >  	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
> >  			  csi->drain.paddr);
> >  }
> >
> > --
> > 2.43.0
> >
> >

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--ycwdwylk75oeqven
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmaWPkAACgkQQ96R+SSa
cUVHKhAAxdgf3u/Gy/0Dq9CG356vLRRh5Uzpj+VuDGKAUPvJA6XQ9D/02TG7Way3
F+9nv9v23DRESthTUC97Kwsc+vSbgV54yfkYY7gi9nbysl36zVRLDycgDvVKyK0c
AHcYy2FA1gCbh3f0GHpPmpcZT9gUOhiqTG6CdYiWhBrj+Ouuj/rkyCM/tMVk3QKG
uww6kfGilHeXGhRXlI27y1G7FbgWu6WeCUxwR07PjDXeZWWKLOUGBHRzj+wXdLn2
A7unhztIPdar871lzVp7dDm8fxX+iYENpZjHk0sohHoNTa4cCCcvUgH7/v7i6CHr
KMipuv7UdBSVuSPNKxAcTPd8EleYRcBX8HEastjalaHt/r4OrMtXrtbXPEeZ8EIt
58PA90tPErDv97AzZQ28JujEzhTQBP9ERxtPS/nTSiwsHwh2TA8EBl/DwKE1YJGG
ms67W9KfRNnUqF8phEjvPEYYS1jXK+vYxmZjJUuNnHPz4Q8I09eRjsIENTE0JrnO
ylNT4r8HfFHvSuja+KUYPXAjktNWMhuUlSANYlocYa3CQhxqMffiUGXRtr1kHTNN
aq3Yf/ObuJ+kgKSDJGNpR+svm70qa9tPK0xdJqMPZq+hlWckBGNremlPfSIuvaeV
1uY4PIqv7unuwo9k2lzp7HZLHy8wlRg93JWNhy8767Lk/zzlRf4=
=Bzzd
-----END PGP SIGNATURE-----

--ycwdwylk75oeqven--

