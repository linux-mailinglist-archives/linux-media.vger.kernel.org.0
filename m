Return-Path: <linux-media+bounces-62238-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K7pFD2NDWoIzQUAu9opvQ
	(envelope-from <linux-media+bounces-62238-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:30:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C310258BC37
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C68B7311526A
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B14E3D8114;
	Wed, 20 May 2026 10:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5xjhfNI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4153036A370;
	Wed, 20 May 2026 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272510; cv=none; b=CQrZqAe9cyI2r4IcoMtkz2BMWdRSR3SdflDwFyKTbAsjORAJZvJVWEMirVNiUddHm+VsDslrdbhGB5ZmVtOJCrBk9P1+zykHFYYUQHgFZ4XYSiL7Nne+I9de2AbJUgTXTTRoCIAR7ZcMsAzwibqO8UfjIEPNhhKFAxmnn4AK1LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272510; c=relaxed/simple;
	bh=vyabT8EViaMWnvjmwdZyIRis+u+i5vxTbtzqVMhKkzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUaMHh5IBUpLqkrMY+OtH16mddVLISa0dpja5Ucl+hLPi3uP7qAd/TfHiZFR3AQhbJ01+UKNJApNBHWei8Ai4zV79QocIJioPXmO3hYNGaEKiRl2oOuv5dSnmW9quV/TfL3aOxo5yePQ5guJbshgU3dM6TZkWDKQkni/5MF+qYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5xjhfNI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779272503; x=1810808503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vyabT8EViaMWnvjmwdZyIRis+u+i5vxTbtzqVMhKkzw=;
  b=C5xjhfNIOmHqnRUiY/W5q6RQjSvLXBiWfm7GW5O7/+UCjvMp0Nqo0aPm
   7rMKCTXgKOD2gu0lAwPuoepC7W9qWO0+HYsqGiHTo2/L3IvIWln/K9NRT
   SI3oi/a/66roIA6E/J+xG19eRi4cs5BScs5lez5Phzu7Gpi0WaUs9khEh
   PD8ku/1dk4hr/F/VmDqCUqNf4J4EfTJvxEVHiEuonzDmNsh+FmfJuvcwo
   YAGlGP9bX5Gqb7BDXGNmpdD1bTsFLGsFOTflymoQ/uwCH8is/ZvtDMEun
   NLxTuRd4qNGfJPXWzTYNmToeqWXJbNuUCzdMQYxHYRDvPX9AMgJxsa/tQ
   w==;
X-CSE-ConnectionGUID: enqVRRI6TFiKsiycHIi64A==
X-CSE-MsgGUID: 8mJp1VYzQU65ez9laNraWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80147582"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="80147582"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:21:42 -0700
X-CSE-ConnectionGUID: C8tM0U5VTJ2e6kGk+t8p0Q==
X-CSE-MsgGUID: Cp5oplL8R5el6JfQmEgUUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="235689409"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.115])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:21:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1942511F951;
	Wed, 20 May 2026 13:21:36 +0300 (EEST)
Date: Wed, 20 May 2026 13:21:36 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Cox <alan@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging/atomisp: reduce load_primary_binaries() stack
 usage
Message-ID: <ag2LMNtYhQmA-08H@kekkonen.localdomain>
References: <20260325125948.1385064-1-arnd@kernel.org>
 <acUOKIf3avxEPglo@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acUOKIf3avxEPglo@ashevche-desk.local>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62238-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,kekkonen.localdomain:mid,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: C310258BC37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 12:44:56PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 25, 2026 at 01:59:43PM +0100, Arnd Bergmann wrote:
> 
> > The load_primary_binaries() function is overly complex and has som large
> 
> some
> 
> > variables on the stack, which can cause warnings depending on CONFIG_FRAME_WARN
> > setting:
> > 
> > drivers/staging/media/atomisp/pci/sh_css.c: In function 'load_primary_binaries':
> > drivers/staging/media/atomisp/pci/sh_css.c:5260:1: error: the frame size of 1560 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> > 
> > Half of the stack usage is for the prim_descr[] array, but only one
> > member of the array is used at any given time.
> > 
> > Reduce the stack usage by turning the array into a single structure.
> 
> Makes sense,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> *I think the original idea was to construct some chains out of the firmware
> blobs and provide run-time combinations of them, but IIRC that was never
> implemented.

Thanks.

I'll add Cc: stable to make CI happy and this can't hurt in the stable
trees anyway.

-- 
Sakari Ailus

