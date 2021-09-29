Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6136D41C898
	for <lists+linux-media@lfdr.de>; Wed, 29 Sep 2021 17:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345316AbhI2PlB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Sep 2021 11:41:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37964 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345157AbhI2Pk7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Sep 2021 11:40:59 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90A0A3F0;
        Wed, 29 Sep 2021 17:39:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632929957;
        bh=2lNrb23VLkdVZmTezRahZahyxxX2RHd5arAsxL6k66U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wRVobzU79SZGZ7VYd8saL9+wAxioEYVU40H4AkGcH/4XFU00vRyG4d4mVPu4/Gz2H
         Da3MznREoYHrsS+bCduRUQVG4Y183KDT++vvGXc0e7YNNNrFbzl9ORh+CziPqBEhzt
         oNEEsA6v+nlSWUFzSQ1jtEGTYHjI1utWfHBSArYU=
Date:   Wed, 29 Sep 2021 18:39:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [PATCH v8 06/36] media: subdev: Add
 v4l2_subdev_validate(_and_lock)_state()
Message-ID: <YVSIo6PnqLwer6tH@pendragon.ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-7-tomi.valkeinen@ideasonboard.com>
 <YVEiM5MHXvWK9dr/@pendragon.ideasonboard.com>
 <fdb7faf3-337c-28aa-081d-75d317c418d5@ideasonboard.com>
 <YVLJ1cWBhK8CRJoB@pendragon.ideasonboard.com>
 <926cd05b-3f1a-e964-a939-b2be5ec492c7@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <926cd05b-3f1a-e964-a939-b2be5ec492c7@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Wed, Sep 29, 2021 at 06:35:30PM +0300, Tomi Valkeinen wrote:
> On 28/09/2021 10:52, Laurent Pinchart wrote:
> > On Tue, Sep 28, 2021 at 08:02:18AM +0300, Tomi Valkeinen wrote:
> >> On 27/09/2021 04:45, Laurent Pinchart wrote:
> >>> On Mon, Aug 30, 2021 at 02:00:46PM +0300, Tomi Valkeinen wrote:
> >>>> All suitable subdev ops are now passed either the TRY or the ACTIVE
> >>>> state by the v4l2 core. However, other subdrivers can still call the ops
> >>>> passing NULL as the state, implying the active case.
> >>>>
> >>>> Thus all subdev drivers supporting active state need to handle the NULL
> >>>> state case.
> >>>
> >>> Do they ? Can't we mandate that the callers pass the correct state ? Do
> >>> you think that would make the transition too difficult ?
> >>
> >> That would limit the use of the new drivers. E.g. the sensor driver I'm
> >> using works fine with CAL & co. without handling the NULL, but then the
> >> sensor driver couldn't be used with "old" drivers.
> > 
> > I'm tempted to say that would be a good thing as it would accelerate the
> > transition :-)
> 
> I tested this, and as expected the drivers I'm using work fine without 
> the "validate" version. From that perspective I'm fine with dropping the 
> whole "validate" concept, and just require state to be valid for the new 
> multiplexed-streams-enabled drivers.
> 
> But the thing is, all the drivers I use are new, and not used in other 
> hardware platforms or configurations. However, if someone ports an 
> existing driver to multiplexed streams, either he has to be sure no 
> other setup is using that driver, or add some kind of "validate" system.
> 
> Maybe that's still ok. I don't expect people to be rushing to port the 
> drivers to multiplexed streams =).
> 
> So if there are no complaints, I'll drop the validate functions. And we 
> can always add them back later for the few drivers that need them, if 
> the plan goes bad...

I tend to try and push for faster transitions, so I like this, but I
also understand your concern. For new drivers at least, I think we
shouldn't use the validate version. For existing drivers moved to the
new API, it may be more difficult to enforce that. I'd like to hear what
Hans and Sakari think about it, and I'll go with the majority.

Can you at least document the validate function as being temporary, and
not to be used for new drivers ?

-- 
Regards,

Laurent Pinchart
