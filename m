Return-Path: <linux-media+bounces-56037-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGc2B2YyuWnsuQEAu9opvQ
	(envelope-from <linux-media+bounces-56037-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:52:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D202A84A8
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 727DB308CFEA
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39961372ED5;
	Tue, 17 Mar 2026 10:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZLxJDvvM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8769637416B
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744600; cv=none; b=PhDjsAbs3nVlPnrHvcqDFIlhIp5928usKSadhcu36oo+wl3KxjOXr6DxKmTZhG5obGpAdlf4G5RDN4tAp/oTHbDIMJWNFdSUkgB5CqWvYzkXgprGj3KzperxUeq/c8UNoltkAQbFxUDfPopGOSbxhzS8iMpg2IGy9Vw0FkRpTcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744600; c=relaxed/simple;
	bh=6CUGFJsFEqQR+fbwAP4Y0YRN5YUQSPjCjwlNCK97BMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+R59GhxtYphWuzQ/1T34YIjLeiZO7qasTKflyWtPGsJZmGkrboCa2/Mx4897Z5GDfHVqGvYctvrI4+785zmp2I0nn165aP7cq9oq3tvac8d5Oj2LiG5aLfWdR41BOrP5eu/z8rylYcBs9jliRKmjqqAK2U58JyHh850LrXSXM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZLxJDvvM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 14F7A593;
	Tue, 17 Mar 2026 11:48:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773744524;
	bh=6CUGFJsFEqQR+fbwAP4Y0YRN5YUQSPjCjwlNCK97BMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZLxJDvvMO284JF00bbQYpffZKpn6x15AlOC16yxREWNO0TGfNhmY4JjYCi8fumHuB
	 DYopzGHHKSS7ZlW4PubBpIoUbusgJHSBu8Rp/g3Mga36VOU3ByQcX2rpzOQVAih/rD
	 k9Ys3+YIpTeNDrWTZUQz4GewSHF93i1QMEQNGzME=
Date: Tue, 17 Mar 2026 12:49:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v4 04/11] Support long options and improve
 help text
Message-ID: <20260317104954.GA302774@killaraus.ideasonboard.com>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
 <20260310084615.1183141-5-sakari.ailus@linux.intel.com>
 <20260316144151.GF31604@killaraus.ideasonboard.com>
 <abkjmuuQvBG12qBJ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <abkjmuuQvBG12qBJ@kekkonen.localdomain>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56037-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 87D202A84A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 11:49:14AM +0200, Sakari Ailus wrote:
> Moi,
> 
> On Mon, Mar 16, 2026 at 04:41:51PM +0200, Laurent Pinchart wrote:
> > On Tue, Mar 10, 2026 at 10:46:10AM +0200, Sakari Ailus wrote:
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  raw2rgbpnm.c | 34 +++++++++++++++++++++++++---------
> > >  1 file changed, 25 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> > > index 14cfa7e7a46c..16ef64e984b9 100644
> > > --- a/raw2rgbpnm.c
> > > +++ b/raw2rgbpnm.c
> > > @@ -24,6 +24,7 @@
> > >   */
> > >  
> > >  #include <ctype.h>
> > > +#include <getopt.h>
> > >  #include <stdio.h>
> > >  #include <stdint.h>
> > >  #include <stdlib.h>
> > > @@ -836,6 +837,17 @@ static int parse_format(const char *p, int *w, int *h)
> > >  	return 0;
> > >  }
> > >  
> > > +static struct option options[] = {
> > > +	{ "algo", required_argument, NULL, 'a', },
> > > +	{ "brightness", required_argument, NULL, 'b', },
> > > +	{ "format", required_argument, NULL, 'f', },
> > > +	{ "help", no_argument, NULL, 'h', },
> > > +	{ "high-bits", no_argument, NULL, 'g', },
> > > +	{ "size", required_argument, NULL, 's', },
> > > +	{ "swap-rb", no_argument, NULL, 'w', },
> > > +	{ 0 },
> > > +};
> > > +
> > >  int main(int argc, char *argv[])
> > >  {
> > >  	FILE *f;
> > > @@ -849,7 +861,7 @@ int main(int argc, char *argv[])
> > >  	int width = -1;
> > >  
> > >  	for (;;) {
> > > -		int c = getopt(argc, argv, "a:b:f:ghs:w");
> > > +		int c = getopt_long(argc, argv, "a:b:f:ghs:w", options, NULL);
> > >  		if (c==-1) break;
> > >  		switch (c) {
> > >  		case 'a':
> > > @@ -889,14 +901,18 @@ int main(int argc, char *argv[])
> > >  			break;
> > >  		case 'h':
> > >  			printf("%s - Convert headerless raw image to RGB file (PNM)\n"
> > > -			       "Usage: %s [-h] [-w] [-s XxY] <inputfile> <outputfile>\n"
> > > -			       "-a <algo>     Select algorithm, use \"-a ?\" for a list\n"
> > > -			       "-b <bright>   Set brightness (multiplier) to output image (float, default 1.0)\n"
> > > -			       "-f <format>   Specify input file format format (-f ? for list, default UYVY)\n"
> > > -			       "-g            Use high bits for Bayer RAW 10 data\n"
> > > -			       "-h            Show this help\n"
> > > -			       "-s <XxY>      Specify image size\n"
> > > -			       "-w            Swap R and B channels\n", progname, argv[0]);
> > > +			       "Usage: %s [--algo|-a <algo>] [--brightness|-b <brightness>]\n"
> > > +			       "       [--format|-f <format>] [--help|-h] [--high-bits|-g] [--size|-s XxY]\n"
> > > +			       "       [--swap-rb|-w] <inputfile> <outputfile>\n\n"
> > 
> > That won't scale nicely, but I don't want to implement an options
> > handling framework in C right now :-)
> > 
> > > +			       "--algo, -a <algo>         Select algorithm, use \"-a ?\" for a list\n"
> > > +			       "--brightness, -b <bright> Set brightness (multiplier) to output image\n"
> > > +			       "                          (float, default 1.0)\n"
> > 
> > Do you know if this option is used by anyone ? It seems a bit out of
> > place. Not an issue with this patch of course.
> 
> I have no idea. But keeping it won't do any harm, will it?

It's just an opportunity for cleaning up an unused feature :-) It looks
out of place, as nothing else in raw2rgbpnm performs post-processing on
the converted image (and rightfully so).

> > > +			       "--format, -f <format>     Specify input file format format\n"
> > > +			       "                          (-f ? for list, default UYVY)\n"
> > > +			       "--help, -h                Show this help\n"
> > > +			       "--high-bits, -g           Use high bits for Bayer RAW 10 data\n"
> > > +			       "--size, -s <XxY>          Specify image size\n"
> > > +			       "--swap-rb, -w             Swap R and B channels\n", progname, argv[0]);
> > 
> > I'd add a line break before progname.
> 
> Sounds good.
> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > >  			exit(0);
> > >  		case 's':
> > >  			if (parse_format(optarg, &width, &height) < 0) {

-- 
Regards,

Laurent Pinchart

