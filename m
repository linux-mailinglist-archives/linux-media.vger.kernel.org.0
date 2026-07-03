Return-Path: <linux-media+bounces-66442-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sACrJMaER2rxZwAAu9opvQ
	(envelope-from <linux-media+bounces-66442-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 11:45:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A941700C81
	for <lists+linux-media@lfdr.de>; Fri, 03 Jul 2026 11:45:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=DivOXUSE;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66442-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66442-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D3CCA303A523
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2026 09:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C517D3B42E8;
	Fri,  3 Jul 2026 09:44:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC578340A47;
	Fri,  3 Jul 2026 09:44:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071878; cv=none; b=sZ5Wd/XQ2HVs6VR1TmHIdiF57E12gWIdd3WBrSq5KfVNFsAnXZa1kAlhSI2fPumxlerVz28mIXUWHFu3ZSKgYwOLE17um6a1Jx7PbVZvF6HSwzde/Xz993DOfnzrhipfYf/w7cplHEBnAn0SsNwindBMLRF5UM5qv1nUkecw/Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071878; c=relaxed/simple;
	bh=ZjhvadNvTSW12MtYoIuRX/fCNEhpw2nPRE+0E6R3oEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyiR8EjFmRscXXOJk4hyiY26WgY0z6fOeaTWb3d7eIvbkXnHAMt7Kn9lW9jhW+GFnuSnnMuaZOJrL0QGohrIln5r4qPf0t/7QDbMRUDnmK4jOMxd8ze6rJpACe5HZzFWsS5otrZG80YYpUAeljJcOsJWegJzLV/vtz8diaAMlAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DivOXUSE; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 109D41121;
	Fri,  3 Jul 2026 11:43:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783071829;
	bh=ZjhvadNvTSW12MtYoIuRX/fCNEhpw2nPRE+0E6R3oEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DivOXUSEik0OMEFq7ANI8JJDiVk3rRZC886RYB5cOl9/7zALSbSEyKhEBrDUHv2cB
	 VDCYf5+Apb2nb/+qVyn+AxDOUHtLNMFljq7U4vn08d2cIaZ8fv42JZmIinbAErMmp8
	 0pEq2se7BHO5L5Ubu2dCwbVGwycSlHBvQC5+zz78=
Date: Fri, 3 Jul 2026 11:44:31 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Carlier <devnexen@gmail.com>
Cc: dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Fix unaligned access of AEC histogram
 zone weights
Message-ID: <akd8E5jr722oTm49@zed>
References: <20260702103453.348056-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702103453.348056-1-devnexen@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66442-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:devnexen@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:from_mime,ideasonboard.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A941700C81

Hi David,
   thanks for sending a patch to address this issue

On Thu, Jul 02, 2026 at 11:34:53AM +0100, David Carlier wrote:
> mali_c55_params_aexp_hist_weights() packs the 225 per-zone u8 weights
> into the ISP registers four at a time by casting the zone_weights array
> to u32 and dereferencing it. The array sits at offset 10 within the
> parameter block, so it is only 2-byte aligned: the u32 access is
> unaligned, which is undefined behaviour and can fault on strict-align
> configurations or once the loop is auto-vectorised.

well, I don't there is a risk of undefined behaviour on ARMv8, it's
just less efficient

>
> The cast also reads the four weights in host byte order before they are
> written to the little-endian register, so on big-endian hosts the four
> weights packed into each register end up in the wrong byte lanes.

Also we don't have any endianess issue as the IP is only found on
little endian systems

>
> Read the weights with get_unaligned_le32() instead, which is both
> alignment-safe and fixes the byte order regardless of host endianness.
>

mmm, I read in Documentation/core-api/unaligned-memory-access.rst
that:

------------------------------------------------------------------------------
	u32 value = get_unaligned((u32 *) data);

These macros work for memory accesses of any length (not just 32 bits as
in the examples above). Be aware that when compared to standard access of
aligned memory, using these macros to access unaligned memory can be costly in
terms of performance.

If use of such macros is not convenient, another option is to use memcpy(),
where the source or destination (or both) are of type u8* or unsigned char*.
Due to the byte-wise nature of this operation, unaligned accesses are avoided.
------------------------------------------------------------------------------

Which seems to suggest, if the issue here is performances, we should
aim for something different ? (honest question here, any kind of
guidance is appreciated)

> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Cc: stable@vger.kernel.org

If it's only about performances, does this qualifies as a fix ?

> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-params.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> index de0e9d898..1aaf64dde 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -6,6 +6,7 @@
>   */
>  #include <linux/media/arm/mali-c55-config.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/unaligned.h>
>
>  #include <media/media-entity.h>
>  #include <media/v4l2-dev.h>
> @@ -203,7 +204,7 @@ mali_c55_params_aexp_hist_weights(struct mali_c55 *mali_c55,
>  	 * of overwriting other registers.
>  	 */
>  	for (unsigned int i = 0; i < 56; i++) {
> -		val = ((u32 *)params->zone_weights)[i]
> +		val = get_unaligned_le32(&params->zone_weights[i * 4])
>  			    & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK;


We could do:

        memcpy(&val, &params->zone_weights[4 * i], 4);
        addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);

        mali_c55_ctx_write(mali_c55, addr,
                           val & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK);

Or this could be an alternative:

        const u8 *w = &params->zone_weights[4 * i];

        val = w[0] | w[1] << 8 | w[2] << 16 | w[3] << 24;
        addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);

        mali_c55_ctx_write(mali_c55, addr,
                           val & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK);

What do you think ?

>  		addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
>
> --
> 2.53.0
>
>

