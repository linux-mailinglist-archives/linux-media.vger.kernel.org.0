Return-Path: <linux-media+bounces-63879-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uw2RGauJImqCZwEAu9opvQ
	(envelope-from <linux-media+bounces-63879-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 10:32:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B71B66466BD
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 10:32:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=LLMLXkIn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63879-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63879-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C6373023507
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 08:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31C93C4B8D;
	Fri,  5 Jun 2026 08:20:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CBD3BED38
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 08:20:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780647610; cv=none; b=qeceDvjAXJahis3+PBCou3/haLJYRO04XYsyTcL+cMNWkQtRm4W3omdL5xYmP8CwcSVX6OqgDOzW6yV7i5w+7EVZKTpfqz8H8JDOlOYINfHAJDXC/hsT8RrN05KJL0vN806A4Q5j5ReEwTsP18ZQTh+w6RVtmJuGL2Yn39zMc3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780647610; c=relaxed/simple;
	bh=NM1QJf3fVxs9p6QwUlUxlSPsn33ctRJqsjFp4DAx28Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4rKdPyzHnc6kStImGNHLP3YgMU+xd0/CpIe7MazXkbQYSv2iZ9x4+Wmykbc8Z1hvPcRV3y+0x4Z9GuH6notAP20vsYY9sgdtfW9mT5+tdLS32Y0HzIg0qSUtUN27dgFoHkSiSwdt2dLuS3VUqYqWFGyWBtxOouXt8h1q20FsoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LLMLXkIn; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71A7C5B3;
	Fri,  5 Jun 2026 10:19:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780647582;
	bh=NM1QJf3fVxs9p6QwUlUxlSPsn33ctRJqsjFp4DAx28Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LLMLXkInFY92KE5SdA+ypnj86FMYdSyNQWbaC+xzMufgqssYRFaQ2ofJw1YDtHXVK
	 GDM67QAdTgzps34DZ5OXHpKj7EFMpt20whjba7YSbUNVleKZvW5i8Mtrdtok/B+aVl
	 EEOQLjWokNu5ckjCQ1QwUPetMA80cFVs4C6V36j8=
Date: Fri, 5 Jun 2026 10:20:04 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: sashiko-reviews@lists.linux.dev
Cc: David Carlier <devnexen@gmail.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: fix dropped last AEC histogram zone
 weight
Message-ID: <aiKFe663aC8uuOPD@zed>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260602190943.1B01E1F00893@smtp.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63879-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zed:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:from_mime,ideasonboard.com:dkim,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B71B66466BD

Hi Sashiko

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

I'm a bit surprised because I thought the compiler was meant to insert
padding to align the 'zone_weights' member to a 4 bytes boundary, but
as 'zone_weights' is a u8 pointer, it is stored unaligned.

pahole confirms this:

struct mali_c55_params_aexp_weights {
	struct v4l2_isp_params_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u8                       nodes_used_horiz;     /*     8     1 */
	__u8                       nodes_used_vert;      /*     9     1 */
	__u8                       zone_weights[225];    /*    10   225 */

	/* size: 240, cachelines: 4, members: 4 */
	/* padding: 5 */
	/* forced alignments: 1 */
	/* last cacheline: 48 bytes */
} __attribute__((__aligned__(8)));

>
> Casting this unaligned pointer to a 32-bit pointer and dereferencing it
> inside the loop triggers undefined behavior in C. On strict architectures
> like ARM with SCTLR.A enabled, or when auto-vectorized by the compiler,
> this can trigger kernel alignment faults.

This code only runs on ARMv8 where I read unaligned access is
permitted but less efficient ?

>
> Because userspace controls the V4L2 configuration buffer, can an
> unprivileged user use this to trigger a kernel oops and cause a local denial
> of service?

No I don't think so, the uABI is fixed userspace cannot modify its
layout.

I do however think it would be worth fixing the above loop to access
'zone_weigths' as a u8 * ?

>
> >  		addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
> >
> >  		mali_c55_ctx_write(mali_c55, addr, val);
> >  	}
> >
> >  	val = params->zone_weights[MALI_C55_MAX_ZONES - 1];
> >  	addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * 56);
> > +	mali_c55_ctx_write(mali_c55, addr, val & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK);
>
> [Severity: Medium]
> Is there an endianness issue on big-endian platforms when extracting this
> weight as an 8-bit value and implicitly zero-extending it to a 32-bit
> integer in mali_c55_params_aexp_hist_weights()?
>
> The original loop processes 4 weights at a time by reading them as a 32-bit
> integer and writing that to the memory-backed ctx->registers array. This
> preserves the byte stream natively on both architectures.
>
> However, extracting the final 225th weight as an 8-bit value zero-extends
> it to a 32-bit integer like 0x0000000E. On big-endian systems, storing this
> 32-bit value natively places the numeric value at the highest byte address
> of the 32-bit word (byte offset 3).
>
> When memcpy_toio() flushes this to the device, will the hardware receive
> the weight in the 4th byte of the register instead of the 1st byte (offset 0)
> as it expects, silently corrupting the auto-exposure metering weight?
>
> >  }
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260602185305.30759-1-devnexen@gmail.com?part=1
>

