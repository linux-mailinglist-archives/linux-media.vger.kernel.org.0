Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C35411C671
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 08:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbfLLHdL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 02:33:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:57830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728072AbfLLHdK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 02:33:10 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5FBB524656;
        Thu, 12 Dec 2019 07:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576135989;
        bh=p12HIynD9FdwHF+0wBqafDSonAXyb1SgrBSwbjgba2k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WeeJAVaKEcQ79OCKF1uE2gMatc9ftJQESVzr7N51pSimXsoOUrl+5gATZmvX59JKi
         e14oruK9gl4gVqy/j2zvltEVVeU/XBJbTzg5wOGRtmQMAUbSymS0KQNYmcFDydfEAm
         TbL+eYw0/M27oW6kYE5GQ0TenwSb9MxC6751v7UE=
Date:   Thu, 12 Dec 2019 08:33:06 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sasha Levin <sashal@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        koji.matsuoka.xm@renesas.com, takeshi.kihara.df@renesas.com,
        harunobu.kurokawa.dn@renesas.com, khiem.nguyen.xt@renesas.com,
        hien.dang.eb@renesas.com
Subject: Re: [PATCH] media: vsp1: tidyup VI6_HGT_LBn_H() macro
Message-ID: <20191212073306.GB1364286@kroah.com>
References: <redmine.issue-245033.20191211005426@dm.renesas.com>
 <redmine.issue-245033.20191211005426.161918957b73008d@dm.renesas.com>
 <87k173bp76.wl-kuninori.morimoto.gx@renesas.com>
 <fb1648d4-3949-01c1-7d13-679b9b8540dd@ideasonboard.com>
 <20191211175811.GC4863@pendragon.ideasonboard.com>
 <b8891c8c-fefe-5728-f792-a56da08bd7aa@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8891c8c-fefe-5728-f792-a56da08bd7aa@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 11, 2019 at 09:58:11PM +0000, Kieran Bingham wrote:
> Hi Laurent,
> 
> +Greg, +Sasha to opine on the merit of whether this should go to stable
> trees (for my future learning and understanding more so than this
> specific case)
> 
> On 11/12/2019 17:58, Laurent Pinchart wrote:
> > Hello,
> > 
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
> 
> We know the Renesas BSP uses LTSI kernels, and the very nature of the
> fact that this typo has been spotted by the Renesas BSP team suggests
> that they are indeed looking at/using this functionality ...
> 
> (Ok, so maybe they will thus apply the fix themselves, but that's not my
> point, and if they 'have' to apply the fix - it should be in stable?)
> 
> It feels a bit presumptuous to state that we shouldn't fix this because
> /we/ don't utilise it yet, when this issue is in mainline regardless ...

Nothing should be in the kernel tree that is not already used by
something in that specific kernel tree.  We don't care about out-of-tree
code, and especially for stable kernel patches, it does not matter in
the least.

If you have out-of-tree code, you are on your own here, sorry.

So no, no backporting of stuff that no one actually uses in the codebase
itself.

thanks,

greg k-h
