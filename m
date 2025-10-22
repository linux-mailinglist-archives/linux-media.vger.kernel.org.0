Return-Path: <linux-media+bounces-45211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC59BFAE6E
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 10:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 710A8354217
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 08:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91828309EE3;
	Wed, 22 Oct 2025 08:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cr9876m1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F0D30B524;
	Wed, 22 Oct 2025 08:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761121882; cv=none; b=dF65nLUdqJLttd/yObyxzPGAgKXHOhGRgoHZfzjKrIfnPy4m10eF1Y6VXc6HZOKmyt7WF4yTegU16orKI8+AnkcpIwu0E8dzfwJtAq5sFbL0CWhoVKEcinthlnSD/ACkvUQc0f5h2LRsbsMWkCOzRI8k6cb5vZnJ2vbpOie7b8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761121882; c=relaxed/simple;
	bh=uM3DPtDP/NXToqPWcEqARm1yWCJXGsekG9NFgcQe/FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jkzto5NRwHFmlz7A0MpKwVM3rhwhC3Avm5H+E7Xz0C0ZcinSfEmFWTl7SyIldlNQ1xjHSkiwPDHQdoVnFhGGNSzCfw1nYfMl3hDlBFZmEQSoasJNAYPS9ZbdEL3vr7QXTzudKR3VHSgnPg7fSK80vkSajVPTrhlaJSFAggOuMYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cr9876m1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761121881; x=1792657881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uM3DPtDP/NXToqPWcEqARm1yWCJXGsekG9NFgcQe/FI=;
  b=Cr9876m1y16k6mckus+Wxot2yOUkvLMR0A2tOoOMNsTQtjuYI7v8KIqt
   dDOXJtqm8Ki3jCLk3x2tSOWS6hmf+OpYG09WJooLEBSZ/M/gkbY+V6joh
   LtCS2uPEzUe4q1sfc8UgYT0Ck20cSZ9C0vpw5yD/fgTHU/akK1Fzc7OsW
   zU+AGwpDWxrJOU/h3FBTnAJIXEaqEpaaJdR78W/tMEIYgXd/te9Mvcff0
   65s0SW2t1UajYB9bBBdQnlXzy8Q5QnKQcr7hw8qOKTHN1fPu16uocUAy8
   emf+LJadKF3UaiVgB5q+Kr6UkPAvhEiUNMMX1OqPrN0WcSJroiLEppEV5
   Q==;
X-CSE-ConnectionGUID: dC8YjrxzRleCdCj4mPu3ZQ==
X-CSE-MsgGUID: ru2iPVW6SS64hB0HP5qPCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63158021"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63158021"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 01:31:20 -0700
X-CSE-ConnectionGUID: tioCZsunS5ygGxtBNbwpWg==
X-CSE-MsgGUID: uPwzrafqRg2g13cz0wpRBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="183516841"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.28])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 01:31:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 72CCA11F87B;
	Wed, 22 Oct 2025 11:31:15 +0300 (EEST)
Date: Wed, 22 Oct 2025 11:31:15 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: add Samsung S5KJN1 image sensor
 device driver
Message-ID: <aPiWUxVMXUvOgY_O@kekkonen.localdomain>
References: <20251016020419.2137290-1-vladimir.zapolskiy@linaro.org>
 <20251016020419.2137290-3-vladimir.zapolskiy@linaro.org>
 <aPdRlygxV1TCCUU3@kekkonen.localdomain>
 <33d9eaad-1043-4816-9620-d7625556bc65@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33d9eaad-1043-4816-9620-d7625556bc65@linaro.org>

Hi Vladimir,

On Tue, Oct 21, 2025 at 01:16:09PM +0300, Vladimir Zapolskiy wrote:
> Hi Sakari,
> 
> On 10/21/25 12:25, Sakari Ailus wrote:
> > Hi Vladimir,
> > 
> > On Thu, Oct 16, 2025 at 05:04:19AM +0300, Vladimir Zapolskiy wrote:
> > > +	{ S5KJN1_REG_X_ADDR_START,  0x0000 },
> > > +	{ S5KJN1_REG_Y_ADDR_START,  0x0000 },
> > > +	{ S5KJN1_REG_X_ADDR_END,    0x1fff },
> > > +	{ S5KJN1_REG_Y_ADDR_END,    0x181f },
> > > +	{ S5KJN1_REG_X_OUTPUT_SIZE, 0x0ff0 },
> > > +	{ S5KJN1_REG_Y_OUTPUT_SIZE, 0x0c00 },
> > > +	{ CCI_REG16(0x0350), 0x0008 },
> > > +	{ CCI_REG16(0x0352), 0x0008 },
> > > +	{ CCI_REG16(0x0900), 0x0122 },
> > > +	{ CCI_REG16(0x0380), 0x0002 },
> > > +	{ CCI_REG16(0x0382), 0x0002 },
> > > +	{ CCI_REG16(0x0384), 0x0002 },
> > > +	{ CCI_REG16(0x0386), 0x0002 },
> > > +	{ CCI_REG16(0x0110), 0x1002 },
> > > +	{ CCI_REG16(0x0114), 0x0301 },
> > > +	{ CCI_REG16(0x0116), 0x3000 },
> > > +
> > > +	/* Clock settings */
> > > +	{ CCI_REG16(0x0136), 0x1800 },
> > > +	{ CCI_REG16(0x013e), 0x0000 },
> > > +	{ CCI_REG16(0x0300), 0x0006 },
> > > +	{ CCI_REG16(0x0302), 0x0001 },
> > > +	{ CCI_REG16(0x0304), 0x0004 },
> > > +	{ CCI_REG16(0x0306), 0x008c },
> > > +	{ CCI_REG16(0x0308), 0x0008 },
> > > +	{ CCI_REG16(0x030a), 0x0001 },
> > > +	{ CCI_REG16(0x030c), 0x0000 },
> > > +	{ CCI_REG16(0x030e), 0x0004 },
> > > +	{ CCI_REG16(0x0310), 0x0092 },
> > > +	{ CCI_REG16(0x0312), 0x0000 },
> > > +
> > > +	{ CCI_REG16(0x080e), 0x0000 },
> > > +	{ S5KJN1_REG_VTS,    0x10c0 },
> > > +	{ S5KJN1_REG_HTS,    0x1100 },
> > > +	{ CCI_REG16(0x0702), 0x0000 },
> > > +	{ S5KJN1_REG_EXPOSURE, 0x0100 },
> > > +	{ CCI_REG16(0x0200), 0x0100 },
> > > +	{ CCI_REG16(0x0d00), 0x0101 },
> > > +	{ CCI_REG16(0x0d02), 0x0101 },
> > > +	{ CCI_REG16(0x0d04), 0x0102 },
> > > +	{ CCI_REG16(0x6226), 0x0000 },
> > > +	{ CCI_REG16(0x0816), 0x1c00 },
> > 
> > This looks interestingly CCS compliant. It might be worth taking the MSRs
> > and trying with the CCS driver.
> 
> The register map is similar to CCS (and it's explicitly mentioned in a comment
> withing the driver), but it is not compatible due to a known number of
> registers, for instance 0x0310 register is not a CCS_R_PLL_MODE, but a PLL
> setting etc.
> 
> The same reasoning is applicable to the second sensor driver Samsung S5K3M5,
> moreover even these two sensors have different interfaces to registers,
> e.g. it's not possible to separately configure HLIP/VFLIP settings for the
> latter one, while it's working nicely, and even a "stream on" control bit
> in 0x100 (CCS_R_MODE_SELECT) register are different...
> 
> So, I believe it would be more tedious and unclean to add a number of
> exceptions to the CSS driver rather than to add a sensor specific driver.

CCS has a mechanism (via CCS static data) to cover cases such as this
albeit it wasn't intended for standard registers. Perhaps it should be
extended. Either way, that's for another time.

I'll review the rest of the driver soon.

> 
> > Where is this sensor found?
> > 
> 
> For a while I work on Qualcomm ISP support, and these Samsung sensors are
> found on SM8x50-HDK and SM8x50-QRD boards:
> 
> https://lore.kernel.org/linux-arm-msm/20251013235500.1883847-1-vladimir.zapolskiy@linaro.org/
> 
> If you ask about the downstream code, there is a multitude of downstream
> Android drivers of these Samsung sensors found on github.com, the init
> sequence for modes is taken from these drivers and the driver is tested
> on the boards in my access.

Ack.

-- 
Kind regards,

Sakari Ailus

