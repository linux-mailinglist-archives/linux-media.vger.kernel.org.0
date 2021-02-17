Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99A6531DFBC
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 20:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233313AbhBQTkx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 14:40:53 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59160 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233314AbhBQTkt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 14:40:49 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E062B1F45845
Message-ID: <ab14f5a0bde2bdcd4bb0128f76e5a3ba8e7b0894.camel@collabora.com>
Subject: Re: [PATCH v1 03/18] arm64: dts: imx8mq-evk: add reserve memory
 node for CMA region
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        p.zabel@pengutronix.de, mchehab@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, krzk@kernel.org, shengjiu.wang@nxp.com,
        adrian.ratiu@collabora.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        Anson.Huang@nxp.com, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com
Date:   Wed, 17 Feb 2021 16:39:49 -0300
In-Reply-To: <20210217080306.157876-4-benjamin.gaignard@collabora.com>
References: <20210217080306.157876-1-benjamin.gaignard@collabora.com>
         <20210217080306.157876-4-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Wed, 2021-02-17 at 09:02 +0100, Benjamin Gaignard wrote:
> Define allocation range for the default CMA region.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Despite it seems like I signed-off this one...

> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> index 85b045253a0e..047dfd4a1ffd 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> @@ -21,6 +21,21 @@ memory@40000000 {
>                 reg = <0x00000000 0x40000000 0 0xc0000000>;
>         };
> 
>  
> +       resmem: reserved-memory {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               /* global autoconfigured region for contiguous allocations */
> +               linux,cma {
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +                       size = <0 0x3c000000>;
> +                       alloc-ranges = <0 0x40000000 0 0x40000000>;
> +                       linux,cma-default;
> +               };

... I'm not a fan of the change :)

Hopefully someone from NXP can provide some insight here?

If it's absolutely needed for the VPU, then I guess it should
be 1) very well documented and 2) moved to the top-lovel dtsi.

But if we can drop it, that'd be nicer.

Thanks,
Ezequiel

