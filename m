Return-Path: <linux-media+bounces-60471-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFotMmo2+mlLKwMAu9opvQ
	(envelope-from <linux-media+bounces-60471-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 20:26:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C3D4D2A13
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 20:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5BCF300B878
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 18:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9B92D5A19;
	Tue,  5 May 2026 18:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUDSvEN8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B23A4A340F;
	Tue,  5 May 2026 18:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005606; cv=none; b=XaQPRU/44R3ZOtMupVtf8xO8K8kK5YC3N0ENY1/EVrgnu9i4AIlb++WX1lCZp714Uac/Y6hr2Zi2wVrpa8981srCopKiOZMgOPpzs2o5PnMYu4EQlAqd1BKum8sxSsCkrusNhk8lskObYHdztCakvYIQOMQho3xQyqzbOOMUyQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005606; c=relaxed/simple;
	bh=n4xdm3hZWOVJUr0wEoAMQVT9d8uBoB2TbdyZ2Fuc91k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SJzaOkM5jmdLxEaU8BY1KQS+/W2VsfvS0/VO7u2TL31E9mL2oWJ+pTreMv+0FfO/91eSe97fy+lggVgnNYmSHkOKuT1tfYzqaYUVOSMZXyV0lRFBQQkj9sWL8EqUVQeSRJPsM1EH8ezU6RFVlyFPm/PJYh98KPsx8SV0XsAmRKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUDSvEN8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F4EBC2BCB4;
	Tue,  5 May 2026 18:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778005606;
	bh=n4xdm3hZWOVJUr0wEoAMQVT9d8uBoB2TbdyZ2Fuc91k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UUDSvEN8VV7FV6H/sq5oqCmr1OkmcEu0OJD5MOJeflogcb/3AJDmS8VYlUPG/iFL6
	 +1QdyCPsOxh4Q1z1ztisIxyR1RtN7rwMnZH+K85NapK+TkXL3/2fYm/hlWmdJWqSh2
	 C5P8M6RzcR7w+ujWKaBqIbnzgFCT6GsVCnkLahFMtVRczCiVU6WVeuXRMXFNkkP18B
	 /I3LwLaR7viR8mf018mFnp/ldJF9sDk3ztQPploIGnGEpCvNEtYvdBeQhAo7cQq222
	 n0l+atoPZP/pgm8Yw3xpe/A4pM+c/vWnPz/jK23g3BtPKAserezJuMfYgdT9qz/UfL
	 G1fBDd+cHkAeg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0883930198;
	Tue,  5 May 2026 18:25:57 +0000 (UTC)
Subject: Re: [GIT PULL for v7.1-rc3] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260505132501.1cbb9d20@foz.lan>
References: <20260505132501.1cbb9d20@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260505132501.1cbb9d20@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.1-2
X-PR-Tracked-Commit-Id: 23c39cb598977f10909a2387c5e5f34afc1d6933
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4e386547138864d4ded1c39ff75517b89e187964
Message-Id: <177800555637.2215775.14999880540732990537.pr-tracker-bot@kernel.org>
Date: Tue, 05 May 2026 18:25:56 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: 76C3D4D2A13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60471-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,huawei,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

The pull request you sent on Tue, 5 May 2026 13:25:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4e386547138864d4ded1c39ff75517b89e187964

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

