Return-Path: <linux-media+bounces-12273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CDF8D523B
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 21:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44BAA1F24D8B
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 19:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2971212FB0B;
	Thu, 30 May 2024 19:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5nshUVl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFCF80058;
	Thu, 30 May 2024 19:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717096881; cv=none; b=RsvMucVwakx+P5uvGERlJtfVnubD+KyCzF5919sDd4V0STzhC71FmdYp11vCUp9K/0kvLvEZYPYl9SBa05IPtz9AJIMXZKZNWFsPMb7HBrreiF6QXSC3oMf4aYnRJid5OXXxciG1Js+D7WAFzXmLj3L/c8nS33CDKcFxe2rSmEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717096881; c=relaxed/simple;
	bh=yUCC865GVkukQUQ+FPFQCsjvwp7xAwGkvRS9TdW8c4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=giC4HADI/E53GCWsbB7r2+NiTzDCm8Cn/HJZchlfV2PLTa4QN8534iVURBExAy/1bCg+qPPVG8js3aMmjnAmWrYqyUJaDIICs+ho59XcY1NHkC6ycc0UR2dXZAHQzTyeX7ZNz2rm0reNwCgtU3AZjyVSBbnoHc7CxmuBkDVSO0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5nshUVl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717096880; x=1748632880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yUCC865GVkukQUQ+FPFQCsjvwp7xAwGkvRS9TdW8c4o=;
  b=i5nshUVlEHtmDt+RSGVaLuOPq6wKhVPyFQXzIdiujvROrOQvYhic1iId
   PsAnG86l+RHVAXTQTP9ri7kP2M1IGBojuKhCCTupW8uQxUIMZaXlZrBQU
   a4OF4v/ypX1I8zqmkFq9RGwgaapjOy/DmQ4kFZVUwwA1ufZrLL9DlPu70
   qixBYwDXsJipeab8kk8rD5kiz2q8GmEK8qbORTxUt4drYZZAhPMwZSB6H
   lKQ+D32iz1+Lrr58Cv5EqyU/xIS7CgfNb9TcfdmWDEad4bVBtsiqyM8bi
   yRLFyh+Ho8f77va2vlUhc8e1iSMpn3qhhGpCxunj8ynDnJ53VN4zxgfPx
   Q==;
X-CSE-ConnectionGUID: CKI5Py/gRD6v7PhGr6Baxg==
X-CSE-MsgGUID: zSY+wgl5TzGl7y8Jm5nUfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13568765"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="13568765"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 12:21:19 -0700
X-CSE-ConnectionGUID: 1Zh/9PhkSJuWw/nVSk4YmA==
X-CSE-MsgGUID: CStSQ2MNTfG5fPUQLo+enw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="36000356"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 12:21:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sClKn-0000000CHTB-1Do8;
	Thu, 30 May 2024 22:21:09 +0300
Date: Thu, 30 May 2024 22:21:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
	akpm@linux-foundation.org, gregkh@linuxfoundation.org,
	adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
	airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	corbet@lwn.net, broonie@kernel.org, rdunlap@infradead.org,
	linux-doc@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
	j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
	p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
	nicolas@ndufresne.ca, davidgow@google.com, dlatypov@google.com
Subject: Re: [PATCH v10 07/11] Documentation: core-api: Add math.h macros and
 functions
Message-ID: <ZljRpSgApF6ZwGKD@smile.fi.intel.com>
References: <20240530165925.2715837-1-devarsht@ti.com>
 <20240530171740.2763221-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530171740.2763221-1-devarsht@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 30, 2024 at 10:47:40PM +0530, Devarsh Thakkar wrote:
> Add documentation for rounding, scaling, absolute value and difference,
> 32-bit division related macros and functions exported by math.h header
> file.

...

> +Rounding, absolute value, scaling and 32bit division functions
> +--------------------------------------------------------------
> +
> +.. kernel-doc:: include/linux/math.h
> +   :internal:

Please, double check that this is correct keyword in this case.

Otherwise LGTM.

-- 
With Best Regards,
Andy Shevchenko



