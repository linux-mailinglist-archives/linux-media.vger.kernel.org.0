Return-Path: <linux-media+bounces-40547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6C0B2F3F2
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 11:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6A3E176C81
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E522EF67F;
	Thu, 21 Aug 2025 09:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+um4o4l"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510311FF1B5;
	Thu, 21 Aug 2025 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755768407; cv=none; b=dYC2PfwiijjiqWf/1Jiu/zZ3XEeJHX0mk3P959YE3q7ryuVuljL5+zfeGSZ1wL1/hjJWXBufU2f42ZRzcRm9FZXWqUSiNSOphnQQANYKrKJM8OI3dguN5V4rxBh5UelggX5m7YOIjaPZSjWtZlt6yG9glFG/S2eVn4MJ+50oPBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755768407; c=relaxed/simple;
	bh=PQOJTBPJoyQfCaJKlfGKvW3sZq/+GNu3eo+031+ohKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQ15LqwXZh0R58IDqdXMFKG2UHPtXBnmz+uihDQ3mtRP6vLP2OWbRTi0JMWjar4PwFMNT2KO+heahwvYreHh4a6l1iiVwXfPDNFJGpCr9jb41MP8+tlcF1CdzG4Hqi6r5hgnhYxTFqbkqAc/mi1iYT3ZqSNym+WiQ0psRvfR6Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+um4o4l; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755768405; x=1787304405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PQOJTBPJoyQfCaJKlfGKvW3sZq/+GNu3eo+031+ohKc=;
  b=S+um4o4l+ifUaAtICHGi/EZly4Skq1TChWSu4UD8v37N2Hr4shew7Bhr
   yZxkfYzYYKrxvUFiZ3eALNvnN6ShBjPUM/uMMWvIBJzYVpcSboNA/+CMC
   8GXeSi+R+7vCqNuSS+nnNV0LhWn9sA7FehSsepSlKH3TgNfvh9ciuGWVD
   IZGYJUXwKCZlErIlu2Kf5hWktPr/vdUv62siWBDe13gHoQxeMGSVVUOxt
   pZjrC8JxLkPiLTKcK/JniHhTtTCttmdrzSzNkTJsjoIJTQkThOJBDgvxh
   roSECmsYWrRiQZAF94aBh6rfTryDhg6SlLVx7uGR9l9XYQNplzQH/F7Nn
   g==;
X-CSE-ConnectionGUID: TlNxYedkStKG3UNKPs2+3w==
X-CSE-MsgGUID: WAyKBEByTBKpoZmakxuJKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75636921"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="75636921"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:26:45 -0700
X-CSE-ConnectionGUID: qD3OKUNpQ7+Uusx0LXqupA==
X-CSE-MsgGUID: MjeHRN/DSyG0Of+9Wq0q4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168274682"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:26:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1up1Z9-00000007BUH-2QpV;
	Thu, 21 Aug 2025 12:26:39 +0300
Date: Thu, 21 Aug 2025 12:26:39 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Colin Ian King <colin.i.king@gmail.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] media: atomisp: use kmalloc_array() for array space
 allocation
Message-ID: <aKbmTz3bd2dq_i3X@smile.fi.intel.com>
References: <20250821081746.528018-1-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821081746.528018-1-rongqianfeng@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 21, 2025 at 04:17:42PM +0800, Qianfeng Rong wrote:
> Replace kmalloc(count * sizeof(type)) with kmalloc_array() for safer memory
> allocation and overflow prevention. Additionally, replace sizeof(type) with
> sizeof(*ptr) to improve code robustness.

LGTM, thanks.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



