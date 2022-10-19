Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF3A16039FA
	for <lists+linux-media@lfdr.de>; Wed, 19 Oct 2022 08:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbiJSGnf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Oct 2022 02:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiJSGne (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Oct 2022 02:43:34 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B6373C04
        for <linux-media@vger.kernel.org>; Tue, 18 Oct 2022 23:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666161813; x=1697697813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q+BVOnjUL89xtOoU2nq6PhkP9X6jIEWMAtBin+YDRUU=;
  b=hR5eGcDI5I9MSkGgiRBZAnfF3xXojtNaoYf6E6KRNVZ5SBpHQxxnM9m9
   KhMIe6EOdx0NGpqf0x5h6MK/im7/IiHNNHbCPCsk/uo0BZALwWiLAZTS1
   Ia1V2Bm2QNeL7dMcvrvbRDwTsk5m3UhIbaERnK4w1Je4EJs9MFs2NHFfZ
   ebpQqypylUOPWZUWexpvUynRWjdwDZYky/IFOwiX95IdzLGFphWTwriaF
   440RniRyS+0zHyZL9iDK33caGtDS/FpdDI/I3Rdd24+JvsdCcStpX8lSK
   h8Gsq6bJOZO4VWpnbBJ1pQD/9i/56d9l/VmFuZjlb3NnP7s/+67ppXoB2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="370541470"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; 
   d="scan'208";a="370541470"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 23:43:32 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="754428875"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; 
   d="scan'208";a="754428875"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 23:43:30 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 6D15C20244;
        Wed, 19 Oct 2022 09:43:28 +0300 (EEST)
Date:   Wed, 19 Oct 2022 06:43:28 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        libcamera-devel@lists.libcamera.org
Subject: Re: [Camera sensor drivers] Resetting V4L2 controls after a mode
 change
Message-ID: <Y0+ckOpaGlAn5n/G@paasikivi.fi.intel.com>
References: <20221018100005.3brlbe2ps3uphsmp@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018100005.3brlbe2ps3uphsmp@uno.localdomain>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Oct 18, 2022 at 12:00:05PM +0200, Jacopo Mondi wrote:
> Hello,
>    I'm breaking out a discussion point from a review comment I
> received from Dave on the following patch
> https://lore.kernel.org/linux-media/20221005190613.394277-1-jacopo@jmondi.org/T/#m3308616247d646ebecad89c158a622de35f1cce3
> to collect opinions and possibily define what is the the expected behaviour
> for sensor drivers.
> 
> The controls I'm here considering are H/VBLANK and EXPOSURE, but the
> question might generally apply to other controls as well.
> 
> To summarize the issue:
> 
> When a new mode is applied the blanking controls limits (min/max)
> have to be updated to reflect the new configuration.
> 
> In example
> 
>        max_hblank = AR0521_TOTAL_WIDTH_MAX - sensor->fmt.width;
>        __v4l2_ctrl_modify_range(sensor->ctrls.hblank,
>                                 sensor->ctrls.hblank->minimum,
>                                 max_hblank, sensor->ctrls.hblank->step,
>                                 sensor->ctrls.hblank->minimum);
> 
>        max_vblank = AR0521_TOTAL_HEIGHT_MAX - sensor->fmt.height;
>        __v4l2_ctrl_modify_range(sensor->ctrls.vblank,
>                                 sensor->ctrls.vblank->minimum,
>                                 max_vblank, sensor->ctrls.vblank->step,
>                                 sensor->ctrls.vblank->minimum);
> 
> The questions I would like to clarify, and possibily define a standard
> behaviour that userspace can relay on, are:
> 
> 1) When a new format is applied to the sensor, should the control value
>    and its default value be updated as well to maintain the same (or as close
>    as possible) configuration as the initial one, or should they be left
>    unchanged (apart for clamping them in the new limits, which is
>    automatically done by the v4l2-controls framework) ?
> 
> 2) Can userspace rely on the control default value (set at initialization
>    time and after a mode change) to represent a sensible configuration, in
>    example a tested and known-to-work framerate ?

What exactly do you mean by a "sensible configuration"?

> 
> There are two main arguments in favour or againt resetting controls
> when a new mode is applied. The obvious one in favour is that when a
> new mode is applied, userspace can rely on a default configuration
> that is reasonable and known to work and the control default value
> can be used a reference if the control is later modified during
> streaming. Also, not resetting controls can leave the sensor driver in
> an unspecified (but hopefully valid) state (see Laurent's example in [1])

The control values should remain valid and this needs to be ensured by the
driver.

E.g. the CCS driver just changes the range (as above) as it is oblivious to
modes.

I don't object resetting the values to defaults (or changing defaults) in
mode based drivers *if* that's helpful for the user space. In general
controls and other sensor configurations should be independent but
obviously when it comes to e.g. the blanking controls, there is a
dependency.

> 
> This mostly benefits 'generic' userspace which is not interested in
> modifying blankings, but also provide 'specialized' userspace a
> reference to compute a default configuration which is known to work.
> 
> However, on the other hand, such a behaviour would prevent (or make
> harder) concurrent access to the camera from different applications.
> The most trivial example is a camera viewer that does not control
> blankings, which are side-configured by the user through another
> application (say, v4l2-ctl). In this case, when a mode is set on the
> sensor the blanking values are reset, overwriting the manually applied
> configuration. This is a common use case when developing, when
> a configuration is forced on the sensor to validate it, but it's a valid use
> case in general, as a mode configuration would then actually
> overwrite other parameters that might be considered "unrelated" to the
> output resolution and format.
> 
> Once we establish an expected behaviour, should we try to document it
> and possibly enforce it in sensor drivers through reviews and
> hopefully by providing helpers ? Whatever the decision ends up being
> I think we want to standardize sensor drivers to behave the same.
> 
> Thanks
>    j
> 
> [1] https://lists.libcamera.org/pipermail/libcamera-devel/2022-October/034885.html
> " Consider a case with two modes, lores and hires. As
> sensors typically express horizontal blanking as a horizontal total
> size, the hblank control max value will be larger for lores than hires.
> If the sensor were to set the default hblank to a value valid for lores
> but not hires, switching from lores -> hires -> lores would change the
> effective hblank value even if userspace doesn't touch the hblank
> control at all."

-- 
Kind regards,

Sakari Ailus
