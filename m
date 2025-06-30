Return-Path: <linux-media+bounces-36268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D1EAED9D6
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 12:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9EAB188D9D9
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 10:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A69259CB6;
	Mon, 30 Jun 2025 10:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TBMHutGl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B5D1E2858;
	Mon, 30 Jun 2025 10:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279368; cv=none; b=i/1TzXucTT52fInGdRlPml8Z2IhWE9b26lOZ5uJm5nk/v8YjnxFLMoVyyw1bXebyt+xzleFPVYEXeaNcfeyklqmcqNw/tG8jJKUFJJrHzqDu8xVHn9qSg9kffYgodqJTFa5xUisH3P5BGy4GjRQtyHzG/HhHjIbz+YmbFqseXMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279368; c=relaxed/simple;
	bh=c+T0z6vmgvFtL7s+LJmro6chHSYZizv5ACOfjzHN4Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCWC2uQ0TdCpRtAL6YrMWGUUK81alxpOS4QKopmBLSByBsReN/Ta1OErijpklZEg27bqkgMQUTqqn7Mx4Zd5etNCrXpCxvP0TKN6BkCAuoGOn9zLf+mem6D9C6Wn+s+3udhvi6tmNqJR4IVaDM3TjA6Qi5QeEnGvixB88k/PivY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TBMHutGl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751279367; x=1782815367;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c+T0z6vmgvFtL7s+LJmro6chHSYZizv5ACOfjzHN4Po=;
  b=TBMHutGlOOQQBmhoraxL9M7yZU42NTe22cX16WacsPYu6bv5seeeOYhy
   l8zD4nHWx1KIfjcUFu98QOIhADhzM635y9OB3lMT1vELcKbzNUKknINjI
   t+dtxOn00aMEFp7hz19GCf6WHx+nTzARo5Cyb24ePCcjkdlE0AW0Q49rx
   lUKUWFcZT5uWuJLi8PVVyVW/kpSves8QJRsejFwdEfdJMRKbi0rmWA7LI
   37uT74B31s3oHOANAeEF8eCkoIvlO3tCxJXc2Hf4SVIGwKSCppcF+b84N
   fcG0YyKWX12JyLu7Mu2CJeaMpWDbeOjFVHfLdPQeUJmeFeA+zZNjEg7PD
   Q==;
X-CSE-ConnectionGUID: mZm4M/bSQL297Z/AQSRsyA==
X-CSE-MsgGUID: RT1ruQmnSeKewqylPXGieQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="56121981"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="56121981"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:29:26 -0700
X-CSE-ConnectionGUID: YKnJEFZHQMafMZ8GhxSE7w==
X-CSE-MsgGUID: FZFeZ0x9TUSom137M5AEwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="152806613"
Received: from agladkov-desk.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.57])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:29:22 -0700
Received: from svinhufvud (syyslaukka.retiisi.eu [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTPS id CAC06423E2;
	Mon, 30 Jun 2025 13:29:18 +0300 (EEST)
Date: Mon, 30 Jun 2025 13:29:16 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v10 07/17] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <aGJm/BphvAyKDZA2@svinhufvud>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
 <20250624-c55-v10-7-54f3d4196990@ideasonboard.com>
 <cee962ce-3719-4ae7-9849-548a95d98e99@linux.intel.com>
 <20250629183547.GF6260@pendragon.ideasonboard.com>
 <aGI+y4sOlPAQMzWI@svinhufvud>
 <20250630083519.GC24861@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630083519.GC24861@pendragon.ideasonboard.com>

On Mon, Jun 30, 2025 at 11:35:19AM +0300, Laurent Pinchart wrote:
> > > > > +#define MALI_C55_ISP_RAW_BYPASS_FR_BYPASS_MASK		GENMASK(9, 8)
> > > > > +#define MALI_C55_ISP_RAW_BYPASS_RAW_FR_BYPASS		(2 << 8)
> > > > > +#define MALI_C55_ISP_RAW_BYPASS_RGB_FR_BYPASS		(1 << 8)
> > > > 
> > > > BIT() or make these unsigned.
> > > 
> > > It's a 2 bits field, BIT() isn't appropriate.
> > 
> > That leaves us with the other alternative, doesn't it?
> 
> Absolutely, although unsigned is unnecessary in this case as we're not
> approaching bit 31.

I agree with that, but what I really meant was that the pattern of using
signed integers while shifting left itself is bad. Not everyone is aware
of the problem and if we can steer them to use a different pattern, we can
avoid bugs.

-- 
Sakari Ailus

