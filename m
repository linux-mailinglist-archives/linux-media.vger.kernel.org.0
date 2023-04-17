Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDA5E6E3F70
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 08:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbjDQGNL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 02:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbjDQGNK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 02:13:10 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 443C630D3;
        Sun, 16 Apr 2023 23:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681711988; x=1713247988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j7gvqUZqDZD8Oo2yS+/qga24MsPKcb4iX4wAgM9B1VY=;
  b=HlgBHMvqWnrNj3uwxFhA9pdv5fUKPhoHWnXHymbe+CZXWIX2KOxmWJWh
   Tb3KR76e9GEOpkfdFjZirw8T2erpNomzuUr9c79Gi9hmvibR0MP+2apZB
   m1F1WIvWdfkrdVsqoN/eSQIJ/Fv9xftHfaznhdRK0hlg/l71TEgOQyxSj
   wmUshHJ5pfOaWDUn19r2qzLp6zNF/E8Kq3D6j209G7nS5LFWqFxGLPxYg
   8VHNM3hZ6tuxNWIU9A67d0DC97PdjwYC2sDNXnDoessMv5otzJ6JJkVbD
   pjOkgrvngi9XqYmUGGYlFCyMrdsN1KHGQQZkLHaaYK1vKROySKYS7PaCf
   A==;
X-IronPort-AV: E=Sophos;i="5.99,203,1677538800"; 
   d="scan'208";a="30353511"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 17 Apr 2023 08:13:06 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 17 Apr 2023 08:13:06 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 17 Apr 2023 08:13:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1681711986; x=1713247986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j7gvqUZqDZD8Oo2yS+/qga24MsPKcb4iX4wAgM9B1VY=;
  b=pwc5D8wxULPEp8o9kVy68uDGkf1ud2VPeYQlEC/2bfvErhPgEZz5wZRG
   Q1jWkNv/icC8NE3qG5kmD3W2C3ri1N5Hk1DlI2diVZxG8J12Oc8mMKB2L
   T+ZkYGocO/PYcLF4Ztj4zFZZ+fzwkRLcZS1SXwBRa4NRzPgPAhOuL0WuB
   hplZrDiXHNT619Tv3HVaAgUB48wrqkXbEhhkBunvsKimkijua7Mm3cVrM
   /dcfOIuN/HvuvG3h3APxpCKD+3utuQoFeY2UcXhFQtuy10wPFAIx6lEop
   V2ckrbSJ7/l1fgHp7hpxzqUwiL8V+p0Bo7C8xKc7WqSRdW5pHMWJEfB6D
   A==;
X-IronPort-AV: E=Sophos;i="5.99,203,1677538800"; 
   d="scan'208";a="30353509"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Apr 2023 08:13:05 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AC94C280056;
        Mon, 17 Apr 2023 08:13:05 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-arm-kernel@lists.infradead.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: Re: [PATCH v1 2/2] arm64: dts: imx8mp: Add ISI DT node
Date:   Mon, 17 Apr 2023 08:13:04 +0200
Message-ID: <2678521.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230417055627.16482-3-laurent.pinchart@ideasonboard.com>
References: <20230417055627.16482-1-laurent.pinchart@ideasonboard.com> <20230417055627.16482-3-laurent.pinchart@ideasonboard.com>
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

Hi Laurent,

thanks for those ISI patches.

Am Montag, 17. April 2023, 07:56:27 CEST schrieb Laurent Pinchart:
> Add a DT node for the i.MX8MP ISI instance, and model to connection to
> two CSI-2 receivers (CSIS).
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 38 +++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mp.dtsi index
> 2a374a4c14a2..cc7a938b6f73 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1239,6 +1239,38 @@ ldb_lvds_ch1: endpoint {
>  				};
>  			};
>=20
> +			isi_0: isi@32e00000 {
> +				compatible =3D "fsl,imx8mp-isi";
> +				reg =3D <0x32e00000 0x4000>;
> +				interrupts =3D <GIC_SPI 16=20
IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 42=20
IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clk=20
IMX8MP_CLK_MEDIA_AXI_ROOT>,
> +					 <&clk=20
IMX8MP_CLK_MEDIA_APB_ROOT>;
> +				clock-names =3D "axi", "apb";
> +				fsl,blk-ctrl =3D <&media_blk_ctrl>;
> +				power-domains =3D <&media_blk_ctrl=20
IMX8MP_MEDIABLK_PD_ISI>;
> +				status =3D "disabled";
> +
> +				ports {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +
> +					port@0 {
> +						reg =3D <0>;
> +						isi_in_0: endpoint=20
{

I'm not sure if DT graph is different, but usually there is an empty line=20
between properties and subnodes.

Best regards,
Alexander

> +							remote-
endpoint =3D <&mipi_csi_0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg =3D <1>;
> +						isi_in_1: endpoint=20
{
> +							remote-
endpoint =3D <&mipi_csi_1_out>;
> +						};
> +					};
> +				};
> +			};
> +
>  			mipi_csi_0: csi@32e40000 {
>  				compatible =3D "fsl,imx8mp-mipi-csi2",=20
"fsl,imx8mm-mipi-csi2";
>  				reg =3D <0x32e40000 0x10000>;
> @@ -1265,6 +1297,9 @@ port@0 {
>=20
>  					port@1 {
>  						reg =3D <1>;
> +						mipi_csi_0_out:=20
endpoint {
> +							remote-
endpoint =3D <&isi_in_0>;
> +						};
>  					};
>  				};
>  			};
> @@ -1295,6 +1330,9 @@ port@0 {
>=20
>  					port@1 {
>  						reg =3D <1>;
> +						mipi_csi_1_out:=20
endpoint {
> +							remote-
endpoint =3D <&isi_in_1>;
> +						};
>  					};
>  				};
>  			};


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


