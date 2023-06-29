Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12E29742097
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 08:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbjF2GqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jun 2023 02:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232267AbjF2GpM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jun 2023 02:45:12 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211741727;
        Wed, 28 Jun 2023 23:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1688021000; x=1719557000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G+uOQkDR2E0nxUFvjbja0K0Gxq+1DDCLe5LQgn9NGO0=;
  b=mWlnIt1CrXBA16J8GsKQ2MAJfcZviXzBE1YJWHy8mXgH/9ujCtMTk0S4
   5CRz20AnkNDwqlxKYHPj4noLZ4M5o9IxMQjWfS34tm/1CGx2M0O2yI2/E
   0oPOQ8me0DtdfDQ4Xb4tBri+cnyq4NIFkg3hp3RDM0lSe8z0qD3g+0qAd
   DAS4dwwHgdi4RVUVGvzT/ynJ4lDn+AZbBe5smKT68b+sOCU6iidb3Gxjz
   dYfSaj9oM69XEylVwuwQg+UvgZMHF3Oq0dzPDX8Hm2SP7nNWdjzU0ZuPK
   WDgUmpfFEzJ58psz2UYNVUuv4yR2rnCFGovHwfKr9HSS8MU39Li5GzivP
   w==;
X-IronPort-AV: E=Sophos;i="6.01,167,1684792800"; 
   d="scan'208";a="31667920"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 29 Jun 2023 08:43:17 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id F1841280078;
        Thu, 29 Jun 2023 08:43:16 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, guoniu.zhou@oss.nxp.com
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: Re: [PATCH v5 3/3] media: nxp: imx8-isi: add ISI support for i.MX93
Date:   Thu, 29 Jun 2023 08:43:16 +0200
Message-ID: <5948448.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230629013621.2388121-4-guoniu.zhou@oss.nxp.com>
References: <20230629013621.2388121-1-guoniu.zhou@oss.nxp.com> <20230629013621.2388121-4-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guoniu,

thanks for the patch series.

Am Donnerstag, 29. Juni 2023, 03:36:21 CEST schrieb guoniu.zhou@oss.nxp.com:
> ********************
> Achtung externe E-Mail: =D6ffnen Sie Anh=E4nge und Links nur, wenn Sie wi=
ssen,
> dass diese aus einer sicheren Quelle stammen und sicher sind. Leiten Sie
> die E-Mail im Zweifelsfall zur Pr=FCfung an den IT-Helpdesk weiter.
> Attention external email: Open attachments and links only if you know that
> they are from a secure source and are safe. In doubt forward the email to
> the IT-Helpdesk to check it. ********************
>=20
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
>=20
> i.MX93 use a different gasket which has different register definition
> compared with i.MX8. Hence implement the gasket callbacks in order to
> add ISI support for i.MX93.
>=20
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../platform/nxp/imx8-isi/imx8-isi-core.c     | 15 ++++++++++
>  .../platform/nxp/imx8-isi/imx8-isi-core.h     |  2 ++
>  .../platform/nxp/imx8-isi/imx8-isi-gasket.c   | 30 +++++++++++++++++++
>  3 files changed, 47 insertions(+)
>=20
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c index
> 5165f8960c2c..27bd18b7ee65 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -307,6 +307,20 @@ static const struct mxc_isi_plat_data mxc_imx8mp_dat=
a =3D
> { .has_36bit_dma		=3D true,
>  };
>=20
> +static const struct mxc_isi_plat_data mxc_imx93_data =3D {
> +	.model			=3D MXC_ISI_IMX93,
> +	.num_ports		=3D 1,
> +	.num_channels		=3D 1,
> +	.reg_offset		=3D 0,
> +	.ier_reg		=3D &mxc_imx8_isi_ier_v2,
> +	.set_thd		=3D &mxc_imx8_isi_thd_v1,
> +	.clks			=3D mxc_imx8mn_clks,
> +	.num_clks		=3D ARRAY_SIZE(mxc_imx8mn_clks),
> +	.buf_active_reverse	=3D true,
> +	.gasket_ops		=3D &mxc_imx93_gasket_ops,
> +	.has_36bit_dma		=3D false,
> +};
> +
>  /*
> -------------------------------------------------------------------------=
=2D-
> -- * Power management
>   */
> @@ -518,6 +532,7 @@ static int mxc_isi_remove(struct platform_device *pde=
v)
>  static const struct of_device_id mxc_isi_of_match[] =3D {
>  	{ .compatible =3D "fsl,imx8mn-isi", .data =3D &mxc_imx8mn_data },
>  	{ .compatible =3D "fsl,imx8mp-isi", .data =3D &mxc_imx8mp_data },
> +	{ .compatible =3D "fsl,imx93-isi", .data =3D &mxc_imx93_data },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h index
> 78ca047d93d1..2810ebe9b5f7 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -158,6 +158,7 @@ struct mxc_gasket_ops {
>  enum model {
>  	MXC_ISI_IMX8MN,
>  	MXC_ISI_IMX8MP,
> +	MXC_ISI_IMX93,
>  };
>=20
>  struct mxc_isi_plat_data {
> @@ -295,6 +296,7 @@ struct mxc_isi_dev {
>  };
>=20
>  extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
> +extern const struct mxc_gasket_ops mxc_imx93_gasket_ops;
>=20
>  int mxc_isi_crossbar_init(struct mxc_isi_dev *isi);
>  void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar);
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c index
> 1d632dc60699..50ac1d3a2b6f 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> @@ -53,3 +53,33 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops =3D {
>  	.enable =3D mxc_imx8_gasket_enable,
>  	.disable =3D mxc_imx8_gasket_disable,
>  };
> +
> +/*
> -------------------------------------------------------------------------=
=2D-
> -- + * i.MX93 gasket
> + **/
> +
> +#define DISP_MIX_CAMERA_MUX                     0x30

Which peripheral does this refer to? I would assume it is the Media Mix Dom=
ain=20
Block Control, but there is no register at 0x30 mentioned in the reference=
=20
manual. You have some additional information?

Also which type of input did you use? MIPI-CSI2 or parallel interface?

Thanks and best regards,
Alexander

> +#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
> +#define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
> +static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
> +				    const struct v4l2_mbus_frame_desc=20
*fd,
> +				    const struct v4l2_mbus_framefmt=20
*fmt,
> +				    const unsigned int port)
> +{
> +	u32 val;
> +
> +	val =3D DISP_MIX_CAMERA_MUX_DATA_TYPE(fd->entry[0].bus.csi2.dt);
> +	val |=3D DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
> +	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val);
> +}
> +
> +static void mxc_imx93_gasket_disable(struct mxc_isi_dev *isi,
> +				     unsigned int port)
> +{
> +	regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, 0);
> +}
> +
> +const struct mxc_gasket_ops mxc_imx93_gasket_ops =3D {
> +	.enable =3D mxc_imx93_gasket_enable,
> +	.disable =3D mxc_imx93_gasket_disable,
> +};


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


