Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59E666C9EA1
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 10:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbjC0IxB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 04:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233341AbjC0Iwa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 04:52:30 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCB45B9B
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:48:20 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id by8so8059026ljb.12
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112; t=1679906899;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IlZYZNNcgHJZCGoEdzvyTullyoQE4KiV021+5vlfa7A=;
        b=npBPO5LSGyytFPgvgkrdzitpOYqv1ElBoUSc5PHipkTC3pIapcxK+6+K16VGjpFGzL
         ELkJLyIuy6QzY8Z52fcKtwMiE1OUbbJICxmc6SOnxxFgezzn90aSoCnuFxHkzVERZZZm
         SOviWsCoelxHQjsBMenYpIekAV5motLCJcJ9dGVTySwaIWgf+X9j32ddkLNbXkDiOr3m
         CUQ2VBxzX4t2TBlkuNsSHoQoWUmwa0Ok5ZEM2GIZ5w4H9d/fupwS9jf302cxzr2p33KW
         hgHbra8FoIMcr13jG+/hjNzC0lwSwUUyjQocCaiNCAiq4i4fN91SQv+Z3t+om5UjOG+u
         YT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679906899;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IlZYZNNcgHJZCGoEdzvyTullyoQE4KiV021+5vlfa7A=;
        b=mceXJuPwpyEA+BeQZQv6xfyyPe7jJaZima+CVwJRS/th2/WOVeVAonNRMf+y0i9m6C
         AfUGhxfJNWHIkAGZbn7yOZNV9CQMTsfLtdTuU18v4YmpHp5VMVC5sPHU+DX+mXsE+H6f
         8POSx6Ai7Iy8pmggEI/SChvV4f7Uen6lgW+Wg4JJ51NWkOtne+Te6kEmpmx2+Q7rC/Os
         +C3aQYdTxVDGlGDuQrAqsyCVOpwZgPwhId6ZgsgYbE/4b62F7a43cBuU1zgHwr4J6sWy
         hCuXIMIkfu/ppSCUWZ9UYT3YhE/+mg8ttWC2j7GZplNdC300n+gX/EIncy0ycbSeCPZl
         /Gxw==
X-Gm-Message-State: AAQBX9dbNKv+wsYMBsbjl1s9B5GULbrpDH/c+9RKO9tpz/FcmUtrad7K
        iAG/Gyilw1hVgsVrPfl595vLcw==
X-Google-Smtp-Source: AKy350ZaDY9OdDagIfcbBmOvOGNu+JXjuc56lhLr3SuremHfI6jLIpowfQnuOTmI0/GzvrFbkYXATQ==
X-Received: by 2002:a2e:9c82:0:b0:29c:3f18:57a7 with SMTP id x2-20020a2e9c82000000b0029c3f1857a7mr3778022lji.35.1679906899184;
        Mon, 27 Mar 2023 01:48:19 -0700 (PDT)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id b26-20020a056512025a00b0048a9e899693sm4587157lfo.16.2023.03.27.01.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 01:48:18 -0700 (PDT)
Date:   Mon, 27 Mar 2023 10:48:18 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 048/117] media: rcar-isp: Convert to platform remove
 callback returning void
Message-ID: <ZCFYUr3TFszW9ssR@oden.dyn.berto.se>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-51-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230326143224.572654-51-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2023-03-26 16:31:15 +0200, Uwe Kleine-König wrote:
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
>  drivers/media/platform/renesas/rcar-isp.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
> index 10b3474f93a4..27fe71931a04 100644
> --- a/drivers/media/platform/renesas/rcar-isp.c
> +++ b/drivers/media/platform/renesas/rcar-isp.c
> @@ -503,7 +503,7 @@ static int risp_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int risp_remove(struct platform_device *pdev)
> +static void risp_remove(struct platform_device *pdev)
>  {
>  	struct rcar_isp *isp = platform_get_drvdata(pdev);
>  
> @@ -515,8 +515,6 @@ static int risp_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  
>  	mutex_destroy(&isp->lock);
> -
> -	return 0;
>  }
>  
>  static struct platform_driver rcar_isp_driver = {
> @@ -525,7 +523,7 @@ static struct platform_driver rcar_isp_driver = {
>  		.of_match_table = risp_of_id_table,
>  	},
>  	.probe = risp_probe,
> -	.remove = risp_remove,
> +	.remove_new = risp_remove,
>  };
>  
>  module_platform_driver(rcar_isp_driver);
> -- 
> 2.39.2
> 

-- 
Kind Regards,
Niklas Söderlund
