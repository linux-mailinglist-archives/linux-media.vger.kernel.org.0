Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96F19600671
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 07:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbiJQFwW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 01:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiJQFwV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 01:52:21 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962FB558EB
        for <linux-media@vger.kernel.org>; Sun, 16 Oct 2022 22:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665985937; x=1697521937;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xPka3LObUG/VkKtgb1BnDWe3VG573dTj68XypImNMcc=;
  b=fKpP7x72uga0IDHYR33s96KGtHGubrmzU8hV06UaebYpGBFzlnYxfvBr
   4TZ0jYcJdH2nFuMunM0uACoGcm7vx2XjJf9pLHrj+nz4/UwvbIDtpt4FY
   XPkTPjd0Qar2wPjp/8YlE0A+/abiKxAlVWs6+f5jpS4AWXPE/vxQErdxy
   /fxWRZ1yK60wwWGZmjJU6vSjQBhZeiH0LkB21tHe5IlKwvD6+GOfHxeWg
   jPu/8Llj7NSgpPIVI3TntHCus+BbnmoWF3lS58YMgfk0zjsc/0TQLrY8y
   FlrGUAQr50V+I18kMjQYCCMd5sQbZ0NBy4UJuen0emQuxFlWUQF4PUAD4
   w==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661810400"; 
   d="scan'208";a="26776104"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 17 Oct 2022 07:52:15 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 17 Oct 2022 07:52:15 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 17 Oct 2022 07:52:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665985935; x=1697521935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xPka3LObUG/VkKtgb1BnDWe3VG573dTj68XypImNMcc=;
  b=iPFxMkcWjcBCvdzxhOZl5N32xkwkZwYUWyuBw6ZVphzA69mHJG6KwE6N
   zzpHAF7RrPZ5ef5jLiFlP81lMwpdwYQWDnzfbaY2qbUq5gyL2cETxHnJr
   awc0qQZlBDpi1O0xTYV1eyJh9hLxTr77S/rDWosKdJJBzA6BGPNiGa3x+
   psH088G004d8U1iaIOp8T86svyOOrvb8RvlpykWO+LEtp7vzM1rVY+VB4
   rwY2EbDMet6K+q88s7PP9aEjA0L2180rylpquB1uPrt8ITDzGCgN9sF0l
   tjT/klL1/BNG7ckaoyrxhfOK931UJP0TWhebR0vbpTqP8bjWPrepuVhCn
   g==;
X-IronPort-AV: E=Sophos;i="5.95,190,1661810400"; 
   d="scan'208";a="26776103"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Oct 2022 07:52:15 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6113A280056;
        Mon, 17 Oct 2022 07:52:15 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 17/20] media: i2c: imx290: Move registers with fixed value to init array
Date:   Mon, 17 Oct 2022 07:52:00 +0200
Message-ID: <2651531.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221016061523.30127-18-laurent.pinchart@ideasonboard.com>
References: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com> <20221016061523.30127-18-laurent.pinchart@ideasonboard.com>
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

thanks for the updated series.

Am Sonntag, 16. Oktober 2022, 08:15:20 CEST schrieb Laurent Pinchart:
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
> index 93eab6c96ca0..0b34d60f8ce2 100644
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

Acked-by:  Alexander Stein <alexander.stein@ew.tq-group.com>



