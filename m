Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D34216028E7
	for <lists+linux-media@lfdr.de>; Tue, 18 Oct 2022 12:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiJRKAT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Oct 2022 06:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiJRKAP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Oct 2022 06:00:15 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D6A3ECE8
        for <linux-media@vger.kernel.org>; Tue, 18 Oct 2022 03:00:10 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 39F25FF80C;
        Tue, 18 Oct 2022 10:00:06 +0000 (UTC)
Date:   Tue, 18 Oct 2022 12:00:05 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        libcamera-devel@lists.libcamera.org
Subject: [Camera sensor drivers] Resetting V4L2 controls after a mode change
Message-ID: <20221018100005.3brlbe2ps3uphsmp@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   I'm breaking out a discussion point from a review comment I
received from Dave on the following patch
https://lore.kernel.org/linux-media/20221005190613.394277-1-jacopo@jmondi.org/T/#m3308616247d646ebecad89c158a622de35f1cce3
to collect opinions and possibily define what is the the expected behaviour
for sensor drivers.

The controls I'm here considering are H/VBLANK and EXPOSURE, but the
question might generally apply to other controls as well.

To summarize the issue:

When a new mode is applied the blanking controls limits (min/max)
have to be updated to reflect the new configuration.

In example

       max_hblank = AR0521_TOTAL_WIDTH_MAX - sensor->fmt.width;
       __v4l2_ctrl_modify_range(sensor->ctrls.hblank,
                                sensor->ctrls.hblank->minimum,
                                max_hblank, sensor->ctrls.hblank->step,
                                sensor->ctrls.hblank->minimum);

       max_vblank = AR0521_TOTAL_HEIGHT_MAX - sensor->fmt.height;
       __v4l2_ctrl_modify_range(sensor->ctrls.vblank,
                                sensor->ctrls.vblank->minimum,
                                max_vblank, sensor->ctrls.vblank->step,
                                sensor->ctrls.vblank->minimum);

The questions I would like to clarify, and possibily define a standard
behaviour that userspace can relay on, are:

1) When a new format is applied to the sensor, should the control value
   and its default value be updated as well to maintain the same (or as close
   as possible) configuration as the initial one, or should they be left
   unchanged (apart for clamping them in the new limits, which is
   automatically done by the v4l2-controls framework) ?

2) Can userspace rely on the control default value (set at initialization
   time and after a mode change) to represent a sensible configuration, in
   example a tested and known-to-work framerate ?

There are two main arguments in favour or againt resetting controls
when a new mode is applied. The obvious one in favour is that when a
new mode is applied, userspace can rely on a default configuration
that is reasonable and known to work and the control default value
can be used a reference if the control is later modified during
streaming. Also, not resetting controls can leave the sensor driver in
an unspecified (but hopefully valid) state (see Laurent's example in [1])

This mostly benefits 'generic' userspace which is not interested in
modifying blankings, but also provide 'specialized' userspace a
reference to compute a default configuration which is known to work.

However, on the other hand, such a behaviour would prevent (or make
harder) concurrent access to the camera from different applications.
The most trivial example is a camera viewer that does not control
blankings, which are side-configured by the user through another
application (say, v4l2-ctl). In this case, when a mode is set on the
sensor the blanking values are reset, overwriting the manually applied
configuration. This is a common use case when developing, when
a configuration is forced on the sensor to validate it, but it's a valid use
case in general, as a mode configuration would then actually
overwrite other parameters that might be considered "unrelated" to the
output resolution and format.

Once we establish an expected behaviour, should we try to document it
and possibly enforce it in sensor drivers through reviews and
hopefully by providing helpers ? Whatever the decision ends up being
I think we want to standardize sensor drivers to behave the same.

Thanks
   j

[1] https://lists.libcamera.org/pipermail/libcamera-devel/2022-October/034885.html
" Consider a case with two modes, lores and hires. As
sensors typically express horizontal blanking as a horizontal total
size, the hblank control max value will be larger for lores than hires.
If the sensor were to set the default hblank to a value valid for lores
but not hires, switching from lores -> hires -> lores would change the
effective hblank value even if userspace doesn't touch the hblank
control at all."
