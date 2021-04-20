Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93A6A36543A
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 10:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbhDTIgC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 04:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbhDTIgB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 04:36:01 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B15C06174A;
        Tue, 20 Apr 2021 01:35:28 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id j7so7105763eds.8;
        Tue, 20 Apr 2021 01:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=i+wMprnsuXena69+qMh8afYKa3tm2MfcxOqLgpl/V+M=;
        b=iD4dGt+vZnDr55oT9LltKrw1nN6ttT3jJxy4S5KEYsy3JBI3vgxwU7WyYdqdc1gY0E
         YjnUa2G9MF1WxpcG+9eAPw2S25mkaj+8RuCz44331k29rieCbWcHBotyjwiciDzyBClz
         KSlP5t+Kwtozo5RVOpW7oF6jwu/jT8k1hzOTec3XxsjwFha6NrZv9QUtkFDv943e/7rZ
         Pznc7GM1vvl14EGt2/lzI5I66rNzzGfHxd51iFIAc7crvPMQI+FvR+ZFwm2CUGMqSceC
         ihFsN4kmald856M+8+40qxk7KheL2QipE2F9u5CWuHgeCX8ptUAjenQb+nP9hY07mH1j
         e/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i+wMprnsuXena69+qMh8afYKa3tm2MfcxOqLgpl/V+M=;
        b=WSqqBvYkWAQ5hAnHHTaCqj2Nhcxysw5STxpgULgr0lN9cW/OvKPSlRujDp6QPQxvkR
         hBhFWcnOhS3XV+av038BU7FrDxkZWFWkZJRRGbH1zjioIeIeKhh8TWBzv9p6ONvzox0H
         QHh+UPRkEGNx6hLGvNtgboOF73s1sk593DCukZt2waewTtg7v04YSNSXOweidSYJCov7
         B2pPLDBNHKOZgzLsWpo5iyCBcen+/Z/xXFgza8IDs61vLCCw0c7drv6SrcuJqLzDnCmW
         7ZfAMQkmG/heEO0XjPuHeZ11XlM+VaSyu1XQKxTz+byrj/4xuFKV1TL/Ba0Qxim26lU4
         oOGg==
X-Gm-Message-State: AOAM530YgBs7E52jUJnCkwtHXxIXVJWjbs7GijtAgsyuzFS121TWMhK3
        WvY3tAgLwPBjAxfcX9noJhI=
X-Google-Smtp-Source: ABdhPJwxO0AX/91okpE9i7ZBRmIZCORhyRnMeuV1WKhZLpUqkO//V69bgRiHj45u0Wl0q0Z3DjfjBw==
X-Received: by 2002:aa7:c3c7:: with SMTP id l7mr18049729edr.199.1618907727004;
        Tue, 20 Apr 2021 01:35:27 -0700 (PDT)
Received: from agape.jhs ([5.171.72.235])
        by smtp.gmail.com with ESMTPSA id u24sm14860565edt.85.2021.04.20.01.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 01:35:26 -0700 (PDT)
Date:   Tue, 20 Apr 2021 10:35:23 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     Deepak R Varma <mh12gx2825@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] staging: media: atomisp: use printk with KERN
 facility level
Message-ID: <20210420083522.GA1411@agape.jhs>
References: <cover.1618859059.git.drv@mailo.com>
 <4947abeebc2cecca43137675519a2fb48577d3e5.1618859059.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4947abeebc2cecca43137675519a2fb48577d3e5.1618859059.git.drv@mailo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Deepak,

On Tue, Apr 20, 2021 at 12:46:40AM +0530, Deepak R Varma wrote:
> printk() without KERN_<LEVEL> facility is flagged by checkpatch as a
> warning. It is better to use pr_info() which comes with an
> inbuilt KERN_INFO level.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> index b572551f1a0d..a0f3c5c32f94 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -1020,7 +1020,7 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
>  		return -EINVAL;
>  	}
>  
> -	printk("%s: before gc0310_write_reg_array %s\n", __func__,
> +	pr_info("%s: before gc0310_write_reg_array %s\n", __func__,
>  	       gc0310_res[dev->fmt_idx].desc);

in a driver is best recommended to replace a raw printk call
with a dev_*() log. Check few lines above here to see
how it is done.


>  	ret = startup(sd);
>  	if (ret) {
> -- 
> 2.25.1
> 
> 


thank you,

fabio
