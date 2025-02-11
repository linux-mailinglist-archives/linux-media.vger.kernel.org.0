Return-Path: <linux-media+bounces-26005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6028A30E44
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 15:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D1041623AE
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 14:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E6C24FC03;
	Tue, 11 Feb 2025 14:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJbGlh/8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669612505B3;
	Tue, 11 Feb 2025 14:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284342; cv=none; b=peMH6TDkelUO0UqD0XmJR1OD/k9MSMsCi1LoCNOagKr2oEC8c7Ae6GBxE1gd6HXwzIA8Wi8kBesTtfH2I1wdZIVgFiXOBftrYUdc3nH5ncY0Jk4tGVZA8TNNqJzQpAdPPap655HsUhUN09OpebNEWE1Ds6PfrF+KyIM/RxYEibc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284342; c=relaxed/simple;
	bh=kLNVxZaLdVi2s80hm7hk+63HBdDzcuQI2wpEmAZVzr4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=U23u/DbFEevDHmU7TbQexk7jLx5iy0tQkxra575WRZ3IQJOjIcJEhsYABux99nVtNXjkliwy9NyYzqtOZqsGhnqZwi/gUztuhoqJ+wg2DXi2288izCG293ZZw7AZGZLp/FSyzL3p3qxzYuIl1M3ejwNQ/rLPPzT4Eh1pathW9qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJbGlh/8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739284340; x=1770820340;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kLNVxZaLdVi2s80hm7hk+63HBdDzcuQI2wpEmAZVzr4=;
  b=RJbGlh/8dmUCSReebDV810FejXtC0fN0Hzh9oDlm/tIRGPE28AWoOVlM
   BlgsN6RtiW198uahhH0n/N8nLV9LziW15GHdFNdnyXX9cbZ+ZHnt6CJT5
   kGilPRRgpTbAsywB1XF5JRpzA1tkZsYGGFKIhfGFG+kx9r1WOA5xx6oop
   izfbVaSjd9Rl8eyvpClIP3ZS84jQF2Vvi7omarQagxND3108DYlO8NBUK
   0kCfmm4Y5SBhZFkQ3x5E5h17XaNop3fh76DLSh4lVThJDE2TxOmbpYQjx
   RlIBjsnR8amGiSFSgXO811iD9nKa4CwqF0yGxkxqyTG6oZMEZ0n2y5u6g
   A==;
X-CSE-ConnectionGUID: a7ImVFSvTnGDYeaR3gKUDQ==
X-CSE-MsgGUID: T0ZzwC0kRqe/BMHqqWfW6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="65259434"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="65259434"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 06:32:19 -0800
X-CSE-ConnectionGUID: tkRRiE8rQW+LWR82wwUZQA==
X-CSE-MsgGUID: TR9wj20VTqqEfQghqa8jzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112373045"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.14])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 06:32:16 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 11 Feb 2025 16:32:12 +0200 (EET)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Sakari Ailus <sakari.ailus@linux.intel.com>, 
    Daniel Scally <djrscally@gmail.com>, platform-driver-x86@vger.kernel.org, 
    laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl, 
    linux-media@vger.kernel.org
Subject: Re: [PATCH v7 0/3] int3472: Support GPIO con_id based on _HID
In-Reply-To: <64b617e1-bf52-442e-be56-71c76d973edd@redhat.com>
Message-ID: <1938d858-6d66-69f8-5952-9cecf133f254@linux.intel.com>
References: <20250211072841.7713-1-sakari.ailus@linux.intel.com> <Z6shGGy2FPVc5mEK@smile.fi.intel.com> <64b617e1-bf52-442e-be56-71c76d973edd@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Feb 2025, Hans de Goede wrote:

> Hi,
> 
> On 11-Feb-25 11:06 AM, Andy Shevchenko wrote:
> > On Tue, Feb 11, 2025 at 09:28:38AM +0200, Sakari Ailus wrote:
> >> One patch turned into a set, the second patch being the original one.
> >>
> >> since v6:
> >>
> >> - Reword the comment regarding GPIO map processing.
> > 
> > Hans, Ilpo, I think this is in good enough shape
> > (the order of the checks I'm still not happy about
> >  we can amend later on if required). Can it be taken?
> 
> Yes this looks good to me. Ilpo can you merge these 3 as fixes
> for the 6.14 cycle ?

Currently, these don't appear in lore for some reason (not in 
patchwork)...

Sakari, could you please resend the series v7 so that it hopefully gets 
picked up by lore and is easier for me to apply them using the normal 
tools I've.

The last patch IMO falls outside of even borderline for fixes. I think 
I'll put it into for-next after merging the two first ones from fixes 
branch into for-next.

-- 
 i.


