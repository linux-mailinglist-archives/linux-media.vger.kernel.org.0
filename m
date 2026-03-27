Return-Path: <linux-media+bounces-57383-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIYRFUsHx2kyRwUAu9opvQ
	(envelope-from <linux-media+bounces-57383-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:40:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD01634C061
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3115A301E22B
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 22:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71856393DD4;
	Fri, 27 Mar 2026 22:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYTuQgOU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AACF3815E6
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 22:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774651114; cv=none; b=EWxTaqLKVPSzYNRPD8bOKwVsBvEBvxO3AcdoUPSfMIT4ySw+aIh2dpm6oDCUh8QGNedBZSxjZiTJuOFR1W2LKucrM1x3/nzu8czUXrrWC8CbPjm54uaUNrxM0IKry79Bt9AwwnTnz7Kf9Jl7GUzvgE2sZrgzTh7jJAA+3XKy5YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774651114; c=relaxed/simple;
	bh=/ixvTVs/e11w5hq+MGQbPiw4IueH90FJUHgGlOlPZJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jir1E7FFqLnKElaw4Hdh/sk7kDZIFCKpoP/+5+hhMx+rE+T1ADBBuRoYs+K9iThVBAOFEu9Jzwe1Lcxno2UkAYV71ZDLRvXS9Wakyc5Z1Yt/Pr2NXZ7DWgk/yK9RsGL95KaI82J96GKmNj/Jcbwcelu26s7Dy8lzNoxuvatsZ5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AYTuQgOU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774651114; x=1806187114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/ixvTVs/e11w5hq+MGQbPiw4IueH90FJUHgGlOlPZJ0=;
  b=AYTuQgOUUIJtDDb/YJm8U3gtyEn2nx7/vAoZuKbLFbUuulPA83mAx9Pp
   9c2hcJNPCu/Ywyj5bdGwZxAELEinReTbhOhP9SwnYNd8yzCtSyH9gQotI
   08fRXJyGU8r29OmvC3SZMweNkpncqE8GLGwqQkj7ReclZ0lHs0U1rTjiH
   acPGgG9zcvP5W/ouOINDP+XwqMGW/d6fcO/4CJ1xaJIgvlHr5GnvYfqpK
   E1ZDG3l51H8KOG8W1/+IdoNlVKCxTQHwuijbqYPhEm967LG5/WD1vSG/K
   cnIJjoxnDDRwsmbC0RkFYMJEoPUQqTWWi2yVblppkVL2f6uRrRhw1CJlE
   w==;
X-CSE-ConnectionGUID: QSWP96q5RkK1o2MRzeYm5w==
X-CSE-MsgGUID: AhFeqsMtRheZAT5YXoRECA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="79593388"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="79593388"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 15:38:33 -0700
X-CSE-ConnectionGUID: p88FE10JQjuG1/X86KMjBA==
X-CSE-MsgGUID: P8bu9lvsSmKA8v/PfMcpfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="255948901"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.225])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 15:38:26 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 20421121D24;
	Sat, 28 Mar 2026 00:38:30 +0200 (EET)
Date: Sat, 28 Mar 2026 00:38:30 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 22/64] media: Documentation: v4l: Document internal
 sink pads
Message-ID: <accG5jnojppW3TFC@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-23-sakari.ailus@linux.intel.com>
 <xsl4dccmd3ulakeys6sg37mcj6hjor3hzavuitjfvxf6we2drs@qdpvyf5rrmxo>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xsl4dccmd3ulakeys6sg37mcj6hjor3hzavuitjfvxf6we2drs@qdpvyf5rrmxo>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-57383-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: AD01634C061
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

On Fri, Jun 20, 2025 at 02:43:42PM +0200, Jacopo Mondi wrote:
> > +    * - 0/0
> > +      - **3296**
> > +      - **2480**
> > +      - **MEDIA_BUS_FMT_RAW_10**
> 
> In my understanding fields in bolds are set explicitly. Howver formats
> are propagated from sinks to source, and pad 0/0 is a source. Is this
> correct ?

Adding to my previous comment -- the bit depth selection takes place here.
I'll document this better. So for the mbus code this should stay.

-- 
Sakari Ailus

