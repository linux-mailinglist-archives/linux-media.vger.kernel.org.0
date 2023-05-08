Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2076FB60C
	for <lists+linux-media@lfdr.de>; Mon,  8 May 2023 19:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233057AbjEHRlt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 May 2023 13:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbjEHRlr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 May 2023 13:41:47 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7791722
        for <linux-media@vger.kernel.org>; Mon,  8 May 2023 10:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683567706; x=1715103706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bZxp8T48RVcCKdy1tvjKU15d/nNmbsQ40mQ+QrX4vTg=;
  b=FAQ40P8Mu42WF+EMci91bez88w05DZFEnraKdjMU3Q+0p5jyHE8ZX27r
   /hiD5Em8k3c1iIXqqQKE3C1jBGmlLlS8/Jzp2raQZ/0ZjDKdYSmCyvC8p
   gtU/qfn6AdZTX15/CnikbW2dB5CxLGnimRZlkfhdxgl5ayES8dnvm0w/7
   FmdPJQKhdTzg7O2NTN1kSRjSNSH5tl79v94W4eJ/CyzI+7P2UyoybGt8B
   fBmmxIZx3zMsbHTLG0CXGD3VknjypP19JP9NUwABykeRujkz0GQ5BjwZo
   39VhFqlfz1GgllEBUsK5Dr+m5MAzp4Ojg+RrV1DayrBkQF1B8qa9HNbSA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="436032806"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="436032806"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 10:41:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="944946196"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="944946196"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 10:41:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 70C611203DA;
        Mon,  8 May 2023 20:41:42 +0300 (EEST)
Date:   Mon, 8 May 2023 20:41:42 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [RFC 3/7] media: uapi: v4l: Document source routes
Message-ID: <ZFk0VguHp7UoW3t7@kekkonen.localdomain>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-4-sakari.ailus@linux.intel.com>
 <5b7038ce-d897-931f-2c6e-30bdd1a30342@ideasonboard.com>
 <ZFkipK0F5sCYv8tt@kekkonen.localdomain>
 <b3b8d45f-1cc4-1aa7-6f75-de4841fd5981@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3b8d45f-1cc4-1aa7-6f75-de4841fd5981@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Mon, May 08, 2023 at 07:35:04PM +0300, Tomi Valkeinen wrote:
> On 08/05/2023 19:26, Sakari Ailus wrote:
> > Moi,
> > 
> > On Mon, May 08, 2023 at 01:33:24PM +0300, Tomi Valkeinen wrote:
> > > On 06/05/2023 00:52, Sakari Ailus wrote:
> > > > Document how internal pads are used on source routes.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >    .../userspace-api/media/v4l/dev-subdev.rst     | 18 ++++++++++++++++++
> > > >    .../media/v4l/vidioc-subdev-g-routing.rst      |  5 +++++
> > > >    include/uapi/linux/v4l2-subdev.h               |  6 +++++-
> > > >    3 files changed, 28 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > index a4f1df7093e8..395e06d2f0f2 100644
> > > > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > > > @@ -551,6 +551,24 @@ A stream at a specific point in the media pipeline is identified by the
> > > >    sub-device and a (pad, stream) pair. For sub-devices that do not support
> > > >    multiplexed streams the 'stream' field is always 0.
> > > > +.. _v4l2-subdev-source-routes:
> > > > +
> > > > +Source routes
> > > > +^^^^^^^^^^^^^
> > > > +
> > > > +Cases where a single sub-device pad is a source of multiple streams are special
> > > > +as there is no sink pad for such a route. In those cases, an internal pad is
> > > > +used as the sink pad. Such pads have the :ref:`MEDIA_PAD_FL_INTERNAL_SOURCE
> > > > +<MEDIA-PAD-FL-INTERNAL-SOURCE>` flag set.
> > > > +
> > > > +Internal pads have all the properties of a sink pad in such case, including
> > > > +formats and selections. The format in this case is the source format of the
> > > > +stream. An internal pad always has a single stream only (0).
> > > > +
> > > > +Generally source routes are not modifiable but they can be activated and
> > > > +inactivated using the :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE
> > > > +<v4l2-subdev-routing-flags>` flag, depending on driver capabilities.
> > > > +
> > > 
> > > I find the above chapter a bit difficult to read, but I think we need to
> > > conclude on the internal-pad vs internal-source-pad discussion first.
> > > However, one point/question:
> > > 
> > > You write that there's only one stream in an internal pad. I wonder if
> > > that's a good or a necessary limitation... Do you see that allowing multiple
> > > streams brings extra complexity? It's still up to each driver to decide how
> > > many streams they support (most would just support a single one), so each
> > > driver can easily enforce that limit.
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
> I don't have nothing concrete in mind. Maybe a TPG which also generates some
> kind of metadata. But that could be implemented as two internal pads.
> 
> > > I'm fine with starting with only single-stream support, but if we later need
> > > to loosen that restriction, I wonder if it'll be difficult if we have
> > > specified that there can be only one stream. I.e. will the drivers and the
> > > userspace depend on that limit.
> > 
> > We can always allow what wasn't allowed previously so that's a non-issue,
> > really. But it needs to bring new functionality, otherwise there's no
> > reason to do that.
> 
> It's not always that easy. If the drivers and the userspace expect that
> there's a single route with ID 0, and then with a new kernel there are more
> streams or the single stream is ID 1, things could go wrong.

Other drivers are a non-issue IMO as this isn't visible to other drivers.

I think for user space this could be an issue if it were entirely generic.
But that's probably not going to be the case, is it? I don't mean test
programs.

-- 
Terveisin,

Sakari Ailus
