Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0088F3A537
	for <lists+linux-media@lfdr.de>; Sun,  9 Jun 2019 13:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbfFILvk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jun 2019 07:51:40 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33584 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728161AbfFILvk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jun 2019 07:51:40 -0400
Received: by mail-lj1-f195.google.com with SMTP id v29so5463022ljv.0;
        Sun, 09 Jun 2019 04:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nkggr5nsJDjImC3yF9/sX89fRKsHO5WvE5Dpwrs1IK4=;
        b=KeoWl0kCkVaw49rNqAnx6udYYefRTa9Ulz2GQ2cVT+My0M5ajgP6fUXYyq2Iy2ORhM
         eZuOr/OISNzWRFaxSluGFPJFjPH+O6NuVBFnv8HunQysAMoR2XWJmdigW78TNeox/21n
         JwNpaMnMeJgcXuySATordNPd/rH6PJGA8bGDMXf0qMhf2RvMi6rfm3FRQNcH/e9hK17z
         bENsybLS4+74qaoxyubOgh1r+z9xCItqQXEmvtyCcsn3dzgPoMOt7HstPRRc3cU64Gaj
         hI1hCKt5IR5QVFXhkLzeDgJHgZlwe5cqGJs0RZSc+rV1dun8C7kHmoKrhiOS1CCqcpix
         8H6g==
X-Gm-Message-State: APjAAAXlBl1XqwKSGFs+2ioLKWSFfdorLqUfE6ycdwwMJwYhB41eDSaF
        alblT4deRnqJoHty3+AV9fazvzfHR03Qh+CCzzUZzg==
X-Google-Smtp-Source: APXvYqyXB/3D7eb+/rqz7nZVEwVoROrGU9/4DNdGokqsoZ281m2FeOCJ2dNAk21lEE0RloAGSLKZ5WM8Qw19MpLoQBs=
X-Received: by 2002:a2e:91c5:: with SMTP id u5mr22112565ljg.65.1560081098417;
 Sun, 09 Jun 2019 04:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190608125331.29146-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUobhMrDYBoYVo091re7LGrYEGgCsXbMh8a4MrF4zoP7g@mail.gmail.com> <20190609100845.GA4778@pendragon.ideasonboard.com>
In-Reply-To: <20190609100845.GA4778@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 9 Jun 2019 13:51:24 +0200
Message-ID: <CAMuHMdVBT0bVb-e3dDEz0-SP0GA+xoq3qrjXv66rFr9CVkHiEQ@mail.gmail.com>
Subject: Re: [PATCH] v4l: rcar-fcp: Read IP version register at probe time
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Jun 9, 2019 at 12:09 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Sun, Jun 09, 2019 at 10:06:19AM +0200, Geert Uytterhoeven wrote:
> > On Sat, Jun 8, 2019 at 2:55 PM Laurent Pinchart wrote:
> > > This helps identifying the IP core version, for debugging purpose only
> > > for now.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/media/platform/rcar-fcp.c
> > > +++ b/drivers/media/platform/rcar-fcp.c

> > > +       if (IS_ERR(fcp->iomem))
> > > +               return PTR_ERR(fcp->iomem);
> > > +
> > > +       pm_runtime_get_sync(&pdev->dev);
> > > +       version = rcar_fcp_read(fcp, FCP_VCR);
> >
> > Please note that rcar_fcp_read() does not exist in upstream nor next,
> > and linux-renesas-soc hasn't seen the patch that added it.
>
> That's why it was added in this patch :-)

Bummer... Do you plan to have other users?
If not, I'd just open-code this single-line function.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
