Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBEB2ED315
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 15:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbhAGO4b convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 7 Jan 2021 09:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbhAGO4b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 09:56:31 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E4D3C0612F4
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 06:55:50 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kxWhV-0006TA-EU; Thu, 07 Jan 2021 15:55:45 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kxWhP-0003zw-Fm; Thu, 07 Jan 2021 15:55:39 +0100
Message-ID: <a23ab40e50a761bd2127df6bc8b2a91e99a1617c.camel@pengutronix.de>
Subject: Re: [PATCH 3/5] dt-bindings: media: rockchip-vpu: Add PX30
 compatible
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date:   Thu, 07 Jan 2021 15:55:39 +0100
In-Reply-To: <20210107134101.195426-4-paul.kocialkowski@bootlin.com>
References: <20210107134101.195426-1-paul.kocialkowski@bootlin.com>
         <20210107134101.195426-4-paul.kocialkowski@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Thu, 2021-01-07 at 14:40 +0100, Paul Kocialkowski wrote:
> The Rockchip PX30 SoC has a Hantro VPU that features a decoder (VDPU2)
> and an encoder (VEPU2). It is similar to the RK3399's VPU but takes an
> extra clock (SCLK).
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../bindings/media/rockchip-vpu.yaml          | 25 +++++++++++++------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> index c81dbc3e8960..c446b9ead21b 100644
> --- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> @@ -15,10 +15,13 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - rockchip,rk3288-vpu
> -      - rockchip,rk3328-vpu
> -      - rockchip,rk3399-vpu
> +    oneOf:
> +      - const: rockchip,rk3288-vpu
> +      - const: rockchip,rk3328-vpu
> +      - const: rockchip,rk3399-vpu
> +      - items:
> +        - const: rockchip,px30-vpu
> +        - const: rockchip,rk3399-vpu
>  
>    reg:
>      maxItems: 1
> @@ -35,12 +38,18 @@ properties:
>            - const: vdpu
>  
>    clocks:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>  
>    clock-names:
> -    items:
> -      - const: aclk
> -      - const: hclk
> +    oneOf:
> +      - items:
> +        - const: aclk
> +        - const: hclk
> +      - items:
> +        - const: aclk
> +        - const: hclk
> +        - const: sclk

You could make this:

    clock-names:
      minItems: 2
      items:
        - const: aclk
        - const: hclk
        - const: sclk

And then:

allOf:
  - if:
      properties:
        compatible:
          contains:
            const: rockchip,px30-vpu
    then:
      properties:
        clock-names:
          minItems: 3

to make sure each variant has the correct clocks set.

regards
Philipp
