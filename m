Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 253FB66BB9D
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 11:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbjAPKW7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 05:22:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbjAPKWw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 05:22:52 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2425A12847
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 02:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673864571; x=1705400571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NUP5fnyNj1np4jPJaZ3S4gga5XVVIi1dS4qfOdAmhXk=;
  b=JtGLnD+IDJRCvRXcI41imO/g/a4Pj4KswcHwjoDYllJOnZQR06hy0XdS
   6C5wRpgBnyRWVvepijlj/Y8TTpqzKyBHUpKHnCz0z+i7dONiGWpp16k/S
   wKyxE5uKmIfQuXlts32OHwESgrWoGjriezmm0hHgFZjpdeSyPXSRf3LWw
   P9u39Szx1p4s8EaxAtcYzg6M4MIKAI0OVi0hsnq1kFYtUVJoHqGv3XZNS
   5k1D6q/tmUdXBX0Wkz0TOA+bc+nv6sMikhmqnm5csfcY5ss/4ZBJPreKY
   KzkZq6zjVBGiwOa63mriYZ9qnJgOaJ41BSqsin479wamKXi3rktdip1I+
   g==;
X-IronPort-AV: E=Sophos;i="5.97,220,1669071600"; 
   d="scan'208";a="28445519"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jan 2023 11:22:49 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 16 Jan 2023 11:22:49 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 16 Jan 2023 11:22:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673864569; x=1705400569;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NUP5fnyNj1np4jPJaZ3S4gga5XVVIi1dS4qfOdAmhXk=;
  b=UF+BfciEueW30R/DUnLahVEPLZZ7Sym2KcR2aERnUoXaAzq4hoV4hxZx
   Zvnj5BdIVcpO8MCzPkVisymPy3xGTxrTJOYJPEZPxUeCgXV9A44HaxM/P
   t7r1Fm/75bFUaj3jKUSsWIO9FICBSjHyRUJ40TieUVilf83l75OS7NwX4
   k63CFH4fKVs11eWCPOvZXhTk3rOz/dfI0doyS6Aiv+utK8oTnYUf9j6ow
   QLnWPjKrYiXal9q1ime1i1GZfYDa98vD9WhFngz9cZZnCINyO+wMSH492
   sCCGTq70luRaKFlV6CC7y+Yyy1yv3ctmqWn3Q0ZmGfojN5uy0qNnM6nNv
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,220,1669071600"; 
   d="scan'208";a="28445518"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jan 2023 11:22:49 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B3C69280056;
        Mon, 16 Jan 2023 11:22:48 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 05/17] media: i2c: imx290: Pass format and mode to imx290_calc_pixel_rate()
Date:   Mon, 16 Jan 2023 11:22:49 +0100
Message-ID: <2867010.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230114171802.13878-5-laurent.pinchart@ideasonboard.com>
References: <20230114171727.13830-1-laurent.pinchart@ideasonboard.com> <20230114171802.13878-1-laurent.pinchart@ideasonboard.com> <20230114171802.13878-5-laurent.pinchart@ideasonboard.com>
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

Am Samstag, 14. Januar 2023, 18:17:50 CET schrieb Laurent Pinchart:
> Avoid accessing the imx290 current_format and current_mode fields in
> imx290_calc_pixel_rate() to prepare for the removal of those fields.
> Among the two callers of the function, imx290_ctrl_update() has an
> explicit mode pointer already, and we can also give it a format pointer.
> Use those explicitly.
> 
> While at it, inline the imx290_get_link_freq() function in
> imx290_calc_pixel_rate() as it is only called there.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Drop format argument from imx290_calc_pixel_rate()
> ---
>  drivers/media/i2c/imx290.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 4ad6eab4f2e2..8f141df74e2f 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -547,21 +547,15 @@ static int imx290_write_current_format(struct imx290
> *imx290) return 0;
>  }
> 
> -static s64 imx290_get_link_freq(struct imx290 *imx290)
> +static u64 imx290_calc_pixel_rate(struct imx290 *imx290,
> +				  const struct v4l2_mbus_framefmt 
*format,

Maybe some mishap, but the format parameter is still here.
Otherwise:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> +				  const struct imx290_mode *mode)
>  {
> -	u8 index = imx290->current_mode->link_freq_index;
> -
> -	return *(imx290_link_freqs_ptr(imx290) + index);
> -}
> -
> -static u64 imx290_calc_pixel_rate(struct imx290 *imx290)
> -{
> -	s64 link_freq = imx290_get_link_freq(imx290);
> -	u8 nlanes = imx290->nlanes;
> +	s64 link_freq = imx290_link_freqs_ptr(imx290)[mode-
>link_freq_index];
>  	u64 pixel_rate;
> 
>  	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
> -	pixel_rate = link_freq * 2 * nlanes;
> +	pixel_rate = link_freq * 2 * imx290->nlanes;
>  	do_div(pixel_rate, imx290->bpp);
>  	return pixel_rate;
>  }
> @@ -635,6 +629,7 @@ static const char * const imx290_test_pattern_menu[] = {
> };
> 
>  static void imx290_ctrl_update(struct imx290 *imx290,
> +			       const struct v4l2_mbus_framefmt *format,
>  			       const struct imx290_mode *mode)
>  {
>  	unsigned int hblank = mode->hmax - mode->width;
> @@ -649,7 +644,7 @@ static void imx290_ctrl_update(struct imx290 *imx290,
> 
>  	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
>  	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
> -				 imx290_calc_pixel_rate(imx290));
> +				 imx290_calc_pixel_rate(imx290, 
format, mode));
> 
>  	__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
>  	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
> @@ -659,6 +654,7 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  {
>  	struct v4l2_fwnode_device_properties props;
>  	unsigned int blank;
> +	u64 pixel_rate;
>  	int ret;
> 
>  	ret = v4l2_fwnode_device_parse(imx290->dev, &props);
> @@ -696,10 +692,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	if (imx290->link_freq)
>  		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
> +	pixel_rate = imx290_calc_pixel_rate(imx290, &imx290->current_format,
> +					    imx290->current_mode);
>  	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, 
&imx290_ctrl_ops,
>  					       V4L2_CID_PIXEL_RATE,
> -					       1, INT_MAX, 1,
> -					       
imx290_calc_pixel_rate(imx290));
> +					       1, INT_MAX, 1, 
pixel_rate);
> 
>  	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
>  				     V4L2_CID_TEST_PATTERN,
> @@ -920,7 +917,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
>  		imx290->current_mode = mode;
>  		imx290->bpp = imx290_formats[i].bpp;
> 
> -		imx290_ctrl_update(imx290, mode);
> +		imx290_ctrl_update(imx290, &fmt->format, mode);
>  	}
> 
>  	*format = fmt->format;




