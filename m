Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53092295F43
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 15:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2899221AbgJVNDb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 09:03:31 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40159 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2899172AbgJVNDa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 09:03:30 -0400
Received: by mail-ot1-f66.google.com with SMTP id f97so561663otb.7;
        Thu, 22 Oct 2020 06:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RelaTugL1a2gvxGSVw/aISa+xHGRudjn0yBL33jKlRA=;
        b=EvATdAWtpe/NK+bvrj2ztH/CsEl0zCzS15Md/tG+O3A57fAYu/nKuM73rvll979Pd5
         ti5iykJQ0SwHb9jQgvkkxbJHfg0XdXQKDADW9ve0QePc1Tmceg88iKbwYBgZmGd3QJRk
         l8qDC8YIcq029Y3TjPpzqzPLL214y1EyV3m6EF9jkNhSFAvEKPo6H1ZUeaeLFaGUvn/4
         ejvglILxZwwFKJremmX0r3sKKiwHF6OFZ+0V03gkQxLOfPnxdDEhKFLhE+kpKl3kYgVP
         ys39O6yQ0gtOmpgh8kh+8AtX8yfSxHWuI+VfoP5c/q4FSYHhD8cKjIkXLahewU0Ir7sK
         feNg==
X-Gm-Message-State: AOAM530WGOASyLQ2vTuMmped/wONIjQ9rrHZBwIG9V9tyJVSs8wN3RgY
        bScYcmemIkSHSu+5r76HkprorRSXQs+uxgZDnsA=
X-Google-Smtp-Source: ABdhPJwkckjBe/gYTSdWeCqY5ioYO3c1AffqWUNe/ty58tFNoYZsvN4TUSRxp/83lrknLXepaM2sTMs6vigHAsrt6EQ=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr1770780otc.145.1603371810205;
 Thu, 22 Oct 2020 06:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201021135332.4928-1-fabrizio.castro.jz@renesas.com> <20201021135332.4928-6-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20201021135332.4928-6-fabrizio.castro.jz@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Oct 2020 15:03:18 +0200
Message-ID: <CAMuHMdX34NMnqNDdF_XsEn9TSGv9KzCsnyYMLUpk8bF+XsViuA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] arm64: dts: r8a77965: Add DRIF support
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 21, 2020 at 3:53 PM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> Add the DRIF controller nodes for r8a77965 (a.k.a. R-Car M3-N).
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
