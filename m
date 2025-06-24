Return-Path: <linux-media+bounces-35739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A29AE6229
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17E7C7AEE67
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778E628136F;
	Tue, 24 Jun 2025 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b17630g9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E05B24EAB1;
	Tue, 24 Jun 2025 10:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760443; cv=none; b=KKEKUnpSCPwmDQt6pgkTuiLYteXruSUfglcB5Oynxt20ww9rLazC7P6Ydd6YE2cm22l3i+dfxDdd6pmwAo0Su1lmo90rznhrLsXa7QNFchbyrn43saoRSWv1y8okMQAbhtzK2tnjxKIQa2Nq6QWspf9K14OF0nYbwTTJiwg4U/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760443; c=relaxed/simple;
	bh=wUvreC2UbJVMy8/iEqDx1j3RiHEzErGNB+uB0eTJz40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OOC1mHCLcH/AaKHnNf7gpXYtr59MLoW80sgQ4AIwAMAZT9OjyzvRzTW0NZHdcDSvs6OXFHS2X7wsyP2tPXTiN/GqngpVpEm1Q54CGuHGkC99ZvnF/6T7LUc1wfnVNEqK2dfPgBGXbblqa2tjarxH6dIBFmDcbTy8jYNSKswbYhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b17630g9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750760442; x=1782296442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wUvreC2UbJVMy8/iEqDx1j3RiHEzErGNB+uB0eTJz40=;
  b=b17630g9jixRXbehq2+usEV8Ugkg0oY1NK7mF85lsO09GDNuXDlsaQi3
   c08uRDhPEMxRfw1+v9EUFqIJQkJzv9SkEg650v3Ye5sDRXS3PgMPiwCBs
   JF7gUNpS4gQN/gcohu5SjQukU8980JUz1XaqMWuyHs85lMLDYoP4eIwoW
   ZhikXD4MaEaEbafADEZPxTV8vihTwac0/n2dn7oYa5/TTvoVke9OPTWYr
   n+zeuSiqOaVMjZTpHqeryCD8JjI/AayRq3qPsJ2zxLPs2wWLCeSy9kpjK
   1WHN1YJQ0yIIINJJKJOFwSXccHHxuvLmz6VsJELjQblTZ2FM9Eqq3CAqY
   g==;
X-CSE-ConnectionGUID: mjcVxr19TBSiDDmJSBvarw==
X-CSE-MsgGUID: zjZcT9mBRNmxbvSXd4zIiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53064445"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="53064445"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 03:20:42 -0700
X-CSE-ConnectionGUID: 1EjwfBJQTGCYmQmGrTRf6Q==
X-CSE-MsgGUID: W/9E6YlGQ5eNp+eWeyB5jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="156267236"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.201])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 03:20:37 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3F87411F94F;
	Tue, 24 Jun 2025 13:20:34 +0300 (EEST)
Date: Tue, 24 Jun 2025 10:20:34 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Nirujogi, Pratap" <pnirujog@amd.com>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org,
	dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
	jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com,
	king.li@amd.com, dantony@amd.com, vengutta@amd.com,
	Svetoslav.Stoilov@amd.com, Yana.Zheleva@amd.com
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Message-ID: <aFp78tqHhe_IhV6d@kekkonen.localdomain>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <20250615000915.GQ10542@pendragon.ideasonboard.com>
 <53674c5f-6b68-49e7-bbb0-fd06fff344c3@amd.com>
 <8b16675a-c6ac-4619-aabe-ad2a4be6c964@amd.com>
 <20250623220503.GA15951@pendragon.ideasonboard.com>
 <425j7c6xvbbatdhxgjgjawzwfnjmjetg6rpnwfudbtg6qz6nay@dy5ldbuhtbvv>
 <aFp7tuXkU1jayPum@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFp7tuXkU1jayPum@kekkonen.localdomain>

On Tue, Jun 24, 2025 at 10:19:35AM +0000, Sakari Ailus wrote:
> Hi Mehdi,
> 
> On Tue, Jun 24, 2025 at 10:35:18AM +0200, Mehdi Djait wrote:
> > Hi Laurent, Hi Pratap,
> > 
> > Thank you for the patch
> > 
> > On Tue, Jun 24, 2025 at 01:05:03AM +0300, Laurent Pinchart wrote:
> > > (CC'ing Mehdi)
> > > 
> > > On Mon, Jun 23, 2025 at 05:51:48PM -0400, Nirujogi, Pratap wrote:
> > > > On 6/16/2025 6:49 PM, Nirujogi, Pratap wrote:
> > > > >>> +static int ov05c10_probe(struct i2c_client *client)
> > > > >>> +{
> > > > >>> +     struct ov05c10 *ov05c10;
> > > > >>> +     u32 clkfreq;
> > > > >>> +     int ret;
> > > > >>> +
> > > > >>> +     ov05c10 = devm_kzalloc(&client->dev, sizeof(*ov05c10), 
> > > > >>> GFP_KERNEL);
> > > > >>> +     if (!ov05c10)
> > > > >>> +             return -ENOMEM;
> > > > >>> +
> > > > >>> +     struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
> > > > >>> +
> > > > >>> +     ret = fwnode_property_read_u32(fwnode, "clock-frequency", 
> > > > >>> &clkfreq);
> > > > >>> +     if (ret)
> > > > >>> +             return  dev_err_probe(&client->dev, -EINVAL,
> > > > >>> +                                   "fail to get clock freq\n");
> > > > >>
> > > > >> Let's try to land
> > > > >> https://lore.kernel.org/linux-media/20250521104115.176950-1- 
> > > > >> mehdi.djait@linux.intel.com/
> > > > >> and replace the code above with devm_v4l2_sensor_clk_get().
> > > > >>
> > > > > Ok, we will verify on our side.
> > > > 
> > > > We tried using devm_v4l2_sensor_clk_get() and found its required to add 
> > > > support for software_node to make it work with this driver.
> > > 
> > > Why is that ?
> > > 
> > > > Please refer 
> > > > the changes below and let us know if these should be submitted as a 
> > > > separate patch.
> > 
> > The helper is still not merged, so no patch is required.
> > 
> > I will see if a change is needed from the helper side or the OV05C10 side.
> 
> I wonder if there's a better way to figure out if you're running on a DT or
> ACPI based system than getting the device's parents and checking which one
> you find first, DT or ACPI. I think that should work for now at least.

Or, rather, checking for non-OF node here would probably work the best. I
wouldn't expect these to be software node based on DT systems ever.

-- 
Regards,

Sakari Ailus

