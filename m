Return-Path: <linux-media+bounces-19602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7F599C909
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 13:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B602A1C23000
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94B41A0701;
	Mon, 14 Oct 2024 11:34:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B269199FC9;
	Mon, 14 Oct 2024 11:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728905661; cv=none; b=e7CYRMEUPQUw+FOyEenH5GqO7BQZnvBQKeFF0Oeww2KJ7kDP36CoM+c5LLlxylQzu0j9ayZY9/Xn1SyUlWxQLX/Oezq/xohVBGuqirwGR9E8tJimhbGKs97YIkuHoHdD/Oe/b9KzduzNx4DVNK8g3Tmeep+TSnJCCtBipT8m0wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728905661; c=relaxed/simple;
	bh=leC8yKlYH4VNPM2C4uhTqo+xy0aVd69hjV1pJDYe5Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDAAZqG/WnxsAnWs7wnWmezu1so2z55aGFXNenz2vX1AmxMMN6MtidYMmuCMiXT8rejbq1xLQAELtIuDHwNjPBaCNrMb1bFzjhnqExE/se2pHBFlhT807yuSondMKG9c3+rjkW/XyWgFhzAI3TQtuHZEdVNk1Nk5poq7i/1mTOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: x5PXqk6DQmWgUouKkadjQA==
X-CSE-MsgGUID: 0WcgFxLAQf+V7bv1/HFEzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28380889"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="28380889"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:34:19 -0700
X-CSE-ConnectionGUID: olEkw6FRREO1uaLlY8DPUg==
X-CSE-MsgGUID: o6UvEGmNSW6p3Fona3Ulkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77199106"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:34:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1t0JL4-00000002sjn-2dPK;
	Mon, 14 Oct 2024 14:34:14 +0300
Date: Mon, 14 Oct 2024 14:34:14 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: remove redundant re-checking of err
Message-ID: <Zw0Btri2dydmt3W3@smile.fi.intel.com>
References: <20241012141403.1558513-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241012141403.1558513-1-colin.i.king@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Oct 12, 2024 at 03:14:03PM +0100, Colin Ian King wrote:
> The check to see if err is non-zero is always false because err has
> been previously checked on whenever err has been assigned in previous
> code paths. The check is redundant and can be removed.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

All patches that end up in 100% minus lines statistics for this driver are so good!

-- 
With Best Regards,
Andy Shevchenko



