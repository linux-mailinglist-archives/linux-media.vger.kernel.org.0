Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C862B7E7C
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 14:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgKRNpn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 08:45:43 -0500
Received: from mga17.intel.com ([192.55.52.151]:15165 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725613AbgKRNpn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 08:45:43 -0500
IronPort-SDR: BWVf8U4j+thSEvMxaSAn2Tm2QV2v6Xyb/r1sDCtZvhg2Nbx7I5DDpuiKMWI5mkhsvc7io2BjCl
 NXmXp2Kg7wYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="150962053"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="150962053"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 05:45:40 -0800
IronPort-SDR: hG3B2FMDhC7p1xyKaPc2izwZ/DMeSA2XxJVRLjHeYK/3NQNSFypbD6NTpY+MXwjy524o3FEElC
 xl3u4JV4OjoQ==
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; 
   d="scan'208";a="330504046"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 05:45:38 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 9BC8C20808; Wed, 18 Nov 2020 15:45:36 +0200 (EET)
Date:   Wed, 18 Nov 2020 15:45:36 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        senozhatsky@chromium.org, tfiga@chromium.org,
        tian.shu.qiu@intel.com
Subject: Re: [PATCH] media: i2c: Add ov9734 image sensor driver
Message-ID: <20201118134536.GH3940@paasikivi.fi.intel.com>
References: <1603940341-25224-1-git-send-email-bingbu.cao@intel.com>
 <X7OEysbnAhTXEmUq@jagdpanzerIV.localdomain>
 <439d549d-1069-cd35-4c18-586ba4e52756@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <439d549d-1069-cd35-4c18-586ba4e52756@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu, Sergey,

On Tue, Nov 17, 2020 at 07:29:08PM +0800, Bingbu Cao wrote:
> Sergey, thanks for review.
> 
> On 11/17/20 4:07 PM, Sergey Senozhatsky wrote:
> > On (20/10/29 10:59), Bingbu Cao wrote:
> > [..]
> > 
> > Looks good to me,
> > Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > 
> > Several comments below.
> > 
> >> +static int ov9734_set_ctrl(struct v4l2_ctrl *ctrl)
> >> +{
> >> +	struct ov9734 *ov9734 = container_of(ctrl->handler,
> >> +					     struct ov9734, ctrl_handler);
> >> +	struct i2c_client *client = v4l2_get_subdevdata(&ov9734->sd);
> >> +	s64 exposure_max;
> >> +	int ret = 0;
> >> +
> >> +	/* Propagate change of current control to all related controls */
> >> +	if (ctrl->id == V4L2_CID_VBLANK) {
> >> +		/* Update max exposure while meeting expected vblanking */
> >> +		exposure_max = ov9734->cur_mode->height + ctrl->val -
> >> +			OV9734_EXPOSURE_MAX_MARGIN;
> >> +		__v4l2_ctrl_modify_range(ov9734->exposure,
> >> +					 ov9734->exposure->minimum,
> >> +					 exposure_max, ov9734->exposure->step,
> >> +					 exposure_max);
> >> +	}
> > 
> > Should this be done after pm_runtime_get_if_in_use()?
> 
> My inaccurate understanding - as v4l2 see that this control was set by sub-device without error,
> so it will record the value from the user as the new value, so update the exposure range to
> allow user to set the exposure as well even it did not take affect.
> 
> Sakari, do you have any comments about this?

Just changing the range does not require powering on the device. So this is
as intended AFAIU.


-- 
Regards,

Sakari Ailus
