Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE8B687244
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 01:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjBBAWC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 19:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjBBAWB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 19:22:01 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3AD6D5E1
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 16:22:00 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1EE4505;
        Thu,  2 Feb 2023 01:21:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675297319;
        bh=5W8SpRaqrbDg4fNLJcM902WU9mkcGYaJzdAHieIAwns=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WfNglC+OlclKH7V5K/j1xmf3E+iu4VJcL76ZH9GnYa8TXUmrzTjoRI3lNMR3FgAHZ
         IhbYJ8Wkb3P+g54K26SNgI6yst/zjZumlQJfCB1/BDDGGc86Uhhn0wtoEO8G1UGc7a
         eNmf9ZHM2I6uO/pdkrMdNtLv/i1cXDpGaejMXHd4=
Date:   Thu, 2 Feb 2023 02:21:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 01/11] media: i2c: imx290: Match kernel coding style on
 whitespace
Message-ID: <Y9sCJPSemXIFCwy+@pendragon.ideasonboard.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-2-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230131192016.3476937-2-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Thank you for the patch.

On Tue, Jan 31, 2023 at 07:20:06PM +0000, Dave Stevenson wrote:
> Fix up a couple of coding style issues regarding missing blank
> lines after declarations, double blank lines, and incorrect
> indentation.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx290.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index a370f1102334..88c7201510a2 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -106,7 +106,6 @@
>  
>  #define IMX290_VMAX_DEFAULT				1125
>  
> -
>  /*
>   * The IMX290 pixel array is organized as follows:
>   *
> @@ -335,6 +334,7 @@ static const s64 imx290_link_freq_2lanes[] = {
>  	[FREQ_INDEX_1080P] = 445500000,
>  	[FREQ_INDEX_720P] = 297000000,
>  };
> +
>  static const s64 imx290_link_freq_4lanes[] = {
>  	[FREQ_INDEX_1080P] = 222750000,
>  	[FREQ_INDEX_720P] = 148500000,
> @@ -465,7 +465,7 @@ static int __always_unused imx290_read(struct imx290 *imx290, u32 addr, u32 *val
>  			      data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
>  	if (ret < 0) {
>  		dev_err(imx290->dev, "%u-bit read from 0x%04x failed: %d\n",
> -			 ((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
> +			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
>  			 addr & IMX290_REG_ADDR_MASK, ret);
>  		return ret;
>  	}
> @@ -486,7 +486,7 @@ static int imx290_write(struct imx290 *imx290, u32 addr, u32 value, int *err)
>  			       data, (addr >> IMX290_REG_SIZE_SHIFT) & 3);
>  	if (ret < 0) {
>  		dev_err(imx290->dev, "%u-bit write to 0x%04x failed: %d\n",
> -			 ((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
> +			((addr >> IMX290_REG_SIZE_SHIFT) & 3) * 8,
>  			 addr & IMX290_REG_ADDR_MASK, ret);
>  		if (err)
>  			*err = ret;
> @@ -752,8 +752,7 @@ static int imx290_start_streaming(struct imx290 *imx290,
>  
>  	/* Set init register settings */
>  	ret = imx290_set_register_array(imx290, imx290_global_init_settings,
> -					ARRAY_SIZE(
> -						imx290_global_init_settings));
> +					ARRAY_SIZE(imx290_global_init_settings));
>  	if (ret < 0) {
>  		dev_err(imx290->dev, "Could not set init registers\n");
>  		return ret;

-- 
Regards,

Laurent Pinchart
