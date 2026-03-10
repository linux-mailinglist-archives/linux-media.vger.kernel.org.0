Return-Path: <linux-media+bounces-55052-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFprAvfYr2kLdAIAu9opvQ
	(envelope-from <linux-media+bounces-55052-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:40:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A092476E8
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 09:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEC98308530B
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 08:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B35A42E009;
	Tue, 10 Mar 2026 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ggaDS2fk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33549247280
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132005; cv=none; b=ijLnyKeVIhtIbbR53yxXrZURgQrFZXEjKOchb3he65ra2Giu/9zanH69vHetRVfH5TQsSdGZ87sxcG+DLpWn+01hRZM4mQIMvUSfrEXi0gJ11+yFJm4yid9RcKdK1wuzIv3a3FrLFsCP3UUvCb8QL7SHmWCMapZWrPnCpgbcL+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132005; c=relaxed/simple;
	bh=adlG5LQV9VapFOuuDbKRNxW5HEuq87BsJ+MPrVXdcWs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnpspd3kkYBu/vnLKWccFTKoZilPp53Xm4qwFV4GJ4Bb3YEnSLNxdJ4laVIkcmTxMVwaktCaDwQITBysYPeljSpCjwks1h4qtBGlavaewDMi6FlBv+Q3A/rILSWKse9pubskk+pBD6eEqzyVTGG4BuxdoekCkMHk0hzKPv/KwCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ggaDS2fk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBCBC19423
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773132004;
	bh=adlG5LQV9VapFOuuDbKRNxW5HEuq87BsJ+MPrVXdcWs=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=ggaDS2fkWrQGQ7YzWwtyCghNChj9PZagLLmKgxD5esbPJeEd9oMemeKad0HEglgfT
	 /YziAIoEwsDygnqobF6XyHlo9f/99/Q4FY94tpi1YYLonGbTyko9UecINcZIWs65nu
	 fW0gOwVVd1xNrnb3qpz9h04lPlSKtaoM1O7GTqbX34H3FyUolfQXvklgMwE3Im2VRD
	 uunEyPszfpl7yvQrdeBpolE7J49LEvV8bj4Y8y2BkKJwJAiQmVmHYkTmyPdPzgXNp7
	 WrdpARO3ObzDs69yfs62e03eRVShqQNsrI8vI3FmQVpjRI/GAKAesbLmh4mFGopZq3
	 flPUKPbECX9WA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vzsdG-0000000079W-0Tha
	for linux-media@vger.kernel.org;
	Tue, 10 Mar 2026 09:40:02 +0100
Date: Tue, 10 Mar 2026 09:40:02 +0100
From: Johan Hovold <johan@kernel.org>
To: linux-media@vger.kernel.org
Subject: Re: [0/4] media: drop redundant device references
Message-ID: <aa_Y4icAnfGpeEqS@hovoldconsulting.com>
References: <20260305103919.15560-1-johan@kernel.org>
 <69a98f03.050a0220.1fe09d.ec95@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69a98f03.050a0220.1fe09d.ec95@mx.google.com>
X-Rspamd-Queue-Id: 54A092476E8
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-55052-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[hovoldconsulting.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pages.freedesktop.org:url,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 06:11:15AM -0800, Patchwork Integration wrote:

> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:

> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/94563495/artifacts/report.htm .

> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.

Judging from the link above it looks like the CI robot encountered some
internal error:

	ssh tunnel: read tcp 10.128.0.5:56668->10.128.0.18:22: read: connection reset by peer (%!s(<nil>))

Can someone please override the robot?

Johan

