Return-Path: <linux-media+bounces-11443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C088C589A
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 17:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E14CD1F225D5
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 15:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7F917F361;
	Tue, 14 May 2024 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hn2yuupi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FA36D1A7;
	Tue, 14 May 2024 15:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715700080; cv=none; b=iJ3+rPvZOCFDG/dxSbkwDn9Gv3TU1UdOWmJv5U2w3DP6duueVxugsGzDnhK0jTJL2vuW7V+ayW5aBQFFzEGKCZjpNF8i8L2hVi8/QTY4j1DTflmUaqxjLfPemE7EvcIplUwdblicT1O5udLmr2pU+uyjinuhsxDhbDrGbYdSPRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715700080; c=relaxed/simple;
	bh=AvI5hbrvPA4iuIG9qxPDacNYxMQQhFyv9cCcqxA3glY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8OwG4QtDuwswFuCqLn2ZyMeDwR4dFgVLmMYNRgaz4E9YAJz9yxrMbbuSGsaqjqctTjEa375TDLQDc3+sWHWVWfLYUxWU3eagU3emdSqrZ99sBF1k+UDunAKlFrgFH+ZpG9XtPAZT/8v7FqW/mpCLAEGK/8dAHcbomGYuv0VGdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hn2yuupi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715700079; x=1747236079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AvI5hbrvPA4iuIG9qxPDacNYxMQQhFyv9cCcqxA3glY=;
  b=hn2yuupiByIsU8zjqy5cSgrAZmfznU6BkNPCt+aa5A5hdKulpRFIJIW6
   EWBQhoqTxWMi9CegM9wLdMZInPmJN3AALmfPF6IkIIiQBEfF/3D6jD6VY
   kBzAUsm2f3mlp7xIfdauEmtwMkMkyvJjw1lPqrjm46FDAIfO4hszb/Scb
   EwzhWJPw3pINMUtSTJSlyhemWOSH9o+hCuuIS6O47/Unvuy1UBEhOlprw
   KZaJlghhdn97bgcsoi7eVw3FViKnPDdfl9c3dm0sl7LOFw8gwCP0Re1f8
   riq39hlMOLUvxAN8zc4KLsIwtaFULjhc4gzRummGmkET8MqsY/JwOTEA/
   g==;
X-CSE-ConnectionGUID: JudtloilTP6o5GGo6RkjRw==
X-CSE-MsgGUID: tZ5vDcpzTRWgtncY/d9hqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11858340"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11858340"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 08:21:18 -0700
X-CSE-ConnectionGUID: aU9mjho7QRWjI4OzxI/h2g==
X-CSE-MsgGUID: EH+yz+mZR8mcu1GxZnVK6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="31264554"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 08:21:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s6txp-00000007ThE-1tgY;
	Tue, 14 May 2024 18:21:13 +0300
Date: Tue, 14 May 2024 18:21:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] media: ipu-bridge: fix error code in ipu_bridge_init()
Message-ID: <ZkOBaUW1uLw6ildS@smile.fi.intel.com>
References: <f468c4ac-0629-41b5-b5d1-e26f70e44800@moroto.mountain>
 <ZkN2Ow6hASmKvHlz@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZkN2Ow6hASmKvHlz@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 14, 2024 at 02:33:31PM +0000, Sakari Ailus wrote:
> On Fri, May 10, 2024 at 06:43:31PM +0300, Dan Carpenter wrote:

...

> Neither IPU3-CIO2 or IPU6 ISYS drivers should be of any functional use
> without sensors. But the power states of the devices could be affected by
> this: the drivers should power off these devices but without drivers they
> maybe left powered on. I haven't made any measurements though.

FWIW, Hans mentioned AtomISPv2 case with somewhat 7W consumption on top of
the idling machine. That's why we have a stub driver in PDx86 exactly for
the purpose of turning it off when not used.

Hans may correct me if I'm wrong in numbers or elsewhere.

-- 
With Best Regards,
Andy Shevchenko



