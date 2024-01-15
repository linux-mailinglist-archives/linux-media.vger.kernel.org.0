Return-Path: <linux-media+bounces-3707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4C982DA71
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 14:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CBCF1F20EBE
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 13:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D0617546;
	Mon, 15 Jan 2024 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVKY3mCF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32192171BB
	for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 13:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705326319; x=1736862319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JvDRFTxS7cK0B2KVj5cMUvwOuZ01LN+iHx1NEpYqqUs=;
  b=KVKY3mCFNXwvOVNklCxzGXOq0Xa0KHKH40qzHa3TV0hKL2OmWYkZk2Rg
   8XNOLDd2cC1P1uJ1RCFanFgsEFGhSJcl9J3BaqT7ROKO34isogf2K7Y8w
   glvlYU95LKJN5WH1rMPE2wXPZ4SRUppLFwO/hLhN+ewVdzIo8mRtSWkc1
   D/teLYQAZer/hYAde+stZbelCaN3NIIQueh4835NYCbelb+hJ1LHdA6ZA
   vTK5N0JcYubf82E+W2TvieQLeW+eQpqIVlW7UoqAsYWt2fiNpe1rPIUzI
   4oklxPIG0KNXccwHl/7mBB2Z146NTzfMPAgQIQP4HDK1Mttcdlfuq1FsH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="18220173"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="18220173"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 05:45:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="787080700"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="787080700"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 05:45:14 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 165DB11F816;
	Mon, 15 Jan 2024 15:45:12 +0200 (EET)
Date: Mon, 15 Jan 2024 13:45:12 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com, ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com, tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org, senozhatsky@chromium.org,
	andreaskleist@gmail.com, bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 01/17] media: intel/ipu6: add Intel IPU6 PCI device
 driver
Message-ID: <ZaU26ASJG2wNCuYZ@kekkonen.localdomain>
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
 <20240111065531.2418836-2-bingbu.cao@intel.com>
 <e16874f9-cc9b-405f-9618-3f955e205f42@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e16874f9-cc9b-405f-9618-3f955e205f42@redhat.com>

Hi Hans,

On Mon, Jan 15, 2024 at 02:36:43PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 1/11/24 07:55, bingbu.cao@intel.com wrote:
> > From: Bingbu Cao <bingbu.cao@intel.com>
> > 
> > Intel Image Processing Unit 6th Gen includes input and processing systems
> > but the hardware presents itself as a single PCI device in system.
> > 
> > IPU6 PCI device driver basically does PCI configurations and load
> > the firmware binary, initialises IPU virtual bus, and sets up platform
> > specific variants to support multiple IPU6 devices in single device
> > driver.
> > 
> > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> 
> Just one small thing I noticed, not a full review.
> 
> <snip>
> 
> > +static u32 ipu6se_csi_offsets[] = {
> > +	IPU6_CSI_PORT_A_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_B_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_C_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_D_ADDR_OFFSET
> > +};
> > +
> > +/*
> > + * IPU6 on TGL support maximum 8 csi2 ports
> > + * IPU6SE on JSL and IPU6EP on ADL support maximum 4 csi2 ports
> > + * IPU6EP on MTL support maximum 6 csi2 ports
> > + */
> > +static u32 ipu6_tgl_csi_offsets[] = {
> > +	IPU6_CSI_PORT_A_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_B_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_C_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_D_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_E_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_F_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_G_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_H_ADDR_OFFSET
> > +};
> > +
> > +static u32 ipu6ep_mtl_csi_offsets[] = {
> > +	IPU6_CSI_PORT_A_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_B_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_C_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_D_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_E_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_F_ADDR_OFFSET
> > +};
> > +
> > +static u32 ipu6_csi_offsets[] = {
> > +	IPU6_CSI_PORT_A_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_B_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_C_ADDR_OFFSET,
> > +	IPU6_CSI_PORT_D_ADDR_OFFSET
> > +};
> 
> These 4 arrays all are the same, except for their lengths.
> 
> Please just use a single array wuth the full 8 A-H
> entries and then just directly code the amount of ports
> here:
> 
> > +static void ipu6_internal_pdata_init(struct ipu6_device *isp)
> > +{
> <snip>
> 
> > +	isys_ipdata.csi2.nports = ARRAY_SIZE(ipu6_csi_offsets);
> 
> So put the default 4 here instead of ARRAY_SIZE(),
> 
> <snip>
> 
> > +	if (is_ipu6_tgl(hw_ver)) {
> > +		isys_ipdata.csi2.nports = ARRAY_SIZE(ipu6_tgl_csi_offsets);
> 
> and then put 8 here instead of ARRAY_SIZE(), etc.
> 
> Then there no longer is a need to have 4 different arrays just
> to have them a different lenght.

Instead of having these arrays at all, you could directly use CSI_REG_BASE
+ CSI_REG_BASE_PORT(port_number) as the base address. There's only need to
store nr_of_ports in that case.

I'd prefer adding a macro for the numbers of ports on various devices, if
the information remains embedded in a function (rather than the big device
description elsewhere).

> 
> And this line:
> 
> > +		isys_ipdata.csi2.offsets = ipu6_tgl_csi_offsets;
> 
> Can then be fully dropped as well as similar lines below.
> 
> 
> > +	}
> > +
> > +	if (is_ipu6ep_mtl(hw_ver)) {
> > +		isys_ipdata.csi2.nports = ARRAY_SIZE(ipu6ep_mtl_csi_offsets);
> > +		isys_ipdata.csi2.offsets = ipu6ep_mtl_csi_offsets;
> 
> E.g. this one can also be dropped.

-- 
Regards,

Sakari Ailus

