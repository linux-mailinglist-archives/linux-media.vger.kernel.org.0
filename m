Return-Path: <linux-media+bounces-5043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE11F851CC5
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 19:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4954F1F21C7A
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 18:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABBC3FB3E;
	Mon, 12 Feb 2024 18:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghxlOKlq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2569F18658
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 18:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707762701; cv=none; b=i43PHXoJDD0aJA0E6G+BXV6VwAiRKIICtWfDDaXoKaUAOF770HUgrljZLLvcTE/mh3O4uCDP+Czk2SVN63egSshk+oTvcTbEqJLKhzciLBBYHhAfADOYlYEzNqFqo3sIyKd0OhgoLiXzfRVixkfY++uY4Q65R9pKIF/WgAq+Jwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707762701; c=relaxed/simple;
	bh=YgViRefpvaheb3MdaiShJe4Pd7R+KBXQ/sU9ZTiFiCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gew1wPUidrw35vdfR1FJTssS1kxxOVEczhTbu5yYVIwj0xrefjxAICaewUgmuCKbmQRa954Hdtkx14OcLJEL+bILYSLgreVZRxtLy1YMiqKnScjXhNBNv8vVNUmrWC8unxdgEe2db5lEabHbHxXIbJmqvv4rhepo0vO2CJ9aaKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghxlOKlq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707762700; x=1739298700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YgViRefpvaheb3MdaiShJe4Pd7R+KBXQ/sU9ZTiFiCc=;
  b=ghxlOKlq9XEN38dtIJ2RjoXyQMazXrKqmQdbDCD/wm6Oww0kU/jsdgV1
   HLdkMlqm1DZnz2aBec9Rr33FmtsdLRoBTAxpiTypaoLeyL6gmc8SQ6Ion
   nV1j2pI0pkGmKev3B91FkY+zZcesYvnk18dK/OYnPPsZZQ1vX27QLEKCf
   SgD8xuNllJqnDcP5Mw46EyoPBbYKDuES+skhHzrVH0DnhAZR4Pw3WKeA4
   3ZHZCqR5YXRnKx4N513UuZqDqJPitA5m+lPxFqzcCn8h1WGcMAhslHcN0
   1NFo+sUjKA/0gpt5bRAVlTLCXrwneZbTiKO7PIf/cGYYuxHamLw0Wvbss
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13147151"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="13147151"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 10:31:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="3001529"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 10:31:36 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 58DEB11F9DB;
	Mon, 12 Feb 2024 20:31:33 +0200 (EET)
Date: Mon, 12 Feb 2024 18:31:33 +0000
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
Message-ID: <ZcpkBSQ9hz9yB_UY@kekkonen.localdomain>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
 <20240111065531.2418836-11-bingbu.cao@intel.com>
 <f3fe18c6857982d8ff862566bc7d6511225d9193.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3fe18c6857982d8ff862566bc7d6511225d9193.camel@gmail.com>

Hi Andreas,

On Wed, Feb 07, 2024 at 10:36:15AM +0100, Andreas Helbech Kleist wrote:
> Hi Bingbu,
> 
> Thank you for the patch series, I haven't had a chance to look at v3 in
> detail yet, so this is just a small comment from my testing on v2 +
> IPU4 hacks, which I can see is also here in v3.
> 
>  On Thu, 2024-01-11 at 14:55 +0800, bingbu.cao@intel.com wrote:
> > From: Bingbu Cao <bingbu.cao@intel.com>
> > 
> > Input system driver do basic isys hardware setup and irq handling
> > and work with fwnode and v4l2 to register the ISYS v4l2 devices.
> > 
> > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-isys.c | 1353 ++++++++++++++++++++++
> >  drivers/media/pci/intel/ipu6/ipu6-isys.h |  207 ++++
> >  2 files changed, 1560 insertions(+)
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.c
> >  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.h
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> 
> ...
> 
> > +static void isys_unregister_devices(struct ipu6_isys *isys)
> > +{
> > +	isys_unregister_video_devices(isys);
> > +	isys_csi2_unregister_subdevices(isys);
> > +	v4l2_device_unregister(&isys->v4l2_dev);
> > +	media_device_unregister(&isys->media_dev);
> > +	media_device_cleanup(&isys->media_dev);
> > +}
> 
> ...
> 
> > +static void isys_remove(struct auxiliary_device *auxdev)
> > +{
> > +	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
> > +	struct ipu6_isys *isys = dev_get_drvdata(&auxdev->dev);
> > +	struct ipu6_device *isp = adev->isp;
> > +	struct isys_fw_msgs *fwmsg, *safe;
> > +	unsigned int i;
> > +
> > +	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist, head)
> > +		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
> > +			       fwmsg, fwmsg->dma_addr, 0);
> > +
> > +	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist_fw, head)
> > +		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
> > +			       fwmsg, fwmsg->dma_addr, 0);
> 
> I experienced a crash in ipu6_get_fw_msg_buf when unbinding the PCI
> driver while streaming.
> 
> It happens because the above two lists are still used at this point. I
> believe it is safe to free the fw msgs after the
> isys_unregister_devices(isys) call below.

Probably yes, indeed.

However there's no support for unbinding a driver from a device while
streaming apart from plain V4L2 drivers. This needs to be addressed but we
can't address it driver by driver when the framework won't help with that,
it requires a comprehensive approach and support for this in MC and V4L2
sub-device frameworks.

> 
> > +
> > +	isys_unregister_devices(isys);
> > +	isys_notifier_cleanup(isys);
> > +
> > +	cpu_latency_qos_remove_request(&isys->pm_qos);
> > +
> > +	if (!isp->secure_mode) {
> > +		ipu6_cpd_free_pkg_dir(adev);
> > +		ipu6_buttress_unmap_fw_image(adev, &adev->fw_sgt);
> > +		release_firmware(adev->fw);
> > +	}
> > +
> > +	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++)
> > +		mutex_destroy(&isys->streams[i].mutex);
> > +
> > +	isys_iwake_watermark_cleanup(isys);
> > +	mutex_destroy(&isys->stream_mutex);
> > +	mutex_destroy(&isys->mutex);
> > +}
> 
> /Andreas

-- 
Regards,

Sakari Ailus

