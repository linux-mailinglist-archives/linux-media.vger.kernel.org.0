Return-Path: <linux-media+bounces-47195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AD56FC62DFE
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 09:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 36BA334F5EB
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 08:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6707B31A065;
	Mon, 17 Nov 2025 08:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qj0DLCWO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD661946DF
	for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 08:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763367478; cv=none; b=upgNffRBU5Mm6AmEumUF7E6t5laWYesFCpNJvq0BYXYMze4Qey8NNsFO+81wQYewNVTf79DBB+strndz1M3POUj4p3Ks3iCQZcdx7CI+dGfkz4E+j2doSQQOCbntKKE6d9FW4E0iXdBOBMmsMXMFSgFGw1qkmAIcGjitfD9Xj/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763367478; c=relaxed/simple;
	bh=6SO3Q1GfW3wDhcXLAkgS05tGPIs77aZFpq4LtXFwtjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnZFA0klTADnQVsXdJpcx11gujZrB6ihpWP8RQTgn3Tmwv4uUbVb5kSkQ7bn2y8pyJpJ68Pv14TY2YsJWi1q5rPJagGhmOsVNXOw4KYB8UwSMyIYOfI+PTW4hjWLEoTac+DROayyT+C0UVec+0baU0ibpOTMmfvKHhqmchct7nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qj0DLCWO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763367477; x=1794903477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6SO3Q1GfW3wDhcXLAkgS05tGPIs77aZFpq4LtXFwtjc=;
  b=Qj0DLCWOaJEu89S0zH1CppuZOJYJf1c+SaSbY4cxiSlFGRNjXV9cgG+P
   SlzODXVUDpuHPA0s2b5MVmawom/ZY7yT92oHQhchxiiUl0ZDEiCCfKxRc
   vX7X33rKnDCzCZK2vvsVw/Zo2Ny3x5pWQGtIDCBpKuSlASvrxv1gYPv9d
   pLm35EyqhMmt/99vDK3sr2duaRKAxvdfwTR9PkxKsZuoChvZXqt6+804p
   qqOgcTqn9CxnAv4XqN2lTjANtmucPOtXzhwo+XcDjxIpjVZJZpUPOVicb
   PK92z0rNInoGxxMWCK8CzOvuPXSQanyH2urutJYjM72uKPvJclc57Lpcm
   A==;
X-CSE-ConnectionGUID: DoxHGkLGQpC18y/1fihbYg==
X-CSE-MsgGUID: gCH+5Sf1RranfrTEa2mDVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="88007834"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="88007834"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 00:17:56 -0800
X-CSE-ConnectionGUID: 0zx/J32ETqauLLO8vt7GYg==
X-CSE-MsgGUID: jtxfXgiATqGaVMuD8RTArg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="190828324"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.223])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 00:17:54 -0800
Date: Mon, 17 Nov 2025 09:17:46 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 25/25] media: i2c: ov01a10: Register tweaks for ov01a1s
 model
Message-ID: <a3ygeprohhgwosquxiqd6qlkrmijpa2zj7xcg47z7pn2gso4lm@ry577gu34jna>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-26-hansg@kernel.org>
 <7fd4qbgendumnwahn7bqu7zyczvr6l3htbxxurq56cb6th7gyv@jncmh7kihgd6>
 <499a9287-a488-4c50-a03f-d05f26d337a9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <499a9287-a488-4c50-a03f-d05f26d337a9@kernel.org>

Hi Hans,

On Thu, Nov 13, 2025 at 10:54:06AM +0100, Hans de Goede wrote:
> Hi Medhi,
> 
> On 7-Nov-25 10:17 AM, Mehdi Djait wrote:
> > Hi Hans,
> > 
> > Thank you for the patches!
> > 
> > On Tue, Oct 14, 2025 at 07:40:33PM +0200, Hans de Goede wrote:
> >> The out of tree drivers from:
> >> https://github.com/intel/ipu6-drivers/tree/master/drivers/media/i2c
> >>
> >> Have a separate driver for the ov01a1s. This driver is 95% the same as
> >> the ov01a10 driver (same sensor, different color-filters) but there are
> >> a couple of registers for which the out of tree ov01a1s driver uses
> >> different values.
> >>
> >> Add a per model reg_sequence to struct ov01a10_sensor_cfg and apply
> >> the register tweaks from the out of tree driver to the ov01a1s model.
> >>
> >> Signed-off-by: Hans de Goede <hansg@kernel.org>
> >> ---
> >>  drivers/media/i2c/ov01a10.c | 28 ++++++++++++++++++++++++++--
> >>  1 file changed, 26 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
> >> index 058ff311a289..08cab1e4be1d 100644
> >> --- a/drivers/media/i2c/ov01a10.c
> >> +++ b/drivers/media/i2c/ov01a10.c
> >> @@ -161,7 +161,6 @@ static const struct reg_sequence ov01a10_global_setting[] = {
> >>  	{0x3815, 0x01},
> >>  	{0x3816, 0x01},
> >>  	{0x3817, 0x01},
> >> -	{0x3822, 0x13},
> >>  	{0x3832, 0x28},
> >>  	{0x3833, 0x10},
> >>  	{0x3b00, 0x00},
> >> @@ -186,7 +185,6 @@ static const struct reg_sequence ov01a10_global_setting[] = {
> >>  	{0x4800, 0x64},
> >>  	{0x481f, 0x34},
> >>  	{0x4825, 0x33},
> >> -	{0x4837, 0x11},
> >>  	{0x4881, 0x40},
> >>  	{0x4883, 0x01},
> >>  	{0x4890, 0x00},
> >> @@ -203,6 +201,17 @@ static const struct reg_sequence ov01a10_global_setting[] = {
> >>  	{0x0325, 0xc2},
> >>  };
> >>  
> >> +static const struct reg_sequence ov01a10_regs[] = {
> >> +	{0x3822, 0x13},
> >> +	{0x4837, 0x11},
> >> +};
> >> +
> >> +static const struct reg_sequence ov01a1s_regs[] = {
> >> +	{0x3822, 0x03},
> >> +	{0x4837, 0x14},
> >> +	{0x373d, 0x24},
> >> +};
> > 
> > How about the 0x4800 register ?
> > we write 0x64 for the ov01a10 driver but the out-of-tree driver for
> > ov01a1s does not write that value
> 
> Right. I left that one in for all models on purpose.
> 
> Looking at other similar OVxxxxx sensor datasheets the 0x4800
> register is the MIPI_CTRL00 register which controls things
> like disabling the CSI clock during blank periods to save power.
> 
> Since this is in no way related to the installed color filter
> I went with the assumption that the tweaks (changes from power-
> on-rest default) done for the ov01a10 were done on purpose and
> that these would also benefit the other 2 variants.
> 
> I did test the ov01a1b and ov01a1s with this setting and they
> worked fine.
> 
> So this does deviate from what the ov01a1s driver does but it
> is on purpose (and for the ov01a1b we have no other driver
> to reference).
> 
> Also note that the ov01a1s already works fine without this
> commit, but as the commit msg says I assume these tweaks were
> done for a reason so I'm adding them here.

Ack.

Thank you for the explanation.

--
Kind Regards
Mehdi Djait

