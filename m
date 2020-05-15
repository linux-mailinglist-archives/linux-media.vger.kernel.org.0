Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06C31D4799
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 10:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgEOIBy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 04:01:54 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33932 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbgEOIBy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 04:01:54 -0400
Received: by mail-ot1-f66.google.com with SMTP id 72so1255346otu.1;
        Fri, 15 May 2020 01:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=No2JaVz5PL9MmPbAv0tHg6IM3vHIPX+5t5AsaHw9gns=;
        b=XtdFSGCFyPsO8gL/CESxJBP/ctxmtLWSoRSlKE68yXIRCgvSeU/tY3mom+8NDdHJ7m
         fuI88+zMmkKqYe50yevgZJjr6UrGjGqLuIUf/2OfCRRmEv3uDjsbn9bAzn6ysntqR9fQ
         NH8nc6JUCRd6OeqWImA/porrT2iSr4taRdRkPIjfJN/XJnWZsr/cmUM9mYzPpKjzxEax
         oBkt/ZMH0WI9TVjzQh3Tcly1YP/a0LG6j0QS9N/rHktHwl4S+USrnnEvt3uZUTwoWD0s
         nekHkIKKxhIg/Kq0on2fa6mAUA27EUJH6gdb92Kq+4WbYoc/dLCUuhRZS+Ey+MkK2faI
         9nsA==
X-Gm-Message-State: AOAM533yrvnVOO1RYZMN+RNUiiFfSxJZiuGSpGlnYKiIriIkdSZHtJ9X
        ZE2iPCvGXMxN9iBY5cVNxOAQMNmdwonZYMrXC90=
X-Google-Smtp-Source: ABdhPJwCq6Y/lOs53RDggLTbS01RRScdoE3P0pVdRcRsT6E+Llk//ag9J6IDyB3C9hS6lPP/nYJ2mm4UVfS8s0ycXAc=
X-Received: by 2002:a9d:7e92:: with SMTP id m18mr1308992otp.145.1589529713631;
 Fri, 15 May 2020 01:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com> <20200515012432.31326-4-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200515012432.31326-4-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 May 2020 10:01:42 +0200
Message-ID: <CAMuHMdUtZOB4_mZ56C-12ir3RjtMp1S13WN6PMcQYN1yj_XyKQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: media: renesas,fcp: Add resets and
 iommus properties
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

On Fri, May 15, 2020 at 3:45 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The resets and iommus properties are used in DT sources in the kernel
> tree. Document them, and make resets mandatory. The iommus property is
> optional as not all platforms wire the FCP to a functional IOMMU.
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
