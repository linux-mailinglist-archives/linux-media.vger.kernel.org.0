Return-Path: <linux-media+bounces-57915-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFN1CcMMzmmnkgYAu9opvQ
	(envelope-from <linux-media+bounces-57915-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 08:29:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8D4384785
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 08:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 152C1301531F
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 06:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591A637E2FA;
	Thu,  2 Apr 2026 06:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yq5sfNTB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7F4238C1B;
	Thu,  2 Apr 2026 06:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111296; cv=none; b=bldy/POVKIWhaq8wRA74uBINzjZCZZH0mQm4DaKwLAN9V+VQgcMpQ4gmLehz/qEkUHnm7PLokPERTZM3+aYV0478CLgCWbgH0pCJtrOcuQ10kcB6p+UY0Hx/h9XD9g7534zhfzGlKX/0ErULUY3w3DYQoAfnycfv9ZL4zkBIGMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111296; c=relaxed/simple;
	bh=5HWRW44poUgaYpA/k1WBH9lfhf3JcC/BB6wQWjT4xmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvC0+qZjEaWayE7e/nHd0dvVG1qoi7JYx0Nd4PrxNNOgm1Nutvv+lfcpc0S3HDfzcGcZ36mlV7+yF8x/tEAUYYsMidcp8f9rrYHvy1LpHk7Ez0NrkF81xh29PUf8Iridnefm6qqdqjsZwBQsNYyOAYmRst2x8dRHY6J4QTzz81A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yq5sfNTB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775111294; x=1806647294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5HWRW44poUgaYpA/k1WBH9lfhf3JcC/BB6wQWjT4xmE=;
  b=Yq5sfNTBBPmXAoCBLeKkOc1B45ikCM4nKk4I3mvuOfIvJnRug3/stG6g
   Hd4QVCmt4hhqWMuIX69Z7tTa14hDL6LTJFa/8q9zKdQ/direOHI6vjjt7
   09dAcvOQ6ywctC9teDx3BmbNwATiS74/CFmy7gEKMhNMvQtrLVsGupeVX
   j+2YlVLkDDC452j8AHvSgfJf4/zZ+sZFn7Wj1saaF/nmz8xfybikPfLuc
   mLcN+YlqOD7R6mtYvR0bcdgztAi2HZKoMcvyr3xXpVhDot2+mhE/sSdef
   rgS9C+gZ7Uw1FL5FrZTPKKD/2TWIGpn8eM7oZJ6xhnbtYP32ywmC5MTPn
   Q==;
X-CSE-ConnectionGUID: 9N3R0N0+RWOEVPn8zqadGg==
X-CSE-MsgGUID: YWLLWCWdQraDXjXzkrodBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76129072"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="76129072"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 23:28:13 -0700
X-CSE-ConnectionGUID: qV4tp17kR+afR8O3n/GYIQ==
X-CSE-MsgGUID: ljqQzKkvS5SQBH7E8YqEFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="231294690"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.245.21])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 23:28:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A145712080D;
	Wed, 01 Apr 2026 15:40:56 +0300 (EEST)
Date: Wed, 1 Apr 2026 15:40:56 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Arun T <arun.t@intel.com>
Cc: johannes.goede@oss.qualcomm.com, arec.kao@intel.com,
	ilpo.jarvinen@linux.intel.com, dan.scally@ideasonboard.com,
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, mehdi.djait@intel.com
Subject: Re: [PATCH v7 2/2] media: ov13b10: Support multiple regulators
Message-ID: <ac0SWIPXv6SQo2zy@kekkonen.localdomain>
References: <20260401122030.3955499-1-arun.t@intel.com>
 <20260401122030.3955499-3-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401122030.3955499-3-arun.t@intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57915-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,intel.com:dkim,intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 6F8D4384785
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Arun,

On Wed, Apr 01, 2026 at 05:50:30PM +0530, Arun T wrote:
> The OV13B10 sensor driver currently handles a single regulator called
> avdd, however the sensor can be supplied by up to three regulators.
> Update the driver to handle all of them together using the regulator
> bulk API.
> 
> Signed-off-by: Arun T <arun.t@intel.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

You can't add Reviewed-by: tags that haven't been explicitly (or otherwise)
given. I haven't given mine on either of the two patches, for instance.

What about the other two?

> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com

-- 
Regards,

Sakari Ailus

