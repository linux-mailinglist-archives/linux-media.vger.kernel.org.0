Return-Path: <linux-media+bounces-56082-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oETCNYxWuWnYAgIAu9opvQ
	(envelope-from <linux-media+bounces-56082-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:26:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DAD2AAD5A
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 14:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E90EC30629B6
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C7C3CB2DB;
	Tue, 17 Mar 2026 13:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPzpaI6n"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB64345CC0
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753446; cv=none; b=KN9XjN651ltPlOksWgE7YKq4Nw6oC/iV2Z81d3QU7mz0fyiVY8Xt+DypVau+Y98oWqmhdTQa0XUqk+nQzDSWTLKcjtmhBbJEteWpMrgVWZm+75k7eRQkoYzOhNx8ti0FrI1Tk1HjA5otrndFJCIIh4RODwj3Uz0q2wWXu9Ut1H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753446; c=relaxed/simple;
	bh=pxw/8vzXDlja8NKVCj0PeHp3suwATH7cyJv6QoYwyE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMUA9UTtdjDGymZ8YARJGSZehhYz1CIXUyXYD7lesDn4VpgxJALUr5uDlGw/AbYkedj576EWcZS4wDMi9IpqhS+fG60lL/ci1qKOJpgfsvyjJqLg8j5NY7BbajbDyK+QrnebPdCp+6nwx5bEn4gtBAIgFMwQaoMbXipP98I5ytY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPzpaI6n; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773753445; x=1805289445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pxw/8vzXDlja8NKVCj0PeHp3suwATH7cyJv6QoYwyE0=;
  b=IPzpaI6ngJZbDpmX0fdHkzw1ll8KcakD6mawth8+RrSwP34EuRjCeb6j
   OI4nFK9U0EMNjX2uvkLH9g+SYxOTkDEeBs/aoL8ZRAtznkqs1ik4eve6o
   ZehX71ns5wdU71aqCN8S/oyaLRyn6NKw+psATO/1hAhUyIVPISHx8xjJc
   +2GCJamNxM5mEzpjy6oA0qVo8pvUnGhLl3Vx29xtmI1zOdhj8eIp7Ee/x
   ifLbuz3quxWAFt/EVq8tuynO8UiRkGzlOSjtItwOii30g3wFI2TyQWx4L
   aNgTTv1oFKSnYHzOQVKCrdd13ELnTwcrgiolv0wkNDc/BOz7iRABzTE7r
   Q==;
X-CSE-ConnectionGUID: gXtG9jx9Qce5Stfb2lPfLQ==
X-CSE-MsgGUID: 90pmyCs7SGClj0yFnxqYYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="86138456"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="86138456"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:17:23 -0700
X-CSE-ConnectionGUID: FOBleKBcTgi/jpglyYUCIQ==
X-CSE-MsgGUID: vtStlLNvS2yCXh5X6fFwpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="216615981"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:17:19 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CF1BC11F870;
	Tue, 17 Mar 2026 15:17:17 +0200 (EET)
Date: Tue, 17 Mar 2026 15:17:17 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v4 04/11] Support long options and improve
 help text
Message-ID: <ablUXSBkaHiegtjF@kekkonen.localdomain>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
 <20260310084615.1183141-5-sakari.ailus@linux.intel.com>
 <20260316144151.GF31604@killaraus.ideasonboard.com>
 <abkjmuuQvBG12qBJ@kekkonen.localdomain>
 <20260317104954.GA302774@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317104954.GA302774@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56082-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: E6DAD2AAD5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

On Tue, Mar 17, 2026 at 12:49:54PM +0200, Laurent Pinchart wrote:
> On Tue, Mar 17, 2026 at 11:49:14AM +0200, Sakari Ailus wrote:
> > Moi,
> > 
> > On Mon, Mar 16, 2026 at 04:41:51PM +0200, Laurent Pinchart wrote:
> > > On Tue, Mar 10, 2026 at 10:46:10AM +0200, Sakari Ailus wrote:
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  raw2rgbpnm.c | 34 +++++++++++++++++++++++++---------
> > > >  1 file changed, 25 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> > > > index 14cfa7e7a46c..16ef64e984b9 100644
> > > > --- a/raw2rgbpnm.c
> > > > +++ b/raw2rgbpnm.c
> > > > @@ -24,6 +24,7 @@
> > > >   */
> > > >  
> > > >  #include <ctype.h>
> > > > +#include <getopt.h>
> > > >  #include <stdio.h>
> > > >  #include <stdint.h>
> > > >  #include <stdlib.h>
> > > > @@ -836,6 +837,17 @@ static int parse_format(const char *p, int *w, int *h)
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +static struct option options[] = {
> > > > +	{ "algo", required_argument, NULL, 'a', },
> > > > +	{ "brightness", required_argument, NULL, 'b', },
> > > > +	{ "format", required_argument, NULL, 'f', },
> > > > +	{ "help", no_argument, NULL, 'h', },
> > > > +	{ "high-bits", no_argument, NULL, 'g', },
> > > > +	{ "size", required_argument, NULL, 's', },
> > > > +	{ "swap-rb", no_argument, NULL, 'w', },
> > > > +	{ 0 },
> > > > +};
> > > > +
> > > >  int main(int argc, char *argv[])
> > > >  {
> > > >  	FILE *f;
> > > > @@ -849,7 +861,7 @@ int main(int argc, char *argv[])
> > > >  	int width = -1;
> > > >  
> > > >  	for (;;) {
> > > > -		int c = getopt(argc, argv, "a:b:f:ghs:w");
> > > > +		int c = getopt_long(argc, argv, "a:b:f:ghs:w", options, NULL);
> > > >  		if (c==-1) break;
> > > >  		switch (c) {
> > > >  		case 'a':
> > > > @@ -889,14 +901,18 @@ int main(int argc, char *argv[])
> > > >  			break;
> > > >  		case 'h':
> > > >  			printf("%s - Convert headerless raw image to RGB file (PNM)\n"
> > > > -			       "Usage: %s [-h] [-w] [-s XxY] <inputfile> <outputfile>\n"
> > > > -			       "-a <algo>     Select algorithm, use \"-a ?\" for a list\n"
> > > > -			       "-b <bright>   Set brightness (multiplier) to output image (float, default 1.0)\n"
> > > > -			       "-f <format>   Specify input file format format (-f ? for list, default UYVY)\n"
> > > > -			       "-g            Use high bits for Bayer RAW 10 data\n"
> > > > -			       "-h            Show this help\n"
> > > > -			       "-s <XxY>      Specify image size\n"
> > > > -			       "-w            Swap R and B channels\n", progname, argv[0]);
> > > > +			       "Usage: %s [--algo|-a <algo>] [--brightness|-b <brightness>]\n"
> > > > +			       "       [--format|-f <format>] [--help|-h] [--high-bits|-g] [--size|-s XxY]\n"
> > > > +			       "       [--swap-rb|-w] <inputfile> <outputfile>\n\n"
> > > 
> > > That won't scale nicely, but I don't want to implement an options
> > > handling framework in C right now :-)
> > > 
> > > > +			       "--algo, -a <algo>         Select algorithm, use \"-a ?\" for a list\n"
> > > > +			       "--brightness, -b <bright> Set brightness (multiplier) to output image\n"
> > > > +			       "                          (float, default 1.0)\n"
> > > 
> > > Do you know if this option is used by anyone ? It seems a bit out of
> > > place. Not an issue with this patch of course.
> > 
> > I have no idea. But keeping it won't do any harm, will it?
> 
> It's just an opportunity for cleaning up an unused feature :-) It looks
> out of place, as nothing else in raw2rgbpnm performs post-processing on
> the converted image (and rightfully so).

I think it'd make sense to convert the program to use pixel get/put
functions so the code dealing with actual pixel data wouldn't have to care
about the in-memory format. In that case both will likely be needed.

-- 
Sakari Ailus

