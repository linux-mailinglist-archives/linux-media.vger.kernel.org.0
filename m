Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE3625CF63
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 04:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729521AbgIDCZu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 22:25:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42658 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729036AbgIDCZt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 22:25:49 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3AD5E540;
        Fri,  4 Sep 2020 04:25:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599186346;
        bh=w9NLWnAFcQLVq1EwBFRPmlSl/bYxVQBc5Mr5/U5dENA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K47bAsqXW3u1MToGpXr893HuQAL7R2WqE8Ma2eGYuleWp/lO1cNbT8KOGUmPrpgpP
         pKfwMkeOvyL8NKtUgrGrI3/MjzdLQ5/lvPCI0T4IyIfNvm4vox2BpKdmATeQjeopFg
         oP8vFxFH6COAZVbVHXUN6AiAuAXdL4BWq/wUteg0=
Date:   Fri, 4 Sep 2020 05:25:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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
Subject: Re: [PATCH] media: rcar-vin: Update crop and compose settings for
 every s_fmt call
Message-ID: <20200904022522.GD9369@pendragon.ideasonboard.com>
References: <1596187745-31596-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200801090456.GB1379367@oden.dyn.berto.se>
 <CA+V-a8sOHct_JetCsug8Z2BQpMLH2p39hj2XNw_1N5gkBQp1Gg@mail.gmail.com>
 <20200803192108.GB2297236@oden.dyn.berto.se>
 <6d659e56-1e1f-c9c7-2e66-4ddc4e7fad15@xs4all.nl>
 <CA+V-a8uzznUvzGgZ5A4B8ASEDbmMCrQPSAcEjO7v45zmAkdGDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+V-a8uzznUvzGgZ5A4B8ASEDbmMCrQPSAcEjO7v45zmAkdGDQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Thu, Sep 03, 2020 at 03:53:18PM +0100, Lad, Prabhakar wrote:
> On Wed, Aug 19, 2020 at 3:08 PM Hans Verkuil wrote:
> > On 03/08/2020 21:21, Niklas wrote:
> > > On 2020-08-03 19:11:32 +0100, Lad, Prabhakar wrote:
> > >> On Sat, Aug 1, 2020 at 10:04 AM Niklas wrote:
> > >>> On 2020-07-31 10:29:05 +0100, Lad Prabhakar wrote:
> > >>>> The crop and compose settings for VIN in non mc mode werent updated
> > >>>> in s_fmt call this resulted in captured images being clipped.
> > >>>>
> > >>>> With the below sequence on the third capture where size is set to
> > >>>> 640x480 resulted in clipped image of size 320x240.
> > >>>>
> > >>>> high(640x480) -> low (320x240) -> high (640x480)
> > >>>>
> > >>>> This patch makes sure the VIN crop and compose settings are updated.
> > >>>
> > >>> This is clearly an inconsistency in the VIN driver that should be fixed.
> > >>> But I think the none-mc mode implements the correct behavior. That is
> > >>> that S_FMT should not modify the crop/compose rectangles other then make
> > >>> sure they don't go out of bounds. This is an area we tried to clarify in
> > >>> the past but I'm still not sure what the correct answer to.
> > >>>
> > >> What should be the exact behaviour of the bridge driver  for s_fmt
> > >> call. Should the crop/compose settings be updated for every s_fmt
> > >> callback or should they be only updated on s_selection callback.
> > >> Currently the non-mc rcar-vin doesnt update the crop/compose setting
> > >> in s_fmt callback due to which I see the above issue as mentioned.
> > >
> > > This is not entirely correct. It does update the crop and compose
> > > rectangles on s_fmt, it makes sure they are not out-of-bounds for the
> > > new format if it's accepted by s_fmt. See v4l2_rect_map_inside() calls
> > > in the snippet bellow.
> >
> > For non-mc mode s_fmt must update any crop/compose rectangles to ensure that
> > they are not out-of-bounds. But for mc mode the validation is done when you
> > start streaming, so I think s_fmt won't make any changes in that mode.
>
> Thank you Hans.
> 
> > Double-check that with Laurent, though...
>
> Niklas/Laurent - How do we proceed on this ?

MC devices rely on userspace to propagate formats between entities, and
on kernelspace to propagate formats within entities. This is documented
in https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/dev-subdev.html.
The configuration of an entity (formats and selection rectangles) must
be valid at all times. Subdev drivers should thus either adjust or reset
the crop and selection rectangles. The specification isn't clear on
which behaviour should be implemented, the only related text is

"Sub-devices that scale frames using variable scaling factors should
reset the scale factors to default values when sink pads formats are
modified. If the 1:1 scaling ratio is supported, this means that source
pads formats should be reset to the sink pads formats."

I would recommend resetting as the default behaviour. In any case,
adjustements are needed to ensure that the configuration remains valid.

-- 
Regards,

Laurent Pinchart
