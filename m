Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C5733CA85
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 02:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233173AbhCPBCj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 21:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232854AbhCPBCf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 21:02:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35D2C06174A;
        Mon, 15 Mar 2021 18:02:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C38E3E7;
        Tue, 16 Mar 2021 02:02:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615856550;
        bh=CrLVb9xQ0lmni1InzJKHFcnQtZiczJWx4UWyxiY9eeI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Phc07QlObq06SmRWGl5GEcXHP5KqKZySRKb7AXbsviTtUoCZlPLiJK8h3xx5/XptN
         WBKVa/roW7OfUBjCuZnjMo1rycH+Sj2Rds5ZN4JiMUWkhFikfXA2J7bXMi7d6LbDRi
         RSzHP8dlQSvgF1fkEpSMUHEzMXEgU1sY9DlqI9MY=
Date:   Tue, 16 Mar 2021 03:01:53 +0200
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
Message-ID: <YFADgSdVqjJt2bOl@pendragon.ideasonboard.com>
References: <20210301120828.6945-1-biju.das.jz@bp.renesas.com>
 <20210301120828.6945-3-biju.das.jz@bp.renesas.com>
 <133f8b63-3b84-c60a-725d-30b8d6df35dd@ideasonboard.com>
 <OS0PR01MB5922BE9F9D151623773CF53286919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <56c2d53e-8d1f-5b84-1480-5965ae9cbae2@ideasonboard.com>
 <OS0PR01MB5922ABCA7A782950B63DCA6686919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YE7XwWVZeOZ+HsYx@pendragon.ideasonboard.com>
 <OS0PR01MB59224694123B5D55F742C2CF866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59224694123B5D55F742C2CF866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Mon, Mar 15, 2021 at 08:21:38AM +0000, Biju Das wrote:
> On 15 March 2021 03:43, Laurent Pinchart wrote:
> > On Wed, Mar 10, 2021 at 02:50:23PM +0000, Biju Das wrote:
> >>> On 10/03/2021 13:56, Biju Das wrote:
> >>>> Thanks for the feedback.
> >>>>> Subject: Re: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer
> >>>>> access
> >>>>>
> >>>>> Hi Biju,
> >>>>>
> >>>>> On 01/03/2021 12:08, Biju Das wrote:
> >>>>>> RZ/G2L SoC has no UIF. This patch fixes null pointer access,
> >>>>>> when UIF module is not used.
> >>>>>>
> >>>>>> Fixes: 5e824f989e6e8("media: v4l: vsp1: Integrate DISCOM in
> >>>>>> display pipeline")
> >>>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >>>>>> ---
> >>>>>>  drivers/media/platform/vsp1/vsp1_drm.c | 4 ++--
> >>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/media/platform/vsp1/vsp1_drm.c
> >>>>>> b/drivers/media/platform/vsp1/vsp1_drm.c
> >>>>>> index f6d2f47a4058..06f74d410973 100644
> >>>>>> --- a/drivers/media/platform/vsp1/vsp1_drm.c
> >>>>>> +++ b/drivers/media/platform/vsp1/vsp1_drm.c
> >>>>>> @@ -462,9 +462,9 @@ static int
> >>>>>> vsp1_du_pipeline_setup_inputs(struct
> >>>>>> vsp1_device *vsp1,
> >>>>>
> >>>>>
> >>>>> This looks like it complicates these conditionals more than we
> >>>>> perhaps need to.
> >>>>>
> >>>>> What do you think about adding something above the block comment here?:
> >>>>
> >>>> It is much better.
> >>>>
> >>>> This patch is accepted in media tree[1]. So not sure, should I
> >>>> send a follow up patch as optimization or drop this patch and send new one.
> >>>
> >>> Oh, I didn't realise these were in already. Sorry, I didn't see any
> >>> review on the list, and it was the earliest I had got to them.
> >>>
> >>>> Please suggest.
> >>>
> >>> Up to you, I don't think this would get dropped now it's integrated.
> >>> It's in, so if you want to update on top I believe that's fine.
> >>
> >> OK, Will send follow up patch as optimization.
> > 
> > That would be nice.
> > 
> > I don't think this patch should have been fast-tracked as a fix, as RZ/G2L
> > isn't supported in mainline yet as far as I can tell.
> 
> Please correct me, if I am wrong. We have pluggable modules in VSP and with routing
> Register we can achieve any combination with the VSP driver we have. 
> 
> If it is the case, it is a bug which is fast-tracked as a fix.
> Otherwise(ie, driver doesn't have flexibility to support pluggable
> feature) I am agreeing with your statement.

My point was that this code is currently used only on platforms that
have a UIF, so there's should be no risk of this problem being
triggered. It should certainly be fixed to support RZ/G2L, but that's
not upstream yet.

> > Hans, next time, could we get a notification instead of a silent
> > merge ?
> > 
> >>>>> 	if (!drm_pipe->uif)
> >>>>> 		return 0;
> >>>>>
> >>>>>>  	 * make sure it is present in the pipeline's list of entities if it
> >>>>>>  	 * wasn't already.
> >>>>>>  	 */
> >>>>>> -	if (!use_uif) {
> >>>>>> +	if (drm_pipe->uif && !use_uif) {
> >>>>>>  		drm_pipe->uif->pipe = NULL;
> >>>>>> -	} else if (!drm_pipe->uif->pipe) {
> >>>>>> +	} else if (drm_pipe->uif && !drm_pipe->uif->pipe) {
> >>>>>> 		drm_pipe->uif->pipe = pipe;
> >>>>>>  		list_add_tail(&drm_pipe->uif->list_pipe, &pipe->entities);
> >>>>>>  	}

-- 
Regards,

Laurent Pinchart
