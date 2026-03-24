Return-Path: <linux-media+bounces-56844-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM/XNn9owmmecAQAu9opvQ
	(envelope-from <linux-media+bounces-56844-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:33:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AB63067B9
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6313D303DF76
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 10:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99423E5561;
	Tue, 24 Mar 2026 10:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVSYXlCp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B1835A939;
	Tue, 24 Mar 2026 10:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348348; cv=none; b=Fh/+/LRRZyY0uyjZMRsd7hPqb8/xiHAgcFNcU3fkaMQjP8fQtH1a3NwF3nh5LDUPSfvd4EDBp2Ho1r0FCF3Kn1J72IZQ4irgf+eTIi5vdOWgqbALlGbh/DzqI719HgNvdoo/RTVC7Ic7cmf6r9K3uzSDgEdyzKvVJkTqaTdiZIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348348; c=relaxed/simple;
	bh=cBMy2jntN4+WFTlsXOtKbCH9nTqkJNcSbULyZ4d4mgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rA9O4Xaw3i/mE+DA6NXBqG5c/AhIqilUL+hF6GvC5zxJR0K6S9O++dcNy2YAmkWr+qbtXPgKoyEX6hmP1CFK04jA4DhnYR9+rc0gsC5REhQ3jTDqTM6ExEdcgZ7Kh8XtB9RKNVM+rMO4jMAob098B7ng1zezuujGC6/pTUpGXbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVSYXlCp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774348347; x=1805884347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cBMy2jntN4+WFTlsXOtKbCH9nTqkJNcSbULyZ4d4mgs=;
  b=kVSYXlCpD45P7O/wYGKLhzWEc/AvoYPvP7ITZKVE1N7BreuBX+H9AnEd
   l9Qddg3Y0/8emYN/H+ZsdTz+LOF3TyLrNu9jhFTLfh+fA7D8agFxBKaIF
   fKRL8LjFoPqGezbIHD23rZcv3qDldeE5uAk6wQ1H59aeycJ+/nGG8AYyZ
   afHHmD8NW9hf7U4X2320myjO5kJBenIKwa3cYo0zVC+IcV3M4tpVsUleS
   7ZShmTJ6zMHJZhO7pHv0P1gb7aLreXUbrVsKu63FMryPs/C+Tm2Skl/vF
   QgwtKzPpHM2Xz6dB6Xma26GRfTXAylZV9vHQzG6BhMl54Yao/dr7mt/Lt
   g==;
X-CSE-ConnectionGUID: FZgeTqWPR3yXOK9fd/PxfA==
X-CSE-MsgGUID: VFBlS4RVTlm+qRSaLbCwnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86830646"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86830646"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 03:32:27 -0700
X-CSE-ConnectionGUID: wbtuKc/pT+u0cSdcRKdB4Q==
X-CSE-MsgGUID: fbeBybCbSlS0NfgvltduVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228373965"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 03:32:24 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C410F121CFF;
	Tue, 24 Mar 2026 12:32:25 +0200 (EET)
Date: Tue, 24 Mar 2026 12:32:25 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Jimmy Su <jimmy.su@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v2 8/9] media: i2c: ov08d10: add support for reset and
 power management
Message-ID: <acJoOZjTCQMQTbv7@kekkonen.localdomain>
References: <20260309-ov08d10-v2-0-81f8b5d99984@emfend.at>
 <20260309-ov08d10-v2-8-81f8b5d99984@emfend.at>
 <abkUy5U-cwK-6_kz@kekkonen.localdomain>
 <47cee08f-4500-48ee-aea6-afba5a611211@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47cee08f-4500-48ee-aea6-afba5a611211@emfend.at>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56844-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: C0AB63067B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mathias,

On Tue, Mar 24, 2026 at 09:12:40AM +0100, Matthias Fend wrote:
> > > @@ -1403,12 +1467,32 @@ static int ov08d10_probe(struct i2c_client *client)
> > >   		return ret;
> > >   	}
> > > +	ov08d10->reset = devm_reset_control_get_optional_exclusive(ov08d10->dev, NULL);
> > > +	if (IS_ERR(ov08d10->reset))
> > > +		return dev_err_probe(ov08d10->dev, PTR_ERR(ov08d10->reset),
> > > +				     "failed to get reset\n");
> > > +	reset_control_assert(ov08d10->reset);
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(ov08d10_supply_names); i++)
> > 
> > You can declare i here.
> 
> Right. But since the variable will also be needed in other places in the
> next commit, it would have to be moved again. Therefore, in the end, might
> it be simpler to leave it where it is?

Ack, sounds good.

-- 
Sakari Ailus

