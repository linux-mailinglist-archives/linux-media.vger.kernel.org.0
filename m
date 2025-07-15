Return-Path: <linux-media+bounces-37747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFD3B053DB
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 09:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D24B6171DBE
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 07:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1F1273D98;
	Tue, 15 Jul 2025 07:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuhTcI6m"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D37271466;
	Tue, 15 Jul 2025 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752566194; cv=none; b=r7/BIYvFTuofbrYJbCgGECa0AeSm3/myt3W2S9q8Xl5GV6hMRT5VNgmMvctlqEjJ2fBjcxLoxYGps+9vKpGTdF+Go/3aLFKNeq/FTGq1g2wYP5VwBLzTo6yeKUdxy9jRok6LKq8SXYEWqqbPdlPOjeumw/BbwACNvJWiOr7KImQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752566194; c=relaxed/simple;
	bh=LtAzzkuDn0q+KeaheRVs0zl+lTKOWDSAl5NB82dIeuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqxjA1/fIn07iu8LhwZz5Y9PXBXrJ2j5VTrQaS3UfPDAZ0GNfnRaxXgwnVL3B+h2b8AgmMGe+TygU6JVyLtf3W2fR+t65dY4/KSlKxgt48FjO8eci0j+6Hz1x2dqyqTjxCNHCelCozXYPZ9KU5halFA6/FPTt7pwP2y5KaVL9v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iuhTcI6m; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752566193; x=1784102193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LtAzzkuDn0q+KeaheRVs0zl+lTKOWDSAl5NB82dIeuc=;
  b=iuhTcI6mxkRS6MpiYrFO7VAPrB1fbm9qNB38BiNtsVtaMcBIScOQ14x2
   pmGkhGlRqFpY+ZsA4MkDrEittoYidE5kerfadVynnt36K0cpJ7CwffDvZ
   gbKT8+2Kfcm3Y0OV2msOIB+ewtEGu1/RkFD7ZUuNdsrRveaHyyhRBVWDd
   I14+dh2MzbelLYliNEaOvvPWaYcgIMO5kSNkJ6z99zAucc3gAUkUITD9k
   k8Y5bRCylUlI2eIqPA+X32QFpL+pBQOAzndQ/hapQiM7nvzAgQrhA6E5y
   lYfBsKpqC8TLgyiuiF7bGJI0nbXkqO0YB/b8cKYgrxlxV2is6bv6pBeeh
   Q==;
X-CSE-ConnectionGUID: LLyiLLbaSTuieSQ4nXt0Kw==
X-CSE-MsgGUID: z+jHIo7oSI2eUwvWPx0xUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72351712"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="72351712"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 00:56:32 -0700
X-CSE-ConnectionGUID: lUc3JbWwTC+bDmrkgejhiQ==
X-CSE-MsgGUID: qLJO1e4KRLGeLqkQMTpEDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="194311579"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 00:56:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ubaWX-0000000FabV-1G3P;
	Tue, 15 Jul 2025 10:56:25 +0300
Date: Tue, 15 Jul 2025 10:56:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: mchehab@kernel.org, ribalda@chromium.org, rafael.j.wysocki@intel.com,
	dongcheng.yan@intel.com, gregkh@linuxfoundation.org,
	peterz@infradead.org, wentong.wu@intel.com,
	sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: pci: intel: Balance device refcount when
 destroying devices
Message-ID: <aHYJqbAgW2UX4TyB@smile.fi.intel.com>
References: <20250714132526.3216569-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714132526.3216569-1-make24@iscas.ac.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 14, 2025 at 09:25:26PM +0800, Ma Ke wrote:
> Using ipu_bridge_get_ivsc_csi_dev() to locate the device could cause
> an imbalance in the device's reference count.
> ipu_bridge_get_ivsc_csi_dev() calls device_find_child_by_name() to
> implement the localization, and device_find_child_by_name() calls an
> implicit get_device() to increment the device's reference count before
> returning the pointer. Throughout the entire implementation process,
> no mechanism releases resources properly. This leads to a memory leak
> because the reference count of the device is never decremented.
> 
> As the comment of device_find_child_by_name() says, 'NOTE: you will
> need to drop the reference with put_device() after use'.
> 
> Found by code review.

Okay, but have you check unregistering process? Does it have the put_device()
for this or not?

(The analysis is partial.)

-- 
With Best Regards,
Andy Shevchenko



