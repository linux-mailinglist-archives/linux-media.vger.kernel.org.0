Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 236E5585A4A
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 13:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234107AbiG3L4U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 07:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbiG3L4T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 07:56:19 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 430F41705F
        for <linux-media@vger.kernel.org>; Sat, 30 Jul 2022 04:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659182178; x=1690718178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=te78annmi3GJfl6YPGb1nx8vTC1sDPpQx3qOLLsvMgU=;
  b=oB3RSRAq8FFFDritplDakTO4hGJjY1U/imXBiM5PHz/ntfb9QQTC7FWz
   Ph5c3RQvw2g3lnDrmQDmLBT/tbr8EcBM5yg+uJ6+xOGVEGwoGtsLZDyRU
   4bPjFbclwLXno/9zWyKHKBuQwJg/jgn3OxBhlDRBAk50IKeB6ltgLKxYO
   3q3x7/oxWYh/JHZm+ocDFbZObVXj0fA9l9PNQVTPzDLh6fVDdOeXW7tGt
   c/J09NCXWsCcjF8ccOTFBA6vPcMOZL7QpRRm5H1xDIFyHQ6UOuXnL4b1B
   dUKq0ZLWM49ueh/fU/QXMFbd2hGHnOCswBTdFgmwMbBxB5OcJZ7BYXtIc
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="352915721"
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; 
   d="scan'208";a="352915721"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2022 04:56:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; 
   d="scan'208";a="634393012"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2022 04:56:14 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id B596C203B7;
        Sat, 30 Jul 2022 14:56:12 +0300 (EEST)
Date:   Sat, 30 Jul 2022 11:56:12 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Satish Nagireddy <satish.nagireddy@getcruise.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [EXT] Re: [EXT] Re: [EXT] [PATCH v12 09/30] media: mc: entity:
 Rewrite media_pipeline_start() to support routes
Message-ID: <YuUcXJD/EXIumPac@paasikivi.fi.intel.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-10-tomi.valkeinen@ideasonboard.com>
 <CAG0LG94ADymN_R0Mw0hSf-M0nwUcWW_Xtr8gLM=wsqdH7Ep2Wg@mail.gmail.com>
 <438685f9-1a18-31c3-ffbc-15e87ef7493d@ideasonboard.com>
 <CAG0LG94AUCng800b6GxaYcATdSJRKHiVdz8wrT83cLMDC0XOtg@mail.gmail.com>
 <ce6f1e9a-21d2-cb89-87fd-1ec09ee95c4f@ideasonboard.com>
 <CAG0LG96dncADM65ids6VMU=ym-j55fws6NOwLQM=or7pN4-d-g@mail.gmail.com>
 <47c925b2-2fa2-ce0b-0d43-5fc8fb048338@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47c925b2-2fa2-ce0b-0d43-5fc8fb048338@ideasonboard.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Fri, Jul 29, 2022 at 08:07:19PM +0300, Tomi Valkeinen wrote:
> On 29/07/2022 20:00, Satish Nagireddy wrote:
> > On Fri, Jul 29, 2022 at 3:27 AM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> > > 
> > > On 29/07/2022 12:19, Satish Nagireddy wrote:
> > > > On Fri, Jul 29, 2022 at 1:53 AM Tomi Valkeinen
> > > > <tomi.valkeinen@ideasonboard.com> wrote:
> > > > > 
> > > > > On 29/07/2022 11:45, Satish Nagireddy wrote:
> > > > > 
> > > > > > > @@ -1011,7 +1342,7 @@ EXPORT_SYMBOL_GPL(media_entity_get_fwnode_pad);
> > > > > > > 
> > > > > > >     struct media_pipeline *media_entity_pipeline(struct media_entity *entity)
> > > > > > >     {
> > > > > > > -       return entity->pipe;
> > > > > > > +       return entity->pads->pipe;
> > > > > > 
> > > > > > I am not sure If it is always safe to return the pipe associated with
> > > > > > the first pad. I think this will work with all the existing drivers.
> > > > > > Let's say If pads of an entity are associated with different pipes,
> > > > > > this function might require extending the support of returning
> > > > > > pipe based on pad index. Please let me know your opinion.
> > > > > 
> > > > > That's true. The kdoc for this function says:
> > > > > 
> > > > >     * In general, entities can be part of multiple pipelines, when carrying
> > > > >     * multiple streams (either on different pads, or on the same pad using
> > > > >     * multiplexed streams). This function is ill-defined in that case. It
> > > > >     * currently returns the pipeline associated with the first pad of the
> > > > > entity.
> > > > > 
> > > > > I did consider adding a warning if the function is called for entities
> > > > > with more than one pad. But that probably would give false warnings,
> > > > > e.g. for a simple entity with one sink and one source pad. In that case
> > > > > both pads are always part of the same pipeline, and
> > > > > media_entity_pipeline() works correctly.
> > > > > 
> > > > > We could perhaps add a check here which verifies that all the pads in
> > > > > the entity have the same pipe.
> > > 
> > > Perhaps something like:
> > > 
> > > struct media_pipeline *media_entity_pipeline(struct media_entity *entity)
> > > {
> > >          struct media_pipeline *pipe;
> > >          struct media_pad *pad;
> > > 
> > >          if (entity->num_pads == 0)
> > >                  return NULL;
> > > 
> > >          pipe = entity->pads->pipe;
> > > 
> > >          media_entity_for_each_pad(entity, pad) {
> > >                  if (WARN_ON(pad->pipe != pipe))
> > >                          return NULL;
> > >          }
> > > 
> > >          return pipe;
> > > }
> > 
> > The above code means that we do not support multiple pipelines per
> > entity. Or leave the implementation as is now and
> > this can be done as a different patch later, I will leave it to you.
> > He is what I'm thinking, assuming that every media_pad has it's own pipe.
> > 
> > struct media_pipeline *media_entity_pipeline(struct media_entity
> > *entity, u32 pad_index)
> > {
> >           if (pad_index >= entity->num_pads)
> >                   return NULL;
> > 
> >           return entity->pads[pad_index].pipe;
> > }
> 
> Oh, I see now where the confusion is.
> 
> media_entity_pipeline() is a convenience helper for the currently existing
> drivers. They access entity->pipe directly (or when we move the pipe to pad,
> entity->pads->pipe). So this function is just refactoring the direct access
> away from the drivers, which makes it easier in the future to find those
> drivers accessing the pipe, or change where the pipe is stored without doing
> any changes to the drivers.
> 
> A driver which supports streams should not use this function, as there's no
> "pipe for entity". We seem to be missing a similar helper function for these
> cases, media_pad_pipeline() or such. We can add when needed.

I think this could be done now, for consistency. Either the existing
drivers could call it on entity->pads, thus assuming they only use a single
pipeline for that entity. Or keep media_entity_pipeline(), but there's some
chance for confusion on where the pipeline is bound. At least there should
be a warning it's just for old existing drivers.

-- 
Terveisin,

Sakari Ailus
