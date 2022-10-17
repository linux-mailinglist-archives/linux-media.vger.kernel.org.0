Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C746600679
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 07:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbiJQFze (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 01:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbiJQFzc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 01:55:32 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E83EB26D5
        for <linux-media@vger.kernel.org>; Sun, 16 Oct 2022 22:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665986131; x=1697522131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kyxLLZw2+0qWNp+iSuhlbJDCy+9UPaksPz5OX8dM7Ak=;
  b=DALD4QaAs2Q+fn+yaHgczigKNKa59gu1hZXjJ6FzmZ67ZBJR/1EykrQP
   dsl3U3M0IuJsRPd38rK5YMw4xQUQclzJBoZ/ZTcEoLPxrQRQQqZT6p5Y8
   PZ+MuRK9MG0YsBAX0ANzr9uk1+BU/BLhza1u2zT1TVBSnh7dOMoI8rmt8
   ABZJBiWi+Id0PKiJJO2Pa3fHSBst+XS9kN2LM0zbdtJPJSvoKjMgCdLjO
   AhO3m1SNbRmCfKPrq6IP/3WGgjdLipBazM6v7tLQB6H42BbMP9VgRsASn
   UfvvEEenfNy6Fm7HuPyIMOpW39r1epbh0ZAO7VqTWFnn/gGoDNxE683GW
   g==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661810400"; 
   d="scan'208";a="26776202"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 17 Oct 2022 07:55:29 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 17 Oct 2022 07:55:29 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 17 Oct 2022 07:55:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665986129; x=1697522129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kyxLLZw2+0qWNp+iSuhlbJDCy+9UPaksPz5OX8dM7Ak=;
  b=VXYJwsRp6Jay8/zdwUqYvev9z0cIiJbhQtlpBGQAWKs3IHqSdrH/supS
   oAMzxZO6ZrhsHn+1hNT2YpMHtGdcDU2ZhCf+2ExPgioOsG7EQSFIe/iG9
   WW4usBzih+oswXcn9GZf28EWDDcvgcMlkicDb7wzOjJqQDTFIAAgDV/GR
   tkSJQJEx2ycDfRRW4jR+Q7Ez9JUis+ODiWsa7e5lQllb2UbxFFw2X9Qbo
   q4sn9dhh1RJjvSVkaVLinLwL9M3FVQ1gxQl7MGhK+tsBBkc/y+FFwRK5/
   j7HSOXDITWmVvEisPSn0drty6mRQbmJf0MKyct591OCNMBMC6Saif0stW
   w==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661810400"; 
   d="scan'208";a="26776201"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Oct 2022 07:55:29 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5D32A280056;
        Mon, 17 Oct 2022 07:55:29 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 18/20] media: i2c: imx290: Factor out format retrieval to separate function
Date:   Mon, 17 Oct 2022 07:55:28 +0200
Message-ID: <5869053.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221016061523.30127-19-laurent.pinchart@ideasonboard.com>
References: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com> <20221016061523.30127-19-laurent.pinchart@ideasonboard.com>
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

thanks for the updated patch.

Am Sonntag, 16. Oktober 2022, 08:15:21 CEST schrieb Laurent Pinchart:
> The driver duplicates the same pattern to access the try or active
> format in multiple locations. Factor it out to a separate function.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Avoid returning NULL from imx290_get_pad_format()
> ---
>  drivers/media/i2c/imx290.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 0b34d60f8ce2..b0ff0e8ed45a 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -519,6 +519,16 @@ static const struct v4l2_ctrl_ops imx290_ctrl_ops = {
>  	.s_ctrl = imx290_set_ctrl,
>  };
> 
> +static struct v4l2_mbus_framefmt *
> +imx290_get_pad_format(struct imx290 *imx290, struct v4l2_subdev_state
> *state, +		      u32 which)
> +{
> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
> +		return &imx290->current_format;
> +	else
> +		return v4l2_subdev_get_try_format(&imx290->sd, state, 
0);
> +}
> +

v4l2_subdev_get_try_format can return NULL, which would be dereferenced later 
on. But this happens only if state is NULL itself, which will raise a WARN_ON 
anyway. So i guess this is fine.

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

>  static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state 
*sd_state,
>  				 struct v4l2_subdev_mbus_code_enum 
*code)
> @@ -562,12 +572,7 @@ static int imx290_get_fmt(struct v4l2_subdev *sd,
> 
>  	mutex_lock(&imx290->lock);
> 
> -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> -		framefmt = v4l2_subdev_get_try_format(&imx290->sd, 
sd_state,
> -						      fmt-
>pad);
> -	else
> -		framefmt = &imx290->current_format;
> -
> +	framefmt = imx290_get_pad_format(imx290, sd_state, fmt->which);
>  	fmt->format = *framefmt;
> 
>  	mutex_unlock(&imx290->lock);
> @@ -627,10 +632,9 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
>  	fmt->format.code = imx290_formats[i].code;
>  	fmt->format.field = V4L2_FIELD_NONE;
> 
> -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		format = v4l2_subdev_get_try_format(sd, sd_state, fmt-
>pad);
> -	} else {
> -		format = &imx290->current_format;
> +	format = imx290_get_pad_format(imx290, sd_state, fmt->which);
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		imx290->current_mode = mode;
>  		imx290->bpp = imx290_formats[i].bpp;




