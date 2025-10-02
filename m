Return-Path: <linux-media+bounces-43674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C823BBB51F8
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 22:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE61C48540A
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 20:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325B628C011;
	Thu,  2 Oct 2025 20:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3YgE3Vj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CAD226D0C;
	Thu,  2 Oct 2025 20:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759436804; cv=none; b=rGi4VXPOR+G7BevfoqEnDDk/LhQt3ZxKBlwTuQXhj+MQ1N0cNYFt2Ox6BguJ/rWyta0kXWfACl/csOr2M3nIf5oEu/N1n9MUqGJHwxePPeK8XO7MDtA79YjxfjLIb4RszPHrV59xJY4BtCzEQxnJe/kF4DUVuphSREs0XY/hdjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759436804; c=relaxed/simple;
	bh=EpZ7AYC9qlv1OiKjDiF1bw6hLS7J2afd1VX7OWQd5zI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=k+5GGXdy0erMdHUtmTLB/v1OObGblqPBrQ3owvV79bf1klyG8WF+nsGJPp+Xy0F/sEWhcA1+xhGeBDrGFrX+6ffq4K4DLt/qaaNz4opgqgFYM0ecedz1E8BgFj8sL+LdVnBIbNUVJ68JMUH/9VvAnUiqZCyAMAAwYNnxwSFVIh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3YgE3Vj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6806BC4CEF4;
	Thu,  2 Oct 2025 20:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759436804;
	bh=EpZ7AYC9qlv1OiKjDiF1bw6hLS7J2afd1VX7OWQd5zI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=C3YgE3VjMgX3LkAfP8wCyqVwtTPkIK+o+OFSDqbHOMIkUTk/vMJJqnoiYUzAu79UK
	 Mp7h+J7XkZfjRBrT3ediZ84f4H76ufWqa4eEY9rgQPFa4f4S+Q0JUhXZ2+DgaCpohc
	 3Ii65sUFFQ+K2ZrdbWYz94wxcdtJKuCEYtnIs12pNpmRnnCoB7CIezh1TsFz3hR+4z
	 7K5tUkkPDRLKzfuBTacMtr+SulegOwqUoh4fOt5bA1x7bcPE2eovlpt86YLiUHrnKp
	 LBTGysONyyMR418fplCBA01aI+D7coSzqcSGrpofW6JP/yVgX53QRQ6+lHagVqMWtj
	 njdUoAFVs9gDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F1D39D0C1A;
	Thu,  2 Oct 2025 20:26:37 +0000 (UTC)
Subject: Re: [GIT PULL for v6.18] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251001172511.2d0514ec@sal.lan>
References: <20251001172511.2d0514ec@sal.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251001172511.2d0514ec@sal.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.18-1
X-PR-Tracked-Commit-Id: afb100a5ea7a13d7e6937dcd3b36b19dc6cc9328
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f79e772258df311c2cb21594ca0996318e720d28
Message-Id: <175943679595.3441443.4870983340058005734.pr-tracker-bot@kernel.org>
Date: Thu, 02 Oct 2025 20:26:35 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 1 Oct 2025 17:25:11 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.18-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f79e772258df311c2cb21594ca0996318e720d28

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

