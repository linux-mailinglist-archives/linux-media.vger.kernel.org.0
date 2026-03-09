Return-Path: <linux-media+bounces-54945-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4P6PExq3rmnMIAIAu9opvQ
	(envelope-from <linux-media+bounces-54945-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 13:03:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E329F238622
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 13:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4E086301AE4E
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 12:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9023A6F09;
	Mon,  9 Mar 2026 12:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRX3cNs5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA74F3859CC;
	Mon,  9 Mar 2026 12:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057814; cv=none; b=JCIRoazlv5IZA4pB5iZC9V3MdPmyBQFunoZEcROCMkmCjhpCfeCr40H971GvE9fU6XV9Zt5r1a6pXjnnL/2Y2HuWpOQw6akufw+jjn/cQrk5v++89xHvmcCdKXv1hpQPSTbBIPAffIwq2JMjZOga2+LMLppynys0qRi9965nlbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057814; c=relaxed/simple;
	bh=Akaiyu7zQ927nZZpLebwwa+egRsCipPJa4ER2KrnN1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSOn78/15+gS3I78nxjwnkE4luyLmnkPJonmBCGFctR4MrjBxpOGwigxb9anW46vzLMWISARcqQJn37POg58TMLBAHowEluHX3K3S5tUYJFn6vAYT+StslviMdctn02JrAjPgzvlNytEZpJCG6vAgBwMcwx08/ACaQqx/6OFItc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRX3cNs5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773057812; x=1804593812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Akaiyu7zQ927nZZpLebwwa+egRsCipPJa4ER2KrnN1I=;
  b=SRX3cNs5Fjl2bn3nvxyLG1D/emlwM4xHRTB3jFd0aBFEKjGQ+98+eOm4
   yOzMndn3e8LvdJ543eSu6mPP7p5SHVqWkmYc8fplAxVFZDP6ZEOwkdeHN
   pRx03NPRkkyGZltuQhZ7hb5kg2bu6EwsIwukQddVpmP8PYoZNh74OziCC
   2raXrnuh+V6ddEgeXh3zslmXrf4v/WRiJbSKps5jsZv0PBPt0QXvxodsy
   pIv7LuWePJtpuAh60A0Y2fDVDDvOHNobSg/yU+LCN7EhCCISreXyo0+W0
   5OyocTqDaci+tWZYCtWv4w1qExLwQCPxBWEOYqI+e5ky1f0yPiomEeYSw
   g==;
X-CSE-ConnectionGUID: PsCNgCzhSFmHHvi5h1RhHg==
X-CSE-MsgGUID: YgJjfOUnRbG18jeHcWfcrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77957149"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="77957149"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 05:03:31 -0700
X-CSE-ConnectionGUID: XEjHmmRYQEOPI5XlEnX3Lg==
X-CSE-MsgGUID: J6oNHFWqTS69yejH4/h7tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219677798"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.148])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 05:03:29 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BAA04121D1F;
	Mon, 09 Mar 2026 14:03:59 +0200 (EET)
Date: Mon, 9 Mar 2026 14:03:59 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jimmy Su <jimmy.su@intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH 1/8] dt-bindings: media: i2c: document Omnivision OV08D10
 CMOS image sensor
Message-ID: <aa63L4vOvfYqLrnJ@kekkonen.localdomain>
References: <20260226-ov08d10-v1-0-c3a916368123@emfend.at>
 <20260226-ov08d10-v1-1-c3a916368123@emfend.at>
 <20260227-imported-benevolent-stingray-e97dfd@quoll>
 <16086ec6-a50c-4d47-8c6a-0e7cb73a5d6d@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16086ec6-a50c-4d47-8c6a-0e7cb73a5d6d@emfend.at>
X-Rspamd-Queue-Id: E329F238622
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:?];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-54945-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_TEMPFAIL(0.00)[intel.com:s=Intel];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.270];
	DMARC_DNSFAIL(0.00)[intel.com : server fail];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kekkonen.localdomain:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Matthias, Krzysztof,

On Fri, Feb 27, 2026 at 04:10:50PM +0100, Matthias Fend wrote:
> > > +  reset-gpios:
> > > +    description: Active low XSHUTDN pin
> > 
> > So maybe rather powerdown-gpios, see gpio-consumer-common.yaml?
> 
> As activating the XSHUTDN pin on this sensor works like a reset, I guess
> it's okay as it is.
> 
> From what I've seen, it's also common practice for some other Omnivision
> sensors to designate the XSHUTDN pin as the reset pin.
> This is also the case, for example, with the recently added OS05B10.
> 
> During a review for another sensor, I was asked to use the reset controller
> framework instead of the GPIO pin for the reset function, which I did in
> this case as well.
> To my knowledge, the fallback from the reset controller to a simple reset
> pin only works with the 'reset-gpios' property.

I'd use "reset" for this, too: it's first and foremost reset. In most
camera sensors with "xshutdown" or similar pin the function of the pin is
documented to be hardware reset. Most such devices still use very little
power in hardware reset state but from software point of view that is still
secondary to the reset function.

-- 
Regards,

Sakari Ailus

