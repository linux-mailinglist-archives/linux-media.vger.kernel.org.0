Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBD2A66B2AF
	for <lists+linux-media@lfdr.de>; Sun, 15 Jan 2023 18:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbjAORAw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Jan 2023 12:00:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbjAORAv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Jan 2023 12:00:51 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FDF2EC5E
        for <linux-media@vger.kernel.org>; Sun, 15 Jan 2023 09:00:49 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id d30so34844347lfv.8
        for <linux-media@vger.kernel.org>; Sun, 15 Jan 2023 09:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9JT1UC0wph/bO1K0/YbavkOzB/NDVlY8g8+V0Wc6o/Y=;
        b=GUJmcGUlqxXBYk3nrX+uJiFmd2mXrUNDz7Poo6Ceam7tYwsN4cBzS9wWS/rLyItiBp
         UucyI8mEsmoakof9LE+c4p0SGisQOUThssXeCkkCLXSQrLWFGeZ1eQ+9P91F+RrB21Fl
         /qoDFa464LOLlh2zkFCd7eqAI14I19/opa6Qw2JxR9K6kg7TFOSrvJJKUs6CQA1XxFtY
         WLwxgr4Q1KSS7a9bBgYHCCMC6BqXcCPf+rlS9qv/yMzAkPuMXL8Jyphtyu/lGdS0vB4y
         J2jmgJXVyHyiDjOGg6eK9XIeFe/v9sUL+YHuwIs4VRcjS24Uc5FhxZkB2hXwuzDp/JnI
         l/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9JT1UC0wph/bO1K0/YbavkOzB/NDVlY8g8+V0Wc6o/Y=;
        b=cxfxIx308TQk/+954YfJ/wsHUeo/VMW7OqPD7gfyHFGNcVmABuSD7Rl2/cB12zxupd
         Q8nS5zZ12jRvGi/u0N7dJJdjPvuZ9+kJFBndH8Qd5ThGfr0zLDw49TEdhEFWQ+tlZ6rO
         K9H8m7Jpi2/wSm02SNC8ZS9yKE21Ww7hS4pCUwLotNRE++owiQrwSWTLhYXqPD7nBuew
         czNwKD6fQaUw3a4hrTFLI95AzrOjwFC/sLGMSR9xX+M5UUuEGANjfIMXJhTr2rvybVHg
         39oORFkfanzuZr4NfbRz9d0NdkNH7BrcD7jmGxu71hg96FBqQiP9TQqMVQaR2LWyMrL+
         pPPA==
X-Gm-Message-State: AFqh2koIy9KKx+1dBri5Z6E/pygQeRYobLZ4H/q76uA10rhBeHBKkE5o
        tJ4vAOlkfKW0fVqjrZSZNc146afZtsPHjHaL+6U=
X-Google-Smtp-Source: AMrXdXvbYBSBdqBGSyvfHQs+aWPPslHv2dQL7of7aJdsdhacJNo4ABOLRE39vhDMHSRbPUfrY3oOCg==
X-Received: by 2002:a05:6512:32d5:b0:4cc:73ff:579a with SMTP id f21-20020a05651232d500b004cc73ff579amr9539646lfg.38.1673802047670;
        Sun, 15 Jan 2023 09:00:47 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id m7-20020a195207000000b004cb10601096sm4750947lfb.136.2023.01.15.09.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 09:00:47 -0800 (PST)
Date:   Sun, 15 Jan 2023 18:00:46 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH] media: max9286: Free control handler
Message-ID: <Y8QxPhyoLykwFgjI@oden.dyn.berto.se>
References: <20230114214650.2984-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230114214650.2984-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for your patch.

On 2023-01-14 23:46:50 +0200, Laurent Pinchart wrote:
> The control handler is leaked in some probe-time error paths, as well as
> in the remove path. Fix it.
> 
> Fixes: 66d8c9d2422d ("media: i2c: Add MAX9286 driver")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/i2c/max9286.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 701038d6d19b..13a986b88588 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1122,6 +1122,7 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  static void max9286_v4l2_unregister(struct max9286_priv *priv)
>  {
>  	fwnode_handle_put(priv->sd.fwnode);
> +	v4l2_ctrl_handler_free(&priv->ctrls);
>  	v4l2_async_unregister_subdev(&priv->sd);
>  	max9286_v4l2_notifier_unregister(priv);
>  }
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Kind Regards,
Niklas Söderlund
