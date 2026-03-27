Return-Path: <linux-media+bounces-57363-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGufK/TsxmkIQQUAu9opvQ
	(envelope-from <linux-media+bounces-57363-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:47:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3127334B444
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 21:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8546F30A5612
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 20:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C7E392C42;
	Fri, 27 Mar 2026 20:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEiEOGV6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF83391E58;
	Fri, 27 Mar 2026 20:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774643999; cv=none; b=t5PDhlD7Id3IVbZaAWJnz+eGuKGedofYE1AKbPc2ZmxY3ym1JuRpmNU2ANnll5mXv5qGvCNVjrRry65I0eV9/cuFsX+tR8xmQ7/E8sSLLwQpw3UmDHCh/0StTHmpSodU5SyEZi8ZpC9Oj4mhiqn7du0Uc5gPAdTV9FlZ1lL8kIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774643999; c=relaxed/simple;
	bh=QmfGQfD6hbWSNm7v4/YMMirqEjsbh2IUvsW/F5s101w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=DUWkpiYg7H3BMhzuh+GcIMySwGE8QHGbtCfgTeFhl1Ed5oOu3fwpToxqdt8L/qI1MZMA4hVtEOwEwtjxcjJt282NbU6tau6qW2LB7yNfIqdijpdeXgFqh9PYUP/pk77XT58o/obM5J6r74bNaUqCgZkh34FphLsI6iC6OOwYm9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEiEOGV6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6CBC2BC86;
	Fri, 27 Mar 2026 20:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774643999;
	bh=QmfGQfD6hbWSNm7v4/YMMirqEjsbh2IUvsW/F5s101w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TEiEOGV6PI6i5STTrZfx2k+9hbxEuraiZLxbKicziqFitTfjC0IYfJ5lV+jPlyOJN
	 IQclNN46arWNAJrc4SmIdZ/a2Nj0qZxBdZnCrAJ7I8NZxCVBKQKNj9XdkIPg2JWXw/
	 rIFVI/WNE+OI7SVllZ336nP2Zo7XEnahICgR1Qr5CU7H9h/CR2TxGihcgVIVzOb6nu
	 C2TLoG93lR9UA6bWXTKuuwaeqHVTY+VFSeV8FHOG4Be5IY20Ji+Z2F4NbHV8OCkK5I
	 XsCok1pLjfLf48N5Vr8GiumFzq4gOb/qoYd5B6aOKZc0vUqNGKU92HGKadEmNpqmAY
	 SwCP/pqGGE/lw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF1E3806928;
	Fri, 27 Mar 2026 20:39:46 +0000 (UTC)
Subject: Re: [GIT PULL for v7.0-rc6] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260327095442.4ccd1b21@foz.lan>
References: <20260327095442.4ccd1b21@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260327095442.4ccd1b21@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.0-6
X-PR-Tracked-Commit-Id: 7587fbf5adc23d180a5ea9aa6944292c22328703
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f44c65111e9da0fa378ddf832c90e93855628dc9
Message-Id: <177464398512.3654421.4336163304689405546.pr-tracker-bot@kernel.org>
Date: Fri, 27 Mar 2026 20:39:45 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57363-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3127334B444
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Fri, 27 Mar 2026 09:54:42 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.0-6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f44c65111e9da0fa378ddf832c90e93855628dc9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

