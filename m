Return-Path: <linux-media+bounces-31262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9D0AA0507
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 09:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF5B33A8D45
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 07:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710D5221737;
	Tue, 29 Apr 2025 07:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEqay3Yl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E3221A457
	for <linux-media@vger.kernel.org>; Tue, 29 Apr 2025 07:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913227; cv=none; b=m7Idnrd2XlPrE2HIxpNM5KOf+tzgPpg/fw/bApLp6jkjmGTJFynM5X0BVQ6hQ1htb5tGw3/07xML8iGsgw9Bb8WKkPkQohaYML6WpmAFP7bB5dbsjVnOLQmkXxZzKp9y1krxzeG7IefZgFSs6CgKnzKwzQDRqwgBAkBFmp2lOXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913227; c=relaxed/simple;
	bh=PtytWcnS/mpletPR5SlTHfURqCtkT4ZtJRTahue/FMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccXiTz2/RMCiBs0HHxpq32swR5yS2qZ0ycRGmuG5KEh3Vf8qp+jh+ahz/hHUbk0MRO8fXvEKF5uakpa3aWAo/GxiN2eHhKFdOYYFWIKohHP45qh+vpKkXg5CX8J4sSmQIYat9iDo55U8aFy9ZoxSgi6YsCDCBJvRvIHFbsnEFDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEqay3Yl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745913227; x=1777449227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PtytWcnS/mpletPR5SlTHfURqCtkT4ZtJRTahue/FMY=;
  b=UEqay3YlPlyp69YruIg6P0MXbtf9tIVQedxZtFG2ChtNN0tS6KCLqq38
   3XdLGoOzzJnL0OwZuIa4GQTIlaQkR9CItyoArQkFXwQcT2w1NNTOpIDy2
   97yyxhOM40eI80BK8hFey8cpQVhpsd+62mWoMGDViKCYZxKiISSP20Sgw
   dMLB+8vZcArsZbY3TxzPdFS4jSH9YtiDo0K3RN1uaYpkzkRsB1Bm74gbY
   tUGOOLAQ2cDJ39VV+dniPzULszs/BWGVGnitFh5Mhl/ak1Tdw0GD0UcLH
   USVSli985boVA29HDqFaQjcYSB8ACCwlrBENOLDVFJZrKt2dMqj6akPSz
   w==;
X-CSE-ConnectionGUID: coiDR9qaTPKJMA3NcJ641w==
X-CSE-MsgGUID: bnkMGP/vQhiau3I5FcvWDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="70028315"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="70028315"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 00:53:45 -0700
X-CSE-ConnectionGUID: IKvISrzjT5SUsTF0xzaBdw==
X-CSE-MsgGUID: 5CkXgddHQvagxbDSdVh5cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="133647970"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.84.5])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 00:53:42 -0700
Date: Tue, 29 Apr 2025 09:53:39 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com, phasta@mailbox.org,
	helgaas@kernel.org, jerry.w.hu@intel.com, hao.yao@intel.com,
	tian.shu.qiu@intel.com, bingbu.cao@linux.intel.com
Subject: Re: [PATCH 6/8] media: staging/ipu7: add IPU7 input system device
 driver
Message-ID: <aBCFg37INjUMwL/U@linux.intel.com>
References: <20250429032841.115107-1-bingbu.cao@intel.com>
 <20250429032841.115107-7-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429032841.115107-7-bingbu.cao@intel.com>

Hi

On Tue, Apr 29, 2025 at 11:28:39AM +0800, bingbu.cao@intel.com wrote:
> +unsigned int ipu7_isys_mbus_code_to_bpp(u32 code)
> +{
> +	switch (code) {
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +		return 24;
> +	case MEDIA_BUS_FMT_YUYV10_1X20:
> +		return 20;
> +	case MEDIA_BUS_FMT_Y10_1X10:
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +	case MEDIA_BUS_FMT_UYVY8_1X16:
> +	case MEDIA_BUS_FMT_YUYV8_1X16:
> +		return 16;
> +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> +		return 12;
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +		return 10;
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +		return 8;
> +	default:
> +		WARN_ON(1);
> +		return -EINVAL;
> +	}
> +}

We return negative error but return type is unsigned. 
Also we do not check for error on ipu7_isys_setup_video()
when calling this function.

Regards
Stanislaw



