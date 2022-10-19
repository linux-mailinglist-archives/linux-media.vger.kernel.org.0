Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A16B603B74
	for <lists+linux-media@lfdr.de>; Wed, 19 Oct 2022 10:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiJSI3D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Oct 2022 04:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiJSI2x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Oct 2022 04:28:53 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE95A63F24
        for <linux-media@vger.kernel.org>; Wed, 19 Oct 2022 01:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666168132; x=1697704132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Klb7tpaicKYR3KQb/U52YjqYePC7DXX5FaDvY86nBjQ=;
  b=a0JHlG9fjzTtK3xhDO1lO8OaQlpqmZhojhyxq/7ZWQhk2cwumpVydj4X
   j5QH/SXw49av/wGfDnB6jPm9YIu1GIOmtHKJVok5kXNo+nE7k2nrYDIkV
   t6Mge1I1X4HLg/CWm478S4BJg6yQqp4jXNH9aXoLp4gG4jhtcbxntyJbx
   JDwf4C7hhixDD9oHjJmM+rGw2irWj9IwgCvV/+4Gv3olbdL0RqywNf20m
   QfUjqd83oXE2IqOoutiCxwuwxNLT+Ew1YvkDjZ7O5Ib2LjcEVB2y71Hj/
   2QEZYryZA47Rn7cu9ukMzCXfv7py0PjL1kBPmwEUiwdEU3bSSO/D81kl+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="305078998"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; 
   d="scan'208";a="305078998"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 01:28:52 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="629144497"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; 
   d="scan'208";a="629144497"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 01:28:23 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id DCD2D20244;
        Wed, 19 Oct 2022 11:28:20 +0300 (EEST)
Date:   Wed, 19 Oct 2022 08:28:20 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        libcamera-devel@lists.libcamera.org,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        linux-media@vger.kernel.org
Subject: Re: [libcamera-devel] [Camera sensor drivers] Resetting V4L2
 controls after a mode change
Message-ID: <Y0+1JBNe5B5ZmJBk@paasikivi.fi.intel.com>
References: <20221018100005.3brlbe2ps3uphsmp@uno.localdomain>
 <Y0+ckOpaGlAn5n/G@paasikivi.fi.intel.com>
 <20221019065801.4n7alfivhffbvgzo@uno.localdomain>
 <20221019080338.ujphcgqxpzz5fh3e@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019080338.ujphcgqxpzz5fh3e@uno.localdomain>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, Oct 19, 2022 at 10:03:38AM +0200, Jacopo Mondi wrote:
> On Wed, Oct 19, 2022 at 08:58:01AM +0200, Jacopo Mondi via libcamera-devel wrote:
> > Hi Sakari,
> >
> > On Wed, Oct 19, 2022 at 06:43:28AM +0000, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Tue, Oct 18, 2022 at 12:00:05PM +0200, Jacopo Mondi wrote:
> > > > Hello,
> > > >    I'm breaking out a discussion point from a review comment I
> > > > received from Dave on the following patch
> > > > https://lore.kernel.org/linux-media/20221005190613.394277-1-jacopo@jmondi.org/T/#m3308616247d646ebecad89c158a622de35f1cce3
> > > > to collect opinions and possibily define what is the the expected behaviour
> > > > for sensor drivers.
> > > >
> > > > The controls I'm here considering are H/VBLANK and EXPOSURE, but the
> > > > question might generally apply to other controls as well.
> > > >
> > > > To summarize the issue:
> > > >
> > > > When a new mode is applied the blanking controls limits (min/max)
> > > > have to be updated to reflect the new configuration.
> > > >
> > > > In example
> > > >
> > > >        max_hblank = AR0521_TOTAL_WIDTH_MAX - sensor->fmt.width;
> > > >        __v4l2_ctrl_modify_range(sensor->ctrls.hblank,
> > > >                                 sensor->ctrls.hblank->minimum,
> > > >                                 max_hblank, sensor->ctrls.hblank->step,
> > > >                                 sensor->ctrls.hblank->minimum);
> > > >
> > > >        max_vblank = AR0521_TOTAL_HEIGHT_MAX - sensor->fmt.height;
> > > >        __v4l2_ctrl_modify_range(sensor->ctrls.vblank,
> > > >                                 sensor->ctrls.vblank->minimum,
> > > >                                 max_vblank, sensor->ctrls.vblank->step,
> > > >                                 sensor->ctrls.vblank->minimum);
> > > >
> > > > The questions I would like to clarify, and possibily define a standard
> > > > behaviour that userspace can relay on, are:
> > > >
> > > > 1) When a new format is applied to the sensor, should the control value
> > > >    and its default value be updated as well to maintain the same (or as close
> > > >    as possible) configuration as the initial one, or should they be left
> > > >    unchanged (apart for clamping them in the new limits, which is
> > > >    automatically done by the v4l2-controls framework) ?
> > > >
> > > > 2) Can userspace rely on the control default value (set at initialization
> > > >    time and after a mode change) to represent a sensible configuration, in
> > > >    example a tested and known-to-work framerate ?
> > >
> > > What exactly do you mean by a "sensible configuration"?
> > >
> >
> > In the context of blankings, a tested and reasonable FPS (30FPS,
> > 60FPS, not 26.45 FPS).
> >
> > > >
> > > > There are two main arguments in favour or againt resetting controls
> > > > when a new mode is applied. The obvious one in favour is that when a
> > > > new mode is applied, userspace can rely on a default configuration
> > > > that is reasonable and known to work and the control default value
> > > > can be used a reference if the control is later modified during
> > > > streaming. Also, not resetting controls can leave the sensor driver in
> > > > an unspecified (but hopefully valid) state (see Laurent's example in [1])
> > >
> > > The control values should remain valid and this needs to be ensured by the
> > > driver.
> >
> > Doesn't the v4l2-ctrl framework clamp the control value in the new
> > ranges in __v4l2_ctrl_modify_range() ?

Yes, it does.

> >
> > >
> > > E.g. the CCS driver just changes the range (as above) as it is oblivious to
> > > modes.
> > >
> > > I don't object resetting the values to defaults (or changing defaults) in
> > > mode based drivers *if* that's helpful for the user space. In general
> > > controls and other sensor configurations should be independent but
> > > obviously when it comes to e.g. the blanking controls, there is a
> > > dependency.
> > >
> >
> > The fact is that "I don't object" either, but I think we need
> > guidelines here. I understand the issue here is what a "sensible
> > configuration" mean. Please note this is now well defined neither at
> 
> I meant "not well defined", sorry, pointing it out as it changes the
> meaning of the statement..
> 
> > initialization time when picking a default value to initialize the
> > control with. But as I assume the default, for blankings at least,
> > corresponds to some tested configuration, I think we should require
> > sensor driver to reset the control to a value that realize the same
> > configuration selected at initialization time.

That would end up setting the pixel order as well (due to flipping
controls). I wonder how many would see this as desirable.

As noted, I don't object doing this in new drivers e.g. for the blanking
controls that likely change anyway but I think it'd be better if the user
space specified those values explicitly.

I wonder what Laurent thinks.

> >
> > > >
> > > > This mostly benefits 'generic' userspace which is not interested in
> > > > modifying blankings, but also provide 'specialized' userspace a
> > > > reference to compute a default configuration which is known to work.
> > > >
> > > > However, on the other hand, such a behaviour would prevent (or make
> > > > harder) concurrent access to the camera from different applications.
> > > > The most trivial example is a camera viewer that does not control
> > > > blankings, which are side-configured by the user through another
> > > > application (say, v4l2-ctl). In this case, when a mode is set on the
> > > > sensor the blanking values are reset, overwriting the manually applied
> > > > configuration. This is a common use case when developing, when
> > > > a configuration is forced on the sensor to validate it, but it's a valid use
> > > > case in general, as a mode configuration would then actually
> > > > overwrite other parameters that might be considered "unrelated" to the
> > > > output resolution and format.
> > > >
> > > > Once we establish an expected behaviour, should we try to document it
> > > > and possibly enforce it in sensor drivers through reviews and
> > > > hopefully by providing helpers ? Whatever the decision ends up being
> > > > I think we want to standardize sensor drivers to behave the same.
> > > >
> > > > Thanks
> > > >    j
> > > >
> > > > [1] https://lists.libcamera.org/pipermail/libcamera-devel/2022-October/034885.html
> > > > " Consider a case with two modes, lores and hires. As
> > > > sensors typically express horizontal blanking as a horizontal total
> > > > size, the hblank control max value will be larger for lores than hires.
> > > > If the sensor were to set the default hblank to a value valid for lores
> > > > but not hires, switching from lores -> hires -> lores would change the
> > > > effective hblank value even if userspace doesn't touch the hblank
> > > > control at all."
> > >
> > > --
> > > Kind regards,
> > >
> > > Sakari Ailus

-- 
Kind regards,

Sakari Ailus
