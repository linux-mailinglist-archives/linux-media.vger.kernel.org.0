Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABFC8444ABA
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 23:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhKCWNl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 18:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbhKCWNk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 18:13:40 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4294CC061205
        for <linux-media@vger.kernel.org>; Wed,  3 Nov 2021 15:11:02 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id u11so8088306lfs.1
        for <linux-media@vger.kernel.org>; Wed, 03 Nov 2021 15:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rd5yrz7uJ+ej97FqeoeJUk83F+9Vxz1556jO7+keTvQ=;
        b=ogEwqwbpMPqq1EicCdc6dVH2A1ubv6eEtfoL+V5pLihyPEvBMns6JmfQqVmZ4pytN2
         Phr/vjC8OnyjTh3xZ2sASpv9xutd3Ce2JOsURm4JmU9nNUyk1X/ptF2xupHF9nWcU3Zz
         MrUzRZusOqdjH2/1vXER4b1tLbKNrU5ulBgzj1VNoGFaDdn66DTixWaspUmvS6euFN5s
         OqvvPpv3jbwKIJevlx6WJYPMmSTbKhzxVRH2D0aQZFhniKJauVqJje7UXcNc43FgUBHH
         Eq6I7F/PuXxjFG9ljxWgVoIYwF3HLjyn5LM/q7DgzDyCCXdxvShipFp5AZYNWNr+Rgb1
         jG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rd5yrz7uJ+ej97FqeoeJUk83F+9Vxz1556jO7+keTvQ=;
        b=o1LNJUrkJ6tyYu2cc8ww2Fd/JeRKu8FMoITYbOXtlEo/xlbnn2TU5EfgA9ykfLlmO2
         Di/qhlNvcMo6W1dV9L08jv3j1FM/CKdrgtbqSeqT+ShmNHo5qq1J2ooNK4b0Rj3Z8K0n
         c0Nsg8gaTHeZC/P9n6VaH1vlVXb111++VpU9BGngUZ451q5YZvgmvm34J5JSD/3X5och
         lYGkfecb8vgHwFEqr6DblpHwOhKKTrW/4aMSW/UKLCHK2EBcjh6wmMOqiv8qfOjrsOv4
         AxYXL/bnJKKSsK0mM1DmW5kzDB0DPL2MzkyVy/hI5BrhWoepE/67gaZHO3VqoaqDqxWI
         szFw==
X-Gm-Message-State: AOAM532Gwcqsb7adVJ6nhPExZXZK2J4tnp1xRIDz7tqlII0pBs7yq2Jq
        x6YPG1QhpKZZKtB9s/NLqeUjRg==
X-Google-Smtp-Source: ABdhPJwgrQlw3oNAUKIZwNFs4bJYDAySOvqrM2bsSXS7hktD3+8oHk9xgAb2+4Sicr7V77mcJvbL2g==
X-Received: by 2002:ac2:5d63:: with SMTP id h3mr3147537lft.588.1635977460526;
        Wed, 03 Nov 2021 15:11:00 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id p18sm121082lfu.228.2021.11.03.15.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 15:11:00 -0700 (PDT)
Date:   Wed, 3 Nov 2021 23:10:59 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] media: max9271: Ignore busy loop read errors
Message-ID: <YYMI8wGZADhJxMTa@oden.dyn.berto.se>
References: <20211103204654.223699-1-jacopo+renesas@jmondi.org>
 <20211103204654.223699-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211103204654.223699-3-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for your work.

On 2021-11-03 21:46:54 +0100, Jacopo Mondi wrote:
> Valid pixel clock detection is performed by spinning on a register read,
> which if repeated too frequently might fail. As the error is not fatal
> ignore it instead of bailing out to continue spinning until the timeout
> completion.
> 
> Also relax the time between bus transactions and slightly increase the
> wait interval to mitigate the failure risk.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/i2c/max9271.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
> index aa9ab6831574..5c4248de64c2 100644
> --- a/drivers/media/i2c/max9271.c
> +++ b/drivers/media/i2c/max9271.c
> @@ -55,7 +55,7 @@ static int max9271_write(struct max9271_device *dev, u8 reg, u8 val)
>  /*
>   * max9271_pclk_detect() - Detect valid pixel clock from image sensor
>   *
> - * Wait up to 10ms for a valid pixel clock.
> + * Wait up to 15ms for a valid pixel clock.
>   *
>   * Returns 0 for success, < 0 for pixel clock not properly detected
>   */
> @@ -64,15 +64,15 @@ static int max9271_pclk_detect(struct max9271_device *dev)
>  	unsigned int i;
>  	int ret;
> 
> -	for (i = 0; i < 100; i++) {
> +	for (i = 0; i < 10; i++) {
>  		ret = max9271_read(dev, 0x15);
>  		if (ret < 0)
> -			return ret;
> +			continue;
> 
>  		if (ret & MAX9271_PCLKDET)
>  			return 0;
> 
> -		usleep_range(50, 100);
> +		usleep_range(1000, 1500);
>  	}
> 
>  	dev_err(&dev->client->dev, "Unable to detect valid pixel clock\n");
> --
> 2.33.1
> 

-- 
Regards,
Niklas Söderlund
