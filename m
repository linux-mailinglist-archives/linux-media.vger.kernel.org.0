Return-Path: <linux-media+bounces-45844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D10F6C15D71
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 17:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 18C175028A5
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 16:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE15342141;
	Tue, 28 Oct 2025 16:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="na3Dwu2K"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68973370E2;
	Tue, 28 Oct 2025 16:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761669076; cv=none; b=UG8+3AaozledH121imWKJXc4csXd+JK+a9j8gIMNIorSvWo0tt00o0XITC6INa17ihPDgitdeeV4WYxgZEYUDZMpd8zNXkQ7B+Z4aCYHqN9nnmtLUZdaWwaeDcGZsoLBU6op5C5BhzYlrezm2BRW7ak10XZhXLIGxnqi5TVRARY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761669076; c=relaxed/simple;
	bh=LEa/LtulEX7iu5siVVB8zT5KqHE8MDqhFS/uQJ5ajdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B44dd3hwIRET/M/i6KcS6FAuMKy02yZv5pRLaFKeNp9P6xaUH3kmHSKT2DW/5ssWQAqUTolGzFF3g+3syan0aq4PWYMUldW4R4GBTndoQap5bgAQkPPTB4wuy1x5dxSqUAzFtutqzy+/cvUeTm8wpyhP5n8HvB1A9dSxO645TLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=na3Dwu2K; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761669075; x=1793205075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LEa/LtulEX7iu5siVVB8zT5KqHE8MDqhFS/uQJ5ajdk=;
  b=na3Dwu2KRFS2OloJQCzHm1LJ43CkR+XSnE58b74aK5PMHLQthWDwxsGH
   1Bmwv3UhBVwgUZ/wkHpSy9jZboDJtjHPvV5wgnBt1GIUJBYhhyu6tCnnM
   7kXDvm3SOiGUFF2hacJO98FvjvUgAGIOunwLEzA3BsA0JlV8LWiQCp4GQ
   v6Hj5SDzgS8a7pdqi92NNnRBjQORu0XH+7LyRGuFZAka7BymtUS3qvPyb
   pY8lSXhJfcnZ5naH3x1rUMP6C0jC3ovZjtViVh6PPFU/Hk9UKfQmj2+ak
   eFGjEy8zKBE0BL52iNLMstA/8/QQ52C3bZ6t8PovOCGTgJ/O3QbQP1ls0
   w==;
X-CSE-ConnectionGUID: h5kTLgnySz+P3K5i6yy3JQ==
X-CSE-MsgGUID: vqmv4SARTJq5IEqYJUzsTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81406252"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="81406252"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:31:14 -0700
X-CSE-ConnectionGUID: 02lDYFW7SiepysPC7ybIxg==
X-CSE-MsgGUID: CX23qSOKSdWUWvR1519K+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="185287673"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.104])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:31:10 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 06FA0121E88;
	Tue, 28 Oct 2025 18:31:08 +0200 (EET)
Date: Tue, 28 Oct 2025 18:31:08 +0200
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
Message-ID: <aQDvzKMXhVlR2G3J@kekkonen.localdomain>
References: <20250819120428.83437-1-clamor95@gmail.com>
 <aLB_7YS9HsfzfadI@kekkonen.localdomain>
 <CAPVz0n1mXvdyzshei8Mbw7KVYCkQjziBA95ton4MKXPnPd0kbQ@mail.gmail.com>
 <aQDuOSUYbuoLoFbf@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQDuOSUYbuoLoFbf@kekkonen.localdomain>

On Tue, Oct 28, 2025 at 06:24:25PM +0200, Sakari Ailus wrote:
> Hi Svyatoslav,
> 
> On Fri, Aug 29, 2025 at 09:20:10PM +0300, Svyatoslav Ryhel wrote:
> > чт, 28 серп. 2025 р. о 19:12 Sakari Ailus <sakari.ailus@linux.intel.com> пише:
> > >
> > > Hi Svyatoslaw,
> > >
> > > On Tue, Aug 19, 2025 at 03:04:25PM +0300, Svyatoslav Ryhel wrote:
> > > > Add driver for Sony IMX111 CMOS sensor found in LG Optimus 4X and Vu
> > > > smartphones.
> > >
> > > Thanks for the set.
> > >
> > > I wonder how would the sensor work with the CCS driver. The register layout
> > > appears to be very much aligned with that (I haven't checked whether there
> > > are MSRs that depend on the mode).
> > >
> > 
> > After deeper testing I have found that imx111 may be nokia,smia
> > compatible, at least most of general registers and CCS logic is
> > applicable. Some of registers may cause issues, for example,
> > "phy_ctrl_capability" = 0, 0x0 and some insane pll ranges. Maybe that
> > can be addressed with a firmware patch idk. The trickiest part is that
> > each mode requires non-standard and non-common manufacturer code
> > (0x3xxx ranges). If you can explain how to address these issues, I
> > would love to add imx111 and a few other modules into list of CCS
> > supported devices.
> 
> On a closer look, only the image size related configuration and a little
> more appears to be CCS-like. That's not enough to configure the sensor;
> this is conveyed in the MSR space which indeed makes the sensor difficult
> to control using the CCS driver, unfortunately.

Ok, the driver appears to be doing quite a bit of register writes outside
the register lists, which is good, and what's there appears indeed largely
CCS compliant. The MSRs remain an issue; it'd take quite a bit of reverse
engineering to figure out what the registers are and how to configure them
in a generic way. I think that's doable but I'm not sure it is justifiable
considering the expected effort.

-- 
Sakari Ailus

