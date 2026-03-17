Return-Path: <linux-media+bounces-55998-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N/QGOgJuWk/ngEAu9opvQ
	(envelope-from <linux-media+bounces-55998-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 08:59:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3962A52DC
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 08:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 255363020A4C
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 07:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4737B3932C6;
	Tue, 17 Mar 2026 07:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAMiwihN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231113932E9;
	Tue, 17 Mar 2026 07:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773734369; cv=none; b=kTDrWEBF36wMAkfAKIoqp+PxIMZ9HZ1dA8TKNyzdKdbrV56QzEKiV0pdowQk1pO5LUyNGw92uP7sZ0VldamPbDoSSh/HA3LXxXT14g+AA0sPY91IxakY/NR1Rh0cFBKbaEKBrvmyPAVyqJFnWROxZfkdC6YzRdQ4xFMnYxZwlZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773734369; c=relaxed/simple;
	bh=VWGOPoksrMSn5oBCkAunLAP4hMB6yCyCpYGsLk3EnbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deCZCxL9wErl3iKPSEPiT4qYVjZlW8C2nCvzH/JkYIwwn05+wkNr9BmSYi/ZT0wGbc6bYDKvkYQTWKDTJOca9tA9dpiEEe9sJpjksp4IAZjuuxWibd0rJl5LohzRFa+XIviFAE+JP6GDdVFkXTkAYWVM+1EtwWWSu6E7Z/cc3ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAMiwihN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773734368; x=1805270368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VWGOPoksrMSn5oBCkAunLAP4hMB6yCyCpYGsLk3EnbE=;
  b=BAMiwihNGV2nl6DdJHBNdwCJrBKUBiVKSxUU+XNM+1/wh1SpuIQYY/Df
   cGAZU+U36MmMDFkX8WWRab/lHMJp1rfvk/GKkksnUUiaQCufuVCJX53gL
   ozTWZeCurxYpzO01AJBruIoXiIlX/U5ceVygw3f0wF6EIbGlqVBhhDhx3
   lXGHI141VeBWOATgxpHQYil8cGv7um1O6i80WlFeUfBNTgvsyCbTwRFWJ
   0dzNnudqDfpnHeo1SLiU5XH9NO5pn3BqOCb7SGkjIK3gHqpPKy8PX6CF2
   cSaqOK/GZOHcYRLd2p1aLO8wy2AtbvQEx8zUZQaQHK47SF9uN7cV9+klk
   w==;
X-CSE-ConnectionGUID: 86jKYrzBQq+LoSGpLwerIw==
X-CSE-MsgGUID: fLMBxGKUQMK+N4kiV53zHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="77368689"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="77368689"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 00:59:27 -0700
X-CSE-ConnectionGUID: gfvreg6HT6G85mE4nMeNMg==
X-CSE-MsgGUID: rK8Cfpu+RpuT6bc4Cmsqkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="217919411"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 00:59:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 80377121D18;
	Tue, 17 Mar 2026 09:59:13 +0200 (EET)
Date: Tue, 17 Mar 2026 09:59:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: remove unnecessary braces in
 single statement blocks
Message-ID: <abkJ0TOrtMR4sTjd@kekkonen.localdomain>
References: <20260310203646.8869-1-rayfraytech@gmail.com>
 <20260311170423.13157-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311170423.13157-1-rayfraytech@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-55998-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 0E3962A52DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oskar,

On Wed, Mar 11, 2026 at 06:04:23PM +0100, Oskar Ray-Frayssinet wrote:
> Remove unnecessary braces around single statement blocks throughout
> the atomisp driver to comply with kernel coding style.

Did you write this manually or generate it with e.g. Coccinelle?

-- 
Regards,

Sakari Ailus

