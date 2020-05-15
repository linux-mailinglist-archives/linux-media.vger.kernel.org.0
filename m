Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E429B1D479E
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 10:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbgEOICh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 04:02:37 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46113 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbgEOICh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 04:02:37 -0400
Received: by mail-oi1-f196.google.com with SMTP id p127so1431136oia.13;
        Fri, 15 May 2020 01:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZZ6vQ622AaV/0HEime7/TJpo5Nl9rILDzhMaaomGY/U=;
        b=RV4mKTYakWpJYV4wbWO5RZfbo9FU7jGDdVdKdMeC/mIDvv/vPqgr8DLbE8r75f45xH
         CqKDQBDBFKZzMNXoiiOOmQ3zzlw71ww0pPK1cv3/faeYrAYGerRqjF3B56qOkaXFgh5f
         SRuB48JGhOpB3QaSLSdcX4/L15hWweXOmC88Nix6ax4jt7oqgDmr5UO9fPSPJsojExa+
         c4mbQ8UeALTv4gj6sLIFCejUEJzGZXJzj5A+xwtcV6M/n367Tfwp2LQt1bcPj0gpUbyw
         LiKkznrgRVP4AnUyRFTHLaYDr0fEuc/tFjEcamH5S0PhMxxCSrSYk8DZXUsASdAnJR+d
         y0Rw==
X-Gm-Message-State: AOAM532ANftY28XMQ/Tq+Ikf8gy+TgVEywThgOoQ3ZSWtLynJdfppYn/
        7JlOMOYAQHrKyDRcNDcCNQHcw0lJE0XqF9MFqiM=
X-Google-Smtp-Source: ABdhPJzN8vLde9ZUe9S+qS5BonElYeoTqoiGm2rI6IOYvfC6AUI+uzWHSOmSDDQBakSFOgcFTv+oQlC2M0atUYWMYEA=
X-Received: by 2002:aca:d50f:: with SMTP id m15mr1265980oig.54.1589529756623;
 Fri, 15 May 2020 01:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com> <20200515012432.31326-7-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200515012432.31326-7-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 May 2020 10:02:25 +0200
Message-ID: <CAMuHMdWngTHUP=_kwTFsvjLt+7ciEfNhBYz8xXFOktt+gJg5Jg@mail.gmail.com>
Subject: Re: [PATCH 6/8] dt-bindings: media: renesas,fdp1: Add resets property
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

On Fri, May 15, 2020 at 3:42 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The resets property ise used in DT sources in the kernel tree. Document

is

> it and make it mandatory.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
