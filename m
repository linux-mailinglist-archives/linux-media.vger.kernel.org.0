Return-Path: <linux-media+bounces-28757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFABFA70FE0
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 05:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE2C4179DD8
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 04:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99B518C002;
	Wed, 26 Mar 2025 04:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQ8W8Crd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C49149E00;
	Wed, 26 Mar 2025 04:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742962555; cv=none; b=Qjp3xx0SI4FAOjwHDW+IkXkkY8m1+OW3WQOZChaAUBiJlqvGYgroX8gfYYOsBwSI1yY1NRfIPLALlvSWi7e35ujrBFOZs46GcTNVzP+m9nkkUS6aSepyTku8Xn/0HSccTlnmogZcMrBPhFsdaxtLAf02TRqK7Ek1EH7v5qpJ0/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742962555; c=relaxed/simple;
	bh=Xkmq1f2mJw0JBexDnfltm7GO5NmxsSIEMfxi109scPs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SH2QPRpAnnqUDIU7XUMnsbCF/vlHjUJ1HV66mEZzHz7Y12JPmgYlR3MssJgPeUGcDsh79ERsnkAnR4yWdIBMAyneTEPHyFb5jo4xmUb7FFBrEHhSWz8kDLE6o7tgR5irYkCFzgCk2NO3BOoQislMoOsPgG4v+WnkkUIqzmeMjCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQ8W8Crd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E623AC4CEE2;
	Wed, 26 Mar 2025 04:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742962554;
	bh=Xkmq1f2mJw0JBexDnfltm7GO5NmxsSIEMfxi109scPs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fQ8W8CrdVoeFXpCB7/rOvMynKsz4Xi3CKXPtQ0R3Rm6iXtIH3J/Ih8sWfMo19wkQq
	 obQ897D1o65xOihhm260vazKHlZeaCu6YE1f81iadf/wOrfKdpmhZMh+pycJWFFDiJ
	 BHRpwQ5U7iCThE6SnD0uFhKOFzCcU2v7e9tED7SnOmWROywHiDGce3EZQeCOyKu4zp
	 /gcXrEJxYJVL5Am6e57+uT/rmeU++xdto9ijqYYnLnFFlRoC/1ocG8TLJJuOqDhtRN
	 83RG+JTZc2DN427kwX0JCTiLq8gyTVBX7eCVRGwfe1L4GP94PZ+9NYCQOXFPkgaiiU
	 Aqnau3cksqKfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 711CF380DBFD;
	Wed, 26 Mar 2025 04:16:32 +0000 (UTC)
Subject: Re: [GIT PULL for v6.15] media updates
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250319192338.043dde45@foz.lan>
References: <20250319192338.043dde45@foz.lan>
X-PR-Tracked-List-Id: <linux-media.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250319192338.043dde45@foz.lan>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.15-1
X-PR-Tracked-Commit-Id: f2151613e040973c868d28c8b00885dfab69eb75
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
Message-Id: <174296259088.845243.18341350387989282661.pr-tracker-bot@kernel.org>
Date: Wed, 26 Mar 2025 04:16:30 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 19 Mar 2025 19:23:38 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v6.15-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1e26c5e28ca5821a824e90dd359556f5e9e7b89f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

