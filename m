Return-Path: <linux-media+bounces-60791-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEjZNOSJ/Gm8RAAAu9opvQ
	(envelope-from <linux-media+bounces-60791-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 14:47:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 742EE4E8692
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 14:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7CD65301F4BC
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 12:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336E63B19BC;
	Thu,  7 May 2026 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZIHd+Mfa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC4D3101A2
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 12:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778157973; cv=none; b=tDbIXyWgLXPYBcV5sbXFuaLHuRj6uGZdeUEm1+ntlutbCb0S5OY5+8ydY7fs9StPsdqBqcj72z44U4qU6BS9Ddco/6YO6kyULBWujUbPXORUNMgOQnoCCkkmCEBvTCP8YGDuD/CX3fN6Xjels/fIiKqjO04e1ygSj7jDTDjtBo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778157973; c=relaxed/simple;
	bh=OjaV5oD1FNxrXujZALZ/Y7K3nB/7+UYzdXNndiYpU8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3NtCjR8rVeZeqDC3Fih5N+i52TpryXJ5VNZxkg3AzY4tGZxd1BtF8GY2ukHHmgbsCaGtbswQGXsEnHBKcgBtBfOUUXUWBQbc7bVJKePA4gNJgKZXULYQJtxM8c4DUNdAwhogM/EU6rvO65gMRzqTiANl3GCSTE9OphPiuo9FPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZIHd+Mfa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F06F664;
	Thu,  7 May 2026 14:46:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778157965;
	bh=OjaV5oD1FNxrXujZALZ/Y7K3nB/7+UYzdXNndiYpU8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZIHd+Mfafi3OZ5aob2r01CocLvj9Nasc8eMbvBwcCc9PA1NB3Jgu1ybYXrZPiGNze
	 oG9tEVOerORWyReZJFNY9K8kxkWeIywVQTGGyJV7Qz5nMCFczoLRN/okm7X6ZL/HKg
	 E3COW3DNW+sD8PFM87jYu9s1kc7i2a5FQzPTMrbA=
Date: Thu, 7 May 2026 14:46:06 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 1/2] media: mc-entity: Fix documentation typo in function
 name
Message-ID: <afyJbXUK4ZIha-au@zed>
References: <20260506165438.1767378-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506165438.1767378-1-laurent.pinchart@ideasonboard.com>
X-Rspamd-Queue-Id: 742EE4E8692
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60791-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Hi Laurent

On Wed, May 06, 2026 at 07:54:37PM +0300, Laurent Pinchart wrote:
> The media_entity_pads_init() function name is misspelled. Fix it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  include/media/media-entity.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index b91ff6f8c3bb..904f61c14dc1 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -726,7 +726,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>   * the entity (currently, it does nothing).
>   *
>   * Calling media_entity_cleanup() on a media_entity whose memory has been
> - * zeroed but that has not been initialized with media_entity_pad_init() is
> + * zeroed but that has not been initialized with media_entity_pads_init() is
>   * valid and is a no-op.
>   */
>  #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
>
> base-commit: 3cd9b7011519c3fffffb7b6752fc7603be52dc1d
> --
> Regards,
>
> Laurent Pinchart
>
>

