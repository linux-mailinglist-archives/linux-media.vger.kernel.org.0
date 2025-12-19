Return-Path: <linux-media+bounces-49158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FE7CCFA9D
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 12:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C5A33059369
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 11:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFDE33D6CC;
	Fri, 19 Dec 2025 11:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQAWAHyN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4BF33BBB6;
	Fri, 19 Dec 2025 11:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766145013; cv=none; b=SlHdxiH4lSOxsekmjpLWRpwiitQ0t0izv/xzjZzad5IKBzfYsXFrtgTH/SnFO3gnYvUvUCnhw5ad2PYY5RUkrnpSFBklM3vTC0N3KrGktQTWopYRNphILBJxZO4Bby5Z+r3+KUYrrePGb8ZG/g2bG/LOLy6ZgdbR6qJ2LFptSAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766145013; c=relaxed/simple;
	bh=5GXE1kKk/d6MlQg11vgfRquLyFh9gqzXbKlyUwrq9R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkywTse8YI7UzNUvNIYa2DOd1GX8oC7JzyO8A/57u4Lzrc8BCI/4KQ2qmFZlEmoVCkWFaDAP6QymrYY3sCvtuLf1DVZ1uwKgovcBvQAflSC88Njm0tGIbiPqSWNR+F3kvmVqXNuWcnpvy1bwDUStTGWBF6aOrl0Fus2m+1B1UAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQAWAHyN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766145012; x=1797681012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5GXE1kKk/d6MlQg11vgfRquLyFh9gqzXbKlyUwrq9R8=;
  b=HQAWAHyNjgP4V5h2UQ58nlfvQqAuvVu6PRJwwQ0TFaT8GEAr4zVnZd/w
   9PEOv+yiRBBLuhljpkSwj7qFS0WsGKhfO8uvNVW0pa+JJZEtcP5UK86Vk
   9lDUTGybbcyTGZ8TwHnCjPR3u10fTQb3Au1fmpMrqd1r5t+q9lORO6ECz
   r5gzF7Kff8RSLOgCMs1HuN6CLKLXd6je6PRjB8vy2M2WLgiO057O0rQ4S
   e7oitcsiODzHFDsUQ/zQVXetfPh3zxa+StS/xS+lLRkJn5+R0Gx0wVlW3
   bxGuiD2zDb8dIYdYHVDW3TQVAR+Zf8wm97ixoLI8rULPo9DRQlFtflEvU
   A==;
X-CSE-ConnectionGUID: dwhfCPsnQGeduip0wA0mhA==
X-CSE-MsgGUID: a9t71GxqTYqB747XvTzGFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68000472"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="68000472"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 03:50:11 -0800
X-CSE-ConnectionGUID: BVPA6U1UQ/+PfgKeIu0v3w==
X-CSE-MsgGUID: DaXbz54gRZOvL55NiAN29A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="198747424"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.226])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 03:50:08 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A06C4120EC2;
	Fri, 19 Dec 2025 13:50:07 +0200 (EET)
Date: Fri, 19 Dec 2025 13:50:07 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: johannes.goede@oss.qualcomm.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ondrej Jirman <megi@xff.cz>, Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	neil.sun@lcfuturecenter.com, naomi.huang@lcfuturecenter.com
Subject: Re: [PATCH] media: dw9714: Fix powerup sequence
Message-ID: <aUU772KjY0RZXDFv@kekkonen.localdomain>
References: <20251210-dw9174-timing-v1-1-4a5036465727@chromium.org>
 <023d20e6-23ef-4f64-8ea6-31f973b33c95@oss.qualcomm.com>
 <CANiDSCsiu5E0nmm9dAgMGZ4y26cjwr8XKB1KRu2wZSVgdP-Brw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCsiu5E0nmm9dAgMGZ4y26cjwr8XKB1KRu2wZSVgdP-Brw@mail.gmail.com>

Hi Ricardo,

On Mon, Dec 15, 2025 at 09:46:46AM +0100, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Wed, 10 Dec 2025 at 09:21, <johannes.goede@oss.qualcomm.com> wrote:
> >
> > Hi,
> >
> > On 10-Dec-25 8:53 AM, Ricardo Ribalda wrote:
> > > We have experienced seen multiple I2C errors while doing stress test on
> > > the module:
> > >
> > > dw9714 i2c-PRP0001:01: dw9714_vcm_resume I2C failure: -5
> > > dw9714 i2c-PRP0001:01: I2C write fail
> > >
> > > Inspecting the powerup sequence we found that it does not match the
> > > documentation at:
> > > https://blog.arducam.com/downloads/DW9714A-DONGWOON(Autofocus_motor_manual).pdf
> > >
> > > """
> > > (2) DW9714A requires waiting time of 12ms after power on. During this
> > > waiting time, the offset calibration of internal amplifier is
> > > operating for minimization of output offset current .
> > > """
> > >
> > > This patch increases the powerup delay to follow the documentation.
> > >
> > > Fixes: 9d00ccabfbb5 ("media: i2c: dw9714: Fix occasional probe errors")
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >
> > Thanks, patch looks good to me:
> >
> > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> Some tags for the record
> 
> Tested-by: Neil Sun <neil.sun@lcfuturecenter.com>
> Co-developed-by: Naomi Huang <naomi.huang@lcfuturecenter.com>

Thanks, I added Cc: stable while applying it.

-- 
Regards,

Sakari Ailus

