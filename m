Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6CD444AB8
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 23:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhKCWNN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 18:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbhKCWNM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 18:13:12 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 613B1C061714
        for <linux-media@vger.kernel.org>; Wed,  3 Nov 2021 15:10:35 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id e2so6228998ljg.13
        for <linux-media@vger.kernel.org>; Wed, 03 Nov 2021 15:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UsCfBYu7z+7gkDbi0s3tsVmOnN1h1kMb4J1QB/JSShM=;
        b=fJQCs9Pez1zp/v9JqVjIysMjU0+l8yQqhwvW1rlP9qc0G0afp9n7yvZ0cvtoO0dEG0
         TcswYgEwjRDgIKIk6m9DGIfZHPRPMcFH+WZ8Z4JhUg6uT/DZOJAS7ryohwNbFo0ybIbw
         dR27+Dp+Q30nlaTOCFY/HAZF2/iXycae1AOfD3+ftwbqrq/SD3VCkm+ErkbBcNgYHKQF
         DIiRrbgUkYJj6hiheCvfdE13TioP6rd5IWHFfYc8nXzswPujenO/6Hc0jY8DnBb+Gby2
         i9iEHm2P34Dd2+h6s1SIYmbclwpYcxtdzeDqZ85c8OWHcmN5mFyzfaX+lTrWMazSBWEJ
         aBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UsCfBYu7z+7gkDbi0s3tsVmOnN1h1kMb4J1QB/JSShM=;
        b=yDf2jDfIrTGS2O6R9zxeDsg8KnIaGh+i/n6dKMbamP0Z9Mg7qkMsOX5D6o1sk0NnMj
         v2AOlts49wXQxXz1UkraqB7SIjMhbzvkdriIyL7SmXnmIeKozlb8/5yO0UyhUL9TpGeP
         ti9zr61XADDnd6nhOS/vNfOaTna7rD1vNnOxxIomF9QgdORYjTBUQMihWFrPoiy3EuYw
         naZss3/w18D3a68Qc65qm0s+Y50BCCg9CL3cDi734Xvfu8gN0/hnyKTHfOSdA16aCYMh
         hp2TdM3fY2j55zLCNtCvnU/TG3NSZVOkdRS/UYsmSVE00eoxfqM2deVDW2LICh3eo0xA
         y1IA==
X-Gm-Message-State: AOAM533v9168W4yPgyRwuqow1BMURMJsU2GZW1Ch90oLrDtjTcBMlIyR
        GJglibbX5XDFovfOpKOHHqeFmg==
X-Google-Smtp-Source: ABdhPJzjb+DqE/3XXshch5HN8NIR3mOTaFDdCKH5rg9vw+0ryVaQDIkGZtGjynzmLeXxpcmUh+HAtQ==
X-Received: by 2002:a2e:5453:: with SMTP id y19mr48651133ljd.495.1635977433687;
        Wed, 03 Nov 2021 15:10:33 -0700 (PDT)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id y32sm285386lfa.171.2021.11.03.15.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 15:10:33 -0700 (PDT)
Date:   Wed, 3 Nov 2021 23:10:32 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] media: max9271: Fail loudly on bus read errors
Message-ID: <YYMI2K2VrHAmSRfk@oden.dyn.berto.se>
References: <20211103204654.223699-1-jacopo+renesas@jmondi.org>
 <20211103204654.223699-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211103204654.223699-2-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for your work.

On 2021-11-03 21:46:53 +0100, Jacopo Mondi wrote:
> Read errors were silently going ignored. Fail louder to make sure such
> errors are visible.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9271.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/max9271.c b/drivers/media/i2c/max9271.c
> index ff86c8c4ea61..aa9ab6831574 100644
> --- a/drivers/media/i2c/max9271.c
> +++ b/drivers/media/i2c/max9271.c
> @@ -30,7 +30,7 @@ static int max9271_read(struct max9271_device *dev, u8 reg)
>  
>  	ret = i2c_smbus_read_byte_data(dev->client, reg);
>  	if (ret < 0)
> -		dev_dbg(&dev->client->dev,
> +		dev_err(&dev->client->dev,

This feels a bit illogical as all call sites handles the return code and 
acts accordingly. For some it's OK to fail and for others where it's not 
a dev_err() is reported, for example in max9271_verify_id().

Will this not log error messages in situations where there really is no 
error? Maybe dev_info() is a better choice if you want to increase 
verbosity?

>  			"%s: register 0x%02x read failed (%d)\n",
>  			__func__, reg, ret);
>  
> -- 
> 2.33.1
> 

-- 
Regards,
Niklas Söderlund
