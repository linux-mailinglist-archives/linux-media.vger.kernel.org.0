Return-Path: <linux-media+bounces-27714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27828A54B83
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 14:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4841E18974A6
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E8920C48A;
	Thu,  6 Mar 2025 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="HW4ePAFd"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCA420B80B;
	Thu,  6 Mar 2025 13:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266417; cv=none; b=fXzOURZtvT9Q77xboymaArkxTEyLSRI7Hi1vM8EbZyhEbBrSrvn3frDzImx7643MjUtq8RYpy+R7M1MdnZdu6cU00ef6TBR6bSQqMg7mK+5F5Ftd6M8rJCyGsO+lgDH/Y6UXFN038JNsDS9ZpwpvwYpyAf5HFXt05AcTitx3z5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266417; c=relaxed/simple;
	bh=/zvzWaJI1zZXi4qtvOSdgjvM/z7uv3ifWM6gOzWmeH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VKE1Dm70FDLIfvoMDKtZmy+YvPOCunTVoodJYFlbjml6sUcZs+z6HK03/mQ+2jse1sHm87QYFF7Y7BzPNCDYI/8iIlnCHpTgCN4hVQyIOZPOK1avNXNV852VeFm3NysXAUwFEFo4BjaAdgtg9pTsQvrhss1X4rpbWA+b21VXgBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=HW4ePAFd; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mfBuDbSuVwW4tPY5y3ejNrFbP51Lhqr440UyYLTygs4=; b=HW4ePAFdm0EXJK81MA9j0l1Ngf
	N3QPXF+BbJlJPc0SOGcLA1ibPPtby/R5nL4YwQC/BR0BgoiuSNlTA2Wnl5QT20X/yqs0ydptuWQms
	/FB8hhqJhXACRIer/jCk/qeyBtlsjzCB3R7/2OoH1WkR+Ctpp1sOFoFx/8dcCuY2+0v27H+LN6wqA
	VSqBTpJ3Noa58ge6W0gtqOyW39+UNE6CG19l1hASFfHGtOlwrWYfKGobuQIfyFU1GuAa1jjLIC4/l
	MjxDgwLGbSjM+hKtV9Pn+8TYKHGLC4AEjZF2EKiX7nqK5mQbgm1k20cfFD3QdcGmKinmPOe+WLv+R
	6XWmSdHQ==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqAvx-00039x-W9; Thu, 06 Mar 2025 14:06:42 +0100
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
Date: Thu, 06 Mar 2025 14:06:40 +0100
Message-ID: <9489391.T7Z3S40VBb@diego>
In-Reply-To: <20250306072842.287142-2-dmitry.osipenko@collabora.com>
References:
 <20250306072842.287142-1-dmitry.osipenko@collabora.com>
 <20250306072842.287142-2-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Dmitry,

Am Donnerstag, 6. M=C3=A4rz 2025, 08:28:40 MEZ schrieb Dmitry Osipenko:
> From: Shreeya Patel <shreeya.patel@collabora.com>
>=20
> Add device tree support for Synopsys DesignWare HDMI RX
> Controller.
>=20
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
> Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  .../dts/rockchip/rk3588-base-pinctrl.dtsi     | 14 +++++
>  .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 57 +++++++++++++++++++
>  2 files changed, 71 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi b/arch=
/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
> index 7f874c77410c..2d4b9986a177 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
> @@ -594,6 +594,20 @@ hdmim0_tx1_hpd: hdmim0-tx1-hpd {
>  				/* hdmim0_tx1_hpd */
>  				<1 RK_PA6 5 &pcfg_pull_none>;
>  		};
> +
> +		/omit-if-no-ref/
> +		hdmim1_rx: hdmim1-rx {
> +			rockchip,pins =3D
> +				/* hdmim1_rx_cec */
> +				<3 RK_PD1 5 &pcfg_pull_none>,
> +				/* hdmim1_rx_scl */
> +				<3 RK_PD2 5 &pcfg_pull_none_smt>,
> +				/* hdmim1_rx_sda */
> +				<3 RK_PD3 5 &pcfg_pull_none_smt>,
> +				/* hdmim1_rx_hpdin */
> +				<3 RK_PD4 5 &pcfg_pull_none>;
> +		};
> +

what's the reason for duplicating these pinctrl entries?

The base-pinctrl already contains a separate set of pins (and also a
variant for the m0 set of pins), so why not check and use the already
existing ones:

                hdmim1_rx_cec: hdmim1-rx-cec {
                        rockchip,pins =3D
                                /* hdmim1_rx_cec */
                                <3 RK_PD1 5 &pcfg_pull_none>;
                };

                hdmim1_rx_hpdin: hdmim1-rx-hpdin {
                        rockchip,pins =3D
                                /* hdmim1_rx_hpdin */
                                <3 RK_PD4 5 &pcfg_pull_none>;
                };

                hdmim1_rx_scl: hdmim1-rx-scl {
                        rockchip,pins =3D
                                /* hdmim1_rx_scl */
                                <3 RK_PD2 5 &pcfg_pull_none>;
                };

                hdmim1_rx_sda: hdmim1-rx-sda {
                        rockchip,pins =3D
                                /* hdmim1_rx_sda */
                                <3 RK_PD3 5 &pcfg_pull_none>;
                };


Having multiple sets (even with differeing settings) will cause confusion
later on.


>  		/omit-if-no-ref/
>  		hdmim1_rx_cec: hdmim1-rx-cec {
>  			rockchip,pins =3D
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/=
boot/dts/rockchip/rk3588-extra.dtsi
> index 4a950907ea6f..b7d06f93c8ce 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> @@ -135,6 +159,39 @@ i2s10_8ch: i2s@fde00000 {
>  		status =3D "disabled";
>  	};
> =20
> +	hdmi_receiver: hdmi_receiver@fdee0000 {
> +		compatible =3D "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-rx";
> +		reg =3D <0x0 0xfdee0000 0x0 0x6000>;
> +		power-domains =3D <&power RK3588_PD_VO1>;
> +		rockchip,grf =3D <&sys_grf>;
> +		rockchip,vo1-grf =3D <&vo1_grf>;
> +		interrupts =3D <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupt-names =3D "cec", "hdmi", "dma";
> +		clocks =3D <&cru ACLK_HDMIRX>,
> +			 <&cru CLK_HDMIRX_AUD>,
> +			 <&cru CLK_CR_PARA>,
> +			 <&cru PCLK_HDMIRX>,
> +			 <&cru CLK_HDMIRX_REF>,
> +			 <&cru PCLK_S_HDMIRX>,
> +			 <&cru HCLK_VO1>;
> +		clock-names =3D "aclk",
> +			      "audio",
> +			      "cr_para",
> +			      "pclk",
> +			      "ref",
> +			      "hclk_s_hdmirx",
> +			      "hclk_vo1";
> +		resets =3D <&cru SRST_A_HDMIRX>, <&cru SRST_P_HDMIRX>,
> +			 <&cru SRST_HDMIRX_REF>, <&cru SRST_A_HDMIRX_BIU>;
> +		reset-names =3D "axi", "apb", "ref", "biu";
> +		memory-region =3D <&hdmi_receiver_cma>;
> +		pinctrl-0 =3D <&hdmim1_rx>;
> +		pinctrl-names =3D "default";

hmm, this might be better living in the board dts?

Heiko



