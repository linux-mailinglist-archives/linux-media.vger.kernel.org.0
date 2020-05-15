Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 339021D47B2
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 10:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbgEOIFZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 04:05:25 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43778 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726732AbgEOIFY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 04:05:24 -0400
Received: by mail-ot1-f67.google.com with SMTP id a68so1219156otb.10;
        Fri, 15 May 2020 01:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZEpA70iF3bES9GlgcA7awTeuPj9zwltDrnzx8CT3Qlc=;
        b=O5eprOrWUln+iB6MReLqxWfh8F2ntwEQku0Plnv0VHo56eVU2CWKknEYQ7taAaAQWv
         FqtjHaZHRspRD09xNSYwh8qZ7FMvik2s2mUVKdI2k8pPbkPZoZ1Aw2zLLopqL4XuODVQ
         MU+0wFLO49VFyMUQgTJXZqPL5h3zs3P0RvJQU+3FYHxhGrB9hDpSFeI/tkI9RL7K62kB
         GBXoVw0/sTn/t8nVtsJUC+WkyGZmcswhOxrdvg/KmhSQDPW+KmJb9G8VXe6EkRL5ZFVH
         v3VO0wSQs0QZUhUT+TQXGr3tcSlxFab/1TZKDtcGWJWoCkhSW/3Q9ySztVKIkQCTOLag
         0YPA==
X-Gm-Message-State: AOAM533xJBU07b3HtMeHMdIOmo3f82qMN8BmWxW9MFWqYZ84HSb6jV7R
        Ove3omtIa+w43WmcqsxImAbB06W9uDrI5TKD4jU=
X-Google-Smtp-Source: ABdhPJxuP0fTJNvKox9xSUGV0JDypK2O0/t8XLimIPfWdM/EU+Ip7j+cJCm+twmwwx18e8m01353J0vPXApeFQY7jEw=
X-Received: by 2002:a9d:7e92:: with SMTP id m18mr1318186otp.145.1589529923703;
 Fri, 15 May 2020 01:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com> <20200515012432.31326-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200515012432.31326-2-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 May 2020 10:05:12 +0200
Message-ID: <CAMuHMdU8hjKM7uLgkVUZQ43Yywh73iuQfPNiNaLPUM1Fn0cSwA@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: media: renesas,fcp: Convert binding to YAML
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, May 15, 2020 at 3:42 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Convert the Renesas R-Car FCP text binding to YAML.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Frame Compression Processor (FCP)
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description: |
> +  The FCP is a companion module of video processing modules in the Renesas
> +  R-Car Gen3 and RZ/G2 SoCs. It provides data compression and decompression,
> +  data caching, and conversion of AXI transactions in order to reduce the
> +  memory bandwidth.
> +
> +  There are three types of FCP: FCP for Codec (FCPC), FCP for VSP (FCPV) and
> +  FCP for FDP (FCPF). Their configuration and behaviour depend on the module
> +  they are paired with. These DT bindings currently support the FCPV and FCPF.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,fcpv # for 'FCP for VSP'
> +      - renesas,fcpf # for 'FCP for FDP'

I would drop the "for" part, and just write e.g. "# FCP for VSP".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
