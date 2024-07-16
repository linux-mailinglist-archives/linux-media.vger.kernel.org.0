Return-Path: <linux-media+bounces-15038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A4C932296
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 11:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AF222841BF
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 09:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37915195FE3;
	Tue, 16 Jul 2024 09:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YLarSH3b"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8DA157A43;
	Tue, 16 Jul 2024 09:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721121559; cv=none; b=DBWyaOIe05wIJnvkivm0S+mgs/rqWa6F4nLKd1WwQOOnpPif/52cQ6LuI3bqRjmqpp7Pd/0lULt5aObRp/WsdKQe2k6cIzUiwJRnzmJ32OREzloIyWx7slSZBsNjjxkIZThVkW0/UYAYEvYYVkVFJhTW9yT77CljS6nf5jyVDFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721121559; c=relaxed/simple;
	bh=csWI6+BsV47iVIy8MWkxcvQMlp/fQX9y0yu9h5x/4ak=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UIC08Kp0wRCzY6by25GYxvbBzNOxYNCGKcgB/jz6F378uhmmGPuHlgeFHgGPG0aPga5IK9jTs7uIKJQALKMG5ckMjutvKN0q7ZSgusmS5PAbI9V5BNW052J48lK9vc/PgTrDIQINjdI8B0FzkvLTGA8sXk3yp9RYq3vd3ZptLZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YLarSH3b; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46G9IvWh101741;
	Tue, 16 Jul 2024 04:18:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721121537;
	bh=hvbCiimm4fAWUB+XFm7PrmjkSfdvNAwRgXxM07Rqi2I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YLarSH3bIsRY1yo7+9SjZuhyzbGe0r6pnTgXOXHVSK/HlUmFWLDvAp8NaIttJC6ET
	 Pn89LL6OzL20Kllrz6n5irhZ1L2RXY2s6lJ7EVYC9gqSKdgNHj+Vil8OK2KvikiGXE
	 kJPS7mkIduzuoSz+lAUNQMInWKIDzy8RnTFD8ikE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46G9IvMZ127575
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Jul 2024 04:18:57 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 04:18:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 04:18:57 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46G9IuMN043432;
	Tue, 16 Jul 2024 04:18:57 -0500
Date: Tue, 16 Jul 2024 14:48:56 +0530
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
Subject: Re: Re: [PATCH v2 03/13] media: ti: j721e-csi2rx: separate out
 device and context
Message-ID: <vi2onrvjpqzyevvehct3drf7da3zmz2fuowaiyoxwmvb537nlt@5wpunccc7pek>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-3-6ae96c54c1c3@ti.com>
 <6ho73ubcxq344i63aqwj7p36lptondqp5ue3nb4gf5dlglx2zv@d36zp3nafx4q>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x2lr2ebclbklucc2"
Content-Disposition: inline
In-Reply-To: <6ho73ubcxq344i63aqwj7p36lptondqp5ue3nb4gf5dlglx2zv@d36zp3nafx4q>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

--x2lr2ebclbklucc2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

Thanks for the review.

On Jul 12, 2024 at 15:35:51 +0200, Jacopo Mondi wrote:
> Hi Jai
>=20
> On Thu, Jun 27, 2024 at 06:39:58PM GMT, Jai Luthra wrote:
> > The TI CSI2RX wrapper has two parts: the main device and the DMA
> > contexts. The driver was originally written with single camera capture
> > in mind, so only one DMA context was needed. For the sake of simplicity,
> > the context specific stuff was not modeled different to the main device.
> >
> > To enable multiplexed stream capture, the contexts need to be separated
> > out from the main device. Create a struct ti_csi2rx_ctx that holds the
> > DMA context specific things. Separate out functions handling the device
> > and context related functionality.
> >
> > Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > ---
> >  .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 423 ++++++++++++-=
--------
> >  1 file changed, 242 insertions(+), 181 deletions(-)
> >
> > diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/dr=
ivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > index 22442fce7607..d8dfe0002b72 100644
> > --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> > @@ -40,6 +40,8 @@
> >  #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
> >
> >  #define PSIL_WORD_SIZE_BYTES		16
> > +#define TI_CSI2RX_NUM_CTX		1
> > +
> >  /*
> >   * There are no hard limits on the width or height. The DMA engine can=
 handle
> >   * all sizes. The max width and height are arbitrary numbers for this =
driver.
> > @@ -64,7 +66,7 @@ struct ti_csi2rx_buffer {
> >  	/* Common v4l2 buffer. Must be first. */
> >  	struct vb2_v4l2_buffer		vb;
> >  	struct list_head		list;
> > -	struct ti_csi2rx_dev		*csi;
> > +	struct ti_csi2rx_ctx		*ctx;
> >  };
> >
> >  enum ti_csi2rx_dma_state {
> > @@ -84,29 +86,37 @@ struct ti_csi2rx_dma {
> >  	 * Queue of buffers submitted to DMA engine.
> >  	 */
> >  	struct list_head		submitted;
> > -	/* Buffer to drain stale data from PSI-L endpoint */
> > -	struct {
> > -		void			*vaddr;
> > -		dma_addr_t		paddr;
> > -		size_t			len;
> > -	} drain;
> > +};
> > +
> > +struct ti_csi2rx_dev;
> > +
> > +struct ti_csi2rx_ctx {
> > +	struct ti_csi2rx_dev		*csi;
> > +	struct video_device		vdev;
> > +	struct vb2_queue		vidq;
> > +	struct mutex			mutex; /* To serialize ioctls. */
> > +	struct v4l2_format		v_fmt;
> > +	struct ti_csi2rx_dma		dma;
> > +	u32				sequence;
> > +	u32				idx;
> >  };
> >
> >  struct ti_csi2rx_dev {
> >  	struct device			*dev;
> >  	void __iomem			*shim;
> >  	struct v4l2_device		v4l2_dev;
> > -	struct video_device		vdev;
> >  	struct media_device		mdev;
> >  	struct media_pipeline		pipe;
> >  	struct media_pad		pad;
> >  	struct v4l2_async_notifier	notifier;
> >  	struct v4l2_subdev		*source;
> > -	struct vb2_queue		vidq;
> > -	struct mutex			mutex; /* To serialize ioctls. */
> > -	struct v4l2_format		v_fmt;
> > -	struct ti_csi2rx_dma		dma;
> > -	u32				sequence;
> > +	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_NUM_CTX];
> > +	/* Buffer to drain stale data from PSI-L endpoint */
> > +	struct {
> > +		void			*vaddr;
> > +		dma_addr_t		paddr;
> > +		size_t			len;
> > +	} drain;
> >  };
> >
> >  static const struct ti_csi2rx_fmt ti_csi2rx_formats[] =3D {
> > @@ -212,7 +222,7 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats=
[] =3D {
> >  };
> >
> >  /* Forward declaration needed by ti_csi2rx_dma_callback. */
> > -static int ti_csi2rx_start_dma(struct ti_csi2rx_dev *csi,
> > +static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
> >  			       struct ti_csi2rx_buffer *buf);
> >
> >  static const struct ti_csi2rx_fmt *find_format_by_fourcc(u32 pixelform=
at)
> > @@ -302,7 +312,7 @@ static int ti_csi2rx_enum_fmt_vid_cap(struct file *=
file, void *priv,
> >  static int ti_csi2rx_g_fmt_vid_cap(struct file *file, void *prov,
> >  				   struct v4l2_format *f)
> >  {
> > -	struct ti_csi2rx_dev *csi =3D video_drvdata(file);
> > +	struct ti_csi2rx_ctx *csi =3D video_drvdata(file);
> >
> >  	*f =3D csi->v_fmt;
> >
> > @@ -333,7 +343,7 @@ static int ti_csi2rx_try_fmt_vid_cap(struct file *f=
ile, void *priv,
> >  static int ti_csi2rx_s_fmt_vid_cap(struct file *file, void *priv,
> >  				   struct v4l2_format *f)
> >  {
> > -	struct ti_csi2rx_dev *csi =3D video_drvdata(file);
> > +	struct ti_csi2rx_ctx *csi =3D video_drvdata(file);
> >  	struct vb2_queue *q =3D &csi->vidq;
> >  	int ret;
> >
> > @@ -419,25 +429,33 @@ static int csi_async_notifier_bound(struct v4l2_a=
sync_notifier *notifier,
> >  static int csi_async_notifier_complete(struct v4l2_async_notifier *not=
ifier)
> >  {
> >  	struct ti_csi2rx_dev *csi =3D dev_get_drvdata(notifier->v4l2_dev->dev=
);
> > -	struct video_device *vdev =3D &csi->vdev;
> > -	int ret;
> > +	int ret, i;
> >
> > -	ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> > -	if (ret)
> > -		return ret;
> > +	for (i =3D 0; i < TI_CSI2RX_NUM_CTX; i++) {
> > +		struct ti_csi2rx_ctx *ctx =3D &csi->ctx[i];
> > +		struct video_device *vdev =3D &ctx->vdev;
> >
> > -	ret =3D v4l2_create_fwnode_links_to_pad(csi->source, &csi->pad,
> > -					      MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED);
> > -
> > -	if (ret) {
> > -		video_unregister_device(vdev);
> > -		return ret;
> > +		ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> > +		if (ret)
> > +			goto unregister_dev;
> >  	}
> >
> > +	ret =3D v4l2_create_fwnode_links_to_pad(csi->source, &csi->pad,
> > +					      MEDIA_LNK_FL_IMMUTABLE |
> > +					      MEDIA_LNK_FL_ENABLED);
> > +	if (ret)
> > +		goto unregister_dev;
> > +
> >  	ret =3D v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
> >  	if (ret)
> > -		video_unregister_device(vdev);
> > +		goto unregister_dev;
> > +
> > +	return 0;
> >
> > +unregister_dev:
> > +	i--;
> > +	for (; i >=3D 0; i--)
> > +		video_unregister_device(&csi->ctx[i].vdev);
> >  	return ret;
> >  }
> >
> > @@ -483,12 +501,13 @@ static int ti_csi2rx_notifier_register(struct ti_=
csi2rx_dev *csi)
> >  	return 0;
> >  }
> >
> > -static void ti_csi2rx_setup_shim(struct ti_csi2rx_dev *csi)
> > +static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
> >  {
> > +	struct ti_csi2rx_dev *csi =3D ctx->csi;
> >  	const struct ti_csi2rx_fmt *fmt;
> >  	unsigned int reg;
> >
> > -	fmt =3D find_format_by_fourcc(csi->v_fmt.fmt.pix.pixelformat);
> > +	fmt =3D find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
> >
> >  	/* De-assert the pixel interface reset. */
> >  	reg =3D SHIM_CNTL_PIX_RST;
> > @@ -555,8 +574,9 @@ static void ti_csi2rx_drain_callback(void *param)
> >   * To prevent that stale data corrupting the subsequent transactions, =
it is
> >   * required to issue DMA requests to drain it out.
> >   */
> > -static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev *csi)
> > +static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
> >  {
> > +	struct ti_csi2rx_dev *csi =3D ctx->csi;
> >  	struct dma_async_tx_descriptor *desc;
> >  	struct completion drain_complete;
> >  	dma_cookie_t cookie;
> > @@ -564,8 +584,8 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev=
 *csi)
> >
> >  	init_completion(&drain_complete);
> >
> > -	desc =3D dmaengine_prep_slave_single(csi->dma.chan, csi->dma.drain.pa=
ddr,
> > -					   csi->dma.drain.len, DMA_DEV_TO_MEM,
> > +	desc =3D dmaengine_prep_slave_single(ctx->dma.chan, csi->drain.paddr,
> > +					   csi->drain.len, DMA_DEV_TO_MEM,
> >  					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
> >  	if (!desc) {
> >  		ret =3D -EIO;
> > @@ -580,11 +600,11 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_d=
ev *csi)
> >  	if (ret)
> >  		goto out;
> >
> > -	dma_async_issue_pending(csi->dma.chan);
> > +	dma_async_issue_pending(ctx->dma.chan);
> >
> >  	if (!wait_for_completion_timeout(&drain_complete,
> >  					 msecs_to_jiffies(DRAIN_TIMEOUT_MS))) {
> > -		dmaengine_terminate_sync(csi->dma.chan);
> > +		dmaengine_terminate_sync(ctx->dma.chan);
> >  		dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
> >  		ret =3D -ETIMEDOUT;
> >  		goto out;
> > @@ -596,8 +616,8 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_dev=
 *csi)
> >  static void ti_csi2rx_dma_callback(void *param)
> >  {
> >  	struct ti_csi2rx_buffer *buf =3D param;
> > -	struct ti_csi2rx_dev *csi =3D buf->csi;
> > -	struct ti_csi2rx_dma *dma =3D &csi->dma;
> > +	struct ti_csi2rx_ctx *ctx =3D buf->ctx;
> > +	struct ti_csi2rx_dma *dma =3D &ctx->dma;
> >  	unsigned long flags;
> >
> >  	/*
> > @@ -605,7 +625,7 @@ static void ti_csi2rx_dma_callback(void *param)
> >  	 * hardware monitor registers.
> >  	 */
> >  	buf->vb.vb2_buf.timestamp =3D ktime_get_ns();
> > -	buf->vb.sequence =3D csi->sequence++;
> > +	buf->vb.sequence =3D ctx->sequence++;
> >
> >  	spin_lock_irqsave(&dma->lock, flags);
> >
> > @@ -617,8 +637,9 @@ static void ti_csi2rx_dma_callback(void *param)
> >  	while (!list_empty(&dma->queue)) {
> >  		buf =3D list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
> >
> > -		if (ti_csi2rx_start_dma(csi, buf)) {
> > -			dev_err(csi->dev, "Failed to queue the next buffer for DMA\n");
> > +		if (ti_csi2rx_start_dma(ctx, buf)) {
> > +			dev_err(ctx->csi->dev,
> > +				"Failed to queue the next buffer for DMA\n");
> >  			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> >  		} else {
> >  			list_move_tail(&buf->list, &dma->submitted);
> > @@ -631,17 +652,17 @@ static void ti_csi2rx_dma_callback(void *param)
> >  	spin_unlock_irqrestore(&dma->lock, flags);
> >  }
> >
> > -static int ti_csi2rx_start_dma(struct ti_csi2rx_dev *csi,
> > +static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
> >  			       struct ti_csi2rx_buffer *buf)
> >  {
> >  	unsigned long addr;
> >  	struct dma_async_tx_descriptor *desc;
> > -	size_t len =3D csi->v_fmt.fmt.pix.sizeimage;
> > +	size_t len =3D ctx->v_fmt.fmt.pix.sizeimage;
> >  	dma_cookie_t cookie;
> >  	int ret =3D 0;
> >
> >  	addr =3D vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
> > -	desc =3D dmaengine_prep_slave_single(csi->dma.chan, addr, len,
> > +	desc =3D dmaengine_prep_slave_single(ctx->dma.chan, addr, len,
> >  					   DMA_DEV_TO_MEM,
> >  					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
> >  	if (!desc)
> > @@ -655,20 +676,20 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_d=
ev *csi,
> >  	if (ret)
> >  		return ret;
> >
> > -	dma_async_issue_pending(csi->dma.chan);
> > +	dma_async_issue_pending(ctx->dma.chan);
> >
> >  	return 0;
> >  }
> >
> > -static void ti_csi2rx_stop_dma(struct ti_csi2rx_dev *csi)
> > +static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
> >  {
> > -	struct ti_csi2rx_dma *dma =3D &csi->dma;
> > +	struct ti_csi2rx_dma *dma =3D &ctx->dma;
> >  	enum ti_csi2rx_dma_state state;
> >  	unsigned long flags;
> >  	int ret;
> >
> >  	spin_lock_irqsave(&dma->lock, flags);
> > -	state =3D csi->dma.state;
> > +	state =3D ctx->dma.state;
> >  	dma->state =3D TI_CSI2RX_DMA_STOPPED;
> >  	spin_unlock_irqrestore(&dma->lock, flags);
> >
> > @@ -679,30 +700,30 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_d=
ev *csi)
> >  		 * is stopped, as the module-level pixel reset cannot be
> >  		 * enforced before terminating DMA.
> >  		 */
> > -		ret =3D ti_csi2rx_drain_dma(csi);
> > +		ret =3D ti_csi2rx_drain_dma(ctx);
> >  		if (ret && ret !=3D -ETIMEDOUT)
> > -			dev_warn(csi->dev,
> > +			dev_warn(ctx->csi->dev,
> >  				 "Failed to drain DMA. Next frame might be bogus\n");
> >  	}
> >
> > -	ret =3D dmaengine_terminate_sync(csi->dma.chan);
> > +	ret =3D dmaengine_terminate_sync(ctx->dma.chan);
> >  	if (ret)
> > -		dev_err(csi->dev, "Failed to stop DMA: %d\n", ret);
> > +		dev_err(ctx->csi->dev, "Failed to stop DMA: %d\n", ret);
> >  }
> >
> > -static void ti_csi2rx_cleanup_buffers(struct ti_csi2rx_dev *csi,
> > +static void ti_csi2rx_cleanup_buffers(struct ti_csi2rx_ctx *ctx,
> >  				      enum vb2_buffer_state state)
> >  {
> > -	struct ti_csi2rx_dma *dma =3D &csi->dma;
> > +	struct ti_csi2rx_dma *dma =3D &ctx->dma;
> >  	struct ti_csi2rx_buffer *buf, *tmp;
> >  	unsigned long flags;
> >
> >  	spin_lock_irqsave(&dma->lock, flags);
> > -	list_for_each_entry_safe(buf, tmp, &csi->dma.queue, list) {
> > +	list_for_each_entry_safe(buf, tmp, &ctx->dma.queue, list) {
> >  		list_del(&buf->list);
> >  		vb2_buffer_done(&buf->vb.vb2_buf, state);
> >  	}
> > -	list_for_each_entry_safe(buf, tmp, &csi->dma.submitted, list) {
> > +	list_for_each_entry_safe(buf, tmp, &ctx->dma.submitted, list) {
> >  		list_del(&buf->list);
> >  		vb2_buffer_done(&buf->vb.vb2_buf, state);
> >  	}
> > @@ -713,8 +734,8 @@ static int ti_csi2rx_queue_setup(struct vb2_queue *=
q, unsigned int *nbuffers,
> >  				 unsigned int *nplanes, unsigned int sizes[],
> >  				 struct device *alloc_devs[])
> >  {
> > -	struct ti_csi2rx_dev *csi =3D vb2_get_drv_priv(q);
> > -	unsigned int size =3D csi->v_fmt.fmt.pix.sizeimage;
> > +	struct ti_csi2rx_ctx *ctx =3D vb2_get_drv_priv(q);
> > +	unsigned int size =3D ctx->v_fmt.fmt.pix.sizeimage;
> >
> >  	if (*nplanes) {
> >  		if (sizes[0] < size)
> > @@ -730,11 +751,11 @@ static int ti_csi2rx_queue_setup(struct vb2_queue=
 *q, unsigned int *nbuffers,
> >
> >  static int ti_csi2rx_buffer_prepare(struct vb2_buffer *vb)
> >  {
> > -	struct ti_csi2rx_dev *csi =3D vb2_get_drv_priv(vb->vb2_queue);
> > -	unsigned long size =3D csi->v_fmt.fmt.pix.sizeimage;
> > +	struct ti_csi2rx_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> > +	unsigned long size =3D ctx->v_fmt.fmt.pix.sizeimage;
> >
> >  	if (vb2_plane_size(vb, 0) < size) {
> > -		dev_err(csi->dev, "Data will not fit into plane\n");
> > +		dev_err(ctx->csi->dev, "Data will not fit into plane\n");
> >  		return -EINVAL;
> >  	}
> >
> > @@ -744,15 +765,15 @@ static int ti_csi2rx_buffer_prepare(struct vb2_bu=
ffer *vb)
> >
> >  static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
> >  {
> > -	struct ti_csi2rx_dev *csi =3D vb2_get_drv_priv(vb->vb2_queue);
> > +	struct ti_csi2rx_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> >  	struct ti_csi2rx_buffer *buf;
> > -	struct ti_csi2rx_dma *dma =3D &csi->dma;
> > +	struct ti_csi2rx_dma *dma =3D &ctx->dma;
> >  	bool restart_dma =3D false;
> >  	unsigned long flags =3D 0;
> >  	int ret;
> >
> >  	buf =3D container_of(vb, struct ti_csi2rx_buffer, vb.vb2_buf);
> > -	buf->csi =3D csi;
> > +	buf->ctx =3D ctx;
> >
> >  	spin_lock_irqsave(&dma->lock, flags);
> >  	/*
> > @@ -781,18 +802,18 @@ static void ti_csi2rx_buffer_queue(struct vb2_buf=
fer *vb)
> >  		 * the application and will only confuse it. Issue a DMA
> >  		 * transaction to drain that up.
> >  		 */
> > -		ret =3D ti_csi2rx_drain_dma(csi);
> > +		ret =3D ti_csi2rx_drain_dma(ctx);
> >  		if (ret && ret !=3D -ETIMEDOUT)
> > -			dev_warn(csi->dev,
> > +			dev_warn(ctx->csi->dev,
> >  				 "Failed to drain DMA. Next frame might be bogus\n");
> >
> >  		spin_lock_irqsave(&dma->lock, flags);
> > -		ret =3D ti_csi2rx_start_dma(csi, buf);
> > +		ret =3D ti_csi2rx_start_dma(ctx, buf);
> >  		if (ret) {
> >  			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> >  			dma->state =3D TI_CSI2RX_DMA_IDLE;
> >  			spin_unlock_irqrestore(&dma->lock, flags);
> > -			dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
> > +			dev_err(ctx->csi->dev, "Failed to start DMA: %d\n", ret);
> >  		} else {
> >  			list_add_tail(&buf->list, &dma->submitted);
> >  			spin_unlock_irqrestore(&dma->lock, flags);
> > @@ -802,8 +823,9 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffe=
r *vb)
> >
> >  static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned in=
t count)
> >  {
> > -	struct ti_csi2rx_dev *csi =3D vb2_get_drv_priv(vq);
> > -	struct ti_csi2rx_dma *dma =3D &csi->dma;
> > +	struct ti_csi2rx_ctx *ctx =3D vb2_get_drv_priv(vq);
> > +	struct ti_csi2rx_dev *csi =3D ctx->csi;
> > +	struct ti_csi2rx_dma *dma =3D &ctx->dma;
> >  	struct ti_csi2rx_buffer *buf;
> >  	unsigned long flags;
> >  	int ret =3D 0;
> > @@ -815,18 +837,18 @@ static int ti_csi2rx_start_streaming(struct vb2_q=
ueue *vq, unsigned int count)
> >  	if (ret)
> >  		return ret;
> >
> > -	ret =3D video_device_pipeline_start(&csi->vdev, &csi->pipe);
> > +	ret =3D video_device_pipeline_start(&ctx->vdev, &csi->pipe);
> >  	if (ret)
> >  		goto err;
> >
> > -	ti_csi2rx_setup_shim(csi);
> > +	ti_csi2rx_setup_shim(ctx);
> >
> > -	csi->sequence =3D 0;
> > +	ctx->sequence =3D 0;
> >
> >  	spin_lock_irqsave(&dma->lock, flags);
> >  	buf =3D list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
> >
> > -	ret =3D ti_csi2rx_start_dma(csi, buf);
> > +	ret =3D ti_csi2rx_start_dma(ctx, buf);
> >  	if (ret) {
> >  		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
> >  		spin_unlock_irqrestore(&dma->lock, flags);
> > @@ -844,22 +866,23 @@ static int ti_csi2rx_start_streaming(struct vb2_q=
ueue *vq, unsigned int count)
> >  	return 0;
> >
> >  err_dma:
> > -	ti_csi2rx_stop_dma(csi);
> > +	ti_csi2rx_stop_dma(ctx);
> >  err_pipeline:
> > -	video_device_pipeline_stop(&csi->vdev);
> > +	video_device_pipeline_stop(&ctx->vdev);
> >  	writel(0, csi->shim + SHIM_CNTL);
> >  	writel(0, csi->shim + SHIM_DMACNTX);
> >  err:
> > -	ti_csi2rx_cleanup_buffers(csi, VB2_BUF_STATE_QUEUED);
> > +	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
> >  	return ret;
> >  }
> >
> >  static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
> >  {
> > -	struct ti_csi2rx_dev *csi =3D vb2_get_drv_priv(vq);
> > +	struct ti_csi2rx_ctx *ctx =3D vb2_get_drv_priv(vq);
> > +	struct ti_csi2rx_dev *csi =3D ctx->csi;
> >  	int ret;
> >
> > -	video_device_pipeline_stop(&csi->vdev);
> > +	video_device_pipeline_stop(&ctx->vdev);
> >
> >  	writel(0, csi->shim + SHIM_CNTL);
> >  	writel(0, csi->shim + SHIM_DMACNTX);
> > @@ -868,8 +891,8 @@ static void ti_csi2rx_stop_streaming(struct vb2_que=
ue *vq)
> >  	if (ret)
> >  		dev_err(csi->dev, "Failed to stop subdev stream\n");
> >
> > -	ti_csi2rx_stop_dma(csi);
> > -	ti_csi2rx_cleanup_buffers(csi, VB2_BUF_STATE_ERROR);
> > +	ti_csi2rx_stop_dma(ctx);
> > +	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
> >  }
> >
> >  static const struct vb2_ops csi_vb2_qops =3D {
> > @@ -882,27 +905,60 @@ static const struct vb2_ops csi_vb2_qops =3D {
> >  	.wait_finish =3D vb2_ops_wait_finish,
> >  };
> >
> > -static int ti_csi2rx_init_vb2q(struct ti_csi2rx_dev *csi)
> > +static void ti_csi2rx_cleanup_dma(struct ti_csi2rx_ctx *ctx)
>=20
> Is it worth a wrapper function ?
>=20
> >  {
> > -	struct vb2_queue *q =3D &csi->vidq;
> > +	dma_release_channel(ctx->dma.chan);
> > +}
> > +
> > +static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
> > +{
> > +	media_device_unregister(&csi->mdev);
> > +	v4l2_device_unregister(&csi->v4l2_dev);
> > +	media_device_cleanup(&csi->mdev);
> > +}
> > +
> > +static void ti_csi2rx_cleanup_notifier(struct ti_csi2rx_dev *csi)
> > +{
> > +	v4l2_async_nf_unregister(&csi->notifier);
> > +	v4l2_async_nf_cleanup(&csi->notifier);
> > +}
> > +
> > +static void ti_csi2rx_cleanup_vb2q(struct ti_csi2rx_ctx *ctx)
>=20
> Has a single caller, can be inlined maybe ?
>=20
> > +{
> > +	vb2_queue_release(&ctx->vidq);
> > +}
> > +
> > +static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
> > +{
> > +	ti_csi2rx_cleanup_dma(ctx);
> > +	ti_csi2rx_cleanup_vb2q(ctx);
>=20
> So this would become
>=20
>         dma_release_channel(ctx->dma.chan);
>         vb2_queue_release(&ctx->vidq);
>=20

Good catch, will update in v3.

> > +
> > +	video_unregister_device(&ctx->vdev);
> > +
> > +	mutex_destroy(&ctx->mutex);
> > +}
> > +
> > +static int ti_csi2rx_init_vb2q(struct ti_csi2rx_ctx *ctx)
> > +{
> > +	struct vb2_queue *q =3D &ctx->vidq;
> >  	int ret;
> >
> >  	q->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
> >  	q->io_modes =3D VB2_MMAP | VB2_DMABUF;
> > -	q->drv_priv =3D csi;
> > +	q->drv_priv =3D ctx;
> >  	q->buf_struct_size =3D sizeof(struct ti_csi2rx_buffer);
> >  	q->ops =3D &csi_vb2_qops;
> >  	q->mem_ops =3D &vb2_dma_contig_memops;
> >  	q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > -	q->dev =3D dmaengine_get_dma_device(csi->dma.chan);
> > -	q->lock =3D &csi->mutex;
> > +	q->dev =3D dmaengine_get_dma_device(ctx->dma.chan);
> > +	q->lock =3D &ctx->mutex;
> >  	q->min_queued_buffers =3D 1;
> >
> >  	ret =3D vb2_queue_init(q);
> >  	if (ret)
> >  		return ret;
> >
> > -	csi->vdev.queue =3D q;
> > +	ctx->vdev.queue =3D q;
> >
> >  	return 0;
> >  }
> > @@ -911,8 +967,9 @@ static int ti_csi2rx_link_validate(struct media_lin=
k *link)
> >  {
> >  	struct media_entity *entity =3D link->sink->entity;
> >  	struct video_device *vdev =3D media_entity_to_video_device(entity);
> > -	struct ti_csi2rx_dev *csi =3D container_of(vdev, struct ti_csi2rx_dev=
, vdev);
> > -	struct v4l2_pix_format *csi_fmt =3D &csi->v_fmt.fmt.pix;
> > +	struct ti_csi2rx_ctx *ctx =3D container_of(vdev, struct ti_csi2rx_ctx=
, vdev);
> > +	struct ti_csi2rx_dev *csi =3D ctx->csi;
> > +	struct v4l2_pix_format *csi_fmt =3D &ctx->v_fmt.fmt.pix;
> >  	struct v4l2_subdev_format source_fmt =3D {
> >  		.which	=3D V4L2_SUBDEV_FORMAT_ACTIVE,
> >  		.pad	=3D link->source->index,
> > @@ -965,47 +1022,69 @@ static const struct media_entity_operations ti_c=
si2rx_video_entity_ops =3D {
> >  	.link_validate =3D ti_csi2rx_link_validate,
> >  };
> >
> > -static int ti_csi2rx_init_dma(struct ti_csi2rx_dev *csi)
> > +static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
> >  {
> >  	struct dma_slave_config cfg =3D {
> >  		.src_addr_width =3D DMA_SLAVE_BUSWIDTH_16_BYTES,
> >  	};
> >  	int ret;
> >
> > -	INIT_LIST_HEAD(&csi->dma.queue);
> > -	INIT_LIST_HEAD(&csi->dma.submitted);
> > -	spin_lock_init(&csi->dma.lock);
> > +	INIT_LIST_HEAD(&ctx->dma.queue);
> > +	INIT_LIST_HEAD(&ctx->dma.submitted);
> > +	spin_lock_init(&ctx->dma.lock);
> >
> > -	csi->dma.state =3D TI_CSI2RX_DMA_STOPPED;
> > +	ctx->dma.state =3D TI_CSI2RX_DMA_STOPPED;
> >
> > -	csi->dma.chan =3D dma_request_chan(csi->dev, "rx0");
> > -	if (IS_ERR(csi->dma.chan))
> > -		return PTR_ERR(csi->dma.chan);
> > +	ctx->dma.chan =3D dma_request_chan(ctx->csi->dev, "rx0");
>=20
> The channel name should probably be parametrized, I presume it will
> happen next

Yes in subsequent patches.

>=20
> > +	if (IS_ERR(ctx->dma.chan))
> > +		return PTR_ERR(ctx->dma.chan);
> >
> > -	ret =3D dmaengine_slave_config(csi->dma.chan, &cfg);
> > +	ret =3D dmaengine_slave_config(ctx->dma.chan, &cfg);
> >  	if (ret) {
> > -		dma_release_channel(csi->dma.chan);
> > +		dma_release_channel(ctx->dma.chan);
> >  		return ret;
> >  	}
> >
> > -	csi->dma.drain.len =3D DRAIN_BUFFER_SIZE;
> > -	csi->dma.drain.vaddr =3D dma_alloc_coherent(csi->dev, csi->dma.drain.=
len,
> > -						  &csi->dma.drain.paddr,
> > -						  GFP_KERNEL);
> > -	if (!csi->dma.drain.vaddr)
> > -		return -ENOMEM;
> > -
> >  	return 0;
> >  }
> >
> >  static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
> >  {
> >  	struct media_device *mdev =3D &csi->mdev;
> > -	struct video_device *vdev =3D &csi->vdev;
> > +	int ret;
> > +
> > +	mdev->dev =3D csi->dev;
> > +	mdev->hw_revision =3D 1;
> > +	strscpy(mdev->model, "TI-CSI2RX", sizeof(mdev->model));
> > +
> > +	media_device_init(mdev);
> > +
> > +	csi->v4l2_dev.mdev =3D mdev;
> > +
> > +	ret =3D v4l2_device_register(csi->dev, &csi->v4l2_dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D media_device_register(mdev);
> > +	if (ret) {
> > +		v4l2_device_unregister(&csi->v4l2_dev);
> > +		media_device_cleanup(mdev);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
> > +{
> > +	struct ti_csi2rx_dev *csi =3D ctx->csi;
> > +	struct video_device *vdev =3D &ctx->vdev;
> >  	const struct ti_csi2rx_fmt *fmt;
> > -	struct v4l2_pix_format *pix_fmt =3D &csi->v_fmt.fmt.pix;
> > +	struct v4l2_pix_format *pix_fmt =3D &ctx->v_fmt.fmt.pix;
> >  	int ret;
> >
> > +	mutex_init(&ctx->mutex);
> > +
> >  	fmt =3D find_format_by_fourcc(V4L2_PIX_FMT_UYVY);
> >  	if (!fmt)
> >  		return -EINVAL;
> > @@ -1018,15 +1097,16 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx=
_dev *csi)
> >  	pix_fmt->quantization =3D V4L2_QUANTIZATION_LIM_RANGE,
> >  	pix_fmt->xfer_func =3D V4L2_XFER_FUNC_SRGB,
> >
> > -	ti_csi2rx_fill_fmt(fmt, &csi->v_fmt);
> > -
> > -	mdev->dev =3D csi->dev;
> > -	mdev->hw_revision =3D 1;
> > -	strscpy(mdev->model, "TI-CSI2RX", sizeof(mdev->model));
> > +	ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
> >
> > -	media_device_init(mdev);
> > +	csi->pad.flags =3D MEDIA_PAD_FL_SINK;
> > +	vdev->entity.ops =3D &ti_csi2rx_video_entity_ops;
> > +	ret =3D media_entity_pads_init(&ctx->vdev.entity, 1, &csi->pad);
> > +	if (ret)
> > +		return ret;
> >
> > -	strscpy(vdev->name, TI_CSI2RX_MODULE_NAME, sizeof(vdev->name));
> > +	snprintf(vdev->name, sizeof(vdev->name), "%s context %u",
> > +		 dev_name(csi->dev), ctx->idx);
> >  	vdev->v4l2_dev =3D &csi->v4l2_dev;
> >  	vdev->vfl_dir =3D VFL_DIR_RX;
> >  	vdev->fops =3D &csi_fops;
> > @@ -1034,61 +1114,28 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx=
_dev *csi)
> >  	vdev->release =3D video_device_release_empty;
> >  	vdev->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
> >  			    V4L2_CAP_IO_MC;
> > -	vdev->lock =3D &csi->mutex;
> > -	video_set_drvdata(vdev, csi);
> > +	vdev->lock =3D &ctx->mutex;
> > +	video_set_drvdata(vdev, ctx);
> >
> > -	csi->pad.flags =3D MEDIA_PAD_FL_SINK;
> > -	vdev->entity.ops =3D &ti_csi2rx_video_entity_ops;
> > -	ret =3D media_entity_pads_init(&csi->vdev.entity, 1, &csi->pad);
> > +	ret =3D ti_csi2rx_init_dma(ctx);
> >  	if (ret)
> >  		return ret;
> >
> > -	csi->v4l2_dev.mdev =3D mdev;
> > -
> > -	ret =3D v4l2_device_register(csi->dev, &csi->v4l2_dev);
> > +	ret =3D ti_csi2rx_init_vb2q(ctx);
> >  	if (ret)
> > -		return ret;
> > -
> > -	ret =3D media_device_register(mdev);
> > -	if (ret) {
> > -		v4l2_device_unregister(&csi->v4l2_dev);
> > -		media_device_cleanup(mdev);
> > -		return ret;
> > -	}
> > +		goto cleanup_dma;
> >
> >  	return 0;
> > -}
> >
> > -static void ti_csi2rx_cleanup_dma(struct ti_csi2rx_dev *csi)
> > -{
> > -	dma_free_coherent(csi->dev, csi->dma.drain.len,
> > -			  csi->dma.drain.vaddr, csi->dma.drain.paddr);
> > -	csi->dma.drain.vaddr =3D NULL;
> > -	dma_release_channel(csi->dma.chan);
> > -}
> > -
> > -static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
> > -{
> > -	media_device_unregister(&csi->mdev);
> > -	v4l2_device_unregister(&csi->v4l2_dev);
> > -	media_device_cleanup(&csi->mdev);
> > -}
> > -
> > -static void ti_csi2rx_cleanup_subdev(struct ti_csi2rx_dev *csi)
> > -{
> > -	v4l2_async_nf_unregister(&csi->notifier);
> > -	v4l2_async_nf_cleanup(&csi->notifier);
> > -}
> > -
> > -static void ti_csi2rx_cleanup_vb2q(struct ti_csi2rx_dev *csi)
> > -{
> > -	vb2_queue_release(&csi->vidq);
> > +cleanup_dma:
> > +	ti_csi2rx_cleanup_dma(ctx);
> > +	return ret;
> >  }
> >
> >  static int ti_csi2rx_probe(struct platform_device *pdev)
> >  {
> >  	struct ti_csi2rx_dev *csi;
> > -	int ret;
> > +	int ret, i;
> >
> >  	csi =3D devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
> >  	if (!csi)
> > @@ -1097,62 +1144,76 @@ static int ti_csi2rx_probe(struct platform_devi=
ce *pdev)
> >  	csi->dev =3D &pdev->dev;
> >  	platform_set_drvdata(pdev, csi);
> >
> > -	mutex_init(&csi->mutex);
> >  	csi->shim =3D devm_platform_ioremap_resource(pdev, 0);
> >  	if (IS_ERR(csi->shim)) {
> >  		ret =3D PTR_ERR(csi->shim);
> > -		goto err_mutex;
> > +		return ret;
> >  	}
> >
> > -	ret =3D ti_csi2rx_init_dma(csi);
> > -	if (ret)
> > -		goto err_mutex;
> > +	csi->drain.len =3D DRAIN_BUFFER_SIZE;
> > +	csi->drain.vaddr =3D dma_alloc_coherent(csi->dev, csi->drain.len,
> > +					      &csi->drain.paddr,
> > +					      GFP_KERNEL);
> > +	if (!csi->drain.vaddr)
> > +		return -ENOMEM;
> >
> >  	ret =3D ti_csi2rx_v4l2_init(csi);
> > -	if (ret)
> > -		goto err_dma;
> > -
> > -	ret =3D ti_csi2rx_init_vb2q(csi);
> >  	if (ret)
> >  		goto err_v4l2;
> >
> > +	for (i =3D 0; i < TI_CSI2RX_NUM_CTX; i++) {
> > +		csi->ctx[i].idx =3D i;
> > +		csi->ctx[i].csi =3D csi;
> > +		ret =3D ti_csi2rx_init_ctx(&csi->ctx[i]);
> > +		if (ret)
> > +			goto err_ctx;
> > +	}
> > +
> >  	ret =3D ti_csi2rx_notifier_register(csi);
> >  	if (ret)
> > -		goto err_vb2q;
> > +		goto err_ctx;
> >
> >  	ret =3D of_platform_populate(csi->dev->of_node, NULL, NULL, csi->dev);
> >  	if (ret) {
> >  		dev_err(csi->dev, "Failed to create children: %d\n", ret);
> > -		goto err_subdev;
> > +		goto err_notifier;
> >  	}
> >
> >  	return 0;
> >
> > -err_subdev:
> > -	ti_csi2rx_cleanup_subdev(csi);
> > -err_vb2q:
> > -	ti_csi2rx_cleanup_vb2q(csi);
> > -err_v4l2:
> > +err_notifier:
> > +	ti_csi2rx_cleanup_notifier(csi);
> > +err_ctx:
> > +	i--;
> > +	for (; i >=3D 0; i--)
> > +		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
> >  	ti_csi2rx_cleanup_v4l2(csi);
> > -err_dma:
> > -	ti_csi2rx_cleanup_dma(csi);
> > -err_mutex:
> > -	mutex_destroy(&csi->mutex);
> > +err_v4l2:
> > +	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
> > +			  csi->drain.paddr);
> >  	return ret;
> >  }
> >
> >  static void ti_csi2rx_remove(struct platform_device *pdev)
> >  {
> >  	struct ti_csi2rx_dev *csi =3D platform_get_drvdata(pdev);
> > +	int i;
>=20
> unsigned
>=20

Will fix.

> > +
> > +	for (i =3D 0; i < TI_CSI2RX_NUM_CTX; i++) {
> > +		if (vb2_is_busy(&csi->ctx[i].vidq))
>=20
> Can this happen ?
>=20

Probably not. While this driver is in use `modprobe -r j721e_csi2rx`=20
would fail anyway because the module refcnt > 0. And when it's not in=20
use the queue would never be busy...

Thanks for the catch, will drop this check (and move to .remove_new API)

> > +			dev_err(csi->dev,
> > +				"Failed to remove as queue busy for ctx %u\n",
> > +				i);
> > +	}
> >
> > -	video_unregister_device(&csi->vdev);
> > +	for (i =3D 0; i < TI_CSI2RX_NUM_CTX; i++)
> > +		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
> >
> > -	ti_csi2rx_cleanup_vb2q(csi);
> > -	ti_csi2rx_cleanup_subdev(csi);
> > +	ti_csi2rx_cleanup_notifier(csi);
> >  	ti_csi2rx_cleanup_v4l2(csi);
> > -	ti_csi2rx_cleanup_dma(csi);
> >
> > -	mutex_destroy(&csi->mutex);
> > +	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
> > +			  csi->drain.paddr);
> >  }
> >
> >  static const struct of_device_id ti_csi2rx_of_match[] =3D {
> >
> > --
> > 2.43.0
> >
> >

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--x2lr2ebclbklucc2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmaWOvwACgkQQ96R+SSa
cUXQbA//W0ChskVpT7yIKxOrd2xBTNwkG/eKpVJw35VovFsccq9WXu2j18rYsixE
3x93laaR/58Jof75s/QIXGHyFGcm4zcic2R8VK001wWvuNBtoYTZGK+IPjWDxN7B
8P+4ntP3VnkgBkQi14KR/GA2CqQ5L45afQu4Cbb9+2JMl+eyuygh25GjkRGAZ6Zb
3p9tncM1GKY/2ooOGllR/1wMX3wcG1Yvk93tgS7y3WISJIG8mBaj3kn8vXWHRmaO
N3AXUDJPXTyirr8zoSekLWYZ53nNQ3ypwg5Ow+uIEy97ZLoau4jjunYgJGD0bw2d
VN1/Wr/QmB9226vgD/qfnv0JeDxPUhOre1EpO1CCyNOCH2wMb3ifpCdVBj3whN5u
iUcSy+KrkMAxF9PO+zuuA5sxxVDLVPDPA6VXXhy6tlNz5G+8so4jrvtyF79TWuGZ
U23139OLDT8E/mFtMh8d106esiJUDqkIXRXM0Sn0hLvmb6qPMKoS+gEamORpX8C8
qJuC+kuvNw3nZnkZ7CDb98f513sFbRm/mav2ThwWs7NL66J5d+EosPUuRoliDMWk
OjcINO0piKJJ5mE9xEyL5vgqbdIovOftMoJuohM9nsyZKq/o5Bxiu/yJDAmT6T/8
qAHYrt0ix6k2lQ4pnlcsvj1X52KJC9mSBlR3K+/QW04EoIWovTc=
=BivD
-----END PGP SIGNATURE-----

--x2lr2ebclbklucc2--

