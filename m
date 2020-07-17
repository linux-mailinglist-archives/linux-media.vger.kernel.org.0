Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0ACE22457E
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 22:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgGQU7m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 16:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgGQU7l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 16:59:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A135DC0619D2;
        Fri, 17 Jul 2020 13:59:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F417C71D;
        Fri, 17 Jul 2020 22:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595019580;
        bh=i3fucTCPvGuiKwZhvy6F6ElIVPIjuW9fHR5L+eugld8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UD7Rh/nlLLKYJ8M72IG53EXhpIOWTiXd+9hQSndvPsJlrsudIYFu1orgc+dwv86c8
         vsg/VJNtucCp/y6VmjgFTKqEn91+Ssy7XQNA8T8S8/EcGtbNFoga5fcjWPLa8PVvOe
         /oBXBYAiNZ2NrV91c4oNRcrLHgUVIueBl9OwRhh8=
Date:   Fri, 17 Jul 2020 23:59:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        slongerbeam@gmail.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 09/13] dt-bindings: media: ov5640: Add default for synch
 signals
Message-ID: <20200717205931.GK5961@pendragon.ideasonboard.com>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-10-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-10-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Jul 17, 2020 at 03:28:55PM +0200, Jacopo Mondi wrote:
> Add defalt value for the DVP interface synchronism signals.

s/synchronism/synchronization/

> The default values have been derived from register 0x4740
> documentation (datasheet version 2.03)
> 
> 0x4740 POLARITY CTRL00 default = 0x20
> bit 5: pclk polarity = 1 active high
> bit 1: HREF polarity = 0 active low
> bit 0: VSYNC polarity = 0 active low

Do we need default values ? That's only for the case where the
properties are not specified, and I think they are mandatory when the
bus-type is set to parallel, aren't they ? I think stating this
explicitly will be less error-prone.

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> index ab700a1830aa..3c20cdd02f76 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> @@ -94,12 +94,15 @@ properties:
>  
>            hsync-active:
>              enum: [0, 1]
> +            default: 0
>  
>            vsync-active:
>              enum: [0, 1]
> +            default: 0
>  
>            pclk-sample:
>              enum: [0, 1]
> +            default: 1
>  
>          allOf:
>            - if:

-- 
Regards,

Laurent Pinchart
