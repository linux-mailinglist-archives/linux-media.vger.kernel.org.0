Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 928AE5774F7
	for <lists+linux-media@lfdr.de>; Sun, 17 Jul 2022 09:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbiGQHaf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jul 2022 03:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiGQHae (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jul 2022 03:30:34 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20BF11902B;
        Sun, 17 Jul 2022 00:30:30 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id D78A9202B9;
        Sun, 17 Jul 2022 10:30:25 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1658043026;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=k73vNUkXnGYNFTqzGk4yq4li/VMRqMmY+7V/Z/FCAaU=;
        b=GnxP6m0tw/XU5TMJVxXQXYfEmLwmtKZIEPOSRqw0cXecliJMx+bLRKdpivwVxpP7CllDml
        4L0S0tRf3YHopqBfzCnmw8NswjfOXbkrgIpPiG5zAI7OVsoYe0LRKTQGniqf/4qvf1eWLD
        u+8VWbKF6wI5UaHwIOea4QyWl/fmR38=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 27975634CEA;
        Sun, 17 Jul 2022 10:30:24 +0300 (EEST)
Date:   Sun, 17 Jul 2022 10:30:24 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     dave.stevenson@raspberrypi.com, david.plowman@raspberrypi.com,
        laurent.pinchart@ideasonboard.com,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/5] media: ov5647: Support HFLIP and VFLIP
Message-ID: <YtO6kMoJ0GbDrJqU@valkosipuli.retiisi.eu>
References: <20220615151457.415038-1-jacopo@jmondi.org>
 <20220615151457.415038-3-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615151457.415038-3-jacopo@jmondi.org>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1658043026;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=k73vNUkXnGYNFTqzGk4yq4li/VMRqMmY+7V/Z/FCAaU=;
        b=OAjoszw26K+4M+hIUc9ptyU/xOB7CdugCE1VhZIumSdmZtO6itGeRfOtT4wlNBF5c1Febs
        1F9qLDyE5mEUick9fjyJOqavNqRGRJN3peXfFCR3tflI7sLPJZOwWsEy+nwffR4BHPmVjy
        oilkvvRHAJ0HmtEEUSaH6n9uCskYekA=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1658043026; a=rsa-sha256; cv=none;
        b=NbQKrUlQZHFQ5uTp2ud+4RciK7x0Z03gOJi+MRBnoXmgDk15JWYg0qmP8w6CnlTDpiKT0I
        54IDPe4Yl9uzvkV5n3wSuAqhFZMej2DPIoPAMGgcdpQG7ShqvBoaWi1qgJo2+zYoZhFUiG
        ccH5ZGliWdxjUcIrbBIKaWTpJn7NASg=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for the set.

On Wed, Jun 15, 2022 at 05:14:54PM +0200, Jacopo Mondi wrote:
> From: David Plowman <david.plowman@raspberrypi.com>
> 
> Add these missing V4L2 controls. Tested binned and full resolution
> modes in all four orientations using Raspberry Pi running libcamera.
> 
> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5647.c | 72 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 66 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 98b72094ef68..c292e5d09eab 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -136,7 +140,7 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
>  	{0x3036, 0x69},
>  	{0x303c, 0x11},
>  	{0x3106, 0xf5},
> -	{0x3821, 0x06},
> +	{0x3821, 0x00},
>  	{0x3820, 0x00},

As you're setting the values through the control handler, the registers
should be removed from register lists.

>  	{0x3827, 0xec},
>  	{0x370c, 0x03},

-- 
Regards,

Sakari Ailus
