Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1C925CC52
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 23:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728622AbgICVeA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 17:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgICVd5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 17:33:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C83DC061244;
        Thu,  3 Sep 2020 14:33:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 899A456E;
        Thu,  3 Sep 2020 23:33:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599168832;
        bh=c5PHZQTxFN2DfGIKhuJIfs1J02Rl5lH57MCUm+zIwdI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YrH64JwSixNNpJ9C/lFysuvisHp1Reh8U2ad1rIxRc+yYl1zrzKTNafSzAi/wkbXt
         d8rQGMpvceeKFMNBUO+PnMm2sTj2Zc0rkLhecVb/mqvf8ioU2EnnD5y+0jcTRLR9vl
         rT19WDxxYUnb30iQPpOebXuOmxzn8Vyge7XUxGYQ=
Date:   Fri, 4 Sep 2020 00:33:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 3/3] dt-bindings: media: ov772x: Document endpoint
 props
Message-ID: <20200903213329.GG6492@pendragon.ideasonboard.com>
References: <20200903131029.18334-1-jacopo+renesas@jmondi.org>
 <20200903131029.18334-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200903131029.18334-4-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Sep 03, 2020 at 03:10:29PM +0200, Jacopo Mondi wrote:
> Document endpoint properties for the parallel bus type and
> add them to the example.
> 
> Specify a few constraints:
> - If the bus type is BT.656 no hsync or vsycn polarities can be

s/vsycn/vsync/

>   specified.
> - If the bus width is 10 bits, not data-shift can be applied.
> 
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/media/i2c/ovti,ov772x.yaml       | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> index 406e9cd463a2..c596cbd1e92d 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> @@ -52,6 +52,45 @@ properties:
>            bus-type:
>              enum: [5, 6]
>  
> +          bus-width:
> +            enum: [8, 10]
> +            default: 10
> +
> +          data-shift:
> +            enum: [0, 2]
> +            default: 0
> +
> +          hsync-active:
> +            enum: [0, 1]
> +            default: 1
> +
> +          vsync-active:
> +            enum: [0, 1]
> +            default: 1
> +
> +          pclk-sample:
> +            enum: [0, 1]
> +            default: 1
> +
> +        allOf:
> +          - if:
> +              properties:
> +                bus-type:
> +                  const: 6
> +            then:
> +                properties:
> +                  hsync-active: false
> +                  vsync-active: false
> +

This should eventually end up in video-interfaces.yaml. I don't mind
keeping it here in the meantime. Same for the hsync-active, vsync-active
and pclk-sample enum, they should end up in video-interfaces.yaml.


Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +          - if:
> +              properties:
> +                bus-width:
> +                  const: 10
> +            then:
> +                properties:
> +                  data-shift:
> +                    const: 0
> +
>          required:
>            - remote-endpoint
>            - bus-type
> @@ -85,6 +124,11 @@ examples:
>              port {
>                  ov772x_0: endpoint {
>                      bus-type = <5>;
> +                    vsync-active = <0>;
> +                    hsync-active = <0>;
> +                    pclk-sample = <0>;
> +                    bus-width = <8>;
> +                    data-shift = <0>;
>                      remote-endpoint = <&vcap1_in0>;
>                  };
>              };

-- 
Regards,

Laurent Pinchart
