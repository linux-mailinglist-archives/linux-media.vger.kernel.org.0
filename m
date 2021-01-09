Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA1CB2EFCD4
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 02:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbhAIBs2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 20:48:28 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46040 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbhAIBs2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 20:48:28 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91E4A878;
        Sat,  9 Jan 2021 02:47:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610156865;
        bh=95zOMPXu02VDLC3VMMhJ0HQxsSOz+U9XLN+9JPdGx+0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aV+3dPprm9lrkuuSjHbqky0xjg60b6D+am2+DcSjoOU2ZRpqNOGNelorW7HI0hS2s
         Gb6bLHnY7jgPxGuid5Qw8VPPqZQPW4ElipQVnAyIFnBg2vpAQf7ZgPzFSHQ89aodiD
         +2pWpkdxQKXLxNvAEFdnBKp7l+V35zrpgIx0B1Fw=
Date:   Sat, 9 Jan 2021 03:47:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org, catalin.marinas@arm.com,
        will@kernel.org, shawnguo@kernel.org, leoyang.li@nxp.com,
        geert+renesas@glider.be, arnd@arndb.de, Anson.Huang@nxp.com,
        michael@walle.cc, agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>
Subject: Re: [PATCH v1 16/17] arm64: dts: sdm845-db845c: Add CAMSS ISP node
Message-ID: <X/kLNCOjvTmANYbr@pendragon.ideasonboard.com>
References: <20210108120429.895046-1-robert.foss@linaro.org>
 <20210108120429.895046-17-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210108120429.895046-17-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Thank you for the patch.

The subject line doesn't match the patch.

On Fri, Jan 08, 2021 at 01:04:28PM +0100, Robert Foss wrote:
> Add regulators and camss DT node.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index a943b3f353ce..7bad0515345e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -294,6 +294,9 @@ vreg_s7a_1p025: smps7 {
>  			regulator-max-microvolt = <1028000>;
>  		};
>  
> +		vdda_mipi_csi0_0p9:
> +		vdda_mipi_csi1_0p9:
> +		vdda_mipi_csi2_0p9:

No need for new labels, you can simply use vreg_l1a_0p875 below.

>  		vreg_l1a_0p875: ldo1 {
>  			regulator-min-microvolt = <880000>;
>  			regulator-max-microvolt = <880000>;
> @@ -1106,6 +1109,15 @@ &cci {
>  	status = "okay";
>  };
>  
> +&camss {
> +	vdda-csi0-supply = <&vdda_mipi_csi0_0p9>;
> +	vdda-csi1-supply = <&vdda_mipi_csi1_0p9>;
> +	vdda-csi2-supply = <&vdda_mipi_csi2_0p9>;
> +
> +	status = "disabled";

This isn't needed.

> +

Extra blank line.

> +};
> +
>  &cci_i2c0 {
>  	camera@10 {
>  		compatible = "ovti,ov8856";

-- 
Regards,

Laurent Pinchart
