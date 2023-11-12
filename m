Return-Path: <linux-media+bounces-169-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B09F7E92AC
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 21:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55F631C208D6
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 20:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70AC518634;
	Sun, 12 Nov 2023 20:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmsGnW7o"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C158824
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 20:32:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44BDE1BF1
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 12:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699821158; x=1731357158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hdh1Y59x4aC576+udRG0hiTd4vpzGLrRR0NOpJyI/g4=;
  b=BmsGnW7oIRgdeA0der7X+ntbGiFtU6PDYNmP1tDiEFduSE0bdLgGE2rT
   lJIpbvJT8yfg8CNtxmwn5CPPcp7gjSkITY+FSpo+sZvF+LJs/DNgefgON
   mmfdHErslfqg7seGOpwZiB+qE0GdcOw8z3YQDYfI6lzrTlM0gOJurnAym
   8R2SBYcCEwAxU+JfAMVE3/5EMjwVR7e0QWaSnuU0b7M04XXRsw+5O1F3D
   2bmF02VLJUlDe7IuB57/1nSn7QjiFvaz/FwEH+g3P7oBMXF52IGipFuxM
   y/xPF6SXw9zRqchWp26RPP1UiSDxqS3Dak7Myi4h9RJigda5m94V/nqea
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="476574541"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="476574541"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 12:32:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="11926074"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 12:32:37 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C01F611F89D;
	Sun, 12 Nov 2023 22:32:33 +0200 (EET)
Date: Sun, 12 Nov 2023 20:32:33 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 1/1] media: v4l: subdev: Always compile sub-device state
 access functions
Message-ID: <ZVE2YRHqIP1ethLf@kekkonen.localdomain>
References: <20231110101049.890577-1-sakari.ailus@linux.intel.com>
 <20231110153940.GA7466@pendragon.ideasonboard.com>
 <ZU6diJrv-iKvcE9B@kekkonen.localdomain>
 <20231112012246.GA18216@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231112012246.GA18216@pendragon.ideasonboard.com>

Hi Laurent,

On Sun, Nov 12, 2023 at 03:22:46AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Fri, Nov 10, 2023 at 09:15:52PM +0000, Sakari Ailus wrote:
> > On Fri, Nov 10, 2023 at 05:39:40PM +0200, Laurent Pinchart wrote:
> > > On Fri, Nov 10, 2023 at 12:10:49PM +0200, Sakari Ailus wrote:
> > > > Compile sub-device state information access functions
> > > > v4l2_subdev_state_get_{format,crop,compose} unconditionally as they are
> > > > now also used by plain V4L2 drivers.
> > > 
> > > What do you mean by "plain" V4L2 drivers here ?
> > 
> > Those that do not need MC: if you now disable MC in kernel configuration,
> > these functions won't be available.
> 
> This covers subdev drivers (such as sensor drivers) too, not just host
> drivers ? If so, shouldn't we also drop the dependency on
> VIDEO_V4L2_SUBDEV_API from drivers/media/i2c/Kconfig ?

Good question.

There are still other functions that a number of drivers depend on which
are only available when either MC or sub-device API are enabled.

Given that almost all receiver drivers today use MC, I don't think there
would be much to be gained from enabling building e.g. sensor drivers
without sub-device UAPI.

-- 
Regards,

Sakari Ailus

