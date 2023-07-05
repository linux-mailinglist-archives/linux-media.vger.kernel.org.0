Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E845747D7B
	for <lists+linux-media@lfdr.de>; Wed,  5 Jul 2023 08:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbjGEGwB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jul 2023 02:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231917AbjGEGvn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Jul 2023 02:51:43 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D7E1FE7;
        Tue,  4 Jul 2023 23:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1688539870; x=1720075870;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=28127WmhPdXIffq01bC4UTVxGf0bt0dWHpenO+PH6I0=;
  b=VkVZZAuBgTIrRmdGG2D+brk6mrkp2CJ0IG9v/kcXtP86hYbGcvjy+Gbc
   C7cIVu5j6AdSsSQeYZ5BgRnL+rip24iNz1KzqazOumU/o71ONJ2yV/+pE
   gU+71bhhb8E24zAXVyJdp8WBitCntSdr9/NjtEzbW2W8H8cOZA7NUbdf7
   tjMBhX+XfYR99ryAX65rFteOv5CEdrDhrlJd4XwEnh0jgjb+Xx6V/Jo1K
   j7UQ3uonAUXiWFaktgxxeWkiW01v7BvRd03Jk4PncPJvymDXM9uz5NG8/
   E8ZsQSafp3VVuawxeNGm7pNl6esJdQM6MIbQK+IPKMvRPyCpCxfYj7yIh
   g==;
X-IronPort-AV: E=Sophos;i="6.01,182,1684792800"; 
   d="scan'208";a="31759915"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 05 Jul 2023 08:50:25 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7317A280087;
        Wed,  5 Jul 2023 08:50:25 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
        "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
Cc:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 2/2] media: nxp: add driver for i.MX93 MIPI CSI-2 controller and D-PHY
Date:   Wed, 05 Jul 2023 08:50:25 +0200
Message-ID: <9364454.T7Z3S40VBb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <AS8PR04MB908081139CF737C06AAD1284FA2FA@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230703113734.762307-1-guoniu.zhou@oss.nxp.com> <10303134.nUPlyArG6x@steina-w> <AS8PR04MB908081139CF737C06AAD1284FA2FA@AS8PR04MB9080.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guoniu,

thanks for the fast response.

Am Mittwoch, 5. Juli 2023, 05:52:05 CEST schrieb G.N. Zhou (OSS):
> Hi Alexander,
>=20
> Thanks for your comments.
>=20
> [snip]
> > > +
> > > +/* Set default high speed frequency range to 1.5Gbps  */
> > > +#define DPHY_DEFAULT_FREQRANGE               0x2c
> > > +
> > > +enum imx93_csi_clks {
> > > +     PER,
> > > +     PIXEL,
> > > +     PHY_CFG,
> > > +};
> > > +
> > > +enum model {
> > > +     DWC_CSI2RX_IMX93,
> > > +};
> > > +
> > > +enum dwc_csi2rx_intf {
> > > +     DWC_CSI2RX_INTF_IDI,
> >=20
> >=20
> > This is unused, what is it intented for?
>=20
>=20
> DesignWare Core MIPI CSI-2 support both IDI and IPI interface. For i.MX93=
 it
> use IPI as interface with ISI(gasket) and I reserved IDI here on the one
> hand support full features of the MIPI CSI-2 IP as more as possible, on t=
he
> other hand, NXP i.MX95 MIPI CSI-2 remove IPI and use IDI as the interface=
=2E=20

I don't know about the differences on IPI and IDI, but it looks like both=20
i.MX93 and i.MX95 use the same MIPI-CSI2 IP core, but have a different glue=
=20
layer. So IPI and IDI specifics seem to be SoC specific as well. Did I get=
=20
something wrong?

> [snip]

> > > ---------------------------------------------------------------------=
=2D--
> > > ---
 -- + * Debug
> > > + */
> > > +
> > > +static void dwc_csi_clear_counters(struct dwc_csi_device *csidev)
> > > +{
> > > +     unsigned long flags;
> > > +     unsigned int i;
> > > +
> > > +     spin_lock_irqsave(&csidev->slock, flags);
> > > +
> > > +     for (i =3D 0; i < csidev->pdata->num_events; ++i)
> > > +             csidev->events[i].counter =3D 0;
> > > +
> > > +     spin_unlock_irqrestore(&csidev->slock, flags);
> > > +}
> > > +
> > > +static void dwc_csi_log_counters(struct dwc_csi_device *csidev)
> > > +{
> > > +     unsigned int num_events =3D csidev->pdata->num_events;
> > > +     unsigned long flags;
> > > +     unsigned int i;
> > > +
> > > +     spin_lock_irqsave(&csidev->slock, flags);
> > > +
> > > +     for (i =3D 0; i < num_events; ++i) {
> > > +             if (csidev->events[i].counter > 0)
> > > +                     dev_info(csidev->dev, "%s events: %d\n",
> > > +                              csidev->events[i].name,
> > > +                              csidev->events[i].counter);
> > > +     }
> > > +
> > > +     spin_unlock_irqrestore(&csidev->slock, flags);
> > > +}
> > > +
> > > +static void dwc_csi_dump_regs(struct dwc_csi_device *csidev)
> > > +{
> > > +#define DWC_MIPI_CSIS_DEBUG_REG(name)                {name,
> >=20
> > #name}
> >=20
> > > +     static const struct {
> > > +             u32 offset;
> > > +             const char * const name;
> > > +     } registers[] =3D {
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_VERSION),
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_N_LANES),
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_HOST_RESETN),
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_MAIN),
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_SHUTDOWNZ),
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_RSTZ),
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_RX_STATUS),
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_STOPSTATE),
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_TEST_CTRL0),
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_DPHY_TEST_CTRL1),
> > > +
> >=20
> > DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_PATTERN_VRES),
> >=20
> > > +
> >=20
> > DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_PATTERN_HRES),
> >=20
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_CONFIG),
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_ENABLE),
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_PPI_PG_STATUS),
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_MODE),
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_VCID),
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_DATA_TYPE),
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_MEM_FLUSH),
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_SOFTRSTN),
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_IPI_ADV_FEATURES),
> > > +
> >=20
> > DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_DPHY_FATAL),
> >=20
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_PKT_FATAL),
> > > +
> >=20
> > DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_DPHY_FATAL),
> >=20
> > > +             DWC_MIPI_CSIS_DEBUG_REG(CSI2RX_INT_ST_IPI_FATAL),
> > > +     };
> > > +
> > > +     unsigned int i;
> > > +     u32 cfg;
> > > +
> > > +     dev_dbg(csidev->dev, "--- REGISTERS ---\n");
> > > +
> > > +     for (i =3D 0; i < ARRAY_SIZE(registers); i++) {
> > > +             cfg =3D dwc_csi_read(csidev, registers[i].offset);
> > > +             dev_dbg(csidev->dev, "%14s[0x%02x]: 0x%08x\n",
> > > +                     registers[i].name, registers[i].offset, cfg);
> > > +     }
> > > +}

These register dumps also look like a good candidate for=20
v4l2_subdev_core_ops.log_status callback. VIDIOC_LOG_STATUS ioctl that is.

> [snip]

> > > +static int dwc_csi_subdev_set_fmt(struct v4l2_subdev *sd,
> > > +                                struct v4l2_subdev_state *sd_state,
> > > +                                struct v4l2_subdev_format
> >=20
> > *sdformat)
> >=20
> > > +{
> > > +     struct dwc_csi_device *csidev =3D sd_to_dwc_csi_device(sd);
> > > +     struct dwc_csi_pix_format const *csi_fmt;
> > > +     struct v4l2_mbus_framefmt *fmt;
> > > +     unsigned int align;
> > > +
> > > +     /*
> > > +      * The CSIS can't transcode in any way, the source format can't
> > > be
> > > +      * modified.
> > > +      */
> > > +     if (sdformat->pad =3D=3D DWC_CSI2RX_PAD_SOURCE)
> > > +             return dwc_csi_subdev_get_fmt(sd, sd_state, sdformat);
> > > +
> > > +     if (sdformat->pad !=3D DWC_CSI2RX_PAD_SINK)
> > > +             return -EINVAL;
> > > +
> > > +     /*
> > > +      * Validate the media bus code and clamp and align the size.
> > > +      *
> > > +      * The total number of bits per line must be a multiple of 8. We
> >=20
> > thus
> >=20
> > > +      * need to align the width for formats that are not multiples of
> > > 8
> > > +      * bits.
> > > +      */
> > > +     csi_fmt =3D find_csi_format(sdformat->format.code);
> > > +     if (!csi_fmt)
> > > +             csi_fmt =3D &dwc_csi_formats[0];
> > > +
> > > +     switch (csi_fmt->width % 8) {
> > > +     case 0:
> > > +             align =3D 0;
> > > +             break;
> > > +     case 4:
> > > +             align =3D 1;
> > > +             break;
> > > +     case 2:
> > > +     case 6:
> > > +             align =3D 2;
> > > +             break;
> > > +     default:
> > > +             /* 1, 3, 5, 7 */
> > > +             align =3D 3;
> > > +             break;
> > > +     }
> >=20
> >=20
> > Is this switch-case actually necessary? If the bits per line have to be=
 a
> > multiple of 8, IMHO calling v4l_bound_align_image() with walign=3D3 sho=
uld
> > be enough for all cases.
>=20
>=20
> Yes it's. walign=3D3 can cover all cases as you said but can't handle pre=
cise
> control and cause unnecessary memory waste.

Right, it's about _bits_ per line, not pixel per line. So your calculation=
=20
seems sensible.

> [snip]

> > > +static int dwc_csi_async_register(struct dwc_csi_device *csidev)
> > > +{
> > > +     struct v4l2_fwnode_endpoint vep =3D {
> > > +             .bus_type =3D V4L2_MBUS_CSI2_DPHY,
> > > +     };
> > > +     struct v4l2_async_subdev *asd;
> > > +     struct fwnode_handle *ep;
> > > +     unsigned int i;
> > > +     int ret;
> > > +
> > > +     v4l2_async_nf_init(&csidev->notifier);
> > > +
> > > +     ep =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(csidev->dev),=
 0,
> >=20
> > 0,
> >=20
> > > +
> >=20
> > FWNODE_GRAPH_ENDPOINT_NEXT);
> >=20
> > > +     if (!ep)
> > > +             return -ENOTCONN;
> > > +
> > > +     ret =3D v4l2_fwnode_endpoint_parse(ep, &vep);
> > > +     if (ret)
> > > +             goto err_parse;
> > > +
> > > +     for (i =3D 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
> > > +             if (vep.bus.mipi_csi2.data_lanes[i] !=3D i + 1) {
> > > +                     dev_err(csidev->dev,
> > > +                             "data lanes reordering is not
> >=20
> > supported");
> >=20
> > > +                     ret =3D -EINVAL;
> > > +                     goto err_parse;
> > > +             }
> > > +     }
> > > +
> > > +     csidev->bus =3D vep.bus.mipi_csi2;
> > > +
> > > +     if (fwnode_property_read_u32(ep, "fsl,hsfreqrange",
> > > +                                  &csidev->hsfreqrange))
> > > +             csidev->hsfreqrange =3D DPHY_DEFAULT_FREQRANGE;
> > > +
> > > +     dev_dbg(csidev->dev, "data lanes: %d\n", csidev-
> > >
> > >bus.num_data_lanes);
> > >
> > > +     dev_dbg(csidev->dev, "flags: 0x%08x\n", csidev->bus.flags);
> > > +     dev_dbg(csidev->dev, "high speed frequency range: 0x%X\n",
> > > csidev->hsfreqrange); +
> > > +     asd =3D v4l2_async_nf_add_fwnode_remote(&csidev->notifier, ep,
> > > +                                           struct
> >=20
> > v4l2_async_subdev);
> >=20
> > > +     if (IS_ERR(asd)) {
> > > +             ret =3D PTR_ERR(asd);
> > > +             goto err_parse;
> > > +     }
> > > +
> > > +     fwnode_handle_put(ep);
> > > +
> > > +     csidev->notifier.ops =3D &dwc_csi_notify_ops;
> > > +
> > > +     ret =3D v4l2_async_subdev_nf_register(&csidev->sd,
> > > &csidev->notifier);
> > > +     if (ret)
> > > +             return ret;
> >=20
> >=20
> > I'm not sure which part causes the following message:
> >=20
> > > dwc-mipi-csi2 4ae00000.mipi-csi: Consider updating driver dwc-mipi-cs=
i2
> > > to
> >=20
> > match on endpoints
> >=20
> > But as this is a new driver, this should be addressed.
>=20
>=20
> Sure. Could you help to share the steps about how to reproduce it?

Sure, I assume this depends how your OF graph looks like. This is the one I=
=20
used, stripped some of the (irrelevant) camera properties.

&lpi2c5 {
  camera@1a {
    compatible =3D "sony,imx327lqr";
    reg =3D <0x1a>;

    port {
      sony_imx327: endpoint {
        remote-endpoint =3D <&mipi_to_isi>;
        data-lanes =3D <1 2>;
        clock-lanes =3D <0>;
        clock-noncontinuous =3D <1>;
        link-frequencies =3D /bits/ 64 <445500000 297000000>;
      };
    };
  };
};

/ {
  soc@0 {
    mipi_csi: mipi-csi@4ae00000 {
      compatible =3D "fsl,imx93-mipi-csi2";
      reg =3D <0x4ae00000 0x10000>;
      interrupts =3D <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
      clocks =3D <&clk IMX93_CLK_MIPI_CSI_GATE>,
         <&clk IMX93_CLK_CAM_PIX>,
         <&clk IMX93_CLK_MIPI_PHY_CFG>;
      clock-names =3D "per", "pixel", "phy_cfg";
      power-domains =3D <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_CSI>;

      ports {
        #address-cells =3D <1>;
        #size-cells =3D <0>;

        port@0 {
          reg =3D <0>;

          mipi_from_sensor: endpoint {
            data-lanes =3D <1 2>;
            fsl,hsfreqrange =3D <0x2c>;
          };
        };

        port@1 {
          reg =3D <1>;

          mipi_to_isi: endpoint {
            remote-endpoint =3D <&isi_in>;
          };
        };
      };
    };
  };
};

As you can see the link speed is either 445.5MHz or 297Mhz. Does this mean =
I=20
have to set fsl,hsfreqrange to 0x16 or 0x14?

> [snip]

> > > +void dphy_rx_test_code_config(struct dwc_csi_device *csidev)
> > > +{
> > > +     u32 val;
> > > +     u8 dphy_val;
> > > +
> > > +     /* Set testclr=3D1'b0 */
> > > +     val =3D dwc_csi_read(csidev, CSI2RX_DPHY_TEST_CTRL0);
> > > +     val &=3D ~CSI2RX_DPHY_TEST_CTRL0_TEST_CLR;
> > > +     dwc_csi_write(csidev, CSI2RX_DPHY_TEST_CTRL0, val);
> > > +
> > > +     /* Enable hsfreqrange_ovr_en and set hsfreqrange */
> > > +     dphy_rx_write(csidev, DPHY_RX_SYS_0,
> >=20
> > HSFREQRANGE_OVR_EN_RW);
> >=20
> > > +     dphy_rx_write(csidev, DPHY_RX_SYS_1,
> > > +                   HSFREQRANGE_OVR_RW(csidev->hsfreqrange));
> > > +
> > > +     /* Enable timebase_ovr_en */
> > > +     dphy_val =3D dphy_rx_read(csidev, DPHY_RX_SYS_1);
> > > +     dphy_val |=3D TIMEBASE_OVR_EN_RW;
> > > +     dphy_rx_write(csidev, DPHY_RX_SYS_1, dphy_val);
> > > +
> > > +     /* Set cfgclkfreqrange */
> > > +     dphy_rx_write(csidev, DPHY_RX_SYS_2,
> > > +                   TIMEBASE_OVR_RW(csidev->cfgclkfreqrange + 0x44));
> >=20
> >=20
> > RM Rev 2. mentions that depending on cfgclkfreqrange another
> > configuration,
 called counter_for_des_en_config_if, also needs to be
> > set. Is this missing here?
>=20
>=20
> It isn't needed from my experiment result.

Okay, I'm just doing guesswork trying to figure out why I get those D-PHY=20
errors.

> >=20
> >=20
> > > +}
> > > +
> > > +void dphy_rx_power_off(struct dwc_csi_device *csidev)
> > > +{
> > > +     dwc_csi_write(csidev, CSI2RX_DPHY_RSTZ, 0x0);
> > > +     dwc_csi_write(csidev, CSI2RX_DPHY_SHUTDOWNZ, 0x0);
> > > +}
> > > +
> > > +void dphy_rx_test_code_dump(struct dwc_csi_device *csidev)
> > > +{
> > > +#define DPHY_DEBUG_REG(name)         {name, #name}
> > > +     static const struct {
> > > +             u32 offset;
> > > +             const char * const name;
> > > +     } test_codes[] =3D {
> > > +             DPHY_DEBUG_REG(DPHY_RX_SYS_0),
> > > +             DPHY_DEBUG_REG(DPHY_RX_SYS_1),
> > > +             DPHY_DEBUG_REG(DPHY_RX_SYS_2),
> > > +     };
> > > +     unsigned int i;
> > > +
> > > +     for (i =3D 0; i < ARRAY_SIZE(test_codes); i++)
> > > +             dev_dbg(csidev->dev, "%14s[0x%02x]: 0x%02x\n",
> > > +                     test_codes[i].name, test_codes[i].offset,
> > > +                     dphy_rx_read(csidev, test_codes[i].offset));
> > > +}
> >=20
> >=20
> > Could you also provide a complete DT configuration? I tried myself, but=
 I
> > just ended up in getting errors while trying to use a MIPI-CSI camera
> > dwc-mipi-csi2 4ae00000.mipi-csi: IPI Interface Fatal Error events:
> > 2800064
> > dwc-mipi-csi2 4ae00000.mipi-csi: PHY Error events: 2174
> > dwc-mipi-csi2 4ae00000.mipi-csi: IPI Interface Fatal Error events:
> > 2800064
> > dwc-mipi-csi2 4ae00000.mipi-csi: PHY Error events: 2174
>=20
>=20
> Sure, I can provide full patches that use i.MX93 platform with AP1302 if =
you
> are interested.
> Will send you in another mails.

Thanks.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


