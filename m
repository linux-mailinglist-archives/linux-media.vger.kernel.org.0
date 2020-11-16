Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A65452B4504
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 14:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728667AbgKPNuZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 08:50:25 -0500
Received: from mga05.intel.com ([192.55.52.43]:39860 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727248AbgKPNuZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 08:50:25 -0500
IronPort-SDR: SKkudBSW7IRMDmT44GOjVcDH2LjaLy1XdRhmTTqUs1qwyvvDlssQjZwqE7F9a2FGCabC8LNvVQ
 NkiuCzTa29cg==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="255456179"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="255456179"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 05:50:20 -0800
IronPort-SDR: iWX6K9iU8GNx4K1MBPSZpa+MWJKKf0aeTiG/zcp9YA37jQFTzav66wqlC12SlwqcJADKddPpyC
 Gsw1+a8JzH1g==
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="329681466"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 05:50:19 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id C9DAD208C5; Mon, 16 Nov 2020 15:50:16 +0200 (EET)
Date:   Mon, 16 Nov 2020 15:50:16 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 105/106] ccs: Add shading correction and luminance
 correction level controls
Message-ID: <20201116135016.GA3940@paasikivi.fi.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-96-sakari.ailus@linux.intel.com>
 <eaf54ce4-54c5-6d1e-e8a1-29c6346dab04@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eaf54ce4-54c5-6d1e-e8a1-29c6346dab04@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Nov 05, 2020 at 02:03:37PM +0100, Hans Verkuil wrote:
> On 07/10/2020 10:45, Sakari Ailus wrote:

...

> > +			.name = "Luminance Shading Correction",
> > +			.type = V4L2_CTRL_TYPE_BOOLEAN,
> > +			.id = V4L2_CID_CCS_LUMINANCE_SHADING_CORRECTION,
> > +			.ops = &ccs_ctrl_ops,
> > +			.max = 255,
> > +			.step = 1,
> > +			.def = 128,
> > +		};
> > +
> > +		v4l2_ctrl_new_custom(&sensor->pixel_array->ctrl_handler,
> > +				     &ctrl_cfg, NULL);
> > +	}
> > +
> > +	if (CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
> > +	    (CCS_SHADING_CORRECTION_CAPABILITY_COLOR_SHADING |
> > +	     CCS_SHADING_CORRECTION_CAPABILITY_LUMINANCE_CORRECTION)) {
> > +		u32 val =
> > +			((CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
> > +			  CCS_SHADING_CORRECTION_CAPABILITY_COLOR_SHADING) ?
> > +			 V4L2_CCS_SHADING_CORRECTION_COLOUR : 0) |
> > +			((CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
> > +			   CCS_SHADING_CORRECTION_CAPABILITY_LUMINANCE_CORRECTION) ?
> > +			 V4L2_CCS_SHADING_CORRECTION_LUMINANCE : 0);
> > +		const struct v4l2_ctrl_config ctrl_cfg = {
> > +			.name = "Shading Correction Capability",
> > +			.type = V4L2_CTRL_TYPE_BITMASK,
> > +			.id = V4L2_CID_CCS_SHADING_CORRECTION_CAPABILITY,
> > +			.ops = &ccs_ctrl_ops,
> > +			.max = val,
> > +			.def = val,
> > +			.flags = V4L2_CTRL_FLAG_READ_ONLY,
> > +		};
> 
> Is this needed? If e.g. V4L2_CCS_SHADING_CORRECTION_COLOUR is not supported,
> then the V4L2_CID_CCS_SHADING_CORRECTION control is simply not created.
> So calling VIDIOC_QUERYCTRL would simply fail and so indicate that this
> capability is not present.
> 
> If it really is needed, then having two bool controls makes more sense
> because a bitmask is less intuitive.

The CCS shading correction support has two capabilities but one bit to
control both. Another (luminance correction) has the correction level
(buggy in this patch, I'll fix for v4), so two controls aren't enough to
tell what is being corrected; is it colour shading or not? Luminance
correction level support is revealed by the luminance correction level
control as well.

So I guess you could also have a boolean control to tell colour correction
is supported.

I guess could also just omit the capability control now and see if someone
needs it. I'd expect this to be rarely needed information.

-- 
Kind regards,

Sakari Ailus
