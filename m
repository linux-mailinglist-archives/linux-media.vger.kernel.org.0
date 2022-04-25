Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4944F50E4D4
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 17:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243045AbiDYPz7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 11:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243037AbiDYPz5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 11:55:57 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5257D45ACE
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 08:52:53 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id el3so14152628edb.11
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 08:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Oa5NtzGoFrsnzBgz2IkcumAm6ed+VSYE7BO1a3Ir24=;
        b=EigDBthRvJnsJo+9WGyQqWjg7PowmmzypMiC8CAR7LXfVN0PErUQdRx1RjTfiw4gyH
         Ee/9Tz8scBrSxmd2kS0fEhDXXWDoDEXtwtrlfZHv6FCexExa+hC+Y28nXmIh1BH4NQiZ
         38rCs5GLxbskzJ2hxkt/Idpb8OIRHdqQiNUcHNyGr09IzFxDdD6ZjtDzxbNGVScxWxA8
         gbqfgrntqMiIo1NzquxXzc6b6pQii5YbFQG3SACzOxfdYDrb1dgpTgZu8qP8qYVrJxcD
         XCqcowMpwzVkbsgRfIg8Ygnkkbq/iRf0jNQpNVZ5yWMp9ezfC1mrJWjd9sikNFP5kGHr
         ILFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Oa5NtzGoFrsnzBgz2IkcumAm6ed+VSYE7BO1a3Ir24=;
        b=rCn52oSU2V+PqPY88ullr4yvJurwwM74rtWtCO1iUnhDTfwDAFMGI2oZmPRr14qcwy
         lxYiCz1wIKwoB5f+uQNxNwWqQ6xPuev7eTxTmwNxJ0kldYrcx9gZZYT9q0kV85fMSJZt
         lyqDXxgLXjNeoRTBH6n8OTOx4izcJYemWQedLxhqd+tugwS29OM/mULPjAnNUgxgCYGt
         SXEdQ0EImymzWQFRj75Mofds6oyJlJQsx5C0pZXzrzpnI0Q3hOJLFX4YHDHyitQOjPqj
         ovn3UA4Tcb5DgvtvC6dBzDGUzdNqzuz9XXYKWyb1/s/+5cR/U+dBrb9rSl7bZDE8irww
         JmTw==
X-Gm-Message-State: AOAM531ZuNOuPgSzSl2vpTXF+OAkTFqY/T2YbsmevkiXEgVUft3prK+4
        AeuPezy9vnty1g3ff89jm2Q=
X-Google-Smtp-Source: ABdhPJzY0KqwmNprJw4wgl5ETDVJprVLMo9vqPy+8A0f/235e2cgQsITwXEEgGimRqQZseTw0/tsbg==
X-Received: by 2002:a05:6402:5189:b0:425:d7ca:caa4 with SMTP id q9-20020a056402518900b00425d7cacaa4mr10535349edd.177.1650901971712;
        Mon, 25 Apr 2022 08:52:51 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id d6-20020a170906304600b006ef5da1b1besm3739347ejd.221.2022.04.25.08.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 08:52:51 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     mripard@kernel.org, Ian Cowan <ian@linux.cowan.aero>
Cc:     paul.kocialkowski@bootlin.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, wens@csie.org, samuel@sholland.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        ian@linux.cowan.aero
Subject: Re: [PATCH] staging: sunxi: cedrus: centralize cedrus_open exit
Date:   Mon, 25 Apr 2022 17:52:50 +0200
Message-ID: <22617338.6Emhk5qWAg@kista>
In-Reply-To: <20220423180111.91602-1-ian@linux.cowan.aero>
References: <20220423180111.91602-1-ian@linux.cowan.aero>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ian,

Dne sobota, 23. april 2022 ob 20:01:11 CEST je Ian Cowan napisal(a):
> Refactor the cedrus_open() function so that there is only one exit to
> the function instead of 2. This prevents a future change from preventing
> the mutex from being unlocked after a successful exit.
> 
> Signed-off-by: Ian Cowan <ian@linux.cowan.aero>

If this patch would be part of series and "future" would mean next patch, I 
would be ok with that. However, in current form I don't see any benefit in 
changing it. Doing another hop lessens readability IMO. Let us worry about the 
future when/if it comes.

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/
media/sunxi/cedrus/cedrus.c
> index 68b3dcdb5df3..5236d9e4f4e8 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -348,14 +348,14 @@ static int cedrus_open(struct file *file)
>  
>  	v4l2_fh_add(&ctx->fh);
>  
> -	mutex_unlock(&dev->dev_mutex);
> -
> -	return 0;
> +	ret = 0;
> +	goto succ_unlock;
>  
>  err_ctrls:
>  	v4l2_ctrl_handler_free(&ctx->hdl);
>  err_free:
>  	kfree(ctx);
> +succ_unlock:
>  	mutex_unlock(&dev->dev_mutex);
>  
>  	return ret;
> -- 
> 2.35.1
> 
> 


