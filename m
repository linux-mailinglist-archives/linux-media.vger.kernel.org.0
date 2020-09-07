Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04BFD25FE01
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 18:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729992AbgIGOsM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 10:48:12 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45997 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729661AbgIGOrs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Sep 2020 10:47:48 -0400
Received: by mail-oi1-f195.google.com with SMTP id d189so13744969oig.12;
        Mon, 07 Sep 2020 07:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QcjiiAfx+9k9N5nfOR2G/TrS6pvq+Cvo4vzFD0ysl/k=;
        b=MwaqAuEEw7q/sR6nExBQUc3HwYHaFcnMhsS25KrKyII/cMr7jCU5liMJKQ6/Xg8wFI
         3/DS7SnwX92vHlNzsft69T27eYmivyjNtiUksW0C/7N3XCjfCOuRpa1g806FMzi+wgvT
         HQCaV22/q1vKBdNQfZe23a0tGiiTw2YGQ9xrJpydwWgdKc/tlQYsYZxyQBCqPZLQrkss
         mhc3PA1G4AblJqXuYNQJ0viP7MQtqUsfb5P1DxE7/AuLrfJ59wP+PVpQU9pB2GNm0HmL
         fijpd6bkB3yHSSfvc7QfhkKzKD/6TGLBRMrCJ8LHgTynmhSbUH3dyFKnmqIta5/x0s2M
         fr1A==
X-Gm-Message-State: AOAM531aqJnKRRkNeaHsnZvvW1fIirVRwbb+vwlZyoucNit0QqBJUB2E
        3tCk1iGewaSPodUmYwDJ667HloQCJDipNSJA2bQ=
X-Google-Smtp-Source: ABdhPJyY+mdyDZV49zKGIPNu9C6xRs+fpbm9lxoTKNZqCdCFCV/vcvj1uvGnRbxs8d7YoKMermrp1Bu/17LgaaygxOw=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr12624421oib.54.1599490065211;
 Mon, 07 Sep 2020 07:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200907144509.8861-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200907144509.8861-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200907144509.8861-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Sep 2020 16:47:34 +0200
Message-ID: <CAMuHMdWGG+7dnrKxeA3S_g01jk3fSO_n2uP1-r0R279VF5TVcQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: renesas,vin: Add device tree
 support for r8a7742
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
> Add compatible string for r8a7742. No driver change is needed as
> "renesas,rcar-gen2-vin" will activate the right code.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
