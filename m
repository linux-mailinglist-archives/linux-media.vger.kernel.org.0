Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B711E4BD1
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 19:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729087AbgE0R0y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 13:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728305AbgE0R0x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 13:26:53 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F697C03E97D;
        Wed, 27 May 2020 10:26:53 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id 69so195829otv.2;
        Wed, 27 May 2020 10:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ex7IpsFf5vbd7jDa3Cc2CVu/MVLoWad3EnAdTjcLBPg=;
        b=W14ZYt7B0s+6sp69P8egSf3n3GU4KMARtcC+sKGAR7EZL1CMGsGApc4CkKYz33Ke9R
         0Kz6opSggDS5k7zNVYDY7BqlQLCo74j/dq/IccFf+JDaWQDg1Aflh0+OgpSyIb+1rbko
         HZBafpVxfPPR7e/Cy48hPxO5X7BRO9DM+WSRT878+aKHW/prh1UoOWgApAW6lSCUwbXX
         75Zfq54qvt+YSDClr6MiZkL866iZJtKv4Z71NQ0w7j9DeLzDyMsTBHi3jhL0jtcrNZGs
         AZWaI+Ve4V+MoMbvKBw1BRi7xP2BT5kMh84NaZMv+6hsHp4JYkrUryG+RffzO3fdnFFM
         1XYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ex7IpsFf5vbd7jDa3Cc2CVu/MVLoWad3EnAdTjcLBPg=;
        b=iXboTczpRb5vmsrimUi9k6ZJlEbUHUdMMvMaXf0DHFymu3NFUaHiruT12v3HvY/Y33
         oOiNu2Y2U7IyqK7nvHNw1fDAtsnk6ZEpEipE2ISeAbGoeeYsot1oSAxpW1UvSGsynhSK
         ppC9WEtVzjoPWPyGwKpxhKfECo2ppT858m6YUUkl76rEIFymyKqJFuh1cYsXKTCD4ZOu
         XEjftlgoPFYU3ugabEUbqhWZwkvasu9DqDv1JfqtyTqjuZLEKiY6SRqmgsD10MsUVMqF
         1AHhtRZn6FbyJGjwukkYGZkNh0KvqdIiPq5KyoEy9inlgnM51oCnlNutaMm21GwcJ+Ut
         KXyg==
X-Gm-Message-State: AOAM531lrWe5tPGixaOMuchcf9w7Zz26WKEGiZuxA/NnXdjvPk6ZS3C4
        Rxue+MulcPZy1iA6ERSHeJaciUQbEtzIElkcos4jX2Y7KCwu+Q==
X-Google-Smtp-Source: ABdhPJzTyq00+feKUsqxEkGTaqHmpzb1Mewf2eP3T/E/jAHD5hI1IsXaTRpvoQYfkATzGTts+7Up9eKQOFQbHzvtJXI=
X-Received: by 2002:a9d:d83:: with SMTP id 3mr5242171ots.365.1590600412698;
 Wed, 27 May 2020 10:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200523114917.18222-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20200523114917.18222-1-dinghao.liu@zju.edu.cn>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 27 May 2020 18:26:25 +0100
Message-ID: <CA+V-a8vh+RFR3ta725pr_dudrPw5pSdHg3OUsDhb=76-0KUo1Q@mail.gmail.com>
Subject: Re: [PATCH] media: vpif: Fix runtime PM imbalance in vpif_probe
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     Kangjie Lu <kjlu@umn.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dinghao,

Thank you for the patch.

On Sat, May 23, 2020 at 12:49 PM Dinghao Liu <dinghao.liu@zju.edu.cn> wrote:
>
> When platform_get_resource() returns an error code, a
> pairing runtime PM usage counter decrement is needed
> to keep the counter balanced.
>
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/media/platform/davinci/vpif.c | 1 +
>  1 file changed, 1 insertion(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar

> diff --git a/drivers/media/platform/davinci/vpif.c b/drivers/media/platform/davinci/vpif.c
> index df66461f5d4f..f28c1b27eac6 100644
> --- a/drivers/media/platform/davinci/vpif.c
> +++ b/drivers/media/platform/davinci/vpif.c
> @@ -458,6 +458,7 @@ static int vpif_probe(struct platform_device *pdev)
>         res_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>         if (!res_irq) {
>                 dev_warn(&pdev->dev, "Missing IRQ resource.\n");
> +               pm_runtime_put(&pdev->dev);
>                 return -EINVAL;
>         }
>
> --
> 2.17.1
>
