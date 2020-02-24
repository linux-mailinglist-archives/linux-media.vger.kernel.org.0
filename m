Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35133169CAF
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2020 04:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbgBXDjv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Feb 2020 22:39:51 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42402 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727166AbgBXDju (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Feb 2020 22:39:50 -0500
Received: by mail-pf1-f196.google.com with SMTP id 4so4625901pfz.9
        for <linux-media@vger.kernel.org>; Sun, 23 Feb 2020 19:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pm6Cv3S5H0C25dDQ/meb190wtQtToeJ+qVX2sM7b/vQ=;
        b=m2Uke2AoNl6cfhq6pb/5axLLlXF0Zv3XmG9O+matyX/TgoygLaMgzzOgDGkgsgTxnQ
         Umxa1/QZAzGXaidVpC+fl9U2QJ0CJOAvBHDzFUn/Zqm5fHmCgTiqoIISRB/k0NV5QOST
         czBmkhGqpvkgGdVmlkJkrr7IbZhuGAC4rYNdj120HqNI+E/ta1yQmlvF6KZyR2JTvKSu
         VIRyGkttYX05Q5Yi0u3nAdFighsj5QctjtWt0qZBKx/fS78rU1cT0haLiQp88P7Xq0nu
         x1ttbbf2AhLEM7GjXdwOadakMeyxfxHTzLsrMVoFiG9nHz+5VZKUAlogeUOrsp4Fs8Q9
         XrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pm6Cv3S5H0C25dDQ/meb190wtQtToeJ+qVX2sM7b/vQ=;
        b=dRXNLDys4KwPaZd2O+KzoZlMyQ20Zbb6w0k4tPGqtiItCVCdpE87RupIn5QK36fyEP
         I6RWMeQutLJnwbED35aQqmsV9z8jHvs4FOczG9S4G4t4sVoT9ubDn79ro5CYahO6eXii
         tLmK27mwbTLQJyZzKnsKErYSfsX5nJebHJz3qmOz1DcrWI6syX27mjGJVXPZIf4xylOz
         599AdmTL4qtLtjN3KB6YxAgrphZFriu4OhIUxAfXn56nPwJwK7gWx0zjPasqM6DeQpfl
         lGL38z5koK+gRAQIxpwfdklDWxI4o8XrLEfM/2QEW/aWG5DPhFcrXLP0NUxSJ/htYuiG
         B6rA==
X-Gm-Message-State: APjAAAUp2OrqvMhl1rSOIEAD1StDBvDwFiw8e7oo8LI2EmZe9QO4fn6g
        Rk9Tp0iYtiZCkkVvbf/MEF2Nrw==
X-Google-Smtp-Source: APXvYqzc2p8QvebEpaDzCO6Mrop/L/saGJ7o6R7zbV2ytCI8l57+nTlirD3I1M2aFJGXaVNfW6Zl6A==
X-Received: by 2002:a62:25c6:: with SMTP id l189mr49936947pfl.136.1582515589543;
        Sun, 23 Feb 2020 19:39:49 -0800 (PST)
Received: from google.com ([2401:fa00:fc:1:28b:9f23:d296:c845])
        by smtp.gmail.com with ESMTPSA id h3sm10345179pfo.102.2020.02.23.19.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 19:39:48 -0800 (PST)
Date:   Mon, 24 Feb 2020 11:39:41 +0800
From:   Martin Liu <liumartin@google.com>
To:     sumit.semwal@linaro.org, minchan@kernel.org, surenb@google.com,
        wvw@google.com
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        liumartin@google.com, jenhaochen@google.com
Subject: Re: [PATCH] dma-buf: support 32bit DMA_BUF_SET_NAME ioctl
Message-ID: <20200224033941.GB211610@google.com>
References: <20200114134101.159194-1-liumartin@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200114134101.159194-1-liumartin@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 14, 2020 at 09:41:01PM +0800, Martin Liu wrote:

CC more MLs for winder review.

> This commit adds SET_NAME ioctl coversion to
> support 32 bit ioctl.
> 
> Signed-off-by: Martin Liu <liumartin@google.com>
> ---
>  drivers/dma-buf/dma-buf.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index ce41cd9b758a..a73048b34843 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -25,6 +25,7 @@
>  #include <linux/mm.h>
>  #include <linux/mount.h>
>  #include <linux/pseudo_fs.h>
> +#include <linux/compat.h>
>  
>  #include <uapi/linux/dma-buf.h>
>  #include <uapi/linux/magic.h>
> @@ -409,13 +410,32 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
>  	dma_resv_unlock(dmabuf->resv);
>  }
>  
> +#ifdef CONFIG_COMPAT
> +static long dma_buf_ioctl_compat(struct file *file, unsigned int cmd,
> +				 unsigned long arg)
> +{
> +	switch (_IOC_NR(cmd)) {
> +	case _IOC_NR(DMA_BUF_SET_NAME):
> +		/* Fix up pointer size*/
> +		if (_IOC_SIZE(cmd) == sizeof(compat_uptr_t)) {
> +			cmd &= ~IOCSIZE_MASK;
> +			cmd |= sizeof(void *) << IOCSIZE_SHIFT;
> +		}
> +		break;
> +	}
> +	return dma_buf_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
> +}
> +#endif
> +
>  static const struct file_operations dma_buf_fops = {
>  	.release	= dma_buf_release,
>  	.mmap		= dma_buf_mmap_internal,
>  	.llseek		= dma_buf_llseek,
>  	.poll		= dma_buf_poll,
>  	.unlocked_ioctl	= dma_buf_ioctl,
> -	.compat_ioctl	= compat_ptr_ioctl,
> +#ifdef CONFIG_COMPAT
> +	.compat_ioctl	= dma_buf_ioctl_compat,
> +#endif
>  	.show_fdinfo	= dma_buf_show_fdinfo,
>  };
>  
> -- 
> 2.25.0.rc1.283.g88dfdc4193-goog
> 
