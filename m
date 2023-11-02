Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C20537DF52C
	for <lists+linux-media@lfdr.de>; Thu,  2 Nov 2023 15:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbjKBOfj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Nov 2023 10:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbjKBOfg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Nov 2023 10:35:36 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE05133
        for <linux-media@vger.kernel.org>; Thu,  2 Nov 2023 07:35:25 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-53de0d1dc46so1757984a12.3
        for <linux-media@vger.kernel.org>; Thu, 02 Nov 2023 07:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698935724; x=1699540524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2kxXGpASHb8vQvtPgEKuD/+7aWXQWstAKgMPv5Qzafs=;
        b=ywaYldh7n7bub0eOEO2RqApDey7SiTeoIdO4aEA7H9T/sElvGa3wj4H3Uq/Lw/RU4+
         jl5SLscMOeRcS9sX9Xqq/BSmOSWsxdSUpRvDJdzoIbbcN0njUlFiUtxNID06obKMypqO
         AMc4j+HI5IlJ4rR3znzdPuYXUzP10BzJjD3mAnB3P3JDUmSs2QRbzBc4RXi4Hp3t9gUN
         mLnzdSMALnu2pEJOtZr6wavFXe+FwxbssSZmzyQJABh5v1BohtoGuZSUC50DIbBefuJ4
         4CJoC6N+AKTqVDhJe+AtcT6L5NXQy8iZL+Y0RM1DWp/WLG/zBOGkUlRM/+zLiIokuasR
         ZBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698935724; x=1699540524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2kxXGpASHb8vQvtPgEKuD/+7aWXQWstAKgMPv5Qzafs=;
        b=VLh1PsAiXhDvqjw9eMJusqlMq6TmrmDBFbkR12ELBBFqKz/dBC/RrTpOnFhAzxUpcs
         tDQiI/1me+V0gc4D/3rOfqsmuf9t+BdrE/ty+nNGn6FDrW473GCzkgcP+pLyup9tTWzU
         vONJSXb27CZTI1gJUZtte4fUZVNEWPgtZdo1MVkDNp3jy7WCIVg5J7WT4Gkx9Y8mpTZD
         VOfbBHRGv1hHQHasewLxRJlLa5KHkzJwpYAxUkNGSAQDN5TX5+xoP3svAjciyrTgsLrY
         JbhmHGi2m4FdXiC1A7EC45NsBXfdXJDwfXmkJWbCJwHR+sxvmPUpcEY7eRdEpnrQBZQm
         Jzjw==
X-Gm-Message-State: AOJu0YxELs4k7Pes4NfGElR9XkBw9zb+QFyt2+rdVsUQt9HRiBllC/nT
        xt0G5Iz3V3yCYmInA9nasrBiWg==
X-Google-Smtp-Source: AGHT+IHi4X/4Ey2n4dyewNyEL9R+lcjlEa8aSyNJ4kvkobPnvns1KYaw7NdgxkYdUuj6rCBOabCwMQ==
X-Received: by 2002:a50:aa93:0:b0:543:6ce3:f091 with SMTP id q19-20020a50aa93000000b005436ce3f091mr6167475edc.7.1698935724023;
        Thu, 02 Nov 2023 07:35:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j8-20020a50ed08000000b0053eb9af1e15sm2386006eds.77.2023.11.02.07.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 07:35:23 -0700 (PDT)
Date:   Thu, 2 Nov 2023 17:35:09 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Alexandra Diupina <adiupina@astralinux.ru>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org
Subject: Re: [PATCH 1/4] Remove redundant return value check
Message-ID: <11e6e0bd-eab1-4aa7-8c5c-29de6cff1b3d@kadam.mountain>
References: <20231102141135.369-1-adiupina@astralinux.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102141135.369-1-adiupina@astralinux.ru>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 02, 2023 at 05:11:32PM +0300, Alexandra Diupina wrote:
> media_entity_pads_init() will not return 0 only if the
> 2nd parameter >= MEDIA_ENTITY_MAX_PADS (512), but 1 is
> passed, so checking the return value is redundant
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c        | 4 +---
>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c       | 6 +-----
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c        | 2 --
>  drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c | 2 --
>  4 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index 9fa390fbc5f3..f10931a03285 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -840,9 +840,7 @@ static int gc2235_probe(struct i2c_client *client)
>  	dev->ctrl_handler.lock = &dev->input_lock;
>  	dev->sd.ctrl_handler = &dev->ctrl_handler;
>  
> -	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> -	if (ret)
> -		gc2235_remove(client);

Not related to your patch but why doesn't this error path return an
error?  Can that be right?

> +	media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
>  
>  	return atomisp_register_i2c_module(&dev->sd, gcpdev, RAW_CAMERA);

regards,
dan carpenter
