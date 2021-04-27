Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAF2C36CC28
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 22:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238992AbhD0UJW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 16:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236459AbhD0UJV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 16:09:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E27D3C061574;
        Tue, 27 Apr 2021 13:08:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7274DE9;
        Tue, 27 Apr 2021 22:08:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619554114;
        bh=Or+8N/MeGAcVScPcwIxTnMGbz1KM8JifbgpfVKyS31w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cll0uyJhxZZCF++/Z3aF0xTJAf7xfJ04Gi4XPd3hhxO807YVFQA9+zWsTJcUms5Y5
         L7MiKLy1vd8mv/8Qh69mn0ECdC6esrk132Paxe0I9DUHGRlBkOAjZLyI4vMI1GLenQ
         Gud/Xmizvynt5T8AkM+F0EgZF+j9J6RxgTfYKfcc=
Date:   Tue, 27 Apr 2021 23:08:28 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] media: dt-bindings: media: renesas,drif: Fix fck
 definition
Message-ID: <YIhvPCzWOah2kFk7@pendragon.ideasonboard.com>
References: <20210408202436.3706-1-fabrizio.castro.jz@renesas.com>
 <20210409185420.GA3955417@robh.at.kernel.org>
 <CAL_JsqL5tzJhMzTyyTDnVh=doDknepkk8R0McKsj4U2aqSMFAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqL5tzJhMzTyyTDnVh=doDknepkk8R0McKsj4U2aqSMFAw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

On Tue, Apr 27, 2021 at 01:02:57PM -0500, Rob Herring wrote:
> On Fri, Apr 9, 2021 at 1:54 PM Rob Herring wrote:
> > On Thu, 08 Apr 2021 21:24:36 +0100, Fabrizio Castro wrote:
> > > dt_binding_check reports the below error with the latest schema:
> > >
> > > Documentation/devicetree/bindings/media/renesas,drif.yaml:
> > >   properties:clock-names:maxItems: False schema does not allow 1
> > > Documentation/devicetree/bindings/media/renesas,drif.yaml:
> > >   ignoring, error in schema: properties: clock-names: maxItems
> > >
> > > This patch fixes the problem.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > ---
> > >  Documentation/devicetree/bindings/media/renesas,drif.yaml | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Still failing in linux-next...

Sorry, as a standalone fix, I incorrectly thought you'd merge it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree. I'll send a pull request to linux-media when the
merge window closes.

-- 
Regards,

Laurent Pinchart
