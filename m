Return-Path: <linux-media+bounces-55933-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ItwLxkYuGl/YwEAu9opvQ
	(envelope-from <linux-media+bounces-55933-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:47:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6338829BA58
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9A2330244C4
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3832ED846;
	Mon, 16 Mar 2026 14:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SYMRB3dl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133BF2EC081
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 14:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672422; cv=none; b=TYVF8blSgy6B36Hd25L+hPSktE58zvYX6ctcbvKFkgzNh6WHCLNLyoakWsv82ulZMPTGNJkiFo5NISBMV66gZqfh/0/Yy94qJio/zpuJbGKi8TgKKWYO0a8CfxYtDz+dQdo67AuoQsdI1WpXnSDI61V0FneOeVReTmg7ZuxVE2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672422; c=relaxed/simple;
	bh=QAPxntHLrhS72he1aZv27UgPPjFsL2bC8ul2db9ctoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dj5f5oe4XsCLtTRuX8gZ0oepyFcT6T73/nQnjVj9xt6Vw1co+2yIqrmuvwkQC1W2cpnYpXaCzJ0LFjENxdcPggGHh1fI3WBq054WRSdzi661S2ufqjrWGmrZIDRis1TUvuAC6CcM6tdRG28o1dpNJi12vb3pHCBL9FdUohSHUXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SYMRB3dl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C4FD0B1A;
	Mon, 16 Mar 2026 15:45:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773672348;
	bh=QAPxntHLrhS72he1aZv27UgPPjFsL2bC8ul2db9ctoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SYMRB3dlwpVSmRIxN15cciKmGjFapyC+PC/qkZ+Yffy1rd9jj1EUv7Caek0+tNs4s
	 TJVSynK5BLtUpkE9MOPbhiGzkAc8Dw7lEJmRVik3RgPhFcDslNEWYsZjLWA5urAY8n
	 MAOikzyLg3A1LjugLGtYoSNuP566ua+pxDlw60q4=
Date: Mon, 16 Mar 2026 16:46:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v4 06/11] The program has been called
 raw2rgbpnm, not yuv_to_rgbpnm awhile now
Message-ID: <20260316144657.GH31604@killaraus.ideasonboard.com>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
 <20260310084615.1183141-7-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310084615.1183141-7-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55933-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,killaraus.ideasonboard.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 6338829BA58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 10:46:12AM +0200, Sakari Ailus wrote:
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  raw2rgbpnm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index b0151789b0c1..bb9a2d576969 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -43,7 +43,7 @@
>  #define MAX(a,b)	((a)>(b)?(a):(b))
>  #define MIN(a,b)	((a)<(b)?(a):(b))
>  
> -char *progname = "yuv_to_rgbpnm";
> +char *progname = "raw2rgbpnm";

While at it, make it const.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I wish the program would have been called raw2rgbppm, as it generates
PPM files.

>  
>  static int swaprb = 0;
>  static int highbits = 0;			/* Bayer RAW10 formats use high bits for data */

-- 
Regards,

Laurent Pinchart

