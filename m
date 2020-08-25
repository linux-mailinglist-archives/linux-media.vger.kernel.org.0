Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC242252249
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 22:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgHYU5R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 16:57:17 -0400
Received: from mga14.intel.com ([192.55.52.115]:21876 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbgHYU5Q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 16:57:16 -0400
IronPort-SDR: N0rjohj8AKe5lVu3lmA7nIdPc2To7WyhHDfsNvUEN5wf1kLlhdJjjWB8YjHKccAnSHxxBsW6r8
 BL9BVd6bV3iA==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="155455273"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; 
   d="scan'208";a="155455273"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2020 13:57:15 -0700
IronPort-SDR: 39nrnf0ku6pou51mNYu5lpNkr+HA5LIMFe+Z5I1Et6muzYCpcgq2S3wFVekVJsEZpSrJeiAgqX
 51TSWG90GqfA==
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; 
   d="scan'208";a="402849538"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2020 13:57:14 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E90B42073E; Tue, 25 Aug 2020 23:57:11 +0300 (EEST)
Date:   Tue, 25 Aug 2020 23:57:11 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        shawnx.tu@intel.com, Sergey Senozhatsky <senozhatsky@chromium.org>,
        hongju.wang@intel.com
Subject: Re: [PATCH v2] media: ov5675: correct the maximum exposure value
Message-ID: <20200825205711.GF24582@paasikivi.fi.intel.com>
References: <1597996790-21121-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5DQR-HmFkgPk5mhTcoODEoAamhP0EO_YQR04SGQnuZp_w@mail.gmail.com>
 <caac1db9-412c-bb92-9670-dbef35d09374@linux.intel.com>
 <20200824090030.GD24582@paasikivi.fi.intel.com>
 <CAAFQd5CPk7OPM75dC+xWMwUSpuZfrwwfhR6L=639ZQr7=akzjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5CPk7OPM75dC+xWMwUSpuZfrwwfhR6L=639ZQr7=akzjw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 24, 2020 at 03:23:21PM +0200, Tomasz Figa wrote:
> On Mon, Aug 24, 2020 at 11:00 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Bingbu,
> >
> > On Mon, Aug 24, 2020 at 11:13:40AM +0800, Bingbu Cao wrote:
> > >
> > >
> > > On 8/22/20 11:03 PM, Tomasz Figa wrote:
> > > > Hi Bingbu,
> > > >
> > > > On Fri, Aug 21, 2020 at 10:00 AM Bingbu Cao <bingbu.cao@intel.com> wrote:
> > > >>
> > > >> The unit of exposure value is different from other OmniVision sensors,
> > > >> driver will divide by 2 before set register, the exposure range exposed
> > > >> by v4l2 ctrl to user should be same as others, so the calculation for
> > > >> the maximum exposure value in current driver need be fixed.
> > > >>
> > > >> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > > >> ---
> > > >>  drivers/media/i2c/ov5675.c | 15 ++++++++++-----
> > > >>  1 file changed, 10 insertions(+), 5 deletions(-)
> > > >>
> > > >
> > > > Thanks for the patch! Please see my comments inline.
> > > >
> > > >> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> > > >> index 8537cc4ca108..9540ce8918f0 100644
> > > >> --- a/drivers/media/i2c/ov5675.c
> > > >> +++ b/drivers/media/i2c/ov5675.c
> > > >> @@ -666,8 +666,8 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
> > > >>         /* Propagate change of current control to all related controls */
> > > >>         if (ctrl->id == V4L2_CID_VBLANK) {
> > > >>                 /* Update max exposure while meeting expected vblanking */
> > > >> -               exposure_max = (ov5675->cur_mode->height + ctrl->val -
> > > >> -                              OV5675_EXPOSURE_MAX_MARGIN) / 2;
> > > >> +               exposure_max = ov5675->cur_mode->height + ctrl->val -
> > > >> +                       OV5675_EXPOSURE_MAX_MARGIN;
> > > >>                 __v4l2_ctrl_modify_range(ov5675->exposure,
> > > >>                                          ov5675->exposure->minimum,
> > > >>                                          exposure_max, ov5675->exposure->step,
> > > >> @@ -689,7 +689,13 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
> > > >>                 break;
> > > >>
> > > >>         case V4L2_CID_EXPOSURE:
> > > >> -               /* 3 least significant bits of expsoure are fractional part */
> > > >> +               /* 4 least significant bits of expsoure are fractional part
> > > >
> > > > exposure
> > > >
> > > >> +                * val = val << 4
> > > >> +                * for ov5675, the unit of exposure is differnt from other
> > > >
> > > > different
> > > >
> > > >> +                * OmniVision sensors, its exposure value is twice of the
> > > >> +                * register value, the exposure should be divided by 2 before
> > > >> +                * set register, e.g. val << 3.
> > > >> +                */
> > > >>                 ret = ov5675_write_reg(ov5675, OV5675_REG_EXPOSURE,
> > > >>                                        OV5675_REG_VALUE_24BIT, ctrl->val << 3);
> > > >
> > > > How about turning this code into (ctrl->val << 4) / 2 ? It will be
> > > > compiled into exactly the same code, but will be obvious that we are
> > > > handling two different factors in the computation.
> > > >
> > > > Another question: Since the V4L2_CID_EXPOSURE control is not specified
> > > > to be in a particular unit and hardware supports fractional exposures,
> > > > why not expose the exposure exactly as it is in the register?
> > > My understanding is that the exposure calculation in userspace is commonly based
> > > on the unit of exposure - line, as some sensor did not support fractional
> > > exposures, so the common calculation only care the integral part. For ov5675, it
> > > is different from others, its register value unit is 2lines instead of lines.
> > >
> > > Sakari, do you have some idea?
> >
> > I've already sent v2 in a pull request to Mauro. So if changes are needed
> > still, please send them on top of v2.
> >
> > Line is commonly used for devices that natively use it (vast majority of
> > raw Bayer camera sensors). So if possible, I'd use the same here. I.e. with
> > two line granularity, the exposure value could be in lines and the step
> > would be 2.
> 
> The sensor unit seems to be 1/8 of a line, so by exposing it from the
> driver as an integer in the unit of lines, we end up losing some
> precision. I'm not sure how relevant it is for image quality, though.

Oh well. Generally it's time consuming to update the registers over I²C and
the more registers you add, the higher the likelihood is to miss doing that
in time. That's why the common pattern of lines / pixels matches really
well with this as both exposure (and the supposedly added fine exposure
control, when needed) match with the registers and control units.

I don't have a perfect answer for this. You could do either. I think I'd be
in favour of keeping the exposure in lines so that the frame rate
calculation works as expected, and adding a fine exposure control if
needed. Does the sub-line exposure value include horizontal blanking?

-- 
Regards,

Sakari Ailus
