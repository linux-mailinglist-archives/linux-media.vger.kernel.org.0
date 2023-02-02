Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE2F68803C
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 15:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232443AbjBBOgT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 09:36:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232498AbjBBOgN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 09:36:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6158E1BAF1
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 06:36:07 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 778FA505;
        Thu,  2 Feb 2023 15:36:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675348565;
        bh=rzarx/O8SwzwQIifkUrdckEgU4UnN154jI+NY+H+d38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FFxcsPaTyEKcKE9b/vplRC+pDJfj2KQA5rdZvOo90bM6Q8tVi7WFTgq9j6A9ZLDdh
         p4uziD5MLrc77SnJArFQVLq2lq/AglOQcLU1QagkfwGtWdeCA/x6AU7NYHHYPZkSx/
         qDq4iNODgi88DZP2lnMNyc7Ae6xyO68zUdi1PA5A=
Date:   Thu, 2 Feb 2023 16:36:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 06/11] media: i2c: imx290: Use CSI timings as per
 datasheet
Message-ID: <Y9vKU8Z29VO9QOAf@pendragon.ideasonboard.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-7-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230131192016.3476937-7-dave.stevenson@raspberrypi.com>
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

On Tue, Jan 31, 2023 at 07:20:11PM +0000, Dave Stevenson wrote:
> Commit "98e0500eadb7 media: i2c: imx290: Add configurable link frequency
> and pixel rate" added support for the increased link frequencies
> on 2 data lanes, but didn't update the CSI timing registers in
> accordance with the datasheet.
> 
> Use the specified settings.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx290.c | 126 +++++++++++++++++++++++++++++++------
>  1 file changed, 106 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 6bcfa535872f..9ddd6382b127 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -174,6 +174,18 @@ struct imx290_mode {
>  	u32 data_size;
>  };
>  
> +struct imx290_csi_cfg {
> +	u16 repitition;

s/repitition/repetition/

I wonder what this it.

> +	u16 tclkpost;
> +	u16 thszero;
> +	u16 thsprepare;
> +	u16 tclktrail;
> +	u16 thstrail;
> +	u16 tclkzero;
> +	u16 tclkprepare;
> +	u16 tlpx;
> +};
> +
>  struct imx290 {
>  	struct device *dev;
>  	struct clk *xclk;
> @@ -273,16 +285,6 @@ static const struct imx290_regval imx290_1080p_settings[] = {
>  	{ IMX290_INCKSEL4, 0x01 },
>  	{ IMX290_INCKSEL5, 0x1a },
>  	{ IMX290_INCKSEL6, 0x1a },
> -	/* data rate settings */
> -	{ IMX290_REPETITION, 0x10 },
> -	{ IMX290_TCLKPOST, 87 },
> -	{ IMX290_THSZERO, 55 },
> -	{ IMX290_THSPREPARE, 31 },
> -	{ IMX290_TCLKTRAIL, 31 },
> -	{ IMX290_THSTRAIL, 31 },
> -	{ IMX290_TCLKZERO, 119 },
> -	{ IMX290_TCLKPREPARE, 31 },
> -	{ IMX290_TLPX, 23 },
>  };
>  
>  static const struct imx290_regval imx290_720p_settings[] = {
> @@ -298,16 +300,6 @@ static const struct imx290_regval imx290_720p_settings[] = {
>  	{ IMX290_INCKSEL4, 0x01 },
>  	{ IMX290_INCKSEL5, 0x1a },
>  	{ IMX290_INCKSEL6, 0x1a },
> -	/* data rate settings */
> -	{ IMX290_REPETITION, 0x10 },
> -	{ IMX290_TCLKPOST, 79 },
> -	{ IMX290_THSZERO, 47 },
> -	{ IMX290_THSPREPARE, 23 },
> -	{ IMX290_TCLKTRAIL, 23 },
> -	{ IMX290_THSTRAIL, 23 },
> -	{ IMX290_TCLKZERO, 87 },
> -	{ IMX290_TCLKPREPARE, 23 },
> -	{ IMX290_TLPX, 23 },
>  };
>  
>  static const struct imx290_regval imx290_10bit_settings[] = {
> @@ -328,6 +320,58 @@ static const struct imx290_regval imx290_12bit_settings[] = {
>  	{ IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW12 },
>  };
>  
> +static const struct imx290_csi_cfg imx290_csi_222_75mhz = {
> +	/* 222.25MHz or 445.5Mbit/s per lane */
> +	.repitition = 0x10,
> +	.tclkpost = 87,
> +	.thszero = 55,
> +	.thsprepare = 31,
> +	.tclktrail = 31,
> +	.thstrail = 31,
> +	.tclkzero = 119,
> +	.tclkprepare = 31,
> +	.tlpx = 23,
> +};
> +
> +static const struct imx290_csi_cfg imx290_csi_445_5mhz = {
> +	/* 445.5MHz or 891Mbit/s per lane */
> +	.repitition = 0x00,
> +	.tclkpost = 119,
> +	.thszero = 103,
> +	.thsprepare = 71,
> +	.tclktrail = 55,
> +	.thstrail = 63,
> +	.tclkzero = 255,
> +	.tclkprepare = 63,
> +	.tlpx = 55,
> +};
> +
> +static const struct imx290_csi_cfg imx290_csi_148_5mhz = {
> +	/* 148.5MHz or 297Mbit/s per lane */
> +	.repitition = 0x10,
> +	.tclkpost = 79,
> +	.thszero = 47,
> +	.thsprepare = 23,
> +	.tclktrail = 23,
> +	.thstrail = 23,
> +	.tclkzero = 87,
> +	.tclkprepare = 23,
> +	.tlpx = 23,
> +};
> +
> +static const struct imx290_csi_cfg imx290_csi_297mhz = {
> +	/* 297MHz or 594Mbit/s per lane */
> +	.repitition = 0x00,
> +	.tclkpost = 103,
> +	.thszero = 87,
> +	.thsprepare = 47,
> +	.tclktrail = 39,
> +	.thstrail = 47,
> +	.tclkzero = 191,
> +	.tclkprepare = 47,
> +	.tlpx = 39,
> +};
> +
>  /* supported link frequencies */
>  #define FREQ_INDEX_1080P	0
>  #define FREQ_INDEX_720P		1
> @@ -536,6 +580,42 @@ static int imx290_set_black_level(struct imx290 *imx290,
>  			    black_level >> (16 - bpp), err);
>  }
>  
> +static int imx290_set_csi_config(struct imx290 *imx290)
> +{
> +	const s64 *link_freqs = imx290_link_freqs_ptr(imx290);
> +	const struct imx290_csi_cfg *csi_cfg;
> +	int ret = 0;
> +
> +	switch (link_freqs[imx290->current_mode->link_freq_index]) {
> +	case 445500000:
> +		csi_cfg = &imx290_csi_445_5mhz;
> +		break;
> +	case 297000000:
> +		csi_cfg = &imx290_csi_297mhz;
> +		break;
> +	case 222750000:
> +		csi_cfg = &imx290_csi_222_75mhz;
> +		break;
> +	case 148500000:
> +		csi_cfg = &imx290_csi_148_5mhz;
> +		break;

There's probably a way to rework the link_freqs arrays and FREQ_INDEX_*
macros to simplify the constructs and avoid a switch based on the
frequency value, but that can also be done later.

> +	default:
> +		return -EINVAL;
> +	}
> +
> +	imx290_write(imx290, IMX290_REPETITION, csi_cfg->repitition, &ret);
> +	imx290_write(imx290, IMX290_TCLKPOST, csi_cfg->tclkpost, &ret);
> +	imx290_write(imx290, IMX290_THSZERO, csi_cfg->thszero, &ret);
> +	imx290_write(imx290, IMX290_THSPREPARE, csi_cfg->thsprepare, &ret);
> +	imx290_write(imx290, IMX290_TCLKTRAIL, csi_cfg->tclktrail, &ret);
> +	imx290_write(imx290, IMX290_THSTRAIL, csi_cfg->thstrail, &ret);
> +	imx290_write(imx290, IMX290_TCLKZERO, csi_cfg->tclkzero, &ret);
> +	imx290_write(imx290, IMX290_TCLKPREPARE, csi_cfg->tclkprepare, &ret);
> +	imx290_write(imx290, IMX290_TLPX, csi_cfg->tlpx, &ret);
> +
> +	return ret;
> +}
> +
>  static int imx290_setup_format(struct imx290 *imx290,
>  			       const struct v4l2_mbus_framefmt *format)
>  {
> @@ -748,6 +828,12 @@ static int imx290_start_streaming(struct imx290 *imx290,
>  		return ret;
>  	}
>  
> +	ret = imx290_set_csi_config(imx290);
> +	if (ret < 0) {
> +		dev_err(imx290->dev, "Could not set csi cfg\n");

Maybe adding the error code to the message ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		return ret;
> +	}
> +
>  	/* Apply the register values related to current frame format */
>  	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
>  	ret = imx290_setup_format(imx290, format);

-- 
Regards,

Laurent Pinchart
