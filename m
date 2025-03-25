Return-Path: <linux-media+bounces-28734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2784EA70747
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 17:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDD07188391E
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 16:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84C025E80A;
	Tue, 25 Mar 2025 16:45:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72D525DCFF;
	Tue, 25 Mar 2025 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742921105; cv=none; b=IguqUiaDtI3bod8APsXfnq7dBXftgl6dYMEnfD1uXyHKoewxj3yJ4f5k9S/RgNTouwk+oChNx+GQrfn3aQHD04pFe/sudBvc0EXX5G2WQTJOHVfyCMZxcOATIgTo/sE+zNGFRHKHl6MnL5yRSrS3i3yIcutxGUe8vidaws4mFtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742921105; c=relaxed/simple;
	bh=ALZjN4sYzfZWPW3MNYIJ7WaO6qtrIN+yblxhCFztwTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fc3xfklN14CxOntzj7n1h9qFTq9O9ksQrko3swRiu4iWuKW33ZSoofkc5MTgV9UBfXKc+4Ar+S6PTxVW+Xe8DNhdBxOiWQQp5tTz9zbb7tLpITfKMlkawdKNa0a38Wz/MG1zJmT0rf/NKWiCYqpRnjGmo/huoqA3gr5Waq/lolU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: Wm6NfFe9Tq+Q89TZMifLQQ==
X-CSE-MsgGUID: Kb5UHdWGRIyJsnUUySQzOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="31782409"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="31782409"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:45:03 -0700
X-CSE-ConnectionGUID: FQ3KGgwfRdWoLNI7eZ5wqg==
X-CSE-MsgGUID: +bMZeZ6jSXen6XQ71KIA4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="124616069"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:45:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tx7Oc-00000005o3U-0KUp;
	Tue, 25 Mar 2025 18:44:58 +0200
Date: Tue, 25 Mar 2025 18:44:57 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/8] platform/x86: int3472: Stop setting a supply-name
 for GPIO regulators
Message-ID: <Z-LdiRzW9S6mTpyZ@smile.fi.intel.com>
References: <20250325161340.342192-1-hdegoede@redhat.com>
 <20250325161340.342192-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325161340.342192-3-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Mar 25, 2025 at 05:13:34PM +0100, Hans de Goede wrote:
> The supply_name field is not mandatory and is supposed to be set to
> the name of another regulator when it is known that the regulator being
> registered is supplied by that other regulator.
> 
> Having a regulator supplying the regulator which is being registered does
> not apply to the INT3472 GPIO regulator, stop setting a supply_name.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko



