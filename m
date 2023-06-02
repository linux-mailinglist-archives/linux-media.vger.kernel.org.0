Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1296D720374
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 15:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235091AbjFBNdl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 09:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234594AbjFBNdl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 09:33:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA25E7;
        Fri,  2 Jun 2023 06:33:38 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B00427C;
        Fri,  2 Jun 2023 15:33:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685712795;
        bh=212PAKwwpUVxavqd0+trs4PdaFDGNRKTDGQOic3+F1Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F+M7pk+dmGtCj3cgpFp+vXiNtdV2JzGgNq06Uopkyggw9HP9Jb+fCDH0RqQppZaod
         RqyTXoTwadKozklPOM1baCmB28Rgds7EpsJGG1ccl/VpBYxIWWXEIEvvbfqhRNIyCR
         x5NAHje1n0up2ASuCowXUqc5PeVJ7ppERdCrwCJQ=
Date:   Fri, 2 Jun 2023 15:33:34 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 13/21] media: i2c: imx258: Correct max FRM_LENGTH_LINES
 value
Message-ID: <zkvn7f52qdwgybn7qzoluojhc3gnb2nabdcnggimucw2sh3fvd@hwak4v7gbx54>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-14-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-14-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 30, 2023 at 06:29:52PM +0100, Dave Stevenson wrote:
> The data sheet states that the maximum value for registers
> 0x0340/0x0341 FRM_LENGTH_LINES is 65525(decimal), not the
> 0xFFFF defined in this driver. Correct this limit.

It was close indeed :)
Good catch
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx258.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index b5c2dcb7c9e6..f5199e3243e8 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -28,7 +28,7 @@
>  #define IMX258_VTS_30FPS		0x0c50
>  #define IMX258_VTS_30FPS_2K		0x0638
>  #define IMX258_VTS_30FPS_VGA		0x034c
> -#define IMX258_VTS_MAX			0xffff
> +#define IMX258_VTS_MAX			65525
>
>  #define IMX258_REG_VTS			0x0340
>
> --
> 2.25.1
>
