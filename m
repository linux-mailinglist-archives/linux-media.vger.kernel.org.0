Return-Path: <linux-media+bounces-60793-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOS7IjWK/GleRAAAu9opvQ
	(envelope-from <linux-media+bounces-60793-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 14:48:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0729B4E870C
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 14:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BABC630142BC
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 12:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADCE3939C8;
	Thu,  7 May 2026 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Fi8pkn46"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1823A783C
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 12:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158108; cv=none; b=TtFvvrVeT2vmbmcvmn9nVCjx7C9te/53QBnsPA9AHn6J8aXpyTYPQpcnuxf1ylSD/dudkPH1tQ05IymbjyZoQwwQrfHIGpxYJe1HWg/R1gTMEB/Y056RGL8IsO7vneWLZSAoX44Z8gy/AwdKWOaegk3S4NaZsjkbNPyHX52DDQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158108; c=relaxed/simple;
	bh=uCCrW1U92dqWbmnBBY6h8Zb8c0wIqEXAaHnw8hKa2LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwNGlgwAIHZfEoaFI0fSwAsMFd0aG9i7XTOtT7ksRG1u4a4xgIdI2P4tEAm4j15dymoY/XEAboyFJUIAEBEl5Jl9kriNKa3YzCPT7UECg+l5xE+Ya12IiPdAXL7lPBJLWdx3KqDkp9+uYobra03ZQIXDcT4o5VlNRQRXgHlblLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Fi8pkn46; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02170664;
	Thu,  7 May 2026 14:48:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778158102;
	bh=uCCrW1U92dqWbmnBBY6h8Zb8c0wIqEXAaHnw8hKa2LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fi8pkn46bt3N+jaJaRi2e0w/YmbjrlY66XcQvruPCIxYFy/jdbUNWPYhnQP6zHGSk
	 +3oNyAUAhgNDlvXsHFUloXSSl2KX2E0a25DdqAI6aiBmqMenwWLxwDd82CshvKvNPB
	 jLnNpp5p0Hv4N9aqkCstDXnXFFKnSW6qTtafcFKo=
Date: Thu, 7 May 2026 14:48:23 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 2/2] media: mc-entity: Drop ifdef for
 media_entity_cleanup definition
Message-ID: <afyJk_qcsuTt8gxf@zed>
References: <20260506165438.1767378-1-laurent.pinchart@ideasonboard.com>
 <20260506165438.1767378-2-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260506165438.1767378-2-laurent.pinchart@ideasonboard.com>
X-Rspamd-Queue-Id: 0729B4E870C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60793-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Hi Laurent

On Wed, May 06, 2026 at 07:54:38PM +0300, Laurent Pinchart wrote:
> The media_entity_cleanup() function is defined in media-entity.h as a
> static inline no-op when CONFIG_MEDIA_CONTROLLER is enabled, and as a
> no-op macro otherwise. This complexity is unneeded. Use a static inline
> function in all cases.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  include/media/media-entity.h | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 904f61c14dc1..d9b72cd87d52 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -729,11 +729,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>   * zeroed but that has not been initialized with media_entity_pads_init() is
>   * valid and is a no-op.

I wonder if the documentation really applies

 * Calling media_entity_cleanup() on a media_entity whose memory has been
 * zeroed but that has not been initialized with media_entity_pad_init() is
 * valid and is a no-op.

But a few lines above it says

 * This function must be called during the cleanup phase after unregistering
 * the entity (currently, it does nothing).

Not that the documentation is wrong, but if the functions is a nop, of
course it is valid to call it on non initialized entities :)

>   */
> -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> -static inline void media_entity_cleanup(struct media_entity *entity) {}
> -#else
> -#define media_entity_cleanup(entity) do { } while (false)
> -#endif
> +static inline void media_entity_cleanup(struct media_entity *entity)
> +{
> +}

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
>  /**
>   * media_get_pad_index() - retrieves a pad index from an entity
> --
> Regards,
>
> Laurent Pinchart
>
>

