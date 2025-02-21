Return-Path: <linux-media+bounces-26591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE2CA3F994
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:56:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BC5886316B
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 15:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB061DB958;
	Fri, 21 Feb 2025 15:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFS/44Zp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0441DB366;
	Fri, 21 Feb 2025 15:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153086; cv=none; b=sWwTaeDPVncax5MQEO4RP1gqGYXwMWBYb0+S/Zc2iGkAXNMkt4RMqe9XNEAfs+Xjveqy2kQHR2BZul/TEHe6gN/+QRiS+p5jC9dx9PDgdPW3R+v9e0Vc/18JUhaapFI+89cNBtUkb0+5wBzoOTmhNJHtT3w7R6JpJv+oUIhfE8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153086; c=relaxed/simple;
	bh=vPnGBuoiFN+rapBDrtIDIJGXal1oiR/Y9ccwXwbtNnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGupb3bfVPh6ZtiX4q5i+auHdpehOHtk0tlPDRYpA9yKDsnXFvB2JyZYaOwVhZQMwSNJKMnOfb6Wr29UsHnOJ4n0eCOc38nSvvZkxKBowKqiLotE0Oi4VKTh5wgHKyvTsROltcAD76qO54C3/TKlQpmd/g2Fv5S8UbOtp/MCuRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFS/44Zp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740153085; x=1771689085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vPnGBuoiFN+rapBDrtIDIJGXal1oiR/Y9ccwXwbtNnc=;
  b=eFS/44Zpqw3oOcfzORjLqXHY37K3NbygPjv8Irrc0ti11PY/oViHKuEN
   3cpynLX99/JL3gDI2T40VivyRyr+5PXKkgZosKj4K6wjvjbG6qSNulDKV
   m2vSq6DjwnM7RhLCTIzvp4m3+5DMJuxs8VO5Fojxqau6Ju5mID5W5nSmj
   HZXgp/JO7nPalB9eNW1t+DO6GH1j3IMJUo0OSSyI7fcHf7ivzC3XnWOOm
   1gOzifUnu8f+dlbw3ltr8SDiP+J6TdXqscNCCj+gA7AuLCNFn24JkEAKJ
   EWo220bMmtcbDJvH9tNc0LIjTC4z1q0ygQ/Obxks1nx4tFsdTVuL228p7
   A==;
X-CSE-ConnectionGUID: jtd2JGleSNeuoRRr7ggLtQ==
X-CSE-MsgGUID: N1DNTarbQUmT3S22aMYddw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="66340982"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="66340982"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 07:51:24 -0800
X-CSE-ConnectionGUID: bP+ES1DSSYups3Xn+KJcoA==
X-CSE-MsgGUID: CuNXA0VLQISSIv90x3lSew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119525320"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 07:51:17 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tlVJ2-0000000DgNg-1aMo;
	Fri, 21 Feb 2025 17:51:12 +0200
Date: Fri, 21 Feb 2025 17:51:12 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	"apw@canonical.com" <apw@canonical.com>,
	"joe@perches.com" <joe@perches.com>,
	"dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>,
	Kerem Karabay <kekrby@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
	Orlando Chamberlain <orlandoch.dev@gmail.com>,
	Atharva Tiwari <evepolonium@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	Hector Martin <marcan@marcan.st>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v3 1/3] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Message-ID: <Z7ig8Br4duEt2TUG@smile.fi.intel.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 21, 2025 at 11:36:00AM +0000, Aditya Garg wrote:
> From: Kerem Karabay <kekrby@gmail.com>
> 
> Add XRGB8888 emulation helper for devices that only support BGR888.

...

> +	for (x = 0; x < pixels; x++) {
> +		pix = le32_to_cpu(sbuf32[x]);
> +		/* write red-green-blue to output in little endianness */
> +		*dbuf8++ = (pix & 0x00ff0000) >> 16;
> +		*dbuf8++ = (pix & 0x0000ff00) >> 8;
> +		*dbuf8++ = (pix & 0x000000ff) >> 0;

put_unaligned_be24()

> +	}

...

> +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> +		3,
> +	};

One line?

	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = { 3 };

-- 
With Best Regards,
Andy Shevchenko



