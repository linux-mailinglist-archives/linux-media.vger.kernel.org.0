Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9BD870F625
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 14:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbjEXMWI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 May 2023 08:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjEXMV6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 May 2023 08:21:58 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB3C9C
        for <linux-media@vger.kernel.org>; Wed, 24 May 2023 05:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684930917; x=1716466917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hmzbCkO5xo/TwT0SHS5feOlSG3h6oII3tMXBVj/6g/w=;
  b=g2lP6j1ToILbtbLjwctuwWCiktuA1iq+MMK6h3oEIKKmC7HTat0vBdab
   OsXhukpWd95XqsuDNL+MyoM6uRbmmOFVNpqSDEA9SwQeJ9U1kwZqwxIhN
   k48KYGAqXR4fEAPIGq4Z9PGGgB2J7M6w17jOFzMYgQbzGjqdJ0uvUdvel
   JNpRYvITEmlJnr7Z7l2rfMfMYkNGd2Cp/ZXbpbG/1ixiFnu8zK59G8i/9
   qTfGaW3HNV50SmzAChwO8pB+jUW73NkPbY83OugzeNqXy3E8zC+jQul7m
   GZj3FvI7ry89Y2hI2I9ZV3n/L8zjYST8546nb5bxG+bRDJ21uCWfF+YgN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="439900820"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="439900820"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 05:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="737284594"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; 
   d="scan'208";a="737284594"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 05:21:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 1F1571202A9;
        Wed, 24 May 2023 15:21:52 +0300 (EEST)
Date:   Wed, 24 May 2023 12:21:52 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Jai Luthra <j-luthra@ti.com>,
        "Guoniu . zhou" <guoniu.zhou@nxp.com>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/2] media: ov5640: drive-by frame_interval cleanups
Message-ID: <ZG4BYJXWyg02D8lf@kekkonen.localdomain>
References: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>
 <52b0df19-ed9e-14cc-f9ab-e4a1d453524a@ti.com>
 <20230516074653.pf6kg3ebvrqvdnbv@lati>
 <3bj55lulknp3tkqiojvzfdt4t62pzxcvjyrx2jz4dpba2pawii@blwilnnvrh4r>
 <20230517090508.eunyw2ejht2mdlgi@lati>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517090508.eunyw2ejht2mdlgi@lati>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Wed, May 17, 2023 at 11:05:08AM +0200, Jacopo Mondi wrote:
> Hi Jai
> 
> On Wed, May 17, 2023 at 01:29:13PM +0530, Jai Luthra wrote:
> > Hi Jacopo,
> >
> > On May 16, 2023 at 09:46:57 +0200, Jacopo Mondi wrote:
> > > Hi Jai,
> > >    thanks for testing
> > >
> > > On Mon, May 15, 2023 at 05:25:55PM +0530, Jai Luthra wrote:
> > > > Hi Jacopo, Guoniu,
> > > >
> > > > On 05/05/23 12:46, Jacopo Mondi wrote:
> > > > > While looking at Guoniu Zhou patches I noticed that there were a few cleanups
> > > > > related to the usage of frame_interval fileds for MIPI CSI-2 framerate
> > > > > calculations.
> > > > >
> > > > > No functional changes intended, just cleanups.
> > > > >
> > > > > Guoniu: could you please test these on your setup as well ? A tested-by tag
> > > > > would be useful!
> > > > >
> > > >
> > > > Thanks for the latest fixes!
> > > >
> > > > Testing on my setup (CSI module w/ 2 lanes), I notice two weird issues and
> > > > wonder if you see the same behavior on your setups?
> > > >
> > > > Issue 1
> > > > -------
> > > >
> > > > On a fresh boot the sensor streams at 60fps, and checking link_freq from
> > > > v4l2-ctl I get 384Mhz. But G_FRAME_INTERVAL returns 30FPS when using
> > > > `media-ctl -p`:
> > > > [stream:0 fmt:UYVY8_1X16/640x480@1/30]
> > >
> > > the g/s_frame_interval calls are not relevant for MIPI CSI-2
> > >
> > > I wonder if we should/could return -EINVAL in this case
> > >
> > >
> > > >
> > > > Issue 2
> > > > -------
> > > >
> > > > If I manually set the frame interval to @1/60 using media-ctl, and then
> > > > stream it - actual framerate gets reduced to 30FPS:
> > >
> > > Ah this shouldn't happen. s_frame_interval -should not- modify the
> > > timings on a CSI-2 setup
> > >
> > > If not returning -EINVAL, we should at least return immediately
> > >
> > > >
> > > > root@am62xx-evm:~# yavta -s 640x480 -f UYVY /dev/video0 -c5
> > > > ....
> > > > 0 (0) [-] any 0 614400 B 401.488754 401.488855 12.719 fps ts mono/EoF
> > > > 1 (1) [-] any 1 614400 B 401.522057 401.522147 30.027 fps ts mono/EoF
> > > > 2 (2) [-] any 2 614400 B 401.555434 401.555584 29.961 fps ts mono/EoF
> > > > 3 (3) [-] any 3 614400 B 401.588723 401.588814 30.040 fps ts mono/EoF
> > > > 4 (4) [-] any 4 614400 B 401.622051 401.622135 30.005 fps ts mono/EoF
> > > > Captured 5 frames in 0.212005 seconds (23.584252 fps, 14490164.140730 B/s).
> > > > 8 buffers released.
> > > >
> > > > After setting frame interval to @1/60, the link-frequency got reduced to
> > > > 192Mhz, which probably explains the low framerate.
> > > >
> > > > root@am62xx-evm:~# v4l2-ctl -d /dev/v4l-subdev2 -C link_frequency
> > > > link_frequency: 19 (192000000 0xb71b000)
> > > >
> > > > I will take a deeper look at update_pixel_rate() function to try and fix
> > > > this - but wanted to confirm if this also happens on your CSI sensors?
> > > >
> > > > I also repeated same tests without this series and still saw both issues. In
> > > > fact Issue 2 was worse because the sensor did not stream *at all* if I
> > > > changed frame interval to @1/60. My guess is PATCH 2/2 fixes that by not
> > > > updating the VBLANK using the DVP values.
> > >
> > > Probably yes, and this confirms to me that we should return early in
> > > s_frame_interval if we're CSI-2 (or if this doesn't contradict the
> > > specification even return an error).
> >
> > Oh makes sense, thanks.
> >
> > I can update s_frame_interval to return -EINVAL for CSI-2 as a follow-up
> > series.
> >
> > Will also try if g_frame_interval can report correct framerate (60fps vs
> > 30fps) depending upon the bus type, as I don't think returning -EINVAL
> > would be correct behavior. If that does not work maybe we can unset the
> > ops hooks before registering the subdev with the framework.
> >
> 
> I would rather considering disabling the whole s/g/enum_frame_interval
> operations in CSI-2 mode.
> 
> The specification report as an accepted error code
> 
> EINVAL
> The struct v4l2_subdev_frame_interval pad references a non-existing
> pad, or the pad doesn't support frame intervals.
> 
> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.html
> 
> Hans Sakari and Laurent in cc: would it be acceptable to disable the
> frame_interval operations completely when the sensor is used in MIPI
> CSI-2 mode and only allow them in parallel mode ? Is returning -EINVAL
> acceptable in that case ?

I don't think the bus *should* really make a difference. The driver has
supported s_frame_interval in the past and drop that support completely
likely would cause issues.

Although --- if in this case supporting s_frame_interval just for parallel
really helps keeping the driver somehow sane and doesn't break anything, I
have no objections.

-EINVAL works for me.

-- 
Kind regards,

Sakari Ailus
