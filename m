Return-Path: <linux-media+bounces-58224-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKiRLyE41mlZBwgAu9opvQ
	(envelope-from <linux-media+bounces-58224-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 13:12:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 144063BB1F2
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 13:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BA453037D5E
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 11:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB2A3815E6;
	Wed,  8 Apr 2026 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2v3flsX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B0137C0FB;
	Wed,  8 Apr 2026 11:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775646675; cv=none; b=DGhIShl3EnA8sXEn+RAPImnCyCVp92qfU7vGT5lISYuEd3DqhO8qdihrCw9Y1pYfG73FdG7LwfVIHt8+UcS4X04gCfgRLcBwGBkLcB4MmLpS5SjrxZjmz5q9Jwe8Q/094fuKKp+iqg4ZA1P+BgNtRvJqLj8X/d3uQ3sZe8L/Q4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775646675; c=relaxed/simple;
	bh=QhsAyHx4RUT1vpbbp6G26rxl4Fq8s3qeyZtrCETvG1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUXmlz/in05XjXsEashvKSu71MARQvnlEDGN2GATCL0eNWgEoICXvMXjGG3/C9ywrbJfY4F7l6Ko8Uuw4bjaNG3bGQ78ADsfPYJvPiMpXEzMdSblt0ZYdSE3nes4VP3ChyZIeywXO2BtSqmDyvGE7pIWnG+p38f+egP2A3mNdXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2v3flsX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775646674; x=1807182674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QhsAyHx4RUT1vpbbp6G26rxl4Fq8s3qeyZtrCETvG1o=;
  b=F2v3flsXMmjwgzfuvTRYoQWoA+qTDI6GjTC2AaGZnI0RT6Z4ze+Jfz3k
   QzZAPLcQ7IbvsiG4jG7zVIwQdWiuXWTOF1PKsqMD7jXYfXAELCndsAdPJ
   n43Xgemg4VrEGcV6ptktyJn8BX+ya4X2jDVeoPr7wFP/0QsggtB1WPGLL
   lXcKxlGI3tJGXHkmoakmyr0Fdh68UFxvLX5K98JnfiKJI4bDbb2TyT6MM
   ke2hIt4gir0d698XNj/+dN0fTWOBUZUQ6RpE9RwHz1Cqigf4rsJ9xJdlY
   c64bs22QxR2yzGLrGGP2dfFq+oNMkAaOnBje5blLfsid8SLtZw2dNR38B
   g==;
X-CSE-ConnectionGUID: vILqX5rRQSKLBaLngxWsuw==
X-CSE-MsgGUID: p3wzUUudRX+wuEzHfCJ8Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76503468"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="76503468"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 04:11:13 -0700
X-CSE-ConnectionGUID: GZfTYYR5SZqRLfBJnuL8UQ==
X-CSE-MsgGUID: WPM/l62dRIOqQCjqCjqGSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="221903716"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.17])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 04:11:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 51CCD11FCDF;
	Wed, 08 Apr 2026 14:11:25 +0300 (EEST)
Date: Wed, 8 Apr 2026 14:11:25 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Lukas Larson <lukaslarson@gmail.com>
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org,
	johannes.goede@oss.qualcomm.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu-bridge: Add upside-down sensor quirk for Dell
 16 Premium DA16250
Message-ID: <adY33VrleUl4JRWx@kekkonen.localdomain>
References: <20260331190145.11592-1-lukaslarson@gmail.com>
 <ac6btfUsok-Y0Dw2@kekkonen.localdomain>
 <CAMCiyfoVxS_iQWVEiak+mv1i9uF2WtqMqyfCgeQyO_q5XS4LgA@mail.gmail.com>
 <adT5gpw-DjHAEUuB@kekkonen.localdomain>
 <CAMCiyfog4ViGYFOOpzMDHB9w=Trs1YOr1DMyNDixYEMVZri=Bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMCiyfog4ViGYFOOpzMDHB9w=Trs1YOr1DMyNDixYEMVZri=Bg@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58224-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 144063BB1F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Lukas,

On Wed, Apr 08, 2026 at 08:02:44AM +0200, Lukas Larson wrote:
> Hi Sakari,
> 
> On pld 6.19 the camera powered on, but the image was flipped upside down.
> Tested adding https://github.com/intel/ipu6-camera-bins and
> https://github.com/intel/ipu6-drivers, still upside down.

Ack. Thanks for confirming this.

I think what has happened is that the sensor's orientation was originally
baked into the register lists and once that was fixed, we run into the
issue. But it still appears that some systems with this sensor have it
mounted upright, or at least SSDB has correct information about it.

I'll take this for v7.2.

-- 
Kind regards,

Sakari Ailus

