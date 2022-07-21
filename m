Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7542F57C896
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 12:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233071AbiGUKIy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 06:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232939AbiGUKIx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 06:08:53 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D506A9C6
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 03:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658398132; x=1689934132;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Id7wzI79urKfdaXoKXQQeWr+WlgDyFFe4Xh9nKoA0pk=;
  b=T5agNhEyvF9jo1B8kgCJUTBk8Ol0XOhbTEQxDf4UTUUBxOtxTkV/+fA1
   q51Qx3g2i5CzGKOi5ep+QPM8UBWS3os7gm4y7pEeQhaswRa3cyNJpkLhu
   /vFWaovKEB4vgWDRQCN9eIqi3gEbFzws8lmBSxFRYgV/io46fYAijY2TW
   lSZ/9W/mOZJhE0PcCO6VtFaHQrzq1tW5YZqOeAyB/7OTL7Ub/KVcJm+J1
   EgLiVHsDbZanEUlVwDBbl3PZ55qH0/4UCRRk90Sqj/G1UDKzP7wlPey4Z
   j8dZrs0+pxkbnuUjXHDLe7j4f1Ifi7NSXZHiaydrNfshW2u/aIUGfX34H
   g==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25181440"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 12:08:50 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 12:08:50 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 12:08:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658398130; x=1689934130;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=Id7wzI79urKfdaXoKXQQeWr+WlgDyFFe4Xh9nKoA0pk=;
  b=SuXXyVx/T8n46m9uY3G58kowUrmW6rG5fxTA38SxMkx/xkQ9U4OvWyKt
   HlBxKFUkL0dXyBsuqSlGbBvpHKPGWWfcGdM2mzPWm0dGEnCW5eiCFhpVU
   vcIo+RuQy54if/TRe+3+mPYM7+/RmJwXcJsQADwd7YQdBMpHvmcm0YQFW
   t30jFBLnaXjGG6wyZpX9w9T0Kjh0kWDXYlWY6knZEU1V76pUnftn37xr+
   s8cfpccB1Y27/YijWtYhyRuQnUtWfi6p+U4W028cBY9PVzXl+M+rSGrTy
   KvT6PZnyCxpVf2nPZ/D8Nhl/CJaOqGrMaolOl3Nimy/FmoWtLBrz6P62W
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25181439"
Subject: Re: [PATCH 16/19] media: i2c: imx290: Move registers with fixed value to
 init array
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 12:08:50 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C670B280056;
        Thu, 21 Jul 2022 12:08:50 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 12:08:50 +0200
Message-ID: <3980578.jE0xQCEvom@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220721083540.1525-17-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-17-laurent.pinchart@ideasonboard.com>
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

thanks for the path.

Am Donnerstag, 21. Juli 2022, 10:35:37 CEST schrieb Laurent Pinchart:
> Registers 0x3012, 0x3013 and 0x3480 are not documented and are set in
> the per-mode register arrays with values indentical for all modes. Move
> them to the common array.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 78772c6327a2..fc6e87fada1c 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -192,6 +192,7 @@ static const struct imx290_regval
> imx290_global_init_settings[] = { { IMX290_REG_8BIT(0x300f), 0x00 },
>  	{ IMX290_REG_8BIT(0x3010), 0x21 },
>  	{ IMX290_REG_8BIT(0x3012), 0x64 },
> +	{ IMX290_REG_8BIT(0x3013), 0x00 },
>  	{ IMX290_REG_8BIT(0x3016), 0x09 },
>  	{ IMX290_REG_8BIT(0x3070), 0x02 },
>  	{ IMX290_REG_8BIT(0x3071), 0x11 },
> @@ -230,6 +231,7 @@ static const struct imx290_regval
> imx290_global_init_settings[] = { { IMX290_REG_8BIT(0x33b0), 0x50 },
>  	{ IMX290_REG_8BIT(0x33b2), 0x1a },
>  	{ IMX290_REG_8BIT(0x33b3), 0x04 },
> +	{ IMX290_REG_8BIT(0x3480), 0x49 },
>  };
> 
>  static const struct imx290_regval imx290_1080p_settings[] = {
> @@ -239,15 +241,12 @@ static const struct imx290_regval
> imx290_1080p_settings[] = { { IMX290_OPB_SIZE_V, 10 },
>  	{ IMX290_X_OUT_SIZE, 1920 },
>  	{ IMX290_Y_OUT_SIZE, 1080 },
> -	{ IMX290_REG_8BIT(0x3012), 0x64 },
> -	{ IMX290_REG_8BIT(0x3013), 0x00 },
>  	{ IMX290_INCKSEL1, 0x18 },
>  	{ IMX290_INCKSEL2, 0x03 },
>  	{ IMX290_INCKSEL3, 0x20 },
>  	{ IMX290_INCKSEL4, 0x01 },
>  	{ IMX290_INCKSEL5, 0x1a },
>  	{ IMX290_INCKSEL6, 0x1a },
> -	{ IMX290_REG_8BIT(0x3480), 0x49 },
>  	/* data rate settings */
>  	{ IMX290_REPETITION, 0x10 },
>  	{ IMX290_TCLKPOST, 87 },
> @@ -267,15 +266,12 @@ static const struct imx290_regval
> imx290_720p_settings[] = { { IMX290_OPB_SIZE_V, 4 },
>  	{ IMX290_X_OUT_SIZE, 1280 },
>  	{ IMX290_Y_OUT_SIZE, 720 },
> -	{ IMX290_REG_8BIT(0x3012), 0x64 },
> -	{ IMX290_REG_8BIT(0x3013), 0x00 },
>  	{ IMX290_INCKSEL1, 0x20 },
>  	{ IMX290_INCKSEL2, 0x00 },
>  	{ IMX290_INCKSEL3, 0x20 },
>  	{ IMX290_INCKSEL4, 0x01 },
>  	{ IMX290_INCKSEL5, 0x1a },
>  	{ IMX290_INCKSEL6, 0x1a },
> -	{ IMX290_REG_8BIT(0x3480), 0x49 },
>  	/* data rate settings */
>  	{ IMX290_REPETITION, 0x10 },
>  	{ IMX290_TCLKPOST, 79 },

0x3480 is INCKSEL7 for imx327, not sure if that should be set yet for imx290 
(only) driver, without proper imx327 support.

Best regards,
Alexander



