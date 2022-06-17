Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24767550070
	for <lists+linux-media@lfdr.de>; Sat, 18 Jun 2022 01:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237493AbiFQXNz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 19:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382627AbiFQXNq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 19:13:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E40953E1A
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 16:13:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CE0A383;
        Sat, 18 Jun 2022 01:13:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655507622;
        bh=BEv2PbaEUPQo9bvkksfi8QV6k0alhwbvIm6SPMBY9XU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hrhUXljWBHXsXG7zbfP4livkIWbll3y7WBIwqeCikQUtx/PmmeUzMbvxnD3pNffKc
         Hl01NNXOsUxmkyLfn3zLexMVrfz1gkVlb5QmUasZg16OZRkXF1iF6w5Wv139ig8SD/
         JeoBE33L/R4k+Ai9MiZqyPOcepEC4IgmCPG6ydWo=
Date:   Sat, 18 Jun 2022 02:13:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 43/55] dt-bindings: media: rkisp1: Add port for parallel
 interface
Message-ID: <Yq0Kmu/tL8imjlZr@pendragon.ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-44-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-44-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Thank you for the patch.

On Wed, Jun 15, 2022 at 04:11:15AM +0900, Paul Elder wrote:
> The rkisp1 can take an input on the parallel interface. Add a port for
> it, and update the required field. At least one port is required, and
> both may be specified.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../bindings/media/rockchip-isp1.yaml         | 23 +++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> index d1489b177331..b3661d7d4357 100644
> --- a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> @@ -84,8 +84,27 @@ properties:
>                  minItems: 1
>                  maxItems: 4
>  
> -    required:
> -      - port@0
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: connection point for input on the parallel interface
> +
> +        properties:
> +          bus-type:
> +            enum: [5, 6]
> +
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +        required:
> +          - bus-type
> +
> +    anyOf:
> +      - required:
> +          - port@0
> +      - required:
> +          - port@1
>  
>  required:
>    - compatible

-- 
Regards,

Laurent Pinchart
