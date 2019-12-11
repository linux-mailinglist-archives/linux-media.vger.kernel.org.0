Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68C3911C0B6
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 00:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbfLKXpT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 18:45:19 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:36206 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbfLKXpT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 18:45:19 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09D7952B;
        Thu, 12 Dec 2019 00:45:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576107916;
        bh=P93LXhTI7w82V4rqOf18SS+Icg9fH8wR/ayMlpnAov0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VKal7s0bm2k1PiAff2jDz4ojkM2f1rjU0MAq2qVj4OD8j1WSLsafWLSSvjUz4KHob
         FbvMIcINz3g8Tgux+o4ljxNKszi/owv94LohGM+HslS0VQdWRijYUmJyC5QLLJady0
         P/p4FGriDZKj8vJ1okrC7riNuleP5HKlDljxRrTA=
Date:   Thu, 12 Dec 2019 01:45:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        koji.matsuoka.xm@renesas.com, takeshi.kihara.df@renesas.com,
        harunobu.kurokawa.dn@renesas.com, khiem.nguyen.xt@renesas.com,
        hien.dang.eb@renesas.com
Subject: Re: [PATCH] media: vsp1: tidyup VI6_HGT_LBn_H() macro
Message-ID: <20191211234507.GC26146@pendragon.ideasonboard.com>
References: <redmine.issue-245033.20191211005426@dm.renesas.com>
 <redmine.issue-245033.20191211005426.161918957b73008d@dm.renesas.com>
 <87k173bp76.wl-kuninori.morimoto.gx@renesas.com>
 <fb1648d4-3949-01c1-7d13-679b9b8540dd@ideasonboard.com>
 <20191211175811.GC4863@pendragon.ideasonboard.com>
 <b8891c8c-fefe-5728-f792-a56da08bd7aa@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b8891c8c-fefe-5728-f792-a56da08bd7aa@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Dec 11, 2019 at 09:58:11PM +0000, Kieran Bingham wrote:
> Hi Laurent,
> 
> +Greg, +Sasha to opine on the merit of whether this should go to stable
> trees (for my future learning and understanding more so than this
> specific case)

Good idea, I can learn too :-)

> On 11/12/2019 17:58, Laurent Pinchart wrote:
> > On Wed, Dec 11, 2019 at 12:59:57PM +0000, Kieran Bingham wrote:
> >> Hi Morimoto-san,
> >>
> >> Thank you for the patch,
> > 
> > Likewise :-)
> > 
> >> On 11/12/2019 01:55, Kuninori Morimoto wrote:
> >>>
> >>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >>>
> >>> The address of VSP2_VI6_HGT_LBx_H are
> >>> 	VSP2_VI6_HGT_LB0_H : 0x3428
> >>> 	VSP2_VI6_HGT_LB1_H : 0x3430
> >>> 	VSP2_VI6_HGT_LB2_H : 0x3438
> >>> 	VSP2_VI6_HGT_LB3_H : 0x3440
> >>>
> >>> Thus, VI6_HGT_LBn_H() macro should start from 0x3420 instead of 0x3430.
> >>> This patch fixup it.
> 
> s/fixup/fixes/
> 
> >> I think this deserves a fixes tag:
> >>
> >> Fixes: 26e0ca22c3b8 ("[media] v4l: Renesas R-Car VSP1 driver")
> > 
> > Given that this macro is not used, we could argue that it doesn't fix
> > anything yet :-) I'd rather avoid having this backported to stable
> > kernels as it's not useful to have it there, and thus not add a Fixes
> 
> I'm sorry - I'm not sure I can agree here, Do you know that no one will
> use this macro when they back port the HGT functionality to an LTSI kernel?

Before backporting it, it would have to be implemented :-) HGT support
is in mainline, but not support for the HGT LB (Letter Box) isn't.
There's no plan I'm aware of to implement this feature at the moment. I
assume that, if and when that feature will be implemented and
backported, this patch could be backported as well.

> We know the Renesas BSP uses LTSI kernels, and the very nature of the
> fact that this typo has been spotted by the Renesas BSP team suggests
> that they are indeed looking at/using this functionality ...
> 
> (Ok, so maybe they will thus apply the fix themselves, but that's not my
> point, and if they 'have' to apply the fix - it should be in stable?)
> 
> It feels a bit presumptuous to state that we shouldn't fix this because
> /we/ don't utilise it yet, when this issue is in mainline regardless ...
> 
> > tag. Kieran, would that be OK with you ?
> 
> I would suspect that the work Sasha does would potentially pick this up
> anyway; automatically even without the tag?
>  (Especially with the keyword fixup/fixes in the commit message)
> 
> If I've misunderstood the purpose of the stable trees here, then please
> let me know.
> 
> Maybe it's more pragmatic to only fix features that are used, but it
> seems to me like a bug is a bug ... and if it's there, it should be fixed?
> 
> And I don't think that this is a particularly high 'expense' to the
> stable trees?
> 
> >>> Reported-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> >>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >>
> >> Otherwise,
> >>
> >> Yes I can clearly see that this offset is marked as H'3428 at page 32-39
> >> within the Gen3 datasheet.
> >>
> >> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > and taken in my branch.
> > 
> >>> ---
> >>>  drivers/media/platform/vsp1/vsp1_regs.h | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/vsp1/vsp1_regs.h
> >>> index 5c67ff9..fe3130d 100644
> >>> --- a/drivers/media/platform/vsp1/vsp1_regs.h
> >>> +++ b/drivers/media/platform/vsp1/vsp1_regs.h
> >>> @@ -706,7 +706,7 @@
> >>>  #define VI6_HGT_HUE_AREA_LOWER_SHIFT	16
> >>>  #define VI6_HGT_HUE_AREA_UPPER_SHIFT	0
> >>>  #define VI6_HGT_LB_TH			0x3424
> >>> -#define VI6_HGT_LBn_H(n)		(0x3438 + (n) * 8)
> >>> +#define VI6_HGT_LBn_H(n)		(0x3428 + (n) * 8)
> >>>  #define VI6_HGT_LBn_V(n)		(0x342c + (n) * 8)
> >>>  #define VI6_HGT_HISTO(m, n)		(0x3450 + (m) * 128 + (n) * 4)
> >>>  #define VI6_HGT_MAXMIN			0x3750

-- 
Regards,

Laurent Pinchart
