Return-Path: <linux-media+bounces-51860-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD3lNXC8fGlVOgIAu9opvQ
	(envelope-from <linux-media+bounces-51860-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 15:13:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42815BB7C3
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 15:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3365301F310
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 14:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B0031A80E;
	Fri, 30 Jan 2026 14:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZhU5taVu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14592D23A6
	for <linux-media@vger.kernel.org>; Fri, 30 Jan 2026 14:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769782269; cv=none; b=Ps8r3u+oCugLe/raIgrwjYclfDWnX69GEHBPafhgMf/uJKvhdIKAJOCRcBDDMHO8Iwdbp1JfsIaP1BzpgcFIABaeN8+0h/La7tXdc1352roFHWQt9in5tVuoS4C/Xt8HXb/5eQuThZuyLi2oq7WX5B1NQrRT1MyBQJbN46//CDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769782269; c=relaxed/simple;
	bh=telDLoJ8uhMe33p8498jqlP5nBJHLigdaLsPv5JBCys=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:Cc:
	 In-Reply-To:Content-Type; b=RsVdy+isMakM320bmnkgZ66HIRRT7Qu6DoUrGXLZ8dbVMftyaxSFy9osM3e4Zt7S6snp6IyH86emmfIuXMim5KTeGNHzZBcaRtRbh0GHqIIvcr4wtxRTjgmuP54pEaec1pLFmwuwKbVLhVHIn3ZtPNU5YYSXwd1xZ+EWOe1QrGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZhU5taVu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66C0C4CEF7;
	Fri, 30 Jan 2026 14:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769782269;
	bh=telDLoJ8uhMe33p8498jqlP5nBJHLigdaLsPv5JBCys=;
	h=Date:From:Subject:To:References:Cc:In-Reply-To:From;
	b=ZhU5taVuyW/EullBFsmFuF0Wz6uupigz/QmzqM8WVGv5xSX0r+VbdYD95fCsYJ9RQ
	 ziVoQTaW4O0gFN9fKqJM+SZrhGeFV47wm0GwPuSAR5/9ECppag+oF9gUJczIETNqc8
	 t4mKsLY5JyEjwW0XzXjLp6T0AwFddQP5f1KiAC3CYAtZDeax5sJAmPx62dAMi1zW/n
	 FHsPM4mTiCMC6ubqwsID+ZDDlERYN67powXhcorjYghxz90hwTuH8h0TXUDkfstSM/
	 ysMqsiSHo8Qw1QCOCf9wBxQXyxoP1eG224Tz+NcyAZ+IWnTVcUD3WnviTZyBZ9kXkM
	 RtOUei6R/sN5A==
Message-ID: <27bad1ad-ec8e-4574-aafe-5fa9d3e8d057@kernel.org>
Date: Fri, 30 Jan 2026 15:11:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 0/2] edid-decode: ARVR parsers and DisplayID sanity checks
To: HAYOU YASSINE <yassine.hayou@gmail.com>
References: <CANAm-cducmYzMhLRz0Yf8CcC8i0yUjscZ6VgXycxJdU-e-JX4w@mail.gmail.com>
Content-Language: en-US, nl
Cc: linux-media@vger.kernel.org
In-Reply-To: <CANAm-cducmYzMhLRz0Yf8CcC8i0yUjscZ6VgXycxJdU-e-JX4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-51860-lists,linux-media=lfdr.de,cisco];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 42815BB7C3
X-Rspamd-Action: no action

Hi Yassine,

On 23/01/2026 16:26, HAYOU YASSINE wrote:
> Hi,
> 
> This patch series includes two improvements to edid-decode:
> 
> Patch 1/2: Implements full parsing for DisplayID 2.1 AR/VR data blocks
> - Tag 0x2c (ARVR_HMD): 79-byte block with optics, lens adjustment,
>   field of view, center of projection, and streams per layer fields
> - Tag 0x2d (ARVR_Layer): 20-byte block with HMD identification,
>   layer configuration, lens distortion, and scaling support
> - Includes comprehensive sanity checks for both blocks
> 
> Patch 2/2: Adds validation checks for DisplayID data blocks
> - Tag 0x20 (Product ID): Validates payload length, week range, and model year
> - Tag 0x21 (Display Parameters v2): Validates pixel format, chromaticity
>   coordinates, luminance information, and gamma EOTF range
> - Tag 0x22 (Type VII Timing): Validates pixel clock max, image dimensions max,
>   and negative blanking periods
> - Tag 0x24 (Type IX Timing): Validates image dimensions max and refresh rate max
> - Tag 0x25 (Dynamic Video Timing Range Limits): Validates pixel clock and
>   refresh rate ranges with revision-specific limits
> 
> These patches improve edid-decode's ability to parse and validate DisplayID
> data according to the VESA DisplayID Standard Version 2.1a, helping identify
> corrupted or invalid EDID data early and providing better error reporting
> for debugging display issues.
> 
> Please review.

I've been going over these patches, and they look good to me. Nice to see
this implemented.

Do you have an EDID that has the ARVR data blocks? If you do, then that
might be a good one to add to the data directory with example EDIDs.

If possible, I'd like to check the output with such an EDID first before I commit
the first patch.

Regards,

	Hans

> 
> Thanks,
> Yassine


