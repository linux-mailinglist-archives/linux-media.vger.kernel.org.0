Return-Path: <linux-media+bounces-45841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA13C15D28
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 17:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDDD63BE131
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 16:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACB428A701;
	Tue, 28 Oct 2025 16:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMhRKhSR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91542275AE1;
	Tue, 28 Oct 2025 16:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761668674; cv=none; b=YLJgZ63IbzLV5rGVWEgTL3ZXKZsAQOIQJa7dTh63yC0rGrfiIIOu6m/J9R7ahY7mjPk3bguFrCNJEd73MFkTgxxJS9x7FVSSEd5P9S48RMsEiWH+5eXlobowi9Gf5Rq2tUdrdJA/jx1XiR/D4pCLjQkXwXC95xoMiln6iTW/iXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761668674; c=relaxed/simple;
	bh=VRe6V7125oxWUGJk5S4vI+ueHpEsiwZrtR7k9jWbfW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2i4CIHl7M9NWejm1oxDmh1+CDeCnPguLTCDde5EH+tuRhQ097DJThl6q9E4SeItkWMrsnk+YBjqEoYU/GQAenWjxI+FUL5PWDMM8YcGZbjtcIT3zH2pz9V3ZZ6Ps5/vNWqblDJgPiHfyfQvekfdJKuk9FmYmttZZtxU9PjbVko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMhRKhSR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761668673; x=1793204673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VRe6V7125oxWUGJk5S4vI+ueHpEsiwZrtR7k9jWbfW4=;
  b=dMhRKhSRG+ExTt0+AjEtP4rZp3ttd+BW9x/2CG370z8VevBdyc8i4MRV
   555pELkjfe6e3vWvBzLZKeLqORQepwAI9t60DOHekSk5Q3OhV2o2GbXFu
   d8PMnYNqmp6PQx6MYcu9zI7FAIcTEzpIupjJXT3qsvu98ldTL8XoiCPSO
   OUOqQXCAWr1O+UBPhuYmtw45bPyQrwA0OdVp6Q5bZPn3BIcPrPkONTXiu
   Q5xd0lM1+bXYKWccrV1FpkwLitRghf9eFpWSOP0mpW4Jdy2savmPdqvae
   W+DxauOINdUM12pOT6wbTXIe/21wjbn1ofuWhq4UpdiD9OqbdDIQ8XvkU
   A==;
X-CSE-ConnectionGUID: aSwx/yx9QKiE2Fs47PFfrw==
X-CSE-MsgGUID: vIM9vD8WSGmMbPD4bv36Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63661881"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63661881"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:24:33 -0700
X-CSE-ConnectionGUID: jxtDhWiGQRm+Dx+pMnwiAg==
X-CSE-MsgGUID: sSNMMyz8Sc+00Hvqbi0YPA==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.104])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:24:28 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 69E9A121E5D;
	Tue, 28 Oct 2025 18:24:25 +0200 (EET)
Date: Tue, 28 Oct 2025 18:24:25 +0200
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
Message-ID: <aQDuOSUYbuoLoFbf@kekkonen.localdomain>
References: <20250819120428.83437-1-clamor95@gmail.com>
 <aLB_7YS9HsfzfadI@kekkonen.localdomain>
 <CAPVz0n1mXvdyzshei8Mbw7KVYCkQjziBA95ton4MKXPnPd0kbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n1mXvdyzshei8Mbw7KVYCkQjziBA95ton4MKXPnPd0kbQ@mail.gmail.com>

Hi Svyatoslav,

On Fri, Aug 29, 2025 at 09:20:10PM +0300, Svyatoslav Ryhel wrote:
> чт, 28 серп. 2025 р. о 19:12 Sakari Ailus <sakari.ailus@linux.intel.com> пише:
> >
> > Hi Svyatoslaw,
> >
> > On Tue, Aug 19, 2025 at 03:04:25PM +0300, Svyatoslav Ryhel wrote:
> > > Add driver for Sony IMX111 CMOS sensor found in LG Optimus 4X and Vu
> > > smartphones.
> >
> > Thanks for the set.
> >
> > I wonder how would the sensor work with the CCS driver. The register layout
> > appears to be very much aligned with that (I haven't checked whether there
> > are MSRs that depend on the mode).
> >
> 
> After deeper testing I have found that imx111 may be nokia,smia
> compatible, at least most of general registers and CCS logic is
> applicable. Some of registers may cause issues, for example,
> "phy_ctrl_capability" = 0, 0x0 and some insane pll ranges. Maybe that
> can be addressed with a firmware patch idk. The trickiest part is that
> each mode requires non-standard and non-common manufacturer code
> (0x3xxx ranges). If you can explain how to address these issues, I
> would love to add imx111 and a few other modules into list of CCS
> supported devices.

On a closer look, only the image size related configuration and a little
more appears to be CCS-like. That's not enough to configure the sensor;
this is conveyed in the MSR space which indeed makes the sensor difficult
to control using the CCS driver, unfortunately.

Let me review v2.

-- 
Kind regards,

Sakari Ailus

