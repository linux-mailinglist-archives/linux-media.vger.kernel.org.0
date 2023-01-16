Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2DAE66BA26
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 10:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbjAPJUu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 04:20:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232109AbjAPJUo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 04:20:44 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C62B144B7
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 01:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673860843; x=1705396843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wcLl7s8W8ZbopTUUHZWTMM52AOmfAfWwMxzT5PHxl/E=;
  b=mhKDQ86A1Ufv2uUg+7D9ulDkcu4qf+8YNv0KbfGqfx2cWTfpS48QooUc
   0+LaEo2k8AvRGUhYrgL1BQb9OUUG86PwQikb7XzgO6mS/Q6vq7Dr/A5GP
   eoBxeDajXkCTIwA4nBqGGz3xJ2ZHUefeW4CLaNvpSw6b7YuHJugeYoz2/
   rQg9POPVxk4nP632+IDibzJJ1PfGZT0/AC16diyuc0U8J2TWoAU3Itq6P
   CKVKBWkKz3XQmcD94qhs6vXYog1mi0ti6LXLfHThRuOYl8BHzFACRb77f
   Mp4dzz9gavBd7ju1pFmRABZM9lvHYPCRawOHNUYal5zk1P3mrQZNW969d
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,220,1669071600"; 
   d="scan'208";a="28442956"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jan 2023 10:20:41 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 16 Jan 2023 10:20:41 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 16 Jan 2023 10:20:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673860841; x=1705396841;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wcLl7s8W8ZbopTUUHZWTMM52AOmfAfWwMxzT5PHxl/E=;
  b=HBnz1o+PsYso/pknuB4SgGRAGWlCSziMUH2wagKFCLbS//kRzIMjRCAn
   8olGxQmyT9lhYRn9fDzehrhV6LzMkNpcuqAO8vOqZOhIfHLVCcqjjkG8C
   qYidKSHOkji2m+7YBtkzUneuZnciUSQzmRqmULLiEgN/hYUU9U+bG2n0E
   J4TnLR3Bs+IKkRNovpu7aYFV9HUJAMQsudZ2dNsXWhELVin04ky9zLhQv
   PLzGaEk/TnlgmK3hW2N7LoXWM2zwcw70TfCOTlRRxZ5oEIexd0TmcIXaE
   apo5d698gmrHq7egZfHd7CafitKvKsJsLJSKiJnXOhh9PKPsIWgzQZYL+
   g==;
X-IronPort-AV: E=Sophos;i="5.97,220,1669071600"; 
   d="scan'208";a="28442955"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jan 2023 10:20:41 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 66706280056;
        Mon, 16 Jan 2023 10:20:41 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 03/17] media: i2c: imx290: Factor out control update code to a function
Date:   Mon, 16 Jan 2023 10:20:41 +0100
Message-ID: <2132591.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230114171802.13878-3-laurent.pinchart@ideasonboard.com>
References: <20230114171727.13830-1-laurent.pinchart@ideasonboard.com> <20230114171802.13878-1-laurent.pinchart@ideasonboard.com> <20230114171802.13878-3-laurent.pinchart@ideasonboard.com>
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

Hi Laurent,

thanks for the update.

Am Samstag, 14. Januar 2023, 18:17:48 CET schrieb Laurent Pinchart:
> Move the control update code to a separate function to group it with all
> the control-related code and make imx290_set_fmt() more readable.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Correctly handle the case where imx290_ctrl_update() gets called
>   before controls are initialized

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/media/i2c/imx290.c | 43 ++++++++++++++++++++------------------
>  1 file changed, 23 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 5529bd39238f..991e7285c40c 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -639,6 +639,28 @@ static const char * const imx290_test_pattern_menu[] =
> { "000/555h Toggle Pattern",
>  };
> 
> +static void imx290_ctrl_update(struct imx290 *imx290,
> +			       const struct imx290_mode *mode)
> +{
> +	unsigned int hblank = mode->hmax - mode->width;
> +	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
> +
> +	/*
> +	 * This function may be called from imx290_set_fmt() before controls
> +	 * get created by imx290_ctrl_init(). Return immediately in that 
case.
> +	 */
> +	if (!imx290->ctrls.lock)
> +		return;
> +
> +	__v4l2_ctrl_s_ctrl(imx290->link_freq,
> +			   imx290_get_link_freq_index(imx290));
> +	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
> +				 imx290_calc_pixel_rate(imx290));
> +
> +	__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
> +	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
> +}
> +
>  static int imx290_ctrl_init(struct imx290 *imx290)
>  {
>  	struct v4l2_fwnode_device_properties props;
> @@ -904,26 +926,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
>  		imx290->current_mode = mode;
>  		imx290->bpp = imx290_formats[i].bpp;
> 
> -		if (imx290->link_freq)
> -			__v4l2_ctrl_s_ctrl(imx290->link_freq,
> -					   
imx290_get_link_freq_index(imx290));
> -		if (imx290->pixel_rate)
> -			__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
> -						 
imx290_calc_pixel_rate(imx290));
> -
> -		if (imx290->hblank) {
> -			unsigned int hblank = mode->hmax - mode->width;
> -
> -			__v4l2_ctrl_modify_range(imx290->hblank, hblank, 
hblank,
> -						 1, hblank);
> -		}
> -
> -		if (imx290->vblank) {
> -			unsigned int vblank = IMX290_VMAX_DEFAULT - 
mode->height;
> -
> -			__v4l2_ctrl_modify_range(imx290->vblank, vblank, 
vblank,
> -						 1, vblank);
> -		}
> +		imx290_ctrl_update(imx290, mode);
>  	}
> 
>  	*format = fmt->format;




