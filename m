Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B94871FE64
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 11:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234304AbjFBJ4J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 05:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233971AbjFBJ4H (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 05:56:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E34B132
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 02:56:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp [126.156.168.104])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 154AE7FC;
        Fri,  2 Jun 2023 11:55:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685699739;
        bh=pH2k6+7na6d9Q5U0bA8t7676Ddp4FWJcI84KJVRtpC0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jN1SzyzazZCUt1qdz0pohtw9OXxqoUz/dXs4DQqDeiuKqdWuUx36Ny8lOTbQPk0G6
         JTsYQgoCgG3VYTrHLSKixD+kOrW+oA86NzQFxdHstELDcN6wAaFE/vMNPARI+WDf+o
         hmoPNdQeJJF4bYEj4Ounx6EkGM0ZQNH8mKHgjCZ4=
Date:   Fri, 2 Jun 2023 12:56:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, bingbu.cao@intel.com,
        hongju.wang@intel.com
Subject: Re: [RFC 3/7] media: uapi: v4l: Document source routes
Message-ID: <20230602095600.GH19463@pendragon.ideasonboard.com>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-4-sakari.ailus@linux.intel.com>
 <5b7038ce-d897-931f-2c6e-30bdd1a30342@ideasonboard.com>
 <ZFkipK0F5sCYv8tt@kekkonen.localdomain>
 <b3b8d45f-1cc4-1aa7-6f75-de4841fd5981@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b3b8d45f-1cc4-1aa7-6f75-de4841fd5981@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Mon, May 08, 2023 at 07:35:04PM +0300, Tomi Valkeinen wrote:
> On 08/05/2023 19:26, Sakari Ailus wrote:
> > On Mon, May 08, 2023 at 01:33:24PM +0300, Tomi Valkeinen wrote:
> >> On 06/05/2023 00:52, Sakari Ailus wrote:
> >>> Document how internal pads are used on source routes.
> >>>
> >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>> ---
> >>>    .../userspace-api/media/v4l/dev-subdev.rst     | 18 ++++++++++++++++++
> >>>    .../media/v4l/vidioc-subdev-g-routing.rst      |  5 +++++
> >>>    include/uapi/linux/v4l2-subdev.h               |  6 +++++-
> >>>    3 files changed, 28 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> >>> index a4f1df7093e8..395e06d2f0f2 100644
> >>> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> >>> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> >>> @@ -551,6 +551,24 @@ A stream at a specific point in the media pipeline is identified by the
> >>>    sub-device and a (pad, stream) pair. For sub-devices that do not support
> >>>    multiplexed streams the 'stream' field is always 0.
> >>> +.. _v4l2-subdev-source-routes:
> >>> +
> >>> +Source routes
> >>> +^^^^^^^^^^^^^
> >>> +
> >>> +Cases where a single sub-device pad is a source of multiple streams are special
> >>> +as there is no sink pad for such a route. In those cases, an internal pad is
> >>> +used as the sink pad. Such pads have the :ref:`MEDIA_PAD_FL_INTERNAL_SOURCE
> >>> +<MEDIA-PAD-FL-INTERNAL-SOURCE>` flag set.
> >>> +
> >>> +Internal pads have all the properties of a sink pad in such case, including
> >>> +formats and selections. The format in this case is the source format of the
> >>> +stream. An internal pad always has a single stream only (0).
> >>> +
> >>> +Generally source routes are not modifiable but they can be activated and
> >>> +inactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
> >>> +<v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
> >>> +
> >>
> >> I find the above chapter a bit difficult to read, but I think we need to
> >> conclude on the internal-pad vs internal-source-pad discussion first.
> >> However, one point/question:

Agreed, it's far from being clear :-( Even the first sentence, "Cases
where a single sub-device pad is a source of multiple streams are
special" is confusing, having a subdev source pad carrying multiple
streams isn't special, it is found in, for instance, FPD-Link or GMSL
receivers that transmit multiple streams from different cameras over a
single CSI-2 output. This may not be what Sakari meant here, but it can
be understood that way.

We need more than 3 paragraphs here, and we need a very clear example
with a diagram. I'd recommend using a camera sensor that produces image
data and embedded data for the example, as that's a common real-life use
case. The text should present the example, explain what the problem is,
and then explain how internal pads fix it. Then it can expand on the
features and usage of internal pads in a more generic way.

> >> You write that there's only one stream in an internal pad. I wonder if
> >> that's a good or a necessary limitation... Do you see that allowing multiple
> >> streams brings extra complexity? It's still up to each driver to decide how
> >> many streams they support (most would just support a single one), so each
> >> driver can easily enforce that limit.
> > 
> > Good question. As we don't seem to have a tangible reason to allow it, I'd
> > deny it until there's a use case.
> > 
> > Or did you have a use case in mind?
> > 
> > I thought indicating which streams will be bound together (i.e. either are
> > all disabled or enabled) could be one, but I'm not sure we need that at the
> > moment at least.
> 
> I don't have nothing concrete in mind. Maybe a TPG which also generates 
> some kind of metadata. But that could be implemented as two internal pads.
> 
> >> I'm fine with starting with only single-stream support, but if we later need
> >> to loosen that restriction, I wonder if it'll be difficult if we have
> >> specified that there can be only one stream. I.e. will the drivers and the
> >> userspace depend on that limit.
> > 
> > We can always allow what wasn't allowed previously so that's a non-issue,
> > really. But it needs to bring new functionality, otherwise there's no
> > reason to do that.
> 
> It's not always that easy. If the drivers and the userspace expect that 
> there's a single route with ID 0, and then with a new kernel there are 
> more streams or the single stream is ID 1, things could go wrong.

I agree with Tomi here. On the kernel side it should be fine (with an
unknown amount of pain), but I'd consider this as a userspace API
breakage. If the specifications indicates that only a single stream can
be used, applications may rely on that, and things could go wrong if new
streams are added.

We can restrict the kernel implementation to a single stream, but the
userspace API has to indicate that multiple streams can co-exist if we
want to allow that in the future.

-- 
Regards,

Laurent Pinchart
