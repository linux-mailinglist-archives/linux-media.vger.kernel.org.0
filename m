Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134023771F2
	for <lists+linux-media@lfdr.de>; Sat,  8 May 2021 15:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbhEHNDW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 May 2021 09:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhEHNDU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 May 2021 09:03:20 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3113C061574;
        Sat,  8 May 2021 06:02:17 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 15so15589391ybc.0;
        Sat, 08 May 2021 06:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m8n1RVy0uySX4EeEK2a9QiZXfMDvuOsOW8yZyEoM5m0=;
        b=LIyOTWm4CuS3iXqrOiO7M5nyflSltv/6B9Az6rQX22H6hVA7q+hF+Uc66rRdUN/djp
         R8t4R3Nlg6Wh/jNfSZfP3zfRE93jw8oqTom2lb7+dkedDfZ58CEDe1RC3+27chOYHuB/
         kDXWLzKT6COm1KHDAnhbe0ZrxHDhjMFqNYePkBv0kGnIw4PIERACivg63B6uahmysh5q
         dzjI3ean2/2knd3ctBmToy82Iqmw/MjZ2fBQdDJNirhBtl8laTmbed2ZFgx/5BmKAvs1
         Qowgqz2BJNXqJ+SjTmCWIPU48xe/JDXbZD/xM5+jDoDA+lTVBd7/7u0VQDqbiNq9Ah1U
         jlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m8n1RVy0uySX4EeEK2a9QiZXfMDvuOsOW8yZyEoM5m0=;
        b=OMazGBUvtHPL3Ko93eivJuPRrKGZxsH+3nGAQ0rAvhL7QqiLUR7iI8ViPmNX0CKu9F
         /6A0crrMJdWp6oaQF5ji8fKc6vABjDDiqxy3Yl+MdLXi/TQs1h7/eSK3l10ew2aPn3K6
         QRNyc1BkcYg3VhLbpIkc2Ve1lvV0gKFWKXgR6h8qP81aLWX58gmy4SSrahbDa7CnN0pc
         XMkdXSQv/JrSv+SGbRLJsg8GAxtEPo/LRqwG5rfEO/67I7pOXBOhgb9EgSnZxsPWKtpy
         3EQkvnFstVcFtyInWqon7gQ5Mz5IRGTpVHBV12ZJQcGevMw10EBvUOzGj/PKCqKDD2Vg
         bqvQ==
X-Gm-Message-State: AOAM530QfOiWXWUiX11eakGcWvXh1Y9YahBuQvxXbizT4Ghb/VBp36zP
        xHlxlLO3ifKpEqN2q95luhTjE2PV80iiPB9Muof3XqsyAAaeOw==
X-Google-Smtp-Source: ABdhPJyt8krSibCIBTKlHCXun2hXSLfmRrWa6NFj+l3jaMEn2tELmCqLNtXtRHaEAVp78XLbbletMGOzZLuoa7Sdcrs=
X-Received: by 2002:a25:5741:: with SMTP id l62mr19739217ybb.119.1620478936935;
 Sat, 08 May 2021 06:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1620207353.git.mchehab+huawei@kernel.org> <8688555079cf30f5848bb020b5ecf0b0132b2c7e.1620207353.git.mchehab+huawei@kernel.org>
In-Reply-To: <8688555079cf30f5848bb020b5ecf0b0132b2c7e.1620207353.git.mchehab+huawei@kernel.org>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 8 May 2021 14:01:51 +0100
Message-ID: <CA+V-a8sLF-q13RaM-9g5XRtU_t_5Ztn5X7hsg=AdgMPOEpdTZA@mail.gmail.com>
Subject: Re: [PATCH 16/25] media: am437x: fix pm_runtime_get_sync() usage count
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Thank you for the patch.

On Wed, May 5, 2021 at 10:42 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> Replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter, avoiding
> a potential PM usage counter leak.
>
> While here, ensure that the driver will check if PM runtime
> resumed at vpfe_initialize_device().
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/platform/am437x/am437x-vpfe.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
Acked-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar


> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index 6cdc77dda0e4..1c9cb9e05fdf 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> @@ -1021,7 +1021,9 @@ static int vpfe_initialize_device(struct vpfe_device *vpfe)
>         if (ret)
>                 return ret;
>
> -       pm_runtime_get_sync(vpfe->pdev);
> +       ret = pm_runtime_resume_and_get(vpfe->pdev);
> +       if (ret < 0)
> +               return ret;
>
>         vpfe_config_enable(&vpfe->ccdc, 1);
>
> @@ -2443,7 +2445,11 @@ static int vpfe_probe(struct platform_device *pdev)
>         pm_runtime_enable(&pdev->dev);
>
>         /* for now just enable it here instead of waiting for the open */
> -       pm_runtime_get_sync(&pdev->dev);
> +       ret = pm_runtime_resume_and_get(&pdev->dev);
> +       if (ret < 0) {
> +               vpfe_err(vpfe, "Unable to resume device.\n");
> +               goto probe_out_v4l2_unregister;
> +       }
>
>         vpfe_ccdc_config_defaults(ccdc);
>
> @@ -2530,6 +2536,11 @@ static int vpfe_suspend(struct device *dev)
>
>         /* only do full suspend if streaming has started */
>         if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
> +               /*
> +                * ignore RPM resume errors here, as it is already too late.
> +                * A check like that should happen earlier, either at
> +                * open() or just before start streaming.
> +                */
>                 pm_runtime_get_sync(dev);
>                 vpfe_config_enable(ccdc, 1);
>
> --
> 2.30.2
>
