Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6983EC525
	for <lists+linux-media@lfdr.de>; Sat, 14 Aug 2021 22:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbhHNU4m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Aug 2021 16:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbhHNU4l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Aug 2021 16:56:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF97AC061764
        for <linux-media@vger.kernel.org>; Sat, 14 Aug 2021 13:56:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34BE03F0;
        Sat, 14 Aug 2021 22:56:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1628974570;
        bh=E7uy894Me6nun4fEBJRDIgIXVbYy6rvddst1VziMlOc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ExEonD4pUWp0FqsCBw5qE3ZtC/QM5OVmcfsqMYj/YaxLCsAjOXVvzoWQuCX++FEW5
         pFUyez+b5V0Hkf9K8WUTGu5QfhqgJulOHOUICrJ4iUDKdNu3Z49fWp6iMYZ9mlfDtP
         Cc/9+4gzVgKRgOOs96UTP5PJVPeq3Qqwi/xIPUPQ=
Date:   Sat, 14 Aug 2021 23:56:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>, paul.kocialkowski@bootlin.com
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        ezequiel@collabora.com, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 08/12] media: i2c: Add hblank control to ov8865
Message-ID: <YRgt5B5IyBZiA1pG@pendragon.ideasonboard.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
 <20210809225845.916430-9-djrscally@gmail.com>
 <20210810142934.GE3@paasikivi.fi.intel.com>
 <74125e27-abe3-c596-53e6-4416cabfcc63@gmail.com>
 <YRXhYP7H639DuQUK@pendragon.ideasonboard.com>
 <189aa86c-68ec-e3a0-9804-209f3d4b1f08@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <189aa86c-68ec-e3a0-9804-209f3d4b1f08@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Fri, Aug 13, 2021 at 10:45:48AM +0100, Daniel Scally wrote:
> On 13/08/2021 04:05, Laurent Pinchart wrote:
> > On Tue, Aug 10, 2021 at 11:07:22PM +0100, Daniel Scally wrote:
> >> On 10/08/2021 15:29, Sakari Ailus wrote:
> >>> On Mon, Aug 09, 2021 at 11:58:41PM +0100, Daniel Scally wrote:
> >>>> @@ -2542,6 +2544,13 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
> >>>>  				     0, 0, ov8865_test_pattern_menu);
> >>>>  
> >>>>  	/* Blanking */
> >>>> +	hblank = mode->hts < mode->output_size_x ? 0 : mode->hts - mode->output_size_x;
> >>>
> >>> Is the result in relation with the analogue crop size? Based on the above
> >>> it wouldn't seem like that.
> >>
> >> This was a weird one actually. My understanding was that HTS should
> >> always be >= the horizontal crop plus hblank...but that doesn't hold
> >> true for some of this driver's modes and nor does it hold true when
> >> running the camera in Windows (I checked the registers whilst running
> >> it). So I went with setting hblank to 0 if the mode's HTS exceeded the
> >> horizontal crop as the only way I could see to reconcile that.
> >
> > There's something very fishy here, HTS is, by definition, equal to the
> > analog crop width plus the horizontal blanking. I suspect that the
> > values in ov8865_modes are wrong.
> 
> I thought that initially too but confirming that the same thing happened
> running windows switched me into "you're probably wrong" mode. If we're
> confident that the HTS is likely wrong though I can add an extra patch
> to bring those into lining with that definition.

I think it's worth investigating this. The hblank computed here is
clearly incorrect, and would thus be useless for all practical purposes.
As usual with OmniVision, the datasheet is also quite useless.

Paul, do you have any information about this ?

> >>>> +	ctrls->hblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_HBLANK, hblank,
> >>>> +					  hblank, 1, hblank);
> >>>> +
> >>>> +	if (ctrls->hblank)
> >>>> +		ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >>>> +
> >>>>  	vblank_max = OV8865_TIMING_MAX_VTS - mode->output_size_y;
> >>>>  	vblank_def = mode->vts - mode->output_size_y;
> >>>>  	ctrls->vblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_VBLANK,

-- 
Regards,

Laurent Pinchart
