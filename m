Return-Path: <linux-media+bounces-11323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B54F8C2735
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 16:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B58851F25775
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 14:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1183D17109C;
	Fri, 10 May 2024 14:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MaRxi373"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A1817106E;
	Fri, 10 May 2024 14:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715352922; cv=none; b=kMN8RX2UIDCrN64cGNf4AXZuTVF3Hu9ioRXD4jR2WwoVxu8jWWxjjCikiX0q71icnZhi7gYeswB5dLd/vCfB7lTBoyDnfChTaLdtnozPmjLVfb1YwpvQtgfsC/5F9I9zncoaQ7e4TADdyDLq3wNgU26wPt9IMS3dUjasZ/xzhNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715352922; c=relaxed/simple;
	bh=bpcTd66QCrqPbkU8DpdDZoGNAxlz51z4EqF2NnOZKrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rio0qnnRG6Cwyp71XJ/PtVRrvyg5xwDkWqbGdt0yUJEoDEWvGSCTbpWbKe8SB5wQck3LW6Fz3hVn+CHOkDdaDgeTPd2bJUX8F+Ed6cduk+QDsilhyrZ0eEyA0hWDK6SmdfPBqqm3V1kcoQBBYx7Hkk65XcCJYZjgbZtIqpR8L/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MaRxi373; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715352922; x=1746888922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bpcTd66QCrqPbkU8DpdDZoGNAxlz51z4EqF2NnOZKrc=;
  b=MaRxi373Xj+T+ENi86sw5nmH6CjoMDD0Cobk9crTgKv+Puo3j08O6A82
   WoZ0ar/W7djC/MBZjq5wjrc/kwBH1paJSDW+KBq33PwtGi0/HlQ7hRZmg
   zsL8ZzDm8EvEmbhdFws8CVuSEWSus14jqYkPtB1hUrOWSy1yrc3Zr1FIZ
   Eqpdn8N+fPRMpf2HE3NJpc0SfSxUg10G0Nm0+dOsd3c6d3qyJz+3zu2MX
   IaVg5MHA1+XW79G7bzsdMmIb4OMRq6Eh8E2+lKPAZCiK1HEQ6tXuFXd2c
   V0IASZs4UtV1XSduUSKHmSqY633jlhPqU92bxQtASSfOd7vEAEv8wYJg8
   A==;
X-CSE-ConnectionGUID: nWc46PdOSPOjeOFhyoQQhA==
X-CSE-MsgGUID: hGeimp1QQeCFCWCdAVxcOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15170026"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="15170026"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 07:55:21 -0700
X-CSE-ConnectionGUID: s50Lh8JFRIGHTT0f+bQ46Q==
X-CSE-MsgGUID: 1fYDxZKuRv+WCeOt5FRj5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="34078575"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 07:55:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s5ReP-000000068S4-2BgO;
	Fri, 10 May 2024 17:55:09 +0300
Date: Fri, 10 May 2024 17:55:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
	sebastian.fricke@collabora.com, laurent.pinchart@ideasonboard.com,
	praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
	j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
	p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
	nicolas@ndufresne.ca, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, adobriyan@gmail.com,
	p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
	jani.nikula@intel.com, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 0/8] [PATCH v7 0/8] Add V4L2 M2M Driver for E5010 JPEG
 Encoder
Message-ID: <Zj41TZllCRvEdYsW@smile.fi.intel.com>
References: <20240509183849.4060521-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509183849.4060521-1-devarsht@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 10, 2024 at 12:08:49AM +0530, Devarsh Thakkar wrote:
> This adds support for V4L2 M2M based driver for E5010 JPEG Encoder
> which is a stateful JPEG encoder from Imagination technologies
> and is present in TI AM62A SoC.
> 
> While adding support for it, following additional framework changes were
> made:
>  - Moved reference quantization and huffman tables provided in
>    ITU-T-REC-T.81 to v4l2-jpeg.c as suggested in mailing list [1].
>  - Add macros to round to closest integer (either higher or lower) while
>    rounding in order of 2.

You have a problem with your emails. Either you missed --thread when preparing
the series, or something wrong with your email setup / email servers you are
using.

-- 
With Best Regards,
Andy Shevchenko



