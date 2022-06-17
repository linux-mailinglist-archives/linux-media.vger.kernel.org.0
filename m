Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B553C550078
	for <lists+linux-media@lfdr.de>; Sat, 18 Jun 2022 01:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383368AbiFQXPq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jun 2022 19:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383305AbiFQXPW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jun 2022 19:15:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39E364D34
        for <linux-media@vger.kernel.org>; Fri, 17 Jun 2022 16:15:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44190383;
        Sat, 18 Jun 2022 01:15:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655507705;
        bh=2n3ALDFlvoHMdw9w95WQCuY0GmjWJ6auY7Iv7AAuQYU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P6KxT538bjwQOtilo7gmsunKTH0/5mfuFZxp8tXIlz3xbIFlcRHZHl9BP6pNPgzSL
         +lpdxKfqv+YooY9VwHn5n4Gpf+FtB9PJ34GrA18ykxjNKnFuKTxdZ3qj7CtS5/emBJ
         feJZCKOK1NKMXmru4OTUCVbvqHtp6F0g2C6JcQuQ=
Date:   Sat, 18 Jun 2022 02:14:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 47/55] dt-bindings: media: rkisp1: Add i.MX8MP ISP to
 compatible
Message-ID: <Yq0K7TZB3jWsOa2q@pendragon.ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-48-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-48-paul.elder@ideasonboard.com>
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

On Wed, Jun 15, 2022 at 04:11:19AM +0900, Paul Elder wrote:
> The i.MX8MP ISP is compatbile with the rkisp1 driver. Add it to the list
> of compatible strings. While at it, expand on the description of the
> clocks to make it clear which clock in the i.MX8MP ISP they map to,
> based on the names from the datasheet (which are confusing).
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/rockchip-isp1.yaml | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> index b3661d7d4357..95cf945f7ac5 100644
> --- a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> @@ -16,6 +16,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - fsl,imx8mp-isp
>        - rockchip,px30-cif-isp
>        - rockchip,rk3399-cif-isp
>  
> @@ -36,9 +37,9 @@ properties:
>      minItems: 3
>      items:
>        # isp0 and isp1
> -      - description: ISP clock
> -      - description: ISP AXI clock
> -      - description: ISP AHB clock
> +      - description: ISP clock (for imx8mp, clk)
> +      - description: ISP AXI clock (for imx8mp, m_hclk)
> +      - description: ISP AHB clock (for imx8mp, hclk)
>        # only for isp1
>        - description: ISP Pixel clock
>  

-- 
Regards,

Laurent Pinchart
