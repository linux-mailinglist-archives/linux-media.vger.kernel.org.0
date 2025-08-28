Return-Path: <linux-media+bounces-41243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5EDB39B1F
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 13:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AF6B3B26F9
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 11:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF69130DEA5;
	Thu, 28 Aug 2025 11:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kU3lCAWd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BAA2F39DD;
	Thu, 28 Aug 2025 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756379480; cv=none; b=d11Nx5XkazE5Bn0s5leEdPhDTZ5LhyGXy+2wxmAW8JCRKlaeEf8iKcGiXgjsVJK5ZK9cIGH1xkW9alctv8dIg0n1cCeNUXmGfO7HjwH7zEHT1A1fny9OQDS6EW/OALhz7valDZHnDjcG/kfWgNzbHA+MvTBdmkLGc039JDWjx2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756379480; c=relaxed/simple;
	bh=RgsKuFALNXze+uheWEehna21G8m95dXSHQ+Ws/HfTd8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=YChGR0er9voa0bGTj+fG33+eOzs0XX1GDT1sStJw4f+9u8nsn/gUmaNg1eZrVkAbGZA11rofzT9zYmUYDMlNHnXcedYHPIOfonUA5LC84Kif8aq3g0Zj3ppI/iYFeLhOYtmVPszpkN2diovcGIf5ed31DKTD9pcOFHjBZMbKo7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kU3lCAWd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1331:996f:e361:948:c527])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BEDE20EE;
	Thu, 28 Aug 2025 13:10:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756379405;
	bh=RgsKuFALNXze+uheWEehna21G8m95dXSHQ+Ws/HfTd8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kU3lCAWdR/47kPIV88oiekKv3yLNpYofomh9Ei7Gi1/9Tw4dDsVf+UVPVzLWFKT44
	 kil+RJzdrEf+8jpqNOXJLPE6tKhOib57/brVfvaPT+b5u2fof+TMXzWwe3FqDy8AR6
	 ugYjMTqWA05176AF7utVNgYHj+Hn9TyuLfDlfXyo=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250825142522.1826188-8-r-donadkar@ti.com>
References: <20250825142522.1826188-1-r-donadkar@ti.com> <20250825142522.1826188-8-r-donadkar@ti.com>
Subject: Re: [PATCH v5 07/14] media: ti: j721e-csi2rx: get number of contexts from device tree
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: r-donadkar@ti.com, y-abhilashchandra@ti.com, devarsht@ti.com, vaishnav.a@ti.com, s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, tomi.valkeinen@ideasonboard.com, changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com, mripard@kernel.org
Date: Thu, 28 Aug 2025 16:41:04 +0530
Message-ID: <175637946417.1633224.8030756212311298506@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Rishikesh,

Quoting Rishikesh Donadkar (2025-08-25 19:55:15)
> From: Pratyush Yadav <p.yadav@ti.com>
>=20
> Different platforms that use this driver might have different number of
> DMA channels allocated for CSI. So only as many DMA contexts can be used
> as the number of DMA channels available. Get the number of channels
> provided via device tree and only configure that many contexts, and
> hence only that many pads.
>=20
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Co-developed-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 42 ++++++++++++++-----
>  1 file changed, 31 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 4e1c9db0dcf5..6cab7642aa10 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -44,7 +44,7 @@
> =20
>  #define TI_CSI2RX_MAX_PIX_PER_CLK      4
>  #define PSIL_WORD_SIZE_BYTES           16
> -#define TI_CSI2RX_NUM_CTX              1
> +#define TI_CSI2RX_MAX_CTX              32
> =20
>  /*
>   * There are no hard limits on the width or height. The DMA engine can h=
andle
> @@ -57,8 +57,8 @@
> =20
>  #define TI_CSI2RX_PAD_SINK             0
>  #define TI_CSI2RX_PAD_FIRST_SOURCE     1
> -#define TI_CSI2RX_NUM_SOURCE_PADS      1
> -#define TI_CSI2RX_NUM_PADS             (1 + TI_CSI2RX_NUM_SOURCE_PADS)
> +#define TI_CSI2RX_MAX_SOURCE_PADS      TI_CSI2RX_MAX_CTX
> +#define TI_CSI2RX_MAX_PADS             (1 + TI_CSI2RX_MAX_SOURCE_PADS)
> =20
>  #define DRAIN_TIMEOUT_MS               50
>  #define DRAIN_BUFFER_SIZE              SZ_32K
> @@ -118,14 +118,15 @@ struct ti_csi2rx_dev {
>         void __iomem                    *shim;
>         struct mutex                    mutex; /* To serialize ioctls. */
>         unsigned int                    enable_count;
> +       unsigned int                    num_ctx;
>         struct v4l2_device              v4l2_dev;
>         struct media_device             mdev;
>         struct media_pipeline           pipe;
> -       struct media_pad                pads[TI_CSI2RX_NUM_PADS];
> +       struct media_pad                pads[TI_CSI2RX_MAX_PADS];
>         struct v4l2_async_notifier      notifier;
>         struct v4l2_subdev              *source;
>         struct v4l2_subdev              subdev;
> -       struct ti_csi2rx_ctx            ctx[TI_CSI2RX_NUM_CTX];
> +       struct ti_csi2rx_ctx            ctx[TI_CSI2RX_MAX_CTX];
>         u8                              pix_per_clk;
>         /* Buffer to drain stale data from PSI-L endpoint */
>         struct {
> @@ -463,7 +464,7 @@ static int csi_async_notifier_complete(struct v4l2_as=
ync_notifier *notifier)
>                 return ret;
> =20
>         /* Create and link video nodes for all DMA contexts */
> -       for (i =3D 0; i < TI_CSI2RX_NUM_CTX; i++) {
> +       for (i =3D 0; i < csi->num_ctx; i++) {
>                 struct ti_csi2rx_ctx *ctx =3D &csi->ctx[i];
>                 struct video_device *vdev =3D &ctx->vdev;
> =20
> @@ -1250,10 +1251,11 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_d=
ev *csi)
>         csi->pads[TI_CSI2RX_PAD_SINK].flags =3D MEDIA_PAD_FL_SINK;
> =20
>         for (unsigned int i =3D TI_CSI2RX_PAD_FIRST_SOURCE;
> -            i < TI_CSI2RX_NUM_PADS; i++)
> +            i < TI_CSI2RX_PAD_FIRST_SOURCE + csi->num_ctx; i++)
>                 csi->pads[i].flags =3D MEDIA_PAD_FL_SOURCE;
> =20
> -       ret =3D media_entity_pads_init(&sd->entity, ARRAY_SIZE(csi->pads),
> +       ret =3D media_entity_pads_init(&sd->entity,
> +                                    TI_CSI2RX_PAD_FIRST_SOURCE + csi->nu=
m_ctx,
>                                      csi->pads);
>         if (ret)
>                 goto unregister_media;
> @@ -1344,8 +1346,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx =
*ctx)
> =20
>  static int ti_csi2rx_probe(struct platform_device *pdev)
>  {
> +       struct device_node *np =3D pdev->dev.of_node;
>         struct ti_csi2rx_dev *csi;
> -       int ret, i;
> +       int ret, i, count;
> =20
>         csi =3D devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
>         if (!csi)
> @@ -1367,13 +1370,29 @@ static int ti_csi2rx_probe(struct platform_device=
 *pdev)
>         if (!csi->drain.vaddr)
>                 return -ENOMEM;
> =20
> +       /* Only use as many contexts as the number of DMA channels alloca=
ted. */
> +       count =3D of_property_count_strings(np, "dma-names");
> +       if (count < 0) {
> +               dev_err(csi->dev, "Failed to get DMA channel count: %d\n"=
, count);
> +               ret =3D count;
> +               goto err_dma_chan;
> +       }
> +
> +       csi->num_ctx =3D count;
> +       if (csi->num_ctx > TI_CSI2RX_MAX_CTX) {
> +               dev_err(csi->dev,
> +                       "%u DMA channels passed. Maximum is %u.\n",
> +                       csi->num_ctx, TI_CSI2RX_MAX_CTX);
> +               goto err_dma_chan;
> +       }
> +

I get the following errors while compiling:

../drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:1582:6: warning: v=
ariable 'ret' is used uninitialized whenever 'if' condition is true [-Wsome=
times-uninitialized]
 1582 |         if (csi->num_ctx > TI_CSI2RX_MAX_CTX) {
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:1627:9: note: unin=
itialized use occurs here
 1627 |         return ret;
      |                ^~~
../drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:1582:2: note: remo=
ve the 'if' if its condition is always false
 1582 |         if (csi->num_ctx > TI_CSI2RX_MAX_CTX) {
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1583 |                 dev_err(csi->dev,
      |                 ~~~~~~~~~~~~~~~~~
 1584 |                         "%u DMA channels passed. Maximum is %u.\n",
      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1585 |                         csi->num_ctx, TI_CSI2RX_MAX_CTX);
      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1586 |                 goto err_dma_chan;
      |                 ~~~~~~~~~~~~~~~~~~
 1587 |         }
      |         ~
../drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:1551:9: note: init=
ialize the variable 'ret' to silence this warning
 1551 |         int ret, i, count;
      |                ^
      |                 =3D 0

>         mutex_init(&csi->mutex);
> =20
>         ret =3D ti_csi2rx_v4l2_init(csi);
>         if (ret)
>                 goto err_v4l2;
> =20
> -       for (i =3D 0; i < TI_CSI2RX_NUM_CTX; i++) {
> +       for (i =3D 0; i < csi->num_ctx; i++) {
>                 csi->ctx[i].idx =3D i;
>                 csi->ctx[i].csi =3D csi;
>                 ret =3D ti_csi2rx_init_ctx(&csi->ctx[i]);
> @@ -1402,6 +1421,7 @@ static int ti_csi2rx_probe(struct platform_device *=
pdev)
>         ti_csi2rx_cleanup_v4l2(csi);
>  err_v4l2:
>         mutex_destroy(&csi->mutex);
> +err_dma_chan:
>         dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>                           csi->drain.paddr);
>         return ret;
> @@ -1412,7 +1432,7 @@ static void ti_csi2rx_remove(struct platform_device=
 *pdev)
>         struct ti_csi2rx_dev *csi =3D platform_get_drvdata(pdev);
>         unsigned int i;
> =20
> -       for (i =3D 0; i < TI_CSI2RX_NUM_CTX; i++)
> +       for (i =3D 0; i < csi->num_ctx; i++)
>                 ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
> =20
>         ti_csi2rx_cleanup_notifier(csi);
> --=20
> 2.34.1
>

