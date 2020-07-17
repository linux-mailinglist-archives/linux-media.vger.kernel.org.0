Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC3F2238C5
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 11:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgGQJzl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 05:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgGQJzk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 05:55:40 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4747EC061755;
        Fri, 17 Jul 2020 02:55:40 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id p26so1747360oos.7;
        Fri, 17 Jul 2020 02:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oGHifvlf/HbJ5pbC1JrepfaNxTOZH7NvvEomCEvCSFs=;
        b=hTEcmskvt6ltxtTePZN2NozRNi16ia3OaHE0zlZ2fHiGwMHqe2hYnL9qye8cCD4u6o
         PGsxhgYHaPBBreX/bCCumKuAyTabxgnDPo5/uRFwi3WAoYZ7/QnKrc2J6u0yWWHkCY6O
         XtNTm4IVjNUjCZNI16AF888AFQMeIdxOf/q8VU8rzquTBkwIVuDdIdD/1/6aLM469Git
         fNbWE1VMj3cXT+haQIFrEPg1Qrt1aRwIAI9AsTfplajDccXrKloAMfa7gUzpGzta7F/l
         sf2F92AQyMPjDLzMENCl1lPSYBqnu/Q/hSAFe7DgvlYgpdhi/f0ExIfc9yjuRMMLZNaK
         RApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oGHifvlf/HbJ5pbC1JrepfaNxTOZH7NvvEomCEvCSFs=;
        b=TLLAYVfMFLcLkM2LfuP6thSsP6XXPXczaadC+Ij/Fso78VCL9/SYuxFbN8UTN4Bsou
         vv52SGP5cRKJq1XrbwuaBN0W2e0fp+wiIw7scKrRxtGfjzG1KL/x/ksCywJRDH1m30NP
         CoCzjmqhPcK0NA0fJwP4VFgMQ8CVf4hDyWSyzsMP4L+WhkzglUvlVK9bDv1oOl0SxOQZ
         54pnsYg5LQ2lm5Aj/SZo7nQl/FWzX1T7lKWwdCb/34MpYLctJKZCDJz/TuF22YTljJB6
         16TefZZCMU85NVmQyREh6B0h8rA54DFgAcvjJeNwG1heE91ipUCZXxRwABjYW8oNLdn2
         iz+g==
X-Gm-Message-State: AOAM531DGzOI4wLyZKMrnrk/yMxYIYhxCGaeLq1Jyz+pr3cSadnTw0AK
        D3ulBvfBOHPN+bSHuQsYWTmw/GDXPPL0icLDiMbMFQOQ
X-Google-Smtp-Source: ABdhPJyHkAUM4tu03EyydI36alK/e4dJ+/7rQIW8HB0MdZnnsL3p05DAothkh63l4EI83t4DDQqQJ0AntHJRJVPY0XQ=
X-Received: by 2002:a4a:98c8:: with SMTP id b8mr7821728ooj.42.1594979739612;
 Fri, 17 Jul 2020 02:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200714172049.27738-1-novikov@ispras.ru>
In-Reply-To: <20200714172049.27738-1-novikov@ispras.ru>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 17 Jul 2020 10:55:13 +0100
Message-ID: <CA+V-a8sekdRDqahs-Zi-KiSbdv0sRHy7KuHraTRtuE6mz2+beg@mail.gmail.com>
Subject: Re: [PATCH] media: isif: reset global state
To:     Evgeny Novikov <novikov@ispras.ru>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, ldv-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Evgeny,

Thank you for the patch.

On Tue, Jul 14, 2020 at 6:20 PM Evgeny Novikov <novikov@ispras.ru> wrote:
>
> isif_probe() invokes iounmap() on error handling paths, but it does not
> reset the global state. So, later it can invoke iounmap() even when
> ioremap() fails. This is the case also for isif_remove(). The patch
> resets the global state after invoking iounmap() to avoid this.
>
> Found by Linux Driver Verification project (linuxtesting.org).
>
> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
> ---
>  drivers/media/platform/davinci/isif.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/davinci/isif.c b/drivers/media/platform/davinci/isif.c
> index c98edb67cfb2..c53cecd072b1 100644
> --- a/drivers/media/platform/davinci/isif.c
> +++ b/drivers/media/platform/davinci/isif.c
> @@ -1075,10 +1075,14 @@ static int isif_probe(struct platform_device *pdev)
>         release_mem_region(res->start, resource_size(res));
>         i--;
>  fail_nobase_res:
> -       if (isif_cfg.base_addr)
> +       if (isif_cfg.base_addr) {
>                 iounmap(isif_cfg.base_addr);
> -       if (isif_cfg.linear_tbl0_addr)
> +               isif_cfg.base_addr = NULL;
> +       }
> +       if (isif_cfg.linear_tbl0_addr) {
>                 iounmap(isif_cfg.linear_tbl0_addr);
> +               isif_cfg.linear_tbl0_addr = NULL;
> +       }
>
As the probe itself is failing I don't see a benefit in setting the
pointers to NULL. Unless I'm missing something.

Cheers,
--Prabhakar

>         while (i >= 0) {
>                 res = platform_get_resource(pdev, IORESOURCE_MEM, i);
> @@ -1096,8 +1100,11 @@ static int isif_remove(struct platform_device *pdev)
>         int i = 0;
>
>         iounmap(isif_cfg.base_addr);
> +       isif_cfg.base_addr = NULL;
>         iounmap(isif_cfg.linear_tbl0_addr);
> +       isif_cfg.linear_tbl0_addr = NULL;
>         iounmap(isif_cfg.linear_tbl1_addr);
> +       isif_cfg.linear_tbl1_addr = NULL;
>         while (i < 3) {
>                 res = platform_get_resource(pdev, IORESOURCE_MEM, i);
>                 if (res)
> --
> 2.16.4
>
