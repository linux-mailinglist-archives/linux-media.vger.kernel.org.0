Return-Path: <linux-media+bounces-22668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1E49E4FCB
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EB26168193
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 08:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522311D416A;
	Thu,  5 Dec 2024 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFgbqeMI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726AB189B94;
	Thu,  5 Dec 2024 08:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733387614; cv=none; b=mHofkEhDASkXP1AGJmETt6P7ILUj2Fm25lwWq6SRRVC5idiAequgE5Y4i9Q4d933my2IA/5l6sk+4evFQ9sBLSaXY0xTuNB6P9WYi1CcGhKFUn575KebM9tkTCedgHmlko2uUhQqu9clo6yz1/fh4+hacBQmErzhRTteJNgXdx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733387614; c=relaxed/simple;
	bh=/XjNWEIJeeQQWXxVCwZfNVKTiH9H2s/msPT967xYN7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JE5U3kAaASgqprHvNhW/DZZ8uNklSqfUaA8sJbiYVUfRQpj1sEtiIeLn4K+7c5jpQ1KffZman+Tug+bstHsO+mUWNyTysMnOq+5ccuvcpG6Zq0Y5JzunSMfvscFsOfTJbkg58nOkBAuC1dEC/wQJ/x6Ompq5KVPt40TxbAfF1nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFgbqeMI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733387613; x=1764923613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/XjNWEIJeeQQWXxVCwZfNVKTiH9H2s/msPT967xYN7k=;
  b=KFgbqeMIRXWy9N1qHSGjbqkVbAsTok2serYhAl3E8HZEARgDlQuLwOfL
   YGnCBcCeTBsYt5isYaJYzYg0QPJOUH9RUXyq/aEtz1MTLloKEKPnW+xLf
   l9eLTnwmVpTMZ+b48ioZ1yR0qkaRGQeCLRwrJCmXtT+ztqoaEuYyWASqY
   vbbRdx8W8aD9Y9FwQTGvHPuVHXFO9kQh747PxTI9RHpCQ6GHvRgL7KdAO
   idkRZ2SwOZby3/2QiliwkgET/JdVBorp4qDYVYNEJDe9wDdaLBCatdo41
   wS4iapC7JwescHZFRNhP6As6WjrYqeS0FcSHZRG5tG/Lweea4gTA7eGnx
   Q==;
X-CSE-ConnectionGUID: 4mgiku1FTM6uYuw5Nus9qg==
X-CSE-MsgGUID: RX0ax2QqTWOf+UmOTLiX1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51102883"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="51102883"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 00:33:33 -0800
X-CSE-ConnectionGUID: PZ2XDVg7RvevpImaQ/W6+A==
X-CSE-MsgGUID: w5+okAioRaGsLx0mwWKXxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="124841465"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 00:33:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tJ7Ie-000000041nu-1zWw;
	Thu, 05 Dec 2024 10:33:28 +0200
Date: Thu, 5 Dec 2024 10:33:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 12/15] media: i2c: ds90ub960: Handle errors in
 ub960_log_status_ub960_sp_eq()
Message-ID: <Z1FlWPmCA-FJ8rec@smile.fi.intel.com>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
 <20241204-ub9xx-fixes-v3-12-a933c109b323@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-ub9xx-fixes-v3-12-a933c109b323@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 04, 2024 at 01:05:26PM +0200, Tomi Valkeinen wrote:
> Add error handling for i2c read/write calls to
> ub960_log_status_ub960_sp_eq().

Wasn't this being reported, I mean add Reported-by / Closes?

-- 
With Best Regards,
Andy Shevchenko



