Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B30D0327ADB
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 10:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233907AbhCAJeC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 04:34:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233583AbhCAJeB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 04:34:01 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A2BC06174A;
        Mon,  1 Mar 2021 01:33:21 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id v15so15350760wrx.4;
        Mon, 01 Mar 2021 01:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f8ls8FrEzupGcztMPHQqtmAD5Dc6MGdA2sdReBfFtxU=;
        b=HP/QF+wQ5I3XO4MXr6a04Awn7edvplSnAqpAl1loN7f6jrQOehkfTJK/hRV/DdR4Xv
         p4XqQLgTc8w3kE7R0RVDZYpHw48UHJ6lUi4RfA+12APVWANE/PfIqG63Cjzpzl6mE0O8
         oHaeyTelxiOWYSNhZuamqH/uJ3PVBfBUoeEI4SiBec2BbZVTdhlH3p+AeKLRIyW9O+KX
         zWAH+P2bQoVTf3UwFSQGv2x5Y5xh1kZ6J6VohJRwbKIzy/u5YL3in/+BR1CagSXU2F5U
         gK07sQ1Oe2DM3zggiqO1BZWLQ1XVOeIV0/S6X4s/KGSoUOHhn/DxalCmzREwv3YA1MyE
         5y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f8ls8FrEzupGcztMPHQqtmAD5Dc6MGdA2sdReBfFtxU=;
        b=GanX0NOpvd6QxhCpOIKH48EzgylXLbfbL0QghDCK3V/gqYYjQcQp77++bWh9n/jdP1
         yjkFlqpMMauqd4jWAdr4gOVA+V/jOwvXYzgQWfDxJbl00qHjXNt7hskefdyXmjIBS/4l
         1gckyGwbNEVeJtZGKuvSo/+DkFUGOpIPIrhbEXIJZauV+QONQfgndF10q7J4JpKHvifj
         1plHhB39zEIHHC8O3eqo+KwyAOSIJYsY77+f6tQXfpekx24B3L933VzLF0mmMJXHRFzS
         vyanSRs5cwJldJgNvN9DWk130iLei0DC1gpMtcgKiiYoiO9pi6ZuFbhyTu5QvDqn9H2I
         Gp1g==
X-Gm-Message-State: AOAM533OtidwC8IkH5LZiq3VENaQDSAuhnMEgqT+ALmSqUEX2QRmTKv9
        zZrreFsSBjfTuqU3M/3Ofxc=
X-Google-Smtp-Source: ABdhPJw+/YqH9CNZ1WcHejwyVQ7EHRPH6u57hTlGAOK3zyRtLWZS6crnOV0WUD238RwnFQ1lCulXKw==
X-Received: by 2002:a05:6000:1ca:: with SMTP id t10mr15760881wrx.45.1614591200024;
        Mon, 01 Mar 2021 01:33:20 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id b15sm24187809wrr.47.2021.03.01.01.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 01:33:19 -0800 (PST)
Date:   Mon, 1 Mar 2021 09:33:17 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 60/77] dt-bindings: media: nxp,imx7-mipi-csi2: Indent
 example with 4 spaces
Message-ID: <20210301093317.e4s536d2v3dmooi4@arch-thunder.localdomain>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
 <20210215042741.28850-61-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215042741.28850-61-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
Thanks.

On Mon, Feb 15, 2021 at 06:27:24AM +0200, Laurent Pinchart wrote:
> DT bindings examples are customarily indented with 4 spaces.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui
> ---
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 54 +++++++++----------
>  1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> index 74ff92b5baa3..76fcc8d80ee3 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> @@ -122,41 +122,41 @@ examples:
>      #include <dt-bindings/reset/imx7-reset.h>
>  
>      mipi_csi: mipi-csi@30750000 {
> -            compatible = "fsl,imx7-mipi-csi2";
> -            reg = <0x30750000 0x10000>;
> -            interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +        compatible = "fsl,imx7-mipi-csi2";
> +        reg = <0x30750000 0x10000>;
> +        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>  
> -            clocks = <&clks IMX7D_IPG_ROOT_CLK>,
> -                     <&clks IMX7D_MIPI_CSI_ROOT_CLK>,
> -                     <&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
> -            clock-names = "pclk", "wrap", "phy";
> -            clock-frequency = <166000000>;
> +        clocks = <&clks IMX7D_IPG_ROOT_CLK>,
> +                 <&clks IMX7D_MIPI_CSI_ROOT_CLK>,
> +                 <&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
> +        clock-names = "pclk", "wrap", "phy";
> +        clock-frequency = <166000000>;
>  
> -            power-domains = <&pgc_mipi_phy>;
> -            phy-supply = <&reg_1p0d>;
> -            resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
> +        power-domains = <&pgc_mipi_phy>;
> +        phy-supply = <&reg_1p0d>;
> +        resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
>  
> -            ports {
> -                    #address-cells = <1>;
> -                    #size-cells = <0>;
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
>  
> -                    port@0 {
> -                            reg = <0>;
> +            port@0 {
> +                reg = <0>;
>  
> -                            mipi_from_sensor: endpoint {
> -                                    remote-endpoint = <&ov2680_to_mipi>;
> -                                    data-lanes = <1>;
> -                            };
> -                    };
> +                mipi_from_sensor: endpoint {
> +                    remote-endpoint = <&ov2680_to_mipi>;
> +                    data-lanes = <1>;
> +                };
> +            };
>  
> -                    port@1 {
> -                            reg = <1>;
> +            port@1 {
> +                reg = <1>;
>  
> -                            mipi_vc0_to_csi_mux: endpoint {
> -                                    remote-endpoint = <&csi_mux_from_mipi_vc0>;
> -                            };
> -                    };
> +                mipi_vc0_to_csi_mux: endpoint {
> +                    remote-endpoint = <&csi_mux_from_mipi_vc0>;
> +                };
>              };
> +        };
>      };
>  
>  ...
> -- 
> Regards,
> 
> Laurent Pinchart
> 
