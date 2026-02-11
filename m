Return-Path: <linux-media+bounces-52621-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NOhnLGzmjGnquwAAu9opvQ
	(envelope-from <linux-media+bounces-52621-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 21:28:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D042012761A
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 21:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 018463006822
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 20:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D0B63587BB;
	Wed, 11 Feb 2026 20:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/xCHXuv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F49359FB1;
	Wed, 11 Feb 2026 20:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770841685; cv=none; b=AsSQ1S7h1qW6nnM3xB3csMbjtK1eqwsWjCYJESWsSXNPFP1soWstAP+sh7El1HBjmM23H1ogTZ7uEkKh2+92fEWNkHwtWWgQHOsKO/Z1a99ShrBIigd6mscXn/BhJuMKgP7Ln88uIAThjg/KyQ4FuZwv4xH/GmexJ4//UNfoC6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770841685; c=relaxed/simple;
	bh=uUesuSGfEOV2K8Phqkszko1R27NSlzyg/e13egjaxSI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nGjj8GCJPmmgyBkN8ZrPuQSOa35SqFtojGSUiEZUwmWDwKj9xY7NxtBSB8faYDXP1BAxCld0e/lJ68YjzNgb24FC4+OZNb6pByBxKEarcQqDA/LxljZNcOxbI2EOBIN3tnTvuQe5IfuNfFVqW/P7JeBFxWWHbWML4oU6zJAM/Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/xCHXuv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C467C4CEF7;
	Wed, 11 Feb 2026 20:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770841685;
	bh=uUesuSGfEOV2K8Phqkszko1R27NSlzyg/e13egjaxSI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=O/xCHXuv9HhJPfD88KbjUW8brXRkpvJAgJ9ugqu7oWA+iDOBd84cO2DJotnQMRt4m
	 Uf4X2PFpkisaov0YMulMmurWKwqquus1Vdkls2P1lev0O8XbFaqo27gW9easvoYJkQ
	 x8N2zY7Tb7IWEhrNa32hdaGbxg4CeMlTO88oot2hYBztu5ly8rwB7/HEftnMmYmxOl
	 fz1O+AWGlVrZ/x1dHn9aXQ5sU+JJ/QnDN3RP5vluctLg2MYjEvjcy6itrqkr06ocDe
	 +DaAfpkh15eeaV33Pf1efIQ4b/iBjX1mYiAoVTZ45kdCZNZlZzo3YrbVnNbi1w0g7X
	 2SBugntVL7hIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 851DB39EF964;
	Wed, 11 Feb 2026 20:28:01 +0000 (UTC)
Subject: Re: [GIT PULL for v7.0] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260210194141.26d1eed4@foz.lan>
References: <20260210194141.26d1eed4@foz.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260210194141.26d1eed4@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.0-1
X-PR-Tracked-Commit-Id: 36eab90d3f4f4c38d1e9635af40cdd40c7675471
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4011e67a989b828cbf885131933d322dfe80f33a
Message-Id: <177084168015.710910.16630750026992708211.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 20:28:00 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52621-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D042012761A
X-Rspamd-Action: no action

The pull request you sent on Tue, 10 Feb 2026 19:41:41 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.0-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4011e67a989b828cbf885131933d322dfe80f33a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

