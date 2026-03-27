Return-Path: <linux-media+bounces-57374-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMKkGdYAx2lIRQUAu9opvQ
	(envelope-from <linux-media+bounces-57374-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:12:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C12A134BE7B
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 23:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80A4E3059F32
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 22:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B8539B484;
	Fri, 27 Mar 2026 22:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjE1lfkv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71C1611E;
	Fri, 27 Mar 2026 22:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774649468; cv=none; b=mO0M/yWA7dedbej3jhCE2+3huTjqYgOD+WH2r9+1PGLmfKtnWLEXf+xXrg4b7cUHSbKuDwIKE469tXfPVjy2EXIAUHSDMDipDrvy3Plwye4Utw3wOOOb3hqFD8JobxSp+mjXsOWNWd4HRtx+gzEt3RsSq5BOsbBSTGazKY570Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774649468; c=relaxed/simple;
	bh=8VJCRTG8WD3XC0KXW/cifyktDXB0cqBeZOPOfzSOUKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JC3BU+kQpSYFofgXJAQoNdRfUISzYBTN5bzthtd0xoZNp2DRZr78eG0dDe1yrxYJ2p2NT6YekXFTTmB7DtQ38Mik/862kGg+4j9/z0N5fPEJKw8RURUyvbQzVpD6qSM1/j867iiX5/Ks8EOsguX9aFroe6hz1LAAu5Ot0Va8Tps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjE1lfkv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70823C19423;
	Fri, 27 Mar 2026 22:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774649468;
	bh=8VJCRTG8WD3XC0KXW/cifyktDXB0cqBeZOPOfzSOUKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjE1lfkvrpWReQ0hAgpvoXUF2Zlu63xFrxXDZB83gcyWJL6gGM1MpplSdDZmGygUA
	 40yF0tziQsqDYqqdGKbVK+b8bpoLe2o/mhzN/X8JaOcAPpLT1Ti7z3LcdSx+TOrBmA
	 cQ+VvBm1k1TNIUu8W9bWzuLn41a9Uxoq00bRVy9gWF23wRiqMVdyiyPO8cTNkSmN95
	 QlkkQUi0MBe1vvHe91NY6Z8zKDljktggjCsniNgwl7TxcYg/1wAXEnm/hTkX/MKVLn
	 rtPhJY2YjJcPoExrucdCUOipDzVhqaDjNvalaWVY0TgeayzcYAO8puvbI3ITiOZzmB
	 CVxmt3Fi0bcuw==
Date: Fri, 27 Mar 2026 23:11:02 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Brian Cain <bcain@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hexagon@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] media: rockchip: Disable VIDEO_ROCKCHIP_VDEC when
 compile testing for Hexagon
Message-ID: <20260327221102.GA3621310@ax162>
References: <20260213-media-disable-rockchip-vdec-hexagon-v1-1-3f903398cc83@kernel.org>
 <90e62bf797b0532e5556adaf9e15cc7b73e18411.camel@ndufresne.ca>
 <1a618af9b6c311e8fe5db64ff6fb7c1872c7b2b6.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a618af9b6c311e8fe5db64ff6fb7c1872c7b2b6.camel@ndufresne.ca>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57374-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,vanguardiasur.com.ar,kernel.org,sntech.de,gmail.com,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C12A134BE7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 04:08:29PM -0400, Nicolas Dufresne wrote:
> I haven't heard back about the port to plain bitwriter. I guess I have to pick
> this patch, but I really don't want to have to maintain too many of these hacks.
> Anyone else with an opinion on the topic ? Or a better idea how this can be
> workaround differently ?

I ended up retesting this recently after I saw Denis posted a bitwriter
series and it turns out that Arnd's commit 446c6a25a449 ("media: rkvdec:
reduce excessive stack usage in assemble_hw_pps()") is enough to avoid
this issue, so you can disregard this change.

Cheers,
Nathan

