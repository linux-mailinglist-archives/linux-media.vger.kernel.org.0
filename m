Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC381BDFA1
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 15:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727786AbgD2Nyf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 09:54:35 -0400
Received: from mga04.intel.com ([192.55.52.120]:46216 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726853AbgD2Nyf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 09:54:35 -0400
IronPort-SDR: Tagg0/jmOwpe288ynpWAEwD0cVnf8VFM7LaZXMoyNz25SlkQXxBLhJWhN3fHDLiCFQUSQtZx4F
 YKMJHQVp46OA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 06:54:34 -0700
IronPort-SDR: 4iaTuLUYuLrDaZInuoryD6mfywDVahSDwS+P2zlMMUCxH+EZvf1cUwWyPW4Ts5xb91nUqdEwnD
 CTWbzRTEu2aw==
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; 
   d="scan'208";a="367809370"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 06:54:32 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 702F3202AE; Wed, 29 Apr 2020 16:54:30 +0300 (EEST)
Date:   Wed, 29 Apr 2020 16:54:30 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] media: v4l2-subdv: Introduce get_mbus_config pad
 op
Message-ID: <20200429135430.GH9190@paasikivi.fi.intel.com>
References: <20200415105004.2497356-1-jacopo+renesas@jmondi.org>
 <20200415105004.2497356-2-jacopo+renesas@jmondi.org>
 <20200420014457.GA15673@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420014457.GA15673@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Mon, Apr 20, 2020 at 04:44:57AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Wed, Apr 15, 2020 at 12:49:58PM +0200, Jacopo Mondi wrote:
> > Introduce a new pad operation to allow retrieving the media bus
> > configuration on a subdevice pad.
> > 
> > The newly introduced operation reassembles the s/g_mbus_config video
> > operation, which have been on their way to be deprecated since a long
> > time.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  include/media/v4l2-subdev.h | 69 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 69 insertions(+)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index a4848de59852..fc16af578471 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -350,6 +350,71 @@ struct v4l2_mbus_frame_desc {
> >  	unsigned short num_entries;
> >  };
> >  
> > +/**
> > + * struct v4l2_mbus_parallel_config - parallel mbus configuration
> > + * @hsync_active: hsync active state: 1 for high, 0 for low
> > + * @vsync_active: vsync active state: 1 for high, 0 for low
> > + * @pclk_rising: pixel clock active edge: 1 for rising, 0 for falling
> 
> Is this for the driving side or the sampling side ?

Is there a difference? I'd expect the configuration needs to be the same on
both sides.

> 
> > + * @data_active: data lines active state: 1 for high, 0 for low
> 
> I wonder, is there any system with active low data lines ?
> 
> > + */
> > +struct v4l2_mbus_parallel_config {
> 
> Is this intended to cover BT.656 too ? Either way I think it should be
> documented.

I think we should replace what directly refers to Bt.601 with something
that refers to that, and not "parallel". Both are parallel after all. I
think the naming is in line with that, assuming this covers both.

> 
> > +	unsigned int hsync_active : 1;
> > +	unsigned int vsync_active : 1;
> > +	unsigned int pclk_rising : 1;
> > +	unsigned int data_active : 1;
> 
> Shouldn't we reuse the V4L2_MBUS_* flags, given that they're also used
> in v4l2_fwnode_bus_parallel ? While the v4l2_mbus_config structure is

I'd think it's easier to work with fields in drivers than the flags. This
isn't uAPI so we don't need to think the ABI. The change could also be done
to struct v4l2_fwnode_bus_parallel.

> getting deprecated, it doesn't mean we can reuse the same flags if they
> make sense. Otherwise we'll have to translate between
> v4l2_fwnode_bus_parallel.flags and the fields here. Ideally
> v4l2_fwnode_bus_parallel should be replaced with
> v4l2_mbus_parallel_config (once we add additional fields).

...

-- 
Kind regards,

Sakari Ailus
