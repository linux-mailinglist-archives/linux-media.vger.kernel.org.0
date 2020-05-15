Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 639941D4790
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 10:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgEOIAf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 04:00:35 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35140 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726665AbgEOIAe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 04:00:34 -0400
Received: by mail-oi1-f196.google.com with SMTP id o7so1487303oif.2;
        Fri, 15 May 2020 01:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YncV898UjXxBWm2giPLj4L0kWGTVbAItgNGD5qYRB1A=;
        b=VjWkZf5Ur6biZOXfZXcssV4jmiax87kc98dQivmbDKeLW/kQ5JeaZHAehz6WZ4J96J
         HhznNoKlt5AO5EfFhU1N/OBpoP2hcf4B153Z7mGD6lWGNlxKCngefQCnSA4mzKOG33UY
         FadwGZDXGFui5jUgGkjHnQ/Lm1NjlgdjRsKiBnqPfkFXSsluzNcQsPIsOBOVz0Rc2Iwh
         RTqwhw5s0BpsYy62y1lF0tf5N8HnxNdv18nHsVQIMsfCoxssmpcZ4w7ejZy02rc1WvgE
         BB1c3d2C/ZWdsyORV9oJ2ZKW21HdQ79HQo8hDHnhB6UXKM06Sg3tHoEBAtw4F9XBS9i4
         hAFA==
X-Gm-Message-State: AOAM53053SL8ufAoaDvuOwpSsLB087j44+lP7UI83DXQrjjKNH96yw6e
        ievAiQYSIouFw2xTi64V5Qib5jPYwTqTUMCv5QQ=
X-Google-Smtp-Source: ABdhPJz9ZEjPHeQF+FJnfoyiI0zgf3mPHnnSP/Y1JD/deklz9tASyJRaKQKwRTDPSLTcGhW6Haj4dup2gF+MZuYHnzU=
X-Received: by 2002:aca:cd93:: with SMTP id d141mr1172333oig.148.1589529634075;
 Fri, 15 May 2020 01:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com> <20200515012432.31326-6-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200515012432.31326-6-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 May 2020 10:00:23 +0200
Message-ID: <CAMuHMdXxXAgh02rH7VXM7idVZn-nGg=fR6jREr_bm5tY5_Z5TQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] dt-bindings: media: renesas,fdp1: Make power-domains mandatory
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
> All DT source files in the kernel tree specifyc the power-domains

specify (whoops, missed the same typo in PATCH 2/8).

> property. Make it mandatory.
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
