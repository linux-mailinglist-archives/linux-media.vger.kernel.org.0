Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F9425C784
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 18:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728529AbgICQyk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 12:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgICQyh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 12:54:37 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D17C1C061244;
        Thu,  3 Sep 2020 09:54:33 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id cy2so1666660qvb.0;
        Thu, 03 Sep 2020 09:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pPIlhO83NbYR2Iu+Rl8jTDV2i9P/pTQITMRP/d/Npl0=;
        b=KBYeEkkp0TEeFaAEk1ZWyi7diJBOK/4w6YDtZgSGPOHt7d4eSbVFwu6F6rIMZNGi5a
         gpjZjq3jZyc591WDnlHS3zhP5eOBU47TngzMoH3VPkIuNknhJ+7js5OVT+p3YFmCA5se
         f6b5ax39xhGDYUTLMG9ncVS2OtTl4lRmfOute+2DzW+6Cjra33uSMaMY6b73/oZa+qT6
         bZEmtUEMqeM1tSSzPcslSGRn+cFxgYMx28OIyxLswVcpxFBadke9moW8zcWd3nJ7HY+s
         F0QRHJ5cO6yOtFRXv4djncDEO5x6MeamRexUPO9JFcnacC8edXbLj1VKad8MEluxrg11
         U0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pPIlhO83NbYR2Iu+Rl8jTDV2i9P/pTQITMRP/d/Npl0=;
        b=m/VRFT1t8Ve5WJ9zPSiGGIe22Wx50FA/jX1VAsjTsnj1DccBKbpaHlAt1uJ7CW30Lg
         FZaTU/ACqiGWYza5dAvNgjE0ZcZ7lD6v2sLEWfvVrlBU0qHRv/BmJ7C081QIg3+rmZza
         ddgUJf0OeMuIlpybmvBvxB6ZFTdf5iqU0N7q9vEg9zsh2RDXhgwJhScTRrPEKLIOtJ1g
         JNybtEZkPIIoUthf9yNmLL5GvRHsePdcnuu39NtPV7FC0eu4c+y0F4ifwpRNrZt9KfEy
         rjZR5+ylpeud8jSiTQadWbsEzQqvDFcD9Xad3g8pSaNZwXkfIDdL5FOZe9Q6qD3wbG+2
         KcLA==
X-Gm-Message-State: AOAM533iNlXSmO/JASgjIEvyUaup5uut3kpzWTE4sHAUu5KIR6+AoR7r
        +2OgJuAugJumZ246F99jQbiKWMw++kD6Vw==
X-Google-Smtp-Source: ABdhPJzdd994L+nG9ApQYSAdmgBm3zD6Bqb7CSuby1zx34NP5CXqz3juJ0lRLXUZs/Ig+lHFQhDckw==
X-Received: by 2002:a0c:c988:: with SMTP id b8mr2989741qvk.192.1599152072939;
        Thu, 03 Sep 2020 09:54:32 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
        by smtp.gmail.com with ESMTPSA id i1sm2531306qkd.58.2020.09.03.09.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 09:54:31 -0700 (PDT)
Date:   Thu, 3 Sep 2020 09:54:30 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     trix@redhat.com
Cc:     mchehab@kernel.org, ndesaulniers@google.com, brad@nextdimension.cc,
        mkrufky@linuxtv.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] media: em28xx: fix function pointer check
Message-ID: <20200903165430.GA894500@ubuntu-n2-xlarge-x86>
References: <20200903145038.20076-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903145038.20076-1-trix@redhat.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 03, 2020 at 07:50:38AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analyzer reports this problem
> 
> em28xx-core.c:1162:4: warning: Called function pointer
>   is null (null dereference)
>         ops->suspend(dev->dev_next);
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This is the problem block
> 
> 	if (ops->suspend)
> 		ops->suspend(dev);
> 	if (dev->dev_next)
> 		ops->suspend(dev->dev_next);
> 
> The check for ops->suspend only covers one statement.
> So fix the check consistent with other similar in
> the file.
> 
> Change a similar check in em28xx_resume_extension()
> to use consistent logic as its siblings.
> 
> Fixes: be7fd3c3a8c5 ("media: em28xx: Hauppauge DualHD second tuner functionality")
> Signed-off-by: Tom Rix <trix@redhat.com>

Seems reasonable.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  drivers/media/usb/em28xx/em28xx-core.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
> index e6088b5d1b80..d60f4c2a661d 100644
> --- a/drivers/media/usb/em28xx/em28xx-core.c
> +++ b/drivers/media/usb/em28xx/em28xx-core.c
> @@ -1156,10 +1156,11 @@ int em28xx_suspend_extension(struct em28xx *dev)
>  	dev_info(&dev->intf->dev, "Suspending extensions\n");
>  	mutex_lock(&em28xx_devlist_mutex);
>  	list_for_each_entry(ops, &em28xx_extension_devlist, next) {
> -		if (ops->suspend)
> +		if (ops->suspend) {
>  			ops->suspend(dev);
> -		if (dev->dev_next)
> -			ops->suspend(dev->dev_next);
> +			if (dev->dev_next)
> +				ops->suspend(dev->dev_next);
> +		}
>  	}
>  	mutex_unlock(&em28xx_devlist_mutex);
>  	return 0;
> @@ -1172,11 +1173,11 @@ int em28xx_resume_extension(struct em28xx *dev)
>  	dev_info(&dev->intf->dev, "Resuming extensions\n");
>  	mutex_lock(&em28xx_devlist_mutex);
>  	list_for_each_entry(ops, &em28xx_extension_devlist, next) {
> -		if (!ops->resume)
> -			continue;
> -		ops->resume(dev);
> -		if (dev->dev_next)
> -			ops->resume(dev->dev_next);
> +		if (ops->resume) {
> +			ops->resume(dev);
> +			if (dev->dev_next)
> +				ops->resume(dev->dev_next);
> +		}
>  	}
>  	mutex_unlock(&em28xx_devlist_mutex);
>  	return 0;
> -- 
> 2.18.1
> 
