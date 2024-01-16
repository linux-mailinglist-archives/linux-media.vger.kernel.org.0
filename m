Return-Path: <linux-media+bounces-3758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A7282F245
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 17:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DF1A1F216E5
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 16:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5211C6A8;
	Tue, 16 Jan 2024 16:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i++OOhUq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202301C69F
	for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 16:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 056EDB2A;
	Tue, 16 Jan 2024 17:17:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705421848;
	bh=D9Yiomep4fKQrhRQ6FSC/nO87sMndUq+pz5lASu+m/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i++OOhUq+17R++XDqsKhkCk0kW/GYaF35j1NFFjyxp61b1VjTWPNH/sm/ZJm1htyk
	 Pc/EXCnCM3+p483dRCxgJF6AYoh/IX8gRvns8WgUPxHSrREYfUVAZW4waFFNfy1FUa
	 Y9nPxkFlECzMKX9RrirVEVaC3pjeOYcA3Y64gYTk=
Date: Tue, 16 Jan 2024 18:18:40 +0200
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
Message-ID: <20240116161840.GB16531@pendragon.ideasonboard.com>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
 <7dcbe5a7-408b-477b-b02d-e39b9ad1ab74@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7dcbe5a7-408b-477b-b02d-e39b9ad1ab74@redhat.com>

On Tue, Jan 16, 2024 at 05:12:50PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 1/11/24 07:55, bingbu.cao@intel.com wrote:
> > From: Bingbu Cao <bingbu.cao@intel.com>
> > 
> > This patch series adds a driver for Intel IPU6 input system.
> > IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
> > device which can be found in some Intel Client Platforms. User can use
> > IPU6 to capture images from MIPI camera sensors.
> > 
> > IPU6 has its own firmware which exposes ABIs to driver, and communicates
> > with CSE to do firmware authentication. IPU6 has its MMU hardware, so
> > the driver sets up a page table to allow IPU6 DMA to access the system
> > memory.
> > 
> > IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
> > ---
> > v2 -> v3:
> >   - Add line-based metadata capture support
> >   - Fix header files inclusion issues
> >   - Fix the CSI2 timing calculation
> >   - Fix crash when remove module during streaming
> >   - Remove some unused code
> >   - Use cross-referencing links in documentation
> >   - Update Makefile to use ":=" for objects
> >   - Fix several bugs and coding style issues
> 
> So I've given this version a try on a Lenovo X1 yoga gen 8 with ov2740
> sensor using the ongoing libcamera SoftISP work + this small patch
> to enable the SoftISP on IPU6 :
> 
> https://github.com/jwrdegoede/libcamera/commit/3172f3703cf7076390fbf86c3b43e388c2422b31
> 
> things work fine when using patch 1-15 + 17 on top of 6.7, note
> I'm skipping patch 16 ("media: ipu6/isys: support line-based
> metadata capture support")" here!
> 
> However when I instead apply the whole series on top of:
> https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata
> 
> Then things stop working, with the following errors
> (I added extra error logging to figure out in which syscall
> resetRoutingTable() fails and made libcamera ignore the routing
> errors):
> 
> [2:02:04.466310686] [8943] ERROR SimplePipeline simple.cpp:1443 GetRouting() failed -25
> [2:02:04.466315975] [8943] ERROR SimplePipeline simple.cpp:1574 Failed to reset routes for /dev/v4l-subdev1: Inappropriate ioctl for device
> [2:02:04.466366331] [8943] ERROR SimplePipeline simple.cpp:1443 GetRouting() failed -25
> [2:02:04.466370025] [8943] ERROR SimplePipeline simple.cpp:1574 Failed to reset routes for /dev/v4l-subdev4: Inappropriate ioctl for device
>  	[2:03:32.334708887] [8929]  INFO Camera camera.cpp:1183 configuring streams: (0) 1924x1088-BGR888
> [2:03:32.335129023] [8943] ERROR SimplePipeline simple.cpp:1205 Unable to configure capture in 1932x1092-BA10 (got 0x0-@...)
> Failed to configure camera.
> 
> I was sorta assuming that the new metadata-stream support would
> be backwards compatible for userspace without support for this,
> so I think this is a bug ?

The ABI has changed, it's not stable in mainline yet (which is why it
requires a kernel code change to enable it, see
https://git.linuxtv.org/sailus/media_tree.git/commit/?h=metadata&id=cc8be69a5c04b71bbf92fa26633ece13305ca451).

> I would be happy to test any patches to fix this.

-- 
Regards,

Laurent Pinchart

