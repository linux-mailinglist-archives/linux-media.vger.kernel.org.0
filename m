Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2023233AA16
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 04:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbhCODny (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Mar 2021 23:43:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57498 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbhCODne (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Mar 2021 23:43:34 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08E5A87A;
        Mon, 15 Mar 2021 04:43:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615779813;
        bh=Kv0wm175lBRmvYy/K2BamRY2CtnJRMUdGtqFjnH07r8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fIGH1wxZnaVkEDIo/TpRUBo+FaPBTUwffdPFRYbCBUwVoQXzcUGRrpkuaWU+c3Qqx
         X19Bx4lPMBzeq5AjaJsmzylBgHHarTiTswSNgzpJt5idKBjlazlkik2LdYCxIrZ38t
         zQ0zpRc9KE1x00EBqx+lUz8JFCuH4RTo+WSjE8t4=
Date:   Mon, 15 Mar 2021 05:42:57 +0200
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
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer access
Message-ID: <YE7XwWVZeOZ+HsYx@pendragon.ideasonboard.com>
References: <20210301120828.6945-1-biju.das.jz@bp.renesas.com>
 <20210301120828.6945-3-biju.das.jz@bp.renesas.com>
 <133f8b63-3b84-c60a-725d-30b8d6df35dd@ideasonboard.com>
 <OS0PR01MB5922BE9F9D151623773CF53286919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <56c2d53e-8d1f-5b84-1480-5965ae9cbae2@ideasonboard.com>
 <OS0PR01MB5922ABCA7A782950B63DCA6686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922ABCA7A782950B63DCA6686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Wed, Mar 10, 2021 at 02:50:23PM +0000, Biju Das wrote:
> > On 10/03/2021 13:56, Biju Das wrote:
> > > Thanks for the feedback.
> > >> Subject: Re: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer
> > >> access
> > >>
> > >> Hi Biju,
> > >>
> > >> On 01/03/2021 12:08, Biju Das wrote:
> > >>> RZ/G2L SoC has no UIF. This patch fixes null pointer access, when
> > >>> UIF module is not used.
> > >>>
> > >>> Fixes: 5e824f989e6e8("media: v4l: vsp1: Integrate DISCOM in display
> > >>> pipeline")
> > >>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >>> ---
> > >>>  drivers/media/platform/vsp1/vsp1_drm.c | 4 ++--
> > >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/drivers/media/platform/vsp1/vsp1_drm.c
> > >>> b/drivers/media/platform/vsp1/vsp1_drm.c
> > >>> index f6d2f47a4058..06f74d410973 100644
> > >>> --- a/drivers/media/platform/vsp1/vsp1_drm.c
> > >>> +++ b/drivers/media/platform/vsp1/vsp1_drm.c
> > >>> @@ -462,9 +462,9 @@ static int vsp1_du_pipeline_setup_inputs(struct
> > >>> vsp1_device *vsp1,
> > >>
> > >>
> > >> This looks like it complicates these conditionals more than we
> > >> perhaps need to.
> > >>
> > >> What do you think about adding something above the block comment here?:
> > >
> > > It is much better.
> > >
> > > This patch is accepted in media tree[1]. So not sure, should I send a
> > > follow up patch as optimization or drop this patch and send new one.
> > 
> > Oh, I didn't realise these were in already. Sorry, I didn't see any review
> > on the list, and it was the earliest I had got to them.
> > 
> > > Please suggest.
> > 
> > Up to you, I don't think this would get dropped now it's integrated.
> > It's in, so if you want to update on top I believe that's fine.
> 
> OK, Will send follow up patch as optimization.

That would be nice.

I don't think this patch should have been fast-tracked as a fix, as
RZ/G2L isn't supported in mainline yet as far as I can tell.

Hans, next time, could we get a notification instead of a silent merge ?

> > >> 	if (!drm_pipe->uif)
> > >> 		return 0;
> > >>
> > >>
> > >>>  	 * make sure it is present in the pipeline's list of entities if it
> > >>>  	 * wasn't already.
> > >>>  	 */
> > >>> -	if (!use_uif) {
> > >>> +	if (drm_pipe->uif && !use_uif) {
> > >>>  		drm_pipe->uif->pipe = NULL;
> > >>> -	} else if (!drm_pipe->uif->pipe) {
> > >>> +	} else if (drm_pipe->uif && !drm_pipe->uif->pipe) {>
> > >> 	drm_pipe->uif->pipe = pipe;
> > >>>  		list_add_tail(&drm_pipe->uif->list_pipe, &pipe->entities);
> > >>>  	}
> > >>>

-- 
Regards,

Laurent Pinchart
