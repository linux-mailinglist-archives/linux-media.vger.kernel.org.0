Return-Path: <linux-media+bounces-58186-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K3IHab/1GnOzQcAu9opvQ
	(envelope-from <linux-media+bounces-58186-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 14:59:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 810E33AEC11
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 14:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 985E43069572
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 12:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C023B6340;
	Tue,  7 Apr 2026 12:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrDdTN70"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0522F60CC
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 12:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566648; cv=none; b=TxzNsv+Sp+zXILOyz3OIZCRuJG1oGT1cdPSAo2EDwps3OWCKn+2zNj4QtO/vLAzawNb1M2BodP+3RsS6zPo4EtW4ZtkV/JyHRELV8D+HwIv7oNxInvlzYNwG3xIgGGlytSZ+DRmTHoltWuaVEb8BpHAJY6AnIdF2nwf1r418otc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566648; c=relaxed/simple;
	bh=lOdPpWiqi9kKJWP9c1Z678x8d0toz24fVZQPsqjJaVc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Et/XtViF1qu6avEfIQyEfxhNJHRQC6r2+74FKDHh1Qi77ITzSG65Xwj4qW4nOYHZnBJJAhS/XPmAZfgT0DyHGfbzn/FwaXiUFuWZ5mPbOTR5vglxi9yqL01g0qAuemGCNz3UsMEu2eNmEko2malZ4rMOpRaRiMrD7f+QASgTzzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrDdTN70; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D76C116C6
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 12:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775566648;
	bh=lOdPpWiqi9kKJWP9c1Z678x8d0toz24fVZQPsqjJaVc=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=CrDdTN70VHecYPll54UPYbjpW9SeluzVLNT1jSid/QBnrYBVYUDyeewDkhK0zLRbG
	 divISf7xL3DTdMQW3S8BGCvuB/j69y+uwuaSeYBqGQqZZDGwBZBcCKHg+gmP41O0oQ
	 8r0nKWiZv2G3EQtnaJi/GL4uzs2Yc3rDRVsFjrdE8jABdAJHlQxg4+Gx3BvUSin+EV
	 cv3Zr/jHvMxEmX4MwAqkIhsN5c5CKoFE6j8Q2a3HKf2YKjO9MrIM7nqr+/hywISdpT
	 PX9/NcY8vx4vtUtFzwWrJlY9BYklL7066FBZ9yrGkZydO9fHqgPnv/xjxr0uEBP049
	 dw2BG1yrDvDKA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wA5zi-0000000BVyk-0GyZ
	for linux-media@vger.kernel.org;
	Tue, 07 Apr 2026 14:57:26 +0200
Date: Tue, 7 Apr 2026 14:57:26 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-media@vger.kernel.org
Subject: Re: media: vpif_capture: fix OF node reference imbalance
Message-ID: <adT_NtvQmxOXVagc@hovoldconsulting.com>
References: <20260407100831.2635227-1-johan@kernel.org>
 <69d4fe4e.050a0220.1c17af.bc90@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69d4fe4e.050a0220.1c17af.bc90@mx.google.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58186-lists,linux-media=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pages.freedesktop.org:url]
X-Rspamd-Queue-Id: 810E33AEC11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 05:53:34AM -0700, Patchwork Integration wrote:

> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:

> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/96942177/artifacts/report.htm .

> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.

It appears the media CI bot is still broken.

Johan

