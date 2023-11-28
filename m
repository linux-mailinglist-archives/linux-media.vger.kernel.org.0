Return-Path: <linux-media+bounces-1179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A33277FAEC8
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 01:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE8ACB21289
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 00:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B179653;
	Tue, 28 Nov 2023 00:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tbzAo/NX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F353187;
	Mon, 27 Nov 2023 16:00:28 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E83929B;
	Tue, 28 Nov 2023 00:59:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701129592;
	bh=IKIKn1bUGijdwAjyavYNgOwvhJdjwiGclFWRMyQmsto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tbzAo/NX0zBBOR7iTqJcrzeDaRjTFCRLlxMQEAA3ZNePxfThrvMCYHxHk3mhghDZ8
	 ZYmmzXlMzOxCynFgjN0YTx5GrVB792NyUGd6Yhix3pCm/SgWJExQOjpWiG67/u9kIP
	 Q6XWhM+LK6wgpXiq8NXzK5+3qgrSR58rD9Q1x6lg=
Date: Tue, 28 Nov 2023 02:00:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: sakari.ailus@linux.intel.com, rfoss@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	mchehab@kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 2/2] media: dt-bindings: Use bus-types definitions from
 video-interfaces.h
Message-ID: <20231128000033.GD25590@pendragon.ideasonboard.com>
References: <20231126125320.4024456-1-festevam@gmail.com>
 <20231126125320.4024456-2-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231126125320.4024456-2-festevam@gmail.com>

Hi Fabio,

Thank you for the patch.

On Sun, Nov 26, 2023 at 09:53:20AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> To improve readability, replace hardcoding numerical constants with the
> corresponding definitions from video-interfaces.h.
> 
> Based on commit c4cfd47eb4ac ("media: dt-bindings: Use new video interface
> bus type macros in examples").
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml  | 3 ++-
>  .../devicetree/bindings/media/i2c/toshiba,tc358746.yaml       | 3 ++-
>  Documentation/devicetree/bindings/media/microchip,csi2dc.yaml | 4 +++-
>  .../devicetree/bindings/media/starfive,jh7110-camss.yaml      | 4 +++-
>  .../devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml       | 3 ++-
>  5 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index a1ed1004651b..e18cc0e8a520 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -132,6 +132,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interfaces.h>
>  
>      i2c {
>          #address-cells = <1>;
> @@ -157,7 +158,7 @@ examples:
>                      reg = <0>;
>                      anx7625_in: endpoint {
>                          remote-endpoint = <&mipi_dsi>;
> -                        bus-type = <7>;

7 seems to have been a mistake, as this is a DSI endpoint, not a DPI
endpoint.

> +                        bus-type = <MEDIA_BUS_TYPE_DPI>;
>                          data-lanes = <0 1 2 3>;
>                      };
>                  };
> diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
> index 1c476b635b69..9e1874946017 100644
> --- a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.yaml
> @@ -129,6 +129,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interfaces.h>
>  
>      i2c {
>        #address-cells = <1>;
> @@ -161,7 +162,7 @@ examples:
>                remote-endpoint = <&sensor_out>;
>                hsync-active = <0>;
>                vsync-active = <0>;
> -              bus-type = <5>;
> +              bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
>              };
>            };
>  
> diff --git a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> index b3a345fc6464..2e694479d82d 100644
> --- a/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> +++ b/Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
> @@ -142,6 +142,8 @@ examples:
>    # Example for connecting to a parallel sensor controller block (video pipe)
>    # and the input is received from Synopsys IDI interface
>    - |
> +    #include <dt-bindings/media/video-interfaces.h>
> +
>      csi2dc@e1404000 {
>          compatible = "microchip,sama7g5-csi2dc";
>          reg = <0xe1404000 0x500>;
> @@ -154,7 +156,7 @@ examples:
>                 port@0 {
>                         reg = <0>; /* must be 0, first child port */
>                         csi2dc_in: endpoint { /* input from IDI interface */
> -                               bus-type = <4>; /* MIPI CSI2 D-PHY */
> +                               bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>                                 remote-endpoint = <&csi2host_out>;
>                         };
>                 };
> diff --git a/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml b/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
> index c66586d90fa2..4964e59c3ae3 100644
> --- a/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
> @@ -120,6 +120,8 @@ additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/media/video-interfaces.h>
> +
>      isp@19840000 {
>          compatible = "starfive,jh7110-camss";
>          reg = <0x19840000 0x10000>,
> @@ -161,7 +163,7 @@ examples:
>                  reg = <0>;
>                  vin_from_sc2235: endpoint {
>                      remote-endpoint = <&sc2235_to_vin>;
> -                    bus-type = <5>;
> +                    bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
>                      bus-width = <8>;
>                      data-shift = <2>;
>                      hsync-active = <1>;
> diff --git a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
> index f762fdc05e4d..5fdb9ae758e3 100644
> --- a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
> +++ b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
> @@ -58,6 +58,7 @@ additionalProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/media/video-interfaces.h>
>      #include <dt-bindings/soc/ti,sci_pm_domain.h>
>  
>      ti_csi2rx0: ticsi2rx@4500000 {
> @@ -90,7 +91,7 @@ examples:
>  
>                      csi2rx0_in_sensor: endpoint {
>                          remote-endpoint = <&csi2_cam0>;
> -                        bus-type = <4>; /* CSI2 DPHY. */
> +                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>                          clock-lanes = <0>;
>                          data-lanes = <1 2>;
>                      };

-- 
Regards,

Laurent Pinchart

