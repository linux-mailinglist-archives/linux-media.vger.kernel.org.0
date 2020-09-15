Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F04326A65F
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 15:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgIONf6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 09:35:58 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46603 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgIONff (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 09:35:35 -0400
Received: by mail-oi1-f193.google.com with SMTP id u126so3796148oif.13;
        Tue, 15 Sep 2020 06:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XFJbV8gqtdgXON44AjHs01o37Q1aP3y+2+6LNfuSBbg=;
        b=oHp+IqmN/EZLJ263x2fajwviA5F7GCqeD8WZtwNxgQBFGEKCIRIt+44jLp66c0x5ON
         9tPhLL5GNBnFCF4mOWxAk54JP7l6R6sM9Rq2ykmr9/RRVzykmdD1jWvPyY4jlBLqDUty
         FpRIjsZCn7iingOkS45ejHVfZAS+kqXpdiyfoIttXJYaHS+fUwHh4snzeOSvE8pNRciu
         X1UptaQ+WXeqYY9DbDqLG/0oGCTIPcoLP8n9NlpBddkAlrkqPwf9QK8wzEsGRSNiNTry
         B993vW4nQiqFGRbzzQu93FuiGmDajLRL7CaaplpxQxfW2JEIg2DnZ8cz1/vfgpVjb2PD
         kKuA==
X-Gm-Message-State: AOAM531uNSOZeMnQeFs8ueGwMjVGazIxkG3Fu1zfiNs5Qd4shV+H3grI
        jhNHxyt0zRudVSSAC6zFjeuA1RSGLjzNM9yyWHePnycL
X-Google-Smtp-Source: ABdhPJzZ3UVmsOsTh4cqJBlDJ7vzhFrrmrBKHqhfHpds3yc77F0pv64OlNm3mClJtOeFqGGDm7n+2njVKcAuwriGQnA=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr3393965oib.54.1600176702442;
 Tue, 15 Sep 2020 06:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200915131216.21137-1-fabrizio.castro.jz@renesas.com> <20200915131216.21137-4-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20200915131216.21137-4-fabrizio.castro.jz@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 15 Sep 2020 15:31:30 +0200
Message-ID: <CAMuHMdXdsHDKZS1ZdACK0-wGsc6cfQFGETykJ_sQX=bat3WZ7w@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: dt-bindings: media: renesas,drif: Add r8a77990 support
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
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 15, 2020 at 3:12 PM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The r8a77990 (a.k.a. R-Car E3) device tree schema is
> compatible with R-Car H3 and M3-W schema.
>
> Document r8a77990 support within renesas,drif.yaml.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
