Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDE9EDE580
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 09:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbfJUHsp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 03:48:45 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38118 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfJUHso (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 03:48:44 -0400
Received: by mail-ot1-f65.google.com with SMTP id e11so10164105otl.5;
        Mon, 21 Oct 2019 00:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5ZskpJFZZjRWlDfk3HdlskpXJkZ/WC5DVrjGNJ7zvD8=;
        b=h6V4JJ+H96or8MxVLqE5G3cDJUsUQoxCHrBdIEsGIjZe0/ENswTjlNmilL/X72+qYO
         ZieV9wBuvUGIBNAqNPd+zzrqEKHT/+P4i+5tH0HeqivaMIJlH2INMBprMJt4Yk1KHMxQ
         8C7h2Kj3/p40hM1Fj565YNV9h3woLjNbbobK96gTxCqQptL4h+EQQA0Slc0DSSzYwyy4
         5FQuPOzmUo+jFwcMKklZ4EV6bFg/FHgUNUASH4+dRzp4/JlUYGzVhu/zlZAw3Uf50ei9
         4Q3uWPUUnIC/4tKC1R6dJWtVchbaUECbR9mNxw/5KtJApBVe77DGGl2VQNzzYcAkR9OJ
         TtHQ==
X-Gm-Message-State: APjAAAVFWLzM5C1Zd2cQl7b/KHkX7OxR0qWvq3+PYXdIIJ2nNG+eEYsh
        KZR+VNvneMkR60BrhPrO/0c6RF1hcwCPSY/TL5A=
X-Google-Smtp-Source: APXvYqxAa1Uh4f3nMQcU7x2UilhoGASUblB6WQl63Anx5OIa9PpKN4dhON/vvS7BUxjpQxmNi8a8uNE1yYmqqr1CGHY=
X-Received: by 2002:a05:6830:1685:: with SMTP id k5mr17476718otr.250.1571644122314;
 Mon, 21 Oct 2019 00:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191018044701.4786-1-kjlu@umn.edu>
In-Reply-To: <20191018044701.4786-1-kjlu@umn.edu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Oct 2019 09:48:31 +0200
Message-ID: <CAMuHMdVnsoarYww+5hs+D6+8bWv0EO_9vs81ZrSTOo5g63deAg@mail.gmail.com>
Subject: Re: [PATCH] media: rcar_drif: fix a memory disclosure
To:     Kangjie Lu <kjlu@umn.edu>
Cc:     Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kangjie,

On Sat, Oct 19, 2019 at 12:29 AM Kangjie Lu <kjlu@umn.edu> wrote:
> "f->fmt.sdr.reserved" is uninitialized. As other peer drivers
> like msi2500 and airspy do, the fix initializes it to avoid
> memory disclosures.
>
> Signed-off-by: Kangjie Lu <kjlu@umn.edu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/media/platform/rcar_drif.c
> +++ b/drivers/media/platform/rcar_drif.c
> @@ -912,6 +912,7 @@ static int rcar_drif_g_fmt_sdr_cap(struct file *file, void *priv,
>  {
>         struct rcar_drif_sdr *sdr = video_drvdata(file);
>
> +       memset(f->fmt.sdr.reserved, 0, sizeof(f->fmt.sdr.reserved));
>         f->fmt.sdr.pixelformat = sdr->fmt->pixelformat;
>         f->fmt.sdr.buffersize = sdr->fmt->buffersize;

I would do the memset() at the end, though, to follow declaration order of the
struct members.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
