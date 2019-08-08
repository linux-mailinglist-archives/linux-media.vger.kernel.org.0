Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 657E185D8F
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 10:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731569AbfHHI53 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 8 Aug 2019 04:57:29 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41920 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728289AbfHHI53 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Aug 2019 04:57:29 -0400
Received: by mail-ot1-f67.google.com with SMTP id o101so115632053ota.8;
        Thu, 08 Aug 2019 01:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/9E+Mm+6Qrots1Pu2f9K0wv/WiNE+9qq/chojj6dqDg=;
        b=sotWwtak5ZAKk02+5UYmY+5NbrrDOZXs4Ttb0qvSIrUUIeu7NpyWPDAVkcna23+Krx
         dHdi/R5ayjD7Auu+7pYTicxylPuxJb5fpt5kWmoMppEdtPFPDoTxagGrzXq8jiM/pHWR
         /wwqqjKa1NMLIc3xz6i4JRsk5RaC/eIe6VMGlia/De3WrFECi+DtVkD4EFqBBe+O42Ng
         SNFZdZXOl73Jc84DaaIs7726K0dA5ljOU0YQHa/Ke4yFwZ9wBJgQkGlo5nwxK96Et1cy
         z0EFWVylvYRdkg+eJg07HAIJaS/DKJyAuU0PQYiLxElwXlU7hc0k3F8J4piBrbYqa1g7
         D19Q==
X-Gm-Message-State: APjAAAVi4B2+yysiI6WQ3oocSpC4ykoOIUr6xS1u3IeuRzCFROLTPmmD
        HcQe5Ctt3BNJXURPqXUCWMWRWnDV5vI04yKeUAk=
X-Google-Smtp-Source: APXvYqwzbfnQc5tpmmTdIukaBJtBLB9Nn2sWukYcYiZ2+MQGTdqxtFxqy5L1S4Z4iknP7z/4/B3aF5iLfSK7VukHi4c=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr12446512otn.297.1565254648306;
 Thu, 08 Aug 2019 01:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190808010330.19515-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20190808010330.19515-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 8 Aug 2019 10:57:17 +0200
Message-ID: <CAMuHMdUC9tWWReH0HLMVAofR8A3phydqavejtZVK792j9g28Sg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: rcar-{csi2,vin}: Rename bindings
 documentation files
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Thu, Aug 8, 2019 at 3:04 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Renesas media binding documentation files uses a naming schema of
> 'renesas,<module>.txt'. Rename VIN and CSI-2 files to match this
> pattern.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  .../media/{renesas,rcar-csi2.txt => renesas,csi2.txt}         | 0
>  .../bindings/media/{rcar_vin.txt => renesas,vin.txt}          | 0
>  MAINTAINERS                                                   | 4 ++--
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/media/{renesas,rcar-csi2.txt => renesas,csi2.txt} (100%)
>  rename Documentation/devicetree/bindings/media/{rcar_vin.txt => renesas,vin.txt} (100%)
>
> ---
>
> Hi Geert,
>
> Would you be willing to take this patch in your renesas tree? There
> seems to be a lack of interest in it :-(

Thanks, queued in renesas-devel/renesas-dt-bindings-for-v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
