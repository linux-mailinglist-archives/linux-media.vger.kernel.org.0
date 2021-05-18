Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65CE9387783
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 13:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233705AbhERL2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 07:28:22 -0400
Received: from comms.puri.sm ([159.203.221.185]:58644 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233632AbhERL2U (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 07:28:20 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 10C96E0DCA;
        Tue, 18 May 2021 04:26:32 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Zs4ZMaLfVfwn; Tue, 18 May 2021 04:26:27 -0700 (PDT)
Message-ID: <bbe18b43336f73a5c3809b933e07270ef0a45134.camel@puri.sm>
Subject: Re: [RFC PATCH 1/3] dt-bindings: media: nxp,imx7-csi: Add i.MX8MM
 support
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Date:   Tue, 18 May 2021 13:26:21 +0200
In-Reply-To: <20210516024216.4576-2-laurent.pinchart@ideasonboard.com>
References: <20210516024216.4576-1-laurent.pinchart@ideasonboard.com>
         <20210516024216.4576-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Sonntag, dem 16.05.2021 um 05:42 +0300 schrieb Laurent Pinchart:
> The i.MX8MM integrates a CSI bridge IP core, as the i.MX7. There
> seems
> to be no difference between the two SoCs according to the reference
> manual, but as documentation may not be accurate, add a compatible
> string for the i.MX8MM, with a fallback on the compatible i.MX7.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/nxp,imx7-csi.yaml      | 12 ++++++++--
> --
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-
> csi.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> index d91575b8ebb9..5922a2795167 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/media/nxp,imx7-csi.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: i.MX7 CMOS Sensor Interface
> +title: i.MX7 and i.MX8 CSI bridge (CMOS Sensor Interface)
>  
>  maintainers:
>    - Rui Miguel Silva <rmfrfs@gmail.com>
> @@ -15,9 +15,13 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx7-csi
> -      - fsl,imx6ul-csi
> +    oneOf:
> +      - enum:
> +          - fsl,imx7-csi
> +          - fsl,imx6ul-csi
> +      - items:
> +          - const: fsl,imx8mm-csi
> +          - const: fsl,imx7-csi
>  
>    reg:
>      maxItems: 1

isn't the fsl,imx8mm-csi compatible missing in the driver then?

thanks!
                     martin

