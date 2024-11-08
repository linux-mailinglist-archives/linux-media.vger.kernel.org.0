Return-Path: <linux-media+bounces-21188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C18489C2469
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 18:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A8F91F27D69
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 17:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C2222460E;
	Fri,  8 Nov 2024 17:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzwuIfKf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75052245F7;
	Fri,  8 Nov 2024 17:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731088133; cv=none; b=VDVcX1LgOHCPpIADbGLgypGmyt4qT5uBLdPO7KrJivervjCKMQnkuvWGbf8PO+MKGo/w1yHKXP6zRD/zr8w2fIm9C10hsHgW0OemByTvidJh2/5M2xOctG3AQqAzcvFs0xtsZ5oZPiYj+q9arvfKKe+/DXg067hQvH1TERm9em4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731088133; c=relaxed/simple;
	bh=KisVO43Ogk3AHudmvvTcWsUZxWwIQmtaiY3j/kECeg4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=gYozs3xXKF14klQNxFQYPYrNTo2OdPZh4l766ejAGHv2+Go3zTbAimE2trcOJDJ3LwJ7TfU1QWH/aPEUlo5t0rhZgxNQhHYES++OYLeMRlqtispGF69d4TeeollX/IvVW9fc1i4wTFzrGVTxhBGZGuFLqwMTUp5YCy6CVISykn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzwuIfKf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61C7C4CEDC;
	Fri,  8 Nov 2024 17:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731088132;
	bh=KisVO43Ogk3AHudmvvTcWsUZxWwIQmtaiY3j/kECeg4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JzwuIfKfUkLaVWm+SEBRzYbtoW9B5eZdVABf+VVZ8E1ciCJWjNJq2GLm/KAwUJliZ
	 vSGIuaCSALZb/V+NX2PYFAV+dkKWpCCH+qN2nCw0lID0xJB6tbx3adp4ISnyNIs3zm
	 axgdlMik/GOTC2OFuYHC8LN3zKGfL7UYZndbCU7/eeRlZdkzmS/hZ2qJpD3IwZNh/e
	 D92L9P5sWTIAgYP1b7p7E2yfXxifslMtud0k8iMFAwTsvZsC5umRZbZUoZanLQPaA1
	 7UvqugkhOzEuWZHzK2gN3BxziMDgmG+9Zm9/5+SJik16RbeNJ+UwuQ59t9myYT1Ilp
	 8l/JJDXPXYxvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7104E3809A80;
	Fri,  8 Nov 2024 17:49:03 +0000 (UTC)
Subject: Re: [GIT PULL for v6.12-rc7] media fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241108135433.40c7a4fa@foz.lan>
References: <20241108135433.40c7a4fa@foz.lan>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241108135433.40c7a4fa@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.12-2
X-PR-Tracked-Commit-Id: 702a47ce6dde72f6e247b3c3c00a0fc521f9b1c6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ceb061330df9911cc2e1b809ae62d47799d2e7e2
Message-Id: <173108814202.2713429.13627553127800735261.pr-tracker-bot@kernel.org>
Date: Fri, 08 Nov 2024 17:49:02 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 8 Nov 2024 13:54:33 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v6.12-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ceb061330df9911cc2e1b809ae62d47799d2e7e2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

