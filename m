Return-Path: <linux-media+bounces-60479-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG6RM6RS+mkJMgMAu9opvQ
	(envelope-from <linux-media+bounces-60479-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 22:27:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 354334D3A63
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 22:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 744373097331
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 20:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560583CC9F3;
	Tue,  5 May 2026 20:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D7d2gnWG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B96D3009D4;
	Tue,  5 May 2026 20:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778012676; cv=none; b=EQC72+3tRK6j5Gpl2fU/L10Q32NjEQjFvfkM956sXa9cge7hrkRN5AVGcDh4MT7/LexOzZrIMhgyXK801XTgBy49O8QlZhvYKvbKbUDVEfr9+l6BNmzzJVpeTluoDFNWIMsnpyYcgaGARgpPfGd6d5itT7jKapoBlwYSpFdExbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778012676; c=relaxed/simple;
	bh=ZzegL40rK3i06/+AwUHwCmciL8JKX0ntLCm7lSA+SCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbPZyf1kmtp/MKmoUCtA3/f6lw9Ajgl6L3rCq9kCeepGhVMX2mM0lmnLyJqEIurEeEGbc1Q3D+vqWYP6YcQORqOJjevnjwX3oSqQSC9UCLK4BO69qXHSpivDGiJ1Pv8/KAjaZ/ooGSzBvTPsium5sh/DeOjRPiYfCPiut2vPd1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D7d2gnWG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76935BE;
	Tue,  5 May 2026 22:24:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778012670;
	bh=ZzegL40rK3i06/+AwUHwCmciL8JKX0ntLCm7lSA+SCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D7d2gnWGDPs5J3lFS0/RgBtyd+WjoV9Yu+k4mbvWPdUvIFQPkfc2H5WaAxpR0pZUX
	 g9+1KCXOuV6FNgb5rLcg88nw+ZEQSShZg2rY8I8X7Emg70T6tuLYDTmKU85ubBzn0E
	 tFPxR4C5LSdb/7/wgRVyYompYOsAkFje+eyR72f8=
Date: Tue, 5 May 2026 23:24:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] media: i2c: add os02g10 image sensor driver
Message-ID: <20260505202431.GA1598374@killaraus.ideasonboard.com>
References: <20260414084952.217215-1-elgin.perumbilly@siliconsignals.io>
 <20260414084952.217215-3-elgin.perumbilly@siliconsignals.io>
 <20260414092758.GE4061@killaraus.ideasonboard.com>
 <MA0P287MB2178FAA81D07B561FA68014988252@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
 <20260414095727.GF4061@killaraus.ideasonboard.com>
 <PN3P287MB1829155B216E557C7DF7B6778B252@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <20260414103315.GA1023076@killaraus.ideasonboard.com>
 <MA0P287MB217836B81A73F23289CCF190883E2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MA0P287MB217836B81A73F23289CCF190883E2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
X-Rspamd-Queue-Id: 354334D3A63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60479-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	BLOCKLISTDE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:server fail,100.90.174.1:server fail,2001:14ba:703d:e500::2a1:server fail,213.167.242.64:server fail];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,siliconsignals.io:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]

On Tue, May 05, 2026 at 02:42:21PM +0000, Elgin Perumbilly wrote:
> > On Tue, Apr 14, 2026 at 10:19:23AM +0000, Tarang Raval wrote:                  
> >> > On Tue, Apr 14, 2026 at 09:43:32AM +0000, Elgin Perumbilly wrote:          
> >> > > > On Tue, Apr 14, 2026 at 02:19:45PM +0530, Elgin Perumbilly wrote:      
> >> > > > > Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.       
> >> > > > >                                                                      
> >> > > > > The Omnivision os02g10 is a CMOS image sensor with an active array size of
> >> > > > > 1920 x 1080.                                                         
> >> > > > >                                                                      
> >> > > > > The following features are supported:                                
> >> > > > > - Manual exposure an gain control support                            
> >> > > > > - vblank/hblank control support                                      
> >> > > > > - vflip/hflip control support                                        
> >> > > > > - Test pattern control support                                       
> >> > > > > - Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)                
> >> > > > >                                                                      
> >> > > > > Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io> 
> >> > > > > Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>           
> >> > > > > ---                                                                  
> >> > > > >  MAINTAINERS                 |    1 +                                
> >> > > > >  drivers/media/i2c/Kconfig   |   10 +                                
> >> > > > >  drivers/media/i2c/Makefile  |    1 +                                
> >> > > > >  drivers/media/i2c/os02g10.c | 1039 +++++++++++++++++++++++++++++++++++
> >> > > > >  4 files changed, 1051 insertions(+)                                 
> >> > > > >  create mode 100644 drivers/media/i2c/os02g10.c                      
> >> > >                                                                          
> >> > > I have added a new function, os02g10_set_framefmt, which dynamically sets
> >> > > the mode register.                                                       
> >> > >                                                                          
> >> > > Please let me know if I have missed anything or if further changes are   
> >> > > needed.                                                                  
> >> >                                                                            
> >> > You also need to drop the supported_modes array, and implement support     
> >> > for .set_selection().                                                      
> >>                                                                              
> >> Are you suggesting that we should drop the array below?                      
> >                                                                               
> > Correct.                                                                       
> >                                                                               
> >> static const struct os02g10_mode supported_modes[] = {                       
> >>     {                                                                        
> >>         .width = 1920,                                                       
> >>         .height = 1080,                                                      
> >>         .vts_def = 1246,                                                     
> >>         .hts_def = 1082,                                                     
> >>         .exp_def = 1100,                                                     
> >>         .x_start = 2,                                                        
> >>         .y_start = 6,                                                        
> >>     },                                                                       
> >> };                                                                           
> >>                                                                              
> >> If we remove this, how would we provide mode-specific parameters such as VTS?
> >                                                                               
> > Those should be computed by the driver based on the format and crop            
> > rectangle configured by userspace.                                             
>                                                                                 
> Could you please take a look at the latest v3 patch?   

I'm short on time at the moment, but v3 is still in my inbox, I haven't
dropped it.

-- 
Regards,

Laurent Pinchart

