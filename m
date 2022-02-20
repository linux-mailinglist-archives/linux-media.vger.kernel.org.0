Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23F054BCE81
	for <lists+linux-media@lfdr.de>; Sun, 20 Feb 2022 13:52:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237761AbiBTMxK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Feb 2022 07:53:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbiBTMxK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Feb 2022 07:53:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3399344FF
        for <linux-media@vger.kernel.org>; Sun, 20 Feb 2022 04:52:47 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EECF525B;
        Sun, 20 Feb 2022 13:52:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645361566;
        bh=/xnNjEK3ycIZIFU0+W6v+0gk74yRGUS9uUxgEHgKr5s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G7yg1kh57uAnb7din+BwYKstJyipNO0jrxCMk4VksTzhq8zQwPBAZie551Bcx3z5w
         nwlm/MX4j72ezFnO7bDQ8VLg0EzeqSMuM4pqFuOC3mHZ9ElhqQlMnUbrVQPykKSmwe
         qpUgk9UpFsQSPp2Ps2/6NbaneoLOMwm1C3amAGp8=
Date:   Sun, 20 Feb 2022 14:52:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        Eugen.Hristev@microchip.com, jbrunet@baylibre.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 11/23] media: ov5640: Re-sort per-mode register tables
Message-ID: <YhI5lI+bA3aYPW/v@pendragon.ideasonboard.com>
References: <20220210110458.152494-1-jacopo@jmondi.org>
 <20220210110458.152494-12-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220210110458.152494-12-jacopo@jmondi.org>
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

On Thu, Feb 10, 2022 at 12:04:46PM +0100, Jacopo Mondi wrote:
> The per-mode register tables are not sorted by size. Fix it.
> 
> Cosmetic change only.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5640.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 72b78201f089..17835e71665a 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -462,7 +462,7 @@ static const struct reg_value ov5640_init_setting_30fps_VGA[] = {
>  	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300},
>  };
>  
> -static const struct reg_value ov5640_setting_VGA_640_480[] = {
> +static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> @@ -473,11 +473,10 @@ static const struct reg_value ov5640_setting_VGA_640_480[] = {
>  	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
>  	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
>  	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
> -	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
> -	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
> +	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
>  };
>  
> -static const struct reg_value ov5640_setting_XGA_1024_768[] = {
> +static const struct reg_value ov5640_setting_QCIF_176_144[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> @@ -507,7 +506,7 @@ static const struct reg_value ov5640_setting_QVGA_320_240[] = {
>  	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
>  };
>  
> -static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
> +static const struct reg_value ov5640_setting_VGA_640_480[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> @@ -518,10 +517,11 @@ static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
>  	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
>  	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
>  	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
> -	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
> +	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
> +	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
>  };
>  
> -static const struct reg_value ov5640_setting_QCIF_176_144[] = {
> +static const struct reg_value ov5640_setting_NTSC_720_480[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> @@ -536,7 +536,7 @@ static const struct reg_value ov5640_setting_QCIF_176_144[] = {
>  	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
>  };
>  
> -static const struct reg_value ov5640_setting_NTSC_720_480[] = {
> +static const struct reg_value ov5640_setting_PAL_720_576[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},
> @@ -551,7 +551,7 @@ static const struct reg_value ov5640_setting_NTSC_720_480[] = {
>  	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
>  };
>  
> -static const struct reg_value ov5640_setting_PAL_720_576[] = {
> +static const struct reg_value ov5640_setting_XGA_1024_768[] = {
>  	{0x3c07, 0x08, 0, 0},
>  	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>  	{0x3814, 0x31, 0, 0},

-- 
Regards,

Laurent Pinchart
