Return-Path: <linux-media+bounces-171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CE17E9406
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 02:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F18161F20F15
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 01:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C074469D;
	Mon, 13 Nov 2023 01:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bOyknrGh"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335CF522B
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 01:23:13 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8521BF1
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 17:23:11 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64CC029A;
	Mon, 13 Nov 2023 02:22:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699838564;
	bh=UlJcvLC7fpL/yC6rU88/Z62Ok+DUXML30iA1/3nQ8ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bOyknrGhYPUA0cdBLbI0yS6CIreHu9rvgqtY8550t3+rZtVuma4hNOhx2IOxiYbjU
	 XO8y1qMj4Rbdi0NIXwt/2LBXbREuHTNJAgckoHIwMRRJn6r2p0GtnapsQk9cIeo9GK
	 u5WeqrjiG//ArD0uke0bUOU/7WFY5pO7sRulckI4=
Date: Mon, 13 Nov 2023 03:23:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 1/1] media: v4l: subdev: Always compile sub-device state
 access functions
Message-ID: <20231113012315.GB18216@pendragon.ideasonboard.com>
References: <20231110101049.890577-1-sakari.ailus@linux.intel.com>
 <20231110153940.GA7466@pendragon.ideasonboard.com>
 <ZU6diJrv-iKvcE9B@kekkonen.localdomain>
 <20231112012246.GA18216@pendragon.ideasonboard.com>
 <ZVE2YRHqIP1ethLf@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZVE2YRHqIP1ethLf@kekkonen.localdomain>

On Sun, Nov 12, 2023 at 08:32:33PM +0000, Sakari Ailus wrote:
> On Sun, Nov 12, 2023 at 03:22:46AM +0200, Laurent Pinchart wrote:
> > On Fri, Nov 10, 2023 at 09:15:52PM +0000, Sakari Ailus wrote:
> > > On Fri, Nov 10, 2023 at 05:39:40PM +0200, Laurent Pinchart wrote:
> > > > On Fri, Nov 10, 2023 at 12:10:49PM +0200, Sakari Ailus wrote:
> > > > > Compile sub-device state information access functions
> > > > > v4l2_subdev_state_get_{format,crop,compose} unconditionally as they are
> > > > > now also used by plain V4L2 drivers.
> > > > 
> > > > What do you mean by "plain" V4L2 drivers here ?
> > > 
> > > Those that do not need MC: if you now disable MC in kernel configuration,
> > > these functions won't be available.
> > 
> > This covers subdev drivers (such as sensor drivers) too, not just host
> > drivers ? If so, shouldn't we also drop the dependency on
> > VIDEO_V4L2_SUBDEV_API from drivers/media/i2c/Kconfig ?
> 
> Good question.
> 
> There are still other functions that a number of drivers depend on which
> are only available when either MC or sub-device API are enabled.
> 
> Given that almost all receiver drivers today use MC, I don't think there
> would be much to be gained from enabling building e.g. sensor drivers
> without sub-device UAPI.

I would like to refocus VIDEO_V4L2_SUBDEV_API to cover the UAPI only.
Trying to be too clever with the Kconfig symbol doesn't help.

-- 
Regards,

Laurent Pinchart

