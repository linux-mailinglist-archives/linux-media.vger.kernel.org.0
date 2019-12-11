Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2C7111BACF
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 18:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730593AbfLKR6W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 12:58:22 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:49996 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729228AbfLKR6W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 12:58:22 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D3C652B;
        Wed, 11 Dec 2019 18:58:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576087100;
        bh=w6hxSAYFaBlRN3FRpDpJY4p+b3nFU7gY3PN6ltgvz4A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PN1FKI5TiIvv/X9HxZ/rCbJCusFSWiVoQIcMyyXWTVexwWOwVxfDlWQCzeLB4qCHb
         nn2dooqa/8nUaEBg4/IaipTr3wbrv7KrEhG9WnY9qwsCkyre3wBrrVrluClI4rrjdH
         7Yz30r0KvyXtytM+1XkAq51B7Whdw6sXikWXlxSE=
Date:   Wed, 11 Dec 2019 19:58:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        koji.matsuoka.xm@renesas.com, takeshi.kihara.df@renesas.com,
        harunobu.kurokawa.dn@renesas.com, khiem.nguyen.xt@renesas.com,
        hien.dang.eb@renesas.com
Subject: Re: [PATCH] media: vsp1: tidyup VI6_HGT_LBn_H() macro
Message-ID: <20191211175811.GC4863@pendragon.ideasonboard.com>
References: <redmine.issue-245033.20191211005426@dm.renesas.com>
 <redmine.issue-245033.20191211005426.161918957b73008d@dm.renesas.com>
 <87k173bp76.wl-kuninori.morimoto.gx@renesas.com>
 <fb1648d4-3949-01c1-7d13-679b9b8540dd@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fb1648d4-3949-01c1-7d13-679b9b8540dd@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Wed, Dec 11, 2019 at 12:59:57PM +0000, Kieran Bingham wrote:
> Hi Morimoto-san,
> 
> Thank you for the patch,

Likewise :-)

> On 11/12/2019 01:55, Kuninori Morimoto wrote:
> > 
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > 
> > The address of VSP2_VI6_HGT_LBx_H are
> > 	VSP2_VI6_HGT_LB0_H : 0x3428
> > 	VSP2_VI6_HGT_LB1_H : 0x3430
> > 	VSP2_VI6_HGT_LB2_H : 0x3438
> > 	VSP2_VI6_HGT_LB3_H : 0x3440
> > 
> > Thus, VI6_HGT_LBn_H() macro should start from 0x3420 instead of 0x3430.
> > This patch fixup it.
> 
> I think this deserves a fixes tag:
> 
> Fixes: 26e0ca22c3b8 ("[media] v4l: Renesas R-Car VSP1 driver")

Given that this macro is not used, we could argue that it doesn't fix
anything yet :-) I'd rather avoid having this backported to stable
kernels as it's not useful to have it there, and thus not add a Fixes
tag. Kieran, would that be OK with you ?

> > Reported-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Otherwise,
> 
> Yes I can clearly see that this offset is marked as H'3428 at page 32-39
> within the Gen3 datasheet.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my branch.

> > ---
> >  drivers/media/platform/vsp1/vsp1_regs.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/vsp1/vsp1_regs.h
> > index 5c67ff9..fe3130d 100644
> > --- a/drivers/media/platform/vsp1/vsp1_regs.h
> > +++ b/drivers/media/platform/vsp1/vsp1_regs.h
> > @@ -706,7 +706,7 @@
> >  #define VI6_HGT_HUE_AREA_LOWER_SHIFT	16
> >  #define VI6_HGT_HUE_AREA_UPPER_SHIFT	0
> >  #define VI6_HGT_LB_TH			0x3424
> > -#define VI6_HGT_LBn_H(n)		(0x3438 + (n) * 8)
> > +#define VI6_HGT_LBn_H(n)		(0x3428 + (n) * 8)
> >  #define VI6_HGT_LBn_V(n)		(0x342c + (n) * 8)
> >  #define VI6_HGT_HISTO(m, n)		(0x3450 + (m) * 128 + (n) * 4)
> >  #define VI6_HGT_MAXMIN			0x3750

-- 
Regards,

Laurent Pinchart
