Return-Path: <linux-media+bounces-41267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC3DB3A5A9
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A69F5E41E5
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADF6298CC9;
	Thu, 28 Aug 2025 16:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAJdjTK2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB89285065;
	Thu, 28 Aug 2025 16:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756397298; cv=none; b=GaL5WQ5IUtYB0myCIoSvjXbH8sGvd+2tc+lWGA7l2QNWVTKpOMVgrLYa6SQdyPrQi527xxpygoqPJsW9dlgkTnjlYDqby7daltFe3fIGWPzuz6PlDtVL/Pp0+In2kr3UAyXuFtTS1LXXacomHZEXqv+9w97lit4V0yk8U701veo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756397298; c=relaxed/simple;
	bh=chl2pglmKuX5THNV4UczW2DfJ8GWxqeVOVktQ94bii0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQ0iPO2urATIExs855kEOTD9zwSXSsLJle8XRxFdrgWRsGJpzB+JLUVZzcKAj7k8tgs7AaB8chpWyl2816H3is3dsVUmAju+3Bxvv3z4F8jH0IB6UkZdONEpAu00MwmXP4gWs8YDHAk18kFW9grbsB6AUMgtR5iHCZWtvLBs+78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAJdjTK2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756397297; x=1787933297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=chl2pglmKuX5THNV4UczW2DfJ8GWxqeVOVktQ94bii0=;
  b=gAJdjTK2tyJp6Kma2k1Gwzx4+iEoaX0M/3jdWjpdQMnMqubZ4p5sh787
   0VrCZPUdTjTy4wCxJjdnxFUB7nydPkaYcW6LnJVJCsFJUJqgUcIH6c4Jh
   B3tct9fp7EbQpPuhdc9UjML68BgqpGQTBqy7O8SMvUWlqe/WW7XAd9Sdn
   47rGfOQ7QH0LASk6pQ19nlR5FW0nGOEHAfwANf9Z8iIYBmqglX0ch5o4h
   5y7kfa1UPL0uLVq6ffzkiFNRtjeLVn+1BzGR5Ffyfphlbm0nnoo8pcgvH
   APY69hKJOxb4JIFOJ5CKgF7kSEkAB7LlKd7bFYVH68l/kb2hIgG2qMacZ
   g==;
X-CSE-ConnectionGUID: wQklFKzrR1ulYeD3orhqjg==
X-CSE-MsgGUID: C7YqnZdMRWaslGcvh+dypA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="61306461"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; 
   d="scan'208";a="61306461"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:08:16 -0700
X-CSE-ConnectionGUID: 6NXhRMzqTDaxYPKfnPew0g==
X-CSE-MsgGUID: d3UIs7vBS2q49mxX4Zsurg==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.135])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:08:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id ABFA411F9D4;
	Thu, 28 Aug 2025 19:08:08 +0300 (EEST)
Date: Thu, 28 Aug 2025 19:08:08 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Matthias Fend <matthias.fend@emfend.at>,
	Arnd Bergmann <arnd@arndb.de>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/2] media: i2c: Add ov2735 camera sensor driver
Message-ID: <aLB-6GsY-OiCZi9I@kekkonen.localdomain>
References: <20250821143126.319470-1-hardevsinh.palaniya@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821143126.319470-1-hardevsinh.palaniya@siliconsignals.io>

Hi Hardev,

On Thu, Aug 21, 2025 at 08:01:11PM +0530, Hardevsinh Palaniya wrote:
> The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an                 
> active array size of 1920 x 1080.                                               

Have you run v4l2-compliance on this? Could you do so and provide the
report, please?

-- 
Kind regards,

Sakari Ailus

