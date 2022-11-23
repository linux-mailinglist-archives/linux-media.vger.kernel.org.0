Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 995E26353FF
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 10:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236909AbiKWJBv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 04:01:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236898AbiKWJBu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 04:01:50 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B6C11001DF
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 01:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669194109; x=1700730109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c0tEAbZpxVxkfyoLyBrwYxacBDdVjZy1hNVPkXd3m2Q=;
  b=n1NXjt2Jjd0Xyl/4kE+CZKtxTMV59q4u3OkIKhPnGIbowaDl/ypQLZAX
   lRL6+9lwlYW5ypCANgiXi7/rDXYfyn+ejF5K/DQii1DUCKOsirJSUsWCq
   MeNTKWylgG1aCWCkU+H1/Ayes91ytvC1KHAggMAi2IofZdkKg5+UIwbwR
   9dSYRlOEKR+RVzDR6VfLOyYmq/58yZIavvW58cqjeQn0HvZPQY1OYA+tH
   Q7pGn5sjBpLHkpP7c+H85XDxZtLh+RGUY9dE73dYlIZQgJVBtIsC3fW51
   lUSUW9jnKwCaPeQqCcQc2hq/KW/g4Z2rVjlCIHnTwFO9sSmCM1K7qo2m+
   g==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27529093"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Nov 2022 10:01:46 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 23 Nov 2022 10:01:47 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 23 Nov 2022 10:01:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669194106; x=1700730106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c0tEAbZpxVxkfyoLyBrwYxacBDdVjZy1hNVPkXd3m2Q=;
  b=kn+2059JmqpmkaXXMbuvU8prtf9R8L26GTJE6a34egXaSaRV92Ty8d91
   Tim2IVzO6cqkT39F24UYkYbrewpViT6lKfwfxOkVoypX4DbKj3kE+SKu1
   6OFPAtgwdH8XULbuO/56jn4Vf8t+Gr3+jyPi8rIpCaU6y9tINqKPDIwEg
   bnEPL4PgWC0X+nnnIioiNC5d1wLfPHqkNAyPCFK2JV7GLIpQ/q5Hdxwk2
   TWljHB5FwaRLGGyL8mmgUcTarxIQzFVJGnjOi4zfK2rIpbf/TKf90XIQI
   1LhhNAihLm8tC11xOboxd89ZQ2pHY9ESYUgqnmuuqf2tBWN17F5/mVV7e
   w==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27529087"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Nov 2022 10:01:43 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0F166280056;
        Wed, 23 Nov 2022 10:01:43 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 14/15] media: i2c: imx290: Configure data lanes at start time
Date:   Wed, 23 Nov 2022 10:01:44 +0100
Message-ID: <1885321.taCxCBeP46@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221122223250.21233-15-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com> <20221122223250.21233-15-laurent.pinchart@ideasonboard.com>
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

Am Dienstag, 22. November 2022, 23:32:49 CET schrieb Laurent Pinchart:
> There's no need to configure the data lanes in the runtime PM resume
> handler. Do so in imx290_start_streaming() instead.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index dbed703fa199..4dfa090f918d 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -753,6 +753,9 @@ static int imx290_start_streaming(struct imx290 *imx290,
> return ret;
>  	}
> 
> +	/* Set data lane count */
> +	imx290_set_data_lanes(imx290);
> +
>  	/* Apply the register values related to current frame format */
>  	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
>  	ret = imx290_setup_format(imx290, format);
> @@ -1052,9 +1055,6 @@ static int imx290_power_on(struct device *dev)
>  	gpiod_set_value_cansleep(imx290->rst_gpio, 0);
>  	usleep_range(30000, 31000);
> 
> -	/* Set data lane count */
> -	imx290_set_data_lanes(imx290);
> -
>  	return 0;
>  }

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>



