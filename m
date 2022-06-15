Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84A2254D582
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 01:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347547AbiFOXvk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 19:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233984AbiFOXvh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 19:51:37 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9DF33BBCB
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 16:51:35 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id u8so17260820wrm.13
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 16:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ex57Yhiz3winf6dl8S0owwNdCbZDIpR5SODQOg7ShQs=;
        b=ffZDQBDfZb5O0/gKF7uabdxUSr+l1QWHPWuyjOCr6JsHHSFAFtIuh9FOACeBS98zID
         Nbno1+zcUFfUvfjJaohro23jIErk3exU1mMJEwC955Df43cBAslwepc7oGx7crKoNaya
         qCorD8t1l1LO4cxDTgLf+LshXmluGZk3Uuwld5ldtDsHDrsY24ytlCqjOcRbVLF2094E
         5Zx/3JsWY7QiXEZRY2H8r6ADAuVk6/mW1LPrGtB3hGvpwbpYLkRw/glbiN2mieYgL1X0
         mAc90BsOlvN/TYw8oBRviAqf0FO7lBk+k65fvQS0L+e9Pkm8wGlx80zPYxd/CcwlwyUG
         CjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ex57Yhiz3winf6dl8S0owwNdCbZDIpR5SODQOg7ShQs=;
        b=MiEVIctRctewHa29bV2kn5Q+kJ+/fd3WVB/ELUfb7MH01fSwwtzblfaWC6WEpoQL2z
         UAAEQG7qFnqpKxsvI1TXaLWO0OJ8GwpKfXBEdbiokoNrEX4P6lQrI5DP4EfQTgAn+sm0
         P2Gy1CZDbMJ0EsuHR5EcA2yR24XP17fOW9pydK7Yd3cL7+X1PCi/3e9bAH26t9D1Cjhx
         0AZ9uA9mRoxMyCp7xyuiKKKIaasgD9AUrbdrR2QG8egLLSltPrsRiVLRoAOZjOBgHrH/
         scLwNLEAgvFQ5oNHsvTJ6T2QuSJOaLhEXnVDQ6kSSDoJi2sUmx+YSXo4s7yeNGGe7ibb
         2F0A==
X-Gm-Message-State: AJIora+yzZfxcVZK2xlZzhLh/4svTCVeia3NaCJIBSLOU3aCdAcvdwqU
        OQZRPlwvJeCQwYfwpF9mgEo=
X-Google-Smtp-Source: AGRyM1vTatl1Q5nDcCUyiKlDaHXNWGDmABznnAJf5UMB7i3gSH8heck3qknVTa3/0RFMYgZaCIVIRA==
X-Received: by 2002:a05:6000:1819:b0:210:2eb7:559f with SMTP id m25-20020a056000181900b002102eb7559fmr1997491wrh.386.1655337094162;
        Wed, 15 Jun 2022 16:51:34 -0700 (PDT)
Received: from arch-thunder (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id n8-20020a5d4208000000b00219e758ff4fsm268571wrq.59.2022.06.15.16.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 16:51:33 -0700 (PDT)
Date:   Thu, 16 Jun 2022 00:51:31 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        kernel@pengutronix.de, linux-imx@nxp.com
Subject: Re: [PATCH 2/4] media: imx: imx-mipi-csis: Add version register
Message-ID: <20220615235131.igwuy46mizk26dwc@arch-thunder>
References: <20220615192602.25472-1-laurent.pinchart@ideasonboard.com>
 <20220615192602.25472-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615192602.25472-3-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Laurent,
On Wed, Jun 15, 2022 at 10:26:00PM +0300, Laurent Pinchart wrote:
> Register at offset 0x00 isn't documented, but the NXP BSP
> imx8-mipi-csi2-sam driver defines it as a version register. Tests on
> i.MX7D and i.MX8MP have confirmed this, with values matching the version
> of the IP core specified in the respective reference manuals.
> 
> This commit doesn't make use of the version register at runtime as the
> compatible strings are enough to identify the IP core version.
> Nonetheless, capturing the information in register definitions that
> don't affect the code negatively is useful for future development.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Nothing against this.

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 09a220c1bfe8..8674aaad5fa0 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -46,6 +46,11 @@
>  
>  /* Register map definition */
>  
> +/* CSIS version */
> +#define MIPI_CSIS_VERSION			0x00
> +#define MIPI_CSIS_VERSION_IMX7D			0x03030505
> +#define MIPI_CSIS_VERSION_IMX8MP		0x03060301
> +
>  /* CSIS common control */
>  #define MIPI_CSIS_CMN_CTRL			0x04
>  #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW	BIT(16)
> -- 
> Regards,
> 
> Laurent Pinchart
> 
