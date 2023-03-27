Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36D516C9E9E
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 10:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233464AbjC0Iwg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 04:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233480AbjC0IwB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 04:52:01 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F5361705
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:47:56 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id g17so10324493lfv.4
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112; t=1679906874;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r4M98D9jJIODK0yR9HdOwsGY2fF3cLflvrBklnJxnQE=;
        b=l+uaM+WU/NZPi3L57lGCxKvke4L7vjiuEI2yV2mxJnn/w41wsAnRJzbXnthtmh3pTP
         nf6BuhYkf3TUWYa1he8Tx2uzgUvNArW2S2r6lUAreYlD3rDgHZlpQft3AE9BIIl7DQkY
         AyEx5fVwjg8D9R5KETjz7yshrsJAPQshIyBs68V+pudTzDpeMX+HYl+IeeRpzXcgk3yY
         6VtJJQOXJjKwzXjVeW2qaQTM/pwy690eR4VqoPSXA6zhEq3Q61Ze9Ez+Va7eg/l4fBGV
         H3mpLSMrJTPplBzne4rxnOa6QBDbhDQwo8YDGIUF5js5kfI2BN6wpsm+LhVA/pfL2HrM
         YoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679906874;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r4M98D9jJIODK0yR9HdOwsGY2fF3cLflvrBklnJxnQE=;
        b=1ulOWrfhoQkkpOT0NOZo1FADXsA8lBRa7RAc9DROrzuWMhfwPdarxMnjsrvWCWKq4D
         IlFVfGCXyOXk881HLNZu28FtHYyvdlnH0hnUfsZUfzvvF9GjVLRm0beGAv9JeN0AUQLv
         v/cw1OPolAb7cmfv4jvTKfa2Fv6m62nF+04C4DF+FC3oiExPE4UbOkF8hMWlA41h+/T6
         MwZajXHhU+GmRQ0xcB41NhMdEc+vDLqCYNf13z/gbb3DgSC5G5sd6W3v5wzDEXndkK8T
         Zlsg5L6YNxZeZfWG7KraGHLGPcPjyyID6LqgALPOGQ8e4SlK/n3FgfYonI6othejVcVm
         k37w==
X-Gm-Message-State: AAQBX9e9zWOQDOE1N0EiSD59OYJ97c1x6HHcE9rGONUYXjC+4GUCCDHj
        JNKqxzXAHsvNTPb06lXE0me8Qw==
X-Google-Smtp-Source: AKy350bCtuyxNsKI2hDdfaa2qqE4eb3MhN7hcCkyf6tiEiQohUHCkxUp4Ful6riCYUJqaNq/WYYfnw==
X-Received: by 2002:ac2:4352:0:b0:4d5:8f3e:7852 with SMTP id o18-20020ac24352000000b004d58f3e7852mr3140360lfl.49.1679906874436;
        Mon, 27 Mar 2023 01:47:54 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id w19-20020ac24433000000b004eb00c0d417sm1772728lfl.130.2023.03.27.01.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 01:47:54 -0700 (PDT)
Date:   Mon, 27 Mar 2023 10:47:53 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 049/117] media: rcar-core: Convert to platform remove
 callback returning void
Message-ID: <ZCFYOQsi4ftHP7Ut@oden.dyn.berto.se>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-52-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230326143224.572654-52-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2023-03-26 16:31:16 +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 5e53d6b7036c..1398f147e5c2 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -1442,7 +1442,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int rcar_vin_remove(struct platform_device *pdev)
> +static void rcar_vin_remove(struct platform_device *pdev)
>  {
>  	struct rvin_dev *vin = platform_get_drvdata(pdev);
>  
> @@ -1458,8 +1458,6 @@ static int rcar_vin_remove(struct platform_device *pdev)
>  		rvin_parallel_cleanup(vin);
>  
>  	rvin_dma_unregister(vin);
> -
> -	return 0;
>  }
>  
>  static SIMPLE_DEV_PM_OPS(rvin_pm_ops, rvin_suspend, rvin_resume);
> @@ -1472,7 +1470,7 @@ static struct platform_driver rcar_vin_driver = {
>  		.of_match_table = rvin_of_id_table,
>  	},
>  	.probe = rcar_vin_probe,
> -	.remove = rcar_vin_remove,
> +	.remove_new = rcar_vin_remove,
>  };
>  
>  module_platform_driver(rcar_vin_driver);
> -- 
> 2.39.2
> 

-- 
Kind Regards,
Niklas Söderlund
