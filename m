Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3302CD09C
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 08:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgLCHxf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 02:53:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:42332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbgLCHxf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 02:53:35 -0500
Date:   Thu, 3 Dec 2020 08:52:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1606981974;
        bh=JSYyuk0a7i4960Uke1Sa2Fn/mmq9vwQ8+tHqZBrxEqA=;
        h=From:To:Cc:Subject:In-Reply-To:References:From;
        b=shgUCKiKc41h/kDczRIbCo0krL3LKZxNQ5jzfyLhBhgRnveaYMJCzg92q8bK9p36V
         OvN+mQqkogKiOb0LlsCfXnoxt3WQv5GTd8Q1KRw181nJpgq9H88AdqW9bE+S49parb
         B+ETYGoWNB8VanblEyR7y7Kl9jY82uUXWw4+z5cq0+OmOylmNKy8vm3XlxJTX11a1z
         /SSY46nTJvXEtFGioSN5S1pnKfbokRRm11GOSjM6PrxcWdp21bNEerRIq1EnDdk7Hw
         ANdfilyrtyc0Ldcav+CGhHfbMdES14K8ykC3sN7rHjjNd5WylSmufUBj8i5WoLcSjO
         Agm5JQrnWZzIA==
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        koji.matsuoka.xm@renesas.com,
        niklas.soderlund+renesas@ragnatech.se,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/2] media: rcar-vin: Mask access to VNCSI_IFMD
 register
Message-ID: <20201203085248.17a734d1@coco.lan>
In-Reply-To: <bca27ed8-f6bc-f44e-df2e-ff210ac599a5@xs4all.nl>
References: <20201126074757.2768-1-jacopo+renesas@jmondi.org>
        <20201203075830.2701c8b5@coco.lan>
        <de509dc4-c164-18e5-00e6-c4f4d39eeecc@xs4all.nl>
        <bca27ed8-f6bc-f44e-df2e-ff210ac599a5@xs4all.nl>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 3 Dec 2020 08:08:09 +0100
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 03/12/2020 08:06, Hans Verkuil wrote:
> > On 03/12/2020 07:58, Mauro Carvalho Chehab wrote:  
> >> Em Thu, 26 Nov 2020 08:47:55 +0100
> >> Jacopo Mondi <jacopo+renesas@jmondi.org> escreveu:
> >>  
> >>> As reported in patch 2/2 commit message the the VNCSI_IFMD register
> >>> has the following limitations according to chip manual revision 2.20
> >>>
> >>> - V3M, V3H and E3 do not support the DES1 field has they do not feature
> >>> a CSI20 receiver.
> >>> - D3 only supports parallel input, and the whole register shall always
> >>> be written as 0.
> >>>
> >>> This patch upports the BSP change commit f54697394457
> >>> ("media: rcar-vin: Fix VnCSI_IFMD register access for r8a77990") from
> >>> Koji Matsuoka  
> >>
> >> As checkpatch warned:
> >>
> >> 	-:22: WARNING: Unknown commit id 'f54697394457', maybe rebased or not pulled?
> >> 	
> >> There's no such commit upstream. Are you referring to an OOT patch?
> >>
> >> If so, you should provide an URL from where the patch is stored,
> >> as otherwise this comment won't make any sense upstream.
> >>
> >> If you can't provide such URL, please adjust the comment to provide
> >> a description that won't be dependent of such OOT commit.  
> 
> Ah, it's too early in the morning for me. I didn't read your email carefully
> enough.

Yeah, I realized that the commit is for an OOT patch ;-)

The main point is that Patch descriptions should be self-contained, bringing
everything that is needed to describe the patch on it. It is acceptable to have
URLs pointing to some external references that will be there as long as the
driver will remain at the Linux Kernel. The way the description currently is,
it doesn't fulfill such criteria.

-

Btw, I was unable to find such commit, even googling for it.

So, even now, people will find problems if they want to understand the
description. Things will become a lot worse after a couple of years.

So, such description has to be changed.

For now, I'm merging the other patches of the PR without this one.

> 
> Just ignore what I wrote.
> 
> Jacopo, can you repost with a URL? Or perhaps just drop this bit of text.
> 
> Regards,
> 
> 	Hans
> 
> > 
> > Read the commit message:
> >   
> >>> This patch upports the BSP change commit f54697394457
> >>> ("media: rcar-vin: Fix VnCSI_IFMD register access for r8a77990") from
> >>> Koji Matsuoka  
> > 
> > This commit is from the rcar BSP package, and does not refer to a kernel
> > commit. So it is correct that the commit ID is unknown.
> > 
> > Regards,
> > 
> > 	Hans
> >   
> >>  
> >>>
> >>> Tested on r-car E3 Ebisu.
> >>>
> >>> v2 -> v3:
> >>> - Remove a few comments and add Niklas' tag to [2/2]
> >>>
> >>> v1 -> v2:
> >>> - Inspect the channel routing table to deduce the availability of DES1/DES0
> >>>   bits as suggested by Niklas.
> >>>
> >>> Jacopo Mondi (2):
> >>>   media: rcar-vin: Remove unused macro
> >>>   media: rcar-vin: Mask VNCSI_IFMD register
> >>>
> >>>  drivers/media/platform/rcar-vin/rcar-dma.c | 26 ++++++++++++++++++----
> >>>  1 file changed, 22 insertions(+), 4 deletions(-)
> >>>
> >>> --
> >>> 2.29.1
> >>>  
> >>
> >>
> >>
> >> Thanks,
> >> Mauro
> >>  
> >   
> 



Thanks,
Mauro
