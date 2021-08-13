Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC923EAEC7
	for <lists+linux-media@lfdr.de>; Fri, 13 Aug 2021 05:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233901AbhHMDFg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 23:05:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43558 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233065AbhHMDFg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 23:05:36 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AE7C9EE;
        Fri, 13 Aug 2021 05:05:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1628823908;
        bh=1zizMXOd3JHhGL1eMadtWSzHf+RLcQ3iqHqA1tdptFQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xe5s+LMcuAshU0N+tdgN9DVMKySsBJNfx6pirTZrHHtT/a5+754rZtIP3TNWUUdE+
         GED3FvBE6sxBnIVlTqwGARw6U6G2n5DK+dhgODlR74PN2b/O6fLD5n1DZXR6iuR3M8
         5v97MHcxWOK7H5+0K5adQatJMv6D932ZUZKlAw1E=
Date:   Fri, 13 Aug 2021 06:05:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 08/12] media: i2c: Add hblank control to ov8865
Message-ID: <YRXhYP7H639DuQUK@pendragon.ideasonboard.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
 <20210809225845.916430-9-djrscally@gmail.com>
 <20210810142934.GE3@paasikivi.fi.intel.com>
 <74125e27-abe3-c596-53e6-4416cabfcc63@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <74125e27-abe3-c596-53e6-4416cabfcc63@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Tue, Aug 10, 2021 at 11:07:22PM +0100, Daniel Scally wrote:
> On 10/08/2021 15:29, Sakari Ailus wrote:
> > On Mon, Aug 09, 2021 at 11:58:41PM +0100, Daniel Scally wrote:
> >> @@ -2542,6 +2544,13 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
> >>  				     0, 0, ov8865_test_pattern_menu);
> >>  
> >>  	/* Blanking */
> >> +	hblank = mode->hts < mode->output_size_x ? 0 : mode->hts - mode->output_size_x;
> >
> > Is the result in relation with the analogue crop size? Based on the above
> > it wouldn't seem like that.
> 
> This was a weird one actually. My understanding was that HTS should
> always be >= the horizontal crop plus hblank...but that doesn't hold
> true for some of this driver's modes and nor does it hold true when
> running the camera in Windows (I checked the registers whilst running
> it). So I went with setting hblank to 0 if the mode's HTS exceeded the
> horizontal crop as the only way I could see to reconcile that.

There's something very fishy here, HTS is, by definition, equal to the
analog crop width plus the horizontal blanking. I suspect that the
values in ov8865_modes are wrong.

> >> +	ctrls->hblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_HBLANK, hblank,
> >> +					  hblank, 1, hblank);
> >> +
> >> +	if (ctrls->hblank)
> >> +		ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >> +
> >>  	vblank_max = OV8865_TIMING_MAX_VTS - mode->output_size_y;
> >>  	vblank_def = mode->vts - mode->output_size_y;
> >>  	ctrls->vblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_VBLANK,

-- 
Regards,

Laurent Pinchart
