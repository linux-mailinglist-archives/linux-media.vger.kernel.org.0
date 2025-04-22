Return-Path: <linux-media+bounces-30709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D71A9688F
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 14:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02A6C3AF686
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 12:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E034027CB1F;
	Tue, 22 Apr 2025 12:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0Q7evh3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721A914658D
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 12:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323655; cv=none; b=n3M01Z964t+8NM/naAANK4LpiAfRgMhEpXkVbRW/T2V/jHTlT7hKehOkiRJs0a0Vv5GhroIsoKLBlNmh2BJOtQr8HR8vFtQjvTctwuzOl5R80q6ttmWNjYl7OyeOYR2c17yv4o6y9WLCdamzyjuoPgKJ6EFfM18RtVwc9GlYg5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323655; c=relaxed/simple;
	bh=CiCynp4nyjmgPKZVLQ8KkpVWQY0bPlUyeL35rJKvx8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcSm6BTr0c0rqxnqUVVtjUK8X/ciN3ZzdjcXkWvlnH3qmzHd7VZthffxoxQQ5JjExNJwWdy+XHyPmyrD3QzMXR2k5Ps0w4xb/oUIOh2Qi0e1XWBYAPpUuQCid533Z/oW8nOX76ocEU7pcBmC0+NgGFaxhJZjSqSsvzRZju4fNGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0Q7evh3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745323653; x=1776859653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CiCynp4nyjmgPKZVLQ8KkpVWQY0bPlUyeL35rJKvx8k=;
  b=b0Q7evh38ltZbiX1bQw2JjSEi1miL5eudBbps8J16d7uiDqS5vAl/ZqM
   vd2dbayHt7iXe3DuXtuF8NTVQk702OgaJi6xps23uullrT2gW+0g6QuRf
   d3grUqQUz/cbGN55tWqoJO3oUtOM6mgRklVcKOmLQ3Z22pZFEV8p435IA
   GM8+xJEQW5pt9ZEVtdSkZZ1xGpqALlWABusOlOgdVcj13A+LMs1WIuuHE
   HxTJlwY7F8Ea5m0G45hGH2X5NEHBCuzRMUTa9XF0Ik7xc9lDgKRfNDvc8
   pQBaljiokEk7pKhtmCCTSO3tXrUNGrXs+OLGTyJRFJ+8x+amJAZDuJmXG
   Q==;
X-CSE-ConnectionGUID: ftzRGhdpQTylMOm/NOQaCA==
X-CSE-MsgGUID: KP/rch2rTWOJWZB+D5T0oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57066947"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="57066947"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 05:07:32 -0700
X-CSE-ConnectionGUID: dFyBPAPuQny6X4rSTLZdOg==
X-CSE-MsgGUID: n/AuUaXfTX+z40zgUl+1Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="137089757"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 05:07:31 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CB4D311F853;
	Tue, 22 Apr 2025 15:07:28 +0300 (EEST)
Date: Tue, 22 Apr 2025 12:07:28 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 01/11] media: ccs-pll: Start OP pre-PLL multiplier
 search from correct value
Message-ID: <aAeGgJk15HDhVPaI@kekkonen.localdomain>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-2-sakari.ailus@linux.intel.com>
 <20250421195004.GA17813@pendragon.ideasonboard.com>
 <aAeA1ncpTCgfuI25@kekkonen.localdomain>
 <20250422115001.GC329@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422115001.GC329@pendragon.ideasonboard.com>

On Tue, Apr 22, 2025 at 02:50:01PM +0300, Laurent Pinchart wrote:
> On Tue, Apr 22, 2025 at 11:43:18AM +0000, Sakari Ailus wrote:
> > On Mon, Apr 21, 2025 at 10:50:04PM +0300, Laurent Pinchart wrote:
> > > On Thu, Apr 17, 2025 at 09:53:44AM +0300, Sakari Ailus wrote:
> > > > The ccs_pll_calculate() function does a search over possible PLL
> > > > configurations to find the "best" one. If the sensor did not support odd
> > > 
> > > s/did not/does not/
> > > 
> > > > pre-PLL divisors and the minimum value (with constraints) wasn't 1, other
> > > 
> > > s/wasn't/isn't/
> > > 
> > > > even values could have errorneously searched (and selected) for the
> > > 
> > > s/could have errorneously searched/
> > > s/could be erroneously searched/
> > > 
> > > Do you mean "other odd values" ?
> > 
> > Odd values that aren't 1.
> 
> You wrote ", other even values could ...". I think s/even/odd/ is what
> you meant.

Right, I'll fix that for v3 as well.

-- 
Sakari Ailus

