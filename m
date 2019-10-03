Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED0EACA160
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 17:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729551AbfJCPvR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 11:51:17 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35052 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbfJCPvQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 11:51:16 -0400
Received: by mail-io1-f67.google.com with SMTP id q10so6745455iop.2;
        Thu, 03 Oct 2019 08:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o5FrpAENvkoWB6xTph/hv60pcl+ltBCsmirVDpopVIo=;
        b=UdccRskLRxHUliLk7EmSQh3mAW/dJmzZOuo83M+/IJp+j14HnXKphJ8vVlvTl1cGHK
         M6WwCYyLfGiLlSj8J+e0Mx1RwpdTZ13BkF+8Q615l6bYJlYAb6zljqDUjWw4Y/6h1yDP
         Yj1V+0NkfU1lwTsfaBC5WJfHdoXzlVZPriwtCLC6eT6m9W4hMkYEz8pd9d4xCE2fFUuI
         RJxyUHhluWHEL5i3opM/+Oa4BtQixhMqNX/P/1lekVvxFUPRzVjlHjDgU1qKc49yuZKE
         u8qwcvVD+wO0Jda7Bw9lOM+PMewKe8Zk65hrC+ANlzAP8+1BBfx989PmInz/3zj7qoHw
         Fobg==
X-Gm-Message-State: APjAAAVfe3LKwBc1dRB2YSGqXwNt8PJaOd6Nr8bh8pDQMjsNhHV7gVXo
        g7SHFBCDEYxrJqPQyUP0geNooobzgec=
X-Google-Smtp-Source: APXvYqwIE3eiNTW7+HPQ5qohGWGqswCJPLeGMZ16CZcVlCSe7q7TD2ZDFUc232apC8zBZDR+xXfA6w==
X-Received: by 2002:a5d:81cc:: with SMTP id t12mr2337216iol.207.1570117875471;
        Thu, 03 Oct 2019 08:51:15 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id t4sm1747346ili.8.2019.10.03.08.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 08:51:15 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id z19so6774576ior.0;
        Thu, 03 Oct 2019 08:51:14 -0700 (PDT)
X-Received: by 2002:a5d:9349:: with SMTP id i9mr8742455ioo.101.1570117874713;
 Thu, 03 Oct 2019 08:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191003154842.248763-1-mripard@kernel.org>
In-Reply-To: <20191003154842.248763-1-mripard@kernel.org>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Thu, 3 Oct 2019 23:51:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v66az3uQnibudKai7ATfXh+w1Y+bJ=o258RVe9SCNRpGNQ@mail.gmail.com>
Message-ID: <CAGb2v66az3uQnibudKai7ATfXh+w1Y+bJ=o258RVe9SCNRpGNQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: sun4i-csi: Drop the module clock
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, Oct 3, 2019 at 11:48 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> It turns out that what was thought to be the module clock was actually the
> clock meant to be used by the sensor, and isn't playing any role with the
> CSI controller itself. Let's drop that clock from our binding.
>
> Fixes: c5e8f4ccd775 ("media: dt-bindings: media: Add Allwinner A10 CSI binding")
> Reported-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  .../devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> index 5dd1cf490cd9..d3e423fcb6c2 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> @@ -27,14 +27,12 @@ properties:
>    clocks:
>      items:
>        - description: The CSI interface clock
> -      - description: The CSI module clock
>        - description: The CSI ISP clock
>        - description: The CSI DRAM clock
>
>    clock-names:
>      items:
>        - const: bus
> -      - const: mod
>        - const: isp
>        - const: ram
>
> @@ -89,9 +87,8 @@ examples:
>          compatible = "allwinner,sun7i-a20-csi0";
>          reg = <0x01c09000 0x1000>;
>          interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> -        clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI0>,
> -                 <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
> -        clock-names = "bus", "mod", "isp", "ram";
> +        clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
> +        clock-names = "bus", "isp", "ram";

I believe what we thought was the ISP clock is actually the module clock
for the whole CSI subsystem. So we should still use the module clock entry,
and remove the ISP entry.

ChenYu

>          resets = <&ccu RST_CSI0>;
>
>          port {
> --
> 2.23.0
>
