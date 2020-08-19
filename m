Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345AC24A0B3
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 15:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728530AbgHSNyt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 09:54:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58444 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgHSNys (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 09:54:48 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6440C29E;
        Wed, 19 Aug 2020 15:54:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597845281;
        bh=ZqBfMDMSKa5X/szF7RfnDQDJrt4q2W1U8MQZSEOCOO8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dC8PMbBDd77raytOmFSRlll3+T+zxR5N6Pq4zGBDzetA/3IiC25Sp+59vDmLf9Zcw
         opdRB8HXOWD6NuxNlmvdCCs8aL7yGClWsJa2Erj7MkCLRkiXyrw60YbC4gVBT2dwP0
         HdUiJqDMwuSuq16Q6OwPk5AwcLOgs0HQ+QiicfWI=
Date:   Wed, 19 Aug 2020 16:54:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: media: ov772x: Document endpoint props
Message-ID: <20200819135423.GL6049@pendragon.ideasonboard.com>
References: <20200818122012.37956-1-jacopo+renesas@jmondi.org>
 <20200818122012.37956-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200818122012.37956-4-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Aug 18, 2020 at 02:20:12PM +0200, Jacopo Mondi wrote:
> Document endpoint properties for the parallel bus type and
> add them to the example.
> 
> Specify a few constraints:
> - If the bus type is BT.656 no hsync or vsycn polarities can be
>   specified.
> - If the bus width is 10 bits, not data-shift can be applied.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../devicetree/bindings/media/i2c/ov772x.yaml | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> index 75dad40f70cc..3fad5dffd19a 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> @@ -50,9 +50,47 @@ properties:
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
>            remote-endpoint:
>              description: A phandle to the bus receiver's endpoint node.
> 
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
> +          - if:
> +              properties:
> +                bus-width:
> +                  const: 10
> +            then:
> +                properties:
> +                  data-shift:
> +                    const: 0

I'd add a blank line here.

>          required:
>            - bus-type

Should some of the properties be required ? Possibly conditioned on
bus-type ?

> 
> @@ -82,6 +120,11 @@ examples:
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
