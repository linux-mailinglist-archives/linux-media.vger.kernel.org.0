Return-Path: <linux-media+bounces-65616-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kJGzF9rXPGrDtAgAu9opvQ
	(envelope-from <linux-media+bounces-65616-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 09:25:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C05856C3566
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 09:25:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=QRAYCWCl;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65616-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65616-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A4613048F38
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 07:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5002B3C37B4;
	Thu, 25 Jun 2026 07:24:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600D41D47AC;
	Thu, 25 Jun 2026 07:24:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782372293; cv=none; b=q6aI9pZ1O/uVGgd5h0AAEcEROTwna+xgB7MUaH8pFKLicxwDk+HEXjROClTeupmM6by7EC2vnp1sJWZ5884XBw+tiuKya7kDM4CMcyobaZytRk/tgxYi+FK1jBnhV+KpcrtcJJ+7bPiJN/p5m1yT+slhAQakvIoPO10AgJrZHeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782372293; c=relaxed/simple;
	bh=h5ocJXXKpSTKpkJaGKhd2kaVYd35m9dsl6aoMK/+5oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fm08fW6aGgvSMSt2NRwGDWtsubFguFdFTeLV90g1tSBUp2y9RT63urwolbKDEp0ApBZpqWBn802biaZlRSuhxXlBY6Ofdx6qUGchtig58n64LPYy4zCS4o51ZJydpDBbpnt1sce2CNiCQm0JSxZp5jcyAvMQ3MHFQwYAsy/t2zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRAYCWCl; arc=none smtp.client-ip=198.175.65.15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782372292; x=1813908292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h5ocJXXKpSTKpkJaGKhd2kaVYd35m9dsl6aoMK/+5oE=;
  b=QRAYCWClaWWmT0g9P6TAypLOZzFvncy+BvIxOEuk4bA1YVqYg2zUtDjp
   P3PXeyxa75KOYgv/JLtcqwTC5neQRaChaUb00Rg7iBtYKNSpcvHOsnRoe
   W5FLzzZto9+oAIjEGA6wAI+ZDQbSIEr5X70rT2zeuk9eyO2lM9qx1nfY7
   NpjeJR02FnBPdl4jdCOXuaoZSMci7tR9QD6jPYHKnyPiO6B0SQH60DmPi
   54zA9oPjije7/D4OIwq192xv66TpLK49dbV+J1OrKa+YjYlHTEU68+Woe
   b8G7HJxAx7DLo+6EsVm6D9Jzsfxt8b2KRerf28+OvfNdb1UXlGw5U+8f+
   A==;
X-CSE-ConnectionGUID: JbjVYcP6Shira+X+2NS8mQ==
X-CSE-MsgGUID: YELqYfYDRNSVZfFKvd51fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="86822199"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="86822199"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 00:24:39 -0700
X-CSE-ConnectionGUID: hcztOcZrRiS2v4zjDIGV1g==
X-CSE-MsgGUID: OEXbgkZkRPSxlt5KzXGeSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="244045858"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 00:24:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F407111FAA5;
	Thu, 25 Jun 2026 10:24:33 +0300 (EEST)
Date: Thu, 25 Jun 2026 10:24:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
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
Subject: Re: [PATCH v2 0/4] media: add and use
 fwnode_graph_for_each_endpoint_scoped()
Message-ID: <ajzXsacric_2fvGh@kekkonen.localdomain>
References: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
 <20260624191935.GG851255@killaraus.ideasonboard.com>
 <ajwxcn2LXS8InAjZ@SMW015318>
 <20260624200237.GJ851255@killaraus.ideasonboard.com>
 <ajxCOE3avXXLlrfT@SMW015318>
 <20260624222042.GN851255@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624222042.GN851255@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.nxp.com,linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,sntech.de,linaro.org,oss.qualcomm.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,nxp.com];
	TAGGED_FROM(0.00)[bounces-65616-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:Frank.li@oss.nxp.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,m:guoniu.zhou@oss.nxp.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C05856C3566

Hi Laurent,

On Thu, Jun 25, 2026 at 01:20:42AM +0300, Laurent Pinchart wrote:
> On Wed, Jun 24, 2026 at 03:46:48PM -0500, Frank Li wrote:
> > On Wed, Jun 24, 2026 at 11:02:37PM +0300, Laurent Pinchart wrote:
> > > On Wed, Jun 24, 2026 at 02:35:14PM -0500, Frank Li wrote:
> > > > On Wed, Jun 24, 2026 at 10:19:35PM +0300, Laurent Pinchart wrote:
> > > > > On Wed, Jun 24, 2026 at 01:00:08PM -0400, Frank.Li@oss.nxp.com wrote:
> > > > > > Add new helper macro fwnode_graph_for_each_endpoint_scoped() and use it
> > > > > > simplify media code.
> > > > > >
> > > > > > Typical example should qualcomm's driver (camss.c), the v4l2_mc.c and
> > > > > > rkisp1-dev.c only silience improvement.
> > > > > >
> > > > > > Anyways, *_for_each_*_scoped() already use widely and make code clean.
> > > > > >
> > > > > > Build test only.
> > > > > >
> > > > > > Sakari Ailus:
> > > > > > 	when I try to improve the patch
> > > > > > "Add common helper library for 1-to-1 subdev registration", I found need
> > > > > > camss.c pattern, so I create this small improvement firstly.
> > > > >
> > > > > Those are nice cleanups, thank you.
> > > > >
> > > > > After applying this series, the only left users of the
> > > > > fwnode_graph_for_each_endpoint() macro are in drivers/base/property.c.
> > > >
> > > > I already checked previously, two place use it.
> > > >
> > > > fwnode_graph_get_endpoint_count(), it will go though all endpoints, last
> > > > ep is NULL, which totally equial to scoped() version.
> > > >
> > > > another one fwnode_graph_get_endpoint_by_id(), which return ep, expect
> > > > caller to call put().
> > > >
> > > > if use scoped() version, need use no_free_ptr() at return, which make think
> > > > a little bit complex.
> > >
> > > It would introduce a tiny bit of extra complexity there, but the
> > > advantage (in my opinion) is that we'll be able to remove the less safe
> > > fwnode_graph_for_each_endpoint() macro.
> > >
> > > Now one may argue that the risk of
> > > fwnode_graph_for_each_endpoint_scoped() is returning the iterator
> > > without using no_free_ptr(). I wonder if that would be easier to catch
> > > in static analysis tools than the current pattern that leaks a reference
> > > when exiting the loop early.
> > 
> > It's not big deal, if everyone prefer drop fwnode_graph_for_each_endpoint(),
> > I can do it.
> 
> Let's see what others think. If people prefer keeping both versions,
> I'll be OK with that.

I'd prefer to keep both: it depends on the use case which one is better. 

-- 
Kind regards,

Sakari Ailus

