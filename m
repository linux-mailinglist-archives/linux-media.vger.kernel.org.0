Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE736718581
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 17:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233815AbjEaPDD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 11:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233809AbjEaPDC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 11:03:02 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2153F129;
        Wed, 31 May 2023 08:02:54 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4917844;
        Wed, 31 May 2023 17:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685545351;
        bh=y2RgIDaGD9tHRXYAG1s8JFRKpxCHnOaKr5thSVAMxhQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wl1VVUjXwu/h1ji2ehHhmDr21xtd4dOWGB8T1R2Vj0Pb/VpmzWgxZQkiJ7TGA7K7S
         EW9uywz9ng9KWpGsIGA/h3h8ViNoOLonv96JETmIEooJ4PPmNVvRsfR546sClCiNeI
         Z8UXY/DziMcbl1Lj9TAwFwmI1gJUkqvXM0RS65dU=
Date:   Wed, 31 May 2023 17:02:49 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 03/21] media: i2c: imx258: Disable digital cropping on
 binned modes
Message-ID: <j7rh46mdcdyttxkygdstyed4ilcw4hljw6zxzkrmo5joaqlnzf@xmmk24qd4skd>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-4-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-4-dave.stevenson@raspberrypi.com>
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

On Tue, May 30, 2023 at 06:29:42PM +0100, Dave Stevenson wrote:
> The binned modes set DIG_CROP_X_OFFSET and DIG_CROP_IMAGE_WIDTH
> to less than the full image, even though the image being captured
> is meant to be a scaled version of the full array size.
>
> Reduce X_OFFSET to 0, and increase IMAGE_WIDTH to the full array.

Do I read it wrong that:

Digital crop is processed after image readout operation or in order of
[Analog crop -> Binning -> Digital crop]

Hence the digital crop output should be set to the frame output size
and not to the analog crop sizes ? In facts the DIG_CROP_IMAGE_HEIGHT
values match the frame output height.

>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx258.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 946b1a12971d..aabd5c3e8af9 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -340,11 +340,11 @@ static const struct imx258_reg mode_2104_1560_regs[] = {
>  	{ 0x0404, 0x00 },
>  	{ 0x0405, 0x20 },
>  	{ 0x0408, 0x00 },
> -	{ 0x0409, 0x02 },
> +	{ 0x0409, 0x00 },
>  	{ 0x040A, 0x00 },
>  	{ 0x040B, 0x00 },
>  	{ 0x040C, 0x10 },
> -	{ 0x040D, 0x6A },
> +	{ 0x040D, 0x70 },

DIG_CROP_IMAGE_WIDTH = 0x1070 = 4208

>  	{ 0x040E, 0x06 },
>  	{ 0x040F, 0x18 },

DIG_CROP_IMAGE_HEIGHT = 0x618 = 1560

>  	{ 0x3038, 0x00 },
> @@ -459,11 +459,11 @@ static const struct imx258_reg mode_1048_780_regs[] = {
>  	{ 0x0404, 0x00 },
>  	{ 0x0405, 0x40 },
>  	{ 0x0408, 0x00 },
> -	{ 0x0409, 0x06 },
> +	{ 0x0409, 0x00 },
>  	{ 0x040A, 0x00 },
>  	{ 0x040B, 0x00 },
>  	{ 0x040C, 0x10 },
> -	{ 0x040D, 0x64 },
> +	{ 0x040D, 0x70 },

DIG_CROP_IMAGE_WIDTH = 0x1070 = 4208

>  	{ 0x040E, 0x03 },
>  	{ 0x040F, 0x0C },

DIG_CROP_IMAGE_HEIGHT = 0x30c = 780

Should DIG_CROP_IMAGE_WIDTH be set to 2104 and 1048 respectively ?


>  	{ 0x3038, 0x00 },
> --
> 2.25.1
>
