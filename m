Return-Path: <linux-media+bounces-65613-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dcnDDNnLPGoasQgAu9opvQ
	(envelope-from <linux-media+bounces-65613-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 08:34:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A366C30DD
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 08:34:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="j/waku++";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65613-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65613-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B4433020BDD
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 06:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8BA3C10A9;
	Thu, 25 Jun 2026 06:33:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA112E06EF;
	Thu, 25 Jun 2026 06:33:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782369234; cv=none; b=rajQQNAdur8sNDD0HhQ1RfZPWENx4hyQvbGU5xjkoxwTNOVFbvZjkH/FWfPvoSL8p0PamrO+pDAyTSOS9jiIecOkubDOiIPQQYELQxPZCctrKaXs8wpexM8dChq57pl41iQBeDz/5PxZFiUVyGblYF51zCQ5t9GEzBazzttLtBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782369234; c=relaxed/simple;
	bh=FBfQ5z8ocvcr92KhtSfiqgzAuZkaUppGNWRywcRPaKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOwiTLFsb7bkrux3D80F7Lcy9Io8GXPWoUsKNT2Rxlbn1HNZPHh5rubE4HNj0Q6lgyRpK0fscrTHIDZ1jdxvgCakVeedg1fliV+9PS+EJ525EZYB2PwUpd/IMTSTf88DodFp8szmha5FEGqKmIQPNYvJ51uCSnf9JLT1k4y7uSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/waku++; arc=none smtp.client-ip=198.175.65.17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782369233; x=1813905233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FBfQ5z8ocvcr92KhtSfiqgzAuZkaUppGNWRywcRPaKI=;
  b=j/waku++pPLUClbrp7C4yJptyAr5NIG5bo6YK2afLxXzfKZiLRTtaOzq
   kDdV2GGWz3oadBltqRqZ1fjIFsKehZLAkbqIXramQ7RlFhRTfKM1wRuqH
   IZp0QM17tE2v4tuPiPf735I035wTh5FJS1PHplYVcHwmm/HusyhDaaGTR
   k6ra1R7s5CMlbE3wfRNFfieNzyf77HjrMSXRC7lHI0UjWXu/Hi5HQEkMR
   fnZK4K6MyTQhLlGu8pAMmdjnvs66PHKDcYqXxUDbngupLV9tVJJzpTMbq
   P4VU1LgNBnzgokbLU9FLw8ZONGooIqOJkJQ/heq3UzD5YnNynv0JZrjeK
   g==;
X-CSE-ConnectionGUID: c6JF4+l8SXWZLVWqnYhm5g==
X-CSE-MsgGUID: FCEusyceRPCh9bnocQnrhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83141348"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="83141348"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 23:33:53 -0700
X-CSE-ConnectionGUID: +diy+BegSCGuh5hOe0bZfQ==
X-CSE-MsgGUID: 874nazgcSQ6Sp/Y1exe5IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="274626595"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 23:33:44 -0700
Date: Thu, 25 Jun 2026 09:33:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank.Li@oss.nxp.com
Cc: Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: Re: [PATCH v2 1/4] device property: Introduce
 fwnode_graph_for_each_endpoint_scoped()
Message-ID: <ajzLxtn_b3MC-NAl@ashevche-desk.local>
References: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
 <20260624-fw_scoped-v2-1-0a8db472af4a@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624-fw_scoped-v2-1-0a8db472af4a@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,oss.qualcomm.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,nxp.com,oss.nxp.com];
	TAGGED_FROM(0.00)[bounces-65613-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:guoniu.zhou@oss.nxp.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08A366C30DD

On Wed, Jun 24, 2026 at 01:00:09PM -0400, Frank.Li@oss.nxp.com wrote:

> Similar to recently propose for_each_child_of_node_scoped() this new
> version of the loop macro instantiates a new local struct fwnode_handle *
> that uses the __free(fwnode_handle) auto cleanup handling so that if a
> reference to a node is held on early exit from the loop the reference will
> be released. If the loop runs to completion, the child pointer will be NULL
> and no action will be taken.
> 
> The reason this is useful is that it removes the need for
> fwnode_handle_put() on early loop exits. If there is a need to retain the
> reference, then return_ptr(child) or no_free_ptr(child) may be used to
> safely disable the auto cleanup.

...

> +#define fwnode_graph_for_each_endpoint_scoped(fwnode, child)			\
> +	for (struct fwnode_handle *child __free(fwnode_handle) =		\
> +		fwnode_graph_get_next_endpoint(fwnode, NULL);		\

Now there is a misindentation of the \, id est an additional tab is missing.

> +	     child; child = fwnode_graph_get_next_endpoint(fwnode, child))

Collect more tags and send a v3 :-)

-- 
With Best Regards,
Andy Shevchenko



