Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4302EFCD1
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 02:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbhAIBpy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 20:45:54 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45980 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbhAIBpx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 20:45:53 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F03C5DA;
        Sat,  9 Jan 2021 02:45:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610156709;
        bh=iN8/pxPSqsADmJ+CskC5HxBuSlOkfsnvbQDlV+E8fQ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XBU55b+3hEC0bfdAuCNmSAqwyzk/lGpRMkapp4itJ/YrTHrnNRBm4KVuG82+fMe5M
         VH0V5B1c4yFL/Z8ZcoJNMw38jIh6utTcIlw20u+SsvMM8eeaJcC+JFDHDnFdzrKClb
         +pYrlyRXGl73g1Wd3ZZs2Zt3YXtNNZRwfN8D10jQ=
Date:   Sat, 9 Jan 2021 03:44:56 +0200
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
Subject: Re: [PATCH v1 12/17] media: dt-bindings: media: qcom,camss: Add
 bindings for SDM845 camss
Message-ID: <X/kKmCUuMTsNl/1n@pendragon.ideasonboard.com>
References: <20210108120429.895046-1-robert.foss@linaro.org>
 <20210108120429.895046-13-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210108120429.895046-13-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Thank you for the patch.

On Fri, Jan 08, 2021 at 01:04:24PM +0100, Robert Foss wrote:
> Add bindings for qcom,sdm845-camss in order to support the camera
> subsystem on SDM845.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  .../devicetree/bindings/media/qcom,camss.txt  | 51 +++++++++++++++----
>  1 file changed, 40 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,camss.txt b/Documentation/devicetree/bindings/media/qcom,camss.txt
> index 498234629e21..276c5d0c25cb 100644
> --- a/Documentation/devicetree/bindings/media/qcom,camss.txt
> +++ b/Documentation/devicetree/bindings/media/qcom,camss.txt
> @@ -9,6 +9,7 @@ Qualcomm Camera Subsystem
>  		- "qcom,msm8916-camss"
>  		- "qcom,msm8996-camss"
>  		- "qcom,sdm660-camss"
> +		- "qcom,sdm845-camss"
>  - reg:
>  	Usage: required
>  	Value type: <prop-encoded-array>
> @@ -18,19 +19,21 @@ Qualcomm Camera Subsystem
>  	Value type: <stringlist>
>  	Definition: Should contain the following entries:
>  		- "csiphy0"
> -		- "csiphy0_clk_mux"
> +		- "csiphy0_clk_mux"	(not 845)
>  		- "csiphy1"
> -		- "csiphy1_clk_mux"
> -		- "csiphy2"		(8996 only)
> +		- "csiphy1_clk_mux"	(not 845)
> +		- "csiphy2"		(8996 & 845)
>  		- "csiphy2_clk_mux"	(8996 only)
> +		- "csiphy3"		(845 only)
>  		- "csid0"
>  		- "csid1"
> -		- "csid2"		(8996 only)
> -		- "csid3"		(8996 only)
> +		- "csid2"		(8996 & 845)
> +		- "csid3"		(8996 & 845)
>  		- "ispif"
> -		- "csi_clk_mux"
> +		- "csi_clk_mux"		(not 845)
>  		- "vfe0"
> -		- "vfe1"		(8996 only)
> +		- "vfe1"		(8996 & 845)
> +		- "vfe_lite"		(845 only)

All this would be more readable after a conversion to YAML ;-)

>  - interrupts:
>  	Usage: required
>  	Value type: <prop-encoded-array>
> @@ -41,14 +44,16 @@ Qualcomm Camera Subsystem
>  	Definition: Should contain the following entries:
>  		- "csiphy0"
>  		- "csiphy1"
> -		- "csiphy2"		(8996 only)
> +		- "csiphy2"		(8996 & 845)
> +		- "csiphy3"		(845 only)
>  		- "csid0"
>  		- "csid1"
> -		- "csid2"		(8996 only)
> +		- "csid2"		(8996 & 845)
>  		- "csid3"		(8996 only)
>  		- "ispif"
>  		- "vfe0"
> -		- "vfe1"		(8996 only)
> +		- "vfe1"		(8996 & 845)
> +		- "vfe_lite"		(845 only)
>  - power-domains:
>  	Usage: required
>  	Value type: <prop-encoded-array>
> @@ -67,27 +72,40 @@ Qualcomm Camera Subsystem
>  		- "top_ahb"
>  		- "throttle_axi"	(660 only)
>  		- "ispif_ahb"
> +		- "camnoc_axi"		(845 only)
> +		- "cpas_ahb"		(845 only)
> +		- "cphy_rx_src"		(856 only)
>  		- "csiphy0_timer"
> +		- "csiphy0"		(845 only)
> +		- "csiphy0_timer_src"	(845 only)
>  		- "csiphy1_timer"
> -		- "csiphy2_timer"	(8996 only)
> +		- "csiphy2"		(845 only)
> +		- "csiphy2_timer_src"	(845 only)
> +		- "csiphy2_timer"	(8996 & 845)
> +		- "csiphy3"		(845 only)
> +		- "csiphy3_timer_src"	(845 only)
> +		- "csiphy3_timer"	(845 only)
>  		- "csiphy_ahb2crif"	(660 only)
>  		- "csi0_ahb"
>  		- "csi0"
>  		- "csi0_phy"
>  		- "csi0_pix"
>  		- "csi0_rdi"
> +		- "csi0_src"		(845 only)
>  		- "cphy_csid0"		(660 only)
>  		- "csi1_ahb"
>  		- "csi1"
>  		- "csi1_phy"
>  		- "csi1_pix"
>  		- "csi1_rdi"
> +		- "csi1_src"		(845 only)
>  		- "cphy_csid1"		(660 only)
>  		- "csi2_ahb"		(8996 only)
>  		- "csi2"		(8996 only)
>  		- "csi2_phy"		(8996 only)
>  		- "csi2_pix"		(8996 only)
>  		- "csi2_rdi"		(8996 only)
> +		- "csi2_src"		(845 only)
>  		- "cphy_csid2"		(660 only)
>  		- "csi3_ahb"		(8996 only)
>  		- "csi3"		(8996 only)
> @@ -96,14 +114,25 @@ Qualcomm Camera Subsystem
>  		- "csi3_rdi"		(8996 only)
>  		- "cphy_csid3"		(660 only)
>  		- "ahb"
> +		- "slow_ahb_src"	(845 only)
> +		- "soc_ahb"		(845 only)
>  		- "vfe0"
>  		- "csi_vfe0"
>  		- "vfe0_ahb",		(8996 only)
> +		- "vfe0_cphy_rx"	(845 only)
> +		- "vfe0_axi",		(845 only)
> +		- "vfe0_src",		(845 only)
>  		- "vfe0_stream",	(8996 only)
>  		- "vfe1",		(8996 only)
>  		- "csi_vfe1",		(8996 only)
>  		- "vfe1_ahb",		(8996 only)
> +		- "vfe1_cphy_rx"	(845 only)
> +		- "vfe1_axi",		(845 only)
> +		- "vfe1_src",		(845 only)
>  		- "vfe1_stream",	(8996 only)
> +		- "vfe_lite_axi",	(845 only)
> +		- "vfe_lite_cphy_rx"	(845 only)
> +		- "vfe_lite_src",	(845 only)
>  		- "vfe_ahb"
>  		- "vfe_axi"
>  - vdda-supply:

-- 
Regards,

Laurent Pinchart
