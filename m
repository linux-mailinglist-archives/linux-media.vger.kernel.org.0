Return-Path: <linux-media+bounces-29548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE37A7E57B
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 18:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 976901887512
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88133205AD1;
	Mon,  7 Apr 2025 15:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIOc6svM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957F9205517;
	Mon,  7 Apr 2025 15:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041068; cv=none; b=gvP9sEZw2NI9OEypJxwCnauR571IKRwoTmvLoiw/3aOk7ESYWhisitKOE3z2XSG/8FvZnHqVpAzJOQG0MMCmDHAsTdP8ih7wD+yp6KYMX5n0zV8VA6OYv7sIY0WJLFPTDJ3QyFkx4Rf6vdtKOCtFTbcYBSF/o/2k64NPvDQSTNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041068; c=relaxed/simple;
	bh=KP5jHm1Ej+tX78X1xuPvPBlzJ//zKR98WZkJQHfIuM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W01g7yeHYJmaatCaOdsjGGvVJ4pMZCwBaUsXo7VDIdgLX7O02tvAyw0kImGuB7rrum6uuXLaAVFTVNZWkO3RfoPQnDd1HLraRHel3WW2Vjo/j7pPjyoMGvXS6H/73CewbiLAtOfTOYhb4+MKWN5rDZ5NHgnN2P3N+f2HboZQodI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIOc6svM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744041067; x=1775577067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KP5jHm1Ej+tX78X1xuPvPBlzJ//zKR98WZkJQHfIuM0=;
  b=OIOc6svMa4qn5gFN+n6MY7X5hn9qEcddZ64riaBiEDGDOsxdmWP24mV7
   7wIkCV51ttJXJ09/jmyp02WmnYVu8Mfgg9ehDRIG1Gmm+aADtyxxZXWYM
   46CUgzcKHDTfQeJCKhuxyvJnNOxL8li8azYp9TOzTLZU6pd930hUGbPj0
   HSqXzolOzBzfCJbRxHcGJuPDDNfCui/N7e3il8gQto1Kn+p2ghgchWq4P
   MQq14Q6bj1hutIDkbutk/Gw/6ZTlicGt71CY+gOIIopZVpTsmU5qMeRhu
   lkxBX6yuezHl/xfWmhLHyGGgGG3nr7L5qW96kXTqDnJ/NJW93f2C87D5d
   g==;
X-CSE-ConnectionGUID: evTomqbMRwiFPn2JEuwzSA==
X-CSE-MsgGUID: hgaNt8CkTbaGhQAPQFhMdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56097985"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56097985"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:51:05 -0700
X-CSE-ConnectionGUID: lyoBYq26QeiS0dR+okMEng==
X-CSE-MsgGUID: V7RA+QusSsiIBnkNl88L/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128523640"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:51:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1okW-0000000A7EV-21op;
	Mon, 07 Apr 2025 18:51:00 +0300
Date: Mon, 7 Apr 2025 18:51:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: i2c: ds90ub960: Remove of_node assignment
Message-ID: <Z_P0ZPclhVHick0l@smile.fi.intel.com>
References: <20250312174123.4111661-1-andriy.shevchenko@linux.intel.com>
 <2e6599fd-0b79-430b-9e94-f731b60e1705@ideasonboard.com>
 <Z-5tI_WVF2YQQ837@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-5tI_WVF2YQQ837@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 03, 2025 at 02:12:36PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 03, 2025 at 02:01:40PM +0300, Tomi Valkeinen wrote:
> > On 12/03/2025 19:41, Andy Shevchenko wrote:
> > > Remove of_node assignment which duplicates fwnode in struct i2c_board_info.
> > > In general drivers must not set both, it's quite confusing. The I²C core
> > > will consider fwnode with a priority and of_node is subject to remove from
> > > above mentioned data structure.

FWIW, this patch had been send as part of the i2c conversion series.
Please, do not apply it standalone (at least without that i2c stuff
being accepted and applied first).

-- 
With Best Regards,
Andy Shevchenko



