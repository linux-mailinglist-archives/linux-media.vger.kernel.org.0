Return-Path: <linux-media+bounces-45117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CD2BF57DC
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 11:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 65E843510A7
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 09:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B39D329C50;
	Tue, 21 Oct 2025 09:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOpUeXjn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1606221F0C;
	Tue, 21 Oct 2025 09:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761038750; cv=none; b=fYYIM2yR+vwowBr8CvgtqygU3jH73zBddhC89pxqHht+U7lEPGIUsbWqaKk8OUYgFmVlG8Z2iDxzQGtdew2Ygou3KeeZAgluh9vHU0w/9blfMKXKR+gUIYsxlOlNS9nW1BQPd72sp4dMqDxBYXg8MWK5Zg4d5c3ciRhVocm0xnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761038750; c=relaxed/simple;
	bh=1/VK7hhoLILt5AJ4kRlkTSbhWrjSipFmR4OK9HdA9Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPWJSMBjz2qA6to4LYDgpmMdacRoNMhx7eop/1KJJ3ospFK9/+5UqgLn0Qs7bGwjlDns3l+/RlT0+fJt8CqdfPMFb15bxUs6dUoV9DeX1QePVVgWWtN4tFCncTnA7OJrygNE27G05eUEznkdTPQNO2pRKmYCDNORr81O99HuJqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOpUeXjn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761038749; x=1792574749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1/VK7hhoLILt5AJ4kRlkTSbhWrjSipFmR4OK9HdA9Bw=;
  b=GOpUeXjnA1zU+KveMPSHOqEdBQ+OGr3PokskRMo/rNxZhYtZow9sszqH
   CPr7RfmTXyswsjkXqkz5+3OkdgCHbXTXXXvV7Rh+a0Xfq9C4PzUzovkmd
   0MkK2G60rCny/xKm/rJb/dHRD6ytY+KykfJGEWTFBQt5339L7bwCbbNNq
   zVLtaO34lJIK+qGNcvucB5les91DUm6BrH0oOesUbSx+bwEM8gfBC3gVl
   8DJiXbIbvrEoOesvcpWzyvngh5/a2CFH0Adk8kHKY8Cq1S3gY6YVMuLZj
   nwmy1I1DuRYbZEefmvEPkMmshufUHpOl5qDIfr52Feunm6EdfHGgFITbc
   A==;
X-CSE-ConnectionGUID: 3fkBPCdBQM26Md3Tt5WZXA==
X-CSE-MsgGUID: MPOAbBDDSXea+3GPlO92ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66801751"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="66801751"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 02:25:48 -0700
X-CSE-ConnectionGUID: RRKuRbnZSkaaiJwRZuVHzA==
X-CSE-MsgGUID: By8zqz4IRp+Lxhn3sRgNQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="183949410"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.134])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 02:25:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E54681202B5;
	Tue, 21 Oct 2025 12:25:43 +0300 (EEST)
Date: Tue, 21 Oct 2025 12:25:43 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: add Samsung S5KJN1 image sensor
 device driver
Message-ID: <aPdRlygxV1TCCUU3@kekkonen.localdomain>
References: <20251016020419.2137290-1-vladimir.zapolskiy@linaro.org>
 <20251016020419.2137290-3-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016020419.2137290-3-vladimir.zapolskiy@linaro.org>

Hi Vladimir,

On Thu, Oct 16, 2025 at 05:04:19AM +0300, Vladimir Zapolskiy wrote:
> +	{ S5KJN1_REG_X_ADDR_START,  0x0000 },
> +	{ S5KJN1_REG_Y_ADDR_START,  0x0000 },
> +	{ S5KJN1_REG_X_ADDR_END,    0x1fff },
> +	{ S5KJN1_REG_Y_ADDR_END,    0x181f },
> +	{ S5KJN1_REG_X_OUTPUT_SIZE, 0x0ff0 },
> +	{ S5KJN1_REG_Y_OUTPUT_SIZE, 0x0c00 },
> +	{ CCI_REG16(0x0350), 0x0008 },
> +	{ CCI_REG16(0x0352), 0x0008 },
> +	{ CCI_REG16(0x0900), 0x0122 },
> +	{ CCI_REG16(0x0380), 0x0002 },
> +	{ CCI_REG16(0x0382), 0x0002 },
> +	{ CCI_REG16(0x0384), 0x0002 },
> +	{ CCI_REG16(0x0386), 0x0002 },
> +	{ CCI_REG16(0x0110), 0x1002 },
> +	{ CCI_REG16(0x0114), 0x0301 },
> +	{ CCI_REG16(0x0116), 0x3000 },
> +
> +	/* Clock settings */
> +	{ CCI_REG16(0x0136), 0x1800 },
> +	{ CCI_REG16(0x013e), 0x0000 },
> +	{ CCI_REG16(0x0300), 0x0006 },
> +	{ CCI_REG16(0x0302), 0x0001 },
> +	{ CCI_REG16(0x0304), 0x0004 },
> +	{ CCI_REG16(0x0306), 0x008c },
> +	{ CCI_REG16(0x0308), 0x0008 },
> +	{ CCI_REG16(0x030a), 0x0001 },
> +	{ CCI_REG16(0x030c), 0x0000 },
> +	{ CCI_REG16(0x030e), 0x0004 },
> +	{ CCI_REG16(0x0310), 0x0092 },
> +	{ CCI_REG16(0x0312), 0x0000 },
> +
> +	{ CCI_REG16(0x080e), 0x0000 },
> +	{ S5KJN1_REG_VTS,    0x10c0 },
> +	{ S5KJN1_REG_HTS,    0x1100 },
> +	{ CCI_REG16(0x0702), 0x0000 },
> +	{ S5KJN1_REG_EXPOSURE, 0x0100 },
> +	{ CCI_REG16(0x0200), 0x0100 },
> +	{ CCI_REG16(0x0d00), 0x0101 },
> +	{ CCI_REG16(0x0d02), 0x0101 },
> +	{ CCI_REG16(0x0d04), 0x0102 },
> +	{ CCI_REG16(0x6226), 0x0000 },
> +	{ CCI_REG16(0x0816), 0x1c00 },

This looks interestingly CCS compliant. It might be worth taking the MSRs
and trying with the CCS driver.

Where is this sensor found?

-- 
Kind regards,

Sakari Ailus

