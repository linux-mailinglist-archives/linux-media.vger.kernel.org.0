Return-Path: <linux-media+bounces-55932-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEFEDaoYuGn/YwEAu9opvQ
	(envelope-from <linux-media+bounces-55932-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:50:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 984C229BB2A
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA30C303741A
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642892D94B4;
	Mon, 16 Mar 2026 14:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WO8VEvqm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04EA29ACD7
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 14:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672301; cv=none; b=lYxGTQcHd67Og5JZJZWc3cY+VwazwW7fDNArQeJzXpbxRG2J/YK1+8qVrzPNNn5rKc1RUGryKNUCN1YHdPez3dJf4wW9Ztd7hBnJ1xcA5zNIHRH5WjYl9dSToptHpkEnnD4WWjycnqG00jrlH5z4jo1IIzUEOFltMLT0ZssfFcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672301; c=relaxed/simple;
	bh=Ie3kokdXsthDeult9kzwVu0pNt571sNAbJxfbnr8E94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjugbIDD9M4WI+9KEHdNHBubp8Yqr28JHKoi1bngRAqspCEexVv19MhHhcrzkf00/HJvVAWOv9EV4jkv2Axajlw3kbZyBAdWI8/8iG1zM07NN6khL9fntxSfaTadYVsP5h7clU6R4Uvup+MPOGFy58KoWSmcP/2GrJYajSj1GRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WO8VEvqm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6E460B1A;
	Mon, 16 Mar 2026 15:43:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773672227;
	bh=Ie3kokdXsthDeult9kzwVu0pNt571sNAbJxfbnr8E94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WO8VEvqmQd5fBlGfaIJXMGAh1GMbXTJ0C8hEvXziU0qxm5FdOpnYe1k3NphXSbgW6
	 ZHeMM7hnR5O2K9O4ArxYFRJo6iS/Xxjze3LpabAjXJfB86cwe0Ocu19NuPMbdjm2BR
	 sBym4/MmRpq5YSHwXiqNLkq66ClLRHslT5m35WqE=
Date: Mon, 16 Mar 2026 16:44:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v4 05/11] Add "help" for listing formats and
 de-Bayering algos, document it
Message-ID: <20260316144457.GG31604@killaraus.ideasonboard.com>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
 <20260310084615.1183141-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310084615.1183141-6-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55932-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,intel.com:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 984C229BB2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 10:46:11AM +0200, Sakari Ailus wrote:
> '?' is a problematic character for shells.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  raw2rgbpnm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index 16ef64e984b9..b0151789b0c1 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -865,7 +865,7 @@ int main(int argc, char *argv[])
>  		if (c==-1) break;
>  		switch (c) {
>  		case 'a':
> -			if (optarg[0]=='?') {
> +			if (optarg[0]=='?' || !strcmp(optarg, "help")) {
>  				printf("Available bayer-to-rgb conversion algorithms:\n");
>  				qc_print_algorithms();
>  				exit(0);
> @@ -876,7 +876,7 @@ int main(int argc, char *argv[])
>  			brightness = (int)(atof(optarg) * 256.0 + 0.5);
>  			break;
>  		case 'f':
> -			if (optarg[0]=='?' && optarg[1]==0) {
> +			if ((optarg[0]=='?' && optarg[1]==0) || !strcmp(optarg, "help")) {
>  				unsigned int i,j;
>  				printf("Supported formats:\n");
>  				for (i=0; i<SIZE(v4l2_pix_fmt_str); i++) {
> @@ -904,11 +904,11 @@ int main(int argc, char *argv[])
>  			       "Usage: %s [--algo|-a <algo>] [--brightness|-b <brightness>]\n"
>  			       "       [--format|-f <format>] [--help|-h] [--high-bits|-g] [--size|-s XxY]\n"
>  			       "       [--swap-rb|-w] <inputfile> <outputfile>\n\n"
> -			       "--algo, -a <algo>         Select algorithm, use \"-a ?\" for a list\n"
> +			       "--algo, -a <algo>         Select algorithm, use \"-a help\" for a list\n"
>  			       "--brightness, -b <bright> Set brightness (multiplier) to output image\n"
>  			       "                          (float, default 1.0)\n"
>  			       "--format, -f <format>     Specify input file format format\n"
> -			       "                          (-f ? for list, default UYVY)\n"
> +			       "                          (-f help for list, default UYVY)\n"

While at it, quote "-f help" like done above for -a.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  			       "--help, -h                Show this help\n"
>  			       "--high-bits, -g           Use high bits for Bayer RAW 10 data\n"
>  			       "--size, -s <XxY>          Specify image size\n"

-- 
Regards,

Laurent Pinchart

