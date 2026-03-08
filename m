Return-Path: <linux-media+bounces-54868-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xh0+GW9RrWmX1QEAu9opvQ
	(envelope-from <linux-media+bounces-54868-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 11:37:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD97422F55C
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 11:37:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62AD53010D81
	for <lists+linux-media@lfdr.de>; Sun,  8 Mar 2026 10:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E2C35A39E;
	Sun,  8 Mar 2026 10:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iy9hxe6B"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DB036CE02
	for <linux-media@vger.kernel.org>; Sun,  8 Mar 2026 10:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772966248; cv=none; b=K7fskRY8KcTvKG1HM9R1bu+V14WeeryoOJtELxdVrGJiKv3nVZoCTnpaQjRHw7Uaj75m6BWvFXd5LbWoeb23WpP9SjcWjYI0RiD8cCLjA+5b6rvZKuirocDN1H680A6JaMzqtA8XvCoVJuFB40pNF5Kotn7/1Dr1FX7o8uGQois=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772966248; c=relaxed/simple;
	bh=u6+x+f8fGwolCnOMxi6+xqCNa/Jf5dz8ORfipZW6m+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWfJN0yoErVIAkFvB6EBOcYBjOCLT/Esu3X6IUUtlo79F/v5vbU9G2caJltBslM2sJAICshaew5Ib+XDytd607XzYD9PMufOAefQnXSwrXRqEfd4tG8YyS1GpBflZICK+s3J9aHaHYf1PSrZTStzwq7GNMcNqohvJQRXtVrRabM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iy9hxe6B; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (ip-185-104-138-189.ptr.icomera.net [185.104.138.189])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B18E878C;
	Sun,  8 Mar 2026 11:36:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772966171;
	bh=u6+x+f8fGwolCnOMxi6+xqCNa/Jf5dz8ORfipZW6m+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iy9hxe6BWYZgSUOQWF2po0sp0K2BnaIl0hN1moAUH360vR/RR2cdxknp0JlF7Phaa
	 WQi/IdDs5UE81eDAZXt2FeH8H2XGTfuDPr7xqvfEDp2BgTTyx+WRa6o0O4+H07nnha
	 rh9qL29BvpsSk9m5EBHCGbMGClC3+2ZdHRQmpSRs=
Date: Sun, 8 Mar 2026 11:37:14 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: David Dull <monderasdor@gmail.com>
Cc: jai.luthra@ideasonboard.com, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 06/10] media: Replace void * with video_device_state *
 in all driver ioctl implementations
Message-ID: <20260308103714.GA430878@killaraus.ideasonboard.com>
References: <20250919-vdev-state-v2-6-b2c42426965c@ideasonboard.com>
 <20260307194952.1866-1-monderasdor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260307194952.1866-1-monderasdor@gmail.com>
X-Rspamd-Queue-Id: AD97422F55C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_FROM(0.00)[bounces-54868-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.957];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Sat, Mar 07, 2026 at 09:49:52PM +0200, David Dull wrote:
> Hi Jai,
> 
> This patch is too large to be reasonably reviewable in its current form.

This review is too generated by LLMs to be actionable in its current
form.

> The stated change is conceptually simple: replace the opaque `void *priv`
> argument with `struct video_device_state *state` in V4L2 ioctl
> implementations. However, this single patch touches hundreds of files
> across drivers, helpers, framework code, staging code, and public
> headers. That makes it extremely difficult to validate correctness,
> spot exceptions, and reason about regressions from mailing list review
> alone.
> 
> A few issues stand out:
> 
> 1. Patch granularity
> 
>    This should not be one monolithic patch. At minimum it should be
>    split into:
> 
>    - core/framework changes
>    - helper conversions
>    - driver conversions by subsystem or directory class
>    - staging/test-driver conversions separately
> 
>    Right now the size alone makes meaningful review and bisection much
>    worse than it needs to be.
> 
> 2. Mechanical conversion claim vs. manual exceptions
> 
>    The changelog says most changes were automated with Coccinelle,
>    while function signature updates in headers and edge cases were
>    handled manually. That is exactly why this needs splitting.
>    Mechanical treewide conversions are one thing; manual edge-case
>    handling is where subtle semantic mistakes tend to hide.
> 
> 3. API conversion proof is missing
> 
>    If this is primarily a scripted transformation, the review should
>    center on the semantic patch and on proving there are no remaining
>    mismatches.
> 
>    Please include:
> 
>    - the Coccinelle script as a separate patch or in the cover letter
>    - a summary of what could not be converted automatically
>    - a treewide grep result showing there are no remaining ioctl
>      prototypes using `void *priv` where
>      `struct video_device_state *state` is now required
> 
> 4. Conversion consistency
> 
>    Several call sites now rename the parameter to `state` but continue
>    to use it only as a positional placeholder, which is fine
>    mechanically, but the patch should avoid mixing semantic conversion
>    with opportunistic cleanup. Formatting-only churn and spacing
>    adjustments should be kept to the minimum necessary for the
>    signature change.
> 
> 5. Risk concentration
> 
>    This patch touches both framework headers and many driver
>    implementations in the same changeset. That amplifies the blast
>    radius of any mistake and makes it harder to tell whether a
>    reported regression belongs to the API change itself or to one of
>    the driver-side edits.
> 
> 6. Reviewability for maintainers
> 
>    The CC list spans a large number of maintainers and mailing lists.
>    That is appropriate for notification, but not a substitute for
>    reviewable patch structure. Individual maintainers should not have
>    to sift through a large treewide refactor to find the parts that
>    affect their drivers.
> 
> Please respin this as a structured series with the mechanical
> transformation isolated from the framework changes and with a clear
> accounting of manual fixups and exceptions.
> 
> As it stands, I do not think this patch is reviewable in one piece.
> 
> Acked By : David Dull

-- 
Regards,

Laurent Pinchart

