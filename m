Return-Path: <linux-media+bounces-65240-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MTlTHu2TNGqlbwYAu9opvQ
	(envelope-from <linux-media+bounces-65240-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 02:57:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5676A377B
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 02:57:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OM+BC4Kk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65240-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65240-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A93F31F5339
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 00:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0BD332601;
	Fri, 19 Jun 2026 00:35:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10CA331EB6;
	Fri, 19 Jun 2026 00:35:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781829354; cv=none; b=k/QPAANmw9C6ZfHUozXJ+tK7nU2HAd1wqE+rIdBJGofLrLqRd0lnwYanRQ74GDCvwo6jXIjpjK/0G+AGc2VpRIEZf/s+6eSzSLH4yVoGOqkyYT7yN9n+s1zlEprL8CUEN7OmCBgxNU5rugdWkIa46vU2pBNqq3s0yP96KUrKueE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781829354; c=relaxed/simple;
	bh=/HjymnnSQHHmFza/byuBCqnDeLVFGzEr4N2lZ3LC8Nk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=OdhPzzAVAbxOTyIEMZqX4aCP39XLJI2SXhmVIcUopQJUOaByEkub5jZt0YiA2axfaOUOAnoXIG0bvUUIzGfPy0iu6L3U9u8ue+hRdGy2i4VxNlCcRkmquKgGi2+/qagY4ueUbxiHxr1zyfU2UAZDl93pIizElOuqe6PvWFBaCio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OM+BC4Kk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4835C1F000E9;
	Fri, 19 Jun 2026 00:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781829353;
	bh=1E6gLa3V/ocAXqJ3SbGoHfotayBL3wGar6E0nTJmo/o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=OM+BC4KkaLRQjP1AdJUKMnN4x605k7zMZK5WOJYZRW/Rdy38z0nRz3dS0RLvmD5S8
	 HzZ5lzRV48lyC0oZ77DuaLBMYMpIa3cX9zChU3gQhcF50LQi/r6WX5V3YFN1M+a3Fg
	 QhkwNrLjzIa+Y9I4dWQYLC8jSXnGbtZQw3TpVhpsk+H2bHyD/LLJWTuHxLTw9zGEoh
	 gt8BvHfQF4fdqVH5jOnUYTT7WEs5uB5TFWe8l5N77OlJ7wqcdyO/ODYMEPXBp+bjwu
	 YsXswKT4pxOOPm+zBna70zKzG/uxvU4NZWxOXXfMb2LgGgF1vDrPHVdHZHMAotNA6n
	 pil6dBhXJsqmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C71523A56772;
	Fri, 19 Jun 2026 00:35:47 +0000 (UTC)
Subject: Re: [GIT PULL for v7.2] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260618233827.582d50a8@foz.lan>
References: <20260618233827.582d50a8@foz.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260618233827.582d50a8@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.2-1
X-PR-Tracked-Commit-Id: 06cb687a5132fcffe624c0070576ab852ac6b568
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8c13415c8a4383447c21ec832b20b3b283f0e01a
Message-Id: <178182934638.3132651.5441887166326044530.pr-tracker-bot@kernel.org>
Date: Fri, 19 Jun 2026 00:35:46 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-65240-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab+huawei@kernel.org,m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:akpm@linux-foundation.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC5676A377B

The pull request you sent on Thu, 18 Jun 2026 23:38:27 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.2-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8c13415c8a4383447c21ec832b20b3b283f0e01a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

