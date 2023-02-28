Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC006A54DD
	for <lists+linux-media@lfdr.de>; Tue, 28 Feb 2023 09:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjB1Iyw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Feb 2023 03:54:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbjB1Iyp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Feb 2023 03:54:45 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29AD559E
        for <linux-media@vger.kernel.org>; Tue, 28 Feb 2023 00:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677574483; x=1709110483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KljbnIJEAar0/hVYbZsvx1IKDP+tY1/dCj3+p2bWD4g=;
  b=iLqeLwyscUKvI/J2AGNGNSjN1Cvw4/fMz2s/E2egkLPoVHruXIhqyg08
   W+4O9PukRGI4/qS3eT9tilg4E18Rv9wZ+uQTpC0mlvPn1XynL8xOCdg2e
   Ky1HzCyM39Ou+rxky9UnvLIcoiK0AyeHfZVag183ekaIR6HNMjbe3Pzhj
   GdMLAbz/NFvmDcko6nNLOCeICV/Uhw4ouY8IeUsrLFGXuumyv1qz2DGTM
   br92ReJnPckj9P2afiYPP9Cvrx8pQ8cdUwP9RKF73l4X0Wyg73CMNLLt8
   bc8gOzqXVdxY5SjdYEsPUPbAbdvYqkkqu6cC+v0tuViZJYjXGXcqhxCEH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="335573071"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="335573071"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 00:54:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="783745858"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="783745858"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 00:54:41 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 7142F120362;
        Tue, 28 Feb 2023 10:54:38 +0200 (EET)
Date:   Tue, 28 Feb 2023 10:54:38 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        niklas soderlund <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v1 3/3] media: ti: cal: add multiplexed streams support
Message-ID: <Y/3BTmojKnKLgPuY@kekkonen.localdomain>
References: <20230222125630.421020-1-tomi.valkeinen@ideasonboard.com>
 <20230222125630.421020-4-tomi.valkeinen@ideasonboard.com>
 <20230224154855.kmiwg2h5b3vq272l@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224154855.kmiwg2h5b3vq272l@uno.localdomain>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Fri, Feb 24, 2023 at 04:48:55PM +0100, Jacopo Mondi wrote:
> Hi Tomi
> 
> On Wed, Feb 22, 2023 at 02:56:30PM +0200, Tomi Valkeinen wrote:
> > Add routing and stream_config support to CAL driver.
> >
> > Add multiplexed streams support. CAL has 8 dma-engines and can capture 8
> > separate streams at the same time.
> >
> > Add 8 video device nodes, each representing a single dma-engine, and set
> > the number of source pads on camerarx to 8. Each video node can be
> > connected to any of the source pads on either of the camerarx instances
> > using media links. Camerarx internal routing is used to route the
> > incoming CSI-2 streams to one of the 8 source pads.
> >
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  drivers/media/platform/ti/cal/cal-camerarx.c | 233 ++++++++++++++-----
> >  drivers/media/platform/ti/cal/cal-video.c    | 146 +++++++++---
> >  drivers/media/platform/ti/cal/cal.c          |  65 ++++--
> >  drivers/media/platform/ti/cal/cal.h          |   4 +-
> >  4 files changed, 342 insertions(+), 106 deletions(-)
> >
> > diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
> > index faafbd0e9240..49ae29065cd1 100644
> > --- a/drivers/media/platform/ti/cal/cal-camerarx.c
> > +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
> > @@ -49,21 +49,41 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
> >  {
> >  	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
> >  	u32 num_lanes = mipi_csi2->num_data_lanes;
> > -	const struct cal_format_info *fmtinfo;
> >  	struct v4l2_subdev_state *state;
> > -	struct v4l2_mbus_framefmt *fmt;
> >  	u32 bpp;
> >  	s64 freq;
> >
> > -	state = v4l2_subdev_get_locked_active_state(&phy->subdev);
> > +	/*
> > +	 * v4l2_get_link_freq() uses V4L2_CID_LINK_FREQ first, and falls back
> > +	 * to V4L2_CID_PIXEL_RATE if V4L2_CID_LINK_FREQ is not available.
> > +	 *
> > +	 * With multistream input there is no single pixel rate, and thus we
> > +	 * cannot use V4L2_CID_PIXEL_RATE, so we pass 0 as the bpp which
> > +	 * causes v4l2_get_link_freq() to return an error if it falls back to
> > +	 * V4L2_CID_PIXEL_RATE.
> > +	 */
> 
> To recap a bit of our offline discussion:
> - max9286 GMSL deserializer (as a comparison for a multiplexed
>   transmitter) use PIXEL_RATE to report the cumulative pixel rate of
>   enabled transmitters. This is because the R-Car CSI-2 receiver on
>   which use PIXEL_RATE to compute the link freq [1]
> 
> - according to [2]
>   pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample (on D-PHY)
> 
>   from which:
>   link_freq = pixel_rate * bits_per_sample / (2 * nr_of_lanes)
> 
>   This works as long the reported pixel rate includes visible and
>   blankings, something I'm not sure how many transmitters handle
>   correctly as PIXEL_RATE control is meant to report the visible pixel
>   sampling rate on the pixel array.
> 
> I guess we should go towards mandating LINK_FREQ for transmitters.

Yes, this is the intention and new drivers use LINK_FREQ (but this could
occasionally be missed in review). I don't think there's a specific
requirement for this in documentation. One should be added to document the
status quo.

Would you like to send a patch? :-)

For CSI-2 this is obvious. What about the parallel buses?

-- 
Regards,

Sakari Ailus
