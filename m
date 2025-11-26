Return-Path: <linux-media+bounces-47782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 537ECC8B94D
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 20:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B66163B03DB
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 19:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D3E30C375;
	Wed, 26 Nov 2025 19:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azkWc0vU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B5778C9C;
	Wed, 26 Nov 2025 19:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764185558; cv=none; b=oCUnT3NnDqRDyMyGPIn5l5lg+ly22p2tiKOwPIIlPiUp880I5oyPTRirpCVj2YvXggZNlDz7XQj3Mf77JIQarTAsTGp1y0TCkpoWikV7Kv10YL8Obg0Qbo590zT9Yk813MxmaWo75M+Zzf8jfdYob0OKeqaWLEKGpHYLL06FrDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764185558; c=relaxed/simple;
	bh=osxa3TRknropHQbB00HLxsbAmebw/kKxAGN6dUgyeAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBDChm3x7Es0/JJgfV62cJzcCby6JhoMAGqOXS1lkpY9ymnuIe0z730BwE44iAXZY6ySs4ukgP0rLkxiVe+PkhgJayiV2Z0akpVQtrN0wGq60D4cJLv7LyqxiSvAEcbfHlmzUGz3y4NJi313VWANrLna4KBAIV/ESgCWTv4qy2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azkWc0vU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764185558; x=1795721558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=osxa3TRknropHQbB00HLxsbAmebw/kKxAGN6dUgyeAs=;
  b=azkWc0vUEYq+5sd2muuEH9sRqm9FBSNzXEURvtsacpOqUQ4x2BdbdN4J
   RgELRft11+yLR+zJQToMvbb+OsPJ7S7rikoWpY56Y0slTZnGCDKQCN0+F
   lqMsxr4s7yy+YfBuZ0maRAxqtQEAOGwZg1yoDFtf2xypQ8+38J0lEbZfH
   2Zr+1tlOq4AWy+d6py2c1UK5Hjsmsl0Esk7ClKoCRDJmNU/NfbbvX4j7m
   qk8sTnyHhrLLf+Wwo855uasOHr6zsw59tY+IhCqQwchqcAbAY7nBhIhS2
   Rd5ApfU2wDQ1ip4zCIj13CE6Bfl3JBLcBjgvQ5F94CZV/wgaVxX53+wTr
   Q==;
X-CSE-ConnectionGUID: jdUCkkWmT1W4F2EHXchkGg==
X-CSE-MsgGUID: aOOG8GUaQg28rJQ7QMP+NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77337671"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="77337671"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 11:32:37 -0800
X-CSE-ConnectionGUID: BKFLHHqyRQKDco20Ek40Ew==
X-CSE-MsgGUID: bf8ZmMbuS2Gkkh4E5SSSjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192846497"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 11:32:34 -0800
Date: Wed, 26 Nov 2025 21:32:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ayush Kumar <ayushkr0s@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org, hverkuil@kernel.org,
	ribalda@chromium.org, abdelrahmanfekry375@gmail.com,
	santiagorr@riseup.net, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel-newbies@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: coding style: Move trailing statements
 to next line
Message-ID: <aSdVz374bkzKJRO-@smile.fi.intel.com>
References: <20251126190026.37436-1-ayushkr0s@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126190026.37436-1-ayushkr0s@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 07:00:26PM +0000, Ayush Kumar wrote:
> Adhering to Linux kernel coding style guidelines (Chapter 3: Indentation).

OK. Can be done more, but yeah...
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



