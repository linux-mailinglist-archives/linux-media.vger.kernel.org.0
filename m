Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9556122445A
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 21:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728778AbgGQTiR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 15:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727999AbgGQTiR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 15:38:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D515C0619D2;
        Fri, 17 Jul 2020 12:38:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8102B71D;
        Fri, 17 Jul 2020 21:38:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595014695;
        bh=TYGrZtPuPnxVKDh/GjXJVrbY4UvX6AO5m/hM89zIvdU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d8M9TNoBBzIeJ67pLBE25kOzmZCUpLfezw2a0ycNtuNHNSmDF6pMScVlk/QBmVyRH
         1Dbf+FfISWZTx9NL8ClGhZcK2FhuZ1wyEn7AklIhU9+Q2/WRXnZEw18MxEfLo833va
         ud8VzTIpM3OwdiKAn3Qz4Qmmseg5YnyXU5s29dfs=
Date:   Fri, 17 Jul 2020 22:38:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        slongerbeam@gmail.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 03/13] dt-bindings: media: ov5640: Do not limit rotation
Message-ID: <20200717193807.GE5961@pendragon.ideasonboard.com>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-4-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-4-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Jul 17, 2020 at 03:28:49PM +0200, Jacopo Mondi wrote:
> The 'rotation' property should not be limited to only support 0 and
> 180 degrees, as that limitation comes from the driver implementation
> and not from any device specific constraint.
> 
> Remove the enumeration of supported values from 'rotation'.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> index ceeacc91c801..503f8b78615c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> @@ -55,7 +55,7 @@ properties:
>    rotation:
>      description: |
>        As defined in Documentation/devicetree/bindings/media/video-interfaces.txt
> -    enum: [0, 180]
> +    maxItems: 1

Maybe

    $ref: /schemas/types.yaml#/definitions/uint32
    minimum: 0
    maximum: 359

?

>  
>    port:
>      type: object

-- 
Regards,

Laurent Pinchart
