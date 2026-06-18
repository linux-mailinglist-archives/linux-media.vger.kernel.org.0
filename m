Return-Path: <linux-media+bounces-65208-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sOBlGJ70M2r3JgYAu9opvQ
	(envelope-from <linux-media+bounces-65208-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:37:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F4E6A09F1
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:37:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=S0295Cte;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65208-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65208-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A046300D1D3
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 13:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC82A3B27D7;
	Thu, 18 Jun 2026 13:37:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBBD280A56;
	Thu, 18 Jun 2026 13:37:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789851; cv=none; b=pjL7Wj5dc9VgEEAPxnZVJ1VqsZlDUr8jgOjqYc/DGhQFRjWQj7gDo7ivm7fY0u6FwcyKyI3Mm5uHCTGGo2cyR8rIrL9qHVxZ8WHlG8aJ/v2ySH3KOon92RiVNwc02fQyxWhrU9LFZ73hJob5zK7jjrUBYXni3t0DfCgciRrZFcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789851; c=relaxed/simple;
	bh=m50LHDfLbb5Qwx25ciboTF+H3SvHjec/c6kYVPwGNjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RncTR2QNdyd341BmvrqiX9iU/clOXqQ5UndL+Ww6NM+/tErgtaC/KzF2THn594VXS6xAbFD9T3gFsKinwdJEo0/wc1mo9hkwXsQe/suBYEwXq23/0esLoJR9G+dByq4QIbkG6OQ6JL3wgbCto0e4PrhjZuIGlNOYD44OimnXH+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S0295Cte; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781789850; x=1813325850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m50LHDfLbb5Qwx25ciboTF+H3SvHjec/c6kYVPwGNjc=;
  b=S0295CteOB4KvRVckMNZpctkL0uJUYhFHqdyYhWwdAMLYrMhlUk3GXIr
   NIMGAneOnWRQS7DJr85ZXKMqO0lIGdtMD3d44ce+MyZ9ct6Znu+Y4wDLq
   b2v/kEjUguoQ9u73Q+bOCvwlBUHXCyu2Bvk0TMfZ++tzhTcaTil4dGcUg
   geMxc53jgPPJdo9ZfKcHsvo0maPL3GaX6103wUQ3mhCoqms1KknsBESnk
   EmB+nR3hpEZHi25pcIUSrPiL9h8h0VWflPg2Ru/W9UDQtR3GuNKmVw3ZS
   H9bIiV+2AkGs5bXE8bMYnZvbxCUUtN7xjoP9lFU9990p9OnmPAHALT388
   A==;
X-CSE-ConnectionGUID: +Qc9gg9MQM6kqc+HWwrXDw==
X-CSE-MsgGUID: ZxElzJTFSjKTxTNwK2ngUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82625811"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="82625811"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 06:37:17 -0700
X-CSE-ConnectionGUID: 91XW35L1SDafMlxqJNyfQQ==
X-CSE-MsgGUID: lMZgLzi/SKiAm9A4DbwPDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="248452594"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.107])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 06:36:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A1A40120A2F;
	Thu, 18 Jun 2026 16:36:14 +0300 (EEST)
Date: Thu, 18 Jun 2026 16:36:14 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] media: i2c: os02g10: implement crop handling with
 set_selection
Message-ID: <ajP0TtXuQhx40pbU@kekkonen.localdomain>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-4-elgin.perumbilly@siliconsignals.io>
 <ajPay8NJ233yuCLJ@kekkonen.localdomain>
 <20260618130253.GF3345533@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618130253.GF3345533@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65208-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:elgin.perumbilly@siliconsignals.io,m:tarang.raval@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:mehdi.djait@linux.intel.com,m:sylvain.petinot@foss.st.com,m:benjamin.mugnier@foss.st.com,m:bryan.odonoghue@linaro.org,m:heimir.sverrisson@gmail.com,m:hardevsinh.palaniya@siliconsignals.io,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,foss.st.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:from_mime,intel.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,siliconsignals.io:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1F4E6A09F1

Hi Laurent,

On Thu, Jun 18, 2026 at 04:02:53PM +0300, Laurent Pinchart wrote:
> On Thu, Jun 18, 2026 at 02:47:23PM +0300, Sakari Ailus wrote:
> > Hi Elgin,
> > 
> > On Fri, Apr 24, 2026 at 02:55:47PM +0530, Elgin Perumbilly wrote:
> > > From: Tarang Raval <tarang.raval@siliconsignals.io>
> > > 
> > > Add crop support to os02g10 by implementing .set_selection() and
> > > storing the crop rectangle in subdev state.
> > > 
> > > Initialize the default crop to the active area, make set_fmt() use the
> > > current crop, and update the output format when the crop size changes.
> > > Also program the sensor window from the active crop/format state instead
> > > of using the fixed supported_modes entry.
> > > 
> > > This allows userspace to configure the sensor crop window explicitly.
> > 
> > Please wait for the Common Raw Sensor Model patches to be merged before
> > adding this -- we don't have an established way to configure cropping
> > before that. Some drivers might do something but it's all a bit haphazard.
> 
> Does it mean we should wait for the raw sensor model to merge this
> driver ?

I only suggested this for the 3rd patch.

> 
> Many existing drivers configure analog crop the same way, through the
> crop selection rectangle on the source pad. Is there harm in doing so
> already ? I wouldn't enable binning and skipping yet, that I agree with.

Which ones?

-- 
Regards,

Sakari Ailus

