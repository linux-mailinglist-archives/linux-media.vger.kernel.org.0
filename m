Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC4E5351C7F
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236167AbhDASRw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237151AbhDASNr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:13:47 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17ED8C0613AD
        for <linux-media@vger.kernel.org>; Thu,  1 Apr 2021 04:44:28 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id t20so868604plr.13
        for <linux-media@vger.kernel.org>; Thu, 01 Apr 2021 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U32Xl3i+DvBGu9DIngpNbbKksxWeEgvCfpwavzhzq+M=;
        b=U6k0aRtyT/YAqwZ9LCwDNUsQlw+SFxWmQ9bh45GG1kmLh9rU4+q0zApmYH+7u0K037
         dgE/ybzBNXvCrXQRW1wQPS/ECzvh8JmmeKGrYDL3BA1tbx+kaHflL9TOlFgRJRr7JTzq
         x7AL/rKBEaoxV4vUnCTHVFRlQTqUqCd2pAgTMd+rUvf5zK1gTZmTJ7xWKdzQ8dtjwFs/
         bPXymJ5zhMO0yBSoj+IJCjC8+2Uy8yH/pc+jlNG0v3NjwVA/xP1QsczpLi3+L2VEenUD
         PVnrPikzvh6JXVNZi7JGkVHMmU1YK1mEUyQmJxo/EDaW3br+1tWvrWHSOUEMp3LY336b
         LAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U32Xl3i+DvBGu9DIngpNbbKksxWeEgvCfpwavzhzq+M=;
        b=f7ORCvY8PyVxB0kMy+zK09BWRx0hBkPHbsIFzaQ9y1eiAkxKyABVgZ3c+5zhMUKNQr
         Qw2Kfnxew+KdWjQzgpjk3p1UaNXhmTqK0aZ4VgXNQtj7zktYQAc08akov9nfxXz41V+0
         aRcUQ2AlSIko6zV21fK0nIXl5hnOnd53lJNvi+71y3pd5ffjrytIH9lNln3sofoR1BF+
         7lZ0Lv1E0sAYw5oR4p3P/kDElukVZ6E3CKQZLJ0s4N7KCNFc6LISE4QJWqZTXY7QFGfQ
         o7wBmpsixq9Ae86+P0emYuSzYz3NK1RyJkB6+4MKw7oGsVMhHHwcdfgpxAzvGxDi6tMY
         Pz4g==
X-Gm-Message-State: AOAM532aovEaigBYFVER07xvhdgfzE/KMyMO9aWZdWMXBgK8sRSHOJvb
        tVuSQnzMMQlUwIgBTCKkhIVd4cQ/16rP4y9CIS+XJw==
X-Google-Smtp-Source: ABdhPJwbu1LZT4NHxa6D/4UADQAFr2uPFpDu6MUnRoVyM5I3njWKwU7En/mUJvtnAV19sz3G1xPHaNXgEINtnmo/3Nw=
X-Received: by 2002:a17:902:f68a:b029:e5:b17f:9154 with SMTP id
 l10-20020a170902f68ab02900e5b17f9154mr7458337plg.28.1617277467431; Thu, 01
 Apr 2021 04:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210401103500.1558058-1-yangyingliang@huawei.com>
In-Reply-To: <20210401103500.1558058-1-yangyingliang@huawei.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 1 Apr 2021 13:44:15 +0200
Message-ID: <CAG3jFyupb==xBb19wdv=TKheKuS_TEojhsvzmAATJsh1VUrdzg@mail.gmail.com>
Subject: Re: [PATCH -next] media: camss: csiphy: Remove redundant dev_err call
 in msm_csiphy_subdev_init()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Yang,

Thanks for the patch, feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Thu, 1 Apr 2021 at 12:33, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> There is an error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 6ceb6d7d53d1..b3c3bf19e522 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -593,20 +593,16 @@ int msm_csiphy_subdev_init(struct camss *camss,
>
>         r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[0]);
>         csiphy->base = devm_ioremap_resource(dev, r);
> -       if (IS_ERR(csiphy->base)) {
> -               dev_err(dev, "could not map memory\n");
> +       if (IS_ERR(csiphy->base))
>                 return PTR_ERR(csiphy->base);
> -       }
>
>         if (camss->version == CAMSS_8x16 ||
>             camss->version == CAMSS_8x96) {
>                 r = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>                                                  res->reg[1]);
>                 csiphy->base_clk_mux = devm_ioremap_resource(dev, r);
> -               if (IS_ERR(csiphy->base_clk_mux)) {
> -                       dev_err(dev, "could not map memory\n");
> +               if (IS_ERR(csiphy->base_clk_mux))
>                         return PTR_ERR(csiphy->base_clk_mux);
> -               }
>         } else {
>                 csiphy->base_clk_mux = NULL;
>         }
> --
> 2.25.1
>
