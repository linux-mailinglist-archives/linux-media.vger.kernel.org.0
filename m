Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D368E30CF78
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 23:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235830AbhBBW4l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 17:56:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235664AbhBBW4k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Feb 2021 17:56:40 -0500
X-Greylist: delayed 13677 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 02 Feb 2021 14:56:00 PST
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19228C061573
        for <linux-media@vger.kernel.org>; Tue,  2 Feb 2021 14:56:00 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dbd4xkyj7wcfw2k22jcct-3.rev.dnainternet.fi [IPv6:2001:14ba:8f1:3400:fb90:892b:22d6:3885])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id C1F1120050;
        Wed,  3 Feb 2021 00:55:57 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1612306557;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZTFruHwLMJbgU4LK+neB59RMbbHppgT3XTu5fYt7y9w=;
        b=nyjdzOyKIHqFOcPZc4FOnsSqY49FIk5OvjbKRljOSI7w7ENweVBPR3eaCaUbg3JY1aoP71
        LF8/pgMGklOxg7DUDp2qjox916ZdLLp3mj9Z/rmPKosLVGJ6wTAu2sw/CentmpwiVxsfIu
        x3gJySM9s2sr2pokFFyCddJAiE0iIUM=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 873FD634C8D;
        Wed,  3 Feb 2021 00:55:52 +0200 (EET)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.org.uk)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1l74aT-0000a0-1S; Wed, 03 Feb 2021 00:55:57 +0200
Date:   Wed, 3 Feb 2021 00:55:57 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     michael.srba@seznam.cz
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 1/1] media: i2c: imx219: add 1% tolerance on clock
 frequency
Message-ID: <20210202225556.GF3@valkosipuli.retiisi.org.uk>
References: <20201222093231.13438-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222093231.13438-1-michael.srba@seznam.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1612306557; a=rsa-sha256; cv=none;
        b=j7WcuO2SY1xaGbipZll9Gv8weTx9W3nfe3FRfljyLUVtCnLobl8DsdwRWtQRJy7vdldK6l
        oRleaJM1XIeWTjYaoYZ7xN8xF9wUPWuZl2kYKACkoSc2j0zrDpUCgoFthuOJbO1JSNOZu2
        TGxvbmHI+j0RrPWgMthOGHK544wMVGY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1612306557;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZTFruHwLMJbgU4LK+neB59RMbbHppgT3XTu5fYt7y9w=;
        b=YZUDHrMiUVAYfSz8NpwGHzBkLM8XE+fRJXjbUzuDnKId6T08t8RzdydqZkqduYek7yAWxg
        eFJfTYW6CGPGZSJFXLwiA5ox/LXNsP7eqb1VglH38eoDDLHZ+TEIAbvEkq88a29E7yaLdx
        AaJcyjq62w0IVk/ZzBu5kzSdiwQ2cN0=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Tue, Dec 22, 2020 at 10:32:31AM +0100, michael.srba@seznam.cz wrote:
> From: Michael Srba <Michael.Srba@seznam.cz>
> 
> This patch adds 1% tolerance on input clock frequency, similar to other
> camera sensor drivers.
> 
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> 
> ---
> 
> changes since v1: default to exactly 24MHz when `clock-frequency` is not 
> present
> changes since v2: remove the ability to set the clock to a specific
> frequency, since assigned-clocks + assigned-clock-rates can be used 1:1
> for the same purpose
> 
> ---
>  drivers/media/i2c/imx219.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index f64c0ef7a897..fd2157eadac4 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1443,8 +1443,9 @@ static int imx219_probe(struct i2c_client *client)
>  		return PTR_ERR(imx219->xclk);
>  	}
>  
> +	/* this driver currently expects 24MHz; allow 1% tolerance */
>  	imx219->xclk_freq = clk_get_rate(imx219->xclk);
> -	if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
> +	if (imx219->xclk_freq < 23760000 || imx219->xclk_freq > 24240000) {

Where do you need this? Do you have a system where you get a frequency
that's a bit off?

I don't think this is the right way to fix this but on the other hand for
register list based drivers there hardly is one.

>  		dev_err(dev, "xclk frequency not supported: %d Hz\n",
>  			imx219->xclk_freq);
>  		return -EINVAL;

-- 
Regards,

Sakari Ailus
