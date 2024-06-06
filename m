Return-Path: <linux-media+bounces-12666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C41D8FF177
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 17:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 699E8B28939
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 15:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902F0197A89;
	Thu,  6 Jun 2024 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MU1rRy0j"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0E719755F;
	Thu,  6 Jun 2024 15:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717689018; cv=none; b=VroEidi91cEw2uEap/6Bd5UunVvrBpuicGoPoDjqlGXpMku3z8t1bfhD0CjcsgOoRbzvcZti0V7yZ/6sE9NPgx8KLXUI2so3YzzHwJJkGpT+YEP5zHaekmGcrECOb0s18cByr9sSQ2/aArfPlOylLtn8/Bpk+MCERj1uqWainD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717689018; c=relaxed/simple;
	bh=JTTEXFMZTvtlDTJVPLvUO0Z07UFn9t9ZnGn843M99EY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdEHIgiG5c+93teQfiPC6StQA0079YctPC2FoOxTwtSeVvAGxfJkgPjt2xSSU83fxlFMyKXbppiDyrxFRFd25RsLakwSbiOyB2jnrwJjcxuCA1LVYVE9C/u7Ko83vi5K1BM7Q2akz5qfdeRbS9ZH1+WP8dv4Ij76uXPuU5RaIfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MU1rRy0j; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717689017; x=1749225017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JTTEXFMZTvtlDTJVPLvUO0Z07UFn9t9ZnGn843M99EY=;
  b=MU1rRy0jF4zvtTWz2rps02zr2ox+DKoQKXOkOX7/iF8WPnsIZPtA9OfQ
   TxcK4gzipz+NzBrHoPQUX677TV4VRZ+vMBfHFNcPU2T1QMz8tI1v8t80d
   T4xTRUhyTghrKEUafYLD/eoVwLyA2ys2HPbJZw7bcyd2wTXrSmSggkMKF
   YcTfvmdyyTdSq9vlusOiAmusML1HTDGtZqD01qRG5f3xxNG6cKNteYYMW
   nUK8puznZ8CR3Z7qDpqmIY8BJFpnJQNSNXOnVBZdtJ3g37vOVAcfnQoUr
   v8+b5TlWLs7OmdD1HKyFzShzSDyJFwg4vg/xfWAiV6e5l5BhXdRf1yrig
   A==;
X-CSE-ConnectionGUID: 7M1ekhCxT3eHnlhcORO9gw==
X-CSE-MsgGUID: mYb8SDr7S1WLffMa9IpBUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14175092"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14175092"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 08:50:15 -0700
X-CSE-ConnectionGUID: B7a4quCYS0qh6HJmmURX4g==
X-CSE-MsgGUID: 4rJxK05uTq6E0hrQPsLFpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="68803958"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 08:50:13 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 900B011F99A;
	Thu,  6 Jun 2024 18:50:10 +0300 (EEST)
Date: Thu, 6 Jun 2024 15:50:10 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Genes Lists <lists@sapience.com>
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
	wentong.wu@intel.com, linux-media@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: 6.10-rc1 : crash in mei_csi_probe
Message-ID: <ZmHasj3hfwwKimZF@kekkonen.localdomain>
References: <8afe9391b96ff3e1c60e624c1b8a3b2bd5039560.camel@sapience.com>
 <ZlTllJeZBiGapHwZ@kekkonen.localdomain>
 <988e48090982c89ce0c906954832fdfb09a1ce34.camel@sapience.com>
 <eb10620deecc8feeae1e308c22de199be7c48ca6.camel@sapience.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb10620deecc8feeae1e308c22de199be7c48ca6.camel@sapience.com>

Hi,

On Thu, Jun 06, 2024 at 11:39:35AM -0400, Genes Lists wrote:
> On Mon, 2024-05-27 at 16:58 -0400, Genes Lists wrote:
> > On Mon, 2024-05-27 at 19:57 +0000, Sakari Ailus wrote:
> > > Hi,
> > > 
> > > Thanks for reporting this.
> > > 
> > > On Mon, May 27, 2024 at 12:34:41PM -0400, Genes Lists wrote:
> > > > 
> > > > First happened in 6.10-rc1 (6.9.2 stable is fine)  
> > > 
> > > Do you happen to have .config available? A full dmesg would also be
> > > helpful.
> > > 
> > > Does the system crash after the warning or not?
> > > 
> > 
> > System stays up and remains quite usable.
> > 
> > config and dmesg attached.
> > 
> > 
> 
> Hi Sakari - just to let you know this is still happening in 6.10-rc2.

It'll disappear once this patch is in:
<URL:https://lore.kernel.org/linux-acpi/MW5PR11MB5787C81ABF0C9FFF5A17E4888DF32@MW5PR11MB5787.namprd11.prod.outlook.com/T/#t>.

-- 
Sakari Ailus

