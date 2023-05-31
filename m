Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67DE6718644
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 17:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbjEaP05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 11:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbjEaP04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 11:26:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77AE7196;
        Wed, 31 May 2023 08:26:26 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0DD1844;
        Wed, 31 May 2023 17:25:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685546746;
        bh=rhCsYhvaz8L7TA2anqhCCSXq11xsGa2YJDAGvozmVeU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mm3i8o/detwBCvMlTFZKLwqdG4PXOBxgEDN9BXwe+pB4mHXgmeRqLkfLsVU2e4TY5
         mzYBfs6uFKk7Eyfrt1eHb7cLCspY1FHbZNNSZeuRgM8M3EW4vHDs4b6XGOPQyicJJV
         6e9Q45LGr/2lC62tPeAy7EVVpA+Hkq47YKa6omkw=
Date:   Wed, 31 May 2023 17:26:03 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 07/21] media: i2c: imx258: Split out common registers
 from the mode based ones
Message-ID: <pt4zrbl6ztny5w3rly63pv4toy2afdwhy5j2tjfm4e6s34nzwy@p2ed2xdpysvb>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-8-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-8-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Tue, May 30, 2023 at 06:29:46PM +0100, Dave Stevenson wrote:
> Out of all the registers that are defined for each mode, only around
> 10 differ between the modes.
>
> Split the table into common and mode specific ones.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

I have only visually compared the registers you have grouped together
and they seems to be identical. I have not gone through cut&paste&diff
though

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>


> ---
>  drivers/media/i2c/imx258.c | 236 ++++---------------------------------
>  1 file changed, 21 insertions(+), 215 deletions(-)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index c6fb649abb95..5a57d0b5fcd8 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -151,7 +151,7 @@ static const struct imx258_reg mipi_data_rate_640mbps[] = {
>  	{ 0x0823, 0x00 },
>  };
>
> -static const struct imx258_reg mode_4208x3120_regs[] = {
> +static const struct imx258_reg mode_common_regs[] = {
>  	{ 0x0136, 0x13 },
>  	{ 0x0137, 0x33 },
>  	{ 0x3051, 0x00 },
> @@ -216,27 +216,17 @@ static const struct imx258_reg mode_4208x3120_regs[] = {
>  	{ 0x0383, 0x01 },
>  	{ 0x0385, 0x01 },
>  	{ 0x0387, 0x01 },
> -	{ 0x0900, 0x00 },
> -	{ 0x0901, 0x11 },
> -	{ 0x0401, 0x00 },
>  	{ 0x0404, 0x00 },
> -	{ 0x0405, 0x10 },
>  	{ 0x0408, 0x00 },
>  	{ 0x0409, 0x00 },
>  	{ 0x040A, 0x00 },
>  	{ 0x040B, 0x00 },
>  	{ 0x040C, 0x10 },
>  	{ 0x040D, 0x70 },
> -	{ 0x040E, 0x0C },
> -	{ 0x040F, 0x30 },
>  	{ 0x3038, 0x00 },
>  	{ 0x303A, 0x00 },
>  	{ 0x303B, 0x10 },
>  	{ 0x300D, 0x00 },
> -	{ 0x034C, 0x10 },
> -	{ 0x034D, 0x70 },
> -	{ 0x034E, 0x0C },
> -	{ 0x034F, 0x30 },
>  	{ 0x0350, 0x01 },
>  	{ 0x0204, 0x00 },
>  	{ 0x0205, 0x00 },
> @@ -266,234 +256,43 @@ static const struct imx258_reg mode_4208x3120_regs[] = {
>  	{ 0x0220, 0x00 },
>  };
>
> +static const struct imx258_reg mode_4208x3120_regs[] = {
> +	{ 0x0900, 0x00 },
> +	{ 0x0901, 0x11 },
> +	{ 0x0401, 0x00 },
> +	{ 0x0405, 0x10 },
> +	{ 0x040E, 0x0C },
> +	{ 0x040F, 0x30 },
> +	{ 0x034C, 0x10 },
> +	{ 0x034D, 0x70 },
> +	{ 0x034E, 0x0C },
> +	{ 0x034F, 0x30 },
> +};
> +
>  static const struct imx258_reg mode_2104_1560_regs[] = {
> -	{ 0x0136, 0x13 },
> -	{ 0x0137, 0x33 },
> -	{ 0x3051, 0x00 },
> -	{ 0x3052, 0x00 },
> -	{ 0x4E21, 0x14 },
> -	{ 0x6B11, 0xCF },
> -	{ 0x7FF0, 0x08 },
> -	{ 0x7FF1, 0x0F },
> -	{ 0x7FF2, 0x08 },
> -	{ 0x7FF3, 0x1B },
> -	{ 0x7FF4, 0x23 },
> -	{ 0x7FF5, 0x60 },
> -	{ 0x7FF6, 0x00 },
> -	{ 0x7FF7, 0x01 },
> -	{ 0x7FF8, 0x00 },
> -	{ 0x7FF9, 0x78 },
> -	{ 0x7FFA, 0x00 },
> -	{ 0x7FFB, 0x00 },
> -	{ 0x7FFC, 0x00 },
> -	{ 0x7FFD, 0x00 },
> -	{ 0x7FFE, 0x00 },
> -	{ 0x7FFF, 0x03 },
> -	{ 0x7F76, 0x03 },
> -	{ 0x7F77, 0xFE },
> -	{ 0x7FA8, 0x03 },
> -	{ 0x7FA9, 0xFE },
> -	{ 0x7B24, 0x81 },
> -	{ 0x7B25, 0x00 },
> -	{ 0x6564, 0x07 },
> -	{ 0x6B0D, 0x41 },
> -	{ 0x653D, 0x04 },
> -	{ 0x6B05, 0x8C },
> -	{ 0x6B06, 0xF9 },
> -	{ 0x6B08, 0x65 },
> -	{ 0x6B09, 0xFC },
> -	{ 0x6B0A, 0xCF },
> -	{ 0x6B0B, 0xD2 },
> -	{ 0x6700, 0x0E },
> -	{ 0x6707, 0x0E },
> -	{ 0x9104, 0x00 },
> -	{ 0x4648, 0x7F },
> -	{ 0x7420, 0x00 },
> -	{ 0x7421, 0x1C },
> -	{ 0x7422, 0x00 },
> -	{ 0x7423, 0xD7 },
> -	{ 0x5F04, 0x00 },
> -	{ 0x5F05, 0xED },
> -	{ 0x0112, 0x0A },
> -	{ 0x0113, 0x0A },
> -	{ 0x0114, 0x03 },
> -	{ 0x0342, 0x14 },
> -	{ 0x0343, 0xE8 },
> -	{ 0x0344, 0x00 },
> -	{ 0x0345, 0x00 },
> -	{ 0x0346, 0x00 },
> -	{ 0x0347, 0x00 },
> -	{ 0x0348, 0x10 },
> -	{ 0x0349, 0x6F },
> -	{ 0x034A, 0x0C },
> -	{ 0x034B, 0x2F },
> -	{ 0x0381, 0x01 },
> -	{ 0x0383, 0x01 },
> -	{ 0x0385, 0x01 },
> -	{ 0x0387, 0x01 },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x12 },
>  	{ 0x0401, 0x01 },
> -	{ 0x0404, 0x00 },
>  	{ 0x0405, 0x20 },
> -	{ 0x0408, 0x00 },
> -	{ 0x0409, 0x00 },
> -	{ 0x040A, 0x00 },
> -	{ 0x040B, 0x00 },
> -	{ 0x040C, 0x10 },
> -	{ 0x040D, 0x70 },
>  	{ 0x040E, 0x06 },
>  	{ 0x040F, 0x18 },
> -	{ 0x3038, 0x00 },
> -	{ 0x303A, 0x00 },
> -	{ 0x303B, 0x10 },
> -	{ 0x300D, 0x00 },
>  	{ 0x034C, 0x08 },
>  	{ 0x034D, 0x38 },
>  	{ 0x034E, 0x06 },
>  	{ 0x034F, 0x18 },
> -	{ 0x0350, 0x01 },
> -	{ 0x0204, 0x00 },
> -	{ 0x0205, 0x00 },
> -	{ 0x020E, 0x01 },
> -	{ 0x020F, 0x00 },
> -	{ 0x0210, 0x01 },
> -	{ 0x0211, 0x00 },
> -	{ 0x0212, 0x01 },
> -	{ 0x0213, 0x00 },
> -	{ 0x0214, 0x01 },
> -	{ 0x0215, 0x00 },
> -	{ 0x7BCD, 0x01 },
> -	{ 0x94DC, 0x20 },
> -	{ 0x94DD, 0x20 },
> -	{ 0x94DE, 0x20 },
> -	{ 0x95DC, 0x20 },
> -	{ 0x95DD, 0x20 },
> -	{ 0x95DE, 0x20 },
> -	{ 0x7FB0, 0x00 },
> -	{ 0x9010, 0x3E },
> -	{ 0x9419, 0x50 },
> -	{ 0x941B, 0x50 },
> -	{ 0x9519, 0x50 },
> -	{ 0x951B, 0x50 },
> -	{ 0x3030, 0x00 },
> -	{ 0x3032, 0x00 },
> -	{ 0x0220, 0x00 },
>  };
>
>  static const struct imx258_reg mode_1048_780_regs[] = {
> -	{ 0x0136, 0x13 },
> -	{ 0x0137, 0x33 },
> -	{ 0x3051, 0x00 },
> -	{ 0x3052, 0x00 },
> -	{ 0x4E21, 0x14 },
> -	{ 0x6B11, 0xCF },
> -	{ 0x7FF0, 0x08 },
> -	{ 0x7FF1, 0x0F },
> -	{ 0x7FF2, 0x08 },
> -	{ 0x7FF3, 0x1B },
> -	{ 0x7FF4, 0x23 },
> -	{ 0x7FF5, 0x60 },
> -	{ 0x7FF6, 0x00 },
> -	{ 0x7FF7, 0x01 },
> -	{ 0x7FF8, 0x00 },
> -	{ 0x7FF9, 0x78 },
> -	{ 0x7FFA, 0x00 },
> -	{ 0x7FFB, 0x00 },
> -	{ 0x7FFC, 0x00 },
> -	{ 0x7FFD, 0x00 },
> -	{ 0x7FFE, 0x00 },
> -	{ 0x7FFF, 0x03 },
> -	{ 0x7F76, 0x03 },
> -	{ 0x7F77, 0xFE },
> -	{ 0x7FA8, 0x03 },
> -	{ 0x7FA9, 0xFE },
> -	{ 0x7B24, 0x81 },
> -	{ 0x7B25, 0x00 },
> -	{ 0x6564, 0x07 },
> -	{ 0x6B0D, 0x41 },
> -	{ 0x653D, 0x04 },
> -	{ 0x6B05, 0x8C },
> -	{ 0x6B06, 0xF9 },
> -	{ 0x6B08, 0x65 },
> -	{ 0x6B09, 0xFC },
> -	{ 0x6B0A, 0xCF },
> -	{ 0x6B0B, 0xD2 },
> -	{ 0x6700, 0x0E },
> -	{ 0x6707, 0x0E },
> -	{ 0x9104, 0x00 },
> -	{ 0x4648, 0x7F },
> -	{ 0x7420, 0x00 },
> -	{ 0x7421, 0x1C },
> -	{ 0x7422, 0x00 },
> -	{ 0x7423, 0xD7 },
> -	{ 0x5F04, 0x00 },
> -	{ 0x5F05, 0xED },
> -	{ 0x0112, 0x0A },
> -	{ 0x0113, 0x0A },
> -	{ 0x0114, 0x03 },
> -	{ 0x0342, 0x14 },
> -	{ 0x0343, 0xE8 },
> -	{ 0x0344, 0x00 },
> -	{ 0x0345, 0x00 },
> -	{ 0x0346, 0x00 },
> -	{ 0x0347, 0x00 },
> -	{ 0x0348, 0x10 },
> -	{ 0x0349, 0x6F },
> -	{ 0x034A, 0x0C },
> -	{ 0x034B, 0x2F },
> -	{ 0x0381, 0x01 },
> -	{ 0x0383, 0x01 },
> -	{ 0x0385, 0x01 },
> -	{ 0x0387, 0x01 },
>  	{ 0x0900, 0x01 },
>  	{ 0x0901, 0x14 },
>  	{ 0x0401, 0x01 },
> -	{ 0x0404, 0x00 },
>  	{ 0x0405, 0x40 },
> -	{ 0x0408, 0x00 },
> -	{ 0x0409, 0x00 },
> -	{ 0x040A, 0x00 },
> -	{ 0x040B, 0x00 },
> -	{ 0x040C, 0x10 },
> -	{ 0x040D, 0x70 },
>  	{ 0x040E, 0x03 },
>  	{ 0x040F, 0x0C },
> -	{ 0x3038, 0x00 },
> -	{ 0x303A, 0x00 },
> -	{ 0x303B, 0x10 },
> -	{ 0x300D, 0x00 },
>  	{ 0x034C, 0x04 },
>  	{ 0x034D, 0x18 },
>  	{ 0x034E, 0x03 },
>  	{ 0x034F, 0x0C },
> -	{ 0x0350, 0x01 },
> -	{ 0x0204, 0x00 },
> -	{ 0x0205, 0x00 },
> -	{ 0x020E, 0x01 },
> -	{ 0x020F, 0x00 },
> -	{ 0x0210, 0x01 },
> -	{ 0x0211, 0x00 },
> -	{ 0x0212, 0x01 },
> -	{ 0x0213, 0x00 },
> -	{ 0x0214, 0x01 },
> -	{ 0x0215, 0x00 },
> -	{ 0x7BCD, 0x00 },
> -	{ 0x94DC, 0x20 },
> -	{ 0x94DD, 0x20 },
> -	{ 0x94DE, 0x20 },
> -	{ 0x95DC, 0x20 },
> -	{ 0x95DD, 0x20 },
> -	{ 0x95DE, 0x20 },
> -	{ 0x7FB0, 0x00 },
> -	{ 0x9010, 0x3E },
> -	{ 0x9419, 0x50 },
> -	{ 0x941B, 0x50 },
> -	{ 0x9519, 0x50 },
> -	{ 0x951B, 0x50 },
> -	{ 0x3030, 0x00 },
> -	{ 0x3032, 0x00 },
> -	{ 0x0220, 0x00 },
>  };
>
>  static const char * const imx258_test_pattern_menu[] = {
> @@ -959,6 +758,13 @@ static int imx258_start_streaming(struct imx258 *imx258)
>  		return ret;
>  	}
>
> +	ret = imx258_write_regs(imx258, mode_common_regs,
> +				ARRAY_SIZE(mode_common_regs));
> +	if (ret) {
> +		dev_err(&client->dev, "%s failed to set common regs\n", __func__);
> +		return ret;
> +	}
> +
>  	/* Apply default values of current mode */
>  	reg_list = &imx258->cur_mode->reg_list;
>  	ret = imx258_write_regs(imx258, reg_list->regs, reg_list->num_of_regs);
> --
> 2.25.1
>
