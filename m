Return-Path: <linux-media+bounces-30974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A86ECA9BDF2
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 07:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6AFF1B880B5
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 05:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0908022A4D1;
	Fri, 25 Apr 2025 05:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eEs1mPmA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93491AB6D4
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 05:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745559625; cv=none; b=eZBeGU3DqtueTrFRkUPDpZroV7fyyExFEPv+tHJYwM5p7WQuM0CgHjue36ivpjWdpTYPJZ6fjPDyp/FSxCDlGVEZRsC4ltOZ5TgyuLxGUHS5DhdEKIe5AjgyrD5AGAPjfmP0b9oDJdR8haUoLpv6LccVKF3IqZ3PvTQb+1Bk0Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745559625; c=relaxed/simple;
	bh=imQllWmPvzkPLZYTTkXwbmIao4DZ5B2EI2J3c9m34fU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrUNV7ll9AzzhILN2cG9OqTxMMx1HoZhDFGjTZQU54xjDnRCukVAh54XrZkOPNTpaw3GgRnG+rB/xD2xa6Hvsz4aXW/2orQrcYJsv+GSEUJat5IjtNioJ1hg+QIRhIn6feO12pPWZRpCgHNZjOK/K3eE0Vx/tGxsFSNCPmQa4UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eEs1mPmA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745559624; x=1777095624;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=imQllWmPvzkPLZYTTkXwbmIao4DZ5B2EI2J3c9m34fU=;
  b=eEs1mPmApCN68nP+UC5yvSeHGzona1rQXqNbb7o0PZHX0owY9iw0r2FQ
   jicWUD6rImnpomG2gLyo2mkZoFeNae0prqiJftXhVo/oufu4w7w3wCNe7
   9jMy/66jTsIx/0SoBjbH4N2/HzC3MIAXZBSHjIE4Snfs5/qQ+cxOFeAuO
   lUIBdBZsIGjD/fEoiQB/o97YHCGRPngnUDQk1skfZ2MzqrGFvrkbNo3z6
   7y/UrFFs/Ll5vbX6IB3Q5LpM39vZaJxohU3xbqf/H/hP3ngwSzAzURSb5
   cPCyI0b0pzRq2j6wG2QaltPos1++Fg1nP9ZdNMLj0H2wO1wet7coU8F1T
   w==;
X-CSE-ConnectionGUID: AlKFWfOQTyydySQxEdT1dw==
X-CSE-MsgGUID: 3xUJJeTwQ/inq8633C4/hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47229750"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47229750"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 22:40:24 -0700
X-CSE-ConnectionGUID: NqXbadgJRoiUZ7/AyKWYjA==
X-CSE-MsgGUID: gv7lyTjwQHSeDoDf4hlnDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132737820"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 22:40:21 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5EBF711FA28;
	Fri, 25 Apr 2025 08:40:18 +0300 (EEST)
Date: Fri, 25 Apr 2025 05:40:18 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: ipu6: Remove workaround for Meteor Lake ES2
Message-ID: <aAsgQjNEacme1NZU@kekkonen.localdomain>
References: <20250311084203.516205-1-hao.yao@intel.com>
 <f8fd0fd4-ca0c-12b5-acc6-ba846b2c9987@linux.intel.com>
 <aAomsUA01Sm5vo1x@kekkonen.localdomain>
 <fb923201-e49c-e61a-bbdf-e67744f2ea6c@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb923201-e49c-e61a-bbdf-e67744f2ea6c@linux.intel.com>

Hi Bingbu,

On Fri, Apr 25, 2025 at 11:05:54AM +0800, Bingbu Cao wrote:
> Sakari,
> 
> On 4/24/25 7:55 PM, Sakari Ailus wrote:
> > Hi Bingbu,
> > 
> > On Thu, Apr 24, 2025 at 12:18:06PM +0800, Bingbu Cao wrote:
> >> Hao,
> >>
> >> On 3/11/25 4:41 PM, Hao Yao wrote:
> >>> There was a hardware bug which need IPU6 driver to disable the ATS.
> >>> This workaround is not needed anymore as the bug was fixed in
> >>> hardware level.
> >>>
> >>
> >> It is better to send v2 with fixes tag here:
> >>
> >> Fixes: 25fedc021985 ("media: intel/ipu6: add Intel IPU6 PCI device driver")
> > 
> > Is this worth backporting? Nothing is broken because of this, is it?
> 
> It is necessary. IPU6 on Raptor Lake share same device ID with
> Meteor Lake, this workaround will break camera on Raptor Lake.
> 
> And Meteor Lake ES2 is not used in product.

Ok, this should be visible in the commit message.

How about adding:

Additionally, Raptor Lake has the same IPU6 PCI ID and x86 stepping and but
does have the bug. Removing the Meteor Lake workaround is also required for
the driver to function on Raptor Lake.

-- 
Regards,

Sakari Ailus

