Return-Path: <linux-media+bounces-66197-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HtzPKjL2RGpP4AoAu9opvQ
	(envelope-from <linux-media+bounces-66197-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 13:12:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 222C76EC9B2
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 13:12:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=CAPeMb1h;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66197-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66197-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EDE53056A92
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 11:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52DE3BFE41;
	Wed,  1 Jul 2026 11:12:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C4232470E;
	Wed,  1 Jul 2026 11:12:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904334; cv=none; b=QyAMPs86gK3qZYWEjV2oZ05zYs/uUTilMmrCKrrmXq6j6Hdqy7bcKYi76kS6emV+MIkYL8NpbysO4tLM09gHM+bb6GJKZRlmOiCW8HzeM+Wse9X62xzq98A6o1RFuK3IU9tyNtfg8xQtJAvW1F/+6CIWuybtK5mxbLT21TveMKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904334; c=relaxed/simple;
	bh=2tCAa5egD6m2BQ0H4jq7urovVKQ5/sWa/ZCUDCRIOW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enremP1CNqhpBBvvNyXt51QmAWfTELwCr3qHN5SmIZZ6KEMAaBADEfiVAhN3K8lQ60DNEOXdYgXDMbnImmH5KCzcKU6bDuoqIAhj5b1/d10usjLdydK3l7cF77F73r6rkCHSdDUVsks0F81egA5QHkHO4o+Kzu+uj4r/ibO9MsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CAPeMb1h; arc=none smtp.client-ip=198.175.65.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782904333; x=1814440333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2tCAa5egD6m2BQ0H4jq7urovVKQ5/sWa/ZCUDCRIOW0=;
  b=CAPeMb1hitOD2RCj5nPTZAwrE3FKr2GtP1gf6kBSkWfoiRyHFtEx71wK
   wDSqOrQiM10gz8g8GC847lzxl2Z+Y5aI9U/qdnU/TSiSjb9qoBlxXRpIB
   zUWyy4K3mBaStuVmgyEI2MiMqCjsJuePDoNami/3H4PTmeh6gQATliR4p
   6kI+trSAQ2V6giNSr4IA9n8ae2+UadhPzjeorVB7DMJsvRqsugp4NpcYi
   ZSc/ZuHzZE+64fP8d2MkNNR7Cw0+Qb3bYqATy3U+8FTQYmT+bCKm2Tjza
   hsjJkTqRsSIOS4fJGF/kr5VvK1Ht8FHgDEZvWn1KNKdoFVwBG44qdCj8J
   A==;
X-CSE-ConnectionGUID: orOa2vviQCGGfF3BuUxr0Q==
X-CSE-MsgGUID: fcLHt2KBRJSuX4+e3zUUzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83721272"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="83721272"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:12:12 -0700
X-CSE-ConnectionGUID: HclpZFOuQk+O8i5FfAH5GA==
X-CSE-MsgGUID: 2vsG1rcEQuGncX4nmPTU2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="257441229"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.62])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:12:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 784DB121796;
	Wed, 01 Jul 2026 14:12:09 +0300 (EEST)
Date: Wed, 1 Jul 2026 14:12:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Kate Hsuan <hpa@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Serin Yeh <serin.yeh@intel.com>,
	Damjan Georgievski <gdamjan@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	computman <anis@talbi.fr>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
Message-ID: <akT2CSCbaR0a3BMA@kekkonen.localdomain>
References: <20260629074026.35490-1-hpa@redhat.com>
 <20260629074026.35490-4-hpa@redhat.com>
 <PN3P287MB18292C819793395D643D426A8BF72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <49257d09-a2fd-4a9d-9479-4d2b5e0fb8a6@kernel.org>
 <PN3P287MB182945B5747452110940BEA08BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <c7634571-4682-41d5-aa9d-8b965d641d51@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7634571-4682-41d5-aa9d-8b965d641d51@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66197-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:tarang.raval@siliconsignals.io,m:hpa@redhat.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:kieran.bingham@ideasonboard.com,m:anis@talbi.fr,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dan.scally@ideasonboard.com,m:ilpo.jarvinen@linux.intel.com,m:platform-driver-x86@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,redhat.com,kernel.org,intel.com,gmail.com,ideasonboard.com,talbi.fr,vger.kernel.org,linux.intel.com];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:from_mime,siliconsignals.io:email,intel.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 222C76EC9B2

Hi Hans,

On Wed, Jul 01, 2026 at 01:01:58PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 1-Jul-26 08:19, Tarang Raval wrote:
> > Hi Hans,                                                                       
> >                                                                                
> >> On 30-Jun-26 09:32, Tarang Raval wrote:                                      
> >>> Hi Kate,                                                                   
> >>>                                                                            
> >>>> Update the con_id for the Sony IMX471 sensor to "vana" to serve as the    
> >>>> power enable. Additionally, the HID values SONY471A and TBE20A0, both     
> >>>> associated with the IMX471 image sensor, have been identified on Lenovo   
> >>>> laptops.                                                                  
> >>>>                                                                           
> >>>> Signed-off-by: Kate Hsuan <hpa@redhat.com>                                
> >>>                                                                            
> >>> Thanks, looks good.                                                        
> >>>                                                                            
> >>> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>                 
> >>                                                                              
> >> Hmm, the imx471 driver is still pending upstream:                            
> >>                                                                              
> >> https://lore.kernel.org/linux-media/20260629074026.35490-5-hpa@redhat.com/   
> >>                                                                              
> >> As part of this series.                                                      
> >>                                                                              
> >> Please just use the standardized "avdd" in that driver instead               
> >> of "vana" (which also seems to refer to the analog supply vdd,               
> >> which is what avdd stands for).                                              
> >>                                                                              
> >> Then this whole patch is unnecessary and can be dropped from                 
> >> this series.                                                                 
> >                                                                                
> > The regulator name "vana" comes directly from the Sony IMX471 sensor           
> > datasheet, which typically refers to the analog supply voltage. Using the      
> > datasheet name helps keep the driver consistent with the hardware              
> > documentation and makes it easier to cross-reference.                          
> >                                                                                
> > as per my understanding, the more standardized way is to use the regulator     
> > name as per the sensor datasheet. Therefore, I respectfully disagree with 
> > your suggestion.                                                           
> 
> As shown by the need for this patch on x86 at least because there
> is no devicetree it greatly helps if all Linux sensor drivers use
> standardized names for their regulators rather then using the exact name
> from the datasheet which often is not very consistent.
> 
> And "avdd" is the name we've standardized on for this, so lets use that:
> 
> hans@shalem:~/projects/linux$ grep -l '"vana"' drivers/media/i2c/*.c | wc -l
> 4
> hans@shalem:~/projects/linux$ grep -l '"avdd"' drivers/media/i2c/*.c | wc -l
> 36
> 
> The alternative is needing to add more and more quirks as different
> sensors are used, which is not great.

I do agree that having a constant name for the regulators would be
beneficial for the int3472 driver. Still, if, and presumably, when that
sensor gets DT support, the bindings will use the regulator name from the
datasheet.

Let's just use the datasheet name now and add the few lines needed to the
int3472 driver and avoid the churn in the future. There's a limited number
of sensor drivers that need this after all.

I'd be more concerned of what's going on in tps68470_board_data.c for
instance.

-- 
Kind regards,

Sakari Ailus

