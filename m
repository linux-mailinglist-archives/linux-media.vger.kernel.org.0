Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C46A3F4361
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 10:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731008AbfKHJdn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 8 Nov 2019 04:33:43 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34242 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfKHJdn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 04:33:43 -0500
Received: by mail-oi1-f193.google.com with SMTP id l202so4704803oig.1;
        Fri, 08 Nov 2019 01:33:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2dWaxqF8rfWEKlhxrUDolmxOv7bMB+rw5GOiRRDS8Zw=;
        b=lSh0YTOc4PZLvcvqAVqcHsFKVY8WBFYLQadqvw8nGpcxV1O1TuxZbJFmzkVmNMyP3L
         ZQAZI2g7kDA03ONsr+d+zDsIw2ywuXmEeuVrpiHz6USElU9XaXT5U+rSaIQ4ajJhsuoX
         mNuNtJkkSYatFrcJcg8IYHADQFHYp+AQ+d3fPo1ajzS0C6XZO+y3hJqQkVaPFez7nE2E
         R+TFse1t0giG7ayfRbPGA42yB0vgqMqoTUguwT3xGyJdOLF9TQ8UVwIt7Ef6YOiJZdEh
         BojFgbgwRcEkiolbSafAklFpCIQgdiKXclVc1mJc1vR+ENH9z6c1Ks9Vk+rNYmAWCzvt
         VWbA==
X-Gm-Message-State: APjAAAVAAOQJAkwjrftKthBJcGnKFoLqJnO+q4EIq8CYYj4AaIzIO3fX
        ebLXQFq0UEvFs68wBALwv9ml7o7YC/tTFtOwSVs=
X-Google-Smtp-Source: APXvYqzfQjea78gd4p8b62nSkVFUDVwI7knisR46MH7d3a9aIY+g6wy9d+QJK4Mm5iAoZgtA6JoYH/ckk+tbgbS4ZxI=
X-Received: by 2002:aca:fc92:: with SMTP id a140mr8161860oii.153.1573205622066;
 Fri, 08 Nov 2019 01:33:42 -0800 (PST)
MIME-Version: 1.0
References: <20191108021609.2584272-1-niklas.soderlund+renesas@ragnatech.se> <20191108021609.2584272-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20191108021609.2584272-3-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Nov 2019 10:33:31 +0100
Message-ID: <CAMuHMdW3cidfTp-GK_3oO-jLJpF310R4Cojvme8oMfpwqSX73g@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: rcar-vin: Document compatibility string
 for R8A77470
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Nov 8, 2019 at 3:17 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> When adding the compatibility string for R8A77470 (RZ/G1C) to the
> rcar-vin driver the string was never document in the bindings, add it

... adding to the DTS? The driver didn't need an update.

Seems like it fell through the cracks:
https://lore.kernel.org/linux-renesas-soc/1554969262-15028-16-git-send-email-cv-dong@jinso.co.jp/

> now.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
