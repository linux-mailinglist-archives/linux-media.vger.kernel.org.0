Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9D7FC0CB3
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 22:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbfI0UhI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 16:37:08 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43083 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfI0UhI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 16:37:08 -0400
Received: by mail-oi1-f196.google.com with SMTP id t84so6298554oih.10;
        Fri, 27 Sep 2019 13:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RAIgD+KVKQMaXcKo0PziTz/C7vJQHz15LP8WFCSpXyo=;
        b=XaghxHmZmJ7fL3q+NmLBGZg7dmgQ+/mtJxoIT5zWZ5aoF1NObZM1LE5Kwlilb4yHr+
         pahBwvyPU3eb35OAoYY7+66lcaMdlRRqRIATyQunFYWZEO2xx3ie28ez1AhmNwJ3FR1a
         urwBJn43UweVj1TDpXcYg29z+KWUIMC2R5sSzgwySjtsd3E5hesvyeuOLCgY/dXoaPkT
         LxXvpsihkr7Mvbn/xQRteS7evPT/Ba4Z1e8K53QTIYSuTLf+rudONisrUye48z3ln/IL
         LxGYRryaFA9/R+RD+w1Lp1Aq3HWY+B7twnTKTaIzFaAuliMRQ3v5herSOAefM7VnMEYJ
         XLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RAIgD+KVKQMaXcKo0PziTz/C7vJQHz15LP8WFCSpXyo=;
        b=VttQNsQq3jpRbYLCn6i772oQUZm8XBX7EhEHJ12ZoP4JA7EFwuOrxm+5ZuA886q4m2
         h/f7I8Oy8lkgJ6ouTcMXUoCwrJ2LAUiZDZyBzRIuyFx8SQovDLrI2mjQidxpMAARsIyf
         ASyhFXThOC++P3EsG4Fi4hYSs09263X9hPL3z8b/PFi83wDeitDk3Z7YRkN0Rl3lLhcB
         BsNfc7mL8QtItpkFnU+mP+abCOwpBuC+VOKLKlWyn73y835wbNhoBzDqZ8llHAtrjw+B
         bNkevoVCerP9cDI/WGFe1hQNOLhsRVCbZf6u2hmUImy3dmEx/OPxAuLjOApFGt4y1sdX
         pPTw==
X-Gm-Message-State: APjAAAW5nMQ05++7UlIzBay0NeFYZZC3VCqTDr8WP39RMhLoX8BJ8GJ7
        a6AIKeziFxWJuzrzNNR9VD7rtudRcnV9o7TPFZn4NrmqC9U=
X-Google-Smtp-Source: APXvYqyzvqWMmEr0sDH1XpuL+EzY3nFF8uZqBdufzKzWysxxwjpxSQOFwpllG7yQchTFRGeddYLPDCHuQK0ORWE4Lgg=
X-Received: by 2002:aca:d485:: with SMTP id l127mr8335882oig.162.1569616627588;
 Fri, 27 Sep 2019 13:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190927184722.31989-1-bparrot@ti.com> <20190927184722.31989-8-bparrot@ti.com>
In-Reply-To: <20190927184722.31989-8-bparrot@ti.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Fri, 27 Sep 2019 21:36:41 +0100
Message-ID: <CA+V-a8vY8pV8L2_JHM-AE=3h03arEtmxVhW_vh6r17pb2X3obA@mail.gmail.com>
Subject: Re: [Patch v4 7/8] media: i2c: ov2659: Fix missing 720p register config
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Sep 27, 2019 at 7:47 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> The initial registers sequence is only loaded at probe
> time. Afterward only the resolution and format specific
> register are modified. Care must be taken to make sure
> registers modified by one resolution setting are reverted
> back when another resolution is programmed.
>
> This was not done properly for the 720p case.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/i2c/ov2659.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad

> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index 7d0baa386644..720310e0725d 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -412,10 +412,14 @@ static struct sensor_register ov2659_720p[] = {
>         { REG_TIMING_YINC, 0x11 },
>         { REG_TIMING_VERT_FORMAT, 0x80 },
>         { REG_TIMING_HORIZ_FORMAT, 0x00 },
> +       { 0x370a, 0x12 },
>         { 0x3a03, 0xe8 },
>         { 0x3a09, 0x6f },
>         { 0x3a0b, 0x5d },
>         { 0x3a15, 0x9a },
> +       { REG_VFIFO_READ_START_H, 0x00 },
> +       { REG_VFIFO_READ_START_L, 0x80 },
> +       { REG_ISP_CTRL02, 0x00 },
>         { REG_NULL, 0x00 },
>  };
>
> --
> 2.17.1
>
