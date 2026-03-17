Return-Path: <linux-media+bounces-56042-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEKFCCMzuWnsuQEAu9opvQ
	(envelope-from <linux-media+bounces-56042-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:55:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DCD2A8586
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7B3B730095F2
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B11373C1E;
	Tue, 17 Mar 2026 10:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NgB+iauG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFF8366DBE
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744901; cv=none; b=pRgb/pIWBo8Msuo+4xYcBSbbOr13UDaRlULM+HqnmLs2T1bxBWUwfynoIBqFUJTPnHYe+BRHiwwSlS2rq4KCGDW3qXEDkySxD9jOg39wnNpVmx8goKL0P8nb6h9DO6obpwdHwyAmxxtgs84VVdklPUeDrxRW7oFnJzLTK22IuD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744901; c=relaxed/simple;
	bh=qrmlfTBzAjKIyrKgM4++fx33lDwXCR3THc/Qb6Ic284=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+7htkLqmJQkm0oafzRbNKLkK05ALv3rhEoZeIyqCXNj7jLpg8b51JdspH2Jrqwqiqu6WNEr+LaQHB3L97saF2qXp+b0IfYnoSY/UDSt4Ycx6OjqIHnx+dtAu5/iKBObQ+bgsy2rOmGLuUP3GSizR7nyEWovzc6E18dsSSuL9Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NgB+iauG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B28D4593;
	Tue, 17 Mar 2026 11:53:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773744826;
	bh=qrmlfTBzAjKIyrKgM4++fx33lDwXCR3THc/Qb6Ic284=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NgB+iauGFxnIB53R9GgQJIfq7uycFI/7qESWLR73aW6V9+Z4i796ClYdIa8iy31/f
	 t4eOkA/wGZoVfUbGA7gWs1EPHzrIIRaBbSF0TMI3ILAlUMSQL8dZHDXnWtSO+1EpJU
	 pTi7ZT/7QmZepQtkmOyNdeUGKlSEAOfsd/ouWaGk=
Date: Tue, 17 Mar 2026 12:54:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 5/7] More header sorting
Message-ID: <20260317105457.GF302774@killaraus.ideasonboard.com>
References: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
 <20260317095802.214532-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317095802.214532-6-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56042-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,killaraus.ideasonboard.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 19DCD2A8586
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 11:58:00AM +0200, Sakari Ailus wrote:
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Merged that with 1/7.

> ---
>  raw2rgbpnm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index 215decd65d93..ef12be820be6 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -29,10 +29,12 @@
>  #include <stdint.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> -#include <unistd.h>
>  #include <string.h>
> -#include <sys/types.h>
> +#include <unistd.h>
> +
>  #include <linux/videodev2.h>
> +#include <sys/types.h>
> +
>  #include "utils.h"
>  #include "raw_to_rgb.h"
>  #include "yuv_to_rgb.h"

-- 
Regards,

Laurent Pinchart

