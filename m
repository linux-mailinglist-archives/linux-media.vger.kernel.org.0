Return-Path: <linux-media+bounces-3762-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4F282F2AE
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 17:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D6D8B235A5
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 16:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AD21C6BD;
	Tue, 16 Jan 2024 16:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cByxoRvB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E231C1CA86
	for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705424070; x=1736960070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zPLL2dd3TIhl4vY9MeCfF4WCoFjEpKtJ/nBIyhBBDcE=;
  b=cByxoRvBL/VEDoLzbFY+QsEQx/5ThfMk/w5GF1MNjKg8R3eDk+pYyb9n
   OszVvD+3KZdXipRY6eZbYExHapemRUKhPSCEjzQn/XLWNxJ38EKY02Bl0
   xY9NpyDq4aFNKvj0bhdZZXufvS0gOsbPk22Q1s1CvF0/4C5W5FEw3YG8y
   xdEZYo+9422YZ0PIz8sDPHaupEw4tmyRt95wcYHmAIesyfjdotMytSJ4/
   loiwrzdh1CzLW/15k6DaSzCrE7KtEG6iy3ia6dhFh8Vhq747IIpzam0zc
   LeMAaRJOabV0KfNSZTdCAKpY2cNbEnvxn9JNdXzeR59Kv2pEZj1av43QQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="13275223"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="13275223"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 08:54:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="927542871"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="927542871"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 08:54:24 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F1A0111F86A;
	Tue, 16 Jan 2024 18:54:21 +0200 (EET)
Date: Tue, 16 Jan 2024 16:54:21 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com, ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com, tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org, senozhatsky@chromium.org,
	andreaskleist@gmail.com, bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 00/15] Intel IPU6 and IPU6 input system drivers
Message-ID: <Zaa0vW_TZlee2-_b@kekkonen.localdomain>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
 <7dcbe5a7-408b-477b-b02d-e39b9ad1ab74@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dcbe5a7-408b-477b-b02d-e39b9ad1ab74@redhat.com>

Hi Hans,

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

That's the intention when it comes to the kernel APIs indeed.

I wonder how the simple pipeline handler works with this, does it try to
configure both streams all the way from the internal source pad to the
video node? This will certainly fail without metadata support in the ISYS
driver. Just guessing the cause though. An extra stream from the source pad
won't fail pipeline validation.

I should be able to set up a system to test this, too.

> 
> I would be happy to test any patches to fix this.

-- 
Regards,

Sakari Ailus

