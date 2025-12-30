Return-Path: <linux-media+bounces-49737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E83D4CE9E41
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 15:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D913302533E
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3399D258EE9;
	Tue, 30 Dec 2025 14:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZ/WwwoH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F324519C540;
	Tue, 30 Dec 2025 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767103957; cv=none; b=If4INimc7I5CSFgsTFWsxCUWPm9e1so4Wf8XO32ai6w+9HGp9gTvZp8Y+sr8+zLzebFHPhyV8To+VRDWKA3RCvgY8mnDj2Qsp1y+/574TyfZ/la11ddLSTnF+Co5gN2IXDNvmXf5c/A3B40lzPXpntD9ki4RqCm7Zi4pJw89ec4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767103957; c=relaxed/simple;
	bh=+XjXcJ4GhKv85nZfYc1QRh2CMSdyJoxS5WD1B5mB56A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usVWKIOYUgfW5veFs28OzBnQJqtIFvNpnu7is5afr8Ra3VJLMx7qMZdliVSpv0TinquTS5B3UC1xl68yzyQJH0g53H5VRaWvFnSnURriA2WfbOHEOAhqxyCpdN10d9tjCn+PCm6i85RhEpsExzb5DTVur1k1JszlvFS4CEC0qUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZ/WwwoH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767103954; x=1798639954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+XjXcJ4GhKv85nZfYc1QRh2CMSdyJoxS5WD1B5mB56A=;
  b=BZ/WwwoHw5vBYcL0XPtoxJaW76SSoPSc7bfgblqDwS/rvTmf5zclSYpX
   2ZkBEfqYLpuMjEABXDtFu2kmqBpBs8ZJGMfOsRLczsNcCa33G4scRW1iW
   +aoZHGya6Q51YGikzK9pxeLX4PiTGiLpdl+2d+tfLQfhf/MVwfVo3RR9S
   T20Eshkx/U8xGiw9lumdf2XfCKW+8bwuAJENgpYExBOqyiW2v5nOPxkwy
   tGlzepU3DbgUXsAUvqqQHIMLPCb6Sjeva7su5prxHAuSPTCjt44jZhwAw
   6cyfPhtLLy0incEYHCKoMGTCEnFZSvSwICv5L/rCkBM0ACuk/arS7VueZ
   A==;
X-CSE-ConnectionGUID: wJDCboZPQ26OaUcHp5ccuQ==
X-CSE-MsgGUID: NQHtdqrBTfeH0H/BcR1a+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="67886603"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="67886603"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 06:12:33 -0800
X-CSE-ConnectionGUID: CA4y/SiFS2ynZgnzHJ5Rsg==
X-CSE-MsgGUID: pRAfP4MiTMKrBRfByMxJVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="231892881"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.96])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 06:12:31 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 69F32121D82;
	Tue, 30 Dec 2025 16:12:38 +0200 (EET)
Date: Tue, 30 Dec 2025 16:12:38 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: johannes.goede@oss.qualcomm.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ondrej Jirman <megi@xff.cz>, Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	neil.sun@lcfuturecenter.com, naomi.huang@lcfuturecenter.com
Subject: Re: [PATCH] media: dw9714: Fix powerup sequence
Message-ID: <aVPd1j48895zm67e@kekkonen.localdomain>
References: <20251210-dw9174-timing-v1-1-4a5036465727@chromium.org>
 <023d20e6-23ef-4f64-8ea6-31f973b33c95@oss.qualcomm.com>
 <CANiDSCsiu5E0nmm9dAgMGZ4y26cjwr8XKB1KRu2wZSVgdP-Brw@mail.gmail.com>
 <aUl-JZZ5U5GgTasb@kekkonen.localdomain>
 <CANiDSCuhGQXJmswNt4XCcUS5jBjfFNh-ZeByORquRoVc1JHbow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCuhGQXJmswNt4XCcUS5jBjfFNh-ZeByORquRoVc1JHbow@mail.gmail.com>

On Tue, Dec 23, 2025 at 08:49:06AM +0100, Ricardo Ribalda wrote:
> On Mon, 22 Dec 2025 at 18:21, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Ricardo,
> >
> > On Mon, Dec 15, 2025 at 09:46:46AM +0100, Ricardo Ribalda wrote:
> > > Hi Hans
> > >
> > > On Wed, 10 Dec 2025 at 09:21, <johannes.goede@oss.qualcomm.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On 10-Dec-25 8:53 AM, Ricardo Ribalda wrote:
> > > > > We have experienced seen multiple I2C errors while doing stress test on
> > > > > the module:
> > > > >
> > > > > dw9714 i2c-PRP0001:01: dw9714_vcm_resume I2C failure: -5
> > > > > dw9714 i2c-PRP0001:01: I2C write fail
> > > > >
> > > > > Inspecting the powerup sequence we found that it does not match the
> > > > > documentation at:
> > > > > https://blog.arducam.com/downloads/DW9714A-DONGWOON(Autofocus_motor_manual).pdf
> > > > >
> > > > > """
> > > > > (2) DW9714A requires waiting time of 12ms after power on. During this
> > > > > waiting time, the offset calibration of internal amplifier is
> > > > > operating for minimization of output offset current .
> > > > > """
> > > > >
> > > > > This patch increases the powerup delay to follow the documentation.
> > > > >
> > > > > Fixes: 9d00ccabfbb5 ("media: i2c: dw9714: Fix occasional probe errors")
> > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > >
> > > > Thanks, patch looks good to me:
> > > >
> > > > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > >
> > > Some tags for the record
> > >
> > > Tested-by: Neil Sun <neil.sun@lcfuturecenter.com>
> > > Co-developed-by: Naomi Huang <naomi.huang@lcfuturecenter.com>
> >
> > Co-developed-by: requires Sob. Do we have that as well?
> 
> Good point, I did not get a explicit Sob.
> 
> I wanted to give them credit for this patch, because they did a great
> job reporting the issue.
> 
> Let's do a Reported-by with no Closes. Does that work for you?

It generates a checkpatch.pl warning. I'm fine with that though.

-- 
Sakari Ailus

