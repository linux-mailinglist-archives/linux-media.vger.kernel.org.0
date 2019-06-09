Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E18543A446
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2019 10:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbfFIIGe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 04:06:34 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36794 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbfFIIGe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jun 2019 04:06:34 -0400
Received: by mail-lf1-f67.google.com with SMTP id q26so4536091lfc.3;
        Sun, 09 Jun 2019 01:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8p8YGt858bb2hZjQgWQPuo5yW8roKYLZAjQbzF2PYV8=;
        b=H0MFygZzcvv9OK9xj89AzGvMRMwerH384UceXx+NSYHnXYYSXjDp818PDLjV6zafWw
         5Mtz7iaJ28V6kA/fq25YIIxftx/YYVEgFw7kI7Mg4Ufredrf3b51aEkYOp960xmxLlSS
         fo+1gSdjVZvdB05+DDBqLelsX93/8YlRfTghlbBQ9s/yVubTSdjXn7THgQ6bAqAaSzwK
         pAtPaNZ9XcydJjqmWpWwC7hs7UvCAAwVGJW4GvOndSvPEJhJK78j7I2sV3eqiVWrM74m
         OIGxToveMkeTLTCl5Gb/0NVj4kd77gRMuJtkXQj36i82wLAUMrTO+IqfXcu06ddiiIEC
         Jajw==
X-Gm-Message-State: APjAAAXGMHQrHlcjmaNJwZZ1uUZoVfmNzAlq6a3Rvogaehe+GkRJt2BR
        fqK7CS27pBdqWG13BCfNz47lVbJ8rzRYrnLhLLUwt+rv
X-Google-Smtp-Source: APXvYqyo3wGfiZBoZyJX9aFxmzwBnN5YKrPpJyz5a0QRpgbe0YC48MXxo13wol8sP2h6B2SG0EMAAckReTN+BOasAp8=
X-Received: by 2002:ac2:597c:: with SMTP id h28mr7567528lfp.90.1560067592564;
 Sun, 09 Jun 2019 01:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190608125331.29146-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20190608125331.29146-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 9 Jun 2019 10:06:19 +0200
Message-ID: <CAMuHMdUobhMrDYBoYVo091re7LGrYEGgCsXbMh8a4MrF4zoP7g@mail.gmail.com>
Subject: Re: [PATCH] v4l: rcar-fcp: Read IP version register at probe time
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, Jun 8, 2019 at 2:55 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> This helps identifying the IP core version, for debugging purpose only
> for now.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/media/platform/rcar-fcp.c
> +++ b/drivers/media/platform/rcar-fcp.c

> @@ -138,6 +168,19 @@ static int rcar_fcp_probe(struct platform_device *pdev)
>
>         pm_runtime_enable(&pdev->dev);
>
> +       mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       fcp->iomem = devm_ioremap_resource(&pdev->dev, mem);

devm_platform_ioremap_resource()?

> +       if (IS_ERR(fcp->iomem))
> +               return PTR_ERR(fcp->iomem);
> +
> +       pm_runtime_get_sync(&pdev->dev);
> +       version = rcar_fcp_read(fcp, FCP_VCR);

Please note that rcar_fcp_read() does not exist in upstream nor next,
and linux-renesas-soc hasn't seen the patch that added it.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
