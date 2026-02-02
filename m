Return-Path: <linux-media+bounces-51996-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F4vLId+gGnE8wIAu9opvQ
	(envelope-from <linux-media+bounces-51996-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:37:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0165ACB125
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 11:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46BAB301E3FA
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 10:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF1A35A93B;
	Mon,  2 Feb 2026 10:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PQmGbK6y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ABD126BF1;
	Mon,  2 Feb 2026 10:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770028338; cv=none; b=UV4W6W648AVjrcUORCpguCwdGERanHDbGjbunr+x9XRmerRYF1y6Z5jKr7gbzTMHRBLbUOIW1j06yzsticYEGr9YVRuHp8J4TSC1SJ/WJJdQ79rMB0fNTFMs3YIAMeO+aPb4BWeGYRJd4rblwCxo9rT1db1YGyjugID/C7ANg3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770028338; c=relaxed/simple;
	bh=d6B8nYkLi107nAypdMuoWROzv1z04gurbxCpKLXrmdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxpejfLUBYvrEGF3A2HoObqavCnCBUxpthAuwDxX1S+Q7q6IpmgWoH7XpKlyrTI+/7jcf6iPNXypnuQYwCS7AXyrUX40+Ifij2rtHG5wOpi0y8IHS0s795ki1gCzyakb7J36qcIjhDz1sivK4kFEvCeo6Sm7NFKPGgdKnUbMsBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PQmGbK6y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F80C116C6;
	Mon,  2 Feb 2026 10:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770028338;
	bh=d6B8nYkLi107nAypdMuoWROzv1z04gurbxCpKLXrmdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQmGbK6yGvQva35wgA1rfoO0xZ+zc3oATw0HdiNKT71WKouJyPa5+NH31+AIQtGRe
	 MZF8H0lMWaXnPt/SczYlZemDNtbDCuK7MsNks9kTkFQwMB+8z5LW5+Ifr4bmNzOU2L
	 cqMPgPkyShRuFqPgtSzAtv6yB5MaNA9QvXE9hwyo=
Date: Mon, 2 Feb 2026 11:32:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bogdan Sandu <bogdanelsandu2011@gmail.com>
Cc: bingbu.cao@intel.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	tian.shu.qiu@intel.com
Subject: Re: [PATCH] Cleanup ipu3 driver
Message-ID: <2026020254-backyard-little-eb34@gregkh>
References: <2026020258-very-numbly-b36b@gregkh>
 <20260202102033.9642-2-bogdanelsandu2011@gmail.com>
 <20260202102033.9642-3-bogdanelsandu2011@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202102033.9642-3-bogdanelsandu2011@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-51996-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0165ACB125
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 12:18:44PM +0200, Bogdan Sandu wrote:
> Clean up warnings generated by ./scripts/checkpatch.pl regarding the ipu3 driver at /drivers/staging/media/ipu3
> 
> More specifically, the following files have been affected: ipu3-css.c, ipu3-mmu.c, ipu3-mmu.h, ipu3-v4l2.c, ipu3.c, ipu3.h
> 
> Signed-off-by: Bogdan Sandu <bogdanelsandu2011@gmail.com>
> ---
>  drivers/staging/media/ipu3/ipu3-css.c  | 39 ++++++++++++--------------
>  drivers/staging/media/ipu3/ipu3-mmu.c  |  2 +-
>  drivers/staging/media/ipu3/ipu3-mmu.h  |  4 ++-
>  drivers/staging/media/ipu3/ipu3-v4l2.c | 11 ++++----
>  drivers/staging/media/ipu3/ipu3.c      |  7 ++---
>  5 files changed, 30 insertions(+), 33 deletions(-)

You resent the same thing again?

confused,

greg k-h

