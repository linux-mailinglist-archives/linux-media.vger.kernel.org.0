Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 315C93140C2
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 21:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232256AbhBHUoP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 15:44:15 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:33132 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233895AbhBHUnc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 15:43:32 -0500
Received: by mail-oi1-f169.google.com with SMTP id g84so3267013oib.0;
        Mon, 08 Feb 2021 12:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lqbgn1lmL2cL5DYt9q9nSP49gv4U9EE3rDHuAVIFwLs=;
        b=qft/sYYcFols294PwjcWccS/8VoqdKqyiSBSO1dy0mEKZw8g3BDBih3TRlzM1rl89x
         v5jXmEjGvcU7F9Pxog1yOvWroSCwD06NmzErxUpMEt/fqd2iZg3KfNwwQb51wJUrUowY
         JdZvCfPPfXI2Ps829WLfl2/PVH1Ap14zhC0UFHfZzTWAYAFVedEWipbjV21BuBie42h5
         u4fher8C8z4TRJJH5lPE2p1LoAfuPnlrWyuCBk7diRutxuDa5kODwzd3jivE/DoEJG1L
         uz98IulDElB2oIFYRgC9pPQpQja+dRPLuelu24fQaS4ARJ/9nGqLvbst8ulF8cxw2fDJ
         c/8A==
X-Gm-Message-State: AOAM532MmTg1RYfrLCiwEqfGpMUOFU2MBbhzBYEncG8OYl6deJALiFr7
        /pfRmspWbXnRKwGPj6OhhiJLjhF7D5k5zdUcszA=
X-Google-Smtp-Source: ABdhPJz342gs0SyK+2LHxFAU3QnGS+KMkgrV2esOCBS31UAWInYufgEEIXTFIpfhS9P27GfLBpAqGa3aFe5x61xVjPs=
X-Received: by 2002:aca:d8c6:: with SMTP id p189mr386047oig.54.1612816971168;
 Mon, 08 Feb 2021 12:42:51 -0800 (PST)
MIME-Version: 1.0
References: <20210208182006.178740-1-jacopo+renesas@jmondi.org>
In-Reply-To: <20210208182006.178740-1-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Feb 2021 21:42:39 +0100
Message-ID: <CAMuHMdVgci8nJr_JDSPX1BdXpJkS9asBH7htsEdNVPSR9m06iQ@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: Kconfig: Make MAX9271 a module
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Next <linux-next@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for your patch!

On Mon, Feb 8, 2021 at 7:22 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> With the introduction of the RDACM21 camera module support in
> commit a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> the symbols defined by the max9271 library were exported twice
> if multiple users of the library were compiled in at the same time.
>
> In example:
> WARNING: modpost: drivers/media/i2c/rdacm21-camera_module:
> 'max9271_set_serial_link' exported twice. Previous export was in
> drivers/media/i2c/rdacm20-camera_module.ko
>
> Fix this by making the rdacm21 file a module and have the driver

max9271

> using its functions select it.
>
> Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
