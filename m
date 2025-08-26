Return-Path: <linux-media+bounces-41090-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6DEB36D29
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 17:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6D4A1C25D0A
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 15:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245B926B2A6;
	Tue, 26 Aug 2025 15:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+PSE7rt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55DB23E340;
	Tue, 26 Aug 2025 15:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756220549; cv=none; b=XO29PZWO9pM7fNw514ZaLvX7IMBdFi9c+sSjpWsog2htrhvQrprVPcpsYOttl90AaR2+1sOJG3XmcUDqlFtE+dIqxug/vtgWg607lmAPW8ezwTfQhnjhRtuNdl4/DXHWmTU5MlbxIqsezJ3TiL44D7s3sa2Ne6BrEx8Dk9cRJZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756220549; c=relaxed/simple;
	bh=SN3IqMi4XqvMXIJc86UQy1qyHuj2S2SN3u0DPkLl8H0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXWjElin1kkMGKIhbAizRQJ6yQFrs4ujbYiF5i40ub3duOXECZjbc+h8cXkG1zTM2M1ipnvAcXKaPAqbMJdUMrZnZyfeG0WBpOiCQFCvak4dFnKDMgYsw5/1kfv980hmV92LgEl1WtVAWWlZmsLPJlYv2SoVVELmF1T1Yzd3OOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+PSE7rt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756220548; x=1787756548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SN3IqMi4XqvMXIJc86UQy1qyHuj2S2SN3u0DPkLl8H0=;
  b=U+PSE7rtlIS1qIdGUY0HvrNKhTtsdJjdElsJ6xeaxqf5Q1vMgst/1uzH
   kk1fCGl9hhUQaAE/pYUs5zJFW6FoL17ydiY6f6x7OC1DvASPGT8hd68Dk
   QSwYdLsUBB4SejIvThgfjkvqFaaRcYerwJNTjICq3xdy6fLjY9xEGKIVi
   B2/1UksguT6u/BSi/nyzn+HdNUTie4U8etmoDWwWyPfEeMWJAt/5W4Jx6
   vBk/sRdbvYrjCbrmTmZoFfmBoNTHKGIZcvOrPsL4TClTpZVZbjTpoTEBK
   xqbxOXRVskx0m+nkg2YokCVBU+srKpgF4Eghf2bTwxEec6I3hKRJgmcm5
   g==;
X-CSE-ConnectionGUID: /T/qKqfoRkuKZYf7X0hYRw==
X-CSE-MsgGUID: mXwSe3LTSeuRkpFzD9oCmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58604574"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58604574"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 08:02:27 -0700
X-CSE-ConnectionGUID: gsbKjlLKQRCMZC6Wba6+/g==
X-CSE-MsgGUID: cH3FtrAwQ5epLo5DuKw+uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="206760358"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 08:02:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uqvBk-00000008o6d-3vxV;
	Tue, 26 Aug 2025 18:02:20 +0300
Date: Tue, 26 Aug 2025 18:02:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/4] staging: media: atomisp: Remove unnecessary forward
 declarations
Message-ID: <aK3MfAbTa49C8Rqo@smile.fi.intel.com>
References: <20250826104414.2817514-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250826104414.2817514-1-abarnas@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Aug 26, 2025 at 10:44:11AM +0000, Adrian Barnaś wrote:
> Get rid of fifo_monitor_status_valid() and fifo_monitor_status_accept()
> forward declaration because it brings no value.

If you send more than one patch, get used to cover letter.
My script [1] does this for me, so I won't forget doing it.
Also one may use `b4 relay`.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

The patch series (all patches) LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

...

> +	return (data >> (((port_id * 2) + _hive_str_mon_valid_offset))) & 0x1;

Side note, perhaps change this (in a separate followup) to

	return data & BIT(port_id * 2 + _hive_str_mon_valid_offset);

It will significantly increase readability.

...

> +	return (data >> (((port_id * 2) + _hive_str_mon_accept_offset))) & 0x1;

In the same way

	return data & BIT(port_id * 2 + _hive_str_mon_accept_offset);

-- 
With Best Regards,
Andy Shevchenko



