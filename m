Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 502EA34B02
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 16:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbfFDOyd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 10:54:33 -0400
Received: from vps.xff.cz ([195.181.215.36]:35170 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727586AbfFDOyd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 10:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1559660071; bh=95GYOgwl829tExfkDRtkMvcWLHLqIMDdOvd0ItQBRPA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lQ08PYzAowbpDALh/bdzfBKo2Glb31I+mPrDYyfuk3YUz7jUjP2TtF05N7MRU/ABy
         ys6ZI84RcheuM7k2KhWKh1CcT2ElO9D+OfXrBtTR/YWsT7VFHVOTIUXA0gPdGnbJtF
         tNWOQaooGXJWtgGvUEWRkvO6/e0ePeOF9ehbh9GQ=
Date:   Tue, 4 Jun 2019 16:54:30 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 03/12] media: rc: sunxi: Add A31 compatible
Message-ID: <20190604145430.xqufpyosetgb4bo7@core.my.home>
Mail-Followup-To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20190528161440.27172-1-peron.clem@gmail.com>
 <20190528161440.27172-4-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190528161440.27172-4-peron.clem@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 28, 2019 at 06:14:31PM +0200, Clément Péron wrote:
> Allwiner A31 has a different memory mapping so add the compatible
> we will need it later.
> 
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  drivers/media/rc/sunxi-cir.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
> index d02dcb6fd0a5..0504ebfc831f 100644
> --- a/drivers/media/rc/sunxi-cir.c
> +++ b/drivers/media/rc/sunxi-cir.c
> @@ -343,6 +343,11 @@ static const struct sunxi_ir_quirks sun5i_a13_ir_quirks = {
>  	.fifo_size = 64,
>  };
>  
> +static const struct sunxi_ir_quirks sun6i_a31_ir_quirks = {
> +	.has_reset = true,
> +	.fifo_size = 64,
> +};
> +

BTW, H6 BSP uses FIFO size 40:

https://github.com/orangepi-xunlong/OrangePiH6_Linux4_9/blob/master/drivers/media/rc/sunxi-ir-dev.c#L290

Have you tried filling the fifo with over 40 words on H6, to see if it works?

I know it's docummented as having 64 words in the manual, so maybe Allwiner
just didn't care enough to make the driver configurable, and the H6
FIFO really has that depth.

regards,
	o.

>  static const struct of_device_id sunxi_ir_match[] = {
>  	{
>  		.compatible = "allwinner,sun4i-a10-ir",
> @@ -352,6 +357,10 @@ static const struct of_device_id sunxi_ir_match[] = {
>  		.compatible = "allwinner,sun5i-a13-ir",
>  		.data = &sun5i_a13_ir_quirks,
>  	},
> +	{
> +		.compatible = "allwinner,sun6i-a31-ir",
> +		.data = &sun6i_a31_ir_quirks,
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_ir_match);
> -- 
> 2.20.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
