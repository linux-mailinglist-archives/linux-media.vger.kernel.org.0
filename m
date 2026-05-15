Return-Path: <linux-media+bounces-61653-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIloGF77Bmp1qQIAu9opvQ
	(envelope-from <linux-media+bounces-61653-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:54:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB0154DD04
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 766A130BC512
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 10:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA6242885E;
	Fri, 15 May 2026 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="SmBjJENJ"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8EF41C2E9;
	Fri, 15 May 2026 10:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840791; cv=pass; b=TCTBQ6q+uT5yn4cKBGNkVsCZ4PaANc8tPVZn252B0FpTxuQNXffxdOJXUxaJbIX33MGNXmdTg9iTHC9+j6IYjcvM9CBoN2KjnxJ51Z/S/o/UhRiehl9M8DriZaxYJwZCLq+t0dJh3cEf90Tv2VO+ByQXAM9a2g1n635hQKBGFF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840791; c=relaxed/simple;
	bh=4sV4/SZw0ilUuv2omXmWtjLNK9HCDTRTSQ09AAAoaH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xogt9bA6UckzaELPH+5LiUsGgAWOq9IOJrvAwJUiWKjp7vVPYottwtHjkhHGn6txXkzSfcGH9bF/nO8HO6O66j5x4LZUjxqpCapOUeBse13vCotL336jpv/UQhVDP5StTwvaGAyYRe9bTUrm0nWwDbnrzhtfRgqjhGBduk6NZdo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=SmBjJENJ; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4gH3JZ4GFCz49Pxd;
	Fri, 15 May 2026 13:26:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1778840783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5xuM2ibpGH9ATlU8rNLeB8x/5oPWNuowTQ30rcoEFTE=;
	b=SmBjJENJogJEtpqv6gPMGES/xtN8KOxIFQPsCNzjwOK+bz3uVdlOPaq0/d459jFjr13alN
	oyTAVWbOxLW37lbKqovZj0p8TK+7yem0ybifcztlLsiNGqH8aFCJZnPE5vu+axghPP8bhq
	jWodhDcLHONVG+dZv8OGQfxAS51NqsOel6IGh0/2cKoh0JcyL7Ls/Hx1kzUxeT2/jVu83X
	JfmBK5ahny7cgrHWP6AH0bX2ZKED6CRiySQ9DUHFSftR1v/xAAAyO9WAYRUKsaNEaQSm/q
	Cjt9PI6AAhpo8loNRwQcKtcjnHfgOuhC3DsRE+wiQk2r0JtFg9MsuMkXHngqaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1778840783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5xuM2ibpGH9ATlU8rNLeB8x/5oPWNuowTQ30rcoEFTE=;
	b=JwQxXKraaer//X5lVoU1p+ypFJWC1KMnWEVOkHGbx3GwFi/dm7l02yHBu8+GDZo9ZaSTfX
	UamTlq59RlYKCsSxYdUA4IF4qk3gyNa+yPcRC1SmoUYFusTSph1LVICXEJk8+zQxsQOkDF
	ZJoI7mjX3zZk/HaxmdPQqWEV2gzr4hGchuMykO9p/RYZuarXDfdkK7awVkovfrWi+a+0wc
	JO2J9fIq/EOMwSC59L/ejq+n6ViFakWj4LxFDY2MJaZDG08Nhtc3m4jzx007r6Tb16dZCv
	dUVr759K+2F3KVIcEg56pOUh+oV1ea6zIX7fCjOiVhRvkyJ3O12big8L5CCPWw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1778840783;
	b=LhpuyPZnmyhi2hsdiHm67W84U9MFqCptXQv1GvWZ6dwOOVcEx4AWs0R5GDDzhZkOSEJ83C
	ExJnruVfTiuAxnlcm5mbjUU+e7J2zN/KltkRigbWT8ppftDa4P+kslKWq5m8/178DUhfrE
	3JnyADeG8vlfsHMK3Pc+5WlIG4Xe7TUewUocnDgxm1woTii6fyi/4FjRFAuFiOPjcEyHC5
	zutpq3vjJiMW0Cx2Sv25xuCJXVJFa56uUeC1UGeQFRknjZ3nkGNKc5G7VR9zvziLUDeY8R
	45iUJHv2gbLc1CAsrIoPOpl3gfjD9IYcS4KZFlMr3UiifsEDM4buNtRzTOkh1A==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 30502634C51;
	Fri, 15 May 2026 13:26:21 +0300 (EEST)
Date: Fri, 15 May 2026 13:26:20 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Cc: linux-media@vger.kernel.org, eugen.hristev@linaro.org,
	mchehab@kernel.org, hverkuil@kernel.org,
	nicolas.ferre@microchip.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/15] media: microchip-isc: add per-channel gamma LUT
 controls
Message-ID: <agb0zAmeEILM4JJy@valkosipuli.retiisi.eu>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
 <20260512154339.210444-1-balakrishnan.s@microchip.com>
 <20260512154339.210444-12-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512154339.210444-12-balakrishnan.s@microchip.com>
X-Rspamd-Queue-Id: AEB0154DD04
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	TAGGED_FROM(0.00)[bounces-61653-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Balakrishnan,

Thanks for the set.

On Tue, May 12, 2026 at 09:13:35PM +0530, Balakrishnan Sambath wrote:
> Add 64-entry gamma LUT controls for R/G/B channels. Setting any LUT
> overrides V4L2_CID_GAMMA; writing V4L2_CID_GAMMA restores presets.
> Supports SAMA7G5 bipartite encoding.

I'd say hardware this complicated should use parameter buffers like other
similar hardware does. The reasoning is that the userspace gets an
interface that allows passing all relevant parameters to the driver at one
go, with a reasonable expectation on which frame it can be applied to.
Controls provide neither of these.

On top of this, the control framework, while useful for high level
configuration parameters, introduces quite a bit of validation overhead
that can affect performance while the effect of a bad parameter value is
simply bad output and the software setting these values is purpose-built so
it can already take the ranges and steps into account.

-- 
Kind regards,

Sakari Ailus

