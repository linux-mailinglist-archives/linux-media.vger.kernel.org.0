Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 558D93FED30
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 13:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245183AbhIBLx6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 07:53:58 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:46038 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234069AbhIBLxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 07:53:55 -0400
Received: by mail-vs1-f43.google.com with SMTP id a21so1175805vsp.12;
        Thu, 02 Sep 2021 04:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s5u8fbmiYbgPdIpDQg3crMwUtNYfjRbmwSaVQsWY1oM=;
        b=DgPTE6qca4P3EgOMcRcMBfv1nXesZ41smhsXyc5Dll49z+TV6XMaeleoTToBqjREIO
         WOnoyq7e+2EIqJKVZ4EdWNHER7Z7xgue6PeW1e1PQJUC7ef3GbTsLGpaeKLwDSU8wy5k
         iJY44jd5Q+SwT8XhxeupfAOA0Lz8OjNkCmJPQHQa41xFyD6Px+hGAP1ylG/4sG8+81v5
         Ho8zD6EJjHXpEyKlxXdH5SDORTYa7pCNoxDzytwjs/tKwPmQkfD6oQ5iz/Wdq1bwDG/5
         fvhE3CevuetDW4ckopIqmOKwtWuaYR+IxauQDRi2q9+PnGvKB4+hSb4Vaa8N4QaHx+aB
         Gt/A==
X-Gm-Message-State: AOAM532Y0l9t9nfUrvsUesF23FwmqRu4XR2CzV14sUg3uzi593gvzNuO
        8kT7C0F3DGp279bBl9g4tUj6rqv44gaxRFobzwA=
X-Google-Smtp-Source: ABdhPJzrCJB+pGoTiggeVf31kTRMhI2i9RZDg13fzg+0T5RSO5BvVbACLYeBbRKhNO23EIIRyzaD46D25wmDzeNZY9Q=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr1535432vsl.9.1630583576886;
 Thu, 02 Sep 2021 04:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210902114641.32370-1-caihuoqing@baidu.com>
In-Reply-To: <20210902114641.32370-1-caihuoqing@baidu.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Sep 2021 13:52:45 +0200
Message-ID: <CAMuHMdXkcf1F5yLb6JWOA+R-SUtPBLkNZZiAbaYxhtQE7gY8Bg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add linux-renesas-soc mailing list to
 renesas JPU
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 2, 2021 at 1:47 PM Cai Huoqing <caihuoqing@baidu.com> wrote:
> 'linux-renesas-soc' is the mailing list for renesas SOC driver,
> so add it to renesas JPU driver info.
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
