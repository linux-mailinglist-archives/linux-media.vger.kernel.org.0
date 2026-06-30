Return-Path: <linux-media+bounces-66125-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SwgyGG3gQ2qVkwoAu9opvQ
	(envelope-from <linux-media+bounces-66125-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 17:27:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C15DC6E5ECE
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 17:27:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=amk6F+8t;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66125-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66125-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAD503056C19
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0D2396B7F;
	Tue, 30 Jun 2026 15:27:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3CB37A481;
	Tue, 30 Jun 2026 15:27:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833243; cv=none; b=ZvoPUCzfeYLIiXth0z6XBsERMjS5sd8kOBxR1zsAXWUZnymYwQrVOZeoVbqX73ApupjB3NycNXtYmWahKLpC1QvxG60KsUut+8Qui/T/9HWfWplOcTp3tHVgF2B2ScvqV2Clad3CgzPji42+7qG61Lh2txXYpBCW6BJDgRdyl9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833243; c=relaxed/simple;
	bh=4ZvzZLTV0oZKhXvKeMSAuWkFYlim30RaWe2PRRPd2aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trbRmfl9vMmUlI3aNYXtgzevAF47MQn6rhFQNmvEMuccctnchM3TsEiw5pWQp9PaDpBhRjiG8B6Q5ZCds2SACC2tu9rmXbxDQStRtNc9LUag5bUOMV2IKSEZcQZhmTsnYkVJeG9mzHsouyhJN/vAE0NhGncRMrWQ3IVQOYA4CMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amk6F+8t; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782833240; x=1814369240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4ZvzZLTV0oZKhXvKeMSAuWkFYlim30RaWe2PRRPd2aw=;
  b=amk6F+8tWb1q93VJs6nYx8IrBte21XLn6yLlUI91dN+cnhVnDAjTFJR9
   fqCGJvOfwl+Bhbwfho6zRPmZP66kIaufFMsfhgi2MmiBdkP+P8zfvju5c
   UbUNBnj1O/giPQzKvIDUOdXeSw7o2GX7hBGaImRazXyQirqEbr79zIG4M
   Cevidel6Z4vHdYV5NQXuHo+/XF7qC3LoIdWL94KLxHaYJfplHrf6f2gxZ
   p1y8kgg7DrmO41vaI3GWnWjk2YxT9BqBJXI2RE74R9f8QsbA74Km3AFyX
   wrHhTzTOdUXgLcs/y6afgdpL9zABp2G3Nm/lEiBj1FtS7HGRUwiH/WTfO
   g==;
X-CSE-ConnectionGUID: Xm14JlahQ1uxf2ZaQc638Q==
X-CSE-MsgGUID: IRcKERVcSnyW/nAt7+4Alw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83577764"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="83577764"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:27:19 -0700
X-CSE-ConnectionGUID: PAQ7cBfaRR6nnHwXmeXnhg==
X-CSE-MsgGUID: /wEwOQ3VSwWh45jB8JkNoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="255884125"
Received: from slindbla-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.241])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 08:27:17 -0700
Date: Tue, 30 Jun 2026 17:27:09 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/15] media: i2c: os05b10: add V4L2 digital gain
 control
Message-ID: <akPgL7EX95O_iEi9@mdjait-mobl>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
 <20260325114404.95188-6-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325114404.95188-6-tarang.raval@siliconsignals.io>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66125-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tarang.raval@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:himanshu.bhavani@siliconsignals.io,m:elgin.perumbilly@siliconsignals.io,m:mchehab@kernel.org,m:vladimir.zapolskiy@linaro.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mehdi.djait@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mdjait-mobl:mid,linux.intel.com:from_mime,vger.kernel.org:from_smtp,intel.com:dkim,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C15DC6E5ECE

Hi Tarang,

On Wed, Mar 25, 2026 at 05:13:51PM +0530, Tarang Raval wrote:
> Stop programming digital gain in the common register sequence and expose it as
> a V4L2_CID_DIGITAL_GAIN control. Initialize the new control and handle writes
> in the ctrl callback.

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com> 

> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>

--
Kind Regards
Mehdi Djait

