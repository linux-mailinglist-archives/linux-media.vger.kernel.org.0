Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C44FD5AE364
	for <lists+linux-media@lfdr.de>; Tue,  6 Sep 2022 10:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239325AbiIFIsF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Sep 2022 04:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239272AbiIFIrl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Sep 2022 04:47:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C10C13F3C
        for <linux-media@vger.kernel.org>; Tue,  6 Sep 2022 01:44:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C9F825B;
        Tue,  6 Sep 2022 10:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1662453889;
        bh=s3fKVUib4FciPO60XSufg9AA6J7siO8CC1ajIL2RLzo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hH/MMZJNCXi9nb2AE8n1AKaUred2MH92FoFDQbvIWH5xtiPiHmP7C0NplpGc/NAXX
         musutp5cFwRblx6rzZ5hMcir5JlbS5ue0HRtfDhMxYdiw3JxSKpg4aebFI8fa1sMcR
         j5el5kzWDwmdBJTYxj8Iue+eTirhKzI+yVMAGIw8=
Date:   Tue, 6 Sep 2022 11:44:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v13 14/34] media: mc: entity: Rewrite
 media_pipeline_start()
Message-ID: <YxcIcvGdnJDgtIL6@pendragon.ideasonboard.com>
References: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
 <20220810121122.3149086-15-tomi.valkeinen@ideasonboard.com>
 <Ywz06tZvurFVosly@pendragon.ideasonboard.com>
 <9ec0844a-494d-304a-97df-c26313f95628@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9ec0844a-494d-304a-97df-c26313f95628@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Wed, Aug 31, 2022 at 05:21:58PM +0300, Tomi Valkeinen wrote:
> On 29/08/2022 20:18, Laurent Pinchart wrote:
> > On Wed, Aug 10, 2022 at 03:11:02PM +0300, Tomi Valkeinen wrote:
> >> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>
> >> [Note: the code is mostly from Laurent but the patch description is from Tomi]
> > 
> > I'll review the description then :-)
> > 
> >> The media_pipeline_start() and media_pipeline_stop() functions use the
> >> media graph walk API to traverse the graph and validate the pipeline.
> >> The graph walk traverses the media graph following links between the
> >> entities.
> >>
> >> Also, while the pipeline can't change between the start and stop calls,
> >> the graph is walked again from scratch at stop time, or any time a
> >> driver needs to inspect the pipeline.
> >>
> >> With the upcoming multiplexed streams support we will need a bit more
> >> intelligent pipeline construction, as e.g. an entity may be passing
> >> through two independent streams via separate pads, in which case those
> > 
> > Did you mean "as e.g. two independent streams may be passing through a
> > single entity via separate pads" ?
> > 
> >> pads should not be part of the same pipeline.
> >>
> >> This patch essentially rewrites the media_pipeline_start/stop so that
> >> a pipeline is defined as a set of pads instead of entities and the media
> >> graph traversal considers the pad interdependencies when choosing which
> >> links to follow.
> >>
> >> Currently all the entity's pads are considered as interdependent. This
> >> means that the behavior with all the current drivers stays the same, but
> >> in the future we can define a more fine-grained pipeline construction.
> >>
> >> Additionally the media pipeline's pads are cached at
> >> media_pipeline_start() time, and re-used at media_pipeline_stop() which
> >> avoid the need to re-walk the whole graph as the previous implementation
> >> did.
> >>
> >> Also, caching pads in the pipeline can serve in the future as the
> >> foundation to provide a better API than the media graph walk to drivers
> >> to iterate over pads and entities in the pipeline.
> >>
> >> Note that the old media_pipeline_start/stop used the media graph walk
> >> API. The new version does not use the media graph walk API, but instead
> >> a new implementation.
> >>
> >> There are two reason for not changing the graph walk: it proved to be
> >> rather difficult to change the graph walk to have the features
> >> implemented in this patch, and second, this keeps the backward
> >> compatibility of the graph walk as there are users of the graph walk API
> >>
> >> The long term plan is that all the existing code would be converted to
> >> use the new cached pipeline, thus allowing us to remove the graph walk.
> > 
> > Could you mark the graph walk API as deprecated in this patch, or in a
> > subsequent patch in the series ? I think I did in a previous version,
> > but I may recall incorrectly.
> 
> I didn't mark the graph walk API as deprecated in v14 series. We can do 
> it on top, but I'm not sure if it's a valid thing to say yet. Have we 
> tried converting any graph walk uses to the new pipeline code? We could 
> well have code missing that prevents the conversion.

I'd like to avoid new users of the graph walk API. This requires two
patches that you haven't included or squashed in v14 though, namely

20a31d49bd75 media: mc: entity: Add entity iterator for media_pipeline
50659eb74afc media: mc: entity: Add pad iterator for media_pipeline

that you can find at

git://linuxtv.org/pinchartl/media.git streams/v6.0/v11

Should I submit that on top of v14 for inclusion in v6.1 too ?

-- 
Regards,

Laurent Pinchart
