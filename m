Return-Path: <linux-media+bounces-191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B84977E96F3
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 08:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A53E11C20972
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 07:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FF813FEF;
	Mon, 13 Nov 2023 07:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQX7wOTa"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C998F66
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 07:08:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B2BD10F5
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 23:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699859329; x=1731395329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R51STgbU6tBKwb5KSQxNWitCKBNdFqsBFTwqV4Ess3k=;
  b=RQX7wOTa7Qg4VohjctEkLIoKoBENjQnj1HXxGpi7svRGKkr1qqwnw02B
   DZKQTQoqWHg8owZk/qTw4i8L+FG2J+cII2QhRLVeDlVnPJU+xVlFHw++P
   YGts7eQDT3BXX4Sa1oMGt7tTF5bnz4bTXnjHgIMJz6HcD+z7pb4AltdUL
   Ng59jYaXK4KRBwXg1IuCBQAa6aNpa5sP0McwxYHxss/jdTwOS+XAeiXp6
   yUaKrJgilQDA1Q3cDiBmZTX4uON7rjaryB19KSXHt5wthsXV5NZvsmimk
   IfoyyRfZUOjWNCabS9ev2FWSUjvQlukChsIbrlgD3Q6sELy+PMumdrjsX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="389254280"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="389254280"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 23:08:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="834642424"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="834642424"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 23:08:48 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 57CCF11F7D1;
	Mon, 13 Nov 2023 09:08:45 +0200 (EET)
Date: Mon, 13 Nov 2023 07:08:45 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 1/1] media: v4l: subdev: Always compile sub-device state
 access functions
Message-ID: <ZVHLfcj89xOL9vCT@kekkonen.localdomain>
References: <20231110101049.890577-1-sakari.ailus@linux.intel.com>
 <20231110153940.GA7466@pendragon.ideasonboard.com>
 <ZU6diJrv-iKvcE9B@kekkonen.localdomain>
 <20231112012246.GA18216@pendragon.ideasonboard.com>
 <ZVE2YRHqIP1ethLf@kekkonen.localdomain>
 <20231113012315.GB18216@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113012315.GB18216@pendragon.ideasonboard.com>

On Mon, Nov 13, 2023 at 03:23:15AM +0200, Laurent Pinchart wrote:
> On Sun, Nov 12, 2023 at 08:32:33PM +0000, Sakari Ailus wrote:
> > On Sun, Nov 12, 2023 at 03:22:46AM +0200, Laurent Pinchart wrote:
> > > On Fri, Nov 10, 2023 at 09:15:52PM +0000, Sakari Ailus wrote:
> > > > On Fri, Nov 10, 2023 at 05:39:40PM +0200, Laurent Pinchart wrote:
> > > > > On Fri, Nov 10, 2023 at 12:10:49PM +0200, Sakari Ailus wrote:
> > > > > > Compile sub-device state information access functions
> > > > > > v4l2_subdev_state_get_{format,crop,compose} unconditionally as they are
> > > > > > now also used by plain V4L2 drivers.
> > > > > 
> > > > > What do you mean by "plain" V4L2 drivers here ?
> > > > 
> > > > Those that do not need MC: if you now disable MC in kernel configuration,
> > > > these functions won't be available.
> > > 
> > > This covers subdev drivers (such as sensor drivers) too, not just host
> > > drivers ? If so, shouldn't we also drop the dependency on
> > > VIDEO_V4L2_SUBDEV_API from drivers/media/i2c/Kconfig ?
> > 
> > Good question.
> > 
> > There are still other functions that a number of drivers depend on which
> > are only available when either MC or sub-device API are enabled.
> > 
> > Given that almost all receiver drivers today use MC, I don't think there
> > would be much to be gained from enabling building e.g. sensor drivers
> > without sub-device UAPI.
> 
> I would like to refocus VIDEO_V4L2_SUBDEV_API to cover the UAPI only.
> Trying to be too clever with the Kconfig symbol doesn't help.

I guess this has been the intention, with the inclusion of other functions
and definitions that are only needed for sub-device UAPI. This poses some
issues for drivers that can work in both cases but there aren't many of
them. I'm fine with removing the latter.

-- 
Sakari Ailus

