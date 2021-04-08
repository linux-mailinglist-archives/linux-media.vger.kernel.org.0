Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30656357FED
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 11:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbhDHJvR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 05:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbhDHJvR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 05:51:17 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50388C061760;
        Thu,  8 Apr 2021 02:51:06 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id w10so1037788pgh.5;
        Thu, 08 Apr 2021 02:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f2CrD7zytwdxUdd+RrcJ2fDn/wxf5jDuY/dOIB395dY=;
        b=HmXQvdnhzVc2Jn7za5jIyK8J+1N/B42mbO0WjVyMtD/JrfAz7tGWMtU92wqETfhzAh
         uIa4Ob+LfTdH8qEiOq6zlcGw4C/+5ZuUel8aUIPjuBFDRtIO1auO1hdILDA3TeVwt1pc
         4PgK//U+jJua7fOWEq/WXjtAadT1gEux2XbNE953DqlpWXWmrD0rdr1iKB+g78uhvvuy
         M3pdxmb9EY48Ia+CfKHBxBi16Tu/A9HUgikR3SYIJID84Q/ucuDhUCiM8t7M3hNVJkMs
         UrIB2MBA8LjLaFMaLik1Gm8ZrU44cSPfnDqmikSRSVFdyLq4qUBQBBap87OIcrLsmVnb
         Lbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f2CrD7zytwdxUdd+RrcJ2fDn/wxf5jDuY/dOIB395dY=;
        b=WT1K2B2nRhCDGwPfq0g//IecC2/zlDE1zn09Au9vTmwYPCN0lnCFIXKfdPUBwwNZjt
         5DKSsNYzNyM93VETi0bvhsZJAzZwRfdf6OogylWN0EgBiu7nJsl18I4HqmMqlv/8uTR7
         yoPHnj6hp7BSbq7cWEp5YJDq3cdVdw2leTejIerETdTrrimHVYEMYsIjhr0A+GkI0IID
         P8jtkUnBcF/7djS0tR+1T/Yvh04tF+UdbsUQcmMaCe4rmpR3isO8KThCxkhAh6FpHg+M
         IJ6kItRn3r1RZGPhLHJPNv40pd2wifQUudkO7cW3NFlzetViUm3gkojalW7HegP1e6F3
         MJqA==
X-Gm-Message-State: AOAM531h7KiT3/d6GT2GaOTCSaSmoIj+UghgKHPakPpyFJ8PjqSplOrA
        zpPDsEeydIuNoTLq6CFssUQBLBNuzDIYVy/1Qi23otzdqMQNqA==
X-Google-Smtp-Source: ABdhPJySmkGXyA4hCpShj73VGaOhDOQlhk1pEuV/dP4z7YxYZcl9vRJW/mfimWqrToOUcrQH3ktvU0HWdiKR5wS4Rrg=
X-Received: by 2002:a63:cb44:: with SMTP id m4mr7331898pgi.4.1617875465880;
 Thu, 08 Apr 2021 02:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210408081850.24278-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20210408081850.24278-1-dinghao.liu@zju.edu.cn>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 8 Apr 2021 12:50:49 +0300
Message-ID: <CAHp75VftjKTDJj+8m1HajMfnbLCdZ8UCNxU9wj4Pio0+FK=O4g@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: Fix runtime PM imbalance in atomisp_pci_probe
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     Kangjie Lu <kjlu@umn.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 8, 2021 at 11:19 AM Dinghao Liu <dinghao.liu@zju.edu.cn> wrote:
>
> When hmm_pool_register() fails, a pairing PM usage counter
> increment is needed to keep the counter balanced. It's the
> same for the following error paths.

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index 0295e2e32d79..02f774ed80c8 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -1815,6 +1815,7 @@ static int atomisp_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>         hmm_cleanup();
>         hmm_pool_unregister(HMM_POOL_TYPE_RESERVED);
>  hmm_pool_fail:
> +       pm_runtime_get_noresume(&pdev->dev);
>         destroy_workqueue(isp->wdt_work_queue);
>  wdt_work_queue_fail:
>         atomisp_acc_cleanup(isp);
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
