Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D91D1D47CD
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 10:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgEOIKm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 04:10:42 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35926 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgEOIKl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 04:10:41 -0400
Received: by mail-ot1-f67.google.com with SMTP id t3so1263019otp.3;
        Fri, 15 May 2020 01:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vKa3opg7C6b7eZU3bWUoqo8wy/Mm7/l4FtIPg5wr+z4=;
        b=L6iCOBBKy7547QH54rJCYf3FRneBz5lKWz+IiF9yKH3fIaXnHSR/6wwQrvMo3GVjTT
         nee2YtVhyqTLG9PpJ+nGotpb9KHMNMVqGa3d/CCe8G9ylPWcx+MBGgeDe5+fyJPe9wXD
         WrqquqPXvUkVsB2fR0M0T8cQ/7izogj4beotrCNPID7khG9+yDN7iBayodHgwsLVfHyC
         fAZxScsn7p83fr4rFsWxUxSA1SfM4x7E7desyHu/PAPvXh7Cqi8Tz2avqlMy5g3F6MIO
         m6d6dNPBWD9w9bYJ37U1NkZI9Hhy7pmLL6VJMN0l7G7kmrJIhUoJgP8aRMVKxzCe8YrT
         +ssg==
X-Gm-Message-State: AOAM532MpaurzZ6RKxTfhR+LZsjQpRt+dPytmYe4lEbGp/FY1kdB+A5O
        tct7QAbYY9cz+3Gik0hO0wd/J8NOajLvF/s611I=
X-Google-Smtp-Source: ABdhPJwvC2aP4d3PtU39rRiNVY4+dbRfoi/AZvTo2CERwlcKdM+RGAs4CQ5/a7guuTjJ0b2BBZab5vp6AeIiTj06zSs=
X-Received: by 2002:a9d:564:: with SMTP id 91mr1398559otw.250.1589530240994;
 Fri, 15 May 2020 01:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com> <20200515012432.31326-8-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200515012432.31326-8-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 May 2020 10:10:30 +0200
Message-ID: <CAMuHMdV4BbQnrJKJSe8+Pyf1UtECr284AdwwvEj01-1Bx-dDQA@mail.gmail.com>
Subject: Re: [PATCH 7/8] dt-bindings: media: renesas,vsp1: Convert binding to YAML
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
> Convert the Renesas R-Car VSP1 text binding to YAML.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -0,0 +1,83 @@

> +properties:
> +  compatible:
> +    enum:
> +      - renesas,vsp1 # for the R-Car Gen2 and RZ/G1 VSP1
> +      - renesas,vsp2 # for the R-Car Gen3 and RZ/G2 VSP2

I would do it the terse way, and just write e.g. "# R-Car Gen2 and RZ/G1".
Up to you...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
