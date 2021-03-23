Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2794345E97
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 13:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbhCWMzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 08:55:05 -0400
Received: from mga14.intel.com ([192.55.52.115]:39042 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231362AbhCWMyi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 08:54:38 -0400
IronPort-SDR: 0+Kg/5MknCwu4wQ99D7s9Pn5B8giY0bYavKeud8x+Pov9MUR2fgAKwYlUkh3UFPrd1901yXOId
 IgQJ1nGTVp5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="189869470"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="189869470"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 05:54:35 -0700
IronPort-SDR: 5XqKAeEUOX8CuA3DDCIP4BF7NGRTFVFm5xUfTeBa+XeyoRE9OMnWf2JIp8o0A7FNGhmsWW2SWN
 Q+SJDwQcrTnA==
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="413371695"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 05:54:33 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 06D4D202B7;
        Tue, 23 Mar 2021 14:54:01 +0200 (EET)
Date:   Tue, 23 Mar 2021 14:54:00 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, niklas.soderlund@ragnatech.se, bparrot@ti.com,
        mickael.guene@st.com
Subject: Re: [RFC PATCH 4/4] staging: media: omap4iss: use
 v4l2_get_link_freq() to get the external rate
Message-ID: <20210323125400.GA3@paasikivi.fi.intel.com>
References: <20210303180817.12285-1-andrey.konovalov@linaro.org>
 <20210303180817.12285-5-andrey.konovalov@linaro.org>
 <20210305154103.GV3@paasikivi.fi.intel.com>
 <da7f0769-6f12-e895-8cf1-adf915bce64b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da7f0769-6f12-e895-8cf1-adf915bce64b@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey,

On Tue, Mar 09, 2021 at 02:24:41PM +0300, Andrey Konovalov wrote:
> Hi Sakari,
> 
> On 05.03.2021 18:41, Sakari Ailus wrote:
> > Hi Andrey,
> > 
> > Thanks for the set.
> > 
> > On Wed, Mar 03, 2021 at 09:08:17PM +0300, Andrey Konovalov wrote:
> > > This driver uses V4L2_CID_PIXEL_RATE to calculate the CSI2 link frequency,
> > > but this may give incorrect result in some cases. Use v4l2_get_link_freq()
> > > instead.
> > > 
> > > Also the driver used the external_rate field in struct iss_pipeline as a
> > > flag to prevent excessive v4l2_subdev_call's when processing the frames
> > > in single-shot mode. Replace the external_rate with external_lfreq, and
> > > use external_bpp and external_lfreq to call v4l2_subdev_call(get_fmt) and
> > > v4l2_get_link_freq() respectively only once per iss_video_streamon().
> > > 
> > > Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> > > ---
> > >   drivers/staging/media/omap4iss/iss.c        | 12 +-----------
> > >   drivers/staging/media/omap4iss/iss_csiphy.c | 19 ++++++++++++++++---
> > >   drivers/staging/media/omap4iss/iss_video.c  |  2 +-
> > >   drivers/staging/media/omap4iss/iss_video.h  |  2 +-
> > >   4 files changed, 19 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
> > > index dae9073e7d3c..0eb7b1b5dcc4 100644
> > > --- a/drivers/staging/media/omap4iss/iss.c
> > > +++ b/drivers/staging/media/omap4iss/iss.c
> > > @@ -131,7 +131,7 @@ int omap4iss_get_external_info(struct iss_pipeline *pipe,
> > >   	if (!pipe->external)
> > >   		return 0;
> > > -	if (pipe->external_rate)
> > > +	if (pipe->external_bpp)
> > >   		return 0;
> > >   	memset(&fmt, 0, sizeof(fmt));
> > > @@ -145,16 +145,6 @@ int omap4iss_get_external_info(struct iss_pipeline *pipe,
> > >   	pipe->external_bpp = omap4iss_video_format_info(fmt.format.code)->bpp;
> > > -	ctrl = v4l2_ctrl_find(pipe->external->ctrl_handler,
> > > -			      V4L2_CID_PIXEL_RATE);
> > > -	if (!ctrl) {
> > > -		dev_warn(iss->dev, "no pixel rate control in subdev %s\n",
> > > -			 pipe->external->name);
> > > -		return -EPIPE;
> > > -	}
> > > -
> > > -	pipe->external_rate = v4l2_ctrl_g_ctrl_int64(ctrl);
> > > -
> > >   	return 0;
> > >   }
> > > diff --git a/drivers/staging/media/omap4iss/iss_csiphy.c b/drivers/staging/media/omap4iss/iss_csiphy.c
> > > index 96f2ce045138..cec0cd21f7e0 100644
> > > --- a/drivers/staging/media/omap4iss/iss_csiphy.c
> > > +++ b/drivers/staging/media/omap4iss/iss_csiphy.c
> > > @@ -119,6 +119,7 @@ int omap4iss_csiphy_config(struct iss_device *iss,
> > >   	struct iss_pipeline *pipe = to_iss_pipeline(&csi2_subdev->entity);
> > >   	struct iss_v4l2_subdevs_group *subdevs = pipe->external->host_priv;
> > >   	struct iss_csiphy_dphy_cfg csi2phy;
> > > +	s64 link_freq;
> > >   	int csi2_ddrclk_khz;
> > >   	struct iss_csiphy_lanes_cfg *lanes;
> > >   	unsigned int used_lanes = 0;
> > > @@ -193,9 +194,21 @@ int omap4iss_csiphy_config(struct iss_device *iss,
> > >   	if (lanes->clk.pos == 0 || used_lanes & (1 << lanes->clk.pos))
> > >   		return -EINVAL;
> > > -	csi2_ddrclk_khz = pipe->external_rate / 1000
> > > -		/ (2 * csi2->phy->used_data_lanes)
> > > -		* pipe->external_bpp;
> > > +	if (!pipe->external_lfreq) {
> > > +		link_freq = v4l2_get_link_freq(pipe->external->ctrl_handler,
> > 
> > I wonder if you could this unconditionally, and remove external_lfreq field
> > altogether. The same could be done for external_bpp but that's out of scope
> > for this patch.
> 
> Hard to tell.
> This might be possible as all this logic to prevent multiple v4l2_subdev_call(get_fmt)
> and v4l2_get_link_freq() calls per single iss_video_streamon() seems to be needed
> only when ISS operates in memory-to-memory mode. Not sure how link frequency, and
> used_lanes are related to memory-to-memory mode... Will try to find out.

It seems the same pattern is used in the omap3isp driver. Both should be
changed at the same time. May well be out of scope now.

-- 
Kind regards,

Sakari Ailus
