Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20C3173DB54
	for <lists+linux-media@lfdr.de>; Mon, 26 Jun 2023 11:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjFZJ1C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jun 2023 05:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjFZJ0l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jun 2023 05:26:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3513A8B;
        Mon, 26 Jun 2023 02:23:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (unknown [193.85.242.110])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F190A38;
        Mon, 26 Jun 2023 11:22:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687771333;
        bh=fFBzS1WNKzHcdSSrSKaGU02/R7k5gsit2e9loeN71+Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OLj6+c8EtMERIGSY7U9NIGIIWS56s41hZwcWvkDS+rP5kEdhdSWqNxfLVP0UyCKkK
         5er8lct0b6pqBwtKcTfj3IHb4DxpSxWbdaB+PGYC0wXy8w/WWt93q3r0r6gE7vDWAI
         3BR9NXsElwsCpgZ5RNoTekrLvTg1y2blWlmPWPvM=
Date:   Mon, 26 Jun 2023 12:22:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     guoniu.zhou@oss.nxp.com
Cc:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        xavier.roumegue@oss.nxp.com, kernel@pengutronix.de,
        jacopo.mondi@ideasonboard.com, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2 1/2] media: dt-bindings: nxp,imx8-isi: add i.MX93 ISI
 compatible string
Message-ID: <20230626092250.GA6907@pendragon.ideasonboard.com>
References: <20230626032735.49500-1-guoniu.zhou@oss.nxp.com>
 <20230626032735.49500-2-guoniu.zhou@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230626032735.49500-2-guoniu.zhou@oss.nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Guoniu,

Thank you for the patch.

On Mon, Jun 26, 2023 at 11:27:34AM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Add the compatible string support for i.MX93 ISI.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> index 6038b9b5ab36..e4665469a86c 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
> @@ -21,6 +21,7 @@ properties:
>      enum:
>        - fsl,imx8mn-isi
>        - fsl,imx8mp-isi
> +      - fsl,imx93-isi
>  
>    reg:
>      maxItems: 1
> @@ -72,7 +73,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: fsl,imx8mn-isi
> +            enum:
> +              - fsl,imx8mn-isi
> +              - fsl,imx93-isi
>      then:
>        properties:
>          interrupts:

-- 
Regards,

Laurent Pinchart
