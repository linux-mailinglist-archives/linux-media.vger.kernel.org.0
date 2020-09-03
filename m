Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B95A25C396
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 16:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729247AbgICOyQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 10:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729272AbgICOxq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 10:53:46 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26492C061244;
        Thu,  3 Sep 2020 07:53:46 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id q3so2387534ybp.7;
        Thu, 03 Sep 2020 07:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BUTCAz6NpTHnYSy41tDHUPK10I/ooWiW5ynjjM0xqGo=;
        b=OhQ8s42iE3dDc5kXXKOjtj3ByKV7HNPHcTT/8BS+MTRq93ngVIXKHbgdetcF1nYstS
         WzLJ9n1oGPeeSyqUKe9Ascrsc/Z0DKH6wDG1xw1T5ewzXHUzI6zTas600zMEUKUuPeov
         urB/YG7EOEeEJ6MhTZhgLyDpanOwbbwsCPMx4eORDVW9pMiCanKW9uL//CprvQ6yi9PG
         pZaLrX2BGXoND12Dw5gcq/XGR0FY9JoYFg3qhBr1pkkix/UZJJ6xid8IncCCB26XORL9
         u/bDKaBnPpbcNDGc2WYwuOVqyvu4/fFfc5XfN1N9vr4/Cq3N8fSzgQEafkz2vFwZQSAO
         ao7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BUTCAz6NpTHnYSy41tDHUPK10I/ooWiW5ynjjM0xqGo=;
        b=gStFiw8gUpQAkm3YECZss+788ZzJUgX5DRGV9xKIe2ZEfiJJbyRfclkX0hIRN9lC00
         /ASBGKiXkEIFmeQis4KY7PucsuTdubtQmZKu7kT/Mt543zSAbfZmkk9R/5jYFKbC1Ui7
         sVd8WHAMjURNMDePxlfaMtyJoTUcR5SC8LDc066yGhYJoC+QP/K9/dOTsomY6lpH798m
         XTKZGZqxn1Q7bP09C8wAf72gNAw2MuOrevH2HZcbtbvKy396Iv33XKhGEDEplbQyfnv2
         fplm3yVff+ORXZpmB5OIhG1BNITwArlbis4PQzHMsdLhkCU68QMazd3JV+TAv9RL1J8M
         L55A==
X-Gm-Message-State: AOAM5315xAJ3bDwWbAMAJp8ComXlJrlK523xggDuY/lz3pVv7CUHFsJJ
        y1UTbhX6WoPFKPsvTMys76aQparmo0PQHzS7FSk=
X-Google-Smtp-Source: ABdhPJzbm+ZT1PvppuhUQJcxzBdWcarzRL8lEAPC8ShJTmlv8eKrLSJ9hvyeIWhnAF79PlsOC+1g4btwsGdYP7cA4pU=
X-Received: by 2002:a25:86cf:: with SMTP id y15mr2953409ybm.25.1599144825202;
 Thu, 03 Sep 2020 07:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <1596187745-31596-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200801090456.GB1379367@oden.dyn.berto.se> <CA+V-a8sOHct_JetCsug8Z2BQpMLH2p39hj2XNw_1N5gkBQp1Gg@mail.gmail.com>
 <20200803192108.GB2297236@oden.dyn.berto.se> <6d659e56-1e1f-c9c7-2e66-4ddc4e7fad15@xs4all.nl>
In-Reply-To: <6d659e56-1e1f-c9c7-2e66-4ddc4e7fad15@xs4all.nl>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 3 Sep 2020 15:53:18 +0100
Message-ID: <CA+V-a8uzznUvzGgZ5A4B8ASEDbmMCrQPSAcEjO7v45zmAkdGDQ@mail.gmail.com>
Subject: Re: [PATCH] media: rcar-vin: Update crop and compose settings for
 every s_fmt call
To:     Niklas <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 19, 2020 at 3:08 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 03/08/2020 21:21, Niklas wrote:
> > Hi Lad, Hans,
> >
> > On 2020-08-03 19:11:32 +0100, Lad, Prabhakar wrote:
> >> Hi Hans,
> >>
> >> On Sat, Aug 1, 2020 at 10:04 AM Niklas <niklas.soderlund@ragnatech.se> wrote:
> >>>
> >>> Hi Lad,
> >>>
> >>> Thanks for your work.
> >>>
> >>> On 2020-07-31 10:29:05 +0100, Lad Prabhakar wrote:
> >>>> The crop and compose settings for VIN in non mc mode werent updated
> >>>> in s_fmt call this resulted in captured images being clipped.
> >>>>
> >>>> With the below sequence on the third capture where size is set to
> >>>> 640x480 resulted in clipped image of size 320x240.
> >>>>
> >>>> high(640x480) -> low (320x240) -> high (640x480)
> >>>>
> >>>> This patch makes sure the VIN crop and compose settings are updated.
> >>>
> >>> This is clearly an inconsistency in the VIN driver that should be fixed.
> >>> But I think the none-mc mode implements the correct behavior. That is
> >>> that S_FMT should not modify the crop/compose rectangles other then make
> >>> sure they don't go out of bounds. This is an area we tried to clarify in
> >>> the past but I'm still not sure what the correct answer to.
> >>>
> >> What should be the exact behaviour of the bridge driver  for s_fmt
> >> call. Should the crop/compose settings be updated for every s_fmt
> >> callback or should they be only updated on s_selection callback.
> >> Currently the non-mc rcar-vin doesnt update the crop/compose setting
> >> in s_fmt callback due to which I see the above issue as mentioned.
> >
> > This is not entirely correct. It does update the crop and compose
> > rectangles on s_fmt, it makes sure they are not out-of-bounds for the
> > new format if it's accepted by s_fmt. See v4l2_rect_map_inside() calls
> > in the snippet bellow.
>
> For non-mc mode s_fmt must update any crop/compose rectangles to ensure that
> they are not out-of-bounds. But for mc mode the validation is done when you
> start streaming, so I think s_fmt won't make any changes in that mode.
>
Thank you Hans.

> Double-check that with Laurent, though...
>
Niklas/Laurent - How do we proceed on this ?

Cheers,
Prabhakar
