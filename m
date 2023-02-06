Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91B4568B753
	for <lists+linux-media@lfdr.de>; Mon,  6 Feb 2023 09:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjBFI1U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 03:27:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjBFI1T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 03:27:19 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71582166C5
        for <linux-media@vger.kernel.org>; Mon,  6 Feb 2023 00:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675672038; x=1707208038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ponrst4k/KDG8BgSoJoIr6qTQB7NPBgfogOr1eTCQvU=;
  b=VKqtGy013zO8/U1+CBoylVU5WBaxkmbF3qQ3gR21F1sYkkqRlj6K4NVr
   O6A0vkrEMlmf2mc/0kfjNVvZnM03/UoTvEdM+8aDpptnbCRPMIbXUixml
   CaY8ufVP3ywquT0DNESDz3/XVyL2EvRLCB6dJ+3KF4sAWYq2sgpI7uthN
   SLuEbt/+r/tg+hBUeKJXCzQG6p7GkEv3l9gpqyha01wwfgQO98CeU85ok
   xBuFc4zDq420lZl92X59yGt2tU1U4Aa0VrSKQRxuL42nC3SBFsPfnbGeL
   jnWPgfHaTRwDYMhKx93xXpmcnTyn7YKsLjW2XcoxRImTJVc1e/GYnkmbE
   w==;
X-IronPort-AV: E=Sophos;i="5.97,276,1669071600"; 
   d="scan'208";a="28881174"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Feb 2023 09:27:16 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 06 Feb 2023 09:27:16 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 06 Feb 2023 09:27:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675672036; x=1707208036;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ponrst4k/KDG8BgSoJoIr6qTQB7NPBgfogOr1eTCQvU=;
  b=S3kv6+xO3XpGTzVAyqawZKvC+ZFQ8b440Bf7j7u+gisS/JxyfEgBN3b4
   gw104P6MAhZ5EAjqpVwzTqhf7A745itAGrP+Gz/QchtDEdoUCcSdGNCbK
   bS27OzOq/2Pg2siReQSKRlKSwCahEjKpmruHtXaNoHNxxntvOHEcYG9BN
   c9JGtqRDy1mzTtf3O8tPVnpoRcDs020AVQas5v3BFeC0eyPek6lN3LFiv
   r10w6YACybSiVikXSR/g2MQdmWpqKP0F1XK8EIHLyogLjT8N86lau4pRd
   D/LzBd9i0dyEFfQYkYUs+7RAS49e1qUtMswj+yweAmoeDQr+WODnkbDAc
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,276,1669071600"; 
   d="scan'208";a="28881173"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Feb 2023 09:27:16 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B9BEF280056;
        Mon,  6 Feb 2023 09:27:16 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 13/13] media: i2c: imx290: Add the error code to logs in start_streaming
Date:   Mon, 06 Feb 2023 09:27:14 +0100
Message-ID: <4779804.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230203191811.947697-14-dave.stevenson@raspberrypi.com>
References: <20230203191811.947697-1-dave.stevenson@raspberrypi.com> <20230203191811.947697-14-dave.stevenson@raspberrypi.com>
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

Hi Dave,

thanks for the update.

Am Freitag, 3. Februar 2023, 20:18:11 CET schrieb Dave Stevenson:
> imx290_start_streaming logs what failed, but not the error
> code from that function. Add it into the log message.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  drivers/media/i2c/imx290.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 7167eb1edb9b..f635f1213477 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1007,20 +1007,20 @@ static int imx290_start_streaming(struct imx290
> *imx290, /* Set clock parameters based on mode and xclk */
>  	ret = imx290_set_clock(imx290);
>  	if (ret < 0) {
> -		dev_err(imx290->dev, "Could not set clocks\n");
> +		dev_err(imx290->dev, "Could not set clocks - %d\n", ret);
>  		return ret;
>  	}
> 
>  	/* Set data lane count */
>  	ret = imx290_set_data_lanes(imx290);
>  	if (ret < 0) {
> -		dev_err(imx290->dev, "Could not set data lanes\n");
> +		dev_err(imx290->dev, "Could not set data lanes - %d\n", 
ret);
>  		return ret;
>  	}
> 
>  	ret = imx290_set_csi_config(imx290);
>  	if (ret < 0) {
> -		dev_err(imx290->dev, "Could not set csi cfg\n");
> +		dev_err(imx290->dev, "Could not set csi cfg - %d\n", ret);
>  		return ret;
>  	}
> 
> @@ -1028,7 +1028,7 @@ static int imx290_start_streaming(struct imx290
> *imx290, format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
>  	ret = imx290_setup_format(imx290, format);
>  	if (ret < 0) {
> -		dev_err(imx290->dev, "Could not set frame format\n");
> +		dev_err(imx290->dev, "Could not set frame format - %d\n", 
ret);
>  		return ret;
>  	}
> 
> @@ -1036,14 +1036,14 @@ static int imx290_start_streaming(struct imx290
> *imx290, ret = imx290_set_register_array(imx290,
> imx290->current_mode->data, imx290->current_mode->data_size);
>  	if (ret < 0) {
> -		dev_err(imx290->dev, "Could not set current mode\n");
> +		dev_err(imx290->dev, "Could not set current mode - %d\n", 
ret);
>  		return ret;
>  	}
> 
>  	/* Apply customized values from user */
>  	ret = __v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
>  	if (ret) {
> -		dev_err(imx290->dev, "Could not sync v4l2 controls\n");
> +		dev_err(imx290->dev, "Could not sync v4l2 controls - 
%d\n", ret);
>  		return ret;
>  	}




