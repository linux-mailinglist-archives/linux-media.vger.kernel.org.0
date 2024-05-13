Return-Path: <linux-media+bounces-11394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D718C3D97
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 10:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85D252821FD
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 08:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46458148315;
	Mon, 13 May 2024 08:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJ6q0R9f"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14484206B;
	Mon, 13 May 2024 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715590519; cv=none; b=q3IUxZPJHmgrFyI1ZOvpefKuUILzPG+FnYB5c3ytn/EaM+cE6EpNEr3Ysr3EE3bC6YW5YQQkc4ltG2Sr6IzYO0qH6Cq+JZPS31HTmqDpd7j6f2yiisS3b+3e2p5NCW5HILwB68HtLjUPsAi51qhjE4ZOPPfO7qq2wucL69+EzbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715590519; c=relaxed/simple;
	bh=2tR9myfW2d54OREPmUhOr4rW07utSQL3N1aBXRIRzk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7rmsjkjxE+t8hUfQ7ivLSYD49a4HmtV3Qms3A9lBQsPgttkyaSWI4KLrx/rQc/7cFlOS35XGI72LZGHn3zGT9l53S6KsC08FrZgEC0JX8JjHwLxr6LmZcpSwh+dKCXzsFCtMmJtC/WZadwJ/t+UvtDVnT+mQDk6RbsK5vmedAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJ6q0R9f; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715590518; x=1747126518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2tR9myfW2d54OREPmUhOr4rW07utSQL3N1aBXRIRzk0=;
  b=oJ6q0R9fTIC/gr60QUcyeJTblTrCr2YB+rRq9ysE6EBVP/joni/HWu9E
   n2hggIDjFU6wI68zLr7zAzGev0Inj4lUAu7Nv+vIhiF+iX46D/0M6+ymq
   cW+KZhiRXmoEmFO2em2FtKjH2et4s6rqdzTdpBmXxsokD8/RrCzEoS9Pg
   6OEzQrTfEa6VjLsTeYTaOcceAB3BzvAK9W/qGk6GOqIwCN5MwSQl81Uc3
   C/c9FjLfTcnqZ3G52DQvRRaAaHGLcO3wzca6fLZulyQYiymMCFcMMVGNk
   5nY58A3Pfq5D7EJj6NjLHQTxSSaBMKF0g2b96z6cpbDoFIhIujLVE4Gxj
   w==;
X-CSE-ConnectionGUID: F2AUroXHQlGEmKEgFc64pw==
X-CSE-MsgGUID: rkdsSmKFT3OJu0reOS/2Vg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="14460796"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="14460796"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 01:55:17 -0700
X-CSE-ConnectionGUID: NunY6tscTCumNMyQ3sglAQ==
X-CSE-MsgGUID: pxpNORKhTKGIoaGUafGRYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="34828950"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 01:55:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s6RSc-000000073mk-3Kwu;
	Mon, 13 May 2024 11:55:06 +0300
Date: Mon, 13 May 2024 11:55:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
	sebastian.fricke@collabora.com, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, jani.nikula@intel.com,
	p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
	praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
	j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
	p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
	nicolas@ndufresne.ca
Subject: Re: [PATCH v7 6/8] math.h Add macros to round to closest specified
 power of 2
Message-ID: <ZkHVaiLn4mH4fAaK@smile.fi.intel.com>
References: <20240509183952.4064331-1-devarsht@ti.com>
 <Zj42vTpyH71TWeTk@smile.fi.intel.com>
 <7214a8b5-16d4-42a1-868e-9574c506be85@ti.com>
 <0e72422c-8c83-4991-8def-97c40e0c06ff@p183>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e72422c-8c83-4991-8def-97c40e0c06ff@p183>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, May 12, 2024 at 07:46:58AM +0300, Alexey Dobriyan wrote:
> I think
> 
> 	roundup(x, 1 << n)

Since it's about power-of-two, round_up() is better.

> is more readable.

-- 
With Best Regards,
Andy Shevchenko



