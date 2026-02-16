Return-Path: <linux-media+bounces-52839-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mB6AI2PYkmnKywEAu9opvQ
	(envelope-from <linux-media+bounces-52839-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:42:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5D7141A2B
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 477F1300E3A8
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 08:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C492DCF41;
	Mon, 16 Feb 2026 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bo7/qFA8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AE81A9F88
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771231325; cv=none; b=p5x4VwY4Jtczvz3J89CLXHNcfuoZ6iYOk++ePwX+2Jr3ns8lexZUv+jJMdSdgQWORoXdJihPOjGKPLrsL1lxHNRz373WKvFw4u6ki2AkwMaEHVOgXBdmAaw5xnqZmXQomGjEde9n3/Nwfd6Kz4NqClq6pS4evDjuBPJy5+bnZ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771231325; c=relaxed/simple;
	bh=0FxqRp1F9QbfsplmVUzLRBvi1576SWCo+ZZOlQt8HLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMUamIQWkTM5QgRCPQPM763XirU2XJm2+6gSm0wFibwGMTBLQNIipQtFZSjVHNAN0AJVtE5TXDTXV2Bg+XV/JEFacnqZWyyQDjY758mY9sM48WawLGyTqf7xAuHfb4/jxjZFFsYzb0fFdB9gTs65VvUSgf9eHlGQrzRuE3p0O6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bo7/qFA8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771231323; x=1802767323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0FxqRp1F9QbfsplmVUzLRBvi1576SWCo+ZZOlQt8HLc=;
  b=bo7/qFA8fFTZSELtP2ekTUu0Pnre8AoCV1UeWWbf7O/ei3B4wWYz/Am8
   BoqPKavwGFFRq/d/j/4nd5UluKtn5bFqtgxx1QBE9uUQnrYhN+SduSnoz
   wCAFju98LbXXDbXDy7Bfnz2BC1gGm4zmr0hKsRHsDR/6UjT5ue0n8LBVi
   18ZdJDsEO1hZjjsLS14x29yGmNB/Bp5mhI2hbrSf7apZe+IEywkm6pyET
   +NUXX5NNAaIk5gvrl58M/EifivvEQcAtGyH9crevr7fSvbbzmWDIsNP4h
   u+dy8SqMisi1iTX8ktxOpblrXMI8L1jPjzuAYNDxAMPtJGH91wziAxdha
   w==;
X-CSE-ConnectionGUID: afVOW1+jRMG4r2rMYmY1Gg==
X-CSE-MsgGUID: VccMoL6kSm+K+dQlyMPRhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="82942809"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="82942809"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 00:42:03 -0800
X-CSE-ConnectionGUID: 3dSSXfH9QeC7NASuD9h8Mg==
X-CSE-MsgGUID: PQihlRzESZWer7sK0rpV8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="218511982"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.203])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 00:41:57 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A1D24121D2E;
	Mon, 16 Feb 2026 10:42:17 +0200 (EET)
Date: Mon, 16 Feb 2026 10:42:17 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v2 03/14] media: Documentation: Improve LINK_FREQ
 documentation
Message-ID: <aZLYaU1x_nQj_8X0@kekkonen.localdomain>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-4-sakari.ailus@linux.intel.com>
 <37eb7fd4-4a1d-493b-ae85-ded0bc6650f9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37eb7fd4-4a1d-493b-ae85-ded0bc6650f9@nxp.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52839-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: DD5D7141A2B
X-Rspamd-Action: no action

Hi Mirela,

Thank you for the review.

On Sun, Feb 15, 2026 at 04:37:22PM +0200, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 2/11/26 11:09, Sakari Ailus wrote:
> > Add a reference to the LINK_FREQ control and precise the meaning of the
> 
> Precise is not a verb, maybe use clarify instead.

I'll use that for v3.

> 
> Other than that,
> 
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>

Thanks!

-- 
Kind regards,

Sakari Ailus

