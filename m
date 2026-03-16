Return-Path: <linux-media+bounces-55928-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PknE8ATuGk7YwEAu9opvQ
	(envelope-from <linux-media+bounces-55928-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:29:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA5D29B61B
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF5AE301BA64
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DDB287259;
	Mon, 16 Mar 2026 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PNCBg6w+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB5E27EFEE
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671325; cv=none; b=ZMFVWvlDQ+PmyKGQzM3nLO+RGQXgM9hy8lJWeOKtII6hrvIqr/Cp+bLsqULXsIkgvTNXKL82nMTFi23aotWggoLID+LPrsXaH853ZqQYDGmdFBAMw0mXIihvYVXQpR6EFAM/FQixXCkJKeSI/2k+H0glWkXYjgUBY7Yl1Tkiy0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671325; c=relaxed/simple;
	bh=G617Dx75gjZIghL4p9Uz5B7z38IBN+1JrmeUvWvRw68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SG7V+I8bNPeOnDcdbhQBVo8T12K+VC/RzfX+jHmClcMNu6IF8QnDBiQHfmsiw0v+74Yf5og09anyFyAd0C3pjFx44hmyhIQbBfnpXEUInF1TErXQUB1eVSXgboGdaL1ioBTq+7yk/oUcAAFR7vUG0SmxvIWdlAP+LButNuPEyIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PNCBg6w+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7D5A6B1A;
	Mon, 16 Mar 2026 15:27:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773671251;
	bh=G617Dx75gjZIghL4p9Uz5B7z38IBN+1JrmeUvWvRw68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNCBg6w+M5dyMGadmsLlo4n6+zTmj7K31RdhO+ScjLkKnvgJEUZgfX9yQbRsgsD05
	 YDYN43NgOHS8eY6cdRLC1ZHrezewIvq+CJ7lYSs0cfHWvA88MxW2W/ukebdW79/MED
	 T/2G8KiT4qAj6x3vUm3XtX509/jnsjkCPXmoAFXA=
Date: Mon, 16 Mar 2026 16:28:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v4 02/11] Add compiler options to avoid
 warnings
Message-ID: <20260316142841.GC31616@killaraus.ideasonboard.com>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
 <20260310084615.1183141-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310084615.1183141-3-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55928-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: AEA5D29B61B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 10:46:08AM +0200, Sakari Ailus wrote:
> Add -Wno-missing-field-initializers option to avoid warnings on modern
> GCC.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index ab363501a212..7545682dbcce 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,7 +1,7 @@
>  CROSS_COMPILE ?=
>  
>  CC	:= $(CROSS_COMPILE)gcc
> -CFLAGS	?= -O2 -W -Wall -Iinclude
> +CFLAGS	?= -O2 -W -Wall -Iinclude -Wno-missing-field-initializers
>  LDFLAGS	?=
>  
>  %.o : %.c

-- 
Regards,

Laurent Pinchart

