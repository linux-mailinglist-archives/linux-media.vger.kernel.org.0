Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4431E6351D1
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 09:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235939AbiKWID5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 03:03:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235604AbiKWIDy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 03:03:54 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B0717591
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 00:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669190633; x=1700726633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PSHDw6eiep/w4Yz10Epc2AYo8OBE+GhiEIUkxgp2pUQ=;
  b=UfC+yZqHXzhG/Cun0lFYaxcJ0YiSMdHTAk/AEANit/4FM1UeGg8jPOXb
   H7c5qoAWjY5j9E4YpDKllKJJqey182EpWjNJtiot+BL43BL4m0znkGOGF
   +deXxLUwjXNfMTA4PMtVDwkGLzTUFwoAZfWjq88RWKrewzetMc8/EfEzk
   92yxs8slNL1rtR5I5cRlmJxstLcNcJ+L8sZhEGKfdw7OOxRiBWd/d9OZA
   1rc/Tf0Icw79pDDouApMOp0KvF6xtmltzlv6eCAkG1ClxSXaAuu3ugtBl
   TEofyMe8R+212JctrmqBi9RuzEHPSk5GbD0kdIJGaXVDiBq4aY9vHFSKq
   w==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27526263"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Nov 2022 09:03:52 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 23 Nov 2022 09:03:52 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 23 Nov 2022 09:03:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669190632; x=1700726632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PSHDw6eiep/w4Yz10Epc2AYo8OBE+GhiEIUkxgp2pUQ=;
  b=bnogwibWQ/3tgpOw+CD4ZzH2hDdmB0QKgcGarnV5of8Hp9jfdyLiL1A+
   U/rmGChgzPrnYqIkSuEvVcuT63wZUvvP3L7SEvIEqzmJVv3yiM29rEsSk
   HXQdWbRFA7BWl1VI0lXUI6txNuGMFSTGeUu9/02iF+pYoB+tXS6qacgOf
   FnCF+MsTROJ+jSJwml9AG+YppT0RR87bpGAkOoP9pGZ3J7sSOmlGFDo8n
   /7TAOZCGqhwIqwBUKx78G8HlG3176ur71k3ZNOXyJqvIBD9q+sivgSqt2
   qiQ6XyS7nQAA5iQoom59LfTmEYooDDqbjhkUX5BZ6k9KwzY04RHoscQsn
   w==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27526262"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Nov 2022 09:03:51 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D2553280056;
        Wed, 23 Nov 2022 09:03:51 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 07/15] media: i2c: imx290: Factor out black level setting to a function
Date:   Wed, 23 Nov 2022 09:03:51 +0100
Message-ID: <10185704.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221122223250.21233-8-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com> <20221122223250.21233-8-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

thanks for working on this.

Am Dienstag, 22. November 2022, 23:32:42 CET schrieb Laurent Pinchart:
> The black level programmed in the BLKLEVEL register depends on the
> output format. The black level value computation is currently performed
> in imx290_set_ctrl(), in addition to having different black level values
> in the output-specific register value tables. Move it to a separate
> function to simplify the imx290_set_ctrl() code.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 53 +++++++++++++++++++++-----------------
>  1 file changed, 29 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 135ed55592a1..d9fc6c44b0f0 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -152,6 +152,9 @@
>  #define IMX290_PIXEL_ARRAY_RECORDING_WIDTH		1920
>  #define IMX290_PIXEL_ARRAY_RECORDING_HEIGHT		1080
> 
> +/* Equivalent value for 16bpp */
> +#define IMX290_BLACK_LEVEL_DEFAULT			3840
> +
>  #define IMX290_NUM_SUPPLIES				3
> 
>  struct imx290_regval {
> @@ -315,7 +318,6 @@ static const struct imx290_regval
> imx290_10bit_settings[] = { { IMX290_ADBIT2, IMX290_ADBIT2_10BIT },
>  	{ IMX290_ADBIT3, IMX290_ADBIT3_10BIT },
>  	{ IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW10 },
> -	{ IMX290_BLKLEVEL, 60 },
>  };
> 
>  static const struct imx290_regval imx290_12bit_settings[] = {
> @@ -325,7 +327,6 @@ static const struct imx290_regval
> imx290_12bit_settings[] = { { IMX290_ADBIT2, IMX290_ADBIT2_12BIT },
>  	{ IMX290_ADBIT3, IMX290_ADBIT3_12BIT },
>  	{ IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW12 },
> -	{ IMX290_BLKLEVEL, 240 },
>  };
> 
>  /* supported link frequencies */
> @@ -516,35 +517,43 @@ static int imx290_set_data_lanes(struct imx290
> *imx290) return ret;
>  }
> 
> +static int imx290_set_black_level(struct imx290 *imx290,
> +				  unsigned int black_level, int *err)
> +{
> +	return imx290_write(imx290, IMX290_BLKLEVEL,
> +			    black_level >> (16 - imx290->bpp), err);
> +}
> +
>  static int imx290_write_current_format(struct imx290 *imx290)
>  {
> +	const struct imx290_regval *regs;
> +	unsigned int num_regs;
> +	unsigned int bpp;
>  	int ret;
> 
>  	switch (imx290->current_format.code) {
>  	case MEDIA_BUS_FMT_SRGGB10_1X10:
> -		ret = imx290_set_register_array(imx290, 
imx290_10bit_settings,
> -						ARRAY_SIZE(
> -							
imx290_10bit_settings));
> -		if (ret < 0) {
> -			dev_err(imx290->dev, "Could not set format 
registers\n");
> -			return ret;
> -		}
> +		regs = imx290_10bit_settings;
> +		num_regs = ARRAY_SIZE(imx290_10bit_settings);
> +		bpp = 10;
>  		break;
>  	case MEDIA_BUS_FMT_SRGGB12_1X12:
> -		ret = imx290_set_register_array(imx290, 
imx290_12bit_settings,
> -						ARRAY_SIZE(
> -							
imx290_12bit_settings));
> -		if (ret < 0) {
> -			dev_err(imx290->dev, "Could not set format 
registers\n");
> -			return ret;
> -		}
> +		regs = imx290_12bit_settings;
> +		num_regs = ARRAY_SIZE(imx290_12bit_settings);
> +		bpp = 12;
>  		break;
>  	default:
>  		dev_err(imx290->dev, "Unknown pixel format\n");
>  		return -EINVAL;
>  	}
> 
> -	return 0;
> +	ret = imx290_set_register_array(imx290, regs, num_regs);
> +	if (ret < 0) {
> +		dev_err(imx290->dev, "Could not set format registers\n");
> +		return ret;
> +	}
> +
> +	return imx290_set_black_level(imx290, IMX290_BLACK_LEVEL_DEFAULT, 
&ret);
>  }
> 
>  /*
> ---------------------------------------------------------------------------
> - @@ -573,7 +582,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> 
>  	case V4L2_CID_TEST_PATTERN:
>  		if (ctrl->val) {
> -			imx290_write(imx290, IMX290_BLKLEVEL, 0, &ret);
> +			imx290_set_black_level(imx290, 0, &ret);
>  			usleep_range(10000, 11000);
>  			imx290_write(imx290, IMX290_PGCTRL,
>  				     (u8)(IMX290_PGCTRL_REGEN |
> @@ -582,12 +591,8 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  		} else {
>  			imx290_write(imx290, IMX290_PGCTRL, 0x00, &ret);
>  			usleep_range(10000, 11000);
> -			if (imx290->bpp == 10)
> -				imx290_write(imx290, IMX290_BLKLEVEL, 
0x3c,
> -					     &ret);
> -			else /* 12 bits per pixel */
> -				imx290_write(imx290, IMX290_BLKLEVEL, 
0xf0,
> -					     &ret);
> +			imx290_set_black_level(imx290, 
IMX290_BLACK_LEVEL_DEFAULT,
> +					       &ret);
>  		}
>  		break;
>  	default:

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>



