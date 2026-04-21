Return-Path: <linux-media+bounces-59201-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJYiOWdD52n55wEAu9opvQ
	(envelope-from <linux-media+bounces-59201-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 11:29:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCCE438E10
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 11:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64A64302A2F5
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 09:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FDB3A5E68;
	Tue, 21 Apr 2026 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfFnraXU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7502FF164;
	Tue, 21 Apr 2026 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776763608; cv=none; b=gwkOtqoiKWRcw7S/JIfslHFVCkEjjERXjsFdp7azyxVYkMpr4hJXFQCudTc3zhhMlxhGa5wr1v8prF6I/m9ObUuZIqPBfEuc9N1hp3/pCfHZebGY97bcnt9mxfcKOC6YrAwWnoVfJnNqu5g+92K8SuwZSjaYClDimqZ2L4DekFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776763608; c=relaxed/simple;
	bh=9uSZWuMInFVZqRULaIzP0PraWbpzU76VgaIOGrc4Adg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqDtS4Nm+j1ZdgAnqe9QDvtB+PF5ugrkVxNIZnSvomiW7cjWAl8Y6AdkLLyz9DSDd/3wJgARYJgvlJM+Fg3BOzzJviUglqzJERDWVWD5Z4AHh6IFnpVyAWb1teVAV3inevatILGbXQd1bo+iXi87Xb2mcLh2aX4JYgjKHeIsp6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KfFnraXU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776763608; x=1808299608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9uSZWuMInFVZqRULaIzP0PraWbpzU76VgaIOGrc4Adg=;
  b=KfFnraXUa0m6a2iWNAy7Lhuc/ZP0BFdu1K6/ykl1xCiEVEgAfAgqmDkL
   Pi4C9bf2Nsd/UXbAQvqtXrmmeHTQ27Cjjq5oViGJ7aT9EVkP/gU5TgAnC
   KOCFMHRzQ3wbmEJowaYUZIG94aklM7C9DZM4NRGqr0mT9OlgwqQPAEOGS
   oa43S7gpKkY0SKaKKy9vI7Tpk+pRIDZhvd0jvK6ifvknEKkHQwdogGKco
   HwAuyTE/sIESxPh/eIv9OaSmYLPA5NcVoNZ7YeCp1TlfYtcpdXubAyuS5
   Dl34y6INoct+Y6jqI927M7082ZpeqeNhOcU9OJDdj545YutA5Bi4SzpjD
   Q==;
X-CSE-ConnectionGUID: kxPNTYdYT9aDmKqhiRHOVA==
X-CSE-MsgGUID: zMYQbVApThux4F4F0FLz4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77393231"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="77393231"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 02:26:47 -0700
X-CSE-ConnectionGUID: wZC05KK1QwSqFgMcxfohcA==
X-CSE-MsgGUID: C94ysYHJQRSQTIq9Fs9ykQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="236967340"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.56])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 02:26:45 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 56CAE120D05;
	Tue, 21 Apr 2026 12:26:43 +0300 (EEST)
Date: Tue, 21 Apr 2026 12:26:43 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Yeh, Serin" <serin.yeh@intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Kate Hsuan <hpa@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] media: i2c: imx471: Add Sony IMX471 image sensor
 driver
Message-ID: <aedC02xWo4x6nIpH@kekkonen.localdomain>
References: <20260417083214.222189-1-hpa@redhat.com>
 <20260417083214.222189-3-hpa@redhat.com>
 <fc73e3b3-3eb7-46cc-b2af-162017fd473e@oss.qualcomm.com>
 <DS0PR11MB7971EF4F2B0759AF0CD738D0F62F2@DS0PR11MB7971.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR11MB7971EF4F2B0759AF0CD738D0F62F2@DS0PR11MB7971.namprd11.prod.outlook.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59201-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,kekkonen.localdomain:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4DCCE438E10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Serin,

On Mon, Apr 20, 2026 at 07:23:19AM +0000, Yeh, Serin wrote:
> There are some reasons that the upside-down mirror/flip functions can't
> be submitted in the driver for upstream.
> 
> The version that I submitted for upstream is not included upside-down
> because the sensor has design limitations of mirror/flip.
> 
> Your version will occur incorrect bayer older on different platform.

I believe we'll need the flipping controls as the sensor is mounted upside
down in some systems. The rotation is provided to the user space but it
remains up to the user space to configure the sensor accordingly.

If there's a need to adjust the digital crop rectangle, we'll probably need
the common raw sensor model patches for that. That's what the driver in
fact appears to be doing but I have to admit I didn't check that bit very
carefully.

-- 
Kind regards,

Sakari Ailus

