Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 873924B5AAE
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 20:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiBNTqj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 14:46:39 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:56094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiBNTqg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 14:46:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B1EEAC7E
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 11:46:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED0D847F;
        Mon, 14 Feb 2022 20:15:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644866113;
        bh=ec+4NwcTQuwHKvY1BIzHOsNHa67wec4LhWkzGhnFNM8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DNYUXsuS+IXsft+2jfTxWVC07Req4Gk/h/JAs5s6OewBaY68fL2Qc8ZnLA/JVwH00
         XCW+XsaqhbmL72PRGbDYNDETHl8+FcNOQ/F3t0ACDSUTZjHzj90mGJ13VLKQJLwo+4
         SnE8S2BJqX5A3Q0jOFYc+Jd6Vf4faj20yqenZ/Iw=
Date:   Mon, 14 Feb 2022 21:15:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, martin.kepplinger@puri.sm,
        rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
        alexander.stein@ew.tq-group.com, dorota.czaplejewicz@puri.sm,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/8] staging: media: imx: Add more compatible strings
Message-ID: <YgqqO+6FHIVocnW9@pendragon.ideasonboard.com>
References: <20220214184318.409208-1-jacopo@jmondi.org>
 <20220214184318.409208-4-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220214184318.409208-4-jacopo@jmondi.org>
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

On Mon, Feb 14, 2022 at 07:43:13PM +0100, Jacopo Mondi wrote:
> The imx7-media-csi driver controls the CSI (CMOS Sensor Interface)
> peripheral available on several SoC of different generations.
> 
> The current situation when it comes to compatible strings is rather
> confused:
> - Bindings document imx6ul, imx7 and imx8mm
> - Driver supports imx6ul, imx7 and imx8mq
> - The IMX8MM and IMX8MQ DTS use the correct compatible strings with a
>   fallback to the generic "imx7-csi" identifier:
>   arch/arm64/boot/dts/freescale/imx8mq.dtsi: compatible = "fsl,imx8mq-csi",
>   arch/arm64/boot/dts/freescale/imx8mm.dtsi: compatible = "fsl,imx8mm-csi",
> 
> Tidy-up the situation by adding the IMX8MQ compatible string to the
> bindings documentation andathe IMX8MM identifier to the driver, to allow
> to distinguish the SoC the CSI peripheral is integrated on in the
> following patches.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml | 1 +
>  drivers/staging/media/imx/imx7-media-csi.c                | 2 ++

I think Rob would prefer this being split in two patches, and I think it
would make sense, as you're fixing two separate issues.

>  2 files changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> index 4f7b78265336..0f1505d85111 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> @@ -21,6 +21,7 @@ properties:
>            - fsl,imx7-csi
>            - fsl,imx6ul-csi
>        - items:
> +          - const: fsl,imx8mq-csi
>            - const: fsl,imx8mm-csi
>            - const: fsl,imx7-csi

I don't think you intended to require the following:

	compatible = "fsl,imx8mq-csi", "fsl,imx8mm-csi", "fsl,imx7-csi";

You probably want

 properties:
   compatible:
     oneOf:
       - enum:
+          - fsl,imx8mq-csi
           - fsl,imx7-csi
           - fsl,imx6ul-csi
       - items:
           - const: fsl,imx8mm-csi
           - const: fsl,imx7-csi

instead.

> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index 32311fc0e2a4..59100e409709 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -162,6 +162,7 @@
>  enum imx_csi_model {
>  	IMX7_CSI_IMX7 = 0,
>  	IMX7_CSI_IMX8MQ,
> +	IMX7_CSI_IMX8MM,
>  };
>  
>  struct imx7_csi {
> @@ -1277,6 +1278,7 @@ static int imx7_csi_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id imx7_csi_of_match[] = {
>  	{ .compatible = "fsl,imx8mq-csi", .data = (void *)IMX7_CSI_IMX8MQ },
> +	{ .compatible = "fsl,imx8mm-csi", .data = (void *)IMX7_CSI_IMX8MM },

This isn't needed, as the i.MX8MM CSI bridgge is considered fully
backward-compatible with the i.MX7 version. I'd introduce this change in
the patch where you start using IMX7_CSI_IMX8MM, and I would then add
the following to the DT binding:

 properties:
   compatible:
     oneOf:
       - enum:
           - fsl,imx8mq-csi
+          - fsl,imx8mm-csi
           - fsl,imx7-csi
           - fsl,imx6ul-csi
       - items:
           - const: fsl,imx8mm-csi
           - const: fsl,imx7-csi

to allow setting

	compatible = "fsl,imx8mm-csi";

without the imx7 fallback if we consider the i.MX8MM version different.
If the driver can operate correctly on the i.MX8MM when using the i.MX7
fallback code paths (possibly minor issues that are not considered
fatal, such as missing features) then you could skip this binding
change.

>  	{ .compatible = "fsl,imx7-csi", .data = (void *)IMX7_CSI_IMX7 },
>  	{ .compatible = "fsl,imx6ul-csi", .data = (void *)IMX7_CSI_IMX7 },
>  	{ },

-- 
Regards,

Laurent Pinchart
