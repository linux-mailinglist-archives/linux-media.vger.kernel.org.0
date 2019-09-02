Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6387EA5B72
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 18:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbfIBQfr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 12:35:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35946 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbfIBQfq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 12:35:46 -0400
Received: from pendragon.ideasonboard.com (231.125-247-81.adsl-dyn.isp.belgacom.be [81.247.125.231])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E60A3303;
        Mon,  2 Sep 2019 18:35:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567442144;
        bh=DZERe7a6+iZRU88X8yX5+d6s9z8EbyR9BpjgZL8wFSY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jiAOxCOplW+gbGD2dKgA+f6kfXLUFBrQNE5U+/jRi/Lw7qPbuC/An660Zfq18cWuX
         avQshXIBlq07P0Wzwb8yHL6uOzTygVvYY1sUzKKBNXswua+Y7arleSuO3SAz4MkUcJ
         XyidYeYdy5lMyVBiKAco+Z6XGfIDdAeFXDdArnpo=
Date:   Mon, 2 Sep 2019 19:35:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: sh-mobile-ceu: Remove now unimplemented
 bindings documentation
Message-ID: <20190902163537.GD12197@pendragon.ideasonboard.com>
References: <20190902084352.7974-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190902084352.7974-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Simon,

Thank you for the patch.

On Mon, Sep 02, 2019 at 10:43:52AM +0200, Simon Horman wrote:
> Remove the SH Mobile CEU bindings documentation as the corresponding driver
> was removed v5.1 by the following commit:
> 
> 43a445f188e1 ("media: sh_mobile_ceu_camera: remove obsolete soc_camera driver")
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

One less file to convert to yaml ;-)

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../devicetree/bindings/media/sh_mobile_ceu.txt         | 17 -----------------
>  1 file changed, 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/sh_mobile_ceu.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/sh_mobile_ceu.txt b/Documentation/devicetree/bindings/media/sh_mobile_ceu.txt
> deleted file mode 100644
> index cfa4ffada8ae..000000000000
> --- a/Documentation/devicetree/bindings/media/sh_mobile_ceu.txt
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Bindings, specific for the sh_mobile_ceu_camera.c driver:
> - - compatible: Should be "renesas,sh-mobile-ceu"
> - - reg: register base and size
> - - interrupts: the interrupt number
> - - renesas,max-width: maximum image width, supported on this SoC
> - - renesas,max-height: maximum image height, supported on this SoC
> -
> -Example:
> -
> -ceu0: ceu@fe910000 {
> -	compatible = "renesas,sh-mobile-ceu";
> -	reg = <0xfe910000 0xa0>;
> -	interrupt-parent = <&intcs>;
> -	interrupts = <0x880>;
> -	renesas,max-width = <8188>;
> -	renesas,max-height = <8188>;
> -};

-- 
Regards,

Laurent Pinchart
