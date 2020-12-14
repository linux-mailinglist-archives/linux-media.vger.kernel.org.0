Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B7F2D93A6
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 08:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439014AbgLNHct (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 02:32:49 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35027 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439000AbgLNHcs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 02:32:48 -0500
Received: by mail-oi1-f194.google.com with SMTP id s2so18240894oij.2;
        Sun, 13 Dec 2020 23:32:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BftzBGcfKzrdavGS134SjsPLLF2ruabtKuv1iEkU87M=;
        b=aHSCat1cWxgTaolbj/QgwAHvB8PxX0QHYNACP6wj/l6vKhIEI3zcgG9hjw8TUPA5Y7
         msavVzjnfPB7BCQS3ciIs3UlCG+9JW245W+g6Ch+wPFFICMkISF0IZzyUOGT2RINt4fi
         PLS8zR5oSBUlT3nl4j1dZ8Id8AiLiWEVZ5jRoYBzSa2WIpOWthmBvrKnlLk1IdZiiZOH
         LbcHKxE1sKOUuk6tFkIk94tJLzpy2/iutRzDeR6VoL+oJXZzDx2hdJp6Qm77DsFCgQ5y
         m9Evao3GRZdPRpxM9D/xPAHHkWoct5grIxn3kpJCC0HjZnylLrSTYmX9XthJ16L3vMA1
         8zYA==
X-Gm-Message-State: AOAM530VyA2Cm0Vy7ES83Bezwu5q0Zl7KZaw5Y4xvbYr2zar3jEQpffx
        1B/bqQsSjSeZYPGaant0lYVyJ0A4R/MskqDRRAc=
X-Google-Smtp-Source: ABdhPJyK95q4KGKvFo9ijVGJmhONVBgouh2E4UAW95p/Qanb/0y6OOaTboohbFwChAeAnqCiwLmCHDMVBfOe7y5EPzA=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr17359385oih.153.1607931127977;
 Sun, 13 Dec 2020 23:32:07 -0800 (PST)
MIME-Version: 1.0
References: <20201212174119.120027-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201212174119.120027-1-christophe.jaillet@wanadoo.fr>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Dec 2020 08:31:56 +0100
Message-ID: <CAMuHMdUJVN3ywmSfCDKT05k24hxNtn5C8TdO6nyscUFiCy441w@mail.gmail.com>
Subject: Re: [PATCH] media: vsp1: Fix an error handling path in the probe function
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Dec 13, 2020 at 5:22 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> A previous 'rcar_fcp_get()' call must be undone in the error handling path,
> as already done in the remove function.
>
> Fixes: 94fcdf829793 ("[media] v4l: vsp1: Add FCP support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
