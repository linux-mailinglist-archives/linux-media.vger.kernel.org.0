Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B13E3461FD
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 15:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232459AbhCWOyw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 23 Mar 2021 10:54:52 -0400
Received: from mail-vk1-f169.google.com ([209.85.221.169]:34648 "EHLO
        mail-vk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232000AbhCWOxk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 10:53:40 -0400
Received: by mail-vk1-f169.google.com with SMTP id j15so4690565vkc.1;
        Tue, 23 Mar 2021 07:53:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=V+khgln+GzsA2ouO69uX9qPSGd3PQX6NAGj4rz2Yres=;
        b=T9ZQ1Yk4yF15+cpvxx6gsoK2V0mGxGQfoiy0ybxGhiVzsZWp8rI8vVXLEZVBwv5Ov4
         TSazYs+FMiBhNwaYk0H8Rv9cmxFJ63qzeyboJ6dK3VIe3MO/zkTYrnwbcKsuDjAxWf0Q
         TGpE1URfPYoTxxWf/dAoHymWC4FK5gtIi1tP3vsS2RyBg4lMPgvIogoeV/Zja3kript2
         0mSqFFdgeywNoIKP08JIqZXwqXRlBOYWINqlhiA7EIheKrIQ8Bnr7sOeC9ovefKr9yh3
         fM9Xcnbd+55vwsod003a/mgqnH6p8HJdSQ2GTWyyz/EuVsrUkcJhov/uwGNJmh5d9xGf
         QZSQ==
X-Gm-Message-State: AOAM530KDjXDn8laRe4Qo1pxIerm+2Lp9/jBvFhBK7H60pqhA+KX5tdw
        5OhuNaWuTRJ8LictIwv/HCUv/+HlHH35xMlvnZPOnCiD41s=
X-Google-Smtp-Source: ABdhPJyfydFv1VrvFxxLrxcFoTHRNWicvOLRC0HhAb3aAqLqFbyA+dx546Psp/XsPM+UcVBV+v1AADcYyjRzkImLFwk=
X-Received: by 2002:ac5:cbee:: with SMTP id i14mr3781078vkn.1.1616511218915;
 Tue, 23 Mar 2021 07:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210312132459.1754782-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210312132459.1754782-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Mar 2021 15:53:27 +0100
Message-ID: <CAMuHMdXbhzzYUwiXg8h2KPdTb-c5peogDK_saGvDir36zNAq4w@mail.gmail.com>
Subject: Re: [PATCH] media: rcar-csi2: Enable support for r8a77961
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Mar 12, 2021 at 2:26 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Enable support for M3-W+ (r8a77961).
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -1164,6 +1164,10 @@ static const struct of_device_id rcar_csi2_of_table[] = {
>                 .compatible = "renesas,r8a7796-csi2",
>                 .data = &rcar_csi2_info_r8a7796,
>         },
> +       {
> +               .compatible = "renesas,r8a77961-csi2",
> +               .data = &rcar_csi2_info_r8a7796,

Hence CSI2 on R-Car M3-W+ is handled the same way as R-Car M3-W.
I don't know what this means for the driver, but according to Technical
Update TN-RCT-S0359A/E, R-Car M3-W+ supports lane settings 4/2/1 on
CSI40/41 (like most other R-Car Gen3 SoCs), while R-Car M3-W supports
only lane setting 4 on CSI40/41.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
