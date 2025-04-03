Return-Path: <linux-media+bounces-29314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EEBA7A1B6
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 13:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72EB23A85C0
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 11:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1568E24BD02;
	Thu,  3 Apr 2025 11:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmhpLgle"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D342624BC04;
	Thu,  3 Apr 2025 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743678762; cv=none; b=kkuo+WRJBAgYwha8ohTOZ0Ib1r5a9db+ibH1dwBwyCBaihU5SoAi0Q+kQRKbzoS3+44ISgRLVis69ix1r53PL9aUDDUE5wojGr/pWnb+uchnD/67Xy2CrXBQHW2wf2p8N1XyXcIxQYm2PsSJavjOCS9sG/sunmV+sEHs/aAIVFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743678762; c=relaxed/simple;
	bh=4/aIbPlVUJb5I1OOF/VHKAkwFUzsF2LiycF0Dt3QCnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KG6f1ejjcshQJBT6SY7WMPaZrYzfnW9sztv5u4nag4piFlUPJoHqOI4Yz2ZClX0gNyA+ivFtPQb59QINpGqLMZe/vkHTPaWYJXJlHduJOXQJek5xB56lmwdBwDNWs7K7t+MCU5sDeD4x0SBp+2traBuZoBt4bjO7IkBDg+wOqMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmhpLgle; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743678761; x=1775214761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4/aIbPlVUJb5I1OOF/VHKAkwFUzsF2LiycF0Dt3QCnw=;
  b=PmhpLgleB0mUgu8zIdvGMdswCihWua8n6H3FGy6g0tbFMQTjFccC6uL/
   XluWbiM+biAnoCyDLWlhn28Ptpm2Hzu+ev8FDSF7rHPSli2Oh1ASxAqoU
   0qFUTTJT1aHa8auOVhk1f/btQiALKef/X/iLw7I8yWDniKcnXoHbPSKJq
   ZKdH5Zt0tTUW2FD5cwYHlaeurn7lBxdahWZcVEF3W11OqDhhwdi/B0tLL
   w1XAg52jZExssiuHz/WwipIfjeovikFG62VYCPWUp4izG3pCZOfageSfu
   ZmzpESSZV8wg2bFQBT5ZGJZdbuwhAUi2KhbAuwm2M7KP4hHLjQaP/0ozF
   A==;
X-CSE-ConnectionGUID: QIfWYKSuQaKat0bSVtIbBA==
X-CSE-MsgGUID: VsmGTbyoRkmZXV9ORBOwwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="62480791"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="62480791"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 04:12:40 -0700
X-CSE-ConnectionGUID: 9g+PDe2WRg+iYP9BED3VNg==
X-CSE-MsgGUID: fsgBnStYTlW6X71GsCzaRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="157953236"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 04:12:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u0IUu-00000008mgy-0OEz;
	Thu, 03 Apr 2025 14:12:36 +0300
Date: Thu, 3 Apr 2025 14:12:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 1/1] media: i2c: ds90ub960: Remove of_node assignment
Message-ID: <Z-5tI_WVF2YQQ837@smile.fi.intel.com>
References: <20250312174123.4111661-1-andriy.shevchenko@linux.intel.com>
 <2e6599fd-0b79-430b-9e94-f731b60e1705@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e6599fd-0b79-430b-9e94-f731b60e1705@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 03, 2025 at 02:01:40PM +0300, Tomi Valkeinen wrote:
> On 12/03/2025 19:41, Andy Shevchenko wrote:
> > Remove of_node assignment which duplicates fwnode in struct i2c_board_info.
> > In general drivers must not set both, it's quite confusing. The I²C core
> > will consider fwnode with a priority and of_node is subject to remove from
> > above mentioned data structure.

...

> >   	struct device *dev = &priv->client->dev;
> >   	struct ds90ub9xx_platform_data *ser_pdata = &rxport->ser.pdata;
> >   	struct i2c_board_info ser_info = {
> > -		.of_node = to_of_node(rxport->ser.fwnode),
> >   		.fwnode = rxport->ser.fwnode,
> >   		.platform_data = ser_pdata,
> >   	};
> 
> This sounds logical, but breaks the driver for me.

The above assignments are still confusing, but I think I understand what's
going on. You run on OF based environment and some code uses of_*() APIs
instead of fwnode ones. That's why the current implementation in the I²C core
doesn't work.

> I also couldn't find this documented and didn't immediately find this from
> the i2c core implementation side.

The current code does this:

	client->dev.of_node = of_node_get(info->of_node);
	client->dev.fwnode = info->fwnode;

when it should do something like device_set_node() instead.

> Or am I missing some patch (running on v6.14)?

Yeah, there is a series in the mailing list [1], but it has no comments and
no move so far...

TL;DR: it seems in this change is incomplete.

[1]: https://lore.kernel.org/r/20250312185137.4154173-1-andriy.shevchenko@linux.intel.com

-- 
With Best Regards,
Andy Shevchenko



