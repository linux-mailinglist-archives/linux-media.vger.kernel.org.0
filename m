Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA3A467C47
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 18:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353365AbhLCRNu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 12:13:50 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56506 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353315AbhLCRNq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Dec 2021 12:13:46 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E961C464;
        Fri,  3 Dec 2021 18:10:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638551420;
        bh=of1HonB+RUBYnO8crZw5HycJMNojQCkLvOO0WnnwtP0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wjf8k9ALQ1YOFREU7TJHyZ1QYwSnVFKsgfdYY7dn9oAhrUlcOt7ZCLSzlKun/Kf7R
         C2+jGRwKj7NRL0B/0icjlilo3tUoe4tgeeX2VD07uE3Y73mUJ568dfl9RA3xUuBgN4
         Iil2hFqzoHip5dM9LsudVae23OC9d0mcrnJrFVm4=
Date:   Fri, 3 Dec 2021 19:09:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: media: nxp,imx7-mipi-csi2: Drop bad
 if/then schema
Message-ID: <YapPYZieGxxNr/da@pendragon.ideasonboard.com>
References: <20211203164828.187642-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211203164828.187642-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Thank you for the patch.

On Fri, Dec 03, 2021 at 10:48:28AM -0600, Rob Herring wrote:
> The if/then schema for 'data-lanes' doesn't work as 'compatible' is at a
> different level than 'data-lanes'. To make it work, the if/then schema
> would have to be moved to the top level and then whole hierarchy of
> nodes down to 'data-lanes' created. I don't think it is worth the
> complexity to do that, so let's just drop it.
> 
> The error in this schema is masked by a fixup in the tools causing the
> 'allOf' to get overwritten. Removing the fixup as part of moving to
> json-schema draft 2019-09 revealed the issue:
> 
> Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.example.dt.yaml: mipi-csi@30750000: ports:port@0:endpoint:data-lanes:0: [1] is too short
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.example.dt.yaml: mipi-csi@32e30000: ports:port@0:endpoint:data-lanes:0: [1, 2, 3, 4] is too long
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> 
> The if condition was always true because 'compatible' did not exist in
> 'endpoint' node and a non-existent property is true for json-schema.
> 
> Fixes: 85b62ff2cb97 ("media: dt-bindings: media: nxp,imx7-mipi-csi2: Add i.MX8MM support")
> Cc: Rui Miguel Silva <rmfrfs@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v2:
>  - Add note that imx7 only supports 2 lanes
> ---
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml         | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> index 877183cf4278..1ef849dc74d7 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> @@ -79,6 +79,8 @@ properties:
>  
>              properties:
>                data-lanes:
> +                description:
> +                  Note that 'fsl,imx7-mipi-csi2' only supports up to 2 data lines.
>                  items:
>                    minItems: 1
>                    maxItems: 4
> @@ -91,18 +93,6 @@ properties:
>              required:
>                - data-lanes
>  
> -            allOf:
> -              - if:
> -                  properties:
> -                    compatible:
> -                      contains:
> -                        const: fsl,imx7-mipi-csi2
> -                then:
> -                  properties:
> -                    data-lanes:
> -                      items:
> -                        maxItems: 2
> -
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
>          description:

-- 
Regards,

Laurent Pinchart
