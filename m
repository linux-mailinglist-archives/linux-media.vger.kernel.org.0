Return-Path: <linux-media+bounces-3765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECCF82F377
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 18:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2C1C2858F0
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 17:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0421CD07;
	Tue, 16 Jan 2024 17:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m7kURqDZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35931CABC
	for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 17:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705427304; cv=none; b=rb5Bfwa0/kvgPLqjT1JFMhOmNlfBF4b2oXl97hgjzLHXCrrHPooXhlbOXwO7ROVhx4Gd5kit4ED3guziOKD2iaIShwYapZXrZmcSD/GPOXpIs6JET21WhuGIZG6MlGi24CZXRlxtEgYe+Sz2hjP6+magJ+i1Zmq7lIWWVMm0cDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705427304; c=relaxed/simple;
	bh=3l669g4NoRZ9xVYjzhhmOjr3VVg9tnqfJZSFpDnF6fc=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=MjkNuvNZBuw7NZZD4V9F13v28f8X4JdCMJKbgUP/0V1Ton8f68BYhVC9LtKIJyfd7MZFwNNASWzRc0OlRm8Vm7RnZNjAgOj0mZno4+DToP5NjdGXwEEva+lq15xOR0Bl8HXjqKjhOmfFEYiIjdx9KrrARA2pASKT/vJQlGlnF9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m7kURqDZ; arc=none smtp.client-ip=213.167.242.64
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C668674;
	Tue, 16 Jan 2024 18:47:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705427230;
	bh=3l669g4NoRZ9xVYjzhhmOjr3VVg9tnqfJZSFpDnF6fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m7kURqDZojDp0AHMyvubHXKOb4JnBgH4SG908DU975eAAAV3WMF1XpjCUA15Ryda1
	 ST3r3o+YBErkOQnLAjGlyJax6ddJ55ljCD42LHVYNPIoKh/USb1dWI2hEnmQtlYhBx
	 pSFyxXQTUQnfmzv9IcSRi1puqG0ulBB3IEanjPlk=
Date: Tue, 16 Jan 2024 19:48:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, bingbu.cao@intel.com,
	linux-media@vger.kernel.org, andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com, tfiga@chromium.org,
	senozhatsky@chromium.org, andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: Re: [PATCH v3 00/15] Intel IPU6 and IPU6 input system drivers
Message-ID: <20240116174823.GD16531@pendragon.ideasonboard.com>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
 <7dcbe5a7-408b-477b-b02d-e39b9ad1ab74@redhat.com>
 <Zaa0vW_TZlee2-_b@kekkonen.localdomain>
 <008f30be-7d1b-498c-88fa-d8cf061e19fa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <008f30be-7d1b-498c-88fa-d8cf061e19fa@redhat.com>

On Tue, Jan 16, 2024 at 05:57:14PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 1/16/24 17:54, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Tue, Jan 16, 2024 at 05:12:50PM +0100, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 1/11/24 07:55, bingbu.cao@intel.com wrote:
> >>> From: Bingbu Cao <bingbu.cao@intel.com>
> >>>
> >>> This patch series adds a driver for Intel IPU6 input system.
> >>> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
> >>> device which can be found in some Intel Client Platforms. User can use
> >>> IPU6 to capture images from MIPI camera sensors.
> >>>
> >>> IPU6 has its own firmware which exposes ABIs to driver, and communicates
> >>> with CSE to do firmware authentication. IPU6 has its MMU hardware, so
> >>> the driver sets up a page table to allow IPU6 DMA to access the system
> >>> memory.
> >>>
> >>> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
> >>> ---
> >>> v2 -> v3:
> >>>   - Add line-based metadata capture support
> >>>   - Fix header files inclusion issues
> >>>   - Fix the CSI2 timing calculation
> >>>   - Fix crash when remove module during streaming
> >>>   - Remove some unused code
> >>>   - Use cross-referencing links in documentation
> >>>   - Update Makefile to use ":=" for objects
> >>>   - Fix several bugs and coding style issues
> >>
> >> So I've given this version a try on a Lenovo X1 yoga gen 8 with ov2740
> >> sensor using the ongoing libcamera SoftISP work + this small patch
> >> to enable the SoftISP on IPU6 :
> >>
> >> https://github.com/jwrdegoede/libcamera/commit/3172f3703cf7076390fbf86c3b43e388c2422b31
> >>
> >> things work fine when using patch 1-15 + 17 on top of 6.7, note
> >> I'm skipping patch 16 ("media: ipu6/isys: support line-based
> >> metadata capture support")" here!
> >>
> >> However when I instead apply the whole series on top of:
> >> https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata
> >>
> >> Then things stop working, with the following errors
> >> (I added extra error logging to figure out in which syscall
> >> resetRoutingTable() fails and made libcamera ignore the routing
> >> errors):
> >>
> >> [2:02:04.466310686] [8943] ERROR SimplePipeline simple.cpp:1443 GetRouting() failed -25
> >> [2:02:04.466315975] [8943] ERROR SimplePipeline simple.cpp:1574 Failed to reset routes for /dev/v4l-subdev1: Inappropriate ioctl for device
> >> [2:02:04.466366331] [8943] ERROR SimplePipeline simple.cpp:1443 GetRouting() failed -25
> >> [2:02:04.466370025] [8943] ERROR SimplePipeline simple.cpp:1574 Failed to reset routes for /dev/v4l-subdev4: Inappropriate ioctl for device
> >>  	[2:03:32.334708887] [8929]  INFO Camera camera.cpp:1183 configuring streams: (0) 1924x1088-BGR888
> >> [2:03:32.335129023] [8943] ERROR SimplePipeline simple.cpp:1205 Unable to configure capture in 1932x1092-BA10 (got 0x0-@...)
> >> Failed to configure camera.
> >>
> >> I was sorta assuming that the new metadata-stream support would
> >> be backwards compatible for userspace without support for this,
> >> so I think this is a bug ?
> > 
> > That's the intention when it comes to the kernel APIs indeed.
> > 
> > I wonder how the simple pipeline handler works with this, does it try to
> > configure both streams all the way from the internal source pad to the
> > video node? This will certainly fail without metadata support in the ISYS
> > driver. Just guessing the cause though. An extra stream from the source pad
> > won't fail pipeline validation.
> > 
> > I should be able to set up a system to test this, too.
> 
> I did include Bingbu's patch to add metadata to the isys driver for my
> testing (and I also tried reverting just that patch). I think the issue
> might be that libcamera already has some streams awareness based on
> an older streams patch-set.

Correct. It uses the G_ROUTING and S_ROUTING ioctls, and those have
chenged in the latest kernel patch series.

The simple pipeline handler doesn't configure routing as such, it gets
the default routes with G_ROUTING(TRY) if the device advertises routing
support, and calls S_ROUTING(ACTIVE) to reset the routes to the default.
It then uses the routes to walk the pipeline, but doesn't change them.

> I'll retest when Laurent's branch for this is ready.

-- 
Regards,

Laurent Pinchart

