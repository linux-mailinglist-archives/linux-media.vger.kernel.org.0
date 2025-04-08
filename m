Return-Path: <linux-media+bounces-29605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA6EA7FC51
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 12:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 264F8171266
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 10:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71A0267AF0;
	Tue,  8 Apr 2025 10:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpGcMGfo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763A8267B89;
	Tue,  8 Apr 2025 10:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108606; cv=none; b=C7D1rYWMIGleCWwh1RLpe3Et3OOIHBIKc+gxI1XfT8zNiXjiMA9pS5CzPjdsNv8x3oCNOMXZC9rsEZHagNX5t+XHHyOPIY+d4g/78uy7iCxhX4BI5sXYk7wut2+VPcdorJJWAgyWKkpK1PiRvMOxlkY4vb9AHvKuTo2tBFv4M+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108606; c=relaxed/simple;
	bh=2p/2K+aLV0YuC6N+J7a78gjspSREhrhlMv2YPySSBDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZpz6kj9ub7ywAOYe16KHPcIE4gOkzOCrnLWeUKzJoDDjAQQTBN5aFf/yahiVhfeRZ42cgDAHQQOOajvT34CLcy+3ondznW2bY2SE/NTI5XViA+Gu6dTDQHC4IZH6dWfzNA4j4/ax1gg4yMyU0qOC49kwm8lWFRls+TGyDlfXJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpGcMGfo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744108604; x=1775644604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2p/2K+aLV0YuC6N+J7a78gjspSREhrhlMv2YPySSBDA=;
  b=CpGcMGfoEvy4N6k12O34gEgjAYyJg54q9U9L5qELFWABM0dEX7TATzpD
   zXeEltpU4rurMLHxoFPGiO2wNU2cBmzLEQi6D9rYazCmD5cH7Ee06b5DR
   Xh0wY3vCNw6tbOKOaEtK6ty/L3Dnt9QX7E/es0FY7WrnqgTTMLcx60yAr
   nG7dqVC61hqRxJfpY9bQLD64GPRtHcYew9dFzEVL8HqhLp+iLeWgojUDK
   3lg72e99qPmhSYX4zsRyT7Zud6IPihZBt2SgG2TvAK+EVpYsVcMHnzxsE
   12+n1HjvqBALYDfNpxHR73JBZDpUFkWWEMvDecenpGX5DtOvExmHSWyMl
   w==;
X-CSE-ConnectionGUID: k66hc8MCSKOMR1UVWguJ7w==
X-CSE-MsgGUID: 4wmSfwmhTtWvOP8UXWz5uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49329875"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="49329875"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 03:36:44 -0700
X-CSE-ConnectionGUID: 5EaMhe4aQxyQdZTnNP3gsQ==
X-CSE-MsgGUID: RBhMOcMpQXSc2p0qdjmKJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="151413235"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 03:36:42 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5F3EE11FB1F;
	Tue,  8 Apr 2025 13:36:39 +0300 (EEST)
Date: Tue, 8 Apr 2025 10:36:39 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: thp7312: use fwnode_for_each_child_node()
Message-ID: <Z_T8N8aHR-2OzHAO@kekkonen.localdomain>
References: <Z90qM33DvkTMGg_x@mva-rohm>
 <20250321104100.GC25483@pendragon.ideasonboard.com>
 <Z_Ti7aQK2_OlrUee@kekkonen.localdomain>
 <20250408101252.GB31475@pendragon.ideasonboard.com>
 <3d8546b9-92bd-40da-a61a-4534ba7779db@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d8546b9-92bd-40da-a61a-4534ba7779db@gmail.com>

Hei Laurent, Matti,

On Tue, Apr 08, 2025 at 01:26:42PM +0300, Matti Vaittinen wrote:
> On 08/04/2025 13:12, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > On Tue, Apr 08, 2025 at 08:48:45AM +0000, Sakari Ailus wrote:
> > > On Fri, Mar 21, 2025 at 12:41:00PM +0200, Laurent Pinchart wrote:
> > > > On Fri, Mar 21, 2025 at 10:58:27AM +0200, Matti Vaittinen wrote:
> > > > > When fwnode_for_each_available_child_node() is used on the device-tree
> > > > > backed systems, it renders to same operation as the
> > > > > fwnode_for_each_child_node(), because the fwnode_for_each_child_node()
> > > > > does only iterate through those device-tree nodes which are available.
> > > > 
> > > > This makes me wonder why the OF backend implements
> > > > fwnode_for_each_child_node() as fwnode_for_each_available_child_node().
> > > > Is that on purpose, or is it a bug ?
> > > 
> > > I discussed this with Rafael and he didn't recall why the original
> > > implementation was like that. The general direction later on has been not
> > > to present unavailable nodes over the fwnode interface.
> > > 
> > > So I'd say:
> > > 
> > > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > 
> > > We should also change the documentation of the fwnode API accordingly.
> > 
> > Does that also mean that the fwnode_for_each_available_child_node()
> > function will be dropped ? It's used by few drivers (5 in addition to
> > the thp7312 driver, plus 3 call sites in drivers/base/core.c), so a
> > patch series to drop it should be easy.
> > 
> 
> I assume the fwnode_for_each_available_child_node() still makes sense for
> ACPI backed users, no?

Not really (see my earlier explanation in
<Z9mQPJwnKAkPHriT@kekkonen.localdomain>). I think all the *available* stuff
should be removed from include/linux/property.h, apart from
fwnode_device_is_availble(), which should be turned to work on struct
device to signal its availability for device nodes only.

-- 
Terveisin,

Sakari Ailus

