Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3534F7C5DC0
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 21:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233369AbjJKTpH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 15:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233119AbjJKTpG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 15:45:06 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C92F94
        for <linux-media@vger.kernel.org>; Wed, 11 Oct 2023 12:45:04 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (185-9-11-240.cust.suomicom.net [185.9.11.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 4S5NXG74gDzyY5;
        Wed, 11 Oct 2023 22:45:00 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1697053503;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qKIKPwWb0fbtFcPeZcP9Xo13jqBlPHD/UP8GwJQZleE=;
        b=cHXWDQTuS12TebxuQz8s40+5S0eKuWWXQYjp5FCvcGgEdVyvciURp9N91C+ejp4m5iMeNj
        QOdOiwYqFqIZDFsYzL2fcBkSdIoSaI/1KcPwqmfJXMhAsVtFz0IJZIEXKDswLPiO5UlvVA
        kmZMoH0leFe3JAMN6gNzf0rtgmXTHYo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1697053503;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qKIKPwWb0fbtFcPeZcP9Xo13jqBlPHD/UP8GwJQZleE=;
        b=UUX8zcJA8SR1lZnFVzgvSeQelTMHBUkM3imCmwkGuhU2hgG0J68RJ//V2QQIVoTjsMi1Lp
        O67mnujMG3k3JZezNx3YMFLKKIKUG/vV0Wm8aHnrOORqWCl8kIFDwDjoIDgM+MgD+Kvb24
        HuZHlnOyXMIlZkLlwt/+sUo3KnhXjpA=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1697053503; a=rsa-sha256; cv=none;
        b=b112Ii1JZruQpDEDqYUYQLh2q8CKbfjt8ZMnf2iQWHnl7PObmT7M8lErdRmnRgNOrXMcxI
        u0Lvmw9uKuhqSfgjwCvtCEgCOTvP3fKhIQ70W0hx1XklUNu1s+PDqulcLYl9z5fUm/9NZM
        kWisUfmKqYT+mDPWz/HZiO7arKWiB2Q=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 074B7634CA9;
        Wed, 11 Oct 2023 22:45:00 +0300 (EEST)
Date:   Wed, 11 Oct 2023 19:44:59 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Alexander Shiyan <eagle.alexander923@gmail.com>
Cc:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH] media: imx: imx-mipi-csis: Fix null pointer dereference
 when link is not set
Message-ID: <ZSb7O+2pbIHKgroc@valkosipuli.retiisi.eu>
References: <20231006074654.11468-1-eagle.alexander923@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006074654.11468-1-eagle.alexander923@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On Fri, Oct 06, 2023 at 10:46:54AM +0300, Alexander Shiyan wrote:
> Let's add a check for src_sd before using it.
> The link may not be set, in which case the call to this function will fail.

That would seem like an understatement.

Any idea when this was introduced (and which patch did), Fixes: and Cc:
stable should be added if this is already in a release.

> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 5f93712bf485..df5a159b2d39 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -595,6 +595,9 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
>  	s64 link_freq;
>  	u32 lane_rate;
>  
> +	if (!csis->src_sd)
> +		return -EINVAL;
> +
>  	/* Calculate the line rate from the pixel rate. */
>  	link_freq = v4l2_get_link_freq(csis->src_sd->ctrl_handler,
>  				       csis_fmt->width,

-- 
Regards,

Sakari Ailus
