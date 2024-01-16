Return-Path: <linux-media+bounces-3760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 104B482F288
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 17:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A01228613A
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 16:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226DA749F;
	Tue, 16 Jan 2024 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JrrfZf59"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964481C69E
	for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 16:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD453B2A;
	Tue, 16 Jan 2024 17:40:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705423252;
	bh=KWA6D1+mKi3WGxmykvGoV25BYl1Eoa4BK5PYeXH3nFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JrrfZf5928sX4oSvl7yL718+pBlhKzBx1QjHBROhuoI6jsKbT0u4U6PptN1S0+S90
	 RqZABXGhLaN/74pbD4Wn5TzVLfGVerOtXu96JQlRw4ZpuyHhps7RxWF8trP04Tlenc
	 t5pMhnQ718lXJBrXnSvUEsffpwqNWZZFpAfzRZrc=
Date: Tue, 16 Jan 2024 18:42:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com, tfiga@chromium.org,
	senozhatsky@chromium.org, andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: Re: [PATCH v3 00/15] Intel IPU6 and IPU6 input system drivers
Message-ID: <20240116164202.GC16531@pendragon.ideasonboard.com>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
 <7dcbe5a7-408b-477b-b02d-e39b9ad1ab74@redhat.com>
 <20240116161840.GB16531@pendragon.ideasonboard.com>
 <0f649b91-7e3e-40b0-8b19-51658ba9fa5a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0f649b91-7e3e-40b0-8b19-51658ba9fa5a@redhat.com>

On Tue, Jan 16, 2024 at 05:38:15PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 1/16/24 17:18, Laurent Pinchart wrote:
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
> > The ABI has changed, it's not stable in mainline yet (which is why it
> > requires a kernel code change to enable it, see
> > https://git.linuxtv.org/sailus/media_tree.git/commit/?h=metadata&id=cc8be69a5c04b71bbf92fa26633ece13305ca451).
> 
> Thanks. So I reverted this patch to have the streams subdev API disabled by default again,
> after this the resetRouting errors are gone, but things still fail with:
> 
> [2:03:32.335129023] [8943] ERROR SimplePipeline simple.cpp:1205 Unable to configure capture in 1932x1092-BA10 (got 0x0-@...)
> Failed to configure camera.
> 
> When using Sakari's metadata branch and including patch 16 from this series.

I'm working on updating libcamera to the latest routing API, I'll ask
you to retest with the pipeline handler if you can when I'll be done.

> I'll just use media_stage/master + this series minus patch 16 for now.
> 
> >> I would be happy to test any patches to fix this.

-- 
Regards,

Laurent Pinchart

