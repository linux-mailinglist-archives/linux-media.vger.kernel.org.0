Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0F78FDB2
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 10:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726972AbfHPIVz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 04:21:55 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43780 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbfHPIVz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 04:21:55 -0400
Received: by mail-ot1-f67.google.com with SMTP id e12so8844583otp.10;
        Fri, 16 Aug 2019 01:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d/RQiN4Zt7fRXFwmq9rP0sC4DcplkHkeUoSPXsgJtWs=;
        b=QflcEAo5HQnQoNBOvPG0y0gVb6Zgbix8g4EwQHB/wiI2ZiwOQII4FNUDJO/4jKtNG1
         C6TtdU903wuC6hNwX4y5k0gNUHgzkIAXjS2Wno4eyaDSfDlXf9YsTvVOsFjNn0lqmOTm
         K0TUqnNVy1zomXkQGIAvIdWoGUBsqPyKlP2DuYs/a7Zql2V4XAIf0iLFHF92nQytivX3
         MPnil4dONJfw6EATCJjl1MwRnLEf3V5faboQYCoI3XFgoUGC7zjJAIEYjc3zWW6GSoaY
         QiORQFt5B+KMWKusIv+UJNVmxp9gZoNFX8h1RBUzowWYixoSx8OD4row3F4Sg+65vDUM
         lDpA==
X-Gm-Message-State: APjAAAX+/In7GVd1rAKEibOhD4u57r5iLYsoFxbhbVZB4sQqdtKtbqWE
        kVH/SGuRc4UP+Qpv4ogppilkrB0tJw4dHvYSJA0i7A==
X-Google-Smtp-Source: APXvYqzg1btR+f/F74H8+tW6jxEOUl0KlYsnxGC6ev6hQ13mosU9hOOQbXm6/eBaKoUyPqjSeYmi5b6hMzrimYVsNDU=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr6705007oto.250.1565943714088;
 Fri, 16 Aug 2019 01:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190814145417.30670-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20190814145417.30670-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Aug 2019 10:21:42 +0200
Message-ID: <CAMuHMdWnnWTgnrjbSSxkg1rUadosijZyrfB8LQk5zWhzmg3WtQ@mail.gmail.com>
Subject: Re: [PATCH v2] v4l: rcar-fcp: Read IP version register at probe time
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Aug 14, 2019 at 4:55 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> This helps identifying the IP core version, for debugging purpose only
> for now.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> --- a/drivers/media/platform/rcar-fcp.c
> +++ b/drivers/media/platform/rcar-fcp.c

> @@ -138,6 +167,18 @@ static int rcar_fcp_probe(struct platform_device *pdev)
>
>         pm_runtime_enable(&pdev->dev);
>
> +       fcp->iomem = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(fcp->iomem))
> +               return PTR_ERR(fcp->iomem);
> +
> +       pm_runtime_get_sync(&pdev->dev);
> +       version = rcar_fcp_read(fcp, FCP_VCR);
> +       pm_runtime_put(&pdev->dev);

Unless (dynamic) debugging is enabled, all of the above is done for obtaining
a version number that is not used.
Can this be improved?

> +
> +       dev_dbg(&pdev->dev, "FCP category %u revision %u\n",
> +               (version & FCP_VCR_CATEGORY_MASK) >> FCP_VCR_CATEGORY_SHIFT,
> +               (version & FCP_VCR_REVISION_MASK) >> FCP_VCR_REVISION_SHIFT);
> +
>         mutex_lock(&fcp_lock);
>         list_add_tail(&fcp->list, &fcp_devices);
>         mutex_unlock(&fcp_lock);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
