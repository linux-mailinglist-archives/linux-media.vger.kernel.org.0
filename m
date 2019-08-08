Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5D4185C2F
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 09:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731604AbfHHH5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Aug 2019 03:57:04 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40594 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfHHH5E (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Aug 2019 03:57:04 -0400
Received: by mail-ot1-f65.google.com with SMTP id l15so57827970oth.7;
        Thu, 08 Aug 2019 00:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PfgNCbwNh+egJUA3cbV8dUVAFRIGQlHaXhUpgK2RvWY=;
        b=JGJMpSjCGosPfjQC++oRo9/VpIYQjtroBHN743qwzAzvGwWB5pIBYAiDbdvUr9BPJt
         Eo75K5UBgZ/gNMoWwkPqrC1ebkSs6ugBxhbHyqohfNnLDNGaVk38PZCLn+DuTtHuWbh7
         5hOZdCLwSYvYHaoqJcd3YCtb78oW/V7GqgaUuaKoez42d8Opdb+7SC6HbG3SMcwWfgOX
         58mFj2RG/w8nyMm9/lRxYUJK4+B17RhjqJLtgW7lPpWJDtAsIvV9RPikTutK1Mb3WE/Z
         7NkEE7P395FfzzoTyAL38adaFrI9UH5xaJbeITg8/VqaF/DK1vddCOeMp8womXVikOXV
         qFkQ==
X-Gm-Message-State: APjAAAWTQXbT7DoKFP8e7rXNysRmu2ExYF6MtNYw7tJUCwhn0jgjnO2h
        cWv5ICjfuv2JQeBT8lSfrMyNJXm/bigR4DlWAC0=
X-Google-Smtp-Source: APXvYqyxub+OuS4BmFWrwKCfra+oZAC4TQcubjFwMCIkh5Hd7WXBKupUhwY9Boc0JZWx3NsB6ilSK6bX/BtJ1nAWqYU=
X-Received: by 2002:aca:bd43:: with SMTP id n64mr1504808oif.148.1565251023062;
 Thu, 08 Aug 2019 00:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190730181557.90391-1-swboyd@chromium.org> <20190730181557.90391-26-swboyd@chromium.org>
In-Reply-To: <20190730181557.90391-26-swboyd@chromium.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 8 Aug 2019 09:56:51 +0200
Message-ID: <CAMuHMdV2786n3ex-rY7N5LdX4PpnqZ-tuX2SyTO0w+TRfrA84g@mail.gmail.com>
Subject: Re: [PATCH v6 25/57] media: Remove dev_err() usage after platform_get_irq()
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stephen,

On Tue, Jul 30, 2019 at 8:21 PM Stephen Boyd <swboyd@chromium.org> wrote:
> We don't need dev_err() messages when platform_get_irq() fails now that
> platform_get_irq() prints an error message itself when something goes
> wrong. Let's remove these prints with a simple semantic patch.
>
> // <smpl>
> @@
> expression ret;
> struct platform_device *E;
> @@
>
> ret =
> (
> platform_get_irq(E, ...)
> |
> platform_get_irq_byname(E, ...)
> );
>
> if ( \( ret < 0 \| ret <= 0 \) )
> {
> (
> -if (ret != -EPROBE_DEFER)
> -{ ...
> -dev_err(...);
> -... }
> |
> ...
> -dev_err(...);
> )
> ...
> }
> // </smpl>
>
> While we're here, remove braces on if statements that only have one
> statement (manually).
>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Please apply directly to subsystem trees
>
>  drivers/media/platform/am437x/am437x-vpfe.c           | 1 -
>  drivers/media/platform/atmel/atmel-sama5d2-isc.c      | 7 ++-----
>  drivers/media/platform/exynos4-is/mipi-csis.c         | 4 +---
>  drivers/media/platform/imx-pxp.c                      | 4 +---
>  drivers/media/platform/omap3isp/isp.c                 | 1 -
>  drivers/media/platform/renesas-ceu.c                  | 4 +---
>  drivers/media/platform/rockchip/rga/rga.c             | 1 -
>  drivers/media/platform/s3c-camif/camif-core.c         | 4 +---
>  drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 8 ++------
>  drivers/media/platform/sti/hva/hva-hw.c               | 8 ++------
>  drivers/media/platform/stm32/stm32-dcmi.c             | 5 +----
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c    | 7 ++-----
>  drivers/media/rc/img-ir/img-ir-core.c                 | 4 +---
>  drivers/media/rc/ir-hix5hd2.c                         | 4 +---
>  drivers/media/rc/meson-ir.c                           | 4 +---
>  drivers/media/rc/mtk-cir.c                            | 4 +---
>  drivers/media/rc/sunxi-cir.c                          | 1 -
>  17 files changed, 17 insertions(+), 54 deletions(-)

Looks like this didn't catch the double assignments in:

drivers/media/platform/rcar_fdp1.c:     fdp1->irq = ret =
platform_get_irq(pdev, 0);
drivers/media/platform/rcar_fdp1.c-     if (ret < 0) {
drivers/media/platform/rcar_fdp1.c-             dev_err(&pdev->dev,
"cannot find IRQ\n");
drivers/media/platform/rcar_fdp1.c-             return ret;
drivers/media/platform/rcar_fdp1.c-     }
drivers/media/platform/rcar_fdp1.c-
--
drivers/media/platform/rcar_jpu.c:      jpu->irq = ret =
platform_get_irq(pdev, 0);
drivers/media/platform/rcar_jpu.c-      if (ret < 0) {
drivers/media/platform/rcar_jpu.c-              dev_err(&pdev->dev,
"cannot find IRQ\n");
drivers/media/platform/rcar_jpu.c-              return ret;
drivers/media/platform/rcar_jpu.c-      }
drivers/media/platform/rcar_jpu.c-

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
