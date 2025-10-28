Return-Path: <linux-media+bounces-45852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B0508C16035
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 17:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E410F348B9E
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 16:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56A62367B0;
	Tue, 28 Oct 2025 16:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mkxaOCfB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4502882B4;
	Tue, 28 Oct 2025 16:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670785; cv=none; b=TBJNRodVBCMv9O266sADIe0dpUeiTObZe/Vvs/jwPjQZ3pKx0hcb6tkZ/+Bh/HTtyoy/UbZcU3qvK1932dTSj0WbHysK1esUJYxq73svAslIjZp786GUR2+/S0ZF8WVlZlkLwTRdJpKTL7PhLC/jg8JSWBth8nUo/sNol040Zus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670785; c=relaxed/simple;
	bh=WlmcaPZh3FAEdN/6qXw/fqbntM6C+LPAQ9fLf0k7lnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+4TZowpWAejTKewZ65CuS0oarMRu1rufqWhNiShwM+sRiunrcCf/T8pMb62hdi4Bvg5FlbIJIMBWjk0etZzgI22oqoUbEyt8u6QG1yulX6ROJcKZoVN81xDPTfktzmmcWmdE5G5CEGWne36ffYU3JStpJXLdP1vFQTXpxb03i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mkxaOCfB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761670783; x=1793206783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WlmcaPZh3FAEdN/6qXw/fqbntM6C+LPAQ9fLf0k7lnc=;
  b=mkxaOCfBy1sXqCMgpU1+yKEUU/blA35PNZc+eJPevseUxfVe+LklzYG1
   3Gk5HLmDC1FsR7BFe554nnFPt0z1BrEHgk/o85978WLkW5XCl2EYWZKwC
   l9DPWINqYjpaIi5LtqXbNIRPSYcVRFzXtV5AhhobF1Q9ASHybHC5u7Xux
   zRp7K9srSmCRNZ0uiyFgCU6NmkrQOimm2UVD64tP1tj6EF1vIVBTGLTEG
   JdHLBm1+XbZqATIIwCTeVvZ+gi5y3Er3L2oXstfOmcmPIbqWbIJHPZwqX
   bWHFQOcXckt7r1SiK1wfl8UM1nN3IvH+7DEYQp0/uffhflHaDs1Dm6o3B
   w==;
X-CSE-ConnectionGUID: GHsuNVLQQOi/StkT87cfyA==
X-CSE-MsgGUID: JhCazu2RSYipJVCe6veLpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86406395"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="86406395"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:59:32 -0700
X-CSE-ConnectionGUID: 2PbBhK9LRGWi0Y4KcExGmw==
X-CSE-MsgGUID: JQxp2GmST+qcjw//EZHrqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="186159231"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.104])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:59:28 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 46B66121E5D;
	Tue, 28 Oct 2025 18:59:25 +0200 (EET)
Date: Tue, 28 Oct 2025 18:59:25 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] media: i2c: add Sony IMX111 CMOS camera sensor
 driver
Message-ID: <aQD2baCkvRCbZG51@kekkonen.localdomain>
References: <20250819120428.83437-1-clamor95@gmail.com>
 <aLB_7YS9HsfzfadI@kekkonen.localdomain>
 <CAPVz0n1mXvdyzshei8Mbw7KVYCkQjziBA95ton4MKXPnPd0kbQ@mail.gmail.com>
 <aQDuOSUYbuoLoFbf@kekkonen.localdomain>
 <aQDvzKMXhVlR2G3J@kekkonen.localdomain>
 <CAPVz0n3E08Ft1q5QS-aT8WUQNmTe5uOs=d2VHovNH1BbdQWVRQ@mail.gmail.com>
 <aQDxeXV37IHpKeKX@kekkonen.localdomain>
 <CAPVz0n2UzvivdUdX5QapduYZ=+LbZp+LPJnSKJmd3WRe35BwaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n2UzvivdUdX5QapduYZ=+LbZp+LPJnSKJmd3WRe35BwaQ@mail.gmail.com>

On Tue, Oct 28, 2025 at 06:55:11PM +0200, Svyatoslav Ryhel wrote:
> вт, 28 жовт. 2025 р. о 18:38 Sakari Ailus <sakari.ailus@linux.intel.com> пише:
> >
> > On Tue, Oct 28, 2025 at 06:34:15PM +0200, Svyatoslav Ryhel wrote:
> > > вт, 28 жовт. 2025 р. о 18:31 Sakari Ailus <sakari.ailus@linux.intel.com> пише:
> > > >
> > > > On Tue, Oct 28, 2025 at 06:24:25PM +0200, Sakari Ailus wrote:
> > > > > Hi Svyatoslav,
> > > > >
> > > > > On Fri, Aug 29, 2025 at 09:20:10PM +0300, Svyatoslav Ryhel wrote:
> > > > > > чт, 28 серп. 2025 р. о 19:12 Sakari Ailus <sakari.ailus@linux.intel.com> пише:
> > > > > > >
> > > > > > > Hi Svyatoslaw,
> > > > > > >
> > > > > > > On Tue, Aug 19, 2025 at 03:04:25PM +0300, Svyatoslav Ryhel wrote:
> > > > > > > > Add driver for Sony IMX111 CMOS sensor found in LG Optimus 4X and Vu
> > > > > > > > smartphones.
> > > > > > >
> > > > > > > Thanks for the set.
> > > > > > >
> > > > > > > I wonder how would the sensor work with the CCS driver. The register layout
> > > > > > > appears to be very much aligned with that (I haven't checked whether there
> > > > > > > are MSRs that depend on the mode).
> > > > > > >
> > > > > >
> > > > > > After deeper testing I have found that imx111 may be nokia,smia
> > > > > > compatible, at least most of general registers and CCS logic is
> > > > > > applicable. Some of registers may cause issues, for example,
> > > > > > "phy_ctrl_capability" = 0, 0x0 and some insane pll ranges. Maybe that
> > > > > > can be addressed with a firmware patch idk. The trickiest part is that
> > > > > > each mode requires non-standard and non-common manufacturer code
> > > > > > (0x3xxx ranges). If you can explain how to address these issues, I
> > > > > > would love to add imx111 and a few other modules into list of CCS
> > > > > > supported devices.
> > > > >
> > > > > On a closer look, only the image size related configuration and a little
> > > > > more appears to be CCS-like. That's not enough to configure the sensor;
> > > > > this is conveyed in the MSR space which indeed makes the sensor difficult
> > > > > to control using the CCS driver, unfortunately.
> > > >
> > > > Ok, the driver appears to be doing quite a bit of register writes outside
> > > > the register lists, which is good, and what's there appears indeed largely
> > > > CCS compliant. The MSRs remain an issue; it'd take quite a bit of reverse
> > > > engineering to figure out what the registers are and how to configure them
> > > > in a generic way. I think that's doable but I'm not sure it is justifiable
> > > > considering the expected effort.
> > > >
> > >
> > > I have deciphered a lot already since downstream provides only
> > > register writing sequences. Everything that left is 0x3xxx which seems
> > > to refer a vendor region and it is not documented anywhere.
> >
> > That's what I'd expect, too, with the possible exception of the datasheet,
> > but even sensor datasheets often omit a lot of information.
> >
> 
> There is no commonly available datasheet for this model. From what I
> have seen from similar models, 0x3xxx is vendor region and as you said
> "datasheets often omit a lot of information" which is the case.
> 
> > I believe you're already aware of
> > <URL:https://www.mipi.org/specifications/camera-command-set>?
> >
> 
> Yes, but since this module is from pre-CCS era or was created right
> before this standard was introduced, the module lacks a quite a bit of
> registers and configurations required by CCS. Keep in mind that sensor
> is used in the phone from 2012.

Ah, I wasn't aware it was that old. ;) Well, there was another driver
merged recently which was for a sensor from 2014.

-- 
Sakari Ailus

