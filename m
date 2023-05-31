Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB317185C4
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 17:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbjEaPKc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 11:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234011AbjEaPK3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 11:10:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF7D598;
        Wed, 31 May 2023 08:10:27 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76C44844;
        Wed, 31 May 2023 17:10:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685545805;
        bh=Pj+fud+zQx0djUKYtMnKC56hdkFdqAjV6KqO+bOF1mo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dihtf1xYX56gtPaAfFkQOvYCIE94sbEu+WBPIpURcdkc5svcOQM7Ft+rBU7Z3xvZr
         3jZLiyUQJspDeAtUD8aKrGPBCHZ0Gydyp2Km9HcA3oGoRx4zkABCoMxejaCXzb1KwZ
         umL66SqIlrShB2RB6B2mI1KD+mRSj8nBKXXrVx/M=
Date:   Wed, 31 May 2023 17:10:23 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 04/21] media: i2c: imx258: Remove redundant I2C writes.
Message-ID: <zhie22vpttc45xfm532mddogf2bd4eb6mwnm3arbgokh3kdaoi@tloxo67omdu3>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-5-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-5-dave.stevenson@raspberrypi.com>
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

On Tue, May 30, 2023 at 06:29:43PM +0100, Dave Stevenson wrote:
> Registers 0x0202 and 0x0203 are written via the control handler
> for V4L2_CID_EXPOSURE, so are not needed from the mode lists.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/imx258.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index aabd5c3e8af9..b695fd987b71 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -237,8 +237,6 @@ static const struct imx258_reg mode_4208x3120_regs[] = {
>  	{ 0x034E, 0x0C },
>  	{ 0x034F, 0x30 },
>  	{ 0x0350, 0x01 },
> -	{ 0x0202, 0x0C },
> -	{ 0x0203, 0x46 },
>  	{ 0x0204, 0x00 },
>  	{ 0x0205, 0x00 },
>  	{ 0x020E, 0x01 },
> @@ -356,8 +354,6 @@ static const struct imx258_reg mode_2104_1560_regs[] = {
>  	{ 0x034E, 0x06 },
>  	{ 0x034F, 0x18 },
>  	{ 0x0350, 0x01 },
> -	{ 0x0202, 0x06 },
> -	{ 0x0203, 0x2E },
>  	{ 0x0204, 0x00 },
>  	{ 0x0205, 0x00 },
>  	{ 0x020E, 0x01 },
> @@ -475,8 +471,6 @@ static const struct imx258_reg mode_1048_780_regs[] = {
>  	{ 0x034E, 0x03 },
>  	{ 0x034F, 0x0C },
>  	{ 0x0350, 0x01 },
> -	{ 0x0202, 0x03 },
> -	{ 0x0203, 0x42 },
>  	{ 0x0204, 0x00 },
>  	{ 0x0205, 0x00 },
>  	{ 0x020E, 0x01 },
> --
> 2.25.1
>
