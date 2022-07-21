Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1A457C883
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 12:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbiGUKD5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 06:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232929AbiGUKDy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 06:03:54 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04622558C6
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 03:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658397832; x=1689933832;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hScrqDPj1sKa8Eppp19qtWR9KpdLT0V7K4L/afkMAT8=;
  b=XyOhk7FGULMnZMOY9sGwVTZbzLoKGgeB8FbIiFoUuHGYuM/aPJShQ4wz
   Ix9UygJSltI48s9cz9kPXb6QFsaoLZXgCRu8L44Zfq688iA/Lewi72/ye
   JStUpwWqWH0SzujTnkN0h33QT3QDmmY4amUnE9Z0yZ5CtotZhFT52SAQC
   PiT+hJLit/l8oFZnt5uUKRPTiP1Oge7lrW5kprXi/Rccg5L9p4cPSMx2g
   Jl1HC74HdZEoQmdDQjaXgCiY9dQzMSf12XVA8m+jqImJcHQY7a4QgQo/1
   csIM1KullU8yVVnk6G0CXEh1lhQhuCPckRxQICDC0909vzPOkMP37/j0E
   w==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25181266"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 12:03:50 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 12:03:50 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 12:03:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658397830; x=1689933830;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=hScrqDPj1sKa8Eppp19qtWR9KpdLT0V7K4L/afkMAT8=;
  b=oWPmXiaIutqBVL5EtwrMKG4kFpxer3rekCgyFSDFXFNZMILqnDHndXN3
   TQFXSPdmrcT9M3nrKfJaUZEkrJ63EKOk712Wd4ydCJSBAVXmNaXbHj26u
   rJYrg69XJ8L6V/wteaHgg1jQ0yts7YHQvW2a7FmRh4yL7eHW5vmnEM3fL
   xNI4yrz4LdfSSb1xI3yJnRDQrQtKSrCB9w9OdiTQLQUqWXUicZTiBNeEB
   H+oKS2eEmKX62WpPG2kToSe+2FvvnWtkBZBJSebfFxV/2st0Ezx/uiZK4
   3n2SBafgUMLoJ8IDl+Wa4YvVH0XBnvRUdw8grx4iX5Q3/wfn0vKqSszRw
   A==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25181265"
Subject: Re: [PATCH 13/19] media: i2c: imx290: Split control initialization to
 separate function
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 12:03:50 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 50C78280056;
        Thu, 21 Jul 2022 12:03:50 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 12:03:49 +0200
Message-ID: <5225605.MHq7AAxBmi@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220721083540.1525-14-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-14-laurent.pinchart@ideasonboard.com>
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

Am Donnerstag, 21. Juli 2022, 10:35:34 CEST schrieb Laurent Pinchart:
> The imx290_probe() function is too large. Split control initialzation to
> a dedicated function to increase code readability.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 83 ++++++++++++++++++++++----------------
>  1 file changed, 48 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 1bd464932432..4408dd3e191f 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -878,6 +878,49 @@ static const struct media_entity_operations
> imx290_subdev_entity_ops = { .link_validate = v4l2_subdev_link_validate,
>  };
> 
> +static int imx290_ctrl_init(struct imx290 *imx290)
> +{
> +	int ret;
> +
> +	v4l2_ctrl_handler_init(&imx290->ctrls, 5);
> +	imx290->ctrls.lock = &imx290->lock;
> +
> +	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> +			  V4L2_CID_GAIN, 0, 240, 1, 0);
> +
> +	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> +			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 
2, 1,
> +			  IMX290_VMAX_DEFAULT - 2);
> +
> +	imx290->link_freq =
> +		v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
> +				       V4L2_CID_LINK_FREQ,
> +				       
imx290_link_freqs_num(imx290) - 1, 0,
> +				       
imx290_link_freqs_ptr(imx290));
> +	if (imx290->link_freq)
> +		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, 
&imx290_ctrl_ops,
> +					       
V4L2_CID_PIXEL_RATE,
> +					       1, INT_MAX, 1,
> +					       
imx290_calc_pixel_rate(imx290));
> +
> +	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     
ARRAY_SIZE(imx290_test_pattern_menu) - 1,
> +				     0, 0, 
imx290_test_pattern_menu);
> +
> +	imx290->sd.ctrl_handler = &imx290->ctrls;
> +
> +	if (imx290->ctrls.error) {
> +		ret = imx290->ctrls.error;
> +		v4l2_ctrl_handler_free(&imx290->ctrls);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * Returns 0 if all link frequencies used by the driver for the given
> number * of MIPI data lanes are mentioned in the device tree, or the value
> of the @@ -1016,41 +1059,10 @@ static int imx290_probe(struct i2c_client
> *client) */
>  	imx290_entity_init_cfg(&imx290->sd, NULL);
> 
> -	v4l2_ctrl_handler_init(&imx290->ctrls, 5);
> -	imx290->ctrls.lock = &imx290->lock;
> -
> -	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -			  V4L2_CID_GAIN, 0, 240, 1, 0);
> -
> -	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 
2, 1,
> -			  IMX290_VMAX_DEFAULT - 2);
> -
> -	imx290->link_freq =
> -		v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
> -				       V4L2_CID_LINK_FREQ,
> -				       
imx290_link_freqs_num(imx290) - 1, 0,
> -				       
imx290_link_freqs_ptr(imx290));
> -	if (imx290->link_freq)
> -		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> -
> -	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, 
&imx290_ctrl_ops,
> -					       
V4L2_CID_PIXEL_RATE,
> -					       1, INT_MAX, 1,
> -					       
imx290_calc_pixel_rate(imx290));
> -
> -	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
> -				     V4L2_CID_TEST_PATTERN,
> -				     
ARRAY_SIZE(imx290_test_pattern_menu) - 1,
> -				     0, 0, 
imx290_test_pattern_menu);
> -
> -	imx290->sd.ctrl_handler = &imx290->ctrls;
> -
> -	if (imx290->ctrls.error) {
> -		dev_err(dev, "Control initialization error %d\n",
> -			imx290->ctrls.error);
> -		ret = imx290->ctrls.error;
> -		goto free_ctrl;
> +	ret = imx290_ctrl_init(imx290);
> +	if (ret < 0) {
> +		dev_err(dev, "Control initialization error %d\n", ret);
> +		goto free_mutex;
>  	}
> 
>  	v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
> @@ -1091,6 +1103,7 @@ static int imx290_probe(struct i2c_client *client)
>  	media_entity_cleanup(&imx290->sd.entity);
>  free_ctrl:
>  	v4l2_ctrl_handler_free(&imx290->ctrls);
> +free_mutex:
>  	mutex_destroy(&imx290->lock);
>  free_err:
>  	v4l2_fwnode_endpoint_free(&ep);

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>



