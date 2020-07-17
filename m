Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B406224593
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 23:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbgGQVDn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 17:03:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37218 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgGQVDn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 17:03:43 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A36C71D;
        Fri, 17 Jul 2020 23:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595019821;
        bh=CyEALqQh1xp4Upyolpu9NTNkpXnt/sPjRTQBEUUSRZA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oVE0IedlV70n3icc7ShfPuVxpqjzBkg/VbgnwE1PA1ioU3ZGejv44ti+JCuLs2DaK
         iN8IbWPz8a6mYPP1xS94klIJPc3WYkXRXMY7yOA4jDc/mOYUDpWbkViiArAWZGq3WZ
         tifcOa5VYRrEZu9SNmKqGiNY7Y0+5zQvT57ig8ik=
Date:   Sat, 18 Jul 2020 00:03:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        slongerbeam@gmail.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 13/13] dt-bindings: media: ov5640: Add myself as
 co-maintainer
Message-ID: <20200717210332.GO5961@pendragon.ideasonboard.com>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-14-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-14-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Jul 17, 2020 at 03:28:59PM +0200, Jacopo Mondi wrote:
> Add myself as co-maintainer of the driver and the bindings
> file.

I'd squash this with 01/13 too.

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 1 +
>  MAINTAINERS                                             | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> index 514f8150b52e..e28ea471bc00 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> @@ -8,6 +8,7 @@ title: Omnivision OV5640 MIPI CSI-2 / parallel sensor
>  
>  maintainers:
>    - Steve Longerbeam <slongerbeam@gmail.com>
> +  - Jacopo Mondi <jacopo@jmondi.org>
>  
>  description: -|
>    The OV5640 is a 5 megapixels image sensor capable of producing images in RGB,
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fc2a2129d18e..b5dd706d072b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12601,6 +12601,7 @@ F:	drivers/media/i2c/ov2740.c
>  
>  OMNIVISION OV5640 SENSOR DRIVER
>  M:	Steve Longerbeam <slongerbeam@gmail.com>
> +M:	Jacopo Mondi <jacopo@jmondi.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  T:	git git://linuxtv.org/media_tree.git

-- 
Regards,

Laurent Pinchart
