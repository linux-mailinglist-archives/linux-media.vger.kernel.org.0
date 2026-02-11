Return-Path: <linux-media+bounces-52622-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJNADoPmjGnquwAAu9opvQ
	(envelope-from <linux-media+bounces-52622-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 21:28:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 470A1127621
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 21:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DCC1B30131DD
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 20:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD3F359718;
	Wed, 11 Feb 2026 20:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ki0TQHgy"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE8235B627;
	Wed, 11 Feb 2026 20:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770841687; cv=none; b=goXpm011bFq2+X4CgU3b5FzO1U/B/uVbvWwp7WWaKYgVkdTtamHgNNOvGeV+TwUnkW+U4I0nN6TZ6Dnf8xIa/4xF78l+HXMn6AycQfusxSble2awoh2kuF1neshKbioWhuqAXz7f35/wLfZlwg+Rl5O+oV7yZM+Coyw+/aY3vhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770841687; c=relaxed/simple;
	bh=sdjsNwMXKLWVXnAwOVKHtk4Vn+e2dUtiEANuggTW0S8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=KW7s/tqpynvYERrwoBKOz8AsuqybE1EMHMoDOpnnW+di9Ab2taUhsOacGXq4YzMXEoyUSA8s6x3sBwNSsU19HelcqQu/Q091mmZJOSPP0gevl5B38uUOeSzXu4wk9APzpDB6tETeoQuYCGeFC0oYQj6Zzu4eCEgvWwgB39qPFU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ki0TQHgy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EAEC4CEF7;
	Wed, 11 Feb 2026 20:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770841687;
	bh=sdjsNwMXKLWVXnAwOVKHtk4Vn+e2dUtiEANuggTW0S8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ki0TQHgy1CGEVapIrlivhlCXIdxL1DqMZ+JVIxfAIb75jwqC+182zN6FprnB3ZlMa
	 h1jTiXD8vqbUE+NLsljObu8elGHQPXJqxZ+nZQFJu5jMaitb7vUU4Hk91tEV4JUdwB
	 19OUqYKcvd/xJtqNyE0/Xh1R6XheF4+f33X8DAFmEntBiJ2StwOECsehDBkdHXTaYO
	 i6ODZABrQKN3L4pvdt8Zp2WxI71n3oyDen3u7Z7+sYz5X+KOq7CMTEToRaQUFpg55G
	 yQQLrA/wqKeAmFPL+V7enZqXGlO2/He/AIk3OymOW3EaImZ4HWNz38FFY+/SzkBAwM
	 4VjQ+m0aKa9Eg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 47F5039EF964;
	Wed, 11 Feb 2026 20:28:03 +0000 (UTC)
Subject: Re: [GIT PULL for v7.0] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260211122921.42215991@foz.lan>
References: <20260211122921.42215991@foz.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260211122921.42215991@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.0-2
X-PR-Tracked-Commit-Id: c824345288d11e269ce41b36c105715bc2286050
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b7ef56a07672e0d7ebe71c9d9b45f959f0c2f8e8
Message-Id: <177084168174.710910.7681750903914368133.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 20:28:01 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52622-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 470A1127621
X-Rspamd-Action: no action

The pull request you sent on Wed, 11 Feb 2026 12:29:21 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.0-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b7ef56a07672e0d7ebe71c9d9b45f959f0c2f8e8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

