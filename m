Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 232DD66C363
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 16:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbjAPPN1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 10:13:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjAPPNG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 10:13:06 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF313253F
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 07:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673881247; x=1705417247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gUSQ27e3b8A48rGuJUufQ9ZHS0q5jDzBwVYo6del8h4=;
  b=S7AVGm8xUTNrtAhyDwxJQSj2TEzkuYTMMxrqGuG8mP79s/H0KEVkIkOm
   4L0UUbc+X+eq2R/yGi1GR07Uz3PDTK4dkilooGXTQrmcdyt5eC3T6kuDK
   hgVSoGe0aD/puJGLC9lccPlusewuIjGbFKTkKXhL7EDjndtGJ8xIywTuJ
   SYUmAuc/yeczHBYxIyzpoeXuoy4sqgG+hWpvjjzkSY+LR365ojwPiVnTl
   cyswZtjJxmwWDjYC2KW0gilrhaaX3HEPEUofX+D6dm3PGyuPaGgwhrWQU
   KN+v+NUNtEkHQtInvEIh50b9Dsd5mVyF5bTFVc1KKtalqSeo5KQfk4AWt
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,221,1669071600"; 
   d="scan'208";a="28454905"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jan 2023 16:00:45 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 16 Jan 2023 16:00:45 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 16 Jan 2023 16:00:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673881245; x=1705417245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gUSQ27e3b8A48rGuJUufQ9ZHS0q5jDzBwVYo6del8h4=;
  b=jBnqtzEotfNHzqHBTvPjFDDjEDYjHk4JExYP9XD4GSzmBp9pFM97bR2l
   p41buELlLiTJ/OdoITI+SaTksZfTU71sqowz3eNfXV1cvID7C9jQ2Eviv
   NGsYeKar8/nI+wFuqZhIlQ1tW6fGDxxIlaVIpldBQl1qLLwxdm9XZMgod
   pJiKfu5JyDYCBAx7hctnHoIE0Rw1lXEDmRssst2w5XKe0r4dgQ0SV4AaL
   PQrVJsLzfzm4012NiqYMIo/GnQgyl7oiQpRo2q3vgbHup6m21ErabzkY+
   XMeu0gLAznmK2rYDy5qmOF61YhLDSvTUqHvuoJwuyjFHSUrIE5y/iMzlY
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,221,1669071600"; 
   d="scan'208";a="28454904"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jan 2023 16:00:45 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5F5F5280073;
        Mon, 16 Jan 2023 16:00:45 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 05/17] media: i2c: imx290: Pass format and mode to imx290_calc_pixel_rate()
Date:   Mon, 16 Jan 2023 16:00:45 +0100
Message-ID: <1817263.atdPhlSkOF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230116144454.1012-6-laurent.pinchart@ideasonboard.com>
References: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com> <20230116144454.1012-6-laurent.pinchart@ideasonboard.com>
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

Am Montag, 16. Januar 2023, 15:44:42 CET schrieb Laurent Pinchart:
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

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Changes since v2:
> 
> - Really drop format argument from imx290_calc_pixel_rate()
> 
> Changes since v1:
> 
> - Drop format argument from imx290_calc_pixel_rate()
> ---
>  drivers/media/i2c/imx290.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 4ad6eab4f2e2..25671ded7c2a 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -547,21 +547,14 @@ static int imx290_write_current_format(struct imx290
> *imx290) return 0;
>  }
> 
> -static s64 imx290_get_link_freq(struct imx290 *imx290)
> +static u64 imx290_calc_pixel_rate(struct imx290 *imx290,
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
> @@ -649,7 +642,7 @@ static void imx290_ctrl_update(struct imx290 *imx290,
> 
>  	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
>  	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
> -				 imx290_calc_pixel_rate(imx290));
> +				 imx290_calc_pixel_rate(imx290, 
mode));
> 
>  	__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
>  	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
> @@ -659,6 +652,7 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  {
>  	struct v4l2_fwnode_device_properties props;
>  	unsigned int blank;
> +	u64 pixel_rate;
>  	int ret;
> 
>  	ret = v4l2_fwnode_device_parse(imx290->dev, &props);
> @@ -696,10 +690,10 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	if (imx290->link_freq)
>  		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
> +	pixel_rate = imx290_calc_pixel_rate(imx290, imx290->current_mode);
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




