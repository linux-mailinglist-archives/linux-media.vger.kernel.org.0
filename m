Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66CB47421CA
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 10:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbjF2IIP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jun 2023 04:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbjF2IHx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jun 2023 04:07:53 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD085590;
        Thu, 29 Jun 2023 00:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1688025590; x=1719561590;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zm9fRv5qf7aVcKz8UF1M10ebABrrwF8E2+bUQwu5ZfU=;
  b=qSDOQkPx+Jn3HnlwQrhixQmfgpO3YJQaYIstZyKboIqe836zcS/0ByfS
   TONoUpOoQht9VFCXsHE/KdWv1yznAbnADOhXT6BqYASlmCcC42jtEYD8F
   GZr1XMS0EJdC08el8ER4mM1mAdJLpSwJRdepcgDu+eE/nB+MT5eSKA+o2
   /LUpw48Mz5OTLRI49qOuK4bX0AQ0pCfircD58UamBtg3+0w3PvfyZifVY
   MS8pvVgDUSUdDdwMUeugMmyXspj265OEffxs08srhJnqoI/DnNx41cwGt
   mCWQ4BMWdffvE3Azlu5pEv3ER6EQNxPe1JTgSQHmF/zmPoGe3HHVJPgWA
   g==;
X-IronPort-AV: E=Sophos;i="6.01,168,1684792800"; 
   d="scan'208";a="31670788"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 29 Jun 2023 09:59:48 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C3FD5280078;
        Thu, 29 Jun 2023 09:59:47 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
        "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc:     "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v5 3/3] media: nxp: imx8-isi: add ISI support for i.MX93
Date:   Thu, 29 Jun 2023 09:59:47 +0200
Message-ID: <4813902.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <AS8PR04MB90801F3FC8D5A1D01E6BC32BFA25A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230629013621.2388121-1-guoniu.zhou@oss.nxp.com> <5948448.lOV4Wx5bFT@steina-w> <AS8PR04MB90801F3FC8D5A1D01E6BC32BFA25A@AS8PR04MB9080.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guoniu,

Am Donnerstag, 29. Juni 2023, 09:07:23 CEST schrieb G.N. Zhou (OSS):
> Hi Alexander,
>=20
>=20
> > -----Original Message-----
> > From: Alexander Stein <alexander.stein@ew.tq-group.com>
> > Sent: 2023=E5=B9=B46=E6=9C=8829=E6=97=A5 14:43
> > To: linux-media@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>;
> > devicetree@vger.kernel.org; G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> > Cc: laurent.pinchart@ideasonboard.com; mchehab@kernel.org;
> > robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > conor+dt@kernel.org;
 Xavier Roumegue (OSS)
> > <xavier.roumegue@oss.nxp.com>;
> > kernel@pengutronix.de; jacopo.mondi@ideasonboard.com;
> > sakari.ailus@linux.intel.com
> > Subject: Re: [PATCH v5 3/3] media: nxp: imx8-isi: add ISI support for
> > i.MX93
=20
> > Caution: This is an external email. Please take care when clicking links
> > or opening
 attachments. When in doubt, report the message using the
> > 'Report this email' button
> >=20
> >=20
> > Hi Guoniu,
> >=20
> > thanks for the patch series.
> >=20
> > Am Donnerstag, 29. Juni 2023, 03:36:21 CEST schrieb
> > guoniu.zhou@oss.nxp.com:
> >=20
> > > ********************
> > > Achtung externe E-Mail: =C3=96ffnen Sie Anh=C3=A4nge und Links nur, w=
enn Sie
> > > wissen, dass diese aus einer sicheren Quelle stammen und sicher sind.
> > > Leiten Sie die E-Mail im Zweifelsfall zur Pr=C3=BCfung an den IT-Help=
desk
> > > weiter.
 Attention external email: Open attachments and links only if
> > > you know that they are from a secure source and are safe. In doubt
> > > forward the email to the IT-Helpdesk to check it. ********************
> > >
> > >
> > >
> > > From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> > >
> > >
> > >
> > > i.MX93 use a different gasket which has different register definition
> > > compared with i.MX8. Hence implement the gasket callbacks in order to
> > > add ISI support for i.MX93.
> > >
> > >
> > >
> > > Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >=20
> > >  .../platform/nxp/imx8-isi/imx8-isi-core.c     | 15 ++++++++++
> > >  .../platform/nxp/imx8-isi/imx8-isi-core.h     |  2 ++
> > >  .../platform/nxp/imx8-isi/imx8-isi-gasket.c   | 30 +++++++++++++++++=
++
> > >  3 files changed, 47 insertions(+)
> > >
> > >
> > >
> > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c index
> > > 5165f8960c2c..27bd18b7ee65 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > @@ -307,6 +307,20 @@ static const struct mxc_isi_plat_data
> >=20
> > mxc_imx8mp_data =3D
> >=20
> > > { .has_36bit_dma              =3D true,
> > >=20
> > >  };
> > >
> > >
> > >
> > > +static const struct mxc_isi_plat_data mxc_imx93_data =3D {
> > > +     .model                  =3D MXC_ISI_IMX93,
> > > +     .num_ports              =3D 1,
> > > +     .num_channels           =3D 1,
> > > +     .reg_offset             =3D 0,
> > > +     .ier_reg                =3D &mxc_imx8_isi_ier_v2,
> > > +     .set_thd                =3D &mxc_imx8_isi_thd_v1,
> > > +     .clks                   =3D mxc_imx8mn_clks,
> > > +     .num_clks               =3D ARRAY_SIZE(mxc_imx8mn_clks),
> > > +     .buf_active_reverse     =3D true,
> > > +     .gasket_ops             =3D &mxc_imx93_gasket_ops,
> > > +     .has_36bit_dma          =3D false,
> > > +};
> > > +
> > >=20
> > >  /*
> > >=20
> > > ----------------------------------------------------------------------
> > > -----
> > > -- * Power management
> > >=20
> > >   */
> > >=20
> > > @@ -518,6 +532,7 @@ static int mxc_isi_remove(struct platform_device
> > > *pdev)  static const struct of_device_id mxc_isi_of_match[] =3D {
> > >=20
> > >       { .compatible =3D "fsl,imx8mn-isi", .data =3D &mxc_imx8mn_data =
},
> > >       { .compatible =3D "fsl,imx8mp-isi", .data =3D &mxc_imx8mp_data =
},
> > >=20
> > > +     { .compatible =3D "fsl,imx93-isi", .data =3D &mxc_imx93_data },
> > >=20
> > >       { /* sentinel */ },
> > > =20
> > >  };
> > >  MODULE_DEVICE_TABLE(of, mxc_isi_of_match); diff --git
> > >=20
> > > a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h index
> > > 78ca047d93d1..2810ebe9b5f7 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > @@ -158,6 +158,7 @@ struct mxc_gasket_ops {  enum model {
> > >=20
> > >       MXC_ISI_IMX8MN,
> > >       MXC_ISI_IMX8MP,
> > >=20
> > > +     MXC_ISI_IMX93,
> > >=20
> > >  };
> > >
> > >
> > >
> > >  struct mxc_isi_plat_data {
> > >=20
> > > @@ -295,6 +296,7 @@ struct mxc_isi_dev {  };
> > >
> > >
> > >
> > >  extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
> > >=20
> > > +extern const struct mxc_gasket_ops mxc_imx93_gasket_ops;
> > >
> > >
> > >
> > >  int mxc_isi_crossbar_init(struct mxc_isi_dev *isi);  void
> > >=20
> > > mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar); diff --git
> > > a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > > b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c index
> > > 1d632dc60699..50ac1d3a2b6f 100644
> > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > > @@ -53,3 +53,33 @@ const struct mxc_gasket_ops mxc_imx8_gasket_ops =
=3D {
> > >=20
> > >       .enable =3D mxc_imx8_gasket_enable,
> > >       .disable =3D mxc_imx8_gasket_disable,  };
> > >=20
> > > +
> > > +/*
> > > ----------------------------------------------------------------------
> > > -----
> > > -- + * i.MX93 gasket
> > > + **/
> > > +
> > > +#define DISP_MIX_CAMERA_MUX                     0x30
> >=20
> >=20
> > Which peripheral does this refer to? I would assume it is the Media Mix
> > Domain Block Control, but there is no register at 0x30 mentioned in the
> > reference manual. You have some additional information?
> >=20
> > Also which type of input did you use? MIPI-CSI2 or parallel interface?
>=20
>=20
> Yes, it's Media Mix Domain Block Control(I name it Disp_Mix due to history
> reason).
>
> I check RM in NXP Website and don't found 0x30 as you said since it's REV=
2,
> not latest one which still under review.

Thanks for confirmation.

> The input is MIPI CSI-2 by default.(We use default value in the serials)

Thanks. Is there already a (preliminary) driver for the MIPI CSI-2 peripher=
al?

Thanks and best regards,
Alexander

> >=20
> > Thanks and best regards,
> > Alexander
> >=20
> >=20
> > > +#define DISP_MIX_CAMERA_MUX_DATA_TYPE(x)        (((x) & 0x3f) << 3)
> > > +#define DISP_MIX_CAMERA_MUX_GASKET_ENABLE       BIT(16)
> > > +static void mxc_imx93_gasket_enable(struct mxc_isi_dev *isi,
> > > +                                 const struct v4l2_mbus_frame_desc
> >=20
> > *fd,
> >=20
> > > +                                 const struct v4l2_mbus_framefmt
> >=20
> > *fmt,
> >=20
> > > +                                 const unsigned int port) {
> > > +     u32 val;
> > > +
> > > +     val =3D DISP_MIX_CAMERA_MUX_DATA_TYPE(fd->entry[0].bus.csi2.dt);
> > > +     val |=3D DISP_MIX_CAMERA_MUX_GASKET_ENABLE;
> > > +     regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, val); }
> > > +
> > > +static void mxc_imx93_gasket_disable(struct mxc_isi_dev *isi,
> > > +                                  unsigned int port) {
> > > +     regmap_write(isi->gasket, DISP_MIX_CAMERA_MUX, 0); }
> > > +
> > > +const struct mxc_gasket_ops mxc_imx93_gasket_ops =3D {
> > > +     .enable =3D mxc_imx93_gasket_enable,
> > > +     .disable =3D mxc_imx93_gasket_disable, };
> >=20
> >=20
> >=20
> > --
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > http://www.tq-group.com/
> >=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


