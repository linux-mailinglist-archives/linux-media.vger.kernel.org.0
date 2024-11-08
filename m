Return-Path: <linux-media+bounces-21118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BD39C1853
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76C4A1C22CA4
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 08:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D301DFE26;
	Fri,  8 Nov 2024 08:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfXqfufy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7CD1DEFC2
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731055690; cv=none; b=Tk/hysqhmHIRaJwj5+05juBc/pg+iikHfuTb0xc9L3DtppLdpYV1efquxZUd3Dh6RXRCu4OE215CyX9rOJbRzXxnylIW/ayz0aZtRVhb8LTnwTY6eA5VaLA/vjeuY90kzdByjrPl0JzaKtIP3pxJj1HNaaD16w66/v1qBBM5baQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731055690; c=relaxed/simple;
	bh=QXXT6D0uJ9MLI43khc4CysnOj5oz/Jo4XHurt75Mqck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNtJbkbvovYBSRUMj2fHpfe0wdJgbyscMQRdvHDsiVLvxCQu3WM/4T8KMAVS4I7ygcgaYWHdFXUc5EmJzM5z4QDvawM4zxABuTSWsYPlOL4yZT0hBjGJY4ZFSfrdehUWwlmeGlCuXTkbh+aAI9/lAIueq8v0I5gYBFM5t2m/uAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LfXqfufy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731055689; x=1762591689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QXXT6D0uJ9MLI43khc4CysnOj5oz/Jo4XHurt75Mqck=;
  b=LfXqfufy/GDRiN96BD3GjwwHTOU2jgOowP6uzDX1K4tyKVoTQujVTKik
   bbEgEIgE0XNOBpovMNoGZT4Yc11gqDpPXUXmj+4D40WRFQzfYiHX4A8Hl
   UqD1rtOdOyZVoWMVzcJcQ6tZp83p+q6iWt7zBhDG2eDB7NaBIy2Sxfgq3
   PItbHc17btL8CnQd/ydTSuNwbbLt65ZsJgNMn7k5RKJ6tDJagPQyzZ0uP
   1HLFPwDoeTh8Odl8D/QVDFqTsQD8nE7c7heyFlKwQyvqIzuEUc22MBpBs
   UZa1/NThLcdTWA2v9hiqzZNZAFZwn8PnlcJV8haYU5Ti3ShhcndP0GuSY
   g==;
X-CSE-ConnectionGUID: CT4Oni5LTC+hzJiIirJQqA==
X-CSE-MsgGUID: 4qUGkNSOQXGjVObFHNFnBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="33789624"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="33789624"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:48:08 -0800
X-CSE-ConnectionGUID: q/jZQsKvTX+5t1QEYclQwA==
X-CSE-MsgGUID: iDutvCtySYugQPslXekYcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85362950"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 00:48:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t9Kex-0000000CXhv-2ft8;
	Fri, 08 Nov 2024 10:48:03 +0200
Date: Fri, 8 Nov 2024 10:48:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] media: atomisp: gmin: Remove GPIO driven regulator
 support
Message-ID: <Zy3QQ8C1NvfLdLkG@smile.fi.intel.com>
References: <20241107221134.596149-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107221134.596149-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 07, 2024 at 11:11:34PM +0100, Hans de Goede wrote:
> The GMIN code has support for sensors using external regulators enabled
> by GPIOS, rather then using regulators build into the PMIC.
> 
> With the exception of the Trekstor ST70408-4 (1) tablet there are no known
> devices which actually use external regulators for the sensors and the code
> for this is using deprecated old style GPIO numbers support for which is
> going away.
> 
> Remove the GPIO driven regulator support so that the gmin code no longer
> depends on deprecated GPIO APIs.
> 
> 1) The GMIN support itself is also deprecated and all sensor drivers still
> using it are being moved over to use ACPI + runtime-pm and the ST70408-4
> shipped with Android as factory OS and thus will have broken ACPI tables
> for the sensors, so like other Android factory OS tablets it will need
> a bespoke solution anyways.

Definitely a good patch!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



