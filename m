Return-Path: <linux-media+bounces-57633-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IplBmSHymn09gUAu9opvQ
	(envelope-from <linux-media+bounces-57633-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:23:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7040435CBFC
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42E78304003F
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AAB3A3819;
	Mon, 30 Mar 2026 14:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWSBCbWl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A70F23AE62
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 14:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880215; cv=none; b=mKQ79BKhE7vqx1jllaeOYIevDIlsnP7FUwh1jUcYaiDIgDXjmnylTBmGIAgJtqRTKu5J3uhXB/oEXo1tqj5Yu3WlbgO/CHKbeRCavgmW3XC9dBj6rIrqMT8j61UzHGNIRaeJlRZ9tRopUHV651yjRL1kEGEmOzNk1iSgwbwwW84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880215; c=relaxed/simple;
	bh=g40npTkNZ0MCJPQZsXTzV5Dzhy+tMSC8ojjYJdg1RMM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLMdUljTwEESOA2k5zp6qBZWG6fyJ3kH96T9eiR+5l4RgRs6VDR1P1AF9LlRu+WAGwG5qGy8arxm65rkkmXJZoYQBPA5VcSIMcCnnD3/FuM+1/vS/7OrqrX39PQx/Yq3VlpQ7fODJ8copmja20VpbMRQ+RLxUHQoE7Z2UhvJCjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWSBCbWl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0512DC4CEF7
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 14:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774880215;
	bh=g40npTkNZ0MCJPQZsXTzV5Dzhy+tMSC8ojjYJdg1RMM=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=MWSBCbWl4ntiQC8DWEru15Hi0kACr5xuhAFan2XHybqIYVe0zgRKOVf/ClmBGKzpx
	 p1IsITEr57iltMffKgqkw8CmjgLtqBcN0pdINE+tsujYuhLUM4psra8Ygtu52rAcAs
	 L+qD8a9or6QSceX1SaUETgrdlAYMvzN+LZjkuhIVFr5zIstscHmRC+6GB27Hd/IcG3
	 xVEpQkzK1KguLcDoKGQVOQOyXWwpvBu0+UFmIxdgdRglxL78HVS5uORIkyHWtANLV7
	 fiTd+AXreYZRmI+eZGJ5Taq65v/EoOyIq7RrmYto6t+6NF3iXTv4XjC7hPfzJnpqhJ
	 fG0W15XDwgCyw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w7DQC-00000007DnG-39Wu
	for linux-media@vger.kernel.org;
	Mon, 30 Mar 2026 16:16:52 +0200
Date: Mon, 30 Mar 2026 16:16:52 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-media@vger.kernel.org
Subject: Re: [0/6] media: refactor USB endpoint lookups
Message-ID: <acqF1CyUUy2E_MoK@hovoldconsulting.com>
References: <20260330101141.1664143-1-johan@kernel.org>
 <69ca8460.050a0220.acff7.105a@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69ca8460.050a0220.acff7.105a@mx.google.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57633-lists,linux-media=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 7040435CBFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 07:10:40AM -0700, Patchwork Integration wrote:

> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test checkpatch:./0005-media-hdpvr-refactor-endpoint-lookup.patch checkpatch
> CHECK: Avoid CamelCase: <bulk_in_endpointAddr>
> #62: FILE: drivers/media/usb/hdpvr/hdpvr-core.c:331:
> +dev->bulk_in_endpointAddr = endpoint->bEndpointAddress;
> 
> total: 0 errors, 0 warnings, 1 checks, 46 lines checked
> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.

> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.

Checkpatch is complaining about an existing issue in the driver so this
bot warning is not valid.

Johan

