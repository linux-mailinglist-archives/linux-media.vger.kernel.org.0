Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31613302311
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 10:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbhAYI6F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 03:58:05 -0500
Received: from mail-oo1-f51.google.com ([209.85.161.51]:46900 "EHLO
        mail-oo1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbhAYImu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 03:42:50 -0500
Received: by mail-oo1-f51.google.com with SMTP id n127so3079760ooa.13;
        Mon, 25 Jan 2021 00:42:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hiUJc/HdQm/xO1vbpPKcLW9aGOAJmDPSBwho7Vc1Vvo=;
        b=X5mk8mcNrOSfNlO6pnwBFWN+OMwgK/AslZ75JVOD0t8Zn+mqHOSWx46xSNMt39CUr8
         TTAuJTXBxA7JP7FT/JCdX+7WecJfJHJJrwAi7x+KL9gUGV37XhmVVH2g0hCZqKfshlql
         50aQXxiiRYUl5hieptZ46Qp04lVDnZW2LxdfPMCvrD18vZti5ui/J4CCWlw51FU4FxSY
         Cta+bqLNJeUeYlFkw5a6vpMX5M+r5pubQKiKpnyCDmd2bxajh11W0qW45UHRS+vI2NT4
         ShQQCXWro4IpjPEW4e6AuivkxV7LV1e4XqHH+OkfAIGPb01a/DFEESuImpwReoiyolf9
         wqFQ==
X-Gm-Message-State: AOAM5314sYRS3bPCB6Zp4X2r2NM2r4eFoNJWDyUCL8TDchChz9EV54Y9
        S1Y0pAS9ES9G3xhRuBcuk2b0epEDV0bWSfKvN9u+JXZ+
X-Google-Smtp-Source: ABdhPJypBNe753D1tSXL7zrIq5K8wvq7SGNoPpWkP+tJo7lzRLWoSlBhA+bakJXgepB3QEIcn+vKD5ghu3CoO1Udifs=
X-Received: by 2002:a05:6830:15cc:: with SMTP id j12mr946904otr.145.1611563479678;
 Mon, 25 Jan 2021 00:31:19 -0800 (PST)
MIME-Version: 1.0
References: <20210123034428.2841052-1-swboyd@chromium.org> <20210123034428.2841052-2-swboyd@chromium.org>
In-Reply-To: <20210123034428.2841052-2-swboyd@chromium.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Jan 2021 09:30:58 +0100
Message-ID: <CAMuHMdVVrkGX3pKFdTMqZYWdtFvy0Y0TcvB0UJoQ_f=NFkh6uQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] media: renesas-ceu: Use of_device_get_match_data()
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jan 23, 2021 at 4:44 AM Stephen Boyd <swboyd@chromium.org> wrote:
> This driver can use the replacement API instead of calling
> of_match_device() and then dereferencing the pointer that is returned.
> This nicely avoids referencing the match table when it is undefined with
> configurations where CONFIG_OF=n.
>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
