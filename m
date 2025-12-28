Return-Path: <linux-media+bounces-49613-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD4FCE565D
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 20:23:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D45A33019B9C
	for <lists+linux-media@lfdr.de>; Sun, 28 Dec 2025 19:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA3326E6F3;
	Sun, 28 Dec 2025 19:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKGHPZec"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0583326C39E;
	Sun, 28 Dec 2025 19:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766949830; cv=none; b=Dh+SLJamZU4pvElew+U5ytXlkZVpfB0xPygtvisnXYlFrIyxD0wAL5riJZZclF0/n1eAURAlEgyqAjFzDRbfhdRZX6qXenZKlvlATv+zpgGYrFUUlCcLTxxUuJ7rAs7pSUoUz5JlxLF4dwXvGRavTkPDsa7WoKDTzB+sZzhoFjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766949830; c=relaxed/simple;
	bh=h060pnirRel+sMZMrVq24i8SLlRjG8WodWCtKoLny3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJnvdWkYxpRaolk2rkX+v1BSzfwkG2egE7nbYbT9VfEBiLtPw5+BnkDYiELbZnaV+gl6s5+hiTuuzt0NjI4yGFuKxznLLwPO2K9h0oI/lluSdW4tl0NsoftRkUezPym0U+K2HwPjU5jF7cQQWQvWpBrNPYVzWFM9leMnv09URVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eKGHPZec; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766949828; x=1798485828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h060pnirRel+sMZMrVq24i8SLlRjG8WodWCtKoLny3A=;
  b=eKGHPZec5MIZI5kzpAUhVtIbnf0F1lvsd0XNcAKH5Sjce7dzc3vzHpZJ
   tVz9dZjNWEW6gy+Lo8jb4Y4fgzAbC8Fqhqzy36JiBuZ7ppzoWpOwqbqyr
   srIXH4CYG8vrMi0QX0E+R/5uAVkckF/RCfyZjQZui8uT1Pl15gN6KMsR6
   TjMOhIKCQ6BGO2XN7UV3fcTw7a6jthHIcB+nb87hzJpwUHZjrPshIJhR+
   ugQW3GJuW1NzYrehTfp8vE7wj/cacL6VITz2lZoaSEWTWgfNLHfhmqVOT
   aIGWycfSP0tCRx6MPMxq7nnOvi/m0B+aEpQv/563DYaZ8TZZP53waLxNu
   w==;
X-CSE-ConnectionGUID: aEjaXnICSFOfPzjvbaJE/A==
X-CSE-MsgGUID: M9F5Wje8SWi4YbrnLbvBIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="79310111"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="79310111"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 11:23:47 -0800
X-CSE-ConnectionGUID: lEJur6XjSNWkyr3GgYf+vw==
X-CSE-MsgGUID: 8wZMmTKhS8eu8ABvu7xgTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="200661484"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 11:23:46 -0800
Date: Sun, 28 Dec 2025 21:23:44 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Zixuan Dong <dbeidachazi@foxmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging: atomisp: remove redundant OOM error
 messages
Message-ID: <aVGDwLtf4tbEH4P2@smile.fi.intel.com>
References: <tencent_C0328035BC37187FA2BED4352C504E3C5607@qq.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_C0328035BC37187FA2BED4352C504E3C5607@qq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Dec 15, 2025 at 01:53:32PM +0800, Zixuan Dong wrote:
> The memory allocation functions (kvzalloc) already emit a stack dump
> on failure when GFP_KERNEL is used. Printing an extra error message
> is redundant and increases code size.
> 
> This resolves the checkpatch warnings:
> WARNING: Possible unnecessary 'out of memory' message

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Sakari, can you pick this up?

-- 
With Best Regards,
Andy Shevchenko



