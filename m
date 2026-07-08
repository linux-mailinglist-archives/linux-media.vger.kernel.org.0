Return-Path: <linux-media+bounces-66992-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hgo5BtxQTmqHKgIAu9opvQ
	(envelope-from <linux-media+bounces-66992-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:30:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0919C726CD1
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:30:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=MUVLdYGL;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66992-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66992-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E25D330074E1
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 13:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67C7342501;
	Wed,  8 Jul 2026 13:27:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EF533F5AB;
	Wed,  8 Jul 2026 13:27:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517278; cv=none; b=I85LOI7xndCUMGrY4Epq0MUwFdNTp0tr7MzPSs9qv/+YYaKJ/6FwwFJOu9VgyA1T/oHGG8/6mYPwbs5LKUWjcgjjRd8ExHcXuvZD50QADq6+7/xeuUXnWR96kv/l05RC1IuM0DNyRva8Vda7JzWdY4CxpnwQ34k8rTXyoHRS3UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517278; c=relaxed/simple;
	bh=yTe+WVZuFugswh3RL0wnMjZ7kdRAYWb7cdIGNeIj9ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avZOyIeYLNwzgJ35VABY8UfpkNWSyVoQ0tG17oPGPlbZ1YG07T0/PxwEb1Lp6xis/ZYq18BmNQSKYr3toQ1Wjc8GC4uz++LvCgLw8Obp9Q4XIq6Cajk2Hoan00c2OrXLIpJrVDsabY8MFYMWJTSg0xzxYFyy1GTQZbGZenbr8J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MUVLdYGL; arc=none smtp.client-ip=198.175.65.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783517276; x=1815053276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yTe+WVZuFugswh3RL0wnMjZ7kdRAYWb7cdIGNeIj9ZU=;
  b=MUVLdYGLVp9gephCQ71bMY5GsQcuFYtcbg7Xfi9BnwkkNiHAWivkUzVC
   g3LbvdACaZ4cldZuHmMjoAQCVcK+uVqEH4Fb38tojhukTRjea8ONweXZN
   QvwU+aet0mnOXFh5ysKvFWL9hljdAsut5d2xdQgYbs7/1G4MeI+KLrGom
   vX9Unsej6t58d0OVb0uX5wP1HdtDTzR3fjEegda8cCyxvCIXZjz/FsPDL
   Dtv7qmqKU/C1CRlOXzcL5I18KE2ljEux8ZQOSaAPSglZZatNVdJXK/ETT
   y6EqBbcbf8pOuHoQfm9Zsw3rinsXDN/jKEsrPhteCpC7iKr5r9TpM8UtO
   A==;
X-CSE-ConnectionGUID: /MsN94tCQOmWSvmgu0FZ/A==
X-CSE-MsgGUID: P0rZ+VW1QCaVvhNvEamxJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88091265"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="88091265"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 06:27:56 -0700
X-CSE-ConnectionGUID: Zms+C4xfQfq5Sj1WNtAqkw==
X-CSE-MsgGUID: KoIitXD1Q5+FLLXSITLLjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="247915914"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.120])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 06:27:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EBAFC11FB4A;
	Wed, 08 Jul 2026 16:27:53 +0300 (EEST)
Date: Wed, 8 Jul 2026 16:27:53 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: slongerbeam@gmail.com, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: i2c: ov5640: use scoped fwnode_handle endpoint
 cleanup
Message-ID: <ak5QWY9g7GTCQ0BZ@kekkonen.localdomain>
References: <20260616081517.44685-2-birenpandya@gmail.com>
 <20260708124954.26954-2-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708124954.26954-2-birenpandya@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66992-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:birenpandya@gmail.com,m:slongerbeam@gmail.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0919C726CD1

Hi Biren,

On Wed, Jul 08, 2026 at 06:19:55PM +0530, Biren Pandya wrote:
> Utilize the __free(fwnode_handle) scoped guard macro from
> <linux/cleanup.h> to automate the lifecycle management of the endpoint
> fwnode in ov5640_probe().
> 
> This eliminates the need for manual fwnode_handle_put() calls.
> Additionally, drop the redundant !endpoint check before
> v4l2_fwnode_endpoint_parse(), as the parse function already handles
> NULL endpoints safely.
> 
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  v3: adopted __free scoped guard (Laurent); explicitly dropped redundant endpoint check (Sakari).

Please don't include git tags in changelog; git am will pick the lines as
tags to the changelog.

The threading appears to be broken in the set; please resend v3 (three
patches) as you sent v2.

-- 
Kind regards,

Sakari Ailus

