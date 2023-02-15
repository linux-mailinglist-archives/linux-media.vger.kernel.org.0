Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40561697966
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 11:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbjBOKAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 05:00:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234032AbjBOKAh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 05:00:37 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71DBE34C33;
        Wed, 15 Feb 2023 02:00:31 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9505127C;
        Wed, 15 Feb 2023 11:00:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676455228;
        bh=89Y6oAav16plO04q43b1Sjx6xdkCz4cT7RMAskEPqDA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FbpoQ92ZLzkdpx5F9l/2xspll2u8ZPa0aVFPiEim6DdrXajiJEPW2T+8eD4ecPzGS
         KMOEDVQm4C8qpg0/NY0OOumdI4Rnw6S6qA/Luz5YA52RmqBi6RSh6x0j4XTbsXClm8
         FGrm7IF4Vq/e4kPT4GEfXJi9aZd7b6AGkpBKffI8=
Date:   Wed, 15 Feb 2023 12:00:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] media: renesas: vsp1: Add underrun debug print
Message-ID: <Y+ytPMZyjTELkiw2@pendragon.ideasonboard.com>
References: <20230214164223.184920-1-tomi.valkeinen+renesas@ideasonboard.com>
 <Y+wH59GVBf1J5u8X@pendragon.ideasonboard.com>
 <48dfcbb3-a281-b05e-f665-df76bee7e9f3@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <48dfcbb3-a281-b05e-f665-df76bee7e9f3@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Wed, Feb 15, 2023 at 08:52:02AM +0200, Tomi Valkeinen wrote:
> On 15/02/2023 00:15, Laurent Pinchart wrote:
> > On Tue, Feb 14, 2023 at 06:42:23PM +0200, Tomi Valkeinen wrote:
> >> Print underrun interrupts with ratelimited print.
> >>
> >> Note that we don't enable the underrun interrupt. If we have underruns,
> >> we don't want to get flooded with interrupts about them. It's enough to
> >> see that an underrun happened at the end of a frame.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>
> >> Changes in v3:
> >> - Reset underrun counter when enabling VSP
> >>
> >> I have to say I'm not familiar enough with the VSP driver to say if
> >> these are the correct places where to reset the counters.
> > 
> > It's fine. We could factor it out to a clear function, but it's not
> > worth it if there's nothing else to factor out. It could be done later.
> > 
> >> There's also a
> >> possibility of a race, but my assumption is that we cannot get underrun
> >> interrupts for the WPF we are currently enabling.
> > 
> > It should be fine.
> > 
> >> Also, I realized the underrun counter could be moved to struct
> >> vsp1_rwpf, but as that's used also for RPF, I didn't do that change.
> > 
> > Another option would be to store it in the pipeline structure, as a
> > pipeline has one and only one WPF. What do you think ?
> 
> Hmm, the pipe is allocated and assigned as needed, isn't it? So in the 
> irq handler we might get an underflow with !pipe. We could skip the 
> print in that case, of course.

For display pipelines, the pipeline is embedded in the vsp1_drm_pipeline
structure, itself embedded in the vsp1_drm structure, so it won't come
and go. The WPF's pipe pointer (in the vsp1_entity structure) is set in
vsp1_drm_init() and never reset.

For memory-to-memory pipelines, yes, the pipeline is allocated
dynamically.

Interrupts are not supposed to occur when the pipeline is stopped, but
of course there's real life and race conditions. Underrun notifications
are likely useless in that case so we could indeed skip them.

> Is a pipe allocated every time VSP is started? Or does the allocation 
> normally happen only once? If the former, then if the counter was stored 
> in the pipe, that would handle clearing the counter automatically.

For memory-to-memory pipelines, the allocation happens when the user
calls VIDIOC_STREAMON the first time on any video node in the pipeline
(a pipeline has one or more RPFs and exactly one WPF), and the pipeline
is freed when the last video node is stopped with VIDIOC_STREAMOFF. It
is thus possible to stop and restart the pipeline without the
vsp1_pipeline structure being freed, but in that case, I'd say we don't
have to actually reset the counter. If the user keeps some video nodes
streaming, I think it's acceptable to keep the underrun counter going.

For display pipelines, you'll have to reset the counter manually in
vsp1_du_setup_lif(). It could be done at stop time instead of start time
if desired.

-- 
Regards,

Laurent Pinchart
