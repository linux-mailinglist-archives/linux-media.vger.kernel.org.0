Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0F271FE6A
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 11:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235073AbjFBJ4w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 05:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234251AbjFBJ4v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 05:56:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65945E7
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 02:56:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp [126.156.168.104])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB05C7FC;
        Fri,  2 Jun 2023 11:56:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685699782;
        bh=UUNWjaXF3z3T6sh7Bc46SnYJROLjh2Ci2BjLEH0vkYA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SSm7e9ltSuzTbWXI9YiXwSDhK2kZtYFJOVADAfkgLr+2DNWYJ27tD2DM/Y0jA4BU7
         7KjHmq73lpegbWNdmG4vk4WtuZx3LoMtYT7S/UcporFtg1VPBNUthyXPNzKXvgO141
         bbhapQNigfRMW/sfHnU9WCbR4KOhQ44RQ7n+gPwo=
Date:   Fri, 2 Jun 2023 12:56:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, bingbu.cao@intel.com,
        hongju.wang@intel.com
Subject: Re: [RFC 3/7] media: uapi: v4l: Document source routes
Message-ID: <20230602095643.GI19463@pendragon.ideasonboard.com>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-4-sakari.ailus@linux.intel.com>
 <5b7038ce-d897-931f-2c6e-30bdd1a30342@ideasonboard.com>
 <ZFkipK0F5sCYv8tt@kekkonen.localdomain>
 <b3b8d45f-1cc4-1aa7-6f75-de4841fd5981@ideasonboard.com>
 <ZFk0VguHp7UoW3t7@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZFk0VguHp7UoW3t7@kekkonen.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 08, 2023 at 08:41:42PM +0300, Sakari Ailus wrote:
> On Mon, May 08, 2023 at 07:35:04PM +0300, Tomi Valkeinen wrote:
> > On 08/05/2023 19:26, Sakari Ailus wrote:
> > > On Mon, May 08, 2023 at 01:33:24PM +0300, Tomi Valkeinen wrote:
> > > > On 06/05/2023 00:52, Sakari Ailus wrote:
> > > > > Document how internal pads are used on source routes.
> > > > > 
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > ---
> > > > >    .../userspace-api/media/v4l/dev-subdev.rst     | 18 ++++++++++++++++++
> > > > >    .../media/v4l/vidioc-subdev-g-routing.rst      |  5 +++++
> > > > >    include/uapi/linux/v4l2-subdev.h               |  6 +++++-
> > > > >    3 files changed, 28 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > > index a4f1df7093e8..395e06d2f0f2 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > > @@ -551,6 +551,24 @@ A stream at a specific point in the media pipeline is identified by the
> > > > >    sub-device and a (pad, stream) pair. For sub-devices that do not support
> > > > >    multiplexed streams the 'stream' field is always 0.
> > > > > +.. _v4l2-subdev-source-routes:
> > > > > +
> > > > > +Source routes
> > > > > +^^^^^^^^^^^^^
> > > > > +
> > > > > +Cases where a single sub-device pad is a source of multiple streams are special
> > > > > +as there is no sink pad for such a route. In those cases, an internal pad is
> > > > > +used as the sink pad. Such pads have the :ref:`MEDIA_PAD_FL_INTERNAL_SOURCE
> > > > > +<MEDIA-PAD-FL-INTERNAL-SOURCE>` flag set.
> > > > > +
> > > > > +Internal pads have all the properties of a sink pad in such case, including
> > > > > +formats and selections. The format in this case is the source format of the
> > > > > +stream. An internal pad always has a single stream only (0).
> > > > > +
> > > > > +Generally source routes are not modifiable but they can be activated and
> > > > > +inactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > > > +<v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
> > > > > +
> > > > 
> > > > I find the above chapter a bit difficult to read, but I think we need to
> > > > conclude on the internal-pad vs internal-source-pad discussion first.
> > > > However, one point/question:
> > > > 
> > > > You write that there's only one stream in an internal pad. I wonder if
> > > > that's a good or a necessary limitation... Do you see that allowing multiple
> > > > streams brings extra complexity? It's still up to each driver to decide how
> > > > many streams they support (most would just support a single one), so each
> > > > driver can easily enforce that limit.
> > > 
> > > Good question. As we don't seem to have a tangible reason to allow it, I'd
> > > deny it until there's a use case.
> > > 
> > > Or did you have a use case in mind?
> > > 
> > > I thought indicating which streams will be bound together (i.e. either are
> > > all disabled or enabled) could be one, but I'm not sure we need that at the
> > > moment at least.
> > 
> > I don't have nothing concrete in mind. Maybe a TPG which also generates some
> > kind of metadata. But that could be implemented as two internal pads.
> > 
> > > > I'm fine with starting with only single-stream support, but if we later need
> > > > to loosen that restriction, I wonder if it'll be difficult if we have
> > > > specified that there can be only one stream. I.e. will the drivers and the
> > > > userspace depend on that limit.
> > > 
> > > We can always allow what wasn't allowed previously so that's a non-issue,
> > > really. But it needs to bring new functionality, otherwise there's no
> > > reason to do that.
> > 
> > It's not always that easy. If the drivers and the userspace expect that
> > there's a single route with ID 0, and then with a new kernel there are more
> > streams or the single stream is ID 1, things could go wrong.
> 
> Other drivers are a non-issue IMO as this isn't visible to other drivers.
> 
> I think for user space this could be an issue if it were entirely generic.
> But that's probably not going to be the case, is it? I don't mean test
> programs.

I could imagine this breaking libcamera for instance.

-- 
Regards,

Laurent Pinchart
