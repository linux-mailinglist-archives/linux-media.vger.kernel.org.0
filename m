Return-Path: <linux-media+bounces-66193-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xJFCAkr1RGoV4AoAu9opvQ
	(envelope-from <linux-media+bounces-66193-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 13:08:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8106EC939
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 13:08:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=gFxGPz6u;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66193-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66193-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5D7630D04E7
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 11:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294F5449EC2;
	Wed,  1 Jul 2026 11:03:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38A843E48B
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 11:03:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903790; cv=none; b=gHZIxfEmmTs58EvCGsYMmeSZ/0EfSjBfHr4MhJbJ0C7x+CBAF2ciRIiW/ZglVg7graW8na/VUW+MCIE4kbNL5UhGIcSteERmuKipK3vgAPFC/kUF1HFDpjYvqobdpr5SXCP9AlkiD/6MBNrKOSEM/RkZgVtI7Zroc43Pq/BRhLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903790; c=relaxed/simple;
	bh=CW1sBGcXapxAElV48j+/oQiG1BhCRHnqzbDsyoNg1wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3QhatwEVh8j8/8M8oDPl3ZySyVduZCFBMoyk2wqfcvToBzJnHteiVWVtDnup3mhfkjrXkkosVqGjXuTF3LKQxVHUn72AEyCpFn6z5cHFLnUREkL8sS0rxE0LE1CYEHjWfd/JaPt8q+VxK4KFOawRkzWUAFBRGsT0xRVvHhJqds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gFxGPz6u; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (mob-109-113-102-68.net.vodafone.it [109.113.102.68])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAACA1E48;
	Wed,  1 Jul 2026 13:02:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782903741;
	bh=CW1sBGcXapxAElV48j+/oQiG1BhCRHnqzbDsyoNg1wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gFxGPz6uV9LduFogwd4ZDrdTq3mYGuN0KYUTjR7PZJROdU3ooyo9l0tOR1uyZ3/Ke
	 kvhQhHBgpwbNqRnTL9d8cKqa5BPI6NBrkK0yJIi3OxzB0m7dVlWLH7WvB5FLgDsD4Y
	 nX9+RSsH5zCpP4JrRN/WdNL5rIObLngrDkyhu5qE=
Date: Wed, 1 Jul 2026 13:03:01 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: sashiko-reviews@lists.linux.dev
Cc: David Carlier <devnexen@gmail.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: fix dropped last AEC histogram zone
 weight
Message-ID: <akTwVMepaJ8HgEgj@zed>
References: <20260602185305.30759-1-devnexen@gmail.com>
 <20260602190943.1B01E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260602190943.1B01E1F00893@smtp.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66193-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:devnexen@gmail.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D8106EC939

Hi David

On Tue, Jun 02, 2026 at 07:09:42PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [Medium] Endianness bug places the last AEC histogram zone weight in the wrong hardware register byte on big-endian architectures.
>
> Pre-existing issues:
> - [High] Casting the unaligned `zone_weights` byte array to `u32 *` causes undefined behavior and alignment faults.
> --
>
> commit 731a31e43f59014f133f6c66b9d8861ce15cfc76
> Author: David Carlier <devnexen@gmail.com>
>
> media: mali-c55: fix dropped last AEC histogram zone weight
>
> The 15x15 AEC histogram metering grid has 225 per-zone weights, packed
> by userspace as a u8 array. The driver writes the first 56 registers
> (zones 0 through 223) in a loop, then handles the final register on its
> own to keep static analysers from flagging the array access.
>
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > index de0e9d898db7b..33e2232ec8f5b 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > @@ -212,6 +212,7 @@ mali_c55_params_aexp_hist_weights(struct mali_c55 *mali_c55,
>
> [ ... ]
>
> >  	for (unsigned int i = 0; i < 56; i++) {
> >  		val = ((u32 *)params->zone_weights)[i]
> >  			    & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but could this cast in
> mali_c55_params_aexp_hist_weights() in
> drivers/media/platform/arm/mali-c55/mali-c55-params.c trigger an alignment
> fault on strict architectures?
>
> The zone_weights array is located at offset 10 within struct
> mali_c55_params_aexp_weights. Because the configuration block resides at a
> 4-byte aligned offset within the V4L2 buffer, the zone_weights array starts
> at an address that is only 2-byte aligned.
>
> Casting this unaligned pointer to a 32-bit pointer and dereferencing it
> inside the loop triggers undefined behavior in C. On strict architectures
> like ARM with SCTLR.A enabled, or when auto-vectorized by the compiler,
> this can trigger kernel alignment faults.

This comment from the bot, even if not severe as it think it is,
actually identifies a possible issue.

As far as I can read unaligned access to device memory doesn't cause a
fault on ARMv8 but it is not guaranteed to be atomic and will be
realized by multiple loads (I'm sure it's more complicated than this ...)

Would you be interested in addressing the above comment and send a
patch to access params->zone_weights as a u8 * ?

