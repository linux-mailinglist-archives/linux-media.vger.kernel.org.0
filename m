Return-Path: <linux-media+bounces-27735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C48AEA5505C
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 17:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CAA83A83C2
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 16:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55694212D7A;
	Thu,  6 Mar 2025 16:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="HRuSJEPH"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9957010F1;
	Thu,  6 Mar 2025 16:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741277833; cv=none; b=nFupHecAAwd1etRmlpF9bIia8uN3teazTJgMmXCdn7z0DNa4ZubH7du02FsDQss694DBNp4WNbuP6vA7ey9UwPiDfWEt7n63M1y/DH4zYYLl/IIKLIV9zigT990xPGh/lWeoqtriCz1TTnc//zcwqeaSV12pkctO7GO9vGkk9yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741277833; c=relaxed/simple;
	bh=4PR+wrbIV9a1dU/V3AYEVB955Nz6kBYS5XJ39/VJA5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oZLZkGRDHQdwGbfEWGrHH+8Aib+FOdYrYGrN7gyPgozRGAjAxtVa4RrLu3/PHKIXMz4jqtEFB7t6+X26H2obdYO4hPnVt9y07CJ32PwEEI/BJ9tlMrXMvRb2Do4VNwshzuchsrmNsgrar/KktHpY6OeoVDL2/2q3rDcvVKlicVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=HRuSJEPH; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Geb6EtM93X/fXUXMAE0FPspUAQRaC0n4VhGwzmdgPhc=; b=HRuSJEPHExoiukq5ECmYJqumVz
	abvKSEf1ZGPhhA4F1EEBPY2qzHRaRsRmCwBIC/kLPhFnmHbtkqwcIPxPmQ43RLXu6/FwoX4c6gWCc
	L0WsDGZaT9r6dYpr6ouaTUlnzxUZKNjcVr3dY7e9CmR9C+0hLpymRbb2hs++jh6p7i7Xcll1aTWXf
	ZllK+3oQn/1gamSSM4pBUFlr47zuq/FspmCtzotCt2UcU0J+ZA35p+Kml4LCZefr+xOLjt8mNyODL
	QxXXI1ku+3j3pDjhkWBkQAWFTfzM4jy8Wj44PdibMPTF/PXc1iXahuQLkaifqNXsmhTT6V2b2LXy2
	uBH+chWQ==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqDu7-0004hc-2k; Thu, 06 Mar 2025 17:16:59 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 jose.abreu@synopsys.com, nelson.costa@synopsys.com, shawn.wen@rock-chips.com,
 nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Diederik de Haas <didi.debian@cknow.org>
Subject:
 Re: [PATCH v14 1/3] arm64: dts: rockchip: Add device tree support for HDMI RX
 Controller
Date: Thu, 06 Mar 2025 17:16:57 +0100
Message-ID: <3216426.Mh6RI2rZIc@diego>
In-Reply-To: <f5f3dd36-0f90-47dd-bc12-1e2f0207fe7d@collabora.com>
References:
 <20250306072842.287142-1-dmitry.osipenko@collabora.com>
 <9489391.T7Z3S40VBb@diego>
 <f5f3dd36-0f90-47dd-bc12-1e2f0207fe7d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 6. M=C3=A4rz 2025, 16:53:48 MEZ schrieb Dmitry Osipenko:
> On 3/6/25 16:06, Heiko St=C3=BCbner wrote:
> > Hi Dmitry,
> >=20
> > Am Donnerstag, 6. M=C3=A4rz 2025, 08:28:40 MEZ schrieb Dmitry Osipenko:
> >> From: Shreeya Patel <shreeya.patel@collabora.com>
> >>
> >> Add device tree support for Synopsys DesignWare HDMI RX
> >> Controller.
> >>
> >> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
> >> Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
> >> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> >> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >> ---

> >> +	hdmi_receiver: hdmi_receiver@fdee0000 {
> >> +		compatible =3D "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-rx";
> >> +		reg =3D <0x0 0xfdee0000 0x0 0x6000>;
> >> +		power-domains =3D <&power RK3588_PD_VO1>;
> >> +		rockchip,grf =3D <&sys_grf>;
> >> +		rockchip,vo1-grf =3D <&vo1_grf>;
> >> +		interrupts =3D <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>,
> >> +			     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH 0>,
> >> +			     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>;
> >> +		interrupt-names =3D "cec", "hdmi", "dma";
> >> +		clocks =3D <&cru ACLK_HDMIRX>,
> >> +			 <&cru CLK_HDMIRX_AUD>,
> >> +			 <&cru CLK_CR_PARA>,
> >> +			 <&cru PCLK_HDMIRX>,
> >> +			 <&cru CLK_HDMIRX_REF>,
> >> +			 <&cru PCLK_S_HDMIRX>,
> >> +			 <&cru HCLK_VO1>;
> >> +		clock-names =3D "aclk",
> >> +			      "audio",
> >> +			      "cr_para",
> >> +			      "pclk",
> >> +			      "ref",
> >> +			      "hclk_s_hdmirx",
> >> +			      "hclk_vo1";
> >> +		resets =3D <&cru SRST_A_HDMIRX>, <&cru SRST_P_HDMIRX>,
> >> +			 <&cru SRST_HDMIRX_REF>, <&cru SRST_A_HDMIRX_BIU>;
> >> +		reset-names =3D "axi", "apb", "ref", "biu";
> >> +		memory-region =3D <&hdmi_receiver_cma>;
> >> +		pinctrl-0 =3D <&hdmim1_rx>;
> >> +		pinctrl-names =3D "default";
> >=20
> > hmm, this might be better living in the board dts?
>=20
> HDMI RX controller is a part of the SoC, it's not specific to a
> particular board. If you meaning move it into rock5b.dts, then we
> definitely shouldn't do it. It's like moving PCIe controller node into a
> board DT :)

sorry, should've been clearer. I meant the pinctrl.
There are two sets of pins hdmim0-rx and hdmim1-rx which one is used is
board specific.

Can you check if "most" boards use the M1 variant?

Rationale being, that if we know that most boards use the same set of
pins, it's likely ok to just have the minority boards override it.

Heiko




