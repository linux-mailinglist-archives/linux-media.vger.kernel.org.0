Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0447D4149D7
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 14:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236140AbhIVM5B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 08:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236035AbhIVM46 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 08:56:58 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 765CFC061756
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 05:55:28 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id q81so5543951qke.5
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 05:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Xl1LKKaIiXIR37FrSULq1gxTEDagbmid3RKiTF/dDZo=;
        b=ucMCz1XsSXa4jVLaWDpBuCtPqr2LWu/82E7qUfIQGQLQeCEQIcLYCkmcvbIo8Vd12J
         dXjOvKLpQWgJbZUowNSVw+g/l+EYxoiFv4BxA2HLgvKNh0cb2d/pZR7XVFuP0GvPKQWb
         2bu4ISk5Nmcmm3pEAFHiHWXuBvrDrXoHf3Nt5t3uuMwYvTJ72kiYqe2YVOvf8mERrWLh
         OGBnpgZ8P/K0+XcGVw0T66qA7G24cJW1MevbPf0KzDvcuo/ly5Rz7GHulb8+sz8Tzw9N
         9hAeuF1/JBR6uokvd617IVMSUT8tGGjMAT8nRk8bEU44pAjHN70WhBc6b0gwPKAg6fVm
         WJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Xl1LKKaIiXIR37FrSULq1gxTEDagbmid3RKiTF/dDZo=;
        b=pzpfYn3zMotlldguneZL2p3sNzU5Uetfkk/seKYy5q/8obS/4yVq3ExWa8Wo/1JPEM
         m7iXOlMGc1v7tr+n7DijZtmYVqwvlykRaBgF+EFpmkAq0rsIK34acME7I2aqwVqZDYtm
         KuY4Yk8VsSePZe92nFb50F6B5nFhcJ4YNO9Hd7eAO1wZm2MfDL7gzMI3CR2q2ISZUmOh
         NKdPIDmhhF8TX+tyve2BNCZwFuTJG17COz9UvS8Q6eWSu+2vxac7Vdf09SvgFYVvT1gr
         tbgg+GNp+7NID2h4P2iiqi9ZVr2Nq57+sjK6Sv4yKiGYThygwOlUEnYcdDyfGwBcgD49
         P2vA==
X-Gm-Message-State: AOAM533+FKiPFtrXost8uvvDClkBkLqf7RNqLvM28QmmOyKDlVmjNf8J
        707J7JmGHVycy4MTJKN9cxG3xw==
X-Google-Smtp-Source: ABdhPJwgt0W5YMkkw7w3IhC4ynEqGmVa7i1e+ILuzKPG99+rs1dt2aElAFlEbCssUzyHtm/Ulr/qbw==
X-Received: by 2002:a05:620a:c53:: with SMTP id u19mr34147027qki.144.1632315327587;
        Wed, 22 Sep 2021 05:55:27 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id h5sm1725958qke.1.2021.09.22.05.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 05:55:27 -0700 (PDT)
Message-ID: <1a454107661fced1adfd8a76a20a819d75b882d4.camel@ndufresne.ca>
Subject: Re: [PATCH v9 11/13] ARM64: dts: freescale: imx8q: add imx vpu
 codec entries
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date:   Wed, 22 Sep 2021 08:55:25 -0400
In-Reply-To: <620081ca2f6441de6307792dbb7797da148cf04c.1631521295.git.ming.qian@nxp.com>
References: <cover.1631521295.git.ming.qian@nxp.com>
         <620081ca2f6441de6307792dbb7797da148cf04c.1631521295.git.ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ming,

Le lundi 13 septembre 2021 à 17:11 +0800, Ming Qian a écrit :
> Add the Video Processing Unit node for IMX8Q SoC.

Just to let you know that this patch no longer apply on 5.15-rc2. Please let us
know which was your base.

> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> ---
>  .../arm64/boot/dts/freescale/imx8-ss-vpu.dtsi | 72 +++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 17 +++++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    | 24 +++++++
>  3 files changed, 113 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
> new file mode 100644
> index 000000000000..f2dde6d14ca3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-vpu.dtsi
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2021 NXP
> + *	Dong Aisheng <aisheng.dong@nxp.com>
> + */
> +
> +vpu: vpu@2c000000 {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	ranges = <0x2c000000 0x0 0x2c000000 0x2000000>;
> +	reg = <0 0x2c000000 0 0x1000000>;
> +	power-domains = <&pd IMX_SC_R_VPU>;
> +	status = "disabled";
> +
> +	mu_m0: mailbox@2d000000 {
> +		compatible = "fsl,imx6sx-mu";
> +		reg = <0x2d000000 0x20000>;
> +		interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
> +		#mbox-cells = <2>;
> +		power-domains = <&pd IMX_SC_R_VPU_MU_0>;
> +		status = "okay";
> +	};
> +
> +	mu1_m0: mailbox@2d020000 {
> +		compatible = "fsl,imx6sx-mu";
> +		reg = <0x2d020000 0x20000>;
> +		interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
> +		#mbox-cells = <2>;
> +		power-domains = <&pd IMX_SC_R_VPU_MU_1>;
> +		status = "okay";
> +	};
> +
> +	mu2_m0: mailbox@2d040000 {
> +		compatible = "fsl,imx6sx-mu";
> +		reg = <0x2d040000 0x20000>;
> +		interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
> +		#mbox-cells = <2>;
> +		power-domains = <&pd IMX_SC_R_VPU_MU_2>;
> +		status = "disabled";
> +	};
> +
> +	vpu_core0: vpu_core@2d080000 {
> +		reg = <0x2d080000 0x10000>;
> +		compatible = "nxp,imx8q-vpu-decoder";
> +		power-domains = <&pd IMX_SC_R_VPU_DEC_0>;
> +		mbox-names = "tx0", "tx1", "rx";
> +		mboxes = <&mu_m0 0 0>,
> +			<&mu_m0 0 1>,
> +			<&mu_m0 1 0>;
> +		status = "disabled";
> +	};
> +	vpu_core1: vpu_core@2d090000 {
> +		reg = <0x2d090000 0x10000>;
> +		compatible = "nxp,imx8q-vpu-encoder";
> +		power-domains = <&pd IMX_SC_R_VPU_ENC_0>;
> +		mbox-names = "tx0", "tx1", "rx";
> +		mboxes = <&mu1_m0 0 0>,
> +			<&mu1_m0 0 1>,
> +			<&mu1_m0 1 0>;
> +		status = "disabled";
> +	};
> +	vpu_core2: vpu_core@2d0a0000 {
> +		reg = <0x2d0a0000 0x10000>;
> +		compatible = "nxp,imx8q-vpu-encoder";
> +		power-domains = <&pd IMX_SC_R_VPU_ENC_1>;
> +		mbox-names = "tx0", "tx1", "rx";
> +		mboxes = <&mu2_m0 0 0>,
> +			<&mu2_m0 0 1>,
> +			<&mu2_m0 1 0>;
> +		status = "disabled";
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> index 863232a47004..05495b60beb8 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
> @@ -196,6 +196,23 @@ &usdhc2 {
>  	status = "okay";
>  };
>  
> +&vpu {
> +	compatible = "nxp,imx8qxp-vpu";
> +	status = "okay";
> +};
> +
> +&vpu_core0 {
> +	reg = <0x2d040000 0x10000>;
> +	memory-region = <&decoder_boot>, <&decoder_rpc>;
> +	status = "okay";
> +};
> +
> +&vpu_core1 {
> +	reg = <0x2d050000 0x10000>;
> +	memory-region = <&encoder_boot>, <&encoder_rpc>;
> +	status = "okay";
> +};
> +
>  &iomuxc {
>  	pinctrl_fec1: fec1grp {
>  		fsl,pins = <
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 1e6b4995091e..6b421cfa5534 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -46,6 +46,9 @@ aliases {
>  		serial1 = &lpuart1;
>  		serial2 = &lpuart2;
>  		serial3 = &lpuart3;
> +		vpu_core0 = &vpu_core0;
> +		vpu_core1 = &vpu_core1;
> +		vpu_core2 = &vpu_core2;
>  	};
>  
>  	cpus {
> @@ -134,10 +137,30 @@ reserved-memory {
>  		#size-cells = <2>;
>  		ranges;
>  
> +		decoder_boot: decoder-boot@84000000 {
> +			reg = <0 0x84000000 0 0x2000000>;
> +			no-map;
> +		};
> +
> +		encoder_boot: encoder-boot@86000000 {
> +			reg = <0 0x86000000 0 0x200000>;
> +			no-map;
> +		};
> +
> +		decoder_rpc: decoder-rpc@0x92000000 {
> +			reg = <0 0x92000000 0 0x100000>;
> +			no-map;
> +		};
> +
>  		dsp_reserved: dsp@92400000 {
>  			reg = <0 0x92400000 0 0x2000000>;
>  			no-map;
>  		};
> +
> +		encoder_rpc: encoder-rpc@0x94400000 {
> +			reg = <0 0x94400000 0 0x700000>;
> +			no-map;
> +		};
>  	};
>  
>  	pmu {
> @@ -258,6 +281,7 @@ map0 {
>  	};
>  
>  	/* sorted in register address */
> +	#include "imx8-ss-vpu.dtsi"
>  	#include "imx8-ss-adma.dtsi"
>  	#include "imx8-ss-conn.dtsi"
>  	#include "imx8-ss-ddr.dtsi"


