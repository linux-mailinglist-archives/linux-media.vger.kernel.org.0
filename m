Return-Path: <linux-media+bounces-52996-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id n6FDNP8AlWnWJwIAu9opvQ
	(envelope-from <linux-media+bounces-52996-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 00:59:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEFE152131
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 00:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB7FB30488F6
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 23:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF83137AA8D;
	Tue, 17 Feb 2026 23:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u8qwf/T5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896F218A6CF
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 23:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771372786; cv=none; b=pHdwmDXXSgoSO7i78yznivXjmNkW+L1iBJPnoM5vrD6voyFrF8SqsdkPxReAn1e4OhIGqrL+J623ENmw32paAsYyvpviKXdUhFer+ZHmroyZKpzQd8Y6bzBCvDmH+V0b/WwuoPs3+lbbscrDRcM71SHmTy6AP/2R0tu1EMPwA24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771372786; c=relaxed/simple;
	bh=SPi9YoxXyywCBotPG1CnNm1mvFWyKh/FlWmCUuRHCI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOnDZRzACksv+yv1o4MetX/mO39UgSj4qUTtdfYtLwqAmlMgeFJ60pze2IOh55MuBSTLtV4OTmttahjQPtOiX8iKh8kjuMwkmV7iSpu0a0UO7LBkOzvR6U4i13AbaCIcQvouBYdeuOC8MDT6jxwLaJVttxGlE+QglHLwJGTwf7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u8qwf/T5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a02:a03f:a440:2900:9751:ae5e:a777:a318])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3D2C555C;
	Wed, 18 Feb 2026 00:58:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771372723;
	bh=SPi9YoxXyywCBotPG1CnNm1mvFWyKh/FlWmCUuRHCI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u8qwf/T51BMY+nlmXMSl2Yf+JgfNq6V8LAENvmiypCg6KE+eIyxPQVUFmSMtEP+0p
	 tT3wbr98UqtmaMHCZFAOMXrw+CP9EbVfJl6er5mYktN4pRu0/Pg008bZw6Yjzp2DbT
	 ITx/W62EOUN/Ns8mu4Mt6WPQND59ML7sqj5D9WOw=
Date: Wed, 18 Feb 2026 00:59:33 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH 1/2] Add compiler options to avoid warnings
Message-ID: <20260217235933.GD18192@killaraus.ideasonboard.com>
References: <20260217214435.2431864-1-sakari.ailus@linux.intel.com>
 <20260217214435.2431864-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217214435.2431864-2-sakari.ailus@linux.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52996-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3FEFE152131
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 11:44:34PM +0200, Sakari Ailus wrote:
> Add -Wno-missing-field-initializers and -Wno-implicit-fallthrough options

How about fixing the implicit fallthrough occurrences ? :-)

> to avoid warnings on modern GCC.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index ab363501a212..8a612710ee2e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,7 +1,7 @@
>  CROSS_COMPILE ?=
>  
>  CC	:= $(CROSS_COMPILE)gcc
> -CFLAGS	?= -O2 -W -Wall -Iinclude
> +CFLAGS	?= -O2 -W -Wall -Iinclude -Wno-missing-field-initializers -Wno-implicit-fallthrough
>  LDFLAGS	?=
>  
>  %.o : %.c

-- 
Regards,

Laurent Pinchart

