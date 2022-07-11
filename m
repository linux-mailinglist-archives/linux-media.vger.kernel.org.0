Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC304570CC9
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 23:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbiGKVgW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 17:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbiGKVgI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 17:36:08 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3858485F89
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 14:36:04 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id w184so2016864oie.3
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 14:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W1lfMFF7GwisucHEs2WhdN/ngSj9xjvJck8CvmDPr8Q=;
        b=m3zlf3eaY+ozNxIYDmb53Dyn4cP8iN10VPE2PcHMMkNQ9B2QriL/uoXD3KinNbSCAf
         R/jGyCPjVfs+Y/AURJLDM3VfiBz+w/TJUmx1mPLs5NfjNaUicM/sJBmLH7oa78GdqTRd
         dCfTnoM1Y/xR0GDVkc+OMWaXuozZ8hXrGWyFj3Oc8s9x/D7hYkqVt7waYUXceAKyQYBR
         hJGiu3OXz4anUqmK+YnlzMOskhRFOwH68SeARH3VE9rqYgvskwyPmoxINBIWCoKpQqS5
         ZS5z+fQYqavQg+9MF6Bgtw4OiOxkzfd4UPKbX12r6/rTuAJsMPguquCbHZi1YOP5NHGG
         CIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W1lfMFF7GwisucHEs2WhdN/ngSj9xjvJck8CvmDPr8Q=;
        b=WhiaXYc49Q8lXaxXigurPPAU2dXMIKtMz9fpRE/2f9n2yLI+hmxI7bHAUrdo9njGsX
         CUJYq+XUGqlCtyfdUbp3xpHjfA9zus4o6LpRFJsZxk3kR57E3giec5XkMUvoO1L/G0kR
         kGA7OlTcipoiKvP8So3vym8M2ig8OcGDMjOZFpECN/BPs1rnmo5RijVp68v5MNWc35ig
         KZAHUQ5vR4Y/m+D/c/hNfjstJNpXbW2in0ggzcKgyBWz0UXc07btiLlijrEGSYWvuwdG
         jl3xTRumYT3lpPwLh++XUHkr452Gfpe1pC0CONCycFeW+VVP3XfiQ5gIhbIbYshjPv63
         BmrQ==
X-Gm-Message-State: AJIora9T4wYj6tMgkmn+E/ISRBR+KUh/I2vjiL+0w2gidZdEj/tk1R60
        nT/pmrxCzqSQstW21UNOwM+vrw==
X-Google-Smtp-Source: AGRyM1ukzkSjiYh6xdbkafb6/cn72eoJoX+cxrroy+Ym4I4X16AsdivaNNxd+cGYK6dsX/hak9UA+A==
X-Received: by 2002:a05:6808:2127:b0:335:9807:959e with SMTP id r39-20020a056808212700b003359807959emr251350oiw.270.1657575363633;
        Mon, 11 Jul 2022 14:36:03 -0700 (PDT)
Received: from eze-laptop ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id cj8-20020a0568081b8800b00339e4ca6a15sm3239334oib.45.2022.07.11.14.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 14:36:03 -0700 (PDT)
Date:   Mon, 11 Jul 2022 18:35:57 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        samuel@sholland.org, mchehab@kernel.org,
        gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] media: cedrus: Improve error messages for controls
Message-ID: <YsyXvfvjxWIPZle6@eze-laptop>
References: <20220620175517.648767-1-jernej.skrabec@gmail.com>
 <20220620175517.648767-4-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620175517.648767-4-jernej.skrabec@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 20, 2022 at 07:55:13PM +0200, Jernej Skrabec wrote:
> Currently error messages when control creation fails are very sparse.
> Granted, user should never observe them. However, developer working on
> codecs can. In such cases additional information like which control
> creation failed and error number are very useful.
> 
> Expand error messages with additional info.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
> index b12219123a6b..99c87319d2b4 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -242,7 +242,8 @@ static int cedrus_init_ctrls(struct cedrus_dev *dev, struct cedrus_ctx *ctx)
>  	v4l2_ctrl_handler_init(hdl, CEDRUS_CONTROLS_COUNT);
>  	if (hdl->error) {
>  		v4l2_err(&dev->v4l2_dev,
> -			 "Failed to initialize control handler\n");
> +			 "Failed to initialize control handler: %d\n",
> +			 hdl->error);
>  		return hdl->error;
>  	}
>  
> @@ -257,7 +258,9 @@ static int cedrus_init_ctrls(struct cedrus_dev *dev, struct cedrus_ctx *ctx)
>  					    NULL);
>  		if (hdl->error) {
>  			v4l2_err(&dev->v4l2_dev,
> -				 "Failed to create new custom control\n");
> +				 "Failed to create %s control: %d\n",
> +				 v4l2_ctrl_get_name(cedrus_controls[i].cfg.id),
> +				 hdl->error);
>  
>  			v4l2_ctrl_handler_free(hdl);
>  			kfree(ctx->ctrls);
> -- 
> 2.36.1
> 
