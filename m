Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD8624A0AB
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 15:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728343AbgHSNxJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 09:53:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58410 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728160AbgHSNxF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 09:53:05 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1178B29E;
        Wed, 19 Aug 2020 15:52:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597845183;
        bh=rzNdy0W/e+J1IGsg0mBDBLcHesL5GnTUTk+u93CRXVs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KNkNas23QkZsD1J4DX38kFuuyScITsDQe0hifCUy2tKE7f4V9EEy18kWDkgjRPgwP
         RKoe8FZt8Eaxsgg8N9JpBo0gSxXHkTR14WVCR+VE9rtG+N862uAP5DRMn1aXlV1Yf4
         4GJ8dAZpI0qMnlT2cCPvNOWg22yL07ZQwEyL9xH4=
Date:   Wed, 19 Aug 2020 16:52:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: media: ov772x: Make bus-type mandatory
Message-ID: <20200819135242.GK6049@pendragon.ideasonboard.com>
References: <20200818122012.37956-1-jacopo+renesas@jmondi.org>
 <20200818122012.37956-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200818122012.37956-3-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Aug 18, 2020 at 02:20:11PM +0200, Jacopo Mondi wrote:
> In order to establish required properties based on the selected
> bus type, make the 'bus-type' property mandatory.
> 
> Binary compatibility with existing DTB is kept as the driver does not
> enforce the property to be present, and shall fall-back to default
> parallel bus configuration, which was the only supported bus type, if
> the property is not specified.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/i2c/ov772x.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> index 2b84fefeb4aa..75dad40f70cc 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
> @@ -47,9 +47,15 @@ properties:
>        endpoint:
>          type: object
>          properties:
> +          bus-type:
> +            enum: [5, 6]
> +
>            remote-endpoint:
>              description: A phandle to the bus receiver's endpoint node.
>  
> +        required:
> +          - bus-type
> +
>      additionalProperties: false
>  
>  required:
> @@ -75,6 +81,7 @@ examples:
>  
>              port {
>                  ov772x_0: endpoint {
> +                    bus-type = <5>;
>                      remote-endpoint = <&vcap1_in0>;
>                  };
>              };

-- 
Regards,

Laurent Pinchart
