Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB551850E6
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 22:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgCMVUT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 17:20:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58286 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgCMVUT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 17:20:19 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74DEC2D6;
        Fri, 13 Mar 2020 22:20:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584134416;
        bh=rbPOZUZr8TzKPMaBhelegUMRi4yJvmaHj4VSA2yR9ts=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M810FBkQMGJkbsHLRGM5Yk4qMYoxUHx4+3mMrw/PFRkDpuIMNbSWojeQiL2c4bqPx
         4gtv30a6xpxu3wAnT2Te+bwW5mEaQpQRFAY98wYHeXEMVpeQXEOddq5+61wuRa2x/V
         MjcuyEIPTPrT+2zHAhb0p2Ioc+FnxbpH0pNEwh+4=
Date:   Fri, 13 Mar 2020 23:20:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] media: dt-bindings: media: i2c: Switch to
 assigned-clock-rates
Message-ID: <20200313212012.GL4751@pendragon.ideasonboard.com>
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1584133954-6953-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Fri, Mar 13, 2020 at 09:12:31PM +0000, Lad Prabhakar wrote:
> Use assigned-clock-rates to specify the clock rate. Also mark
> clock-frequency property as deprecated.

I would phrase it the other way around, this patch mainly deprecates
clock-frequency, and as a side effect recommends usage of
assigned-clock-rates.

"Deprecate usage of the clock-frequency propertly. The preferred method
to set clock rates is to use assigned-clock-rates."

> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov5645.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> index 72ad992..e62fe82 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> @@ -8,7 +8,7 @@ Required Properties:
>  - compatible: Value should be "ovti,ov5645".
>  - clocks: Reference to the xclk clock.
>  - clock-names: Should be "xclk".
> -- clock-frequency: Frequency of the xclk clock.
> +- clock-frequency (deprecated): Frequency of the xclk clock.

I would drop this completely. Drivers need to ensure backward
compatibility, but DT bindings should only document the latest version,
the history is available in git.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

While at it, can I enlist you to convert these bindings to yaml ? :-)

>  - enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
>    to the hardware pin PWDNB which is physically active low.
>  - reset-gpios: Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
> @@ -37,7 +37,8 @@ Example:
>  
>  			clocks = <&clks 200>;
>  			clock-names = "xclk";
> -			clock-frequency = <24000000>;
> +			assigned-clocks = <&clks 200>;
> +			assigned-clock-rates = <24000000>;
>  
>  			vdddo-supply = <&camera_dovdd_1v8>;
>  			vdda-supply = <&camera_avdd_2v8>;

-- 
Regards,

Laurent Pinchart
