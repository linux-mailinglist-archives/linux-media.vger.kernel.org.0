Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18FE3264827
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 16:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730677AbgIJOou (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 10:44:50 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33176 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731226AbgIJOl1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 10:41:27 -0400
Received: by mail-ot1-f68.google.com with SMTP id m12so5578956otr.0;
        Thu, 10 Sep 2020 07:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/JTzeYOL/MUZ0luIwiE6sB1J7IDRIRK13Ar1a9wfQGM=;
        b=aJEoswKoNj9AvXP8y85BeZe52D1ttoqWIH8+UE/Cx86gugGOZrutl5YWa9PmmVogPo
         Pxx6amAD9aT74227jBpk/32Tgv+hfToXhWEGx8NSJ3Fyjhvwxfj/ECw2fFv2VgWtvA7M
         chu8bv6LlKEfhOIcLRZgc6adO8i3jh2h8HgAQbh08LktydUgW+CrpG+NoA7hYkmWjrxv
         I7tRhb+IdptvB5rjDzO83CMJxsoS8DLu2KoGMJ1P3tXAGjdJxyLzU8PMT5Eol80rHKXO
         ItaDWbFz36lie31na7gwslgdMFaQGFf//O40bk1YEiCeKP53e/I+WBXSO1lbIy5eYrPf
         ALKg==
X-Gm-Message-State: AOAM533sjVcKqvaCHIcEe/HzA3owHcSFU3kgFvraefjtg0jRinhHyQxF
        JZE6kBy5rQ8xEE2uLWDzlo1A6OXDsTREvVGw0a6z+/Lc
X-Google-Smtp-Source: ABdhPJzA8ekVNoPsDkNHeejFHRZriL9kziI6Qhs0VkHhQmXcp1PivgYbXh7+aNN+IChJD8Ai6bvaxJtyBepAoJpLn5A=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr4110588otb.250.1599746170203;
 Thu, 10 Sep 2020 06:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200907144509.8861-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200907144509.8861-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200907144509.8861-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 15:55:59 +0200
Message-ID: <CAMuHMdUyRagPz-Fv+Z-30BbaxrZJkPzV=PSAUe4_GhGUozeYKg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7742: Add VIN DT nodes
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 7, 2020 at 4:46 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add VIN[0123] instances found in the r8a7742 SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
