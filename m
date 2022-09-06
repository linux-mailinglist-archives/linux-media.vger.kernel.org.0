Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A49735AE8E9
	for <lists+linux-media@lfdr.de>; Tue,  6 Sep 2022 14:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239635AbiIFM6z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Sep 2022 08:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240298AbiIFM6x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Sep 2022 08:58:53 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF0672638
        for <linux-media@vger.kernel.org>; Tue,  6 Sep 2022 05:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662469131; x=1694005131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hzjNLpd97wdAkluHOpGHMTYo/uXSlcUe24qPQEhBfGA=;
  b=bDS4gve4Ca4UajnDF4pMnrXCcEMODWPaJnbywqFTgieIe855V4KJCq2p
   i2JwgYi5xBiehWMsGtfvEawgAkVCALk+9RNx9OJ455QLIU5Z2OfV9Fc3V
   uZF67ZMGKvwVTlOuBouxhMZg6PtbG2HYCwcau7w+BFgK0zM5oRxA+Oh93
   ijjHM7LdUcOk0azHXS618Y2qyG2RJmxDjBEoBfXo8iBIKy1Hzh5Kb++6B
   53L1koThzbTNsAORHqsSAJMg/i3601U41UbS58kEXCw4Kq3x2r6AoVUPk
   yfqs1Z87ynPAs6DW0pez5Hd4K4kj+9KfJglpDlxj0RRyAaAkUj8eyK94W
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="382879181"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="382879181"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 05:58:51 -0700
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="647219634"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2022 05:58:48 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 0237920188;
        Tue,  6 Sep 2022 15:58:46 +0300 (EEST)
Date:   Tue, 6 Sep 2022 12:58:45 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v13 14/34] media: mc: entity: Rewrite
 media_pipeline_start()
Message-ID: <YxdEBW5Y+jxJKXBS@paasikivi.fi.intel.com>
References: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
 <20220810121122.3149086-15-tomi.valkeinen@ideasonboard.com>
 <Ywz06tZvurFVosly@pendragon.ideasonboard.com>
 <9ec0844a-494d-304a-97df-c26313f95628@ideasonboard.com>
 <YxcIcvGdnJDgtIL6@pendragon.ideasonboard.com>
 <5126238e-4104-11df-24b3-3266f441b6b4@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5126238e-4104-11df-24b3-3266f441b6b4@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 06, 2022 at 12:19:19PM +0300, Tomi Valkeinen wrote:
> On 06/09/2022 11:44, Laurent Pinchart wrote:
> > Hi Tomi,
> > 
> > On Wed, Aug 31, 2022 at 05:21:58PM +0300, Tomi Valkeinen wrote:
> > > On 29/08/2022 20:18, Laurent Pinchart wrote:
> > > > On Wed, Aug 10, 2022 at 03:11:02PM +0300, Tomi Valkeinen wrote:
> > > > > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > 
> > > > > [Note: the code is mostly from Laurent but the patch description is from Tomi]
> > > > 
> > > > I'll review the description then :-)
> > > > 
> > > > > The media_pipeline_start() and media_pipeline_stop() functions use the
> > > > > media graph walk API to traverse the graph and validate the pipeline.
> > > > > The graph walk traverses the media graph following links between the
> > > > > entities.
> > > > > 
> > > > > Also, while the pipeline can't change between the start and stop calls,
> > > > > the graph is walked again from scratch at stop time, or any time a
> > > > > driver needs to inspect the pipeline.
> > > > > 
> > > > > With the upcoming multiplexed streams support we will need a bit more
> > > > > intelligent pipeline construction, as e.g. an entity may be passing
> > > > > through two independent streams via separate pads, in which case those
> > > > 
> > > > Did you mean "as e.g. two independent streams may be passing through a
> > > > single entity via separate pads" ?
> > > > 
> > > > > pads should not be part of the same pipeline.
> > > > > 
> > > > > This patch essentially rewrites the media_pipeline_start/stop so that
> > > > > a pipeline is defined as a set of pads instead of entities and the media
> > > > > graph traversal considers the pad interdependencies when choosing which
> > > > > links to follow.
> > > > > 
> > > > > Currently all the entity's pads are considered as interdependent. This
> > > > > means that the behavior with all the current drivers stays the same, but
> > > > > in the future we can define a more fine-grained pipeline construction.
> > > > > 
> > > > > Additionally the media pipeline's pads are cached at
> > > > > media_pipeline_start() time, and re-used at media_pipeline_stop() which
> > > > > avoid the need to re-walk the whole graph as the previous implementation
> > > > > did.
> > > > > 
> > > > > Also, caching pads in the pipeline can serve in the future as the
> > > > > foundation to provide a better API than the media graph walk to drivers
> > > > > to iterate over pads and entities in the pipeline.
> > > > > 
> > > > > Note that the old media_pipeline_start/stop used the media graph walk
> > > > > API. The new version does not use the media graph walk API, but instead
> > > > > a new implementation.
> > > > > 
> > > > > There are two reason for not changing the graph walk: it proved to be
> > > > > rather difficult to change the graph walk to have the features
> > > > > implemented in this patch, and second, this keeps the backward
> > > > > compatibility of the graph walk as there are users of the graph walk API
> > > > > 
> > > > > The long term plan is that all the existing code would be converted to
> > > > > use the new cached pipeline, thus allowing us to remove the graph walk.
> > > > 
> > > > Could you mark the graph walk API as deprecated in this patch, or in a
> > > > subsequent patch in the series ? I think I did in a previous version,
> > > > but I may recall incorrectly.
> > > 
> > > I didn't mark the graph walk API as deprecated in v14 series. We can do
> > > it on top, but I'm not sure if it's a valid thing to say yet. Have we
> > > tried converting any graph walk uses to the new pipeline code? We could
> > > well have code missing that prevents the conversion.
> > 
> > I'd like to avoid new users of the graph walk API. This requires two
> > patches that you haven't included or squashed in v14 though, namely
> > 
> > 20a31d49bd75 media: mc: entity: Add entity iterator for media_pipeline
> > 50659eb74afc media: mc: entity: Add pad iterator for media_pipeline
> > 
> > that you can find at
> > 
> > git://linuxtv.org/pinchartl/media.git streams/v6.0/v11
> > 
> > Should I submit that on top of v14 for inclusion in v6.1 too ?
> 
> Both look fine to me with a quick glance, and I'm ok with adding these on
> top of v14 (or I can pick them for v15 if there's one).
> 
> I don't think we have any code that uses them, have you tested them?

They're from Laurent, why would you test them? :-)

I've taken the 16 first patches (v14) to my tree, will send a PR shortly.

-- 
Sakari Ailus
