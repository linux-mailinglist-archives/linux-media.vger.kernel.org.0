Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 472C11D47C3
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 10:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgEOIHg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 04:07:36 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44556 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbgEOIHf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 04:07:35 -0400
Received: by mail-oi1-f193.google.com with SMTP id a2so1451411oia.11;
        Fri, 15 May 2020 01:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m/l9oPI71kjLa9yCqc2AeiXieWbvI5Uv7cd5K8zEEsA=;
        b=fPgVThi7JM8NqocaM5L7Fzc0TD5fJvKA0ONMgWFrv45ghvkL81OFSB9gPqn9jzO7im
         II42X+LetEDkhwCistmYLvdT2zBqaRZLFNkIxh8FMOX2xi1+Jc9z6pvJxdOaZx9+4p2r
         jtcW+VmEWFPB+K6dITmPRxpwXZ4r8+F7iwgrlX4nXwlIKp2cEQPk8SDq/llclPtAKF6v
         FJnTkFAYT0XcNMMBOFmfzv+7wFyygWRrr5XwcuLKARmj8g6K8k42acjPmocxHLi3cD2W
         eUGH+wbpERrQCIde8va5GiUp8QxC6NUHgp1KPYF+jUwO/u4dHrWsHkUptoL48tbu5vw7
         URZg==
X-Gm-Message-State: AOAM532oL7JuiQ8bUwKDe8qGTbeXJPh3L1Ys3N8S8f7w4t90uxzKdCY6
        3IZN5VBD8pWAzDZ3/3oxLkPQWZFEfkDAL6V1rxf8bZQj
X-Google-Smtp-Source: ABdhPJyErN+HOdoryL9a+qrA5jS1QtF8ISgAgJhQlVisYA/ZIJxYb2/gT8DJlzexoFM8SVDaWPFz+YrxiiExKEy5HA0=
X-Received: by 2002:aca:895:: with SMTP id 143mr1186258oii.153.1589530053041;
 Fri, 15 May 2020 01:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com> <20200515012432.31326-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200515012432.31326-5-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 May 2020 10:07:22 +0200
Message-ID: <CAMuHMdV2f26KkH5NgRDQjb2CEg0Br4=axdd5OGAeqqGX-HnKSg@mail.gmail.com>
Subject: Re: [PATCH 4/8] dt-bindings: media: renesas,fdp1: Convert binding to YAML
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
> Convert the Renesas R-Car FDP1 text binding to YAML.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml

> +  renesas,fcp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle referencing the FCP that handles memory accesses for the FDP1.
> +      Not allowed on R-Car Gen2, mandatory on R-Car Gen3.

Bummer, we don't have family-specific compatible values to enforce this
in yaml ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
