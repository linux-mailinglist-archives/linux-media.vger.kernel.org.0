Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2EEA275CAE
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 18:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgIWQC5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 12:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgIWQC5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 12:02:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D064C0613CE;
        Wed, 23 Sep 2020 09:02:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 40C7A555;
        Wed, 23 Sep 2020 18:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600876972;
        bh=Y/VHXN6kPaIwNOZNK6qGYstoYWfdVykQEHkaDw7cLVQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V206k/Ur9SWFuWWUG20oryXpVut9gXV4a4iMRKU7eYF3ETg0E9E1rloRhBBU8golh
         howyHkenhuI0D8yHPyAj6LMSIVehQ/zvEd2jM63K8cGNcevRf5fbcTSXnyS4ZhcAux
         e/ltwm1/cI+cWFUi7eE+QuinAxQ1wjaIKFyh9OuQ=
Date:   Wed, 23 Sep 2020 19:02:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ramesh Shanmugasundaram <rashanmu@gmail.com>
Cc:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/3] MAINTAINERS: Add Fabrizio Castro to Renesas DRIF
Message-ID: <20200923160219.GE3980@pendragon.ideasonboard.com>
References: <20200916105949.24858-1-fabrizio.castro.jz@renesas.com>
 <20200916105949.24858-2-fabrizio.castro.jz@renesas.com>
 <CAJWpUEd5_fTUtT_9tuwpgvp=ECmh-NGcU2FH49jmyaJNxKCqmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJWpUEd5_fTUtT_9tuwpgvp=ECmh-NGcU2FH49jmyaJNxKCqmA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 20, 2020 at 12:22:14PM +0100, Ramesh Shanmugasundaram wrote:
> Hi Fabrizio,
> 
> >
> > Renesas are expanding their DRIF support and offering,
> > I'll be the internal maintainer for DRIF.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thank you for volunteering :-).
> 
> Reviewed-by: Ramesh Shanmugasundaram <rashanmu@gmail.com>
> 
> Please feel free to take my name off the maintainers list as I am not
> spending time on this topic for a while now.

Fabrizio, would you like to send a v2 that removes Ramesh from the
maintainers list for DRIF ?

> > ---
> > v1->v2:
> > * No change
> >
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2575f449139a..d9ebaf0c179b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10909,6 +10909,7 @@ F:      include/media/drv-intf/renesas-ceu.h
> >
> >  MEDIA DRIVERS FOR RENESAS - DRIF
> >  M:     Ramesh Shanmugasundaram <rashanmu@gmail.com>
> > +M:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> >  L:     linux-media@vger.kernel.org
> >  L:     linux-renesas-soc@vger.kernel.org
> >  S:     Supported

-- 
Regards,

Laurent Pinchart
