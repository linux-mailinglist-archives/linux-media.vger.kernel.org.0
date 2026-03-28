Return-Path: <linux-media+bounces-57441-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IjPJXHdx2lKdwUAu9opvQ
	(envelope-from <linux-media+bounces-57441-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 14:53:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A6A34E96E
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 14:53:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E006B3018BD7
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 13:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A0D391515;
	Sat, 28 Mar 2026 13:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXCOmf9V"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF01B26ED33;
	Sat, 28 Mar 2026 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774706007; cv=none; b=IKYiywad0hV9QSEcvzx8HwAM2yvYY8sJHLzI9VmkVroJeNAZ8XgNeUn8EK27FArNxYFQ2cY8HxMwmBsef/GngvjspCK8jLdxZabRz1YDQKWwqYs7hyfJEL6RftuDl6+BiXuvSySsFtxyLO6l7gmCbCkqjMdrUtDB7JQ1MLR7xKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774706007; c=relaxed/simple;
	bh=G/09hTinm8kWqgpJvEJp97Hm8K/quuFhiNsAyvPUTN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asEk3XTe8KKc98zrYtW8sZdBc9Dth/PQAuqtg/ddCADoCF4ktGUhq2PRUPg/CViULWUh0pT5CEmJaUwSXEwirRJ6kUrldAuX83CjVmpVUU3Pw3ecrVQd+T5J2uQ+h5aKrnPDKFxuysz+qq9U6j2eSsQ1TpkYsR/+0BofcfyFzDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UXCOmf9V; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774706005; x=1806242005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=G/09hTinm8kWqgpJvEJp97Hm8K/quuFhiNsAyvPUTN0=;
  b=UXCOmf9V/V9GNiials2Z41+mQA3zY7EjolsS6K1GXJNZPXTIENanu441
   n2QvpAybbzY65JsZNWZYouhNkx6omYsUFRwRp1a1/Jv39dlaMqHIlHRIe
   SyqBlC5mLdr+dsYTIyQRkwyZ5r40tORZiOEB/yKYlwlgxj6W9ZWaqHWH+
   4t/EKIL30Iwb0bBE+QpMzzY52tQShW+tZjoyMGLvd1b8UP3YZFcS414OW
   AnEs/pu5Q8tvdEzxkzAaNZwMgN6LXD+5NemduAUUU7CaGvxA96iZPS+5/
   3AnM3CNt5RJSMARaLwdB6eoq5N0z5443B0XKGlRp6ZhuNfRB5cWGmdbn/
   g==;
X-CSE-ConnectionGUID: njLT2wcIQMaCMPkfx8/Qjw==
X-CSE-MsgGUID: zlMMqv7BR5+zkheRbo52SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="98373443"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="98373443"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 06:53:25 -0700
X-CSE-ConnectionGUID: Oy0K7YAzRiSrp5gncHUXxw==
X-CSE-MsgGUID: Z3ERc57LSaWgFNr0Astc5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="225474896"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.251])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 06:53:23 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 489E2121D3E;
	Sat, 28 Mar 2026 15:53:27 +0200 (EET)
Date: Sat, 28 Mar 2026 15:53:27 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: imx415: Drop redundant runtime PM callbacks
Message-ID: <acfdV6sRfP9HGIxV@kekkonen.localdomain>
References: <20260324124524.135278-1-elgin.perumbilly@siliconsignals.io>
 <1378ed13-6744-422a-b0b8-02621117238f@collabora.com>
 <acPU3H9pYEwzuuOS@kekkonen.localdomain>
 <3875be43-63b9-4e49-a0d8-175dd9268788@collabora.com>
 <MA0P287MB21780F5BC2F8113A10B6F0718854A@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MA0P287MB21780F5BC2F8113A10B6F0718854A@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57441-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: D4A6A34E96E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Elgin,

On Sat, Mar 28, 2026 at 06:11:43AM +0000, Elgin Perumbilly wrote:
> Hi Michael, Sakari,                                                             
> Sorry for the late reply, and thanks for the feedback.                          
>                                                                                 
> >Hi Elgin, Sakari,                                                              
> >                                                                               
> >On 3/25/26 13:28, Sakari Ailus wrote:                                          
> >> Hi Michael,                                                                  
> >>                                                                              
> >> On Tue, Mar 24, 2026 at 08:42:31PM +0100, Michael Riesch wrote:              
> >>> Hi Elgin,                                                                   
> >>>                                                                             
> >>> Thanks for the patch but...                                                 
> >>>                                                                             
> >>> On 3/24/26 13:45, Elgin Perumbilly wrote:                                   
> >>>> Replace runtime_suspend/resume wrappers by using power helpers             
> >>>> directly with DEFINE_RUNTIME_DEV_PM_OPS().                                 
> >>>                                                                             
> >>> ...why? What advantage does this refactoring bring?                         
> >>                                                                              
> >> It looks like patch removes two redundant functions, doesn't it? :-)         
> >                                                                               
> >Well yes. 10 lines saved. Not sure whether this was the biggest issue          
> >with this driver -- surely it was not a big issue for me.                      
> >                                                                               
> >Elgin, I was wondering whether this change is within a certain context         
> >or whether there is something I fail to recognize.                             
> >                                                                               
> >Anyway, if you absolutely want this change: I feel it would be nicer if        
> >you left the imx415_runtime_{resume,suspend} and moved the bit of code         
> >from imx415_power_{on,off} to them. Reasons for that may be mostly             
> >aesthetical -- I claim better readability that way.                            
>                                                                                 
> The intent of this change is to remove redundant runtime PM                     
> wrappers and simplify the code, without altering behavior.                      
>                                                                                 
> If you’re okay with this approach, we can proceed as is. If you                 
> feel it’s not necessary at this point, that’s fine as well.                     

Can you address Michael's comments?

Code tends to be copied to other drivers so cleaning up existing drivers is
worthwhile.

-- 
Regards,

Sakari Ailus

