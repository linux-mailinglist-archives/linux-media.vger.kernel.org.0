Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53BAA4AD8CA
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 14:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343874AbiBHNPt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 08:15:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343608AbiBHMTr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 07:19:47 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416EAC03FEC0
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 04:19:46 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD9785D;
        Tue,  8 Feb 2022 13:19:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644322784;
        bh=4aW9Tbg+DbCkbxqNw3QUPSxOCuX/QePiQPTsQDOy4O4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Io2L/BYbG3rNjBGR4NkHmqSjAUuVyZTzDSOCgEC2825FyVyh9uCpV8hvrPVS4x8qb
         y/eLXNXfa4TZPHbVAy/uVoz6IySJiq8qyKNKGjDOkF57z6eKJHJKnK3hxhDChVLSHL
         4M8j47syKrvipZOkTKRRCqo3Bw8jjXvw6Y5al5i4=
Date:   Tue, 8 Feb 2022 14:19:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Eugen.Hristev@microchip.com
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] microchip-csi2dc: Remove VC support for now
Message-ID: <YgJf3peoK1fj70Mg@pendragon.ideasonboard.com>
References: <20220202153609.240387-1-sakari.ailus@linux.intel.com>
 <20220208061129.158ba126@sal.lan>
 <ed240352-0588-d963-2b0a-7b65280e96b0@microchip.com>
 <YgJOqb06gmNhFw6X@pendragon.ideasonboard.com>
 <5168daa7-2f8b-fdbe-7a15-12de3428322a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5168daa7-2f8b-fdbe-7a15-12de3428322a@microchip.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On Tue, Feb 08, 2022 at 11:36:16AM +0000, Eugen.Hristev@microchip.com wrote:
> On 2/8/22 1:06 PM, Laurent Pinchart wrote:
> > On Tue, Feb 08, 2022 at 08:00:19AM +0000, Eugen.Hristev@microchip.com wrote:
> >> On 2/8/22 7:11 AM, Mauro Carvalho Chehab wrote:
> >>> Em Wed,  2 Feb 2022 17:36:09 +0200 Sakari Ailus escreveu:
> >>>
> >>>> As part of removing mbus config flags, remove VC flag use in the
> >>>> microchip-csi2dc driver. The support can be reintroduced later on as part
> >>>> of the streams patches.
> >>>>
> >>>> Cc: Eugen Hristev <eugen.hristev@microchip.com>
> >>>
> >>> Hmm... that sounds a regression to me. What effects this will cause at
> >>> the driver?
> >>>
> >>> Eugen, any comments?
> >>
> >> Hi ,
> >>
> >> I am not happy with this change. It looks like I wasn't even CC-ed on
> >> the original patch e-mail.
> >>
> >> The effect on the driver will be that everything will be treated as
> >> virtual channel=0 .
> > 
> > I don't think there's any risk of regression, as we have no driver
> > setting any of the V4L2_MBUS_CSI2_CHANNEL_[123] flags in the kernel.
> > 
> >> I do not yet understand why we are about to remove
> >> V4L2_MBUS_CSI2_CHANNEL_* as I remember this was just introduced.
> > 
> > Those flags were added in 2011. If you think of that as "just
> > introduced" then I understand why you would be unhappy about "sudden
> > changes" mentioned below ;-)
> 
> Hello Laurent,
> 
> I am sorry, I was referring to the get_mbus_config which was recently 
> added, which in my case uses V4L2_MBUS_CSI2_CHANNEL_* .
> Without the get_mbus_config, I wasn't supposed to use the 
> V4L2_MBUS_CSI2_CHANNEL_* at all .
> Hence my confusion in adding them into the same bucket.
> 
> My driver uses these flags because my initial implementation to get the 
> VC from the devicetree was rejected and this was suggested instead.
> 
> >> Is there any alternative in place ?
> > 
> > Virtual channels have never been properly supported in V4L2. This is
> > going to change with "[PATCH v10 00/38] v4l: subdev internal routing and
> > streams" ([1]).
> > 
> > [1] https://lore.kernel.org/all/20211130141536.891878-1-tomi.valkeinen@ideasonboard.com
> 
> In that case then I suppose the support in the csi2dc driver has to be 
> rewritten

Only when you'll need to support virtual channels other than VC 0. It's
a non-negligible effort if you need to capture multiple streams from
different VCs simultaneously, but if it's only about selecting the
correct VC number for one stream, it's much easier. As far as I
understand, your hardware supports the latter, not the former, right ?

Do you have any particular CSI-2 source in mind that produces different
VCs by the way ?

> >> My opinion is that if we want to replace something existing with a new
> >> API or something else, we should first add the new support, block any
> >> new adopters for the old API such that everyone uses the new API, and
> >> only after that convert the old API clients to the new API.
> >> So 'can be reintroduced later on' is not okay. We can't remove things in
> >> the hope that it would be reintroduced later. Just my personal take on
> >> this, feel free to have a different opinion.
> > 
> > When regressions are introduced this makes sense, but here we're
> > dropping a feature that isn't used as no kernel driver selects a VC
> > different than 0.
> 
> I still disagree that these should be removed before the patch you 
> mentioned earlier about adding 'subdev internal routing and streams' is 
> applied. I see things in the way that after the new support is 
> available, old flags , even if unused, can be removed.
> You can disagree, of course.

I agree it would be nice, but the multiplexed streams series will still
need time to land (it's been out there for ages, we've resumed work on
it about a year ago, and Tomi has done a really amazing job moving this
forward). I'd like to avoid blocking the V4L2_MBUS_CSI2_CHANNEL_*
removal until multiplexed streams get merged if possible. If there was
an urgent need to support different VCs in your driver the situation
would of course be different, but if that's not foreseen until we get
proper support for multiplexed streams, I think moving forward with all
the rework in parallel is best. V4L2 has few active contributors for
core code, it's really hard modernizing the internals of the subsystem
with the resource shortage, I'd like to avoid making it even harder :-)

> Thank you for sharing your thoughts,
> Eugen
> 
> >> In the end you guys are the maintainers for the subsystem and can have
> >> this change if you like, I am more unhappy about the fact that changes
> >> happen suddenly and without notice.
> >>
> >>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>>> ---
> >>>>    .../media/platform/atmel/microchip-csi2dc.c    | 18 ++----------------
> >>>>    1 file changed, 2 insertions(+), 16 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/platform/atmel/microchip-csi2dc.c b/drivers/media/platform/atmel/microchip-csi2dc.c
> >>>> index 6bc549c28e05..6a7f5b4b0e3b 100644
> >>>> --- a/drivers/media/platform/atmel/microchip-csi2dc.c
> >>>> +++ b/drivers/media/platform/atmel/microchip-csi2dc.c
> >>>> @@ -348,24 +348,15 @@ static int csi2dc_get_mbus_config(struct csi2dc_device *csi2dc)
> >>>>         if (ret == -ENOIOCTLCMD) {
> >>>>                 dev_dbg(csi2dc->dev,
> >>>>                         "no remote mbus configuration available\n");
> >>>> -             goto csi2dc_get_mbus_config_defaults;
> >>>> +             return 0;
> >>>>         }
> >>>>
> >>>>         if (ret) {
> >>>>                 dev_err(csi2dc->dev,
> >>>>                         "failed to get remote mbus configuration\n");
> >>>> -             goto csi2dc_get_mbus_config_defaults;
> >>>> +             return 0;
> >>>>         }
> >>>>
> >>>> -     if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_0)
> >>>> -             csi2dc->vc = 0;
> >>>> -     else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_1)
> >>>> -             csi2dc->vc = 1;
> >>>> -     else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_2)
> >>>> -             csi2dc->vc = 2;
> >>>> -     else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_3)
> >>>> -             csi2dc->vc = 3;
> >>>> -
> >>>>         dev_dbg(csi2dc->dev, "subdev sending on channel %d\n", csi2dc->vc);
> >>>>
> >>>>         csi2dc->clk_gated = mbus_config.flags &
> >>>> @@ -375,11 +366,6 @@ static int csi2dc_get_mbus_config(struct csi2dc_device *csi2dc)
> >>>>                 csi2dc->clk_gated ? "gated" : "free running");
> >>>>
> >>>>         return 0;
> >>>> -
> >>>> -csi2dc_get_mbus_config_defaults:
> >>>> -     csi2dc->vc = 0; /* Virtual ID 0 by default */
> >>>> -
> >>>> -     return 0;
> >>>>    }
> >>>>
> >>>>    static void csi2dc_vp_update(struct csi2dc_device *csi2dc)

-- 
Regards,

Laurent Pinchart
