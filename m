Return-Path: <linux-media+bounces-32770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E37B7ABBCD8
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FF46165895
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 11:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F812749C8;
	Mon, 19 May 2025 11:43:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3661ADFE4
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654995; cv=none; b=WAO7tBiPR374j6tqw9j/VvLY2NUUshYcyPuzJgLDekFaOw42Ww661BKAOobUWfeUOovNaNXFc5bAGY5Lk4qxay1NhoAcRMkVooYzptvoqEJBCV90dDiwSLk1vyUx+8sXQHKTH9ou3Lp5dn3HPgJzOc9U1yR38Qkviyxy64XXEXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654995; c=relaxed/simple;
	bh=O87IWEci71DcNfMRb2JRMuUSdcSsuhF6P+0h8y/hMts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMx1x+PUJVn8hwnxrHTgOdkUVwLHg4EnTPCdDJBThX0N9bKvHihgyElKbW7jooVe5poNebC8kiKa5B/I2gHDLoagXACPGWLU9C5i1rV59tGMimriskiIaFM4Y79qEcxZZc3WMe9Sxi0OJKve0vCMkbZzg6kvDC0xRzIc5G0ckT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: jn9zt9IARIaPF0D4uwVSAA==
X-CSE-MsgGUID: pcoXgEQJTEu5zNNMq3A9ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="60184723"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="60184723"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:43:13 -0700
X-CSE-ConnectionGUID: emPukurzSSOw/37hcQXmVw==
X-CSE-MsgGUID: o/XoR2ohTw2LZyZ0pewD7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="143347382"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 04:43:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uGyth-000000031N1-15Os;
	Mon, 19 May 2025 14:43:09 +0300
Date: Mon, 19 May 2025 14:43:09 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 14/23] media: atomisp: gc0310: Switch to
 {enable,disable}_streams
Message-ID: <aCsZTV6XuPiqCReu@smile.fi.intel.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-15-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517114106.43494-15-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, May 17, 2025 at 01:40:57PM +0200, Hans de Goede wrote:
> Switch from s_stream() to enable_streams() and disable_streams() pad
> operations. They are preferred and required for streams support.

...

(side note: that cleanup.h may help with locking as well)

> +	ret = pm_runtime_get_sync(&client->dev);
> +	if (ret)
> +		goto error_power_down;

Hmm... Don't you want rather to have pm_runtime_resume_and_get()?

-- 
With Best Regards,
Andy Shevchenko



