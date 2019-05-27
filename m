Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D17A2BB5D
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 22:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbfE0USk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 16:18:40 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44110 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbfE0USk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 16:18:40 -0400
Received: by mail-lf1-f67.google.com with SMTP id r15so3394580lfm.11;
        Mon, 27 May 2019 13:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OvAUbe7K2xMqtGukRvbyAcK37R51pLBjtoeTTYWgxsQ=;
        b=acnjEkzUONJXr68U3rGDlvPQOpxMYkUluPjF/L2FWCDTrEh/Dqpt4YV4oFmk4NafI2
         lXPUOzH2bM+2r15A+ZdXatIQisuqB13nUbNfSEtq42zibjT9abroP+iULvcFkxsWTnoh
         Uhm8t1lNnjQasTeTByWOzTReOlgyTw1h5lDq48cL8ZZ6K9fSKSAU4Yza8Kea/E3TJ/8z
         tFVrCLO6h8uJuyvFEOquiKzz/0SJLnnLqJSuJuN+J14PV8eeipNJ9OwuVZsKXUgROxMK
         9j+JgxADQfS0O826RSVWi7YGDp2OIoRiR1SrFszF7BUdO2AwWcPlMoXzTVhC3PhFUM91
         USeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OvAUbe7K2xMqtGukRvbyAcK37R51pLBjtoeTTYWgxsQ=;
        b=JDwg0QtM3I6ItdkkNwRuuafxhfHi38QtGsxf95DVK1AA+qPTiTSlSpk1cF5ix2m9oq
         hjrrUNJedBiGUDdFAh+yzxzc69cDLIzH2Cq2m1xG1O8vVXMPQDLSTD01rlpNFWk/iMYI
         2OFmXuEFPtRCQUPnuL4JSEFZi1oTnb7X8VBUcVfMBmBE1BVyKO0EJ2QaQNvIIjFHkw5S
         fBZf30I58YBmc6u7wauEsUdzcQo8G3N0OaJ97iaCe57GPbW3pgGQBuHKEKIKvH4pMIXY
         2sA4t3Pz9hH6mQ7EOIY7McA7a6Bcw4GrBUcugILANgFhlSEEay9U+3OhVyraWTHjgoF6
         aWiw==
X-Gm-Message-State: APjAAAXPhmw56lNqkZFz7c8ySBI2Rgh0a8quWgf4zGqDInz99LArYwKx
        bkTxaHYvv1ncKyUzg9/0szAvT4mPoO62zF7BE9w=
X-Google-Smtp-Source: APXvYqyxfqbMHT5nTyWym+yreIOwF2hutbzSGK0O2yyJXJBibvYAht3syEewDACi2AN7cwItuMnOUTlhUha/B7aKqI0=
X-Received: by 2002:ac2:4899:: with SMTP id x25mr5704165lfc.44.1558988318149;
 Mon, 27 May 2019 13:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190504144027.31920-1-festevam@gmail.com> <20190504144027.31920-6-festevam@gmail.com>
In-Reply-To: <20190504144027.31920-6-festevam@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 27 May 2019 17:18:44 -0300
Message-ID: <CAOMZO5AZBQuD8Tdhbf+r4C6M7zZy9VevVQoyb8o4KJY4EkO9WA@mail.gmail.com>
Subject: Re: [PATCH 1/8] media: dt-bindings: imx7-csi: Document a single CSI clock
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Rui Miguel Silva <rui.silva@linaro.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        =?UTF-8?Q?S=C3=A9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>,
        Otavio Salvador <otavio@ossystems.com.br>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, hverkuil-cisco@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Sat, May 4, 2019 at 11:40 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> As per the i.MX7D Reference Manual only the MCLK is used for
> the CSI block, so only document this single clock.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/imx7-csi.txt | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/imx7-csi.txt b/Documentation/devicetree/bindings/media/imx7-csi.txt
> index 3c07bc676bc3..443aef07356e 100644
> --- a/Documentation/devicetree/bindings/media/imx7-csi.txt
> +++ b/Documentation/devicetree/bindings/media/imx7-csi.txt
> @@ -14,8 +14,7 @@ Required properties:
>  - interrupts    : should contain CSI interrupt;
>  - clocks        : list of clock specifiers, see
>          Documentation/devicetree/bindings/clock/clock-bindings.txt for details;
> -- clock-names   : must contain "axi", "mclk" and "dcic" entries, matching
> -                 entries in the clock property;
> +- clock-names   : must contain "mclk";
>
>  The device node shall contain one 'port' child node with one child 'endpoint'
>  node, according to the bindings defined in:
> @@ -32,10 +31,8 @@ example:
>                          compatible = "fsl,imx7-csi";
>                          reg = <0x30710000 0x10000>;
>                          interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> -                        clocks = <&clks IMX7D_CLK_DUMMY>,
> -                                        <&clks IMX7D_CSI_MCLK_ROOT_CLK>,
> -                                        <&clks IMX7D_CLK_DUMMY>;
> -                        clock-names = "axi", "mclk", "dcic";
> +                        clocks = <&clks IMX7D_CSI_MCLK_ROOT_CLK>;
> +                        clock-names = "mclk";

Any comments, please?

Thanks
