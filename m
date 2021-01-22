Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29D1B2FFEBF
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 09:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbhAVIyU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 03:54:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbhAVIyJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 03:54:09 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777D6C0613D6
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 00:53:29 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id m6so3286887pfk.1
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 00:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tkp1AM3SOFlgt4la6k8MPcrZ9tBBbiBq6V7Fxeng6AA=;
        b=Cl5IIv+n0My70Rbzrlr0HpFArXIDhIZtAA+1BI880I2DSMOOM0lUC5mDvrfm8gGlxb
         UQ9lYhJqOI6QQ0+bGekELIH6eYe7u/Kqnsur09b2kx7JQQUSBEzgaKC3eqrud39Smz4W
         YK1AouMruQktpA0dJBdSoyYyN5yIJwvxaIwJKZYr2NIKfquMSvFUvK5aVUFRJKCQAtTI
         oiGgWIf01vqVX+1pPwBawTQGo2GbFVviAnrMTr1rNE7EhBCAG2bw1BXbF2eudO8msCzw
         MNBDAqGYMd3iQIqhZjU/WLxivpojedA6Fs4gSBvFpoVMyYy7ocW5TAZEHY8iNPJJJ3AU
         iefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tkp1AM3SOFlgt4la6k8MPcrZ9tBBbiBq6V7Fxeng6AA=;
        b=KyA5ECRrG2iF4lPrTPkH4RE3VmUex1MbFXq0y75S/WKhyOSelgQmZW4Fi1OJstADd2
         niM1sqhHKE2MCk+ZvPNlsbzrf97aXLyHTJE0sRvit/YSrANN7//92H6ur+5QcGe9u27K
         4nmFhHREcwMMoXHpWEpOsrtClKmaDqla1mPqc12/2gv+9tDfK0D0f9lDueKM8tAgAXqT
         EXJhkh1CIJ0KKS7RXT+di8p+HDDuJTkB3xQ6t+lQ0wAbpmWkIAaArdMb1JqdgBCjSPfU
         RZL1htu8HRZAxBqvNpMqKyH/9fRvdJSi2Gjj7GSEMpUoRBXqPBg3CWluDvPKJZTGMzH1
         ptqg==
X-Gm-Message-State: AOAM531kER66u6l+aRuwAHJ8V2KUsyszmJwfJ+hbVryz2WUescT5XBwz
        NoBnIQGin//dLb8J1muVk+jWNQRCbiD88Ce0XzHDBw==
X-Google-Smtp-Source: ABdhPJxNyZhjLGVmRTc4jfhkoB4lXYvXjrHvOE8BUUbRG1C4AO6Ln0IW8psVrzCLx8Y4VRN3BlIc3PoGpm5hz0Bw6QU=
X-Received: by 2002:a63:e151:: with SMTP id h17mr3766600pgk.120.1611305609006;
 Fri, 22 Jan 2021 00:53:29 -0800 (PST)
MIME-Version: 1.0
References: <1611217731-56866-1-git-send-email-abaci-bugfix@linux.alibaba.com>
In-Reply-To: <1611217731-56866-1-git-send-email-abaci-bugfix@linux.alibaba.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Fri, 22 Jan 2021 09:53:17 +0100
Message-ID: <CAG3jFytsopFdw=McsXYgh4Bg6xtGgMqY33++3VxuV98xMSNEMA@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: remove redundant NULL check
To:     Yang Li <abaci-bugfix@linux.alibaba.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media <linux-media@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for the patch.

Feel free to add my r-b:
Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Thu, 21 Jan 2021 at 09:31, Yang Li <abaci-bugfix@linux.alibaba.com> wrote:
>
> Fix below warnings reported by coccicheck:
> ./drivers/staging/media/atomisp/pci/sh_css_params.c:1575:2-8: WARNING:
> NULL check before some freeing functions is not needed.
> ./drivers/staging/media/atomisp/pci/sh_css_params.c:3006:2-8: WARNING:
> NULL check before some freeing functions is not needed.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <abaci-bugfix@linux.alibaba.com>
> ---
>  drivers/staging/media/atomisp/pci/sh_css_params.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index 24fc497..569473b9 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -1575,8 +1575,7 @@ struct ia_css_isp_3a_statistics_map *
>         return me;
>
>  err:
> -       if (me)
> -               kvfree(me);
> +       kvfree(me);
>         return NULL;
>  }
>
> @@ -3006,8 +3005,7 @@ static void free_map(struct sh_css_ddr_address_map *map)
>         }
>
>         kvfree(params);
> -       if (per_frame_params)
> -               kvfree(per_frame_params);
> +       kvfree(per_frame_params);
>         stream->isp_params_configs = NULL;
>         stream->per_frame_isp_params_configs = NULL;
>
> --
> 1.8.3.1
>
