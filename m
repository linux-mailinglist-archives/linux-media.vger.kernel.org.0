Return-Path: <linux-media+bounces-16282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FBC951842
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 12:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1589E284F4E
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 10:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BA313D502;
	Wed, 14 Aug 2024 10:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="dzBk4iJ1";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="LsHZ/+hB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0488F13635F;
	Wed, 14 Aug 2024 10:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723629765; cv=none; b=KLHsh/7QIkC0ZQ8CqrvuzA20fZwrrQADMupHEucXOe8yAhrlusb4qyk+20A4bpxoCt69ENt45NKmMxrJRh4wx8OeknUmdJJhU2zE12EBx5jR1HsPDgKd8uPPZBcz9wNMnA9UfdUTI/kOQW4DHHYoHYbmqHqyQ5Vl2NvTqsYr/fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723629765; c=relaxed/simple;
	bh=Psc/jzJBEE/vSR0q6Y8fY6UqWBMcUESkQNgpQu40Y/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=srSLL3MycS0896Alw08cnNixhOxIp7vEy4r4nmSgb2rpW2XShvTFRayWreUacns4x6xUkZLQ6VnnQyTlqPD49/lbhZqgC9y8lxix2M5MUXnC3cxXDAANPmNPrKOfAeXndAAB1kuMBctlEehEHZFSERAui3ZLk6CDt1iD/PSY9r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=dzBk4iJ1; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=LsHZ/+hB reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723629761; x=1755165761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BPZGFRB2PA0ZD8ZK7tgrErfEO8CEIAAq2TrYxTVlHy4=;
  b=dzBk4iJ1pWwY9uJ2U2bl/EVYArm5FUVmwWvBzjYaTyZXA/pY3pOGvyrj
   INspLzHBBNaFdrRM2S198nX+FHzPmIvPIHSwFQN/SaJdGQOad1KEpmkRQ
   5sr0KnC9umFXPK87NCTM6kLHB202JNlLgyhOA+4KEExK0VmF/XWtOVdSq
   Zxb1cnZ1dLAOiE6k0IpS5ru32qoC0GTcbP/3mJo2fpybG18ULZpQoP97m
   VO/7Qz7cxtkQFomWYjFi+kWtZCRR0NDMJ8dnHafT3sTxXwV1lRdU+t8fY
   bWPaImdefNxgWy5LYRF0FAzggTloCqr9aIqMmFjuT6rQXd4jkliW3dNGr
   A==;
X-CSE-ConnectionGUID: q9Y498GFSn+pS8/MSYDnVQ==
X-CSE-MsgGUID: q2l4OOwzRByh9FrgiI6jxQ==
X-IronPort-AV: E=Sophos;i="6.09,145,1716242400"; 
   d="scan'208";a="38404410"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 14 Aug 2024 12:02:33 +0200
X-CheckPoint: {66BC80B9-9-E9ED6009-C4B0BEC8}
X-MAIL-CPID: 332DE6BABCAAD2E2420EAA204B3F0B90_3
X-Control-Analysis: str=0001.0A782F19.66BC80B9.00C6,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C55D167CFB;
	Wed, 14 Aug 2024 12:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723629748;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BPZGFRB2PA0ZD8ZK7tgrErfEO8CEIAAq2TrYxTVlHy4=;
	b=LsHZ/+hBOPdj+T7j1Crt+UhX70ljQhFNIDmyMr22Vhz/UeKeG/MzniDdnOECAMrTtYsIjS
	Po34qjZ2p21NHVoW339yr4s7ZNtLL6lP7rv+OTfrPCkC3/2z4NuSg9YYI+3id3xA0yuU9Q
	wMTnkPEGb63kwQShOt7kbF7v7vqO0bY1U6t/02oFm92Owt8sHn95QARWCPFHdWWn1dKvBj
	nr9kufVwIOxuLefylAo738+08rt7tjd2DL0uXhXxB3wzbsBtujYPsEfifEWCjFnlMchThR
	XWc7MX6jM+jmXTQm/wAklS7YO/4ve2AYmRr9mncLRMjUOHpw3RE7ZPBo4Va6Ag==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder@ideasonboard.com>, Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Date: Wed, 14 Aug 2024 12:02:26 +0200
Message-ID: <5809346.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240813234004.17807-1-laurent.pinchart@ideasonboard.com>
References: <20240813234004.17807-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Laurent,

thanks for the patch.

Am Mittwoch, 14. August 2024, 01:40:04 CEST schrieb Laurent Pinchart:
> From: Paul Elder <paul.elder@ideasonboard.com>
>=20
> The ISP supports both CSI and parallel interfaces, where port 0
> corresponds to the former and port 1 corresponds to the latter. Since
> the i.MX8MP's ISPs are connected by the parallel interface to the CSI
> receiver, set them both to port 1.
>=20
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Adam Ford <aford173@gmail.com> # imx8mp-beacon
> ---
> Changes since v2:
>=20
> - Assign clock parent and frequency in blk-ctrl
>=20
> Changes since v1:
>=20
> - Fix clock ordering
> - Add #address-cells and #size-cells to ports nodes
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 51 ++++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index d9b5c40f6460..09f1e27ee220 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1673,6 +1673,50 @@ isi_in_1: endpoint {
>  				};
>  			};
> =20
> +			isp_0: isp@32e10000 {
> +				compatible =3D "fsl,imx8mp-isp";
> +				reg =3D <0x32e10000 0x10000>;
> +				interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
> +					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> +					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> +				clock-names =3D "isp", "aclk", "hclk";
> +				power-domains =3D <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
> +				fsl,blk-ctrl =3D <&media_blk_ctrl 0>;
> +				status =3D "disabled";
> +
> +				ports {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +
> +					port@1 {
> +						reg =3D <1>;
> +					};
> +				};
> +			};
> +
> +			isp_1: isp@32e20000 {
> +				compatible =3D "fsl,imx8mp-isp";
> +				reg =3D <0x32e20000 0x10000>;
> +				interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks =3D <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
> +					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> +					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> +				clock-names =3D "isp", "aclk", "hclk";
> +				power-domains =3D <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
> +				fsl,blk-ctrl =3D <&media_blk_ctrl 1>;
> +				status =3D "disabled";
> +
> +				ports {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +
> +					port@1 {
> +						reg =3D <1>;
> +					};
> +				};
> +			};
> +
>  			dewarp: dwe@32e30000 {
>  				compatible =3D "nxp,imx8mp-dw100";
>  				reg =3D <0x32e30000 0x10000>;
> @@ -1873,13 +1917,16 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
>  						  <&clk IMX8MP_CLK_MEDIA_APB>,
>  						  <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
>  						  <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>,
> +						  <&clk IMX8MP_CLK_MEDIA_ISP>,
>  						  <&clk IMX8MP_VIDEO_PLL1>;
>  				assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>,
>  							 <&clk IMX8MP_SYS_PLL1_800M>,
>  							 <&clk IMX8MP_VIDEO_PLL1_OUT>,
> -							 <&clk IMX8MP_VIDEO_PLL1_OUT>;
> +							 <&clk IMX8MP_VIDEO_PLL1_OUT>,
> +							 <&clk IMX8MP_SYS_PLL2_500M>;
>  				assigned-clock-rates =3D <500000000>, <200000000>,
> -						       <0>, <0>, <1039500000>;
> +						       <0>, <0>, <0>, <500000000>,
> +						       <1039500000>;

Isn't this one '<0>' too much? <500000000> is for IMX8MP_CLK_MEDIA_ISP, rig=
ht?

Best regards,
Alexander

>  				#power-domain-cells =3D <1>;
> =20
>  				lvds_bridge: bridge@5c {
>=20
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



