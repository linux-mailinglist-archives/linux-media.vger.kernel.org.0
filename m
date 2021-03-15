Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F7A33AA07
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 04:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhCODgt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Mar 2021 23:36:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57446 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhCODgr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Mar 2021 23:36:47 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05A5D87A;
        Mon, 15 Mar 2021 04:36:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615779406;
        bh=JMX/V3h6kFPGWMcfATCqZDWcBrZmOU12JQM5RTATxe8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g3vhw6cT/yD1jXitfqa4VZZxfmF+vy3yP2ouB/pQ7MEFwoGwKoKmIXN4bOHR/ys3+
         L5vbWTb8L+Wzahvl8atHedxc+akh/WgNQVoatHLg2r/9pbjp/5k44v8EsBcHObD19w
         HwCDtHkdjXL3yHpaLDkI9EEJWnz0Ni+1cPCzzIJU=
Date:   Mon, 15 Mar 2021 05:36:10 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] media: v4l: vsp1: Fix bru null pointer access
Message-ID: <YE7WKtXzxFdZL4Oh@pendragon.ideasonboard.com>
References: <20210301120828.6945-1-biju.das.jz@bp.renesas.com>
 <20210301120828.6945-2-biju.das.jz@bp.renesas.com>
 <67dbb76a-db02-7a49-9b1d-0218d01c3173@ideasonboard.com>
 <OS0PR01MB59225484E090C01FD25BAF3C86909@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59225484E090C01FD25BAF3C86909@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Thu, Mar 11, 2021 at 07:15:01AM +0000, Biju Das wrote:
> > Subject: Re: [PATCH 1/2] media: v4l: vsp1: Fix bru null pointer access
> > 
> > Hi Biju,
> > 
> > On 01/03/2021 12:08, Biju Das wrote:
> > > RZ/G2L SoC has only BRS. This patch fixes null pointer access,when
> > > only BRS is enabled.
> > >
> > > Fixes: cbb7fa49c7466("media: v4l: vsp1: Rename BRU to BRx")

Given that RZ/G2L isn't supported in mainline, this is hardly a fix, is
it ?

> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  drivers/media/platform/vsp1/vsp1_drm.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/vsp1/vsp1_drm.c
> > > b/drivers/media/platform/vsp1/vsp1_drm.c
> > > index 86d5e3f4b1ff..f6d2f47a4058 100644
> > > --- a/drivers/media/platform/vsp1/vsp1_drm.c
> > > +++ b/drivers/media/platform/vsp1/vsp1_drm.c
> > > @@ -245,7 +245,7 @@ static int vsp1_du_pipeline_setup_brx(struct
> > vsp1_device *vsp1,
> > >  		brx = &vsp1->bru->entity;
> > >  	else if (pipe->brx && !drm_pipe->force_brx_release)
> > >  		brx = pipe->brx;
> > > -	else if (!vsp1->bru->entity.pipe)
> > > +	else if (vsp1_feature(vsp1, VSP1_HAS_BRU) &&
> > > +!vsp1->bru->entity.pipe)
> > >  		brx = &vsp1->bru->entity;
> > >  	else
> > >  		brx = &vsp1->brs->entity;
> > 
> > 
> > The comments here describe that the choice to start at the BRU is
> > arbitrary, so if we could confirm that there will always be a BRS
> > otherwise, we could swap those to save an extra feature check.
> 
> As long as we are supporting composition(Multiple inputs with Blend and Raster operations)
> There will be either BRU or BRS or both in R-Car Gen3|RZ/G2 SoC's. Currently this is
> the case with all SoC variant of this families.

Given that the function is called vsp1_du_pipeline_setup_brx(), I think
we can assume there will be either a BRU or a BRS :-)

How many RPF instances does the RG/G2L VSPD have ?

> > But as we have both vsp1_feature(vsp1, VSP1_HAS_BRU) and
> > vsp1_feature(vsp1, VSP1_HAS_BRS), I don't think that's the case.
> > 
> > I'd almost want to check for vsp1_feature(vsp1, VSP1_HAS_BRS) on the
> > brs->entity line to keep the symmetry ... but it wouldn't be needed, as
> > it should fall through. If there isn't a BRS there must be a BRU or we
> > wouldn't be setting up a brx in the first place ;-)
> > 
> > So I think what you have is good.
> > 
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
