Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 044C41E6389
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 16:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391029AbgE1ORZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 10:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391022AbgE1ORT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 10:17:19 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F69C05BD1E
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 07:17:19 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id e1so2124426vkd.1
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BuuJ1LHr7B0D8g7eMjAHiAe1fYFy/QuFchre+f7F2cI=;
        b=lFlx+Y5+BUfKHtlP+elnq8ReiE97j9UIu82aEsFl8cz/Tp7zjdAMrb1MNJOECARaP4
         vRqzP98sYOszXMdn5TOvKP+Zb/VRf5V1+LLlbF0YOocMCIBnB+qL46UiLuNaVagJiOLm
         teFAdK0pIy+W/AFSR5OZsEWyFZa2vGrMCFm79jMy0gLLLKLBy43IvYtLnsrj7Go6tz8c
         64xYqvZ+gZ1CMMsTy+AmuGVqlFmjTVCZk83fWrVPmwhknhiDYCJwdThEKVfktQ3NyvHh
         NPZz85Uw+q36hEh1arPlO4A9HfZsT039Bk1VQdWrdJM61Pa423UhQ0o5gaJfRm4QHHzr
         /Wsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BuuJ1LHr7B0D8g7eMjAHiAe1fYFy/QuFchre+f7F2cI=;
        b=fAUclhdjWxLRfc2kd+eFUcCra75ct4N89LSuSsRD0EMGJ9Tfn8El8Fpn5wbmk09qfJ
         61oukMrFw0lkNOuOaBHYK616+z1D4w2ZY5Oaj88fslQD9yj+G1XFJ5fMnYSwAIdvF/cS
         ZGIwq9dih9u27kkCEv8vVcbsuDqrmsdhVu68pgkgRi8DunZrOp0lEJ1gpAOrgdelUQPM
         yk6wBaPON/U7MCdzXrYv2qcs39iVDocQxZAGfgQZhepS95VUgVR5eCRjp6ykWvxw8j36
         xLjGm5K3PpUQG5hdJn+GYOFF7pAgGlei7zJDp6ZDZJQXiKU4s4c1BBS/TvhedQipDFJT
         NX6g==
X-Gm-Message-State: AOAM532fQb+Kf5De1KrHy6fjDougB5YR3yPJQAeVPAJNsDJDfQPg3CH8
        8aqJKLc5tWm/IzEMmPRqk2Nvsuvlqm5qZCsWUCEYSD825qw=
X-Google-Smtp-Source: ABdhPJyFq0sy87bcDDV4B0w526F0rr56imrsl10NiW+RLPfH0tc0nFJzTbjhvpQLXbvgFrMuGv3blVrJBDS6GlwUgDI=
X-Received: by 2002:ac5:cded:: with SMTP id v13mr2325192vkn.59.1590675438652;
 Thu, 28 May 2020 07:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200528140337eucas1p2499a623f10d9bedf568f3a9bf55320f7@eucas1p2.samsung.com>
 <20200528140326.5215-1-m.szyprowski@samsung.com>
In-Reply-To: <20200528140326.5215-1-m.szyprowski@samsung.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 28 May 2020 16:16:42 +0200
Message-ID: <CAPDyKFqaD74m17ROncd8YA6bFY+m3ePX=jenSfVGq1K9E9zONQ@mail.gmail.com>
Subject: Re: [PATCH] media: s5p-mfc: Properly handle dma_parms for the
 allocated devices
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 28 May 2020 at 16:03, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms for
> platform devices") in v5.7-rc5 added allocation of dma_parms structure to
> all platform devices. Then vb2_dma_contig_set_max_seg_size() have been
> changed not to allocate dma_parms structure and rely on the one allocated
> by the device core. Lets allocate the needed structure also for the
> devices created for the 2 MFC device memory ports.
>
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Fixes: 9495b7e92f71 ("driver core: platform: Initialize dma_parms for platform devices")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/media/platform/s5p-mfc/s5p_mfc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
> index 5c2a23b953a4..eba2b9f040df 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
> @@ -1089,6 +1089,10 @@ static struct device *s5p_mfc_alloc_memdev(struct device *dev,
>         child->coherent_dma_mask = dev->coherent_dma_mask;
>         child->dma_mask = dev->dma_mask;
>         child->release = s5p_mfc_memdev_release;
> +       child->dma_parms = devm_kzalloc(dev, sizeof(*child->dma_parms),
> +                                       GFP_KERNEL);
> +       if (!child->dma_parms)
> +               goto err;
>
>         /*
>          * The memdevs are not proper OF platform devices, so in order for them
> @@ -1104,7 +1108,7 @@ static struct device *s5p_mfc_alloc_memdev(struct device *dev,
>                         return child;
>                 device_del(child);
>         }
> -
> +err:
>         put_device(child);
>         return NULL;
>  }
> --
> 2.17.1
>
