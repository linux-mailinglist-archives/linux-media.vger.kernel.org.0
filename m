Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3820C4AD735
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 12:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357035AbiBHLcL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 06:32:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343703AbiBHLGY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 06:06:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93546C03FEC0
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 03:06:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16340480;
        Tue,  8 Feb 2022 12:06:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644318380;
        bh=tVltLbLvV+H4cPYk/imX2KU/5Y/oBRtCQkjBbjByqsQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GrwrjVKP6Cnr6ltZjY7i8V+FeWvqbuwavh5BfjLF05MYy8slP8Gn0wEUVUZFEMe9f
         gNeliBiXotilcjBwHg+KD8boDTXNqGc8kPHGQqoJcGE8X5x22QMXi6y/aTs3VgcXJa
         4N3nj54y/cIfkzkYsHfqtjAmu+CarrnK6QPHAhuY=
Date:   Tue, 8 Feb 2022 13:06:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Eugen.Hristev@microchip.com
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] microchip-csi2dc: Remove VC support for now
Message-ID: <YgJOqb06gmNhFw6X@pendragon.ideasonboard.com>
References: <20220202153609.240387-1-sakari.ailus@linux.intel.com>
 <20220208061129.158ba126@sal.lan>
 <ed240352-0588-d963-2b0a-7b65280e96b0@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ed240352-0588-d963-2b0a-7b65280e96b0@microchip.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On Tue, Feb 08, 2022 at 08:00:19AM +0000, Eugen.Hristev@microchip.com wrote:
> On 2/8/22 7:11 AM, Mauro Carvalho Chehab wrote:
> > Em Wed,  2 Feb 2022 17:36:09 +0200 Sakari Ailus escreveu:
> > 
> >> As part of removing mbus config flags, remove VC flag use in the
> >> microchip-csi2dc driver. The support can be reintroduced later on as part
> >> of the streams patches.
> >>
> >> Cc: Eugen Hristev <eugen.hristev@microchip.com>
> > 
> > Hmm... that sounds a regression to me. What effects this will cause at
> > the driver?
> > 
> > Eugen, any comments?
> 
> Hi ,
> 
> I am not happy with this change. It looks like I wasn't even CC-ed on 
> the original patch e-mail.
> 
> The effect on the driver will be that everything will be treated as 
> virtual channel=0 .

I don't think there's any risk of regression, as we have no driver
setting any of the V4L2_MBUS_CSI2_CHANNEL_[123] flags in the kernel.

> I do not yet understand why we are about to remove 
> V4L2_MBUS_CSI2_CHANNEL_* as I remember this was just introduced.

Those flags were added in 2011. If you think of that as "just
introduced" then I understand why you would be unhappy about "sudden
changes" mentioned below ;-)

> Is there any alternative in place ?

Virtual channels have never been properly supported in V4L2. This is
going to change with "[PATCH v10 00/38] v4l: subdev internal routing and
streams" ([1]).

[1] https://lore.kernel.org/all/20211130141536.891878-1-tomi.valkeinen@ideasonboard.com

> My opinion is that if we want to replace something existing with a new 
> API or something else, we should first add the new support, block any 
> new adopters for the old API such that everyone uses the new API, and 
> only after that convert the old API clients to the new API.
> So 'can be reintroduced later on' is not okay. We can't remove things in 
> the hope that it would be reintroduced later. Just my personal take on 
> this, feel free to have a different opinion.

When regressions are introduced this makes sense, but here we're
dropping a feature that isn't used as no kernel driver selects a VC
different than 0.

> In the end you guys are the maintainers for the subsystem and can have 
> this change if you like, I am more unhappy about the fact that changes 
> happen suddenly and without notice.
> 
> >> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >> ---
> >>   .../media/platform/atmel/microchip-csi2dc.c    | 18 ++----------------
> >>   1 file changed, 2 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/atmel/microchip-csi2dc.c b/drivers/media/platform/atmel/microchip-csi2dc.c
> >> index 6bc549c28e05..6a7f5b4b0e3b 100644
> >> --- a/drivers/media/platform/atmel/microchip-csi2dc.c
> >> +++ b/drivers/media/platform/atmel/microchip-csi2dc.c
> >> @@ -348,24 +348,15 @@ static int csi2dc_get_mbus_config(struct csi2dc_device *csi2dc)
> >>        if (ret == -ENOIOCTLCMD) {
> >>                dev_dbg(csi2dc->dev,
> >>                        "no remote mbus configuration available\n");
> >> -             goto csi2dc_get_mbus_config_defaults;
> >> +             return 0;
> >>        }
> >>
> >>        if (ret) {
> >>                dev_err(csi2dc->dev,
> >>                        "failed to get remote mbus configuration\n");
> >> -             goto csi2dc_get_mbus_config_defaults;
> >> +             return 0;
> >>        }
> >>
> >> -     if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_0)
> >> -             csi2dc->vc = 0;
> >> -     else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_1)
> >> -             csi2dc->vc = 1;
> >> -     else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_2)
> >> -             csi2dc->vc = 2;
> >> -     else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_3)
> >> -             csi2dc->vc = 3;
> >> -
> >>        dev_dbg(csi2dc->dev, "subdev sending on channel %d\n", csi2dc->vc);
> >>
> >>        csi2dc->clk_gated = mbus_config.flags &
> >> @@ -375,11 +366,6 @@ static int csi2dc_get_mbus_config(struct csi2dc_device *csi2dc)
> >>                csi2dc->clk_gated ? "gated" : "free running");
> >>
> >>        return 0;
> >> -
> >> -csi2dc_get_mbus_config_defaults:
> >> -     csi2dc->vc = 0; /* Virtual ID 0 by default */
> >> -
> >> -     return 0;
> >>   }
> >>
> >>   static void csi2dc_vp_update(struct csi2dc_device *csi2dc)

-- 
Regards,

Laurent Pinchart
