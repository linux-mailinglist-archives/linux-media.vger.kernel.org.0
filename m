Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45CEB746C21
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 10:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbjGDIjR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 04:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjGDIiy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 04:38:54 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E98101;
        Tue,  4 Jul 2023 01:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1688459931; x=1719995931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=66rmVFF6mOeNiOClvPDq6VuPrHLwsEe57/SioeogkQA=;
  b=VtyHCwDb1wohM2TD06MR0BDSR7y4X3jtUyKEiU0dSLWjEf+Uvd+XNtYu
   PAl5+AmbgGucKc6QM38fUovxST6g6IwafPJbvc/NKvwvMshUl48+uzVMq
   dPubAXb+Kg767qnYaQTWtem+SXmJhuHiVYXHGhNfKp4JN2AL1JOoK+mQ9
   YOQk21awhwtjLcCxpOxSW8FbdTZE6FyLoa4/BzCVu/4rkk2fxoVyufEBZ
   U3tRcaRDCxXqyQRUIHrpo3EWkod5yyvRtZoQ7eldTugHioOhAsYfWos2H
   2vtG3WZJ1+EskaPpiWS1llXm8VMz6d8iU7zAbjjGNWEHUnD7Xmpju8SPt
   w==;
X-IronPort-AV: E=Sophos;i="6.01,180,1684792800"; 
   d="scan'208";a="31741766"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 04 Jul 2023 10:38:49 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 44526280087;
        Tue,  4 Jul 2023 10:38:49 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, guoniu.zhou@oss.nxp.com
Cc:     mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH 1/2] media: dt-bindings: Add binding doc for i.MX93 MIPI CSI-2
Date:   Tue, 04 Jul 2023 10:38:49 +0200
Message-ID: <2292421.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230703113734.762307-2-guoniu.zhou@oss.nxp.com>
References: <20230703113734.762307-1-guoniu.zhou@oss.nxp.com> <20230703113734.762307-2-guoniu.zhou@oss.nxp.com>
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

thanks for posting this driver.

Am Montag, 3. Juli 2023, 13:37:33 CEST schrieb guoniu.zhou@oss.nxp.com:
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
> Add new binding documentation for DesignWare Core MIPI CSI-2 receiver
> and DPHY found on NXP i.MX93.
>=20
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> ---
>  .../bindings/media/nxp,dwc-mipi-csi2.yaml     | 140 ++++++++++++++++++
>  1 file changed, 140 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.ya=
ml
> b/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml new file
> mode 100644
> index 000000000000..ece6fb8991d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,dwc-mipi-csi2.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,dwc-mipi-csi2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX93 MIPI CSI-2 Host Controller receiver
> +
> +maintainers:
> +  - G.N. Zhou <guoniu.zhou@nxp.com>
> +
> +description: |-
> +  The MIPI CSI-2 receiver found on i.MX93 originates from Synopsys
> +  DesignWare Core and it implements the CSI-2 protocol on the host
> +  side and a DPHY configured as a Slave acts as the physical layer.
> +  Two data lanes are supported on i.MX93 family devices and the data
> +  rate of each lane support up to 1.5Gbps.
> +
> +  While the CSI-2 receiver is separate from the MIPI D-PHY IP core,
> +  the PHY is completely wrapped by the CSI-2 controller and expose
> +  a control interface which only can communicate with CSI-2 controller
> +  This binding thus covers both IP cores.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx93-mipi-csi2
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The peripheral clock (a.k.a. APB clock)
> +      - description: The pixel clock
> +      - description: The MIPI D-PHY clock
> +
> +  clock-names:
> +    items:
> +      - const: per
> +      - const: pixel
> +      - const: phy_cfg
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port node, single endpoint describing the CSI-2
> transmitter. +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                items:
> +                  - const: 1
> +                  - const: 2
> +
> +              fsl,hsfreqrange:
> +                $ref: /schemas/types.yaml#/definitions/uint32
> +                description:
> +                  Used to select the desired high speed frequency range
> +                  according to data lane bit rate. Please refer to i.MX93
> +                  reference manual MIPI CSI-2 DPHY chapter to get a valid
> +                  value.

If this is data lane bit rate specific, shouldn't it be set in s_stream=20
callback or similar?

Best regards,
Alexander

> +
> +            required:
> +              - data-lanes
> +              - fsl,hsfreqrange
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port node
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx93-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/fsl,imx93-power.h>
> +
> +    mipi-csi@4ae00000 {
> +        compatible =3D "fsl,imx93-mipi-csi2";
> +        reg =3D <0x4ae00000 0x10000>;
> +        interrupts =3D <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&clks IMX93_CLK_MIPI_CSI_GATE>,
> +                 <&clks IMX93_CLK_CAM_PIX>,
> +                 <&clks IMX93_CLK_MIPI_PHY_CFG>;
> +        clock-names =3D "per", "pixel", "phy_cfg";
> +        power-domains =3D <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_CSI>;
> +
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                reg =3D <0>;
> +
> +                mipi_from_sensor: endpoint {
> +                    remote-endpoint =3D <&ap1302_to_mipi>;
> +                    data-lanes =3D <1 2>;
> +                    fsl,hsfreqrange =3D <0x2c>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg =3D <1>;
> +
> +                mipi_to_isi: endpoint {
> +                    remote-endpoint =3D <&isi_in>;
> +                };
> +            };
> +        };
> +    };
> +...


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


