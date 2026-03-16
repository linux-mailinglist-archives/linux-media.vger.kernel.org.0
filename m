Return-Path: <linux-media+bounces-55934-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFQ+OJIYuGn/YwEAu9opvQ
	(envelope-from <linux-media+bounces-55934-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:49:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B2029BAED
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0AB2F302EF9B
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583982F7AD2;
	Mon, 16 Mar 2026 14:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J5Vgmx2c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4C92EBB89
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 14:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672476; cv=none; b=B7NpbjC+xIi4mAQQI7IEk/8E5zeIPFLZIMkVMnggeCrBjRykNUOwlI4Zyo3dM6EM4fnTc0xe7iYDDXei7Xq1sdWOa48SFSNaPL6z4AEikCHIbULcPGdocV75DM5quS6Wpc+R5FmMNwAb/hUI8+f4YVtebNxllQ/5upQ/QYQJuLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672476; c=relaxed/simple;
	bh=l1HRlVFJssg3uHFqoGtWTTcC5MNCK8mpeRbVnrsXbh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHl6ORcV6nUFvNZSAV4D3vY3w4TI9GXzKL6pKshxe9bFcExAO2fwalutYxcu7P/BycsHgyORv9MmPqsrbdYrpo21G9IMYiYKDocbttiddPa0A6RMmxD2aBeBCxQ8fTg8p2BGBuHtdVEWlR5v3HbBx5aIGXTfsV0PXs2Z92kQnWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J5Vgmx2c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 49527B1A;
	Mon, 16 Mar 2026 15:46:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773672401;
	bh=l1HRlVFJssg3uHFqoGtWTTcC5MNCK8mpeRbVnrsXbh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J5Vgmx2cOLKPcqHKrIsTbfitiHSs+xMWlkwMrEPO02GSUVM6FoWTUtJWmAYoP6IQ5
	 zc5RfpR2VNlD6e/iDV5K0inChz6RXT6H8LK37BYHLYIquqTvtc4tC7yv9i1EbKCoTh
	 MjxpLxvkSgDh5C7vYg+YUUkd/BQgIxq9dAebf6rU=
Date: Mon, 16 Mar 2026 16:47:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v4 07/11] Arrange headers alphabetically
Message-ID: <20260316144751.GI31604@killaraus.ideasonboard.com>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
 <20260310084615.1183141-8-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310084615.1183141-8-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55934-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[killaraus.ideasonboard.com:mid,intel.com:email,ideasonboard.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 83B2029BAED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 10:46:13AM +0200, Sakari Ailus wrote:
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  raw2rgbpnm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index bb9a2d576969..0e0a5b1e63e9 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -25,13 +25,13 @@
>  
>  #include <ctype.h>
>  #include <getopt.h>
> +#include <limits.h>
>  #include <stdio.h>
>  #include <stdint.h>
>  #include <stdlib.h>
>  #include <unistd.h>

Interesting... :-)

>  #include <string.h>
>  #include <sys/types.h>
> -#include <limits.h>
>  #include <linux/videodev2.h>
>  #include "utils.h"
>  #include "raw_to_rgb.h"

-- 
Regards,

Laurent Pinchart

