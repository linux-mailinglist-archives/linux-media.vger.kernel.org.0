Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3679FF4314
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 10:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730948AbfKHJ0R convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Fri, 8 Nov 2019 04:26:17 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43786 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbfKHJ0R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 04:26:17 -0500
Received: by mail-ot1-f67.google.com with SMTP id l14so4624217oti.10;
        Fri, 08 Nov 2019 01:26:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W4tFhyNk88cLiIrk7U2U2GoifjJU+33k2wwxbR/jqPk=;
        b=RzF2f/wcbzEkod/VDjEgOqfK25NM0H7z6S1GHROZFg+2yhE64pC8QqgxBlTaMUu/fa
         /QQM+fmgsouR2ylu1MDCOnAv6EM4FrGG/qSJCuC6FJDwpkQJ5wZkJaI+3Hq69MVqoGOF
         luZN7YHrPEoNoMMkMkPPWdaREY5EGPc2WPHzt+EvipmYm6ZCr0/hulZHODFfei1J6xrK
         wnsEd6c+vFk5n48FM0U9xJZayXXNLxGnU1nbHb5GGpTNiRwhcIc874ZQas4Xz82YwY/9
         JnLR0uB0Im7NrejRWLgUBiZJBINF7o+J6GEkagmcBylNzkAUk2Z0/ctgK7/XDQ1IMOC0
         q+7w==
X-Gm-Message-State: APjAAAU7YoTTnw1bVhzG+T4lu499SDULcoCxEch5/CYIV/1kxH6jqgm/
        wc5a+kJZnRJRjXxHzdB3H8bDAbneztrLBEjdL5A=
X-Google-Smtp-Source: APXvYqwwwouz8e1guwW53BVrMfC0XprXStF89g2i5zeMHVrbFgP/m08Q0SJTAb2mfIIKJ3+VZSD0KgG2aIoxhMye6mc=
X-Received: by 2002:a05:6830:2363:: with SMTP id r3mr7925099oth.39.1573205176362;
 Fri, 08 Nov 2019 01:26:16 -0800 (PST)
MIME-Version: 1.0
References: <20191108021609.2584272-1-niklas.soderlund+renesas@ragnatech.se> <20191108021609.2584272-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20191108021609.2584272-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Nov 2019 10:26:05 +0100
Message-ID: <CAMuHMdWQXj_asxRuG4JD+YD2z1kVWEHUND9yV-T7VafkTd4O3Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: rcar-vin: Remove paragraph about aliases
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
> It might be convenient to have aliases but it's not required, drop the
> sentence as it's not true and not used in Gen3 DTS files.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Good (said "anti-aliasing" Geert ;-)

Gr{oetje,eeting}s,

                       Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
