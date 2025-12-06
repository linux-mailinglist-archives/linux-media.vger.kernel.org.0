Return-Path: <linux-media+bounces-48347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 685B3CAA096
	for <lists+linux-media@lfdr.de>; Sat, 06 Dec 2025 05:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C85D130122D3
	for <lists+linux-media@lfdr.de>; Sat,  6 Dec 2025 04:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349E525F797;
	Sat,  6 Dec 2025 04:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DEPGBXgV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9000E2236E3;
	Sat,  6 Dec 2025 04:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764994963; cv=none; b=ISkAmOjzt7fcOPg9LRcpDdKkMrOXiXhAfAekpjonf3uaDFZdVfkb2XqBJok+651WzKs46yKQPEsA2gd9aXo5QCgh3xp4OAjMMB0RyVQVQNIxQZLDwCmZB3r/qicjagGu35KxeQ2zV0xAl3ZWckZfFvDAJ5zR5v4dZWemUJZyjm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764994963; c=relaxed/simple;
	bh=3U4stOWZkr10/5b2AT17Os/FJ7RCyZqkvRGPXoUZepc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ArAvKi5s/x+CuSF/MJ6nwktjaZYE1dhTiBpqScre9V4AIROyBA4HfMh4XZkEbDdefLrQRsOA6yxxb51ZE9BQzFjf7/N17Ff7de8Mx9RV7nYPvm13EBXllRznOjKlawleyg5M8OquXMP518yXdYGIUZM/0njneMLqxTVXJE+WAU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DEPGBXgV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CBEC113D0;
	Sat,  6 Dec 2025 04:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764994963;
	bh=3U4stOWZkr10/5b2AT17Os/FJ7RCyZqkvRGPXoUZepc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=DEPGBXgVleypO7IoT0enqgGyFQ1/6+um31gkobqSu0Ows+G5oMdqBD8me0HTdNEL3
	 WqHMKY0aFkQoYnw9+2tKwsVVMRGfIaVWel1C2r0LOopjsNRmnKFZwJFzOzRQfTCde6
	 MQVxjlrAMQJ3o4hn+aLwuAfGB4Ou6clOr2PZPw259+gdpFL5aqgIBTe21y/NFBJAnX
	 Wb3UZABKjYAq7z+vOrXLGF4hG4w/dfsJrUcYa+3V5cVRbEvFmvhruXJpJ3yk+2GZ0w
	 FrVUskd8A8CJ/bHXDjm61ZkjyzdNuerv7aYYPxTTqJ/CnbwDhCxzA81PCRNGAJAbBJ
	 U11ge8Fo2gZ9g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F33B93808200;
	Sat,  6 Dec 2025 04:19:41 +0000 (UTC)
Subject: Re: [GIT PULL for v6.19] media kernel-doc fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251205090549.33ed4a9b@foz.lan>
References: <20251205090549.33ed4a9b@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251205090549.33ed4a9b@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.19-2
X-PR-Tracked-Commit-Id: f7231cff1f3ff8259bef02dc4999bc132abf29cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f19b84186d297063a1006ca9e1c8597f77a75581
Message-Id: <176499478051.1976223.18225604849120468328.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 04:19:40 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 5 Dec 2025 09:05:49 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.19-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f19b84186d297063a1006ca9e1c8597f77a75581

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

