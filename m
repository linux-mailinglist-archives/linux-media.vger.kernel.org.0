Return-Path: <linux-media+bounces-59525-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGmoCcZe62lGLwAAu9opvQ
	(envelope-from <linux-media+bounces-59525-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 14:15:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A157145E43C
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 14:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F33330099A3
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 12:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182A23C345A;
	Fri, 24 Apr 2026 12:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nsykInhT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38F92139C9;
	Fri, 24 Apr 2026 12:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032896; cv=none; b=m5jmCR0Pvg7vU5SLm176Q3HH52p0U73T0mPGA9he4nfwvko7mAkCL/Ogv5Ux4HlfhK5xiiMZ6F1xyQlvNb6DlI5QeeOzlXp7MgjaMSGrjnsA992Dtlg80NTMUwcDS+h8Z2pJY5mVOqHu4YdSEr9Ax31Y8NDI5/pmE7ruyItDZQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032896; c=relaxed/simple;
	bh=3NQ1vHWhMftn1IYKu0JMtVhpOTKltPCykRKZOIMhdRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6LMZyfoT3cWSNwsq8SN6MJaxFjnNwvrEEaIwhzJbMnADJT/0wUSze6PnCTNFWlLe0evLTGV4z7Ny56pzZTtTuyCO36srqypX9Qwk0nVPdTCKqejIwBKJQXBp9QmPThpXFYB797YwCxNyH/wtTrX5G9vHI/ghIyZc1Ndbmqxlss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nsykInhT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777032893; x=1808568893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3NQ1vHWhMftn1IYKu0JMtVhpOTKltPCykRKZOIMhdRo=;
  b=nsykInhT0/CG/jbLRxuDMJm0+VkBxaPrZfc2nK7DhEDjtbyp1tCfD9BA
   2eznidXhxCAVb9s36kvZBuSJZ32u74HieizYsLYwvQg+jxSxOyYJgU36e
   lb4qf7EXDvya8syrRtG+pV7c1GPfhgg8Hqwpz/lZsxq8PUmfgPuSpXEbJ
   TmuKwdp6UObjp6phkeD5owiKfqO4YJyMRl1ZEPRcCEsyrSeElBrLLyJtw
   yug4ESFhoMWuQg6WydgSUeycvUdPFV5za2VSAhCtWmuvVNeqVKiXdbro1
   kwfhmo5brmrcPpo/mwbA829zyVU5xAcHunhArvTJQb+46aPOG9WZrE/Vx
   A==;
X-CSE-ConnectionGUID: FE72tDejR8yWTmFwYVJAYA==
X-CSE-MsgGUID: NCFiulFiQwanQCesfUCLiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77714867"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="77714867"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 05:14:53 -0700
X-CSE-ConnectionGUID: uX0SI5zbS7CLQUbDwfa2hA==
X-CSE-MsgGUID: sH8xp8+aSY2wihZHUJJHtw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.56])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 05:14:50 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 33F3D11F7D2;
	Fri, 24 Apr 2026 15:14:50 +0300 (EEST)
Date: Fri, 24 Apr 2026 15:14:50 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Cc: laurent.pinchart@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Svyatoslav Ryhel <clamor95@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] media: i2c: Add os02g10 camera sensor driver
Message-ID: <aeteuimzPdmE1rTB@kekkonen.localdomain>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
X-Rspamd-Queue-Id: A157145E43C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,foss.st.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-59525-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]

Hi Elgin,

On Fri, Apr 24, 2026 at 02:55:44PM +0530, Elgin Perumbilly wrote:
> Patch 1/3:
> - Drop the fixed data-lanes property, as the sensor supports only a 2-lane MIPI interface.

Does it really say that in the datasheet? To me this looks like a driver
property.

-- 
Regards,

Sakari Ailus

