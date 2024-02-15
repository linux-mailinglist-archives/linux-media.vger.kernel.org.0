Return-Path: <linux-media+bounces-5189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 794E2855BF8
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 09:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FDD21C24F0A
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 08:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C4D134C8;
	Thu, 15 Feb 2024 08:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHCUaAPp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D868134C7
	for <linux-media@vger.kernel.org>; Thu, 15 Feb 2024 08:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707984373; cv=none; b=Cm7CD/7Koo4ZTdXo+GARnLAF6DmAAtZWja5Q0Z3TJA02Hw3vtWSqwuw8JG5IKBsA1A8Qf1BN7l89NERCYVFS4Vw9TQlgk9mT9hjY0FuFR6sbxVpbjm9tRCJOMrqAFk5ikvvwxLgzo9p08emWJhDL/FbeaUxE4nQbGvPFJgmoAI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707984373; c=relaxed/simple;
	bh=wpvHpG88lYK846gO+SolShNvKCqFL0BUx5th+5jIEYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xqs6LJeiSS8SvMDC2nOVi/CR8vpdtPCyOBmVLTxd+g8UDk2owUStCvucirY3Q2x/0YEXIFt/B4XFof2VfJdhr2pCCBmgWhJplp01njtsR1++78YxED1SCZTGeNKJRBl416y3EFUqshF/+jJKBwPLO2ljq3fkKQ3vbMhQAMNhDVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHCUaAPp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707984371; x=1739520371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wpvHpG88lYK846gO+SolShNvKCqFL0BUx5th+5jIEYk=;
  b=gHCUaAPpjL13775fIU4E7d/BPSKC7HNOj4+GLQJodybhV/fa3VSsDy0B
   gHgsxOSUWYKWMJcBwigX+0psZSBqN3fo9m4k5j6NIiGwTlSk1OtIs1pnP
   sB9BpeKxfLTu8t2D2jYYkxR+c4q/bFqD8VvezPhpqMujOvvepvh5YvYWn
   k8oMjvJgShgLdt3e42PiYapezsTFZpyq2k0OvL+nvKuI6kf1KDLCqudIx
   jTL6f4HbVak2DBvXofQjcigWawiDwqOfkw511h78p9VbloznRGYVKhzm8
   nP/Jk9Go/xL7PWI8ZSCH3Vn3JtgOYiXBccCXRRvaodfEmrGK3THVY6DN1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="1931309"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="1931309"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 00:06:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="8067896"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 00:06:07 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 93BD011F7E0;
	Thu, 15 Feb 2024 10:06:04 +0200 (EET)
Date: Thu, 15 Feb 2024 08:06:04 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andreas Helbech Kleist <andreaskleist@gmail.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com, tfiga@chromium.org,
	senozhatsky@chromium.org, bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 10/17] media: intel/ipu6: add input system driver
Message-ID: <Zc3F7On4kghB_PWW@kekkonen.localdomain>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
 <20240111065531.2418836-11-bingbu.cao@intel.com>
 <f3fe18c6857982d8ff862566bc7d6511225d9193.camel@gmail.com>
 <ZcpkBSQ9hz9yB_UY@kekkonen.localdomain>
 <2f407c0a4f1d7deb4c3fa8e5005caa513c688e6d.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f407c0a4f1d7deb4c3fa8e5005caa513c688e6d.camel@gmail.com>

Hi Andreas,

On Thu, Feb 15, 2024 at 07:43:59AM +0100, Andreas Helbech Kleist wrote:
> Hi Sakari,
> 
> On Mon, 2024-02-12 at 18:31 +0000, Sakari Ailus wrote:
> > Hi Andreas,
> > 
> > On Wed, Feb 07, 2024 at 10:36:15AM +0100, Andreas Helbech Kleist wrote:
> > > Hi Bingbu,
> > > 
> > > Thank you for the patch series, I haven't had a chance to look at v3 in
> > > detail yet, so this is just a small comment from my testing on v2 +
> > > IPU4 hacks, which I can see is also here in v3.
> > > 
> > >  On Thu, 2024-01-11 at 14:55 +0800, bingbu.cao@intel.com wrote:
> > > > From: Bingbu Cao <bingbu.cao@intel.com>
> > > > 
> > > > Input system driver do basic isys hardware setup and irq handling
> > > > and work with fwnode and v4l2 to register the ISYS v4l2 devices.
> > > > 
> > > > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > > ---
> > > >  drivers/media/pci/intel/ipu6/ipu6-isys.c | 1353 ++++++++++++++++++++++
> > > >  drivers/media/pci/intel/ipu6/ipu6-isys.h |  207 ++++
> > > >  2 files changed, 1560 insertions(+)
> > > >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.c
> > > >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.h
> > > > 
> > > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> > > 
> > > ...
> > > 
> > > > +static void isys_unregister_devices(struct ipu6_isys *isys)
> > > > +{
> > > > +	isys_unregister_video_devices(isys);
> > > > +	isys_csi2_unregister_subdevices(isys);
> > > > +	v4l2_device_unregister(&isys->v4l2_dev);
> > > > +	media_device_unregister(&isys->media_dev);
> > > > +	media_device_cleanup(&isys->media_dev);
> > > > +}
> > > 
> > > ...
> > > 
> > > > +static void isys_remove(struct auxiliary_device *auxdev)
> > > > +{
> > > > +	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
> > > > +	struct ipu6_isys *isys = dev_get_drvdata(&auxdev->dev);
> > > > +	struct ipu6_device *isp = adev->isp;
> > > > +	struct isys_fw_msgs *fwmsg, *safe;
> > > > +	unsigned int i;
> > > > +
> > > > +	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist, head)
> > > > +		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
> > > > +			       fwmsg, fwmsg->dma_addr, 0);
> > > > +
> > > > +	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist_fw, head)
> > > > +		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
> > > > +			       fwmsg, fwmsg->dma_addr, 0);
> > > 
> > > I experienced a crash in ipu6_get_fw_msg_buf when unbinding the PCI
> > > driver while streaming.
> > > 
> > > It happens because the above two lists are still used at this point. I
> > > believe it is safe to free the fw msgs after the
> > > isys_unregister_devices(isys) call below.
> > 
> > Probably yes, indeed.
> > 
> > However there's no support for unbinding a driver from a device while
> > streaming apart from plain V4L2 drivers. This needs to be addressed but we
> > can't address it driver by driver when the framework won't help with that,
> > it requires a comprehensive approach and support for this in MC and V4L2
> > sub-device frameworks.
> 
> Thank you for the information. I'll try to lower my expectations ;)

This has been the case since the very beginning of V4L2 sub-device nodes
and Media controller. At the time the use case involved devices that could
not be physically removed and managing the lifetime of the objects was seen
complex, so instead an assumption was made they'll always stay. And of
course it's now much, much harder to fix.

This set goes some way addressing this but it's really only a start:
<URL:https://lore.kernel.org/linux-media/20231220103713.113386-1-sakari.ailus@linux.intel.com/>

> 
> > > 
> > > > +
> > > > +	isys_unregister_devices(isys);
> > > > +	isys_notifier_cleanup(isys);
> > > > +
> > > > +	cpu_latency_qos_remove_request(&isys->pm_qos);
> > > > +
> > > > +	if (!isp->secure_mode) {
> > > > +		ipu6_cpd_free_pkg_dir(adev);
> > > > +		ipu6_buttress_unmap_fw_image(adev, &adev->fw_sgt);
> > > > +		release_firmware(adev->fw);
> > > > +	}
> > > > +
> > > > +	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
> > > > +		mutex_destroy(&isys->streams[i].mutex);
> > > > +
> > > > +	isys_iwake_watermark_cleanup(isys);
> > > > +	mutex_destroy(&isys->stream_mutex);
> > > > +	mutex_destroy(&isys->mutex);
> > > > +}
> > > 
> > > /Andreas
> > 
> 

-- 
Regards,

Sakari Ailus

