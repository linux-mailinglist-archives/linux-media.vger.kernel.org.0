Return-Path: <linux-media+bounces-62223-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGuqME5xDWroxQUAu9opvQ
	(envelope-from <linux-media+bounces-62223-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:31:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C52589CD8
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8081314868E
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5F33C9EF0;
	Wed, 20 May 2026 08:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XYVcYrt/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F063C6A51;
	Wed, 20 May 2026 08:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264894; cv=none; b=quj/p0+U6yMLmkJAj9l25Bszdc/hxhN0OyvTLzu1ovu72KVgLEbbgg4iSwjGuRKwLlHy1+xhy4WL0+PHXuKunR2l6sgrj/JjtBsyXW0NOHIAEH7qxe52VI3UI/VHT/QFjX3zpRAMlYMQ/0r5zrFP6ykbuuEnBadvkd0CVUxY/I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264894; c=relaxed/simple;
	bh=mT6wxqpdCXQkPvIChp9mWyBwB1fKsmdcerZDKnqTyDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCb9XCNmkG70RswO3KPHOlMCwaFTP/ongtKAZoW4rk8x3nhXNZQdKAmveYZP4eFTiN2odyhSaysY3JKCcoEqQmU26Vhg/YSEKQGnqN+KH9pkN+XwEZLwZn3ctnt3QPQqd6Ycs+daeiiMSC85gKewFfQ0BzW7u9ssUBzUdwAt4W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XYVcYrt/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779264893; x=1810800893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mT6wxqpdCXQkPvIChp9mWyBwB1fKsmdcerZDKnqTyDE=;
  b=XYVcYrt/mmaRcQ3v3qH6I9Up7qBAP4hbLtPcBqUgvdHHWTrb1SNoZaJW
   pf9rAQwkIDelZwO/5p/5YbB15fPwL/8R8Zc4keCaUzf4qfHLRxKHTjre7
   a2uid9tSYhwx8cPnp2xWRb/cdZod/Yvch6ILYp5Ko1rj+oSLNvunaPqQN
   AGGi28fOcGdctIWP0JL5lM0V0MNjTN9fgjCq1PAK/UPLeEmU1gnOwdeFs
   aZ1b64dnjt+7S09chzQV/CVS5fxDVaVP1IZh46nPhX6Y1gVeXLV2xb1lZ
   jeW2/I7y/vAmTXzNbaEi9WMBBIkm71FkgYgGDJKc0GQd4rxqKspnSCuls
   g==;
X-CSE-ConnectionGUID: xUp8KFQ1RtWEl0UyS2wbLQ==
X-CSE-MsgGUID: FieegFHCSQGm6SSBIJL3tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80006107"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80006107"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 01:14:53 -0700
X-CSE-ConnectionGUID: O+MAbsPATwe+qrQ87va+1Q==
X-CSE-MsgGUID: VMyNfnrQQduBZu0821MkTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="237470589"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.115])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 01:14:50 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 511AE121C8A;
	Wed, 20 May 2026 11:14:47 +0300 (EEST)
Date: Wed, 20 May 2026 11:14:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Arun T <arun.t@intel.com>
Cc: johannes.goede@oss.qualcomm.com, arec.kao@intel.com,
	ilpo.jarvinen@linux.intel.com, dan.scally@ideasonboard.com,
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, mehdi.djait@intel.com
Subject: Re: [PATCH v11 0/3] Add TPS68470 power supply support for ov13b10
 sensor
Message-ID: <ag1td-etAR6OWMvt@kekkonen.localdomain>
References: <20260515174514.3752028-1-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515174514.3752028-1-arun.t@intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62223-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 73C52589CD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 15, 2026 at 11:15:09PM +0530, Arun T wrote:
> 
> This patch series adds power supply management support for the OV13B10 camera sensor when used with TPS68470 PMIC, commonly used on Intel-based camera platforms.
> 
> The OV13B10 sensor requires three power supplies (DOVDD, AVDD, DVDD) which are provided by the TPS68470 PMIC.
> This series implements proper regulator framework integration to manage these power supplies during sensor power on/off sequences.

I've merged the set via the media tree.

Thanks!

-- 
Sakari Ailus

