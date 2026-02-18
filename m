Return-Path: <linux-media+bounces-53040-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFUfEJiUlWk1SgIAu9opvQ
	(envelope-from <linux-media+bounces-53040-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 11:29:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2B0155760
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 11:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 488CD301DEC1
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 10:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A222F25F2;
	Wed, 18 Feb 2026 10:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h78Cq/Cn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95362D949F
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 10:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771410461; cv=none; b=JDTFM6so9jfrzHreSxvBblMgD6IgQvry7ylGX/75t5Vb56xdYhyKAKwvO6kfKvW4z8dTyNK9l4Ke+9kHUEc034TU4ZGZssqhJ+r2v9BeCrW9LN6kkxMCZZrWblITvlLnX1sYE3ambdjg0xooQnqv7pNLRju+CRIkGW1tB0+nRIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771410461; c=relaxed/simple;
	bh=eFS0UEfUiN+xL8QW5RAPRGjkhjTinGv9Xdu5eEh7xPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oh7tbghjbusiLyR03FMkv9c0IqfHJKG8LzG9FDD1AkZigNEjYQxHWZAfYU5ioX2gdnzY1a27de7p1ld6R7J5nEb7dZyrvxL8fshLxOHRIAZcugtI7PeYkVRJMYPrAbmbDfgIbI4eaSdjl7x9efOKMOAQwKxbI2Q8z1RIepuCkK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h78Cq/Cn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (85-76-82-100-nat.elisa-mobile.fi [85.76.82.100])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C964166B;
	Wed, 18 Feb 2026 11:26:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771410406;
	bh=eFS0UEfUiN+xL8QW5RAPRGjkhjTinGv9Xdu5eEh7xPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h78Cq/CnXcSmHTaE8kIBTjfUfghRcCfr0ycX2Mr0mZ7ATWbPS/mmwywAFjc5NRcmF
	 oR3VTQW4/Ad/bQMCoISS8a8Pdy3b9eVWJZHaODXys8hcrRBAb3uPK9LULAgRQerTuN
	 JuFFoFfQQXPmR6WMmoW8md6iBQPSB86r+uvLIh14=
Date: Wed, 18 Feb 2026 11:27:36 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v3 2/3] Add compiler options to avoid warnings
Message-ID: <20260218102736.GC520738@killaraus.ideasonboard.com>
References: <20260218083424.2432541-1-sakari.ailus@linux.intel.com>
 <20260218083424.2432541-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260218083424.2432541-3-sakari.ailus@linux.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53040-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,ideasonboard.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: DD2B0155760
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 10:34:23AM +0200, Sakari Ailus wrote:
> Add -Wno-missing-field-initializers option to avoid warnings on modern
> GCC.

Maybe I should have mentioned that explicitly in v1, but I would also
fix the code instead of disabling the warning.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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

