Return-Path: <linux-media+bounces-49370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E024CD6D08
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 18:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C13F3015011
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 17:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C97334C04;
	Mon, 22 Dec 2025 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHsns4+c"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEEC2FF677;
	Mon, 22 Dec 2025 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766424108; cv=none; b=dNwzsBx83BqMyFsANZViT18w70dVmMAzf3TM9WvTd0pWVxKH0uud+j0rs1gYj/u/8Yc+eWGtDQ41DZxeHaSBoVi9A/qm5kVZISXGhDHj7C7ZR04nRXGMjJbRaYl0rYJgOSnk/CQJNXdEQV5Rw3yyZFc6bonuzToETNtpcv0wSi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766424108; c=relaxed/simple;
	bh=OS9Fd3GaWfHpdDaRJMaXg1cpvEnaScNCHHedNAwigMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZhyC9NiI8y0VwpoEjHAyiCyyn6Poongs4HuaIb1N9/EkYfg8sHGiVWyyZ4BQAE7kp1rSWhefGKgAAPtczi0d5c7XRumHwSsLbarYOWh/atMs+fE4x2/dxw9KVENyB/XoWoXOPkC/oJw3h0b9rA0UUXHPc4R4G7blLxSmfP3j0P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHsns4+c; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766424105; x=1797960105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OS9Fd3GaWfHpdDaRJMaXg1cpvEnaScNCHHedNAwigMs=;
  b=dHsns4+cjv6qrz/aXfsQc3GMon6AbL0IpOKLkk4l8HTTdQdg6AJZQsAb
   V4jQt7iS2wWr+tId7U84AHihe3qQyJf31oe05YSm2Wkr2Nnnr0ejf+HPF
   IgBIxT2u9oJu26x/IAsVcQdKYjOeCKsukt5Qwdx6jnqkigXXBjJ7mbOKz
   4z4iCmrnf41f0F41Xx59T+FGG3X+lmGAH/NdPevdmcToZ6iLiQoQmAu98
   rRq3EO+5C1ElSy5wApRhDKj+Iiz8ABmPVKZicO8YpZdcJJuOn9dISRBCp
   mVwUO5w4ut9jV2ZOLCSxiguc7nNer6r4MXIVmkMK9CNvAmOzGUeyVSMJx
   g==;
X-CSE-ConnectionGUID: TwDpBxSKRUSAVHzP0RQqmA==
X-CSE-MsgGUID: t0gz+Z2gRZK1piOCmuEDrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79398359"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="79398359"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 09:21:43 -0800
X-CSE-ConnectionGUID: lXqC8dX3S0mi1eaIMZRUvA==
X-CSE-MsgGUID: omvUqku8SqKVNg/197a0mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="200472064"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.187])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 09:21:41 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3F4CD121D86;
	Mon, 22 Dec 2025 19:21:41 +0200 (EET)
Date: Mon, 22 Dec 2025 19:21:41 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: johannes.goede@oss.qualcomm.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ondrej Jirman <megi@xff.cz>, Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	neil.sun@lcfuturecenter.com, naomi.huang@lcfuturecenter.com
Subject: Re: [PATCH] media: dw9714: Fix powerup sequence
Message-ID: <aUl-JZZ5U5GgTasb@kekkonen.localdomain>
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

Co-developed-by: requires Sob. Do we have that as well?

-- 
Regards,

Sakari Ailus

