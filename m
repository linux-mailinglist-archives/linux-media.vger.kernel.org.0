Return-Path: <linux-media+bounces-45847-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F29C15E6D
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 17:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79DFA189B39A
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 16:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2221133F8C6;
	Tue, 28 Oct 2025 16:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZgTkqKY6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF20327F00A;
	Tue, 28 Oct 2025 16:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761669505; cv=none; b=szH6vLt4rBcLJyM9K/2U+BV/vTT1D4/4cMY5Tzsp08ipcPXdwXr/qrzbp5bBSlnR0tMjyp8tFl8kT7R1+1ujyPHH0XWYOwff/Q4Jysk1UjCVN3zPGjblcG/dc7UjEGv9bnKk66/v4JIxISPN5RqSsfnXMIwy0mvPa4ziRlLY680=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761669505; c=relaxed/simple;
	bh=ZDoVW0phZTZ/KSYf4G3aRZC3br0hCZvkLMwglbY+L+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Perq9XxXD7YtlwgL7J4BHME2Vw5Sv+H6ltxRV6kwV1v0mslwJmiEx668hOrizgbvzm7KuE0vNcL/4JZ0/ogEnCfORGBok6Pk4aKhrrBc8Rzb+n2LkssvyMx8FoKOAw8u1ooLkdlxH4G3rdkvG9BM5Ll2D+HsEPCJ9kbxhqtiwus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZgTkqKY6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761669504; x=1793205504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZDoVW0phZTZ/KSYf4G3aRZC3br0hCZvkLMwglbY+L+I=;
  b=ZgTkqKY6flUAV8m2t5xvZucfLD+p249A6IK3jjgggpHY61/rAjXDFIWs
   3/O8oTxKfskpPyPim/NAXiZ8a3VD5a3ma82gQfPenTbl/Szeb1bCiWWxU
   wgNGZkCY0uObFb0fwwPoFE2Cj1VzAtj4U+nwKJ/eHEC2bNmVWaI+NaBqW
   EzG+WzaHZtY6dAKKe1c3dIPhlZhuKRaCISRL+QHn4tcGOSQIhcRiGnmAj
   BFNntGXTxuK8d6mCj8BG7R2URnxuzgLHiQCbUs+2838MmLcC8cSBYAI08
   td1yBYu9UFDxHHYNdSQeSFcF0Jtyo8fOSAlSkJ3I5ImLaP5qSQqIi3pFl
   Q==;
X-CSE-ConnectionGUID: WqOI9xSyRn+0/TRtaegpcA==
X-CSE-MsgGUID: BbwoB0/MSJ6D0RkEuHjLBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81198497"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="81198497"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:38:24 -0700
X-CSE-ConnectionGUID: QDQWITfDTcCcmdG7SlTaPg==
X-CSE-MsgGUID: 5AsjzWDETaiOdcaAKoFztw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="185484655"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.104])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:38:19 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2647F121E5D;
	Tue, 28 Oct 2025 18:38:17 +0200 (EET)
Date: Tue, 28 Oct 2025 18:38:17 +0200
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
Message-ID: <aQDxeXV37IHpKeKX@kekkonen.localdomain>
References: <20250819120428.83437-1-clamor95@gmail.com>
 <aLB_7YS9HsfzfadI@kekkonen.localdomain>
 <CAPVz0n1mXvdyzshei8Mbw7KVYCkQjziBA95ton4MKXPnPd0kbQ@mail.gmail.com>
 <aQDuOSUYbuoLoFbf@kekkonen.localdomain>
 <aQDvzKMXhVlR2G3J@kekkonen.localdomain>
 <CAPVz0n3E08Ft1q5QS-aT8WUQNmTe5uOs=d2VHovNH1BbdQWVRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n3E08Ft1q5QS-aT8WUQNmTe5uOs=d2VHovNH1BbdQWVRQ@mail.gmail.com>

On Tue, Oct 28, 2025 at 06:34:15PM +0200, Svyatoslav Ryhel wrote:
> вт, 28 жовт. 2025 р. о 18:31 Sakari Ailus <sakari.ailus@linux.intel.com> пише:
> >
> > On Tue, Oct 28, 2025 at 06:24:25PM +0200, Sakari Ailus wrote:
> > > Hi Svyatoslav,
> > >
> > > On Fri, Aug 29, 2025 at 09:20:10PM +0300, Svyatoslav Ryhel wrote:
> > > > чт, 28 серп. 2025 р. о 19:12 Sakari Ailus <sakari.ailus@linux.intel.com> пише:
> > > > >
> > > > > Hi Svyatoslaw,
> > > > >
> > > > > On Tue, Aug 19, 2025 at 03:04:25PM +0300, Svyatoslav Ryhel wrote:
> > > > > > Add driver for Sony IMX111 CMOS sensor found in LG Optimus 4X and Vu
> > > > > > smartphones.
> > > > >
> > > > > Thanks for the set.
> > > > >
> > > > > I wonder how would the sensor work with the CCS driver. The register layout
> > > > > appears to be very much aligned with that (I haven't checked whether there
> > > > > are MSRs that depend on the mode).
> > > > >
> > > >
> > > > After deeper testing I have found that imx111 may be nokia,smia
> > > > compatible, at least most of general registers and CCS logic is
> > > > applicable. Some of registers may cause issues, for example,
> > > > "phy_ctrl_capability" = 0, 0x0 and some insane pll ranges. Maybe that
> > > > can be addressed with a firmware patch idk. The trickiest part is that
> > > > each mode requires non-standard and non-common manufacturer code
> > > > (0x3xxx ranges). If you can explain how to address these issues, I
> > > > would love to add imx111 and a few other modules into list of CCS
> > > > supported devices.
> > >
> > > On a closer look, only the image size related configuration and a little
> > > more appears to be CCS-like. That's not enough to configure the sensor;
> > > this is conveyed in the MSR space which indeed makes the sensor difficult
> > > to control using the CCS driver, unfortunately.
> >
> > Ok, the driver appears to be doing quite a bit of register writes outside
> > the register lists, which is good, and what's there appears indeed largely
> > CCS compliant. The MSRs remain an issue; it'd take quite a bit of reverse
> > engineering to figure out what the registers are and how to configure them
> > in a generic way. I think that's doable but I'm not sure it is justifiable
> > considering the expected effort.
> >
> 
> I have deciphered a lot already since downstream provides only
> register writing sequences. Everything that left is 0x3xxx which seems
> to refer a vendor region and it is not documented anywhere.

That's what I'd expect, too, with the possible exception of the datasheet,
but even sensor datasheets often omit a lot of information.

I believe you're already aware of
<URL:https://www.mipi.org/specifications/camera-command-set>?

-- 
Sakari Ailus

