Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 140D9466B63
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 22:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356216AbhLBVJr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 16:09:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbhLBVJr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 16:09:47 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C180C06174A;
        Thu,  2 Dec 2021 13:06:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FC13B7E;
        Thu,  2 Dec 2021 22:06:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638479182;
        bh=cr2+1aUzMRcr+usXrhScPZhP8Cuzog5w5NYR8yzGzpI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X3+DkU9waDIMbc3i57RVulLT3bsFf+XDlYXhnfHiiZmHBZSw5sXnJvXb3QGuRjBHt
         cronS+4Wn3PhBMk/NPrMIlu5ZkJDb1K0PVm2v8jU2nrtztk3T5LL83ryygN1/7RbLf
         Lio+GuK2cU1Jud7h5zBT+8JJISUrGtwl6trKuD/Y=
Date:   Thu, 2 Dec 2021 23:05:56 +0200
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
Subject: Re: [PATCH] dt-bindings: media: nxp,imx7-mipi-csi2: Drop bad if/then
 schema
Message-ID: <Yak1NLz2/X3TfeUM@pendragon.ideasonboard.com>
References: <20211202023021.3655384-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211202023021.3655384-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Thank you for the patch.

On Wed, Dec 01, 2021 at 08:30:21PM -0600, Rob Herring wrote:
> The if/then schema for 'data-lanes' doesn't work as 'compatible' is at a
> different level than 'data-lanes'. To make it work, the if/then schema
> would have to be moved to the top level and then whole hierarchy of
> nodes down to 'data-lanes' created. I don't think it is worth the
> complexity to do that, so let's just drop it.

Fair enough, but then shouldn't there be a comment in the data-lanes
property to tell that i.MX7 only supports up to 2 data lanes ?

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
> ---
>  .../bindings/media/nxp,imx7-mipi-csi2.yaml           | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> index 877183cf4278..cb8d2afe52f7 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> @@ -91,18 +91,6 @@ properties:
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
