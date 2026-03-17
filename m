Return-Path: <linux-media+bounces-56040-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL3MOBQzuWnsuQEAu9opvQ
	(envelope-from <linux-media+bounces-56040-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:55:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 543A92A8577
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3FBB3054208
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7595136F409;
	Tue, 17 Mar 2026 10:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="puMU2Jha"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEAD368941
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744869; cv=none; b=ZSAgykgt+2kJSkTJ9Pk9+6TrDrOnUEWzLs5a1LQEav8XurSyaqNaHC/Am1DYin6G1bul/lp7lnyrQk3heb6WQGkZS32q2UdNPU9/X866wbUTsVlzdsJNsJlHbihNH1Pk6t4tw07vmTxdt/hMhx9C/YuguNLVrjvPyteZ7lUS19A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744869; c=relaxed/simple;
	bh=RvCRMzL7YioZtNWnrEDH0f4sq0d5F7Tanj/YO/JO7Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MB2n2n8ZmaTB6iSIw48ySrR8OnfRgF7WUpnPEPVpyr79MV62UamJc3NmtxLslf0DRysIi62gejGSYwWa4BRxPyzdxwmtc6mBVmEf49qW/d18kFF1wXN5iHY0A0LAzt6pIigs12ByjKPcMKRatdblkmO9JN9ITlPWAqmx3jy2SrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=puMU2Jha; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 672D7593;
	Tue, 17 Mar 2026 11:53:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773744795;
	bh=RvCRMzL7YioZtNWnrEDH0f4sq0d5F7Tanj/YO/JO7Qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=puMU2JhapvOOzennDNpfID43hBzZbkDF7YbNr5fYIXsy7d5+8JqMGc6Z+HkbU3LsL
	 bcPlOcaRgXxwG6SxGLWS/xI//E3Lo5FfC8aOGQubfVTCsuwna3RV0sZk8/0bSAWj1i
	 WJWlZ7rsnrYmNt4/gH/5arxVPhk1w6XCiTZNCOyk=
Date: Tue, 17 Mar 2026 12:54:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 3/7] Add quotes for "-f help" in help text and do a line
 wrap
Message-ID: <20260317105426.GD302774@killaraus.ideasonboard.com>
References: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
 <20260317095802.214532-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317095802.214532-4-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56040-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 543A92A8577
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 11:57:58AM +0200, Sakari Ailus wrote:
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  raw2rgbpnm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index 8aa7258218ad..e8d72a68be30 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -929,11 +929,12 @@ int main(int argc, char *argv[])
>  			       "--brightness, -b <bright> Set brightness (multiplier) to output image\n"
>  			       "                          (float, default 1.0)\n"
>  			       "--format, -f <format>     Specify input file format format\n"
> -			       "                          (-f help for list, default UYVY)\n"
> +			       "                          (\"-f help\" for list, default UYVY)\n"
>  			       "--help, -h                Show this help\n"
>  			       "--high-bits, -g           Use high bits for Bayer RAW 10 data\n"
>  			       "--size, -s <XxY>          Specify image size\n"
> -			       "--swap-rb, -w             Swap R and B channels\n", progname, argv[0]);
> +			       "--swap-rb, -w             Swap R and B channels\n",
> +			       progname, argv[0]);
>  			exit(0);
>  		case 's':
>  			if (parse_format(optarg, &width, &height) < 0) {

-- 
Regards,

Laurent Pinchart

