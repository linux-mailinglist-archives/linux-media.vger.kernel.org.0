Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B34E4224584
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 23:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgGQVAR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 17:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgGQVAR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 17:00:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B436C0619D2;
        Fri, 17 Jul 2020 14:00:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 998A471D;
        Fri, 17 Jul 2020 23:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595019615;
        bh=9uVjxEM0EEZ7h4P68xrz6YfvS/2k9MOeiWQU4MlVIDQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wc0EuWKR9C5R69NoK8rS0de891pD+/v2+M2w+le/3WLo4jMMjrTAE9aVE07TdRat4
         0e9rRZixs9wJW+Q+xJd6xYFjPsKnIoFrrfQ/sTfdMicXlvtxWpJAT90+Q2B60v7LBY
         YTuhh6QZPMbwDGOpU5IZvNtAv8DR/8vAWRQul7aw=
Date:   Sat, 18 Jul 2020 00:00:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        slongerbeam@gmail.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 10/13] dt-bindings: media: ov5640: Demote DVP required
 properties
Message-ID: <20200717210007.GL5961@pendragon.ideasonboard.com>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-11-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-11-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Jul 17, 2020 at 03:28:56PM +0200, Jacopo Mondi wrote:
> Now that properties have a default value assigned, do not mark them
> as required anymore in the bindings documentation.

I would squash this with 09/13 (depending on the outcome of the
discussion about 09/13).

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> index 3c20cdd02f76..514f8150b52e 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> @@ -131,9 +131,6 @@ properties:
>                  - remote-endpoint
>                  - bus-type
>                  - bus-width
> -                - hsync-active
> -                - vsync-active
> -                - pclk-sample
>  
>      additionalProperties: false
>  

-- 
Regards,

Laurent Pinchart
