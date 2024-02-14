Return-Path: <linux-media+bounces-5124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C77F6854532
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 10:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06DB91C22EA3
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 09:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0204014ABA;
	Wed, 14 Feb 2024 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpkiJk5S"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61ED17586
	for <linux-media@vger.kernel.org>; Wed, 14 Feb 2024 09:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707902912; cv=none; b=SQj5a5yxBaaUQrpsw3pszoUMesQXknrp4bZVR3fYg/EIuMJJkZOU4VhqUpIuY+h3O3O4O1dfuduRZZU7mT+sqHDvMifHwWlakVM0UgH57XvlxXxgc1x+4McqnPr/GLwmK4C8ZL606/tOgHX+/B2yhot7lOFi3sJ2mi67DLBuP4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707902912; c=relaxed/simple;
	bh=Bv6UaG62e3W/RqyoleQWKG8Fa9LGlbfYgS0DNoiyzCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GF9Xnopasq+5knSoZsuzu0SC8gLSopaNSET0iJ5daQLabVOnpaNVTITmBftqjPsUggWT+d4ZutTj0CP057Em3NshOOt7NEUlDyPZc4RTHLmmk/d2+Mwa/sjTOmOYX0KCaJV/RNulvTZ3rr0rDfBysrWqE0GUvis1GDeeZMpqcwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpkiJk5S; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707902911; x=1739438911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bv6UaG62e3W/RqyoleQWKG8Fa9LGlbfYgS0DNoiyzCU=;
  b=hpkiJk5Suo30rOzaGLuL4Wa1O+8jJY/g6qIowJf5CqfmIm6junUr933Y
   IQQXSxat3NzjdTN/e1m9XokXb8CQLbj8kb4yyK+kpYMpCLPYUD5tqlSHN
   kVhfU8RWBJiomAQfuChYdKgA2MDgSpyFbo9LyDX2qBpY/ypz5r0KHTW7H
   70fBry3CMIAx8lBUpz/KaaBO6ZWOEWhOdlNBeLQstc9HXEbKn85b1qfDn
   C+peAuzeT5bKJri+iSp+qoCAmBqFhhEKMtFI+8olGm6clOKFHTNUKresy
   2bbXC0xye3mPoTRsIyzLv7CfvoKqcOOD3hPMFVfKSGzXyeTb12Buv3Adb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1812712"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1812712"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:28:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3119316"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 01:28:26 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 465CB11F86A;
	Wed, 14 Feb 2024 11:28:23 +0200 (EET)
Date: Wed, 14 Feb 2024 09:28:23 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
	claus.stovgaard@gmail.com, tfiga@chromium.org,
	senozhatsky@chromium.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: Re: [PATCH v2 00/15] Intel IPU6 and IPU6 input system drivers
Message-ID: <ZcyHt7qcA5FPN3wE@kekkonen.localdomain>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <ZcMqizLGUVLfydem@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZcMqizLGUVLfydem@kekkonen.localdomain>

On Wed, Feb 07, 2024 at 07:00:27AM +0000, Sakari Ailus wrote:
> Hi folks,
> 
> On Tue, Oct 24, 2023 at 07:29:09PM +0800, bingbu.cao@intel.com wrote:
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
> 
> I've made some changes on top of this (besides some done by Bingbu). I've
> pushed the current patches here
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=ipu6>. What's
> changed:
> 
> - CSI-2 port address calculation simplification.
> 
> - Tested (and fixed) driver probing on a Dell XPS 9315 that has IVSC and
>   Linux camera description that ignores the IVSC. This works if the
>   intel-ipu6 driver is first removed and then re-probed. I'm not quite sure
>   why it doesn't re-probe on its own yet. I haven't tried streaming yet.
> 
> - The patches are on top of the metadata set. If you want to try without,
>   just drop the metadata patches (and the last functional driver patch). It
>   might compile. I'll test this soon, too.
> 
> So overall there's some progress but work remains to do. I'll post the IVSC
> and ACPI patches after a little bit more testing.

I've added further patches to the branch and dropped some... Capturing
works now on Dell XPS 9315 with ov01a10 without issues (AFAICT), and that
pipeline includes IVSC. I'm upstreaming the un-media patches to the
respective trees so some of this is going to take a while to merged back to
the media tree.

I've also removed the massive number of extra links from the CSI-2 receiver
subdevs and video nodes. This part remains untested though, the ov01a10
sensor doesn't have support for embedded data (!).

Just FYI.

-- 
Sakari Ailus

