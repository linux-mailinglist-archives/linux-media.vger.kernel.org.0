Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8159E36C438
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238573AbhD0KgM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 27 Apr 2021 06:36:12 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:36834 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239366AbhD0KfV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:35:21 -0400
Received: by mail-vs1-f49.google.com with SMTP id k124so29830268vsk.3;
        Tue, 27 Apr 2021 03:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=S0cJtJfc534Em5VnHNzsiz6oCj7KRpx2g8W8LK2sYfU=;
        b=YMHISJQw3EzyLp/seKWlOOIYJwk9bwgZN1oPnb48I0mp1cDgampmTrhHbMCj2q+AH9
         fZFxR+88qF/ptVBAF6vBEwIKR67hiJELkP4MyDVzjhfCe4crKYnzdkDzpGfYBUq4hkSX
         LBi28eMFdLyRADaj6xxvfzTxct6WTA+69msOEuXBJ9uzX6LH+RJPRpa+zmOxYLXvI/cP
         uGZzSAPB23n4x6Kdmiv5mYbEqZEm5hf4At8h4dL91sqtucvDahFhli+Y94WRdhqtOb8q
         me4p5FRTjJWRJG7nyMLFmrDWkodBmC5/GNSOjF4JFQZ80f3P9sqU4Hy2ECdkOqtfAle6
         mrxA==
X-Gm-Message-State: AOAM531zbpAvH58aZSj/HFh0a/UfL70CgE0z+ArVP42Jb4q6mbY9BRNT
        JxdgqQfyO1+zM7TooObruRzHwPoPKoHbpDWFNnICVzDM
X-Google-Smtp-Source: ABdhPJwMaT63hz5rFbbWxt3corYksraj1MZ36zfgaDtOrUqvChKXeNvWs9w4pVdaXjDdqymixFHz3lbdGePYuG17oG4=
X-Received: by 2002:a67:fc57:: with SMTP id p23mr17130308vsq.40.1619519678259;
 Tue, 27 Apr 2021 03:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619519080.git.mchehab+huawei@kernel.org> <85d92ba9e709ef00673a3e0e11769b121745e9cb.1619519080.git.mchehab+huawei@kernel.org>
In-Reply-To: <85d92ba9e709ef00673a3e0e11769b121745e9cb.1619519080.git.mchehab+huawei@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Apr 2021 12:34:27 +0200
Message-ID: <CAMuHMdWARHzOYud0_Evvbia2FLGS6djHVcC8HOGxRjCcHFRYgg@mail.gmail.com>
Subject: Re: [PATCH v3 78/79] media: rcar-vin: use pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linuxarm <linuxarm@huawei.com>, mauro.chehab@huawei.com,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 27, 2021 at 12:28 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
>
> Use the new API, in order to cleanup the error check logic.
>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -408,6 +408,12 @@ static void rcsi2_enter_standby(struct rcar_csi2 *priv)
>
>  static void rcsi2_exit_standby(struct rcar_csi2 *priv)
>  {
> +       /*
> +        * The code at rcsi2_enter_standby() assumes
> +        * inconditionally that PM runtime usage count was

unconditionally

> +        * incremented. So, it shouldn't use pm_runtime_resume_and_get()
> +        * here.
> +        */
>         pm_runtime_get_sync(priv->dev);
>         reset_control_deassert(priv->rstc);
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
