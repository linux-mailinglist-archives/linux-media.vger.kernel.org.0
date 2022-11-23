Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCED635191
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 08:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236388AbiKWHxx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 02:53:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236382AbiKWHxh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 02:53:37 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED03FBA9F
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 23:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669189886; x=1700725886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wbY23NOohCxsbwTmylc0Na/TNqAMIW93f6Z0PkqEwAw=;
  b=dJGE9QZSdyt3ygymzfAPyvD7/neMmVUkyhUMYVH0gteYIXpZEnLJl+fp
   o2NuKZ4mUg5wPIokbJ9hbY6T15ntsadS7XBaLaSvK7TcI+UpGDCAEnneh
   g2sg87AS68s8q81MZYOUh0C0DjFXb0A11+7rGwMePwxQvpS1Ui1lPKSUU
   X5ReIuGKtbny1st/9+u8O6p22FLbrUKglcNyI+aSA52Nh/1RxmFI321tg
   Y2tl6yVnjAqGlxJ45HQUMjq/WBtcGH2ga3183MsKHXVQXCKR7p3RqMmqm
   bJuLl/KjzQKwJzI+7lj0KCjlwXn7h+VwckAABhV2DCSXAEs+w4o8XGxSd
   g==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27525593"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Nov 2022 08:51:25 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 23 Nov 2022 08:51:25 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 23 Nov 2022 08:51:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669189885; x=1700725885;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wbY23NOohCxsbwTmylc0Na/TNqAMIW93f6Z0PkqEwAw=;
  b=RJC9jwoOK5quaAX1GyTUEcspBkv923RnC5hRhkv+Fb5XDtIXH06eqLPx
   HCilyIVy5E9acMg9sYBZX6zyXbKmxeZiHkmlk6jr27QmyQ/Ie1tl0p9fA
   3BYEQ+ug4L4oay9KrU7sw6hu942/q/4ogGAxRc8xzNyEh8bmKXGj9SDTL
   0RrLsRlY2Jgxogh0JlEaSzct7X7dDFZBo1nAFl0lMm8sGMOTVJ0pqSTim
   YKo3lJnu/Lr/UMt51Lc5ffDE5HdgcHNXIB6893+MMXy7fE1NMBufqmV2K
   WlIi5uHFv/QnSObrGsxHC5BwxqgPwxPPGjtSidCeDkKIsIwjCQSD7yaow
   g==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27525592"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Nov 2022 08:51:24 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id CBBFA280056;
        Wed, 23 Nov 2022 08:51:24 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 03/15] media: i2c: imx290: Factor out control update code to a function
Date:   Wed, 23 Nov 2022 08:51:24 +0100
Message-ID: <4763239.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221122223250.21233-4-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com> <20221122223250.21233-4-laurent.pinchart@ideasonboard.com>
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

Am Dienstag, 22. November 2022, 23:32:38 CET schrieb Laurent Pinchart:
> Move the control update code to a separate function to group it with all
> the control-related code and make imx290_set_fmt() more readable.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 36 ++++++++++++++++--------------------
>  1 file changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 4dbf218e7a63..eb295502d0c3 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -639,6 +639,21 @@ static const char * const imx290_test_pattern_menu[] =
> { "000/555h Toggle Pattern",
>  };
> 
> +static void imx290_ctrl_update(struct imx290 *imx290,
> +			       const struct imx290_mode *mode)
> +{
> +	unsigned int hblank = mode->hmax - mode->width;
> +	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
> +
> +	__v4l2_ctrl_s_ctrl(imx290->link_freq,
> +			   imx290_get_link_freq_index(imx290));
> +	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
> +				 imx290_calc_pixel_rate(imx290));

I do not know the details, but I assume that imx290_ctrl_init already detects, 
using imx290->ctrls.error, if one of those controls have _not_ been created.
If so:
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> +
> +	__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
> +	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
> +}
> +
>  static int imx290_ctrl_init(struct imx290 *imx290)
>  {
>  	struct v4l2_fwnode_device_properties props;
> @@ -904,26 +919,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
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




