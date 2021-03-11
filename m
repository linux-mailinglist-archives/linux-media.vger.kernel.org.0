Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B54E3370BE
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 12:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232550AbhCKLBx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 06:01:53 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:44233 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232402AbhCKLBh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 06:01:37 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id KJ4NlPmBxC40pKJ4QlL29n; Thu, 11 Mar 2021 12:01:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615460495; bh=XZfVWBtfwrsC30R13V20cTW43bqM10QXTplpPo1ZOM0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RFZ6+34TrfE6cjkoWQAFsQ8XWJOEJuOJ47ctQilnfyqZxNKTOH6PuczLtfNkXlOVK
         6LhtG3eawC5xyDRVYbDMJ0BijaTjqCd2n7QouXik5ts0bzcHwUOKk2s3evOpo7YYoU
         cMV0jnrbqtI9kN4peGThiW4wM5Uhs+Nt0+ozNL/PXvmGOYOwVB+5UKQvTvBxxfHvQ7
         lSCfg5AzNlxPVQlPpDCA/qoXAAMTa+TAtZzUGY4vY9ipe1jBzwR46Tx7ceqDZWEH9y
         RwTm62DLnJkrk24p1z46ETlGKURrD8V3sX9ctNhYwZa+Aqs+0wjMnazXfgSwNsN9Lb
         86DUy/jo0+N6Q==
Subject: Re: [PATCH v9 7/8] arm64: dts: imx8qxp: Add jpeg encoder/decoder
 nodes
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        mchehab@kernel.org, shawnguo@kernel.org, robh+dt@kernel.org,
        p.zabel@pengutronix.de
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, ezequiel@collabora.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
References: <20210311002854.13687-1-mirela.rabulea@oss.nxp.com>
 <20210311002854.13687-8-mirela.rabulea@oss.nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <a0f7d919-46bb-5c5d-1fef-39a90e9969ea@xs4all.nl>
Date:   Thu, 11 Mar 2021 12:01:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311002854.13687-8-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCd+BzbXB9V38+V/GrmFz757XXp4BJdTgMi/vynIWutrFjdRyQD+1VFn0h4EVeAzSfKMx0HHIBPGIQrI+Kxp/CbARX5tNp0TeVyVQ7HEb5fZY+Z5DSkG
 VrvS1H6Oc0P54TNl5benkg75MzZ/iIhbQbBtcpVjVS8ZSSl0rzqh3nVbSQ8uvu9nzsHd132TLkn/8XP9skghuL+f237T5ifliK7NZ9jsp07PdY1f0t37mEvy
 4l0NeGpz7MBsca8KdNzIIXsO3rOMHT7295ChsqVoD0sURHZ31l7JBRK+m15v53eDt3Krhk0dlFSuv2MLSJzy8wiXCQamAZqomTfp9e5TI9U7Z/r2S4osYjRV
 kT3XS9j7RZDnZsOM+emeorF4TT338TQ86FdVdDnG/dn6zsG0tTQIRWCaVPYYz36WNpMfHfcLfFH3qt3M0uqg2T3RWVvvVdeC70jH9jwZ7CDEvJ7ykDqL7D5A
 YIRkrsF9fXxuwy+TzXwXTDnJCLcE98jhIA8USVWw6mcUgjSPwGziTKiDJcMRrJgwOr+AnE8yQDqzELKMesxWOSqwZhOWm7WoycaYMoFTJcctwx0oUjdW2FIb
 Mx/epztYpTsv7f4YugzdfRXaUWuBv4HpdfMC2qPt2KFvBBA9n7Pu7BylF+UZ+7cNk7tImEWwBCTg4H+DfHYcnxQSjkPERxrCvf/8Oc4NiVzY/aisbR/HKcwY
 s2z3pPfI3JPTbDx3yC+qtPo72aA3VtDPCQGDVjhQctjWbBXNmcJHOYtPHAb67umtggN7zsD4AF0ySveSXSTA0459S7eEus5+GLH5xYuIsA+MUEIgBT/5/F+c
 SaEzaBACJ803/uYaIONn+MqG3aWNB0dCWKGG2p/C9FTHt+G16gMbTCEH581dykSyS8656Zxe9QvuWrBvcN58HXdcP1tRaEjqbEa8ZTjJvc+zSx3BwNIvSqZ2
 +KFFog==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mirela,

On 11/03/2021 01:28, Mirela Rabulea (OSS) wrote:
> From: Mirela Rabulea <mirela.rabulea@nxp.com>
> 
> Add jpeg decoder/encoder nodes, for now on imx8qxp only.
> The same should work on imx8qm, but it was not tested.

FYI: I've posted a pull request for this driver, and once it is merged
in our media tree this patch can be merged for 5.13 by whoever handles
these dts patches.

Thank you for all your work on this!

Regards,

	Hans

> 
> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 1d522de7b017..4f2b3edd7850 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -629,4 +629,39 @@
>  			};
>  		};
>  	};
> +
> +	img_subsys: bus@58000000 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x58000000 0x0 0x58000000 0x1000000>;
> +
> +		jpegdec: jpegdec@58400000 {
> +			compatible = "nxp,imx8qxp-jpgdec";
> +			reg = <0x58400000 0x00050000 >;
> +			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&pd IMX_SC_R_MJPEG_DEC_MP>,
> +					<&pd IMX_SC_R_MJPEG_DEC_S0>,
> +					<&pd IMX_SC_R_MJPEG_DEC_S1>,
> +					<&pd IMX_SC_R_MJPEG_DEC_S2>,
> +					<&pd IMX_SC_R_MJPEG_DEC_S3>;
> +		};
> +
> +		jpegenc: jpegenc@58450000 {
> +			compatible = "nxp,imx8qxp-jpgenc";
> +			reg = <0x58450000 0x00050000 >;
> +			interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&pd IMX_SC_R_MJPEG_ENC_MP>,
> +					<&pd IMX_SC_R_MJPEG_ENC_S0>,
> +					<&pd IMX_SC_R_MJPEG_ENC_S1>,
> +					<&pd IMX_SC_R_MJPEG_ENC_S2>,
> +					<&pd IMX_SC_R_MJPEG_ENC_S3>;
> +		};
> +	};
>  };
> 

