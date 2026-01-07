Return-Path: <linux-media+bounces-50129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 647CBCFD7E0
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 12:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC565304A989
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 11:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C7C30FC16;
	Wed,  7 Jan 2026 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NX7vzuNw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D1B189BB6;
	Wed,  7 Jan 2026 11:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767786517; cv=none; b=cS7C5F5t3IWML59Vh0+Svp4RCBJR2okDgD47ngp7EPv2r2c77OkupVqA0YAMJCRqNi5FYwvNya+jV3r4OwM7DLsyQ4j02BX/ETGXu+FtZwQBWSp5PrLnT24nhCXZWC6komJ+iVEBZbAmKEehmeDgQjcyQMDYhVsbTSmXDsLELP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767786517; c=relaxed/simple;
	bh=ZToniWAp35sk8rm5uVKrMMQORpt4RMkaD9UDQfZgs+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdazBR65aCMDQw4oMc8fEkXao7D5GXvCa1bWTbQwL9gJnjV2Ps9rWPU+8wVSZdKLE9rQLuX7nzzhXmYY1+LKxkPwYSOHVnIZ8OcBuN6oo40Hals4MWAKQ0koWLp5m1Wo7ata/m/Fa35iTLIsd2J5HobgeZxH0CqfRIn/opCKjVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NX7vzuNw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767786516; x=1799322516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZToniWAp35sk8rm5uVKrMMQORpt4RMkaD9UDQfZgs+g=;
  b=NX7vzuNw2xVymrclhGkKR2Jwyy0iMi8PsBs9oZM2cU3n9UvWUq3Yw6LV
   /9cz9a8ZtEeb2Uzo9jxh6Q/h1NuVugKkMDpDlhjoEQyNJcaCczxsdHoqW
   DWDcpPASrjZbDvC3v63VrbcpGCMq7RckGViC8hR1LcddIZ8bG/62/VzJI
   zGmwmBmbo89o1QOJph0MaTMbsJ5Ih6KwawyKQZHVjMgns0ldd6ZBtHGvk
   DqMgYdkBJlRs8np2PoUP8FYsfxIxP5ik1fAsqkKTt6HgKsWoI22gryG0M
   rwv1qikn9VBOSMas8Bf5kqID6Bl6UXQltvClaDUPAAVvH59mxPEsdQjBM
   Q==;
X-CSE-ConnectionGUID: 2r3TkMLUSdyBfKe0TVry0Q==
X-CSE-MsgGUID: 9eMl4+hYQhiPtoQGmMnL8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="73001829"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="73001829"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 03:48:36 -0800
X-CSE-ConnectionGUID: YsnEqYNUQISZeHQPxuHdpw==
X-CSE-MsgGUID: rsAdJWyzSKy16qmRda/0jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="207384585"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.143])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 03:48:34 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AB4BA121D80;
	Wed, 07 Jan 2026 13:48:47 +0200 (EET)
Date: Wed, 7 Jan 2026 13:48:47 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Sebastian Reichel <sre@kernel.org>, linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/5] media: ov02c10: Adjust x-win/y-win when changing
 flipping to preserve bayer-pattern
Message-ID: <aV5IH7PIFnySHhYC@kekkonen.localdomain>
References: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
 <20251210112436.167212-3-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210112436.167212-3-johannes.goede@oss.qualcomm.com>

Hi Hans,

On Wed, Dec 10, 2025 at 12:24:33PM +0100, Hans de Goede wrote:
> The ov02c10 is capable of having its (crop) window shifted around with 1
> pixel precision while streaming.
> 
> This allows changing the x/y window coordinates when changing flipping to
> preserve the bayer-pattern.

Ideally we'd use the crop selection to configure this, but given these
sensors (and drivers) are generally what they are, I guess this is probably
a reasonable way to go.

-- 
Regards,

Sakari Ailus

