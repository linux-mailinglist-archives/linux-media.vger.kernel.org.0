Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 921F24DC114
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 09:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbiCQI3K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 04:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiCQI3J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 04:29:09 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 003B2AF1E5
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 01:27:52 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id C941B1BF20B;
        Thu, 17 Mar 2022 08:27:48 +0000 (UTC)
Date:   Thu, 17 Mar 2022 09:27:47 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v11 25/36] media: Documentation: add multiplexed streams
 documentation
Message-ID: <20220317082747.fbzij2nnd2jcbjb2@uno.localdomain>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-26-tomi.valkeinen@ideasonboard.com>
 <20220316090404.jnwkiu6qe2qvfblc@uno.localdomain>
 <68a3f1e2-bf50-263f-607c-cfcc25f978ce@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <68a3f1e2-bf50-263f-607c-cfcc25f978ce@ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi

On Thu, Mar 17, 2022 at 09:18:42AM +0200, Tomi Valkeinen wrote:
> On 16/03/2022 11:04, Jacopo Mondi wrote:
> > Hi Tomi
> >
> > On Tue, Mar 01, 2022 at 06:11:45PM +0200, Tomi Valkeinen wrote:
> > > Add documentation related to multiplexed streams.
> > >
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > >   .../driver-api/media/v4l2-subdev.rst          |   8 +
> > >   .../userspace-api/media/v4l/dev-subdev.rst    | 165 ++++++++++++++++++
> > >   2 files changed, 173 insertions(+)
> > >
> > > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> > > index 115211cef4d1..80654f1bcac9 100644
> > > --- a/Documentation/driver-api/media/v4l2-subdev.rst
> > > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> > > @@ -593,6 +593,14 @@ before calling v4l2_subdev_init_finalize():
> > >
> > >   This shares the driver's private mutex between the controls and the states.
> > >
> > > +Streams, multiplexed media pads and internal routing
> > > +----------------------------------------------------
> > > +
> > > +A subdevice driver can implement support for multiplexed streams by setting
> >
> > Let me start by being picky with a minor thing: the rest of the
> > documentation seems to use "sub-device". Here you have "sub-device",
> > "subdevice" and "subdev". I think "sub-device" should be used
> > everywhere
>
> I can see lots of all those three in the docs, so I don't really know which
> one to pick...
>

You're right, the number of "subdev" entries is larger that what I
first thought. Let's keep using whatever then :)

