Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E22E4B2EA4
	for <lists+linux-media@lfdr.de>; Fri, 11 Feb 2022 21:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbiBKUmb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Feb 2022 15:42:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbiBKUm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Feb 2022 15:42:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4667CF2
        for <linux-media@vger.kernel.org>; Fri, 11 Feb 2022 12:42:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74FA593;
        Fri, 11 Feb 2022 21:42:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644612144;
        bh=15qXl6luBZH9o1ELt2sF2BngQlFnqmXYSjFgV8b31xA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UmqEqAEVLNR+KTF5eVUQJlI4BXDDvJLMUxMHX2xvKLhrAnJ37nhmtHAks1mjO4HQi
         3lt+D+9UxwsZOJFM9N9hfISV8GaViV530ZkdFYvrSfOT2Ku4dDLMfky9XkmkjvJd2v
         1DSdU+a4J+FOwemW1E0MaRpEW73oOgNrDrNhCQxs=
Date:   Fri, 11 Feb 2022 22:42:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, martin.kepplinger@puri.sm,
        rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] media: imx: Rename imx7-mipi-csis.c to
 imx-mipi-csis.c
Message-ID: <YgbKLDwyV6pYj8Fu@pendragon.ideasonboard.com>
References: <20220211180216.290133-1-jacopo@jmondi.org>
 <20220211180216.290133-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220211180216.290133-3-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Feb 11, 2022 at 07:02:15PM +0100, Jacopo Mondi wrote:
> Rename the imx7-mipi-csis.c driver to remove the reference to i.MX7.
> 
> The driver is for an IP core found on i.MX7 and i.MX8 SoC so do not
> specify a SoC version number in the driver name.

I'm not against this, but I think we should then rename the symbols in
the source code too. I don't mind keeping the current name if the rename
causes too much churn.

> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  MAINTAINERS                                                     | 2 +-
>  .../media/platform/imx/{imx7-mipi-csis.c => imx-mipi-csis.c}    | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename drivers/media/platform/imx/{imx7-mipi-csis.c => imx-mipi-csis.c} (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5bdb8c881b0b..7def3b7d56bc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11891,7 +11891,7 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/admin-guide/media/imx7.rst
>  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
> -F:	drivers/media/platform/imx/imx7-mipi-csis.c
> +F:	drivers/media/platform/imx/imx-mipi-csis.c
>  F:	drivers/staging/media/imx/imx7-media-csi.c
>  
>  MEDIA DRIVERS FOR HELENE
> diff --git a/drivers/media/platform/imx/imx7-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> similarity index 100%
> rename from drivers/media/platform/imx/imx7-mipi-csis.c
> rename to drivers/media/platform/imx/imx-mipi-csis.c

-- 
Regards,

Laurent Pinchart
