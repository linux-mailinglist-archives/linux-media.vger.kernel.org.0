Return-Path: <linux-media+bounces-58836-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMRyFXHC32l7YgAAu9opvQ
	(envelope-from <linux-media+bounces-58836-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:53:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7394406832
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 18:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2917B304D940
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5CA83EC2FF;
	Wed, 15 Apr 2026 16:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tucpj/0k"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8333EAC77;
	Wed, 15 Apr 2026 16:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776271845; cv=none; b=rC8+X6BDVO32uGL6/P0Gb4Y+klE/3X4ww2X3ucIBCSuITpR9MybsRmqxZE1QG6RtS6W5GqrPAviv3WaoVgXiP7kbc0Ok7gwYYRLiawnYtFIkFw46Pma6oKz3KYlm+tf/T+Zb5A1SS/B0hRsiuClSkRAhrt7Jim1529fK3eHetmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776271845; c=relaxed/simple;
	bh=DJYDg7nNJkr2vNh/hHxgH+MvXkZYhn0pIM8gANHGxfM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mmlnrJcJM19fy63zeNKNCJFDpZ8ULgZwt9VdH1DCFs6pBR3PND0j0MQaE69VkEz09NaILr2aHCiHAP5JrF6nYaattjpn9Rwu7AbYDf0SvBc7QFt9eNieJL0oA+X39p5BCxQFYI/SBpf/RM6lorrwqDRqagNovM2z8fwHFB7h6U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tucpj/0k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22402C2BCB4;
	Wed, 15 Apr 2026 16:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776271845;
	bh=DJYDg7nNJkr2vNh/hHxgH+MvXkZYhn0pIM8gANHGxfM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tucpj/0kFLQhEjihEE69pdEeHZvMvg5+vsukIHQrzRz1o9CRFExDEgN7erw8pohg7
	 CVd76sZAk6/Qc50CvDJRMLVgDe9yj6VC2fAhgxjDTxX0kEMx2tqmxG7xdPdVVTPnJ5
	 IDV2EdCu354Vh9FP2zw1N9QxZZhDNmCuvI5uM6fbo84TL4ciz8VQ3CvsTuRlDaFoeA
	 CfV3NFdG0Ol+YPk37hn9xkyJjm/XpY6MqSJzq+i9iOjGVeRLQSsBxfVmpyTy+ffcip
	 umadCzPz7MJy4MeOxqjd+eAYAaDwhTFcpCYBHVmi8brZarmvuaF4Iaqiqsbq4iqx56
	 xL8OhPzNbf6uQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D5D2D380A964;
	Wed, 15 Apr 2026 16:50:15 +0000 (UTC)
Subject: Re: [GIT PULL for v7.1] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260413095333.78a940f7@foz.lan>
References: <20260413095333.78a940f7@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260413095333.78a940f7@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.1-1
X-PR-Tracked-Commit-Id: 4fbeef21f5387234111b5d52924e77757626faa5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 00c6649bafef628955569dd39a59e3170e48f7b5
Message-Id: <177627181451.2328436.1429910842345689169.pr-tracker-bot@kernel.org>
Date: Wed, 15 Apr 2026 16:50:14 +0000
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58836-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C7394406832
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Mon, 13 Apr 2026 09:53:33 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.1-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/00c6649bafef628955569dd39a59e3170e48f7b5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

