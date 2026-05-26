Return-Path: <linux-media+bounces-62805-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB+SKKfCFWoAagcAu9opvQ
	(envelope-from <linux-media+bounces-62805-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 17:56:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A865D9279
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 17:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD09E3013840
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B34338D3F9;
	Tue, 26 May 2026 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K8Oeh3cS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F5A38C429
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 15:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779810816; cv=none; b=FtWWnOgc3jfj/OYtWGUj3F3IA/ENbgLxsEhkatHo/xZnhW5b4DlxliC0/tPJDa0YZtMcQGIXG9Eivc9Jp531V7nT53yuzdE/f4iF6GuH2mApMfWAchJBxXIKgBabIss5mLG020oi28Yc4HsBlduC1MW5O9PYR8zBOIShW78AUh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779810816; c=relaxed/simple;
	bh=GfIkxmctwrG5cc9Oglj8dCDxFpMQoiOtTnI8jVCHjZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPo9w3R9mz7qcxISRcwR3Y4TlDt0yl508DmlAJb0SoWSEtO4lLxUwZyrM+juXL69ku6q+psIT1RybT2I25X7JP2zNoY9qm43jWXbm2hH0AV4aV/ErJ2ayz8qp38kli1gemNa7zYl38MTLOYfbO9VGUYJkpjkAUclc7vvBVz5TTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K8Oeh3cS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779810815; x=1811346815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GfIkxmctwrG5cc9Oglj8dCDxFpMQoiOtTnI8jVCHjZE=;
  b=K8Oeh3cSYQWeNRarLoKJKyGwcEV3D6WgH+MqnTLOB7GHykbOjWl01Rnz
   4e6hMFJl04O3LuI7aUjzkFurHXgCkZa/kOzmG7uQTuKLjiv9rGjnJJQkI
   zxQs25yUx3BOvRSw4Dj+7MSZfhYvLSZ9lRUM4PkaOEijGe9tX36ZKx5hB
   vLTz1guV+MxxFPY5YfnO61C3c9pC9ajIuK8+WMZZ56t+pdRWWQmWnfXq/
   Uf/aaRgxmG7cw9tRv2RL2b0aXSuYfAfYUX2WOEpBbmMgNKAy3rKi0WO9W
   ZaB4bBbl873xEah9jNd7CxJgxrt8ngRXatIJBoZffz34YxJnomiVmONG/
   A==;
X-CSE-ConnectionGUID: MzfaVsiUTVKkvvBDjc/l3A==
X-CSE-MsgGUID: d5aLeezwSbi64EfxYXV0mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84516019"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="84516019"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 08:53:34 -0700
X-CSE-ConnectionGUID: dmei88lzSFSxdSIZ+7BQew==
X-CSE-MsgGUID: 9S1fwP4FQtSugML4ANYsDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="237549960"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.122])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 08:53:31 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6F30711FACD;
	Tue, 26 May 2026 18:53:28 +0300 (EEST)
Date: Tue, 26 May 2026 18:53:28 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Miguel Vadillo <miguel.vadillo@intel.com>
Cc: linux-media@vger.kernel.org, wei.a.xu@intel.com, atul.raut@intel.com,
	antti.laakso@linux.intel.com, mehdi.djait@linux.intel.com,
	kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v4 0/3] media: i2c: cvs: Add Intel CVS driver
Message-ID: <ahXB-Eg1O2-PlFvU@kekkonen.localdomain>
References: <20260526022509.162908-1-miguel.vadillo@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260526022509.162908-1-miguel.vadillo@intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62805-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gitlab.freedesktop.org:url,kekkonen.localdomain:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 02A865D9279
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Miguel,

On Mon, May 25, 2026 at 07:25:05PM -0700, Miguel Vadillo wrote:
> Cover Letter
> ------------
> 
> This patch series introduces support for Intel Computer Vision Sensing
> (CVS) devices found on Intel Luna Lake (LNL), Panther Lake (PTL), and
> Arrow Lake (ARL) platforms.

Thanks for the update. I got from Media CI:

drivers/media/i2c/cvs/core.c:909:12: warning: ‘cvs_resume’ defined but not used [-Wunused-function]
  909 | static int cvs_resume(struct device *dev)
      |            ^~~~~~~~~~
drivers/media/i2c/cvs/core.c:892:12: warning: ‘cvs_suspend’ defined but not used [-Wunused-function]
  892 | static int cvs_suspend(struct device *dev)
      |            ^~~~~~~~~~~
 

I suppose this happens when CONFIG_PM isn't defined
<URL:https://gitlab.freedesktop.org/linux-media/users/sailus/-/jobs/100763316/artifacts/file/artifacts/no-PM.config>?

-- 
Regards,

Sakari Ailus

