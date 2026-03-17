Return-Path: <linux-media+bounces-56041-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKXDBSszuWnsuQEAu9opvQ
	(envelope-from <linux-media+bounces-56041-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:55:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D3E2A858D
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59E12302003E
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CE5373BF5;
	Tue, 17 Mar 2026 10:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B72BDVEb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7CC368941
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744883; cv=none; b=ad0A8QrImMIFO+vBTCBvNY6vLtO52xljB4mjPEoQDMNi9eL9TZK2FAeMA/TMCDIWeimTAbgRdGhAEnKdmURk9AIr1rVAj3X9bxmXVEl/hHrUaVzmy+POe8DqJuEiUDUXkDvo6FfrFQcjo5tfT4TnBsG3XaMofI3FgbEsUIe0KWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744883; c=relaxed/simple;
	bh=aEpoCfUjrbrEugOPIGAQFWoiilKU+BVxbBMW2ykw6kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjmgctUbzqkkYzOCSNoH/pZXp79cuY11Wzm4Yjw8fWsW43GUpbLh94au0s8+6Y3QqEbYsJb3tbP91oEMKlaXxLLge7ee3+Ok4ci3ie68Sr0fkMy+Mrb8XiS1rmYxOKuK5bOAhIn24EqCLF1YWMjjnuj2FuhezvrPUhkgVjdcin8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B72BDVEb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 17F79593;
	Tue, 17 Mar 2026 11:53:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773744809;
	bh=aEpoCfUjrbrEugOPIGAQFWoiilKU+BVxbBMW2ykw6kA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B72BDVEb3cO6w2H/O0nPVHpQENHOvSU163g0E9QM7UdQl5AVbl5EBIi3AygXEmcz6
	 tfGCW/63aoc8QQIPdvO3Mel7lOwsv8SuIBDfTptYGwKyMQq42c8LPUESixEWVXN0v4
	 FRc1nxc75hfdvA/g13lT93Y3Gr3IWzxnoJlSRoMs=
Date: Tue, 17 Mar 2026 12:54:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 4/7] Constify progname
Message-ID: <20260317105439.GE302774@killaraus.ideasonboard.com>
References: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
 <20260317095802.214532-5-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317095802.214532-5-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56041-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 61D3E2A858D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 11:57:59AM +0200, Sakari Ailus wrote:
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  raw2rgbpnm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index e8d72a68be30..215decd65d93 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -43,7 +43,7 @@
>  #define MAX(a,b)	((a)>(b)?(a):(b))
>  #define MIN(a,b)	((a)<(b)?(a):(b))
>  
> -char *progname = "raw2rgbpnm";
> +const char *progname = "raw2rgbpnm";
>  
>  static int swaprb = 0;
>  static int highbits = 0;			/* Bayer RAW10 formats use high bits for data */

-- 
Regards,

Laurent Pinchart

