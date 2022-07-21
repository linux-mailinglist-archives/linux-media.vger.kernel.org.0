Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 156A857C877
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 12:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233001AbiGUKCB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 06:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232901AbiGUKBx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 06:01:53 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41AB17AB0
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 03:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658397712; x=1689933712;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p6A+D0TYnnGr9fPXH6cmhKsPgp0Yf4xlYxKSwZrzBX8=;
  b=CX7RjwS3w1nJ+mKvR0XEjmcXNh81saNhl7IURaeuLEPgKk2rQjuFjv05
   ejMtFZVzjds2R7mZY3yGxYSJlCo2aRwvmUwA4xD9o/UXeiISe/LPTXnFX
   2oL1VjpJ38MhaPCcEdnXunhWC5UfBdyl3rTxidkIxh/ADvXCh5QFx7ceO
   FnHUCuw25PCXBkYH0lRWYHH6Ao+LGwi+m3/ImxXWzWqGOgfWVwW+Oudpq
   0c87Il9ds5Z1w9BYF/x9b273sj1IRqNVZ5NwZ0fhWKrKLpJqv9vH7yLnY
   5zWwU49yihMWaU79AaCMj6IiYGEascwACUMKdsm0IpEL1fxYIEg82GbLT
   w==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25181181"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 12:01:50 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 12:01:50 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 12:01:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658397710; x=1689933710;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=p6A+D0TYnnGr9fPXH6cmhKsPgp0Yf4xlYxKSwZrzBX8=;
  b=TKvcuQBEVj/gakQpdZPWhlF5Fit5Mll0hs1fldBVYKpqHRnhc6B+ZICQ
   +lvGGlzz122lbzQVDGngYblDqGVY3EZb4L3sLttMSWHP5EMDoG+oKzofp
   c+jGNB8Y/vhU6AAOadduYUdNnZpR+RGafJlmby26tI3yRsqVpHFV57fFx
   eOKzeJWvWUqfQb9ibOHe64ltW3SzIT5GSKYBJJ7kBexgoHGAZAzRHyPyH
   RKXqc0UStk6mGmNRPWqxOxwQLdMxm/lDGYRIg/oiK//gggkODHq+VV1dL
   uWmcLfdhAzOPYEoBUodlCQNdw0EpyBj428XBr25Yfio9gx9q4lZFg/30a
   w==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25181179"
Subject: Re: [PATCH 11/19] media: i2c: imx290: Add exposure time control
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 12:01:50 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 052B2280056;
        Thu, 21 Jul 2022 12:01:50 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 12:01:49 +0200
Message-ID: <4121186.Lt9SDvczpP@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220721083540.1525-12-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-12-laurent.pinchart@ideasonboard.com>
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

Am Donnerstag, 21. Juli 2022, 10:35:32 CEST schrieb Laurent Pinchart:
> Support configuring the exposure time, which is expressed as the
> complement if the exposure time (frame period minus integration time).
> The frame period is currently fixed.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index bec326a83952..3cb024b73ee7 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -103,6 +103,8 @@
>  #define IMX290_PGCTRL_THRU				BIT(1)
>  #define IMX290_PGCTRL_MODE(n)				((n) << 4)
> 
> +#define IMX290_VMAX_DEFAULT				1125
> +
>  static const char * const imx290_supply_name[] = {
>  	"vdda",
>  	"vddd",
> @@ -176,7 +178,7 @@ static const char * const imx290_test_pattern_menu[] = {
> 
>  static const struct imx290_regval imx290_global_init_settings[] = {
>  	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
> -	{ IMX290_VMAX, 1125 },
> +	{ IMX290_VMAX, IMX290_VMAX_DEFAULT },
>  	{ IMX290_EXTCK_FREQ, 0x2520 },
>  	{ IMX290_WINWV_OB, 12 },
>  	{ IMX290_WINPH, 0 },
> @@ -480,6 +482,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_GAIN:
>  		ret = imx290_write(imx290, IMX290_GAIN, ctrl->val, 
NULL);
>  		break;
> +
> +	case V4L2_CID_EXPOSURE:
> +		ret = imx290_write(imx290, IMX290_SHS1,
> +				   IMX290_VMAX_DEFAULT - ctrl->val 
- 1, NULL);
> +		break;
> +
>  	case V4L2_CID_TEST_PATTERN:
>  		if (ctrl->val) {
>  			imx290_write(imx290, IMX290_BLKLEVEL, 0, 
&ret);
> @@ -1008,12 +1016,16 @@ static int imx290_probe(struct i2c_client *client)
>  	 */
>  	imx290_entity_init_cfg(&imx290->sd, NULL);
> 
> -	v4l2_ctrl_handler_init(&imx290->ctrls, 4);
> +	v4l2_ctrl_handler_init(&imx290->ctrls, 5);
>  	imx290->ctrls.lock = &imx290->lock;
> 
>  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
>  			  V4L2_CID_GAIN, 0, 72, 1, 0);
> 
> +	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> +			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 
2, 1,
> +			  IMX290_VMAX_DEFAULT - 2);
> +
>  	imx290->link_freq =
>  		v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
>  				       V4L2_CID_LINK_FREQ,


Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>



