Return-Path: <linux-media+bounces-35738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92639AE621A
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9706C1890E6A
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3ED281356;
	Tue, 24 Jun 2025 10:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1EABgn1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28904279DC8;
	Tue, 24 Jun 2025 10:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760384; cv=none; b=uWYXrjZbRr9F9C4R6Sjp/4ROzDKppuqw3CFPnjR3MFumO+dgfFbB/veba23m8A7rfPFTKxyTHBnq6o5WyHhGFaMzhOAVdKsDJh6CxliLBY1VRPpXfhFJDDFuSGsxUav8QwYYej26lR82sGP3UdprOKtRE1Nl+8IyxnzQl2+XX14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760384; c=relaxed/simple;
	bh=0RF8iqDM92QzkMF6cD+9rOw6cxI5GsrXcz00sW/ZFLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgTJin6Kke062XvDpE6H8NtPSwW+jkbICM3IdPnZnNb9X/0pbXRRe0uT+jiQs1GWX4aQ67AcNylPIGsiH3oTIcVZbKqrSGM/oERFc7QkIGNZKuHTJDmVrpMc858OrrGDT0ojobPMb6ZI8YOQDoGG7zgwRn+RhELncfPmy82ZZhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1EABgn1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750760383; x=1782296383;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0RF8iqDM92QzkMF6cD+9rOw6cxI5GsrXcz00sW/ZFLE=;
  b=T1EABgn1QntSSWeT416vNFIdV/WbQzqRemRh6z4OyLyWDdUNBRZcH78u
   9VEXcrA6hum01vDOKAfErYFiP6IVr7ao9K8lv1OiK01qqL5ktmGU1HJ3x
   MkvwAasgfDzDLuxXWTjZBQlXyy4ZaNraUXr+b/x6gwKxRrI7hgEk58A0X
   H0YSy7kJgDQjywer89DBAJeYU5o3FefWSfikZMyeVtJSjdoFXZ/cUvMHU
   PHI1JSjWsZWgGVLKkRv+TFyjDNnSlxtQHxFHTtFaXj9lXnX40pcQWOF0E
   sp9piW0A6gvxgdKcrObV9MMnVWhhemmp3orNHA29f1mvMyDe5qUigwGku
   Q==;
X-CSE-ConnectionGUID: DZvNnkq1RZ6AqWgou2NhNQ==
X-CSE-MsgGUID: 0pLFcWz4R7q6zbnyGfUeOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53132022"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="53132022"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 03:19:42 -0700
X-CSE-ConnectionGUID: itoyPHysRYi6XQDcd7py6Q==
X-CSE-MsgGUID: 4UyhsgO/Saa7w4MqXWhlOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="182755722"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.201])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 03:19:38 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 05C3811F94F;
	Tue, 24 Jun 2025 13:19:35 +0300 (EEST)
Date: Tue, 24 Jun 2025 10:19:34 +0000
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
Message-ID: <aFp7tuXkU1jayPum@kekkonen.localdomain>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <20250615000915.GQ10542@pendragon.ideasonboard.com>
 <53674c5f-6b68-49e7-bbb0-fd06fff344c3@amd.com>
 <8b16675a-c6ac-4619-aabe-ad2a4be6c964@amd.com>
 <20250623220503.GA15951@pendragon.ideasonboard.com>
 <425j7c6xvbbatdhxgjgjawzwfnjmjetg6rpnwfudbtg6qz6nay@dy5ldbuhtbvv>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <425j7c6xvbbatdhxgjgjawzwfnjmjetg6rpnwfudbtg6qz6nay@dy5ldbuhtbvv>

Hi Mehdi,

On Tue, Jun 24, 2025 at 10:35:18AM +0200, Mehdi Djait wrote:
> Hi Laurent, Hi Pratap,
> 
> Thank you for the patch
> 
> On Tue, Jun 24, 2025 at 01:05:03AM +0300, Laurent Pinchart wrote:
> > (CC'ing Mehdi)
> > 
> > On Mon, Jun 23, 2025 at 05:51:48PM -0400, Nirujogi, Pratap wrote:
> > > On 6/16/2025 6:49 PM, Nirujogi, Pratap wrote:
> > > >>> +static int ov05c10_probe(struct i2c_client *client)
> > > >>> +{
> > > >>> +     struct ov05c10 *ov05c10;
> > > >>> +     u32 clkfreq;
> > > >>> +     int ret;
> > > >>> +
> > > >>> +     ov05c10 = devm_kzalloc(&client->dev, sizeof(*ov05c10), 
> > > >>> GFP_KERNEL);
> > > >>> +     if (!ov05c10)
> > > >>> +             return -ENOMEM;
> > > >>> +
> > > >>> +     struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
> > > >>> +
> > > >>> +     ret = fwnode_property_read_u32(fwnode, "clock-frequency", 
> > > >>> &clkfreq);
> > > >>> +     if (ret)
> > > >>> +             return  dev_err_probe(&client->dev, -EINVAL,
> > > >>> +                                   "fail to get clock freq\n");
> > > >>
> > > >> Let's try to land
> > > >> https://lore.kernel.org/linux-media/20250521104115.176950-1- 
> > > >> mehdi.djait@linux.intel.com/
> > > >> and replace the code above with devm_v4l2_sensor_clk_get().
> > > >>
> > > > Ok, we will verify on our side.
> > > 
> > > We tried using devm_v4l2_sensor_clk_get() and found its required to add 
> > > support for software_node to make it work with this driver.
> > 
> > Why is that ?
> > 
> > > Please refer 
> > > the changes below and let us know if these should be submitted as a 
> > > separate patch.
> 
> The helper is still not merged, so no patch is required.
> 
> I will see if a change is needed from the helper side or the OV05C10 side.

I wonder if there's a better way to figure out if you're running on a DT or
ACPI based system than getting the device's parents and checking which one
you find first, DT or ACPI. I think that should work for now at least.

-- 
Regards,

Sakari Ailus

