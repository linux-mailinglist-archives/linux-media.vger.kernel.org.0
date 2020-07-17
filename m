Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B77122444B
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 21:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbgGQTfT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 15:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727999AbgGQTfT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 15:35:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40EB0C0619D2;
        Fri, 17 Jul 2020 12:35:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4A2971D;
        Fri, 17 Jul 2020 21:35:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595014517;
        bh=sNhGPc3xQuBFysuH7SMI1uMpqbxHDIN6W0Sor1W4IlE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lb+bHSCuaE1sPU8nsA6kHrQZOuy7wXCAX0oo1V5VN1QsMKVlC8WbZe1iABSFb+uWU
         P+SZ8NfjhWDSE+Har7h91s4t2g8S3er42LDaqhHiuyWNQdENC4izWwcQo7KrBHCIXo
         0/ZwLBXJVeKe+o/ZxfyrbESrnRH+2+FCNvtE+KCg=
Date:   Fri, 17 Jul 2020 22:35:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        slongerbeam@gmail.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [PATCH 02/13] arm64: dts: qcom: apq8016-sbc: Fix CSI-2 lanes
 routing
Message-ID: <20200717193509.GD5961@pendragon.ideasonboard.com>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-3-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Jul 17, 2020 at 03:28:48PM +0200, Jacopo Mondi wrote:
> The ov5640 sensor does not support lanes reconfiguration according
> to version of the datasheet I have (version 2.03) and the driver
> does not parse the properties to try to reconfigure them.
> 
> Fix the properties values in the camera and cci node.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
> Loic, I see you added the camera nodes in
> 39e0ce6cd1bf ("arm64: dts: qcom: apq8016-sbc: Add CCI/Sensor nodes")
> 
> Do you have any idea how lanes could be swapped if, from my understanding,
> nor the sensor nor the driver supports that ?

It's not supported on the OV5640 side, so I think the second hunk of
this patch is correct, but I believe that the CAMSS supports lane
reordering, so the first hunk is likely incorrect and should be dropped.

> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index 8a4b790aa7ff..fe6613676e45 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -591,8 +591,8 @@ ports {
>  		port@0 {
>  			reg = <0>;
>  			csiphy0_ep: endpoint {
> -				clock-lanes = <1>;
> -				data-lanes = <0 2>;
> +				clock-lanes = <0>;
> +				data-lanes = <1 2>;
>  				remote-endpoint = <&ov5640_ep>;
>  				status = "okay";
>  			};
> @@ -627,8 +627,8 @@ camera_rear@3b {
> 
>  		port {
>  			ov5640_ep: endpoint {
> -				clock-lanes = <1>;
> -				data-lanes = <0 2>;
> +				clock-lanes = <0>;
> +				data-lanes = <1 2>;
>  				remote-endpoint = <&csiphy0_ep>;
>  			};
>  		};

-- 
Regards,

Laurent Pinchart
