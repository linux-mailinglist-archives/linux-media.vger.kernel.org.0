Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84EC6543787
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 17:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244238AbiFHPeq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 11:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244057AbiFHPeh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 11:34:37 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B204C793
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 08:34:21 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 364F9100009;
        Wed,  8 Jun 2022 15:34:17 +0000 (UTC)
Date:   Wed, 8 Jun 2022 17:34:16 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        dafna@fastmail.com, heiko@sntech.de, foss+kernel@0leil.net
Subject: Re: [PATCH] media: rkisp1: Don't create data links for non-sensor
 subdevs
Message-ID: <20220608153416.ciwiwg4tbfyetprh@uno.localdomain>
References: <20220606225149.2941160-1-djrscally@gmail.com>
 <20220607164125.oabtqz6kh5bo6k6v@uno.localdomain>
 <c328e7e6-8d22-2480-38f0-f05528c548dc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c328e7e6-8d22-2480-38f0-f05528c548dc@gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Wed, Jun 08, 2022 at 03:25:36PM +0100, Daniel Scally wrote:
> Hi Jacopo
>
> On 07/06/2022 17:41, Jacopo Mondi wrote:
> > Hi Dan
> >
> > On Mon, Jun 06, 2022 at 11:51:49PM +0100, Daniel Scally wrote:
> >> With the introduction of ancillary links, not all subdevs linked to
> >> the ISP's v4l2_dev necessarily represent sensors / bridges. Check the
> >> function for the subdevs and skip any that represent lens or flash
> >> controllers before creating data links.
> >>
> >> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> >> ---
> >>
> >> This should fix the issues that have been noticed, but perhaps a new flag like
> >> MEDIA_ENT_FL_HAS_SOURCE or something would be a better way to denote subdevs
> >> that need data links?
> >>
> > I agree this a bit fragile...
> >
> > I noticed ancillary links are only created for subdev notifiers,
> > which have a populated 'sd' and consequentially an entity. Could an
> > helper that walks the links of the notifier's subdev links and checks
> > if the subdev at hand is already linked, help ? Maybe with an optional
> > set of link flags to match on ?

This is actually a mess, as the list of links to be walked is the list
of the sensor's notifier, not the one of the rkisp1. Bad advice,
sorry..

>
>
> Or maybe just check if the subdev's notifier is the same as the rkisp1's
> notifier? Like:
>
>
> if(sd->notifier!= &rkisp1->notifier)

Not all subdevs will have a notifier, won't they ? In facts only
sensor that registers a notifier for their connected lenses/flashes
will have one.

Anyway, I think the issue here is that we walk the list of all subdevs
registered to the root notifier's v4l2_dev.

All async subdevices matched in the notifiers chain will end up being
registered to the root notifier's v4l2_dev, hence also lenses and
flashes will appear in this list.

        list_for_each_entry(sd, &rkisp1->v4l2_dev.subdevs, list) {

        }

Can't we do like the CIO2 does, by walking the list of async subdevs
registered to the root notifier only ? This list should not include
lenses and flashes if I'm not mistaken.

	list_for_each_entry(asd, &rkisp1->notifier.asd_list, asd_list) {

        }

You can cast the struct v4l2_async_subdev back to the wrapping struct
rkisp1_sensor_async and from there get the sd to create the links on.
Could this work in your opinion ? I'm sorry I can't test it right
away...



> continue
> That's a bit less clunky than both other solutions I think
> >
> >
> >>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> >> index 3f5cfa7eb937..e90f0216cb06 100644
> >> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> >> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> >> @@ -134,6 +134,10 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
> >>  		    sd == &rkisp1->resizer_devs[RKISP1_SELFPATH].sd)
> >>  			continue;
> >>
> >> +		if (sd->entity.function == MEDIA_ENT_F_LENS ||
> >> +		    sd->entity.function == MEDIA_ENT_F_FLASH)
> >> +			continue;
> >> +
> >>  		ret = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
> >>  						  MEDIA_PAD_FL_SOURCE);
> >>  		if (ret < 0) {
> >> --
> >> 2.25.1
> >>
