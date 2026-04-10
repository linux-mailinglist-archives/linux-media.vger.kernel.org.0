Return-Path: <linux-media+bounces-58496-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGHgM9q62GmmhQgAu9opvQ
	(envelope-from <linux-media+bounces-58496-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:54:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B733D45BF
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69EC73013730
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B913AB290;
	Fri, 10 Apr 2026 08:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awvlqaSy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35089305E19
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 08:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811267; cv=none; b=EhuBeYmwIZOXlSdcPrHzS22vgrSt0u/rl9m0dLEta8jwxaXclQTnVy132HqMhCwlK36uobloEyzNKKHl1YZFKt4N0Bz7SnwK74jb59MdM0+3kuyMe17ZoA1UUbnNL+RvF1dYJb/aXD4scO0SiSFiD2om7o7/bEhkVxm3YUHHTP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811267; c=relaxed/simple;
	bh=LrcM1kWeSNOUi5HR84SYMEWAOfm/P63tiiupGcbNwsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7aOqGzb8A7KFHbRHHGQgcQk0QI5ZxW4tmwKyiNYckZ1wOxe3SDEbh1p65tlS4S8Kv57/FLEuHcb1uGjW7wlTr6uy3SdmaH7glFmQ92qOzGHialUKiyrGyPAbgpfy3BdSzHIVddmipdDjeIrVt+M+Wpg8pClGFH+adIu749k84U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awvlqaSy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775811266; x=1807347266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LrcM1kWeSNOUi5HR84SYMEWAOfm/P63tiiupGcbNwsc=;
  b=awvlqaSy8Bypy2STmY3PMt9WLxHUss2THtqmwe4KLdQA60YkPuZKAB1l
   NpGxko7N6BiSRX3y8fHHHs+DaomytCz77pscCOevOUma2rPyhFJGfufPZ
   1KxnDIzKULNRwJI2tPkxRAOhvyQzEPsBKnTHWmW36o1YTbuubb0i2/IDa
   bGKQfCLvHRPLQ213rq+ZY7fQDcDSW1CVkPeQ60I7HCbS5PNqWMyCz/sSN
   9pAnij4CJy6fRNbKSv5TsA64HFpvFj1A+SXH56Erkyt9JUCsDZTGkp+gM
   mSdwTAju7QjYHt/5TXtSCRhlT6g6+bqR0+3KSMJKU3Vc2iutdpA38IH/G
   w==;
X-CSE-ConnectionGUID: 905KejQ+RFaXTQNF+AM2eg==
X-CSE-MsgGUID: yhEiVurrQ1env/D69TwA7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="77014553"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="77014553"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 01:54:26 -0700
X-CSE-ConnectionGUID: 7jwLxc/rR6aBTKW1gmVMsw==
X-CSE-MsgGUID: CZQf8q4STRWVykjDqj/jZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="224731006"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 01:54:19 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C2C95120F00;
	Fri, 10 Apr 2026 11:54:34 +0300 (EEST)
Date: Fri, 10 Apr 2026 11:54:34 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
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
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 08/29] media: imx274: Remove redundant kernel-doc
 comments
Message-ID: <adi6yoeos-ClRh6V@kekkonen.localdomain>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-9-sakari.ailus@linux.intel.com>
 <adi5CH2yE4CLikVv@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adi5CH2yE4CLikVv@zed>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	TAGGED_FROM(0.00)[bounces-58496-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,kekkonen.localdomain:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 68B733D45BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

Thank you for the review.

On Fri, Apr 10, 2026 at 10:48:24AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Wed, Apr 08, 2026 at 06:39:17PM +0300, Sakari Ailus wrote:
> > Remove kernel-doc comments from  regular callback functions. These
> > comments have no information value.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> This might be easy, but how is this related to metadata ?
> This is a 29 patch series that prepares for an 89 patch series.

Not directly, but not doing this now will require documenting the new
arguments soon or we'd start getting warnings from the build. Writing
documentation that shouldn't exist would be entirely non-productive work.

> 
> review time is not free, piling stuff over stuff is a recipe for
> making sure we'll never merge this.
> 
> Anyway
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thank you.

-- 
Sakari Ailus

