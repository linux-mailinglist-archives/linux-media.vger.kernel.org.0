Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2038B603B18
	for <lists+linux-media@lfdr.de>; Wed, 19 Oct 2022 10:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbiJSIDt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Oct 2022 04:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbiJSIDs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Oct 2022 04:03:48 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B207B785
        for <linux-media@vger.kernel.org>; Wed, 19 Oct 2022 01:03:46 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 806AD2000B;
        Wed, 19 Oct 2022 08:03:41 +0000 (UTC)
Date:   Wed, 19 Oct 2022 10:03:38 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        libcamera-devel@lists.libcamera.org,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        linux-media@vger.kernel.org
Subject: Re: [libcamera-devel] [Camera sensor drivers] Resetting V4L2
 controls after a mode change
Message-ID: <20221019080338.ujphcgqxpzz5fh3e@uno.localdomain>
References: <20221018100005.3brlbe2ps3uphsmp@uno.localdomain>
 <Y0+ckOpaGlAn5n/G@paasikivi.fi.intel.com>
 <20221019065801.4n7alfivhffbvgzo@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221019065801.4n7alfivhffbvgzo@uno.localdomain>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 19, 2022 at 08:58:01AM +0200, Jacopo Mondi via libcamera-devel wrote:
> Hi Sakari,
>
> On Wed, Oct 19, 2022 at 06:43:28AM +0000, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Tue, Oct 18, 2022 at 12:00:05PM +0200, Jacopo Mondi wrote:
> > > Hello,
> > >    I'm breaking out a discussion point from a review comment I
> > > received from Dave on the following patch
> > > https://lore.kernel.org/linux-media/20221005190613.394277-1-jacopo@jmondi.org/T/#m3308616247d646ebecad89c158a622de35f1cce3
> > > to collect opinions and possibily define what is the the expected behaviour
> > > for sensor drivers.
> > >
> > > The controls I'm here considering are H/VBLANK and EXPOSURE, but the
> > > question might generally apply to other controls as well.
> > >
> > > To summarize the issue:
> > >
> > > When a new mode is applied the blanking controls limits (min/max)
> > > have to be updated to reflect the new configuration.
> > >
> > > In example
> > >
> > >        max_hblank = AR0521_TOTAL_WIDTH_MAX - sensor->fmt.width;
> > >        __v4l2_ctrl_modify_range(sensor->ctrls.hblank,
> > >                                 sensor->ctrls.hblank->minimum,
> > >                                 max_hblank, sensor->ctrls.hblank->step,
> > >                                 sensor->ctrls.hblank->minimum);
> > >
> > >        max_vblank = AR0521_TOTAL_HEIGHT_MAX - sensor->fmt.height;
> > >        __v4l2_ctrl_modify_range(sensor->ctrls.vblank,
> > >                                 sensor->ctrls.vblank->minimum,
> > >                                 max_vblank, sensor->ctrls.vblank->step,
> > >                                 sensor->ctrls.vblank->minimum);
> > >
> > > The questions I would like to clarify, and possibily define a standard
> > > behaviour that userspace can relay on, are:
> > >
> > > 1) When a new format is applied to the sensor, should the control value
> > >    and its default value be updated as well to maintain the same (or as close
> > >    as possible) configuration as the initial one, or should they be left
> > >    unchanged (apart for clamping them in the new limits, which is
> > >    automatically done by the v4l2-controls framework) ?
> > >
> > > 2) Can userspace rely on the control default value (set at initialization
> > >    time and after a mode change) to represent a sensible configuration, in
> > >    example a tested and known-to-work framerate ?
> >
> > What exactly do you mean by a "sensible configuration"?
> >
>
> In the context of blankings, a tested and reasonable FPS (30FPS,
> 60FPS, not 26.45 FPS).
>
> > >
> > > There are two main arguments in favour or againt resetting controls
> > > when a new mode is applied. The obvious one in favour is that when a
> > > new mode is applied, userspace can rely on a default configuration
> > > that is reasonable and known to work and the control default value
> > > can be used a reference if the control is later modified during
> > > streaming. Also, not resetting controls can leave the sensor driver in
> > > an unspecified (but hopefully valid) state (see Laurent's example in [1])
> >
> > The control values should remain valid and this needs to be ensured by the
> > driver.
>
> Doesn't the v4l2-ctrl framework clamp the control value in the new
> ranges in __v4l2_ctrl_modify_range() ?
>
> >
> > E.g. the CCS driver just changes the range (as above) as it is oblivious to
> > modes.
> >
> > I don't object resetting the values to defaults (or changing defaults) in
> > mode based drivers *if* that's helpful for the user space. In general
> > controls and other sensor configurations should be independent but
> > obviously when it comes to e.g. the blanking controls, there is a
> > dependency.
> >
>
> The fact is that "I don't object" either, but I think we need
> guidelines here. I understand the issue here is what a "sensible
> configuration" mean. Please note this is now well defined neither at

I meant "not well defined", sorry, pointing it out as it changes the
meaning of the statement..

> initialization time when picking a default value to initialize the
> control with. But as I assume the default, for blankings at least,
> corresponds to some tested configuration, I think we should require
> sensor driver to reset the control to a value that realize the same
> configuration selected at initialization time.
>
> > >
> > > This mostly benefits 'generic' userspace which is not interested in
> > > modifying blankings, but also provide 'specialized' userspace a
> > > reference to compute a default configuration which is known to work.
> > >
> > > However, on the other hand, such a behaviour would prevent (or make
> > > harder) concurrent access to the camera from different applications.
> > > The most trivial example is a camera viewer that does not control
> > > blankings, which are side-configured by the user through another
> > > application (say, v4l2-ctl). In this case, when a mode is set on the
> > > sensor the blanking values are reset, overwriting the manually applied
> > > configuration. This is a common use case when developing, when
> > > a configuration is forced on the sensor to validate it, but it's a valid use
> > > case in general, as a mode configuration would then actually
> > > overwrite other parameters that might be considered "unrelated" to the
> > > output resolution and format.
> > >
> > > Once we establish an expected behaviour, should we try to document it
> > > and possibly enforce it in sensor drivers through reviews and
> > > hopefully by providing helpers ? Whatever the decision ends up being
> > > I think we want to standardize sensor drivers to behave the same.
> > >
> > > Thanks
> > >    j
> > >
> > > [1] https://lists.libcamera.org/pipermail/libcamera-devel/2022-October/034885.html
> > > " Consider a case with two modes, lores and hires. As
> > > sensors typically express horizontal blanking as a horizontal total
> > > size, the hblank control max value will be larger for lores than hires.
> > > If the sensor were to set the default hblank to a value valid for lores
> > > but not hires, switching from lores -> hires -> lores would change the
> > > effective hblank value even if userspace doesn't touch the hblank
> > > control at all."
> >
> > --
> > Kind regards,
> >
> > Sakari Ailus
