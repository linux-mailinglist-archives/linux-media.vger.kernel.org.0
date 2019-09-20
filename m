Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5437B90C6
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2019 15:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbfITNif (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Sep 2019 09:38:35 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43919 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726835AbfITNif (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Sep 2019 09:38:35 -0400
Received: by mail-oi1-f196.google.com with SMTP id t84so1747081oih.10;
        Fri, 20 Sep 2019 06:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U7SYpu/IKv9A1L7ri1/PD+Qii7rDc6Mb4V84bwV3zu8=;
        b=IQ2015M21qbQ/joqpih/7/DGCCTUk8tjWX8s788VR1LRCdYD+r6/maw+BtyX62fXzF
         HM9Uk9b6KxFmfBPrdiV0OXrYiBrC7qD+juoaeyKUqTUvzRtIs+T2dYmeyW4wcJJd7VLy
         ywfFV2arFEuclpjG3gdnl2rKh0NNu0jHRenWCONr2u67Ux7zrAQQ0tWCO5TYa/g5wL5R
         StGNmo6z1aMCzT9aQAKS7P4K4ymKfFKufGdFc3YzVVf4jA+LGLRHa6Aidu/7ZFe91Mi7
         gEHSvQO06OoXU7N9/p5xlgvY2zrR7mw9HHm8ic/Razgh3bIjdaZxlJRrxzTs5cCE3fzS
         PI0g==
X-Gm-Message-State: APjAAAWES4mGnX+4OJhQbBuMbxd2LtIGixP9/kJ+gcs3WIzKCbG6Lzi5
        KugJ9b7K+QS1Yj3Vlv4y38mexxe9binlA2q3f6g=
X-Google-Smtp-Source: APXvYqw67ydlVXFpRTDwDbvUAIeUNKLYEQkD97I8eV/GUwXmYJHJyeTNAxbYLZDN4ARUAYp+5lhdOdt3kja0FCIfhP8=
X-Received: by 2002:aca:f305:: with SMTP id r5mr2816182oih.131.1568986714503;
 Fri, 20 Sep 2019 06:38:34 -0700 (PDT)
MIME-Version: 1.0
References: <d80a685a-c3de-b9c9-ad32-e1da9308c393@web.de>
In-Reply-To: <d80a685a-c3de-b9c9-ad32-e1da9308c393@web.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Sep 2019 15:38:22 +0200
Message-ID: <CAMuHMdVD4ktoacaqWSRxGehmO3ULrcFXCSTQ=JaxrUWhCTw-Lg@mail.gmail.com>
Subject: Re: [PATCH] media: platform: Use devm_platform_ioremap_resource() in
 two functions
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Himanshu Jha <himanshujha199640@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 18, 2019 at 11:30 AM Markus Elfring <Markus.Elfring@web.de> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 11:20:48 +0200
>
> Simplify these function implementations by using a known wrapper function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
