Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84CDF24F681
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 11:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730256AbgHXJAw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 05:00:52 -0400
Received: from mga07.intel.com ([134.134.136.100]:19539 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730540AbgHXJAg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 05:00:36 -0400
IronPort-SDR: 5mTunCxYyfA/TJDtu5PkDnEujgQKVaPQY/0/6smDEo+UBqTwbI7+9LOJxWhyD4dfLcGl/n2XVw
 34wfTd5zrJ0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="220133837"
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="220133837"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2020 02:00:34 -0700
IronPort-SDR: JuqnD44J1eJdSKI6zzkgpTxrztwan09yZVzhN3w+XuxxZh7yu4t//Y9awDbVyLzdS8ZgUF0u4G
 6N2GFakP5zHw==
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="281122830"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2020 02:00:32 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id AA9112073D; Mon, 24 Aug 2020 12:00:30 +0300 (EEST)
Date:   Mon, 24 Aug 2020 12:00:30 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        shawnx.tu@intel.com, Sergey Senozhatsky <senozhatsky@chromium.org>,
        hongju.wang@intel.com
Subject: Re: [PATCH v2] media: ov5675: correct the maximum exposure value
Message-ID: <20200824090030.GD24582@paasikivi.fi.intel.com>
References: <1597996790-21121-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5DQR-HmFkgPk5mhTcoODEoAamhP0EO_YQR04SGQnuZp_w@mail.gmail.com>
 <caac1db9-412c-bb92-9670-dbef35d09374@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caac1db9-412c-bb92-9670-dbef35d09374@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Mon, Aug 24, 2020 at 11:13:40AM +0800, Bingbu Cao wrote:
> 
> 
> On 8/22/20 11:03 PM, Tomasz Figa wrote:
> > Hi Bingbu,
> > 
> > On Fri, Aug 21, 2020 at 10:00 AM Bingbu Cao <bingbu.cao@intel.com> wrote:
> >>
> >> The unit of exposure value is different from other OmniVision sensors,
> >> driver will divide by 2 before set register, the exposure range exposed
> >> by v4l2 ctrl to user should be same as others, so the calculation for
> >> the maximum exposure value in current driver need be fixed.
> >>
> >> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> >> ---
> >>  drivers/media/i2c/ov5675.c | 15 ++++++++++-----
> >>  1 file changed, 10 insertions(+), 5 deletions(-)
> >>
> > 
> > Thanks for the patch! Please see my comments inline.
> > 
> >> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> >> index 8537cc4ca108..9540ce8918f0 100644
> >> --- a/drivers/media/i2c/ov5675.c
> >> +++ b/drivers/media/i2c/ov5675.c
> >> @@ -666,8 +666,8 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
> >>         /* Propagate change of current control to all related controls */
> >>         if (ctrl->id == V4L2_CID_VBLANK) {
> >>                 /* Update max exposure while meeting expected vblanking */
> >> -               exposure_max = (ov5675->cur_mode->height + ctrl->val -
> >> -                              OV5675_EXPOSURE_MAX_MARGIN) / 2;
> >> +               exposure_max = ov5675->cur_mode->height + ctrl->val -
> >> +                       OV5675_EXPOSURE_MAX_MARGIN;
> >>                 __v4l2_ctrl_modify_range(ov5675->exposure,
> >>                                          ov5675->exposure->minimum,
> >>                                          exposure_max, ov5675->exposure->step,
> >> @@ -689,7 +689,13 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
> >>                 break;
> >>
> >>         case V4L2_CID_EXPOSURE:
> >> -               /* 3 least significant bits of expsoure are fractional part */
> >> +               /* 4 least significant bits of expsoure are fractional part
> > 
> > exposure
> > 
> >> +                * val = val << 4
> >> +                * for ov5675, the unit of exposure is differnt from other
> > 
> > different
> > 
> >> +                * OmniVision sensors, its exposure value is twice of the
> >> +                * register value, the exposure should be divided by 2 before
> >> +                * set register, e.g. val << 3.
> >> +                */
> >>                 ret = ov5675_write_reg(ov5675, OV5675_REG_EXPOSURE,
> >>                                        OV5675_REG_VALUE_24BIT, ctrl->val << 3);
> > 
> > How about turning this code into (ctrl->val << 4) / 2 ? It will be
> > compiled into exactly the same code, but will be obvious that we are
> > handling two different factors in the computation.
> > 
> > Another question: Since the V4L2_CID_EXPOSURE control is not specified
> > to be in a particular unit and hardware supports fractional exposures,
> > why not expose the exposure exactly as it is in the register?
> My understanding is that the exposure calculation in userspace is commonly based
> on the unit of exposure - line, as some sensor did not support fractional
> exposures, so the common calculation only care the integral part. For ov5675, it
> is different from others, its register value unit is 2lines instead of lines.
> 
> Sakari, do you have some idea?

I've already sent v2 in a pull request to Mauro. So if changes are needed
still, please send them on top of v2.

Line is commonly used for devices that natively use it (vast majority of
raw Bayer camera sensors). So if possible, I'd use the same here. I.e. with
two line granularity, the exposure value could be in lines and the step
would be 2.

-- 
Regards,

Sakari Ailus
