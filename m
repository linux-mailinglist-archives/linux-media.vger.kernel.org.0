Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDCA168CBEC
	for <lists+linux-media@lfdr.de>; Tue,  7 Feb 2023 02:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjBGB1N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 20:27:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjBGB1L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 20:27:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F9832ED48;
        Mon,  6 Feb 2023 17:27:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [109.136.43.56])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A78824AF;
        Tue,  7 Feb 2023 02:27:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675733227;
        bh=FnceRJDD6W8MhXidKtN80oErpRnlC0wqY7NqfTiwXxI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wfg3jvbLPJ6iSVEZapSTec5c7kJjmKL3Xi6oRm8cJw4BArdBGg+RKSBga+IK+kGeq
         vJCY4GmYkFTncdzHariLHkJfuqoQd6jx5cGxtCnvYLsoI1bURSgWjpL5KyGLYwQDkN
         FSryJQNIQteFP6hLa0/hiasX1UpLW6SoxUxBCRr8=
Date:   Tue, 7 Feb 2023 03:27:05 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] media: dt-bindings: media: i2c: Add imx327
 version to IMX327 bindings
Message-ID: <Y+Go6SN71zNHzDB6@pendragon.ideasonboard.com>
References: <20230206131731.548795-1-alexander.stein@ew.tq-group.com>
 <20230206131731.548795-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230206131731.548795-2-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

Thank you for the patch.

On Mon, Feb 06, 2023 at 02:17:30PM +0100, Alexander Stein wrote:
> The imx290 driver can be used for both imx290 and imx327 as they have a
> similar register set and configuration. imx327 lacks 8 lanes LVDS and
> 120 FPS support.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> index dacecb0cd9aa..5afe508011ec 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> @@ -29,6 +29,7 @@ properties:
>        - sony,imx290
>        - sony,imx290lqr
>        - sony,imx290llr
> +      - sony,imx327lqr

Looks good, but may need to be rebased on top of v3 of Dave's series.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>    reg:
>      maxItems: 1

-- 
Regards,

Laurent Pinchart
