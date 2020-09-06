Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 921DB25F008
	for <lists+linux-media@lfdr.de>; Sun,  6 Sep 2020 21:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgIFTNI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Sep 2020 15:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgIFTNF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Sep 2020 15:13:05 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47893C061573;
        Sun,  6 Sep 2020 12:13:03 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id h126so8079361ybg.4;
        Sun, 06 Sep 2020 12:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MgmQRS/ZuABczcAhFpkWQb32cuty/Ty6gXeQFd9EdvI=;
        b=hvUlw3Cq2qMD11h0PajF3/NulFX8UMF7h3IXx4ZTJQ7eVw+8sx/1CLZSA1YUvUg90V
         eUVD99TSA1pb8Fz/OXMh6Zuw+Sat0AavAMatJH6S/ToNRllWgJmSOVd/LgNk2Tns2stL
         VukMb4ttstje7FRPMf8ysE5pePwWAoLl7G97pJPxopLdE/n8ofY/+h8WTRPFeDzERfCz
         fKEj+feUVciUBFLPtgsbWcy3XYNbpfp1XVJOvpsVUSygGFnRSqlCXOH3jnqEN2wpbWbA
         Iv7n2Y1F/9mztn0fLebHvxeG8OYRshuEjy+5Wo9X5l6YNpHLa9Ut8l09n5JZwJBc8/mW
         bZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MgmQRS/ZuABczcAhFpkWQb32cuty/Ty6gXeQFd9EdvI=;
        b=EolaOtCRDudWKpNSCHMRN/eWXOqGopKXZft+MoxWBcWA5KccrYPSwYirN6kTJcIH24
         RWEJpmEJc6eC3jGFmcoVddT4SSltZp4boHvghVZvC6H9eXR6U9xI79TyVLCT4r8SYqUw
         XWTYL/VsgwF3HIkiGKaOh2f7KPycDFY8SrqA/dQW4+QSUmPDti3H/Y1ob4gPOQb+cfZk
         9hD40VavZaoBmlsLrP9kCtyaCA5esWjbmpDE3sM8iFZnnrnociuzGSkkuhD4TzWyxalU
         VxFx85iCsFVgCZ9vZcdiizs0g7G9qALWTTqlRmXAK+QITb1c9T1AMBn8Ur0sUqokvshN
         9gOg==
X-Gm-Message-State: AOAM531UEfsjk2YpU3OCU2LOTmiwn3xQh9rFXScu3dl9da1enmsF6OTZ
        SEJsIT2ATRZNl4OhxXQienHnCKl9Mj/B7qMCtW3IMBSJEz8=
X-Google-Smtp-Source: ABdhPJzo1dmi1Dzh3CjwrkhtIOAQnq51Cf0vvZmatGtUqmHWX3KHMmG+S9Jmg+zLhGdj+QBInd3C94sJeAKurni3CC8=
X-Received: by 2002:a25:dc0c:: with SMTP id y12mr22525867ybe.395.1599419581239;
 Sun, 06 Sep 2020 12:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <1596187745-31596-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200801090456.GB1379367@oden.dyn.berto.se> <CA+V-a8sOHct_JetCsug8Z2BQpMLH2p39hj2XNw_1N5gkBQp1Gg@mail.gmail.com>
 <20200803192108.GB2297236@oden.dyn.berto.se> <6d659e56-1e1f-c9c7-2e66-4ddc4e7fad15@xs4all.nl>
 <CA+V-a8uzznUvzGgZ5A4B8ASEDbmMCrQPSAcEjO7v45zmAkdGDQ@mail.gmail.com> <20200904022522.GD9369@pendragon.ideasonboard.com>
In-Reply-To: <20200904022522.GD9369@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sun, 6 Sep 2020 20:12:35 +0100
Message-ID: <CA+V-a8tTKu5FeEs+Hi2AwXy-i5OFufeyhTKGC6D4C5fK81895g@mail.gmail.com>
Subject: Re: [PATCH] media: rcar-vin: Update crop and compose settings for
 every s_fmt call
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Niklas <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
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

Hi Laurent,

On Fri, Sep 4, 2020 at 3:25 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Thu, Sep 03, 2020 at 03:53:18PM +0100, Lad, Prabhakar wrote:
> > On Wed, Aug 19, 2020 at 3:08 PM Hans Verkuil wrote:
> > > On 03/08/2020 21:21, Niklas wrote:
> > > > On 2020-08-03 19:11:32 +0100, Lad, Prabhakar wrote:
> > > >> On Sat, Aug 1, 2020 at 10:04 AM Niklas wrote:
> > > >>> On 2020-07-31 10:29:05 +0100, Lad Prabhakar wrote:
> > > >>>> The crop and compose settings for VIN in non mc mode werent updated
> > > >>>> in s_fmt call this resulted in captured images being clipped.
> > > >>>>
> > > >>>> With the below sequence on the third capture where size is set to
> > > >>>> 640x480 resulted in clipped image of size 320x240.
> > > >>>>
> > > >>>> high(640x480) -> low (320x240) -> high (640x480)
> > > >>>>
> > > >>>> This patch makes sure the VIN crop and compose settings are updated.
> > > >>>
> > > >>> This is clearly an inconsistency in the VIN driver that should be fixed.
> > > >>> But I think the none-mc mode implements the correct behavior. That is
> > > >>> that S_FMT should not modify the crop/compose rectangles other then make
> > > >>> sure they don't go out of bounds. This is an area we tried to clarify in
> > > >>> the past but I'm still not sure what the correct answer to.
> > > >>>
> > > >> What should be the exact behaviour of the bridge driver  for s_fmt
> > > >> call. Should the crop/compose settings be updated for every s_fmt
> > > >> callback or should they be only updated on s_selection callback.
> > > >> Currently the non-mc rcar-vin doesnt update the crop/compose setting
> > > >> in s_fmt callback due to which I see the above issue as mentioned.
> > > >
> > > > This is not entirely correct. It does update the crop and compose
> > > > rectangles on s_fmt, it makes sure they are not out-of-bounds for the
> > > > new format if it's accepted by s_fmt. See v4l2_rect_map_inside() calls
> > > > in the snippet bellow.
> > >
> > > For non-mc mode s_fmt must update any crop/compose rectangles to ensure that
> > > they are not out-of-bounds. But for mc mode the validation is done when you
> > > start streaming, so I think s_fmt won't make any changes in that mode.
> >
> > Thank you Hans.
> >
> > > Double-check that with Laurent, though...
> >
> > Niklas/Laurent - How do we proceed on this ?
>
> MC devices rely on userspace to propagate formats between entities, and
> on kernelspace to propagate formats within entities. This is documented
> in https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/dev-subdev.html.
> The configuration of an entity (formats and selection rectangles) must
> be valid at all times. Subdev drivers should thus either adjust or reset
> the crop and selection rectangles. The specification isn't clear on
> which behaviour should be implemented, the only related text is
>
> "Sub-devices that scale frames using variable scaling factors should
> reset the scale factors to default values when sink pads formats are
> modified. If the 1:1 scaling ratio is supported, this means that source
> pads formats should be reset to the sink pads formats."
>
> I would recommend resetting as the default behaviour. In any case,
> adjustements are needed to ensure that the configuration remains valid.
>
In that case can I have your Ack to the patch please.

Cheers,
Prabhakar
